Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C8E9586CC2
	for <lists+linux-media@lfdr.de>; Mon,  1 Aug 2022 16:25:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232521AbiHAOZS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Aug 2022 10:25:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232526AbiHAOZQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Aug 2022 10:25:16 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFA01EB1
        for <linux-media@vger.kernel.org>; Mon,  1 Aug 2022 07:25:14 -0700 (PDT)
Received: from [192.168.1.111] (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CC24E2F3;
        Mon,  1 Aug 2022 16:25:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1659363912;
        bh=jsS1DyMJSR8OKKMqkFWKiO7+2bIXBY7Mjx2OuGZH4hg=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=KLl511Ks6QRfrVozqefYFACC4uSbnIii9powkiXgRoZtouPWk1Em9BNLiHUsKzKQ2
         pauSUT+fMYmatVfA7L8/IljcQ55udRPyXttUCh1/R4YRkJ/BWgi3W4vVDGuztTs2pI
         +Pril6MZVnvascIvfQWYOJgCEXk9eJPzO9v5WhyA=
Message-ID: <24245557-502f-76b7-ac97-7192fabe4eb1@ideasonboard.com>
Date:   Mon, 1 Aug 2022 17:25:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v12 26/30] media: v4l2-subdev: Add
 v4l2_subdev_state_xlate_streams() helper
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
References: <20220727103639.581567-1-tomi.valkeinen@ideasonboard.com>
 <20220727103639.581567-27-tomi.valkeinen@ideasonboard.com>
 <YufI7P9kf2E2mBYG@paasikivi.fi.intel.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <YufI7P9kf2E2mBYG@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 01/08/2022 15:37, Sakari Ailus wrote:

>> +u64 v4l2_subdev_state_xlate_streams(const struct v4l2_subdev_state *state,
>> +				    u32 pad0, u32 pad1, u64 *streams);
>> +
>>   /**
>>    * enum v4l2_subdev_routing_restriction - Subdevice internal routing restrictions
>>    *
> 
> How and where is this meant to be used?

I use it in subdev driver's .enable_streams(). E.g.:

static int ub953_enable_streams(struct v4l2_subdev *sd,
				struct v4l2_subdev_state *state, u32 pad,
				u64 streams_mask)
{
	struct ub953_data *priv = sd_to_ub953(sd);
	struct media_pad *remote_pad;
	u64 sink_streams;
	int ret;

	if (streams_mask & priv->enabled_source_streams)
		return -EALREADY;

	sink_streams = v4l2_subdev_state_xlate_streams(
		state, UB953_PAD_SOURCE, UB953_PAD_SINK, &streams_mask);

	remote_pad = media_entity_remote_pad(&priv->pads[UB953_PAD_SINK]);

	ret = v4l2_subdev_enable_streams(priv->source_sd, remote_pad->index,
					 sink_streams);
	if (ret)
		return ret;

	priv->enabled_source_streams |= streams_mask;

	return 0;
}

The driver gets the source pad & stream mask, and must get the
sink pad & stream mask so that it can then call enable_streams
on its source subdev.

  Tomi
