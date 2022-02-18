Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CCA14BAFAA
	for <lists+linux-media@lfdr.de>; Fri, 18 Feb 2022 03:25:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231586AbiBRCZA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Feb 2022 21:25:00 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:41432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231585AbiBRCY6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Feb 2022 21:24:58 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2D0FADFC5
        for <linux-media@vger.kernel.org>; Thu, 17 Feb 2022 18:24:42 -0800 (PST)
Received: from notapiano (unknown [IPv6:2a00:5f00:102:0:c88c:d8ff:fee5:4936])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: nfraprado)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 52FDA1F4644B;
        Fri, 18 Feb 2022 02:24:40 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1645151080;
        bh=pPiGcT3fIhqefxpajEVWWoZKMq/ngoFvzx237c7BXKg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=f5k947WQWnS1r4YvEajzvM6Hk3FXXxGx8UxiqS+9vgc6y1Ev9TFO2Imvj+9s6jLVW
         nrK23yvafOluZ/QKr94UEqpBlO1j87sbjm9OwRi+tGvfvz9iThuxXzBUP0846RklHN
         A9r6DakJqT++0ra7Tcqd7G+f5rwMB5KoCPq0fQLQnNRQPugNyGr1RNd7mZC2gOE/C9
         5p2EZjUdvYVFYHuAco0ODldBvoHBzrZZDmt0ulUzLksLQ3EeYsl6JBgEOOeC9rSlES
         3o1LJ/NjoflncKzvqXa4D5s9k+WTO15fKLFN989tXefbgEynRIXno/UljRlX5BKe8x
         ZC7ldQnf6vHsA==
Date:   Thu, 17 Feb 2022 21:24:36 -0500
From:   =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado 
        <nfraprado@collabora.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: Venus v4l2-compliance failures
Message-ID: <20220218022436.crvixw7yxyi3pjr3@notapiano>
References: <b5c170e2-dbdf-fc08-31e2-112d2973017f@linaro.org>
 <fff5d698-99b3-3d92-5fc3-23e217554a79@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fff5d698-99b3-3d92-5fc3-23e217554a79@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Thu, Feb 17, 2022 at 03:34:51PM +0100, Hans Verkuil wrote:
> On 17/02/2022 15:12, Stanimir Varbanov wrote:
> > Failure #2 is related to a commit [1] which add checks for
> > MEDIA_ENT_F_PROC_VIDEO_ENCODER, I think this entity flag is applicable
> > for stateless encoders (Request API) but Venus driver has no use of
> > media-controller API. Did I miss something?
> 
> For item 2, can you try the patch below?

I faced the same issue with the mtk-vcodec-enc driver on mt8173-elm-hana. The
patch below does fix the test for me, so

Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

> 
> Regards,
> 
> 	Hans
> 
> -----------------------------------------------------------------------
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
> diff --git a/utils/v4l2-compliance/v4l2-test-codecs.cpp b/utils/v4l2-compliance/v4l2-test-codecs.cpp
> index 22175eef..3f06070f 100644
> --- a/utils/v4l2-compliance/v4l2-test-codecs.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-codecs.cpp
> @@ -29,9 +29,10 @@ int testEncoder(struct node *node)
>  {
>  	struct v4l2_encoder_cmd cmd;
>  	bool is_encoder = node->codec_mask & (STATEFUL_ENCODER | JPEG_ENCODER);
> +	bool is_stateless_encoder = node->codec_mask & STATELESS_ENCODER;
>  	int ret;
> 
> -	if (IS_ENCODER(node))
> +	if (is_stateless_encoder)
>  		fail_on_test(node->function != MEDIA_ENT_F_PROC_VIDEO_ENCODER);
>  	memset(&cmd, 0xff, sizeof(cmd));
>  	memset(&cmd.raw, 0, sizeof(cmd.raw));
> @@ -98,9 +99,10 @@ int testDecoder(struct node *node)
>  {
>  	struct v4l2_decoder_cmd cmd;
>  	bool is_decoder = node->codec_mask & (STATEFUL_DECODER | JPEG_DECODER);
> +	bool is_stateless_decoder = node->codec_mask & STATELESS_DECODER;
>  	int ret;
> 
> -	if (IS_DECODER(node))
> +	if (is_stateless_decoder)
>  		fail_on_test(node->function != MEDIA_ENT_F_PROC_VIDEO_DECODER);
>  	memset(&cmd, 0xff, sizeof(cmd));
>  	memset(&cmd.raw, 0, sizeof(cmd.raw));
> 
