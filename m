Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95341366D4
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2019 23:30:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726589AbfFEVaY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jun 2019 17:30:24 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:37606 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726510AbfFEVaY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jun 2019 17:30:24 -0400
Received: by mail-qt1-f194.google.com with SMTP id y57so308846qtk.4
        for <linux-media@vger.kernel.org>; Wed, 05 Jun 2019 14:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=W1SwKAzrSsraL2rJYcRqKU9p/AAS2w/6bHcCd/yWVTY=;
        b=XvoSyiJWJjZ8O1byGZWAjxvlsniWLJz+KAPD8l0fEGvVihiVdIjoMHmThPQX0IAFdH
         OLqH7L3HbIGle+BLtliIEpNU1RAx77yleEYUd4/aDvcm6TsXvCyho10McqEwwgT+ijpy
         T+KX7DYWNUWYDeSwUfcf6U1ZHeoKqx6ITYk/euysVAF5CbCqDHfJtMhkCiul5BcuG6lo
         38k2HB4XhrKWEscKB6syZx8Vk0sEnseixgDsFPzglKe4XEQlkGY+9ucGLOccEbzG/AWX
         ra2tCcqsL9Av0/NvkHGdxCG6kRAGY7Lt5+1chyd5k4HqT0rAaaP0nLhUgE5Cxjv73qVB
         vQ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=W1SwKAzrSsraL2rJYcRqKU9p/AAS2w/6bHcCd/yWVTY=;
        b=KGMtWQNKf0a7Rd7x7cK+HUIVx6ecmnQ6iKveNkdT5dyTwTr1rz0p7qErXw21LhdmZ6
         UgUMNFrc4gfGsDcGTPFesQlBTfO2BOplQLB4gE0HGfDTqerx35f/y8IeOv0nITuU2pZk
         cv9qwBSzo8s4QkRwaaiyo4H5QwRXYOac954dUqAglNoYTDP0Q5NljYHMl+AToHEOk4hH
         jBsTGLtWMzvXocQQQCc4qjHxgfEgnMegnrKiii22mfhkAc1qrsWeErtScP52jVRA8oiy
         H2YmUt5ZSTxWOSkyfNHDHy7RJm2qo03CV8CJ+xFCDDRSIVqIpAvU3p+9HSwc8Qk84gvu
         ReRA==
X-Gm-Message-State: APjAAAXveSaVJLOVmIziPfdPqGbHsMyGfuCu+QFXR7XEZVGnJqwYAAbo
        4XJVMVJeb9F2v/fWSz6O/Z6jVw==
X-Google-Smtp-Source: APXvYqyr179W7aDtAChmKkptnBIc2kMcBdRREpSZmu+3HLBiaBVJv0h7CtNC7XKvc89sY8BUrLtvGQ==
X-Received: by 2002:aed:3a87:: with SMTP id o7mr36089666qte.310.1559770223223;
        Wed, 05 Jun 2019 14:30:23 -0700 (PDT)
Received: from [192.168.0.189] ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id v195sm12092964qka.28.2019.06.05.14.30.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Jun 2019 14:30:22 -0700 (PDT)
Subject: Re: [PATCH] Revert "media: hfi_parser: don't trick gcc with a wrong
 expected size"
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        "open list:QUALCOMM VENUS VIDEO ACCELERATOR DRIVER" 
        <linux-media@vger.kernel.org>,
        "open list:QUALCOMM VENUS VIDEO ACCELERATOR DRIVER" 
        <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20190605201941.4150-1-jonathan@marek.ca>
 <20190605174044.65ac1e4a@coco.lan>
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <c0a251c1-d36a-613b-4573-5939cdfc3ebe@marek.ca>
Date:   Wed, 5 Jun 2019 17:27:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190605174044.65ac1e4a@coco.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

hfi_capabilities /  hfi_profile_level_supported come from hardware so 
there is no option to dynamically allocate, and using size [1] doesn't 
cause any bug.

Your enclosed patch is wrong in a way because MAX_CAP_ENTRIES is not a 
hardware limit but the size of the statically allocated array used by 
the driver. I don't think there is any defined hardware limit, otherwise 
the driver author would've defined it as they did with 
HFI_MAX_PROFILE_COUNT.

A better solution (IMO) if you want to avoid these warnings is to remove 
those memcpy() and work on the data[] / profile_level[] from the struct 
directly:

diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c 
b/drivers/media/platform/qcom/venus/hfi_parser.c
index 2293d936e49c..ecaa336b2cb9 100644
--- a/drivers/media/platform/qcom/venus/hfi_parser.c
+++ b/drivers/media/platform/qcom/venus/hfi_parser.c
@@ -94,16 +94,12 @@ static void
  parse_profile_level(struct venus_core *core, u32 codecs, u32 domain, 
void *data)
  {
  	struct hfi_profile_level_supported *pl = data;
-	struct hfi_profile_level *proflevel = pl->profile_level;
-	struct hfi_profile_level pl_arr[HFI_MAX_PROFILE_COUNT] = {};

  	if (pl->profile_count > HFI_MAX_PROFILE_COUNT)
  		return;

-	memcpy(pl_arr, proflevel, pl->profile_count * sizeof(*proflevel));
-
  	for_each_codec(core->caps, ARRAY_SIZE(core->caps), codecs, domain,
-		       fill_profile_level, pl_arr, pl->profile_count);
+		       fill_profile_level, pl->profile_level, pl->profile_count);
  }

  static void
@@ -119,17 +115,12 @@ static void
  parse_caps(struct venus_core *core, u32 codecs, u32 domain, void *data)
  {
  	struct hfi_capabilities *caps = data;
-	struct hfi_capability *cap = caps->data;
-	u32 num_caps = caps->num_capabilities;
-	struct hfi_capability caps_arr[MAX_CAP_ENTRIES] = {};

-	if (num_caps > MAX_CAP_ENTRIES)
+	if (caps->num_capabilities > MAX_CAP_ENTRIES)
  		return;

-	memcpy(caps_arr, cap, num_caps * sizeof(*cap));
-
  	for_each_codec(core->caps, ARRAY_SIZE(core->caps), codecs, domain,
-		       fill_caps, caps_arr, num_caps);
+		       fill_caps, caps->data, caps->num_capabilities);
  }

  static void fill_raw_fmts(struct venus_caps *cap, const void *fmts,

On 6/5/19 4:41 PM, Mauro Carvalho Chehab wrote:
> Em Wed,  5 Jun 2019 16:19:40 -0400
> Jonathan Marek <jonathan@marek.ca> escreveu:
> 
>> This reverts commit ded716267196862809e5926072adc962a611a1e3.
>>
>> This change doesn't make any sense and breaks the driver.
> 
> The fix is indeed wrong, but reverting is the wrong thing to do.
> 
> The problem is that the driver is trying to write past the
> allocated area, as reported:
> 
> 	drivers/media/platform/qcom/venus/hfi_parser.c:103 parse_profile_level() error: memcpy() 'proflevel' too small (8 vs 128)
> 	drivers/media/platform/qcom/venus/hfi_parser.c:129 parse_caps() error: memcpy() 'cap' too small (16 vs 512)
> 
> If you check the memcpy() logic at the above lines, you'll see that
> hfi_capability.data may have up to 32 entries, and
> hfi_profile_level_supported.profile level can have up to it can be up
> to 16 entries.
> 
> So, the buffer should either be dynamically allocated with the real
> size or we need something like the enclosed patch.
> 
> Thanks,
> Mauro
> 
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index 7a3feb5cee00..06a84f266bcc 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -59,7 +59,6 @@ struct venus_format {
>   
>   #define MAX_PLANES		4
>   #define MAX_FMT_ENTRIES		32
> -#define MAX_CAP_ENTRIES		32
>   #define MAX_ALLOC_MODE_ENTRIES	16
>   #define MAX_CODEC_NUM		32
>   
> diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
> index 34ea503a9842..ca8033381515 100644
> --- a/drivers/media/platform/qcom/venus/hfi_helper.h
> +++ b/drivers/media/platform/qcom/venus/hfi_helper.h
> @@ -560,6 +560,8 @@ struct hfi_bitrate {
>   #define HFI_CAPABILITY_HIER_P_HYBRID_NUM_ENH_LAYERS	0x15
>   #define HFI_CAPABILITY_MBS_PER_SECOND_POWERSAVE		0x16
>   
> +#define MAX_CAP_ENTRIES                32
> +
>   struct hfi_capability {
>   	u32 capability_type;
>   	u32 min;
> @@ -569,7 +571,7 @@ struct hfi_capability {
>   
>   struct hfi_capabilities {
>   	u32 num_capabilities;
> -	struct hfi_capability *data;
> +	struct hfi_capability data[MAX_CAP_ENTRIES];
>   };
>   
>   #define HFI_DEBUG_MSG_LOW	0x01
> @@ -726,7 +728,7 @@ struct hfi_profile_level {
>   
>   struct hfi_profile_level_supported {
>   	u32 profile_count;
> -	struct hfi_profile_level *profile_level;
> +	struct hfi_profile_level profile_level[HFI_MAX_PROFILE_COUNT];
>   };
>   
>   struct hfi_quality_vs_speed {
> 
> 
> 
