Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 245A063A26A
	for <lists+linux-media@lfdr.de>; Mon, 28 Nov 2022 09:00:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229907AbiK1IAq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Nov 2022 03:00:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229730AbiK1IAo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Nov 2022 03:00:44 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8536364E9
        for <linux-media@vger.kernel.org>; Mon, 28 Nov 2022 00:00:42 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7678B501;
        Mon, 28 Nov 2022 09:00:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669622440;
        bh=peRoVpzLDoNZqmWFdTmtXryCrTmVgj/0c1IElMs1GF0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SVT/YSgIJlzhFqyEIm+3aqqgHSmJ/7JoD8t353H7TuBey75cduy/F6HSDvliAxLRA
         j1kG9Kav2kEnkW7J/cEB/a8wsVBMg6mt6f1Lx5H4JwXbn2WXfy8YewvlB5xblSCgAq
         cXG4ado1YYOFa470jpoCmxXiV3RijoyISm0jQY5w=
Date:   Mon, 28 Nov 2022 10:00:25 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Paul Elder <paul.elder@ideasonboard.com>,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com, eddy.khan@vergesense.com,
        paul.kocialkowski@bootlin.com, eugen.hristev@microchip.com
Subject: Re: [PATCH] media: ov5640: Fix analogue gain control
Message-ID: <Y4RqmfajEpTYQ27M@pendragon.ideasonboard.com>
References: <20221123095407.2393-1-laurent.pinchart@ideasonboard.com>
 <20221125091224.a6llcciylnz5rfg5@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221125091224.a6llcciylnz5rfg5@uno.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Nov 25, 2022 at 10:12:24AM +0100, Jacopo Mondi wrote:
> Hi Laurent
> 
> On Wed, Nov 23, 2022 at 11:54:07AM +0200, Laurent Pinchart wrote:
> > From: Paul Elder <paul.elder@ideasonboard.com>
> >
> > The ov5640 driver incorrectly uses V4L2_CID_GAIN for the analogue gain.
> > V4L2 has a specific control for analogue gain, V4L2_CID_ANALOGUE_GAIN.
> > Use it.
> >
> > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> It's a bit of a shame we cannot report here your analysis of the gain
> control handling on ov5640, so I'll link it here for reference

I think we can :-) I'll post a v2 with an expanded commit message.

> https://lists.libcamera.org/pipermail/libcamera-devel/2022-November/035655.html
> 
> I agree with the above conclusions, until proven differently we can
> consider 0x350a/b to control the analogue gain, as there's a separate
> digital gain register, hence the below change makes sense to me.
> 
> I've expanded the cc-list to who has been recently involved in ov5640
> developments. If required by any user, we should try to map
> CID_GAIN on CID_ANALOGUE_GAIN for compatibility.
> 
> From my side it's good the way it is:
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> 
> > ---
> >  drivers/media/i2c/ov5640.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> > index 2d740397a5d4..c65c391bc1eb 100644
> > --- a/drivers/media/i2c/ov5640.c
> > +++ b/drivers/media/i2c/ov5640.c
> > @@ -3458,7 +3458,7 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
> >  	/* Auto/manual gain */
> >  	ctrls->auto_gain = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_AUTOGAIN,
> >  					     0, 1, 1, 1);
> > -	ctrls->gain = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_GAIN,
> > +	ctrls->gain = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_ANALOGUE_GAIN,
> >  					0, 1023, 1, 0);
> >
> >  	ctrls->saturation = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_SATURATION,

-- 
Regards,

Laurent Pinchart
