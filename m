Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7B914BDD1D
	for <lists+linux-media@lfdr.de>; Mon, 21 Feb 2022 18:43:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358025AbiBUMff (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Feb 2022 07:35:35 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:51686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244778AbiBUMfe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Feb 2022 07:35:34 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A33C17ABB
        for <linux-media@vger.kernel.org>; Mon, 21 Feb 2022 04:35:10 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id n8so9417265wms.3
        for <linux-media@vger.kernel.org>; Mon, 21 Feb 2022 04:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=tXGzdo61p01lhdX4O4NxakboJSAeTHC0WJ64aazc/bM=;
        b=oA6Zhzi7Hn6mHvtOsHnGKJ0QEFREmr2YvAca23A03CpL0Za4jQ/NLX4rMXX4I3dPyw
         ZV4g+sceMs2p4UJdYFB1iCBcD3mpPftQtYS4G8YrRtQmPrVzIOxKYEOEGLC98WMVOUFd
         D49QIVzVF5s1VLJC+SCW2MiVeuqB01aZK+17MZOD+O1q2I0AoeECyrZlxCE6OnEbIKga
         Baod8xMR/ryFXL3aYAWzpbumYsk9OkDZFld+7ezctBagZBJD8s276J5zYEXdZ4RVdHpl
         hFMWssja6lk73e4EnmW3fgXYciaHMoqv/n0zow2GbJNMmR/UXLDiilVsfD0BpP76d/Ze
         QhnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=tXGzdo61p01lhdX4O4NxakboJSAeTHC0WJ64aazc/bM=;
        b=TimSbS4X3FtLJUK767ZV6PHMxFvNWpVAFsf3aeacNNliWY/1ROZC20P0Ux8XbKMktq
         QanNCqgZB1w85msC3AuzF2IhCYvpBEo01I9VcG+1TGR0cP7HuiGyZkUPS5w77NPmX0R0
         mtP5UjWh3VtT4kYo4L/M9R/KTkM02DvfQFdBeUAiouy/w4pOLYJB4b4DEd3c7wmvMycz
         yzldwZTC0q77E6POsMo8FD+IKCReMNezC2RdBchXNRlEPj0MLVZxbqJvpGl9h1an5PEb
         CXvMdPzJs6qolD+H0hXnKFxTo1jgfiCw1m+Hqzk3vcZSHd5YHvX67AhGO3tH7Uf8EknR
         e9BQ==
X-Gm-Message-State: AOAM530Ny9GQkz4ti34pObbh3FRHuYSEMByu4dsx0h4BtjblT8EPNTea
        Q8U4JapopjBWjEAPPiMJU9XUYA==
X-Google-Smtp-Source: ABdhPJzjvyigqfsagy7ZQZ7D1aAtRwlGLo40tCXaka2gQ26NXwRGTthHB2+aua74bbwxxcO56YSA8w==
X-Received: by 2002:a7b:c744:0:b0:37b:d7f4:f092 with SMTP id w4-20020a7bc744000000b0037bd7f4f092mr20865929wmk.6.1645446908827;
        Mon, 21 Feb 2022 04:35:08 -0800 (PST)
Received: from [192.168.1.9] (hst-221-113.medicom.bg. [84.238.221.113])
        by smtp.googlemail.com with ESMTPSA id u11sm51886187wrt.108.2022.02.21.04.35.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Feb 2022 04:35:08 -0800 (PST)
Message-ID: <20b1ee44-e3eb-2fd5-80ac-34307beb51f2@linaro.org>
Date:   Mon, 21 Feb 2022 14:35:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCHv2] v4l2-compliance: only check function if an MC is
 present
Content-Language: en-US
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= 
        <nfraprado@collabora.com>
References: <b6bc652a-9e6e-0e82-5a86-2bd0f2df51f1@xs4all.nl>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
In-Reply-To: <b6bc652a-9e6e-0e82-5a86-2bd0f2df51f1@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 2/18/22 10:09, Hans Verkuil wrote:
> The codec tests checked if the function of the device as reported
> by the media controller is that of an de/encoder. But that test
> was also done for codecs without a MC, and then it fails.
> 
> So only do this test if an MC was found.
> 
> Also test that stateless codecs always have a MC since it is
> required for such codecs.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
> Nicolas, Stanimir, can you test? This is an improved version of the
> patch fixing the function test for codecs.
> ---
>  utils/v4l2-compliance/v4l2-compliance.cpp  | 1 +
>  utils/v4l2-compliance/v4l2-compliance.h    | 1 +
>  utils/v4l2-compliance/v4l2-test-codecs.cpp | 6 ++++--
>  3 files changed, 6 insertions(+), 2 deletions(-)
> 

Tested-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

> diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
> index c53a55ba..8d0e94e9 100644
> --- a/utils/v4l2-compliance/v4l2-compliance.cpp
> +++ b/utils/v4l2-compliance/v4l2-compliance.cpp
> @@ -998,6 +998,7 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
>  			if (!node.is_v4l2())
>  				driver = mdinfo.driver;
>  			node.media_bus_info = mdinfo.bus_info;
> +			node.has_media = true;
>  		}
>  	}
> 
> diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-compliance/v4l2-compliance.h
> index 7255161f..507187eb 100644
> --- a/utils/v4l2-compliance/v4l2-compliance.h
> +++ b/utils/v4l2-compliance/v4l2-compliance.h
> @@ -120,6 +120,7 @@ struct base_node {
>  	struct node *node2;	/* second open filehandle */
>  	bool has_outputs;
>  	bool has_inputs;
> +	bool has_media;
>  	unsigned tuners;
>  	unsigned modulators;
>  	unsigned inputs;
> diff --git a/utils/v4l2-compliance/v4l2-test-codecs.cpp b/utils/v4l2-compliance/v4l2-test-codecs.cpp
> index 22175eef..1d76a17c 100644
> --- a/utils/v4l2-compliance/v4l2-test-codecs.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-codecs.cpp
> @@ -31,7 +31,8 @@ int testEncoder(struct node *node)
>  	bool is_encoder = node->codec_mask & (STATEFUL_ENCODER | JPEG_ENCODER);
>  	int ret;
> 
> -	if (IS_ENCODER(node))
> +	fail_on_test((node->codec_mask & STATELESS_ENCODER) && !node->has_media);
> +	if (IS_ENCODER(node) && node->has_media)
>  		fail_on_test(node->function != MEDIA_ENT_F_PROC_VIDEO_ENCODER);
>  	memset(&cmd, 0xff, sizeof(cmd));
>  	memset(&cmd.raw, 0, sizeof(cmd.raw));
> @@ -100,7 +101,8 @@ int testDecoder(struct node *node)
>  	bool is_decoder = node->codec_mask & (STATEFUL_DECODER | JPEG_DECODER);
>  	int ret;
> 
> -	if (IS_DECODER(node))
> +	fail_on_test((node->codec_mask & STATELESS_DECODER) && !node->has_media);
> +	if (IS_DECODER(node) && node->has_media)
>  		fail_on_test(node->function != MEDIA_ENT_F_PROC_VIDEO_DECODER);
>  	memset(&cmd, 0xff, sizeof(cmd));
>  	memset(&cmd.raw, 0, sizeof(cmd.raw));

-- 
regards,
Stan
