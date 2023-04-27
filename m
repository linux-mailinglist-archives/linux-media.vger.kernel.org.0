Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AD5A6F07A7
	for <lists+linux-media@lfdr.de>; Thu, 27 Apr 2023 16:44:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243908AbjD0OoP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Apr 2023 10:44:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243756AbjD0OoO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Apr 2023 10:44:14 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 916FF3A9A
        for <linux-media@vger.kernel.org>; Thu, 27 Apr 2023 07:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682606606;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yxo4eeBe5fkJ2VVXnK00H4q2x1esqgGFdRbCOUbC0vM=;
        b=NVYtv8rcmCRNksje8XG5PoKwTfmqL6yzDk/ZqD8rukBIDLnvSNTM9IAjJA4M2VjIT0o6DC
        rWb/k1p0I5ACsTG4LTo6n1L9fvrQD76DQEOQfsN2OuSiTLqJjdNlJQ+QyEXeTDDNXgAI6Y
        7w3CJDOPxFII6mN/NkdfBXolvxBfG3s=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-203-gxSnVG9EOti2hcu2jGpDRg-1; Thu, 27 Apr 2023 10:43:24 -0400
X-MC-Unique: gxSnVG9EOti2hcu2jGpDRg-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-2f2981b8364so4824014f8f.1
        for <linux-media@vger.kernel.org>; Thu, 27 Apr 2023 07:43:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682606603; x=1685198603;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yxo4eeBe5fkJ2VVXnK00H4q2x1esqgGFdRbCOUbC0vM=;
        b=EonXDs3ppg8QnmXp4firtE1mGKTn88bIulq9/RnqJLJ1eUt2R9D3im8vC8AqBIWtG3
         uJp1iULOT8wDoJ94Blg1d7hoO79gMKv1WAL2zZ7nl2taxllMFvg9ER6gTo2FcH8Aq5ii
         xuRm420EmPhbJaSQ0M9Xvb6HnkdvWrS/0VtySSV9+G7eXblabeJ1ccg6MVk8z0MqrypG
         h7HAY5rZ6FuDA1FoIrdRUAL1qLONdkFV4zJ7LhPUQ7drq9YVqpOf1NhkVN3YLlMnJ37c
         YpPx1L3fkV8lMnhbtdWTsaKeSq9g1YXpLLPznBilO0wKYO0/KdNOJv2hTrwsSD1lUY3A
         EPsA==
X-Gm-Message-State: AC+VfDySlwat1iabWEDEfiTWcdLuyAIKoQgDO6RsrQ+QE05MDu66OefY
        0f51TszOA/3XCdwD9AK+MWcwsDnrFntYQxzZ3eIFV/YA7cDemI0xkD5v5w3Pt15q96NgWrcHTSU
        mWXcBzEPzh9w9tyepn66OBNoCuC3eI0k=
X-Received: by 2002:adf:f20f:0:b0:304:aba2:cfc7 with SMTP id p15-20020adff20f000000b00304aba2cfc7mr1388120wro.16.1682606603095;
        Thu, 27 Apr 2023 07:43:23 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6rYC4RP8ThPNcjuLdRP5bqT84MLEaob28yxbHbAYoyWcJn8L73C1e55wG64Iegnf1tma8Uhg==
X-Received: by 2002:adf:f20f:0:b0:304:aba2:cfc7 with SMTP id p15-20020adff20f000000b00304aba2cfc7mr1388108wro.16.1682606602783;
        Thu, 27 Apr 2023 07:43:22 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id z3-20020adff1c3000000b002fb9e73d5e5sm18711255wro.60.2023.04.27.07.43.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Apr 2023 07:43:22 -0700 (PDT)
Message-ID: <2ad875b0-0be8-1897-eddd-89605ed2258b@redhat.com>
Date:   Thu, 27 Apr 2023 16:43:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] media: venus: only set H264_TRANSFORM_8X8 on supported
 hfi versions
To:     =?UTF-8?Q?Martin_D=c3=b8rum?= <dorum@noisolation.com>,
        stanimir.k.varbanov@gmail.com, quic_vgarodia@quicinc.com
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <5D1EB136-0839-44BF-9F9B-A937237C9C96@noisolation.com>
Content-Language: en-US
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <5D1EB136-0839-44BF-9F9B-A937237C9C96@noisolation.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Martin,

On 4/14/23 12:12, Martin Dørum wrote:
> Setting the H264_TRANSFORM_8X8 property only works on HFI versions
>> =4xx. The code used to unconditionally set the property in
> venc_set_properties, which meant that initializing the encoder would
> always fail unless the hfi_version was >=4xx.
> 
> This patch changes venc_set_properties to only set the
> H264_TRANSFORM_8X8 property if the hfi version is >=4xx.
>

I would add a

Fixes: bfee75f73c37 ("media: venus: venc: add support for V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM control")

since that is the commit that added this property and expected it to
be used unconditionally in the common venus venc part.

> Signed-off-by: Martin Dørum <dorum@noisolation.com>
> ---

I'm not familiar with the venus encoder driver but I had fixed a couple
of bugs on the venus decoder so I've spent some time looking at the code.

[...]

> +		if (!IS_V1(inst->core) && !IS_V3(inst->core)) {
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

Is true that HFI_PROPERTY_PARAM_VENC_H264_TRANSFORM_8X8 isn't wired for
older HFI versions, but I wonder if that's something that was forgotten
when the property was added in that commit or instead should be ignored
as you do in your patch.

In any case, this fixes a regression that you are experiencing so your
patch should land in my opinion and later can be added to older versions
if that is the correct thing to do.

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

