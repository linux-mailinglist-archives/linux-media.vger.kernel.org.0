Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF1605507A3
	for <lists+linux-media@lfdr.de>; Sun, 19 Jun 2022 02:12:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231971AbiFSAMI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Jun 2022 20:12:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiFSAMH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Jun 2022 20:12:07 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93776FD26
        for <linux-media@vger.kernel.org>; Sat, 18 Jun 2022 17:12:05 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 781FC993;
        Sun, 19 Jun 2022 02:12:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655597523;
        bh=CuRAHsk9eTI8v2svoMzP6y0gKDOynw4ogxyv4PLWr4g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UEsX7UIOJUeGtNGUVl9R04C1kBdLIpabjUSA0c+JAtuuNCcNvBaEctNDZXzdRKPzX
         8e74GeI194YM+DGwgPM57j6j1NbrxflfsQL7fO8S2E/zIdv2fiN2KLWawSB+drqmYe
         Z4ON2aVasovG3dDmP8WbU4ZIAtg8Mzb86N9fsIok=
Date:   Sun, 19 Jun 2022 03:11:50 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: Re: [PATCH] media: mt9p031: Implement crop bounds get selection
Message-ID: <Yq5pxl8OPFJbWiFh@pendragon.ideasonboard.com>
References: <20220618222108.478082-1-marex@denx.de>
 <Yq5chmhukcvv2rGd@pendragon.ideasonboard.com>
 <42409710-0026-9051-bd31-6cdf7e2a7c51@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <42409710-0026-9051-bd31-6cdf7e2a7c51@denx.de>
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PDS_OTHER_BAD_TLD,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Jun 19, 2022 at 01:35:57AM +0200, Marek Vasut wrote:
> On 6/19/22 01:15, Laurent Pinchart wrote:
> > Hi Marek,
> > 
> > Thank you for the patch.
> > 
> > On Sun, Jun 19, 2022 at 12:21:08AM +0200, Marek Vasut wrote:
> >> Implement V4L2_SEL_TGT_CROP_BOUNDS query in get_selection subdev op
> >> for this sensor. This is required e.g. to bind it to STM32MP15x DCMI.
> >>
> >> Signed-off-by: Marek Vasut <marex@denx.de>
> >> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> >> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> >> Cc: Stefan Riedmueller <s.riedmueller@phytec.de>
> >> ---
> >>   drivers/media/i2c/mt9p031.c | 18 +++++++++++++-----
> >>   1 file changed, 13 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
> >> index cbce8b88dbcf5..e73e814c60207 100644
> >> --- a/drivers/media/i2c/mt9p031.c
> >> +++ b/drivers/media/i2c/mt9p031.c
> >> @@ -623,12 +623,20 @@ static int mt9p031_get_selection(struct v4l2_subdev *subdev,
> >>   {
> >>   	struct mt9p031 *mt9p031 = to_mt9p031(subdev);
> >>   
> >> -	if (sel->target != V4L2_SEL_TGT_CROP)
> >> +	switch (sel->target) {
> >> +	case V4L2_SEL_TGT_CROP_BOUNDS:
> >> +		sel->r.left = MT9P031_COLUMN_START_DEF;
> >> +		sel->r.top = MT9P031_ROW_START_DEF;
> > 
> > Shouldn't this be MT9P031_COLUMN_START_MIN and MT9P031_ROW_START_MIN ?
> > 
> >> +		sel->r.width = MT9P031_WINDOW_WIDTH_DEF;
> >> +		sel->r.height = MT9P031_WINDOW_HEIGHT_DEF;
> > 
> > And here MT9P031_WINDOW_WIDTH_MAX and MT9P031_WINDOW_HEIGHT_MAX ?
> 
> What makes you think that ?

https://linuxtv.org/downloads/v4l-dvb-apis/userspace-api/v4l/v4l2-selection-targets.html#v4l2-selection-targets

"Bounds of the crop rectangle. All valid crop rectangles fit inside the
crop bounds rectangle."

-- 
Regards,

Laurent Pinchart
