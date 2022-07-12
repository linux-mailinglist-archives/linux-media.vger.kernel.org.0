Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FE44571119
	for <lists+linux-media@lfdr.de>; Tue, 12 Jul 2022 06:10:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbiGLEKl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jul 2022 00:10:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbiGLEKk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jul 2022 00:10:40 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1C0F2A95D
        for <linux-media@vger.kernel.org>; Mon, 11 Jul 2022 21:10:37 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id j22so12195962ejs.2
        for <linux-media@vger.kernel.org>; Mon, 11 Jul 2022 21:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eZ36M3ygQAgeVojZ3PMZJGgunCJGBslLWkL1qYl7GEg=;
        b=Qgjphs8rsWnnZDWk1iY1zvcVE5b9sRnHJY0iuUGjwSwPdvLDAEcIdCfmxZoXxz0960
         dwA8k4+bMnmR2anoeaea+pXOrDMkzvFTdK242O7Vg1GZ/KFqWGiu7MC53Sp0CrQCwApA
         h5bQkXzQPvh08qPCxrPP5aYRUF/2sAFTTeN9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eZ36M3ygQAgeVojZ3PMZJGgunCJGBslLWkL1qYl7GEg=;
        b=y8BoG+RDrKuDlJfnwrq2x9OiyCBrhX5Hs/wLD3+euk01601nL9Zv88goPTKKQax/Na
         Rhp/Xyx0me1uLdgVS+90ZfiFDyz1ANVDVjg+Ix7829et7lc9lNAlKf3iWGIKVJHa1naN
         DyMJUUxhQG7TS5LCgnX4mt1pDRYOwkDGDGv84Zfn91QhfsZbi+y0ZkQPXeCAATuZieXm
         AJNDL4IIMuXDzbBo6QC0Hnd9Y/VyOJcv8DtS4B+PvB8tUMSLLXRfvs/bpUKIsLxkWcOL
         coM7YIj/xxRykyrXW3Bih+3aiWy8jcz7mm941yrD5WWvzf5mYqpP2jpyjJd/qq5yqSCf
         uJmQ==
X-Gm-Message-State: AJIora/LDJVkTwerBtq/XqA6MfZy3dKvqQNRqV2l+kQk+a/wcYlkfBgJ
        HEwcvjbN/jm5p8opgmMhUPhxML+SiwZWlg==
X-Google-Smtp-Source: AGRyM1v+yELeXAz0v4YOBxCeA2Hv+jkS+HRGGdd0WrDBglN3CN0LByCVSnMfiDRqHNZfkuRJyC3H0w==
X-Received: by 2002:a17:906:844b:b0:72b:54b9:b97d with SMTP id e11-20020a170906844b00b0072b54b9b97dmr8601665ejy.229.1657599036338;
        Mon, 11 Jul 2022 21:10:36 -0700 (PDT)
Received: from carbon.gago.life (78-83-68-78.spectrumnet.bg. [78.83.68.78])
        by smtp.gmail.com with ESMTPSA id pv20-20020a170907209400b0072b3464c043sm3332186ejb.116.2022.07.11.21.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 21:10:35 -0700 (PDT)
Date:   Tue, 12 Jul 2022 07:10:35 +0300
From:   Petko Manolov <petko.manolov@konsulko.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH v1 1/1] staging: media: imx: imx7-media-csi: Increase
 video mem limit
Message-ID: <Ysz0O5ZajnDm8Occ@carbon.gago.life>
References: <20220709073100.158374-1-petko.manolov@konsulko.com>
 <20220709073100.158374-2-petko.manolov@konsulko.com>
 <YsynnMUcdhDBIIIz@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YsynnMUcdhDBIIIz@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22-07-12 01:43:40, Laurent Pinchart wrote:
> Hi Petko,
> 
> Thank you for the patch.
> 
> On Sat, Jul 09, 2022 at 10:31:00AM +0300, Petko Manolov wrote:
> > Some high resolution (like Sony IMX492 47Mpix) sensors requre large amount space
> > for buffering.  64MB is far from sufficient so this patch increases the limit to
> > 512MB.
> > 
> > Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
> > ---
> >  drivers/staging/media/imx/imx7-media-csi.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
> > index 0066af8d111f..c62f893cd769 100644
> > --- a/drivers/staging/media/imx/imx7-media-csi.c
> > +++ b/drivers/staging/media/imx/imx7-media-csi.c
> > @@ -160,7 +160,7 @@
> >  
> >  #define IMX7_CSI_VIDEO_NAME		"imx-capture"
> >  /* In bytes, per queue */
> > -#define IMX7_CSI_VIDEO_MEM_LIMIT	SZ_64M
> > +#define IMX7_CSI_VIDEO_MEM_LIMIT	SZ_512M
> 
> The limit is really something that the V4L2 core should handle (or assist
> with). In the meantime,

Thanks for the review.

This "limit" isn't actually a limit, but a constant used in very few
calculations. Perhaps this is a number that will be better handled by more
knowledgeable part of the system.


		Petko


> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> >  #define IMX7_CSI_VIDEO_EOF_TIMEOUT	2000
> >  
> >  #define IMX7_CSI_DEF_MBUS_CODE		MEDIA_BUS_FMT_UYVY8_2X8
> 
> -- 
> Regards,
> 
> Laurent Pinchart
