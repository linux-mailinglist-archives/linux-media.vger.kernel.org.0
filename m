Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACF8026D8B6
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 12:20:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726180AbgIQKUI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 06:20:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726656AbgIQKT5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 06:19:57 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A10FDC061788
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2020 03:19:45 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id x69so1587883lff.3
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2020 03:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=dxsrrpmvH2oMLWq8hD43pmmQstc/lovq2wdgwn2zxAA=;
        b=P807AanpiSdg0mX7MYwe4seIY3Iw5wpy0n7w73RHrZwIO2fOwbFTmXrWOY27rhSosY
         w2/H4G5agV/I48iHHAZ1oA6xDOoiXoJ1vAipXI0Wnwzy3u9XHy9IxgIOlzhEvTUpBtzi
         eI99jqwqpaPB6q3HhCt6o2HY1uJvfs8gVV4/vd3LQbIKK6NMvIGSFGzAeEoHPqQqF9i+
         urZb4T29sfTEd2NqKDscPKxg8qj3rCnt5LKfeD90jg/M9ITUQ7Nzi2QI03YkEUAIcl8H
         HGyTN3Uf8k77VTE2qxRsRd6ZTcBlM8mtgyB6ly4I8wNEXxDbKYasxFRvGi/iCcFb6qJR
         KA8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=dxsrrpmvH2oMLWq8hD43pmmQstc/lovq2wdgwn2zxAA=;
        b=gE9BEmsz+lFaSaYcncwjdBEjtjvYOFct2wPMoUZptmEYjV8YenLiEw13ya3iUFQbTr
         KWMlA77d0zcZzAnT5I3StahAKpj4iBNV5CYue9TouqOWTiVrBsbFiEBHc5uKnB6Bixr2
         WRcTfIdLxFld8/vQ7RwlUwUDdTQO5fXM19MzMfSESN747wb+lIfTv7iB1LdgYnIAo/49
         IVv6+ltoBdsYchHA3F8NL4Q9oKKvS6WDAKySy9WagRn0H/eZOf4kNQ/4tyDboIS40gko
         TTHdDcp4X7yTWtfxYMohxb3KMLJZfOMOdV0YJDJS243TEXUATZUs8LfYQ1333Je6W8V8
         9/Ow==
X-Gm-Message-State: AOAM530VB9SKU7ePAysEnFrqPiaVn795E9JUdzD7J6FXNwMB01kpXoft
        Ir33bIIhOap3LN5pa1n7eFZDdQ==
X-Google-Smtp-Source: ABdhPJxOatQTjlCFGl223jRgX6TWZgEull66SpHe55daMHVCkztKuWuyPDgXwrJ7tFUjn2gDE6XIqg==
X-Received: by 2002:ac2:419a:: with SMTP id z26mr8699974lfh.523.1600337983556;
        Thu, 17 Sep 2020 03:19:43 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id 189sm5980478ljj.54.2020.09.17.03.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 03:19:43 -0700 (PDT)
Date:   Thu, 17 Sep 2020 12:19:42 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH v3] media: rcar-vin: Enable YDS bit depending on
 bus_width and data_shift
Message-ID: <20200917101942.GA2382958@oden.dyn.berto.se>
References: <20200913181608.32077-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <a153e31a-4115-db74-9b21-3e0cbcd8993d@xs4all.nl>
 <be419827-86b4-8aa2-2c82-2c7e328889c3@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <be419827-86b4-8aa2-2c82-2c7e328889c3@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 2020-09-17 11:58:16 +0200, Hans Verkuil wrote:
> On 17/09/2020 10:57, Hans Verkuil wrote:
> > Hi Prabhakar,
> > 
> > Can you rebase this patch? It no longer applies.
> 
> Never mind, my mistake. When I was preparing this patch I also had this patch
> applied: https://patchwork.linuxtv.org/project/linux-media/patch/1595602732-25582-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com/
> 
> And that caused the conflict with this YDS patch.
> 
> However, I backed out the two renesas-vin-ycbcr-8b-g patches since there were a
> bunch comments for https://patchwork.linuxtv.org/project/linux-media/patch/1595602732-25582-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com/
> 
> So after dropping those two patches this YDS patch now applies fine and will
> be included in the PR.

Thanks for dropping the renesas-vin-ycbcr-8b-g patches from the PR, they 
really should not have been picked up as this patch address the issue in 
a nicer way. To ease your workload would you like me to collect VIN 
patches and send PR to you for that driver?

