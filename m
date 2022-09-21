Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 056F15BF9EA
	for <lists+linux-media@lfdr.de>; Wed, 21 Sep 2022 10:57:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229766AbiIUI5c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Sep 2022 04:57:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbiIUI53 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Sep 2022 04:57:29 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E0707B1C1
        for <linux-media@vger.kernel.org>; Wed, 21 Sep 2022 01:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663750647;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=W/EPWzCrjkpxltsavpvOn6tDwN/ASbjnTuaJQS0VD/I=;
        b=WwZDDX4vzC9uRnoKE5am+Fg6fs8Gd8fSqlhScbUX5tHwT/gviS4jFmUz2ltQ8cIljWgahi
        qyw+VzJoNLtvffFolj5hKN5Ly4rUEdpleqxERgemoMjuy5dvP2YJf/HowD3Z3dZtRoBSGK
        9fz5ykRqvrXRp3OJ2gzbqPRa8srMYxg=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-623-GQ_F7ezCOhCxiR7e5kYQrg-1; Wed, 21 Sep 2022 04:57:26 -0400
X-MC-Unique: GQ_F7ezCOhCxiR7e5kYQrg-1
Received: by mail-ej1-f72.google.com with SMTP id gv43-20020a1709072beb00b0077c3f58a03eso2752721ejc.4
        for <linux-media@vger.kernel.org>; Wed, 21 Sep 2022 01:57:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=W/EPWzCrjkpxltsavpvOn6tDwN/ASbjnTuaJQS0VD/I=;
        b=xIqffQEEWw+Vjn4hf12MVdsxC7+Afb+SuCU4lado0iOcUki4ANFwOBTnndXnBKiaRp
         UImxUXacfGfIZ5uZdmVgq6Q/+O+dIVRdhLZpkY0AnZo3C26MqrVqIoJVGE0lBvphOWe2
         MotDm1MyEZ324bcIhioBJKqr85NpoC9oEzR1lTRhgsuar4PMbtUnn2a0VlJ0GGjC1SIO
         uRtE0AiZ2E1+2phvXpgD9kxgmym+NYrcHNB+gf1/iB3bZH2rhE4mF/5kC1zOGWEKj3s4
         MLtbcQogH1AiRKfVR2TBjIZNyAuruCIK0Liwvrsmd6QBq2lz5sPKuiGkIih01sXtb6w2
         sz1g==
X-Gm-Message-State: ACrzQf0xDg3rszHDTvSxvDMM0tGURjDn5huvchGU8pgyrZuZyFfoSy3h
        aP8pYmKNJO3Hk7Ft9uURiVu+LdpSLWXEGGaBuY8t/evhjq9DnoG5s5x5mnllrAca4L5DCyfq5TJ
        E2KsKBMSsWLN7SyRJCVcHbtU=
X-Received: by 2002:a05:6402:1446:b0:44e:ec98:3e11 with SMTP id d6-20020a056402144600b0044eec983e11mr24215499edx.90.1663750644850;
        Wed, 21 Sep 2022 01:57:24 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7tOlHkJjFvqvDDsmU6iMVF4Fcsn3esXFWeRNGNgIThmGmlTfnzfl1XdQ5MJ0JqZ5yi8nwRqg==
X-Received: by 2002:a05:6402:1446:b0:44e:ec98:3e11 with SMTP id d6-20020a056402144600b0044eec983e11mr24215479edx.90.1663750644641;
        Wed, 21 Sep 2022 01:57:24 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id kx21-20020a170907775500b0073d5948855asm1028457ejc.1.2022.09.21.01.57.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 01:57:24 -0700 (PDT)
Message-ID: <c2d13a2a-1632-405d-5c2d-a2a3c6a854b9@redhat.com>
Date:   Wed, 21 Sep 2022 10:57:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 03/17] media: atomisp: Fix locking around asd->streaming
 read/write
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20220911171653.568932-1-hdegoede@redhat.com>
 <20220911171653.568932-4-hdegoede@redhat.com>
 <Yx8XcG0c/aU/ENwz@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Yx8XcG0c/aU/ENwz@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 9/12/22 13:26, Andy Shevchenko wrote:
