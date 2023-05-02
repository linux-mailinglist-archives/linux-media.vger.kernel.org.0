Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 361FF6F4BA0
	for <lists+linux-media@lfdr.de>; Tue,  2 May 2023 22:52:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229721AbjEBUwg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 May 2023 16:52:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbjEBUwf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 May 2023 16:52:35 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CACCD1BC1;
        Tue,  2 May 2023 13:52:33 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-94ef0a8546fso709981066b.1;
        Tue, 02 May 2023 13:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683060752; x=1685652752;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VNIBDi9cX5m1XY06HfPo6MjnbSVQ9LD+YR4Pmsi5V1o=;
        b=FKefYj9RO4YkvQeJxBIZ4V5jDtEH5tgeN4Da7uLSMZLQnW+gI6ocIjxYb+iBXY5nnz
         wslr0Xzb7XEqmtRSypBoQAbt2b+NmByflqL+IIJXDiUNqSDEp9WZYaSESaSfCGRDVsTL
         AyhjZ3cspla/vTrevLYItLxJhrHyab4X2hcMY+nE0XPXOZsgg8ty2dp56TZmTjJK/Le6
         Btr1uQsJWn4U4Lv1NrIWBHdyDU+oueWnxSiaSixxAM4T7LFiknSpcJ6fOlpUJjvxrxmj
         csJ3EsIR3zsBHPwmh/UgGcgl6M7GWJdQxx+6BSVDWZiKmHDy7oPwl6m8rh3T0odCIwDr
         JPfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683060752; x=1685652752;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VNIBDi9cX5m1XY06HfPo6MjnbSVQ9LD+YR4Pmsi5V1o=;
        b=Lrx0hAeZH9PuniilT+GBNY9Snr7RrJ1pp2h79Jdr1+ROVy70mASoI9hBLXngntzUeS
         EPXWmBNBgVaW9JfSj7fyLSCxJmgs+5ID3r1cJ+uJi87sbaDOurr4pQLq9N6BUwmKVCy4
         mnp+av7kSkxXJFfube8n9Zlf1uSTgGSoPu0nP8ELKOWl+1Cy6DhoyL5Qo2mBzz1uMgA8
         t82F7g3CFFMEb6oxKMDYXk9RYfRbrmiAgPjpIOQm7ELL/qE6mC/nB3bX10W/QyWcJibG
         135sT5SgmboWPdr6c7cibcxsUzFKvyUjBwG3zGR1j90nfu8oWtLHphAG9PH0R3j7Ns6Z
         RQaw==
X-Gm-Message-State: AC+VfDwvrIV9gIOOE6Ozx2tzrKj6GM51yINehrxrqxtQYYIZ0EQX2fB/
        hFfYlzPkgs0fwTlL4q1Z5s8=
X-Google-Smtp-Source: ACHHUZ7AbKyr4LGP/WwDfNoOVvrWGL/EQZ5T6bvoP2KL5poTf68C/6UHnpUmjlsQhY4gDc7hTyDfQw==
X-Received: by 2002:a17:907:78b:b0:931:df8d:113 with SMTP id xd11-20020a170907078b00b00931df8d0113mr1166121ejb.26.1683060751893;
        Tue, 02 May 2023 13:52:31 -0700 (PDT)
Received: from [192.168.1.43] (hst-221-88.medicom.bg. [84.238.221.88])
        by smtp.gmail.com with ESMTPSA id hg18-20020a1709072cd200b00965504665e2sm249627ejc.149.2023.05.02.13.52.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 May 2023 13:52:31 -0700 (PDT)
Message-ID: <5a851116-561f-2d00-1310-2debc43ce249@gmail.com>
Date:   Tue, 2 May 2023 23:52:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] media: venus: only set H264_TRANSFORM_8X8 on supported
 hfi versions
To:     =?UTF-8?Q?Martin_D=c3=b8rum?= <dorum@noisolation.com>,
        quic_vgarodia@quicinc.com
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <5D1EB136-0839-44BF-9F9B-A937237C9C96@noisolation.com>
Content-Language: en-US, bg-BG
From:   Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
In-Reply-To: <5D1EB136-0839-44BF-9F9B-A937237C9C96@noisolation.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 14.04.23 г. 13:12 ч., Martin Dørum wrote:
> Setting the H264_TRANSFORM_8X8 property only works on HFI versions
>> =4xx. The code used to unconditionally set the property in
> venc_set_properties, which meant that initializing the encoder would
> always fail unless the hfi_version was >=4xx.
> 
> This patch changes venc_set_properties to only set the
> H264_TRANSFORM_8X8 property if the hfi version is >=4xx.
> 
> Signed-off-by: Martin Dørum <dorum@noisolation.com>
> 
> ---
> 
> I have an APQ8016-based board. Before this patch, the Venus driver
> would simply fail with EINVAL when trying to request buffers
> (VIDIOC_REQBUFS). With this patch, encoding works
> (tested using gstreamer's v4l2h264enc).
> 
>   drivers/media/platform/qcom/venus/venc.c | 21 +++++++++++----------
>   1 file changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index cdb12546c4fa..b3df805a8c9c 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -672,16 +672,17 @@ static int venc_set_properties(struct venus_inst *inst)
>   		if (ret)
>   			return ret;
> 
> -		ptype = HFI_PROPERTY_PARAM_VENC_H264_TRANSFORM_8X8;
> -		h264_transform.enable_type = 0;
> -		if (ctr->profile.h264 == V4L2_MPEG_VIDEO_H264_PROFILE_HIGH ||
> -		    ctr->profile.h264 == V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH)
> -			h264_transform.enable_type = ctr->h264_8x8_transform;
> -
> -		ret = hfi_session_set_property(inst, ptype, &h264_transform);
> -		if (ret)
> -			return ret;
> -
> +		if (!IS_V1(inst->core) && !IS_V3(inst->core)) {

Instead of doing these checks here you could do:

diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.c 
b/drivers/media/platform/qcom/venus/hfi_cmds.c
index bc3f8ff05840..2453e5c3d244 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.c
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.c
@@ -1064,6 +1064,7 @@ static int pkt_session_set_property_1x(struct 
hfi_session_set_property_pkt *pkt,
                 break;
         }
         case HFI_PROPERTY_PARAM_VENC_HDR10_PQ_SEI:
+       case HFI_PROPERTY_PARAM_VENC_H264_TRANSFORM_8X8:
                 return -ENOTSUPP;

         /* FOLLOWING PROPERTIES ARE NOT IMPLEMENTED IN CORE YET */

> +			ptype = HFI_PROPERTY_PARAM_VENC_H264_TRANSFORM_8X8;
> +			h264_transform.enable_type = 0;
> +			if (ctr->profile.h264 == V4L2_MPEG_VIDEO_H264_PROFILE_HIGH ||
> +			    ctr->profile.h264 == V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH)
> +				h264_transform.enable_type = ctr->h264_8x8_transform;
> +
> +			ret = hfi_session_set_property(inst, ptype, &h264_transform);
> +			if (ret)
> +				return ret;
> +		}
>   	}
> 
>   	if (inst->fmt_cap->pixfmt == V4L2_PIX_FMT_H264 ||
> --
> 2.34.1

-- 
regards,
Stan
