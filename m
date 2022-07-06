Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D778A56929B
	for <lists+linux-media@lfdr.de>; Wed,  6 Jul 2022 21:26:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233654AbiGFT05 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jul 2022 15:26:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231397AbiGFT04 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jul 2022 15:26:56 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD9C028728
        for <linux-media@vger.kernel.org>; Wed,  6 Jul 2022 12:26:55 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id ay16so28794324ejb.6
        for <linux-media@vger.kernel.org>; Wed, 06 Jul 2022 12:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kz2fPk7iWkA/5dOWP2bMBM4zt6KfjrMR9AJN6WUaXpc=;
        b=laEiwEWVZ3tj8BMll5uvtasx6CKEktjmVD7WGGlvBmR9rprU3cSgM7vOnbxrNChTpw
         aixRu0a93daXakJZOdhEiePVOaxLuNKk3ZdYsDfpqxKpSE6Kk6zL3C9tP6sXcDfQgvZt
         R4sxc0XfTcoDcuZayDbi34y9pYq3LlDmTTijg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kz2fPk7iWkA/5dOWP2bMBM4zt6KfjrMR9AJN6WUaXpc=;
        b=GGl60zbk5wVINhO4B5YvkVL4aMbfkcwCgDWu7QnmN951Ay9z3KzPo82WtPsDiPKmgK
         fwpAA4GZUvqoOYKVpr2jGGyWczGwaM9rd24XtRnYwSd4Wb5bwTJjp6PUWbt+F5lxEO9W
         A21essZfX4bf3/BvZhDDzaN1pesN+Y2nJq9LL1uEbA19OqqH4lDcno1aGji+rXwJxEfL
         40fitMPh43eZ4Nn5xKDeInYWLdq7FBVvk2HxcYOeuCAHdk5SQ4oij3U46jpZajObx+b1
         ZCAslwGnLVMZVPxJmF/lyw0YnHUPiN33EaDkEvEm8iZYvxDBQ67X/MR02XPQD54Qqs4O
         uIiA==
X-Gm-Message-State: AJIora++s8mKXGd7OIAHNYs6etXivFUhir1DvseqkeMBJAjNvrB0H25K
        tkRLcbJzOaPeEJaDadya3IT4n6dovxxn7w==
X-Google-Smtp-Source: AGRyM1uOTvxLZRGBdGnuBrl3psEa9ISZXW4Dww8mSZrztpUqStedvgyHH+VXw64sjS2FKgqBVxDehw==
X-Received: by 2002:a17:907:968f:b0:726:9f9b:ab0f with SMTP id hd15-20020a170907968f00b007269f9bab0fmr41894967ejc.237.1657135614296;
        Wed, 06 Jul 2022 12:26:54 -0700 (PDT)
Received: from carbon.gago.life (78-83-68-78.spectrumnet.bg. [78.83.68.78])
        by smtp.gmail.com with ESMTPSA id n18-20020a05640204d200b00435a08a3557sm26427737edw.27.2022.07.06.12.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 12:26:53 -0700 (PDT)
Date:   Wed, 6 Jul 2022 22:26:53 +0300
From:   Petko Manolov <petko.manolov@konsulko.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-media@vger.kernel.org, jacopo@jmondi.org
Subject: Re: Re: Re: hooking Sony 47MPixel sensor to NXP imx8m-mini MIPI CSI2
Message-ID: <YsXh/arQZXnaeGAi@carbon.gago.life>
References: <YrwFf7Jw2/yDlcDq@carbon.lan>
 <12352558.O9o76ZdvQC@steina-w>
 <YsRVAV8a48CwpaSY@p310.k.g>
 <2450654.irdbgypaU6@steina-w>
 <YsWJBEPhp9WhiYe1@p310.k.g>
 <YsWTXnTpeM+mCImc@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YsWTXnTpeM+mCImc@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22-07-06 16:51:26, Laurent Pinchart wrote:
> Hi Petko,
> 
> On Wed, Jul 06, 2022 at 04:07:16PM +0300, Petko Manolov wrote:
> > On 22-07-06 08:18:20, Alexander Stein wrote:
> > > 
> > > Thanks! Indeed at a first glance it looks straight forward. I was trying
> > > to get an imx327 running on a imx8mm, called TQMa8MxML. See [1] for some
> > > details. The cover letter describes the config setup. The media-ctl
> > > commands might help your setup. Note the settle times are an ugly bitch
> > > and are crucial to be set on my board, but I'm not sure why they have to
> > > be that way. Patch 1-8 are obsolete by now with the updates to
> > > drivers/media/platform/nxp/ imx-mipi-csis.c. Patch 9 might help you
> > > configure the DT.
> > 
> > Right, media-ctl is it.  In fact the pipelines have been properly set up so
> > i only had to change the format.  The attached media graph is below
> > 
> > Now, there are two problems i'm stumbling upon.  One is related to the
> > capture device not actually supporting imx492 format(s), which are:
> > 
> > 	MEDIA_BUS_FMT_SGBRG10_1X10 MEDIA_BUS_FMT_SGBRG12_1X12
> > 
> > which i guess is why i am being greeted with (when using v4l2-ctl):
> > 
> > 	imx7-csi 32e20000.csi: capture format not valid
> > 
> > When i manually force it to something that is actually supported,
> > MEDIA_BUS_FMT_SGBRG16_1X16, i get:
> > 
> > 	imx7-csi 32e20000.csi: pipeline start failed with -67
> > 
> > Since this isn't one of the usual error numbers i guess it comes from within
> > the driver code.  I might be getting this error because the source is 12 bit
> > while the sink is 16 and i am breaking something, dunno.
> > 
> > Shall i go ahead and add MEDIA_BUS_FMT_SGBRG12_1X12 to the capture driver or
> > i am missing something here?
> 
> I had a quick look at the imx7-media-csi driver, and I think it supports 1-bit
> bayer correctly. You need to use the MEDIA_BUS_FMT_SGBRG10_1X10 or
> MEDIA_BUS_FMT_SGBRG12_1X12 media bus formats through the pipeline, and the
> V4L2_PIX_FMT_SGBRG16 pixel format on the video captude node. If that doesn't

Well, it does work, but is there a reason MEDIA_BUS_FMT_SGBRG12_1X12 can't be
used instead of V4L2_PIX_FMT_SGBRG16?  I can see the capture node does not
support the former, but don't understand the logic behind.

Again, i'm no expert in the field...

> > The other problem is when v4l2 tries to allocate buffer for even a single
> > frame.  This is 8192x5556 10/12bit bayer sensor and, maybe not surprisingly
> > i get "buffer allocation failed".  Is it possible that i'm the first to step
> > on this issue on imx8m-mini or in general?
> 
> You may want to increase the size of the CMA in the kernel configuration (or
> on the kernel command line).

Well, this one was some sort of fun.  After debugging videobuf2-core.c it turned
out the culprit is in imx-media-capture.c (via call_qop(q, queue_setup, ...))
calls.

VID_MEM_LIMIT is only 64MB while the image is ~90MB, but it looks like four of
those are required.  I increased the CMA to 640MB, defined VID_MEM_LIMIT to
512MB and got something that look like it's working.  I am yet to convert the
raw image to something pleasant for human eye...

I am not entirely convinced the above approach is the correct one.  OTOH,
something needs to be done for large resolution sensors.  Ideas?


cheers,
Petko