> On Sun, Sep 11, 2022 at 07:16:39PM +0200, Hans de Goede wrote:
>> For reading / writing the asd->streaming enum the following rules
>> should be followed:
>>
>> 1. Writers of streaming must hold both isp->mutex and isp->lock.
>> 2. Readers of streaming need to hold only one of the two locks.
>>
>> Not all writers where properly taking both locks this fixes this.
>>
>> In the case of the readers, many readers depend on their caller
>> to hold isp->mutex, add asserts for this
>>
>> And in the case of atomisp_css_get_dis_stat() it is called with
>> isp->mutex held, so there is no need to take the spinlock just
>> for reading the streaming value.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks.

> Although description of the 'streaming' doesn't clarify which one should be
> used on which circumstances. I assume it's only for sleeping / non-sleeping
> context?

Correct.

> If there is an IRQ relation, shouldn't we always use spinlock for
> readers?

As the comment says writers always should take both locks. IOW there
are no writers in non-sleeping contexts.

Regards,

Hans



> 
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  .../staging/media/atomisp/pci/atomisp_cmd.c   | 32 +++++++++++++++++--
>>  .../media/atomisp/pci/atomisp_compat_css20.c  | 10 +++---
>>  .../staging/media/atomisp/pci/atomisp_fops.c  |  3 ++
>>  .../media/atomisp/pci/atomisp_internal.h      |  2 +-
>>  .../staging/media/atomisp/pci/atomisp_ioctl.c |  4 +++
>>  .../media/atomisp/pci/atomisp_subdev.c        |  8 ++++-
>>  .../media/atomisp/pci/atomisp_subdev.h        |  6 +++-
>>  7 files changed, 55 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
>> index 97ef02e4e7a6..c7f825e38921 100644
>> --- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
>> +++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
>> @@ -899,6 +899,8 @@ void atomisp_buf_done(struct atomisp_sub_device *asd, int error,
>>  	struct v4l2_control ctrl;
>>  	bool reset_wdt_timer = false;
>>  
>> +	lockdep_assert_held(&isp->mutex);
>> +
>>  	if (
>>  	    buf_type != IA_CSS_BUFFER_TYPE_METADATA &&
>>  	    buf_type != IA_CSS_BUFFER_TYPE_3A_STATISTICS &&
>> @@ -1298,6 +1300,9 @@ static void __atomisp_css_recover(struct atomisp_device *isp, bool isp_timeout)
>>  	bool stream_restart[MAX_STREAM_NUM] = {0};
>>  	bool depth_mode = false;
>>  	int i, ret, depth_cnt = 0;
>> +	unsigned long flags;
>> +
>> +	lockdep_assert_held(&isp->mutex);
>>  
>>  	atomisp_css_irq_enable(isp, IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF, false);
>>  
>> @@ -1320,7 +1325,9 @@ static void __atomisp_css_recover(struct atomisp_device *isp, bool isp_timeout)
>>  
>>  		stream_restart[asd->index] = true;
>>  
>> +		spin_lock_irqsave(&isp->lock, flags);
>>  		asd->streaming = ATOMISP_DEVICE_STREAMING_STOPPING;
>> +		spin_unlock_irqrestore(&isp->lock, flags);
>>  
>>  		/* stream off sensor */
>>  		ret = v4l2_subdev_call(
>> @@ -1335,7 +1342,9 @@ static void __atomisp_css_recover(struct atomisp_device *isp, bool isp_timeout)
>>  		css_pipe_id = atomisp_get_css_pipe_id(asd);
>>  		atomisp_css_stop(asd, css_pipe_id, true);
>>  
>> +		spin_lock_irqsave(&isp->lock, flags);
>>  		asd->streaming = ATOMISP_DEVICE_STREAMING_DISABLED;
>> +		spin_unlock_irqrestore(&isp->lock, flags);
>>  
>>  		asd->preview_exp_id = 1;
>>  		asd->postview_exp_id = 1;
>> @@ -1376,11 +1385,14 @@ static void __atomisp_css_recover(struct atomisp_device *isp, bool isp_timeout)
>>  						   IA_CSS_INPUT_MODE_BUFFERED_SENSOR);
>>  
>>  		css_pipe_id = atomisp_get_css_pipe_id(asd);
>> -		if (atomisp_css_start(asd, css_pipe_id, true))
>> +		if (atomisp_css_start(asd, css_pipe_id, true)) {
>>  			dev_warn(isp->dev,
>>  				 "start SP failed, so do not set streaming to be enable!\n");
>> -		else
>> +		} else {
>> +			spin_lock_irqsave(&isp->lock, flags);
>>  			asd->streaming = ATOMISP_DEVICE_STREAMING_ENABLED;
>> +			spin_unlock_irqrestore(&isp->lock, flags);
>> +		}
>>  
>>  		atomisp_csi2_configure(asd);
>>  	}
>> @@ -1608,6 +1620,8 @@ void atomisp_css_flush(struct atomisp_device *isp)
>>  {
>>  	int i;
>>  
>> +	lockdep_assert_held(&isp->mutex);
>> +
>>  	if (!atomisp_streaming_count(isp))
>>  		return;
>>  
>> @@ -4046,6 +4060,8 @@ void atomisp_handle_parameter_and_buffer(struct atomisp_video_pipe *pipe)
>>  	unsigned long irqflags;
>>  	bool need_to_enqueue_buffer = false;
>>  
>> +	lockdep_assert_held(&asd->isp->mutex);
>> +
>>  	if (!asd) {
>>  		dev_err(pipe->isp->dev, "%s(): asd is NULL, device is %s\n",
>>  			__func__, pipe->vdev.name);
>> @@ -4139,6 +4155,8 @@ int atomisp_set_parameters(struct video_device *vdev,
>>  	struct atomisp_css_params *css_param = &asd->params.css_param;
>>  	int ret;
>>  
>> +	lockdep_assert_held(&asd->isp->mutex);
>> +
>>  	if (!asd) {
>>  		dev_err(pipe->isp->dev, "%s(): asd is NULL, device is %s\n",
>>  			__func__, vdev->name);
>> @@ -5537,6 +5555,8 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
>>  	struct v4l2_subdev_fh fh;
>>  	int ret;
>>  
>> +	lockdep_assert_held(&isp->mutex);
>> +
>>  	if (!asd) {
>>  		dev_err(isp->dev, "%s(): asd is NULL, device is %s\n",
>>  			__func__, vdev->name);
>> @@ -6159,6 +6179,8 @@ int atomisp_offline_capture_configure(struct atomisp_sub_device *asd,
>>  {
>>  	struct v4l2_ctrl *c;
>>  
>> +	lockdep_assert_held(&asd->isp->mutex);
>> +
>>  	/*
>>  	* In case of M10MO ZSL capture case, we need to issue a separate
>>  	* capture request to M10MO which will output captured jpeg image
>> @@ -6433,6 +6455,8 @@ int atomisp_exp_id_capture(struct atomisp_sub_device *asd, int *exp_id)
>>  	int value = *exp_id;
>>  	int ret;
>>  
>> +	lockdep_assert_held(&isp->mutex);
>> +
>>  	ret = __is_raw_buffer_locked(asd, value);
>>  	if (ret) {
>>  		dev_err(isp->dev, "%s exp_id %d invalid %d.\n", __func__, value, ret);
>> @@ -6454,6 +6478,8 @@ int atomisp_exp_id_unlock(struct atomisp_sub_device *asd, int *exp_id)
>>  	int value = *exp_id;
>>  	int ret;
>>  
>> +	lockdep_assert_held(&isp->mutex);
>> +
>>  	ret = __clear_raw_buffer_bitmap(asd, value);
>>  	if (ret) {
>>  		dev_err(isp->dev, "%s exp_id %d invalid %d.\n", __func__, value, ret);
>> @@ -6489,6 +6515,8 @@ int atomisp_inject_a_fake_event(struct atomisp_sub_device *asd, int *event)
>>  	if (!event || asd->streaming != ATOMISP_DEVICE_STREAMING_ENABLED)
>>  		return -EINVAL;
>>  
>> +	lockdep_assert_held(&asd->isp->mutex);
>> +
>>  	dev_dbg(asd->isp->dev, "%s: trying to inject a fake event 0x%x\n",
>>  		__func__, *event);
>>  
>> diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
>> index cda0b5eba16d..15ef31b0c601 100644
>> --- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
>> +++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
>> @@ -3626,6 +3626,8 @@ int atomisp_css_get_dis_stat(struct atomisp_sub_device *asd,
>>  	struct atomisp_dis_buf *dis_buf;
>>  	unsigned long flags;
>>  
>> +	lockdep_assert_held(&isp->mutex);
>> +
>>  	if (!asd->params.dvs_stat->hor_prod.odd_real ||
>>  	    !asd->params.dvs_stat->hor_prod.odd_imag ||
>>  	    !asd->params.dvs_stat->hor_prod.even_real ||
>> @@ -3637,12 +3639,8 @@ int atomisp_css_get_dis_stat(struct atomisp_sub_device *asd,
>>  		return -EINVAL;
>>  
>>  	/* isp needs to be streaming to get DIS statistics */
>> -	spin_lock_irqsave(&isp->lock, flags);
>> -	if (asd->streaming != ATOMISP_DEVICE_STREAMING_ENABLED) {
>> -		spin_unlock_irqrestore(&isp->lock, flags);
>> +	if (asd->streaming != ATOMISP_DEVICE_STREAMING_ENABLED)
>>  		return -EINVAL;
>> -	}
>> -	spin_unlock_irqrestore(&isp->lock, flags);
>>  
>>  	if (atomisp_compare_dvs_grid(asd, &stats->dvs2_stat.grid_info) != 0)
>>  		/* If the grid info in the argument differs from the current
>> @@ -3801,6 +3799,8 @@ int atomisp_css_isr_thread(struct atomisp_device *isp,
>>  	bool reset_wdt_timer[MAX_STREAM_NUM] = {false};
>>  	int i;
>>  
>> +	lockdep_assert_held(&isp->mutex);
>> +
>>  	while (!ia_css_dequeue_psys_event(&current_event.event)) {
>>  		if (current_event.event.type ==
>>  		    IA_CSS_EVENT_TYPE_FW_ASSERT) {
>> diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
>> index 57587d739c4b..e1b213ba4686 100644
>> --- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
>> +++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
>> @@ -813,6 +813,7 @@ static int atomisp_release(struct file *file)
>>  	struct v4l2_requestbuffers req;
>>  	struct v4l2_subdev_fh fh;
>>  	struct v4l2_rect clear_compose = {0};
>> +	unsigned long flags;
>>  	int ret = 0;
>>  
>>  	v4l2_fh_init(&fh.vfh, vdev);
>> @@ -878,7 +879,9 @@ static int atomisp_release(struct file *file)
>>  
>>  	/* clear the asd field to show this camera is not used */
>>  	isp->inputs[asd->input_curr].asd = NULL;
>> +	spin_lock_irqsave(&isp->lock, flags);
>>  	asd->streaming = ATOMISP_DEVICE_STREAMING_DISABLED;
>> +	spin_unlock_irqrestore(&isp->lock, flags);
>>  
>>  	if (atomisp_dev_users(isp))
>>  		goto done;
>> diff --git a/drivers/staging/media/atomisp/pci/atomisp_internal.h b/drivers/staging/media/atomisp/pci/atomisp_internal.h
>> index 759575cbd356..b2c362ef7199 100644
>> --- a/drivers/staging/media/atomisp/pci/atomisp_internal.h
>> +++ b/drivers/staging/media/atomisp/pci/atomisp_internal.h
>> @@ -266,7 +266,7 @@ struct atomisp_device {
>>  
>>  	atomic_t wdt_work_queued;
>>  
>> -	spinlock_t lock; /* Just for streaming below */
>> +	spinlock_t lock; /* Protects asd[i].streaming */
>>  
>>  	bool need_gfx_throttle;
>>  
>> diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
>> index 4016ac4fffe0..21af5feca386 100644
>> --- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
>> +++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
>> @@ -1837,7 +1837,9 @@ static int atomisp_streamon(struct file *file, void *fh,
>>  	if (ret)
>>  		goto out;
>>  
>> +	spin_lock_irqsave(&isp->lock, irqflags);
>>  	asd->streaming = ATOMISP_DEVICE_STREAMING_ENABLED;
>> +	spin_unlock_irqrestore(&isp->lock, irqflags);
>>  	atomic_set(&asd->sof_count, -1);
>>  	atomic_set(&asd->sequence, -1);
>>  	atomic_set(&asd->sequence_temp, -1);
>> @@ -1910,7 +1912,9 @@ static int atomisp_streamon(struct file *file, void *fh,
>>  	ret = v4l2_subdev_call(isp->inputs[asd->input_curr].camera,
>>  			       video, s_stream, 1);
>>  	if (ret) {
>> +		spin_lock_irqsave(&isp->lock, irqflags);
>>  		asd->streaming = ATOMISP_DEVICE_STREAMING_DISABLED;
>> +		spin_unlock_irqrestore(&isp->lock, irqflags);
>>  		ret = -EINVAL;
>>  		goto out;
>>  	}
>> diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
>> index 4a4367701509..88bf693f4c50 100644
>> --- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
>> +++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
>> @@ -874,12 +874,18 @@ static int s_ctrl(struct v4l2_ctrl *ctrl)
>>  {
>>  	struct atomisp_sub_device *asd = container_of(
>>  					     ctrl->handler, struct atomisp_sub_device, ctrl_handler);
>> +	unsigned int streaming;
>> +	unsigned long flags;
>>  
>>  	switch (ctrl->id) {
>>  	case V4L2_CID_RUN_MODE:
>>  		return __atomisp_update_run_mode(asd);
>>  	case V4L2_CID_DEPTH_MODE:
>> -		if (asd->streaming != ATOMISP_DEVICE_STREAMING_DISABLED) {
>> +		/* Use spinlock instead of mutex to avoid possible locking issues */
>> +		spin_lock_irqsave(&asd->isp->lock, flags);
>> +		streaming = asd->streaming;
>> +		spin_unlock_irqrestore(&asd->isp->lock, flags);
>> +		if (streaming != ATOMISP_DEVICE_STREAMING_DISABLED) {
>>  			dev_err(asd->isp->dev,
>>  				"ISP is streaming, it is not supported to change the depth mode\n");
>>  			return -EINVAL;
>> diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.h b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
>> index eaf767880407..b44f060b0bb5 100644
>> --- a/drivers/staging/media/atomisp/pci/atomisp_subdev.h
>> +++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
>> @@ -330,7 +330,11 @@ struct atomisp_sub_device {
>>  	atomic_t sequence;      /* Sequence value that is assigned to buffer. */
>>  	atomic_t sequence_temp;
>>  
>> -	unsigned int streaming; /* Hold both mutex and lock to change this */
>> +	/*
>> +	 * Writers of streaming must hold both isp->mutex and isp->lock.
>> +	 * Readers of streaming need to hold only one of the two locks.
>> +	 */
>> +	unsigned int streaming;
>>  	bool stream_prepared; /* whether css stream is created */
>>  
>>  	/* subdev index: will be used to show which subdev is holding the
>> -- 
>> 2.37.3
>>
> 

