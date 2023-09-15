Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BCB17A1DAF
	for <lists+linux-media@lfdr.de>; Fri, 15 Sep 2023 13:50:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234393AbjIOLuU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Sep 2023 07:50:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232836AbjIOLuT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Sep 2023 07:50:19 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D390F1AC;
        Fri, 15 Sep 2023 04:50:13 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A185C433C7;
        Fri, 15 Sep 2023 11:50:12 +0000 (UTC)
Message-ID: <c38400f8-6193-46b6-9e26-0094af6627ca@xs4all.nl>
Date:   Fri, 15 Sep 2023 13:50:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v9 1/2] Added Digiteq Automotive MGB4 driver
Content-Language: en-US, nl
To:     tumic@gpxsee.org, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?Q?Martin_T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
References: <20230912120745.902-1-tumic@gpxsee.org>
 <20230912120745.902-2-tumic@gpxsee.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230912120745.902-2-tumic@gpxsee.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martin,

On 12/09/2023 14:07, tumic@gpxsee.org wrote:
> From: Martin Tůma <martin.tuma@digiteqautomotive.com>
> 
> Digiteq Automotive MGB4 is a modular frame grabber PCIe card for automotive
> video interfaces. As for now, two modules - FPD-Link and GMSL - are
> available and supported by the driver. The card has two inputs and two
> outputs (FPD-Link only).
> 
> In addition to the video interfaces it also provides a trigger signal
> interface and a MTD interface for FPGA firmware upload.
> 
> Signed-off-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
> ---

<snip>

> +static ssize_t video_source_show(struct device *dev,
> +				 struct device_attribute *attr, char *buf)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vout_dev *voutdev = video_get_drvdata(vdev);
> +	u32 config = mgb4_read_reg(&voutdev->mgbdev->video,
> +	  voutdev->config->regs.config);
> +
> +	return sprintf(buf, "%u\n", (config & 0xc) >> 2);
> +}
> +
> +static ssize_t video_source_store(struct device *dev,
> +				  struct device_attribute *attr,
> +				  const char *buf, size_t count)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vout_dev *voutdev = video_get_drvdata(vdev);
> +	struct mgb4_dev *mgbdev = voutdev->mgbdev;
> +	struct mgb4_vin_dev *loopin_new = 0, *loopin_old = 0;
> +	unsigned long val;
> +	unsigned long flags_in[MGB4_VIN_DEVICES], flags_out[MGB4_VOUT_DEVICES];
> +	ssize_t ret;
> +	u32 config;
> +	int i;
> +
> +	memset(flags_in, 0, sizeof(flags_in));
> +	memset(flags_out, 0, sizeof(flags_out));
> +
> +	ret = kstrtoul(buf, 10, &val);
> +	if (ret)
> +		return ret;
> +	if (val > 3)
> +		return -EINVAL;
> +
> +	for (i = 0; i < MGB4_VIN_DEVICES; i++)
> +		if (mgbdev->vin[i])
> +			spin_lock_irqsave(&mgbdev->vin[i]->vdev.fh_lock,
> +					  flags_in[i]);
> +	for (i = 0; i < MGB4_VOUT_DEVICES; i++)
> +		if (mgbdev->vout[i])
> +			spin_lock_irqsave(&mgbdev->vout[i]->vdev.fh_lock,
> +					  flags_out[i]);

I missed this in my review: never use fh_lock, that's for internal use only.

Instead, use the vdev->lock mutex.

> +
> +	ret = -EBUSY;
> +	for (i = 0; i < MGB4_VIN_DEVICES; i++)
> +		if (mgbdev->vin[i] && !list_empty(&mgbdev->vin[i]->vdev.fh_list))
> +			goto error;

This is also wrong, the key moment at which such changes are no longer allowed
is when you allocate buffers for the first time. Use vb2_is_busy() to detect that.

From what I can see in the code most store functions operate on a single video device,
so for those using mutex_lock_interruptible(vdev->lock) and vb2_is_busy() will do the
trick.

For this store function that needs to check all devices it is more complicated.

I think the best approach would be to create a top-level field 'reconfig_in_progress'
(or something along those lines), protected by a spinlock.

At the start this function will take the lock, check if reconfig is already in progress
and just return EBUSY here. Otherwise it sets reconfig_in_progress to true and unlocks
the lock.

After that for each video device you take the vdev->lock, check if vb2_is_busy() and
unlock vdev->lock. If any is busy, then set reconfig_in_progress back to false and
return EBUSY here.

To prevent another process from creating buffers, you have to check in the queue_setup
functions if a reconfig is in progress and return EBUSY there.

This scheme avoids having to lock ALL video devices (bad practice), and it should
also avoid this smatch warning.

Note: instead of using a spinlock I think you can also use test_and_set_bit: that's
atomic and you can avoid adding a spinlock.

Regards,

	Hans

> +	for (i = 0; i < MGB4_VOUT_DEVICES; i++)
> +		if (mgbdev->vout[i] && !list_empty(&mgbdev->vout[i]->vdev.fh_list))
> +			goto error;
> +
> +	config = mgb4_read_reg(&mgbdev->video, voutdev->config->regs.config);
> +
> +	if (((config & 0xc) >> 2) < MGB4_VIN_DEVICES)
> +		loopin_old = mgbdev->vin[(config & 0xc) >> 2];
> +	if (val < MGB4_VIN_DEVICES)
> +		loopin_new = mgbdev->vin[val];
> +	if (loopin_old && loopin_cnt(loopin_old) == 1)
> +		mgb4_mask_reg(&mgbdev->video, loopin_old->config->regs.config,
> +			      0x2, 0x0);
> +	if (loopin_new)
> +		mgb4_mask_reg(&mgbdev->video, loopin_new->config->regs.config,
> +			      0x2, 0x2);
> +
> +	if (val == voutdev->config->id + MGB4_VIN_DEVICES)
> +		mgb4_write_reg(&mgbdev->video, voutdev->config->regs.config,
> +			       config & ~(1 << 1));
> +	else
> +		mgb4_write_reg(&mgbdev->video, voutdev->config->regs.config,
> +			       config | (1U << 1));
> +
> +	mgb4_mask_reg(&mgbdev->video, voutdev->config->regs.config, 0xc,
> +		      val << 2);
> +
> +	ret = count;
> +
> +error:
> +	for (i = MGB4_VOUT_DEVICES - 1; i >= 0; i--)
> +		if (mgbdev->vout[i])
> +			spin_unlock_irqrestore(&mgbdev->vout[i]->vdev.fh_lock,
> +					       flags_out[i]);
> +	for (i = MGB4_VIN_DEVICES - 1; i >= 0; i--)
> +		if (mgbdev->vin[i])
> +			spin_unlock_irqrestore(&mgbdev->vin[i]->vdev.fh_lock,
> +					       flags_in[i]);
> +
> +	return ret;
> +}

