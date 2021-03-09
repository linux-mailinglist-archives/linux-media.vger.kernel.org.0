Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9C943323E8
	for <lists+linux-media@lfdr.de>; Tue,  9 Mar 2021 12:25:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229916AbhCILZN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Mar 2021 06:25:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230397AbhCILYq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Mar 2021 06:24:46 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFAACC06174A
        for <linux-media@vger.kernel.org>; Tue,  9 Mar 2021 03:24:45 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id k9so26404530lfo.12
        for <linux-media@vger.kernel.org>; Tue, 09 Mar 2021 03:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sV1XPG5phcHuntEsED+hdZw6pqB4OOilnmEjFKBuxl0=;
        b=iIE60+qqkvVlyQR4b5CTv4AdQ5kq8mI6n5OR5fyJV/Mg/VlVn5lvNgmBSa1HCTO7mt
         M1ElLzgP2rrbrZqTB7YdmOycIdKVGrktemF8GvfJS2Lhz4OkAwjGXqejc+m0IlcS1P5y
         FBRa2IbQc1VQwR3zGDxFtVe6igGrZ62FzFWpPYOjDnhvfSLJ/RWp9kdyaa28Mc3hIomW
         9Cd58h/KBfC+2QTx3kpz5HnfQE8NR5+WG+JC6uja+Bw+i5pcEpDFDCWIpfXjrwuyZItz
         2ZspKWjFuuf5jKqa+Y/D7p5hcOeKDrJHVnPZr5+dVHDQtuwOABpPlbiTpfUaY3xMm4K6
         k9zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sV1XPG5phcHuntEsED+hdZw6pqB4OOilnmEjFKBuxl0=;
        b=rMa5HMVzGFiR4Skzij6OZ52o9X0ihqtVAagMQs7Ep/rpLaK6Hsb8bGYARCprT2w6LL
         uFXDaaFm2NM68hTNCmBaU6dyFZ0LUZiH0qegR5QAtBll54YBPw5KRNfTLH9a0HsbSvSa
         a9F0r7XnaDIC/RwplSLHVC/CbuUaKF1BYuoqEkBRGYrYts6cYrqhbeS40Yp7LrgmYu64
         D6yvsl96w5wvWkYmKiw6IV8AimLdNXnPLapS5KR7Nn1dWBQ7cnMT4vmfQQiXmR3/QfOp
         aL32BjeOfcCnjPF46A4msScsrC+E8J3yivS+X9x/ZgCUq8iBlazVJhhzigiHiZbMeAbk
         TjHg==
X-Gm-Message-State: AOAM530kLYrOsMRxryE2F+gsIGl7TFWlz28g7h52XLs0YP+857T5CXB2
        kqI718YjtRqwaf72e668ZJa2Tg==
X-Google-Smtp-Source: ABdhPJzr4+p2RQXPk/jCpd/juAlQtUSYhllyBrSW6cUTzEbgZwIDNmc0civCnzBpqX2rjRmtD6yqhw==
X-Received: by 2002:a19:513:: with SMTP id 19mr17544862lff.528.1615289084295;
        Tue, 09 Mar 2021 03:24:44 -0800 (PST)
Received: from [192.168.118.216] ([85.249.43.69])
        by smtp.gmail.com with ESMTPSA id b3sm1732758lfb.191.2021.03.09.03.24.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Mar 2021 03:24:43 -0800 (PST)
Subject: Re: [RFC PATCH 4/4] staging: media: omap4iss: use
 v4l2_get_link_freq() to get the external rate
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        mchehab@kernel.org, niklas.soderlund@ragnatech.se, bparrot@ti.com,
        mickael.guene@st.com