> 
> Sorry for the confusion,
> 
> 	Hans
> 
> > 
> > Regards,
> > 
> > 	Hans
> > 
> > On 13/09/2020 20:16, Lad Prabhakar wrote:
> >> Enable YDS bit if bus_width and data_shift is set to 8 in parallel mode
> >> for MEDIA_BUS_FMT_UYVY8_2X8 format.
> >>
> >> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> >> ---
> >> Changes for v3:
> >> * Dropped BIT macro
> >> * Introduced struct v4l2_fwnode_bus_parallel
> >>
> >> Changes for v2:
> >> * Dropped DT binding documentation patch
> >> * Select the data pins depending on bus-width and data-shift
> >>
> >> v1 -
> >> https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=323799
> >> ---
> >>  drivers/media/platform/rcar-vin/rcar-core.c |  9 ++++-----
> >>  drivers/media/platform/rcar-vin/rcar-dma.c  | 17 ++++++++++++++---
> >>  drivers/media/platform/rcar-vin/rcar-vin.h  |  5 +++--
> >>  3 files changed, 21 insertions(+), 10 deletions(-)
> >>
> >> diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
> >> index 7440c8965d27..1149ab76cf5c 100644
> >> --- a/drivers/media/platform/rcar-vin/rcar-core.c
> >> +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> >> @@ -626,12 +626,11 @@ static int rvin_parallel_parse_v4l2(struct device *dev,
> >>  
> >>  	switch (vin->parallel->mbus_type) {
> >>  	case V4L2_MBUS_PARALLEL:
> >> -		vin_dbg(vin, "Found PARALLEL media bus\n");
> >> -		vin->parallel->mbus_flags = vep->bus.parallel.flags;
> >> -		break;
> >>  	case V4L2_MBUS_BT656:
> >> -		vin_dbg(vin, "Found BT656 media bus\n");
> >> -		vin->parallel->mbus_flags = 0;
> >> +		vin_dbg(vin, "Found %s media bus\n",
> >> +			vin->parallel->mbus_type == V4L2_MBUS_PARALLEL ?
> >> +			"PARALLEL" : "BT656");
> >> +		vin->parallel->bus = vep->bus.parallel;
> >>  		break;
> >>  	default:
> >>  		vin_err(vin, "Unknown media bus type\n");
> >> diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
> >> index a5dbb90c5210..d067439b0b0d 100644
> >> --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> >> +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> >> @@ -125,6 +125,7 @@
> >>  #define VNDMR2_VPS		(1 << 30)
> >>  #define VNDMR2_HPS		(1 << 29)
> >>  #define VNDMR2_CES		(1 << 28)
> >> +#define VNDMR2_YDS		(1 << 22)
> >>  #define VNDMR2_FTEV		(1 << 17)
> >>  #define VNDMR2_VLV(n)		((n & 0xf) << 12)
> >>  
> >> @@ -698,16 +699,26 @@ static int rvin_setup(struct rvin_dev *vin)
> >>  
> >>  	if (!vin->is_csi) {
> >>  		/* Hsync Signal Polarity Select */
> >> -		if (!(vin->parallel->mbus_flags & V4L2_MBUS_HSYNC_ACTIVE_LOW))
> >> +		if (!(vin->parallel->bus.flags & V4L2_MBUS_HSYNC_ACTIVE_LOW))
> >>  			dmr2 |= VNDMR2_HPS;
> >>  
> >>  		/* Vsync Signal Polarity Select */
> >> -		if (!(vin->parallel->mbus_flags & V4L2_MBUS_VSYNC_ACTIVE_LOW))
> >> +		if (!(vin->parallel->bus.flags & V4L2_MBUS_VSYNC_ACTIVE_LOW))
> >>  			dmr2 |= VNDMR2_VPS;
> >>  
> >>  		/* Data Enable Polarity Select */
> >> -		if (vin->parallel->mbus_flags & V4L2_MBUS_DATA_ENABLE_LOW)
> >> +		if (vin->parallel->bus.flags & V4L2_MBUS_DATA_ENABLE_LOW)
> >>  			dmr2 |= VNDMR2_CES;
> >> +
> >> +		switch (vin->mbus_code) {
> >> +		case MEDIA_BUS_FMT_UYVY8_2X8:
> >> +			if (vin->parallel->bus.bus_width == 8 &&
> >> +			    vin->parallel->bus.data_shift == 8)
> >> +				dmr2 |= VNDMR2_YDS;
> >> +			break;
> >> +		default:
> >> +			break;
> >> +		}
> >>  	}
> >>  
> >>  	/*
> >> diff --git a/drivers/media/platform/rcar-vin/rcar-vin.h b/drivers/media/platform/rcar-vin/rcar-vin.h
> >> index c19d077ce1cb..8396e0e45478 100644
> >> --- a/drivers/media/platform/rcar-vin/rcar-vin.h
> >> +++ b/drivers/media/platform/rcar-vin/rcar-vin.h
> >> @@ -19,6 +19,7 @@
> >>  #include <media/v4l2-ctrls.h>
> >>  #include <media/v4l2-dev.h>
> >>  #include <media/v4l2-device.h>
> >> +#include <media/v4l2-fwnode.h>
> >>  #include <media/videobuf2-v4l2.h>
> >>  
> >>  /* Number of HW buffers */
> >> @@ -92,7 +93,7 @@ struct rvin_video_format {
> >>   * @asd:	sub-device descriptor for async framework
> >>   * @subdev:	subdevice matched using async framework
> >>   * @mbus_type:	media bus type
> >> - * @mbus_flags:	media bus configuration flags
> >> + * @bus:	media bus parallel configuration
> >>   * @source_pad:	source pad of remote subdevice
> >>   * @sink_pad:	sink pad of remote subdevice
> >>   *
> >> @@ -102,7 +103,7 @@ struct rvin_parallel_entity {
> >>  	struct v4l2_subdev *subdev;
> >>  
> >>  	enum v4l2_mbus_type mbus_type;
> >> -	unsigned int mbus_flags;
> >> +	struct v4l2_fwnode_bus_parallel bus;
> >>  
> >>  	unsigned int source_pad;
> >>  	unsigned int sink_pad;
> >>
> > 
> 

-- 
Regards,
Niklas Söderlund
