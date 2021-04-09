Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C758359665
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 09:30:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229999AbhDIHat (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 03:30:49 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:53375 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229545AbhDIHar (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 9 Apr 2021 03:30:47 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id Ulb2lYmpzgIC3Ulb6lBMzO; Fri, 09 Apr 2021 09:30:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1617953433; bh=NDd6+h2/3qPAuUCWC0yYvf9ykz0YhtUE9GoFjl7tsZI=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=acn/Z5y8wZ+kf9lFb0pERHv/Inh6ob48I1ApWQi+/28F+s/GLljLZYxOvLROMeyo8
         OW41w2kJj2TGPOCv9c8eXq5FkXgm1tI/UUPmUR0DPyvpENWvXJaaTsjE5nv6Vg9jdB
         W4d5do6B1I5inoGZOhSjKvFj3QSkgGKZPKEpgc3RRh9eUP7eJpfy5MsmAeBjj5APh+
         uj/us274FDiZwSSPvnPO5l5/TeQ1TkIHHNSqzyxXsszMmuWblOyGo/Z0T1jFXc6Oq5
         iWzZrO3e02dhBnitrPYcddGYsSsFABVLGVhXZ523CaysQNL0fWyoGllwwkmDZcdBIC
         qMZ7bNhuMuwdw==
Subject: Re: [PATCH] staging: media: meson: vdec: matched alignment with
 parenthesis
To:     Mitali Borkar <mitaliborkar810@gmail.com>, narmstrong@baylibre.com,
        mchehab@kernel.org, gregkh@linuxfoundation.org,
        khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        mitali_s@me.iitr.ac.in
References: <YG+Bcqxetfj98l6V@kali>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <479be6a4-2e6f-98a6-045f-d7c2132137c4@xs4all.nl>
Date:   Fri, 9 Apr 2021 09:30:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YG+Bcqxetfj98l6V@kali>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfCN+87wjz3gHQQueWu2C636kZE2Uika+ygi6v7fBe16Gt90A81UblFHIDuyaB385YzyS3nhv2vOADU0KUzGLdbdhyl20upRf4QIT7lPW0uhJae2k342W
 cNX7ltuZnppyiK5RpvujsORxXzAcXrxdV5BiWwpVQxXgHya+fXhrqjRhW93vISv1lkAObgW8tVYFsjLEQ3m2jCvnMpX0IG9tSGVZHS6HJjd7cVLk80T0iZjq
 xYk4d9pU0cP5/kULuE4K4wCFIoN/jcAQhZnG6hIoA8ES7nooRGEordUSX6onN2jxjh70Vb6HhM0vpVBFZakwHPog3WLpEKuxU6Xxqd39A403nk/KNAIAcAa+
 MqhDhdAxnYqNOfKSU7ERQtIAEUAs0SivoPO681Lmb1C9SB5nCfn4TClvE11SFUp8lhjkeNZfu6OoxCYtEw7yqKmL+lrZVHx7WRDOnw1wwHj1neXkfUN2GnFh
 HMbeCjy2ENt0QdcgszS7QtBhtpCNrWUmiiZF4TpU9FsOxc1sgRmP58/HXwxRAI4ZzTp9y6lw0Aealzcg9guG+V86MrOJPwVPRLu8zqd2hlWGiUQjYiTf6fYd
 oRQpSX4kUiim+X6xoJhXSeQPpiv/uo8e1opAB/1sTy4dDQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 09/04/2021 00:19, Mitali Borkar wrote:
> Matched alignment with open parenthesis to meet linux kernel coding
> style.
> Reported by checkpatch
> 
> Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> ---
>  drivers/staging/media/meson/vdec/codec_mpeg12.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/meson/vdec/codec_mpeg12.c b/drivers/staging/media/meson/vdec/codec_mpeg12.c
> index 48869cc3d973..21e93a13356c 100644
> --- a/drivers/staging/media/meson/vdec/codec_mpeg12.c
> +++ b/drivers/staging/media/meson/vdec/codec_mpeg12.c
> @@ -81,7 +81,7 @@ static int codec_mpeg12_start(struct amvdec_session *sess)
>  	}
>  
>  	ret = amvdec_set_canvases(sess, (u32[]){ AV_SCRATCH_0, 0 },
> -					(u32[]){ 8, 0 });
> +				  (u32[]){ 8, 0 });

The alignment here is because the 2nd and 3rd arguments belong together, so
the alignment indicates that. In order to keep that I would add a newline
after 'sess,' as well. Same as is done in meson/vdec/codec_h264.c.

Regards,

	Hans

>  	if (ret)
>  		goto free_workspace;
>  
> 