References: <20210303180817.12285-1-andrey.konovalov@linaro.org>
 <20210303180817.12285-5-andrey.konovalov@linaro.org>
 <20210305154103.GV3@paasikivi.fi.intel.com>
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
Message-ID: <da7f0769-6f12-e895-8cf1-adf915bce64b@linaro.org>
Date:   Tue, 9 Mar 2021 14:24:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210305154103.GV3@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On 05.03.2021 18:41, Sakari Ailus wrote:
> Hi Andrey,
> 
> Thanks for the set.
> 
> On Wed, Mar 03, 2021 at 09:08:17PM +0300, Andrey Konovalov wrote:
>> This driver uses V4L2_CID_PIXEL_RATE to calculate the CSI2 link frequency,
>> but this may give incorrect result in some cases. Use v4l2_get_link_freq()
>> instead.
>>
>> Also the driver used the external_rate field in struct iss_pipeline as a
>> flag to prevent excessive v4l2_subdev_call's when processing the frames
>> in single-shot mode. Replace the external_rate with external_lfreq, and
>> use external_bpp and external_lfreq to call v4l2_subdev_call(get_fmt) and
>> v4l2_get_link_freq() respectively only once per iss_video_streamon().
>>
>> Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
>> ---
>>   drivers/staging/media/omap4iss/iss.c        | 12 +-----------
>>   drivers/staging/media/omap4iss/iss_csiphy.c | 19 ++++++++++++++++---
>>   drivers/staging/media/omap4iss/iss_video.c  |  2 +-
>>   drivers/staging/media/omap4iss/iss_video.h  |  2 +-
>>   4 files changed, 19 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/staging/media/omap4iss/iss.c b/drivers/staging/media/omap4iss/iss.c
>> index dae9073e7d3c..0eb7b1b5dcc4 100644
>> --- a/drivers/staging/media/omap4iss/iss.c
>> +++ b/drivers/staging/media/omap4iss/iss.c
>> @@ -131,7 +131,7 @@ int omap4iss_get_external_info(struct iss_pipeline *pipe,
>>   	if (!pipe->external)
>>   		return 0;
>>   
>> -	if (pipe->external_rate)
>> +	if (pipe->external_bpp)
>>   		return 0;
>>   
>>   	memset(&fmt, 0, sizeof(fmt));
>> @@ -145,16 +145,6 @@ int omap4iss_get_external_info(struct iss_pipeline *pipe,
>>   
>>   	pipe->external_bpp = omap4iss_video_format_info(fmt.format.code)->bpp;
>>   
>> -	ctrl = v4l2_ctrl_find(pipe->external->ctrl_handler,
>> -			      V4L2_CID_PIXEL_RATE);
>> -	if (!ctrl) {
>> -		dev_warn(iss->dev, "no pixel rate control in subdev %s\n",
>> -			 pipe->external->name);
>> -		return -EPIPE;
>> -	}
>> -
>> -	pipe->external_rate = v4l2_ctrl_g_ctrl_int64(ctrl);
>> -
>>   	return 0;
>>   }
>>   
>> diff --git a/drivers/staging/media/omap4iss/iss_csiphy.c b/drivers/staging/media/omap4iss/iss_csiphy.c
>> index 96f2ce045138..cec0cd21f7e0 100644
>> --- a/drivers/staging/media/omap4iss/iss_csiphy.c
>> +++ b/drivers/staging/media/omap4iss/iss_csiphy.c
>> @@ -119,6 +119,7 @@ int omap4iss_csiphy_config(struct iss_device *iss,
>>   	struct iss_pipeline *pipe = to_iss_pipeline(&csi2_subdev->entity);
>>   	struct iss_v4l2_subdevs_group *subdevs = pipe->external->host_priv;
>>   	struct iss_csiphy_dphy_cfg csi2phy;
>> +	s64 link_freq;
>>   	int csi2_ddrclk_khz;
>>   	struct iss_csiphy_lanes_cfg *lanes;
>>   	unsigned int used_lanes = 0;
>> @@ -193,9 +194,21 @@ int omap4iss_csiphy_config(struct iss_device *iss,
>>   	if (lanes->clk.pos == 0 || used_lanes & (1 << lanes->clk.pos))
>>   		return -EINVAL;
>>   
>> -	csi2_ddrclk_khz = pipe->external_rate / 1000
>> -		/ (2 * csi2->phy->used_data_lanes)
>> -		* pipe->external_bpp;
>> +	if (!pipe->external_lfreq) {
>> +		link_freq = v4l2_get_link_freq(pipe->external->ctrl_handler,
> 
> I wonder if you could this unconditionally, and remove external_lfreq field
> altogether. The same could be done for external_bpp but that's out of scope
> for this patch.

Hard to tell.
This might be possible as all this logic to prevent multiple v4l2_subdev_call(get_fmt)
and v4l2_get_link_freq() calls per single iss_video_streamon() seems to be needed
only when ISS operates in memory-to-memory mode. Not sure how link frequency, and
used_lanes are related to memory-to-memory mode... Will try to find out.

Thanks,
Andrey

>> +					       pipe->external_bpp,
>> +					       2 * csi2->phy->used_data_lanes);
>> +		if (link_freq < 0) {
>> +			dev_warn(iss->dev,
>> +				 "failed to read the link frequency fromn subdev %s\n",
>> +				 pipe->external->name);
>> +			return -EINVAL;
>> +		}
>> +
>> +		pipe->external_lfreq = link_freq;
>> +	}
>> +
>> +	csi2_ddrclk_khz = div_s64(pipe->external_lfreq, 1000);
>>   
>>   	/*
>>   	 * THS_TERM: Programmed value = ceil(12.5 ns/DDRClk period) - 1.
>> diff --git a/drivers/staging/media/omap4iss/iss_video.c b/drivers/staging/media/omap4iss/iss_video.c
>> index 66975a37dc85..a654c8d18bbc 100644
>> --- a/drivers/staging/media/omap4iss/iss_video.c
>> +++ b/drivers/staging/media/omap4iss/iss_video.c
>> @@ -872,7 +872,7 @@ iss_video_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
>>   	pipe = entity->pipe
>>   	     ? to_iss_pipeline(entity) : &video->pipe;
>>   	pipe->external = NULL;
>> -	pipe->external_rate = 0;
>> +	pipe->external_lfreq = 0;
>>   	pipe->external_bpp = 0;
>>   
>>   	ret = media_entity_enum_init(&pipe->ent_enum, entity->graph_obj.mdev);
>> diff --git a/drivers/staging/media/omap4iss/iss_video.h b/drivers/staging/media/omap4iss/iss_video.h
>> index 526281bf0051..2ad5c8483958 100644
>> --- a/drivers/staging/media/omap4iss/iss_video.h
>> +++ b/drivers/staging/media/omap4iss/iss_video.h
>> @@ -86,7 +86,7 @@ struct iss_pipeline {
>>   	bool error;
>>   	struct v4l2_fract max_timeperframe;
>>   	struct v4l2_subdev *external;
>> -	unsigned int external_rate;
>> +	s64 external_lfreq;
>>   	int external_bpp;
>>   };
>>   
> 
