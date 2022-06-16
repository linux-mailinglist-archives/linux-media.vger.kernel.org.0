Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA19654D5D1
	for <lists+linux-media@lfdr.de>; Thu, 16 Jun 2022 02:10:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348987AbiFPAJP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 20:09:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348059AbiFPAJI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 20:09:08 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CE4B201AB
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 17:09:06 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id l126-20020a1c2584000000b0039c1a10507fso21600wml.1
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 17:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=V0+bHDqAzN33xqYoigDjqZmbsPLAADPQMkJ4ZriZ/lg=;
        b=aEMoZKTFaUYvECGKjIY/hA+orBanUWDnOiSEJSIXUOph9TvU5z9sYVA2qV4pQBSh19
         knOl5rfi08uHrtsnbn8TUIwAl15rCYvwAGSa/Kt0ZHrjKLXMq3Q1S72Q09A+lfWcaWwc
         30S0xecBGB2p/c9l9FP9Vc+Qt06bOdcDx2LomPVK6vsxpg+3uUQtdLVV8gkU9NutTju/
         auNKqJVhuRmqU84cjLefqCR2iGH/aUhSXTIJpab3qA2nooTypyiAErSB/74C80sqoifc
         /U0fl8xgY5UXXyxD/lwFk6X7QXsS6fLaAT6X2JFgThfjylZySBtp/Jx0jxQ+j7jBt4cx
         Lx0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=V0+bHDqAzN33xqYoigDjqZmbsPLAADPQMkJ4ZriZ/lg=;
        b=Pf22evCu0gBC8Rf63H8KkmbwjjYKKfV/TdakqurfD0kMEL1QZCU/CKf9Ob50rdv1Vg
         /+CdDDJeZU3BwrMil5bLmburcJyL74zkooqAqvhUzK/VCiMy3W95N9o91CLKeflSRwiB
         2LL5phhkxSDttK2AY9+eWbc1q8nvWKRP+2FP15DKUFb9eChmA2QJdBFHSuuDeWG91DZb
         SlnxTx04HaJbYA9tGPEk57a4ImqJDQMobCenPpXKmG4I1VZxNYdPoO6VRMNelhjgNMGX
         dKOH7m03OeH3yPrFAF+TG4LlyGV5zsxt3EVngjl01JUJurRSkuZIk4yoq3A/VgdKPJSx
         yiSQ==
X-Gm-Message-State: AOAM533bsac/enUzNdgAuj6scGnGCY1NEk05CiyoeMcDtTUyI4QEgNF7
        DgE0RxQfzLUvLXrPeRzkK8w=
X-Google-Smtp-Source: ABdhPJy5ih7sdS3bhZquUTC5pBU2OeHsSe1eyf1m2u53xo9zxbvzLjVa91fwpTV8r7Pm4GQt/Pt3jA==
X-Received: by 2002:a05:600c:35c1:b0:39c:7930:7b5b with SMTP id r1-20020a05600c35c100b0039c79307b5bmr12557799wmq.162.1655338144850;
        Wed, 15 Jun 2022 17:09:04 -0700 (PDT)
Received: from arch-thunder (a109-49-33-111.cpe.netcabo.pt. [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id h17-20020a05600c2cb100b00397393419e3sm4241788wmc.28.2022.06.15.17.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 17:09:04 -0700 (PDT)
Date:   Thu, 16 Jun 2022 01:09:02 +0100
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
        Paul Elder <paul.elder@ideasonboard.com>,
        kernel@pengutronix.de, linux-imx@nxp.com
Subject: Re: [PATCH 3/4] media: imx: imx-mipi-csis: Implement the
 .get_frame_desc() operation
Message-ID: <20220616000902.kact2q2rqb73dffd@arch-thunder>
References: <20220615192602.25472-1-laurent.pinchart@ideasonboard.com>
 <20220615192602.25472-4-laurent.pinchart@ideasonboard.com>
 <20220615235314.umyosoxusngzmvey@arch-thunder>
 <YqpyZOvD3f9MFq39@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YqpyZOvD3f9MFq39@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
        HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,
On Thu, Jun 16, 2022 at 02:59:32AM +0300, Laurent Pinchart wrote:
> Hi Rui,
> 
> On Thu, Jun 16, 2022 at 12:53:14AM +0100, Rui Miguel Silva wrote:
> > On Wed, Jun 15, 2022 at 10:26:01PM +0300, Laurent Pinchart wrote:
> > > The CSIS is connected to its sink through an SoC-specific gasket that
> > > needs to be configured. Depending on the platform, the gasket
> > > configuration requires knowing the CSI-2 DT. To provide the needed
> > > information, implement the .get_frame_desc() operation.
> > > 
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > >  drivers/media/platform/nxp/imx-mipi-csis.c | 27 ++++++++++++++++++++++
> > >  1 file changed, 27 insertions(+)
> > > 
> > > diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> > > index 8674aaad5fa0..905072871ed2 100644
> > > --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> > > +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> > > @@ -1160,6 +1160,32 @@ static int mipi_csis_set_fmt(struct v4l2_subdev *sd,
> > >  	return 0;
> > >  }
> > >  
> > > +static int mipi_csis_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> > > +				    struct v4l2_mbus_frame_desc *fd)
> > > +{
> > > +	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
> > > +	struct v4l2_mbus_frame_desc_entry *entry = &fd->entry[0];
> > 
> > Think that you should check *fd before use here, other than that.
> 
> fd isn't supposed to be null, the same way sd isn't, or the various
> format pointers passed to other subdev operations aren't. We don't check
> those either, that's why I haven't checked fd here.

Yeah, agree. Thanks.

Cheers,
   Rui

> 
> > Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
> > 
> > > +
> > > +	if (pad != CSIS_PAD_SOURCE)
> > > +		return -EINVAL;
> > > +
> > > +	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL;
> > > +	fd->num_entries = 1;
> > > +
> > > +	memset(entry, 0, sizeof(*entry));
> > > +
> > > +	mutex_lock(&csis->lock);
> > > +
> > > +	entry->flags = 0;
> > > +	entry->pixelcode = csis->csis_fmt->code;
> > > +	entry->bus.csi2.vc = 0;
> > > +	entry->bus.csi2.dt = csis->csis_fmt->data_type;
> > > +
> > > +	mutex_unlock(&csis->lock);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  static int mipi_csis_log_status(struct v4l2_subdev *sd)
> > >  {
> > >  	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
> > > @@ -1184,6 +1210,7 @@ static const struct v4l2_subdev_pad_ops mipi_csis_pad_ops = {
> > >  	.enum_mbus_code		= mipi_csis_enum_mbus_code,
> > >  	.get_fmt		= mipi_csis_get_fmt,
> > >  	.set_fmt		= mipi_csis_set_fmt,
> > > +	.get_frame_desc		= mipi_csis_get_frame_desc,
> > >  };
> > >  
> > >  static const struct v4l2_subdev_ops mipi_csis_subdev_ops = {
> 
> -- 
> Regards,
> 
> Laurent Pinchart
