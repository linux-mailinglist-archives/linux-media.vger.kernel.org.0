Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 198C5298602
	for <lists+linux-media@lfdr.de>; Mon, 26 Oct 2020 05:02:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725871AbgJZECJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Oct 2020 00:02:09 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:44850 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725857AbgJZECI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Oct 2020 00:02:08 -0400
Received: by mail-pf1-f196.google.com with SMTP id f19so5443857pfj.11
        for <linux-media@vger.kernel.org>; Sun, 25 Oct 2020 21:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=B99IfzLR2EOWkMrV6HxxsdcyAoy5u02ZQJScBmotCwQ=;
        b=DNzDWjYxT/Wx5/SUEULz7eYFAKK5DShLNGMJ25xpWASVRYuB4TSVfQXMt5Je/u9oKG
         46puF4mB4Nw92RcPUls0wDv3xjkIj0gZg++xd1KgeUWI/MJ4CIRu/WU1h++kThgCT46j
         MzPrJfBiGjd4ZGpHM+IK399SZfQ/s0Bkwr8HdQABYcpJuibi8S6Hp8mF/10Ci3gCpDFG
         w7fvCTwLj3eQvRlStWLkMnHg373JH0Do/TqDRl9vXat46vD6j0G+eq5H/E0L7s4OiOgB
         xG7J6tW1jIb3UvfFvRtDqMhmPy2/P4+wo05ro6fFYIBk50UrSsMGl4vRZQKV/h0xpCc0
         UH9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=B99IfzLR2EOWkMrV6HxxsdcyAoy5u02ZQJScBmotCwQ=;
        b=nGCwHgJnt6BJKMxe362iQ9aeMIUX2257iJy1NuACH7jObP9gPKPIsAhNvh2e0kYkU9
         GteQjPGrzscYH+/5RACeAsdNgjUNik9aA+59FLeR29NuunoZDdakwzbm1K8TE+9bw3CD
         cEuaJw0fjNm5cX18gtPfMHddZEopzBzbvV/KCpDeQ5NmzP51/TImqlHXK/hgwJbvYu3m
         IKozZ+T5qxm+o0kIbTl8VNFqgL9RA1nGmIUgfUcgPYAknFtBXo17Z+uisnbIDqC6c2Ei
         Qa2jiOCMh2Rz8jrr5gIr6AZToaRVY0Eogxh1n+lrOmVb5cYLsErHnUv34GRbgHZHpffk
         SkfA==
X-Gm-Message-State: AOAM531rZQglXuvUFZc/q/XmD7Mtq36djPmJYOBrzgHBLDlAFcS/KxHo
        lQ9LuXU9rYP8/iiqh5ajkxlIAZZSSvg=
X-Google-Smtp-Source: ABdhPJzVt+rS0H2nt0xMQUACBO9dNoE+8id1VaKLzaMBUUSw0hJxdhDIC59lIrHhUJs6IU3HgLLfbg==
X-Received: by 2002:a63:1a64:: with SMTP id a36mr12009872pgm.153.1603684926434;
        Sun, 25 Oct 2020 21:02:06 -0700 (PDT)
Received: from my--box ([103.108.75.206])
        by smtp.gmail.com with ESMTPSA id 128sm10286857pfd.110.2020.10.25.21.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2020 21:02:06 -0700 (PDT)
Date:   Mon, 26 Oct 2020 09:32:00 +0530
From:   Deepak R Varma <mh12gx2825@gmail.com>
To:     outreachy-kernel@googlegroups.com,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2 v5] staging: media: imx: remove unnecessary variable
 use
Message-ID: <20201026040200.GB5074@my--box>
References: <9fd1e7dd9e8f944b520f2a789e66e458aeb7b555.1602869338.git.mh12gx2825@gmail.com>
 <6a22de0a51e06b7cb43d4a55850f3a0213532e42.1602869338.git.mh12gx2825@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a22de0a51e06b7cb43d4a55850f3a0213532e42.1602869338.git.mh12gx2825@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 16, 2020 at 11:16:06PM +0530, Deepak R Varma wrote:

Hello All,
Request for review / ack of this patch.

Thank you.
Deepak.

> Use of variable vc_num is unnecessary here as it is used only once.
> Instead, the value can directly be used in place of the variable.
> 
> Signed-off-by: Deepak R Varma <mh12gx2825@gmail.com>
> ---
> Changes since v4:
>    - None.
> Changes since v3:
>    - None.
> Changes since v2:
>    - Implement feedback from Vaishali to simplify patch log message.
> Changes since v1:
>    - None.
> 
>  drivers/staging/media/imx/imx-media-csi.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
> index 9320e3974d86..db77fef07654 100644
> --- a/drivers/staging/media/imx/imx-media-csi.c
> +++ b/drivers/staging/media/imx/imx-media-csi.c
> @@ -1123,7 +1123,6 @@ static int csi_link_validate(struct v4l2_subdev *sd,
>  	priv->upstream_ep = upstream_ep;
>  	is_csi2 = !is_parallel_bus(&upstream_ep);
>  	if (is_csi2) {
> -		int vc_num = 0;
>  		/*
>  		 * NOTE! It seems the virtual channels from the mipi csi-2
>  		 * receiver are used only for routing by the video mux's,
> @@ -1131,7 +1130,7 @@ static int csi_link_validate(struct v4l2_subdev *sd,
>  		 * enters the CSI's however, they are treated internally
>  		 * in the IPU as virtual channel 0.
>  		 */
> -		ipu_csi_set_mipi_datatype(priv->csi, vc_num,
> +		ipu_csi_set_mipi_datatype(priv->csi, 0,
>  					  &priv->format_mbus[CSI_SINK_PAD]);
>  	}
>  
> -- 
> 2.25.1
> 
