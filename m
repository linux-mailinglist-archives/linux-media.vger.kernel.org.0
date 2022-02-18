Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E021D4BBD01
	for <lists+linux-media@lfdr.de>; Fri, 18 Feb 2022 17:05:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237484AbiBRQGJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Feb 2022 11:06:09 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:36520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232779AbiBRQFn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Feb 2022 11:05:43 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4B245C34A
        for <linux-media@vger.kernel.org>; Fri, 18 Feb 2022 08:05:26 -0800 (PST)
Received: from notapiano (unknown [IPv6:2a00:5f00:102:0:c88c:d8ff:fee5:4936])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: nfraprado)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id AFE221F46D0A;
        Fri, 18 Feb 2022 16:05:16 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1645200317;
        bh=C823c27efOpu9knHGtf0JTngD0EeQSb57HYDcg3DKO0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=onjVvNjjoaixTG0qxMem6BBH1iQoqv42apb73x4NqB7+DT9pEx2p2OwsK9NigXKx7
         EZcLbMVSNRloiHBDsKEz9FNMFh8fooXEVY2YUPV6dT1p30w5Xfwo6l+Ut8WxwHgExp
         Js+ofDJUcvzHV/ork7LJHqQRKVzrOQqGkPfZ8Hptqt7mxbtOGWmN/UrqEM5nnphzvM
         RezFcMm8xb5BRmmab2nAzP7iNRhIRMtBaaH1ahUWPFYJcFx8t4ASZOXGeFjpPlssYd
         4wZBMHlJHQjBKqws8Di0NwA68JYS2RjzMU7/DeKm7U6Z3C8LKdKOwe6SpEwSS9lnD5
         dEvJcSSukKCBQ==
Date:   Fri, 18 Feb 2022 11:05:12 -0500
From:   =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado 
        <nfraprado@collabora.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: Re: [PATCHv2] v4l2-compliance: only check function if an MC is
 present
Message-ID: <20220218160512.ndtsbwiv3hjc6vki@notapiano>
References: <b6bc652a-9e6e-0e82-5a86-2bd0f2df51f1@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b6bc652a-9e6e-0e82-5a86-2bd0f2df51f1@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Fri, Feb 18, 2022 at 09:09:26AM +0100, Hans Verkuil wrote:
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

Just like v1, this patch fixes the following v4l-compliance fail I was seeing on
the mtk-vcodec-enc driver on mt8173-elm-hana:

	fail: v4l2-test-codecs.cpp(35): node->function != MEDIA_ENT_F_PROC_VIDEO_ENCODER
test VIDIOC_(TRY_)ENCODER_CMD: FAIL

So,

Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

> ---
> Nicolas, Stanimir, can you test? This is an improved version of the
> patch fixing the function test for codecs.
> ---
>  utils/v4l2-compliance/v4l2-compliance.cpp  | 1 +
>  utils/v4l2-compliance/v4l2-compliance.h    | 1 +
>  utils/v4l2-compliance/v4l2-test-codecs.cpp | 6 ++++--
>  3 files changed, 6 insertions(+), 2 deletions(-)
> 
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
> -- 
> 2.34.1
> 
