Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C1A24AC24E
	for <lists+linux-media@lfdr.de>; Mon,  7 Feb 2022 16:03:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241676AbiBGPA5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Feb 2022 10:00:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353256AbiBGOlK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Feb 2022 09:41:10 -0500
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 445BDC0401C2
        for <linux-media@vger.kernel.org>; Mon,  7 Feb 2022 06:41:07 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 1682E240005;
        Mon,  7 Feb 2022 14:40:59 +0000 (UTC)
Date:   Mon, 7 Feb 2022 15:42:06 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        Eugen.Hristev@microchip.com, jbrunet@baylibre.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 08/21] media: ov5640: Re-sort per-mode register tables
Message-ID: <20220207144206.hgy6m2d3uymno7io@uno.localdomain>
References: <20220131143245.128089-1-jacopo@jmondi.org>
 <20220131143245.128089-9-jacopo@jmondi.org>
 <YfmEk0WkdeJs8bda@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YfmEk0WkdeJs8bda@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Tue, Feb 01, 2022 at 09:05:55PM +0200, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Mon, Jan 31, 2022 at 03:32:32PM +0100, Jacopo Mondi wrote:
> > The per-mode register tables are not sorted by size. Fix it.
> >
> > Cosmetic change only.
> >
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >  drivers/media/i2c/ov5640.c | 18 +++++++++---------
> >  1 file changed, 9 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> > index bd14e2ad22f6..d966cca78e92 100644
> > --- a/drivers/media/i2c/ov5640.c
> > +++ b/drivers/media/i2c/ov5640.c
> > @@ -428,7 +428,7 @@ static const struct reg_value ov5640_init_setting_30fps_VGA[] = {
> >  	{0x3a1f, 0x14, 0, 0}, {0x3008, 0x02, 0, 0}, {0x3c00, 0x04, 0, 300},
> >  };
> >
> > -static const struct reg_value ov5640_setting_VGA_640_480[] = {
> > +static const struct reg_value ov5640_setting_QQVGA_160_120[] = {
> >  	{0x3c07, 0x08, 0, 0},
> >  	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
> >  	{0x3814, 0x31, 0, 0},
> > @@ -439,11 +439,10 @@ static const struct reg_value ov5640_setting_VGA_640_480[] = {
> >  	{0x3a0a, 0x00, 0, 0}, {0x3a0b, 0xf6, 0, 0}, {0x3a0e, 0x03, 0, 0},
> >  	{0x3a0d, 0x04, 0, 0}, {0x3a14, 0x03, 0, 0}, {0x3a15, 0xd8, 0, 0},
> >  	{0x4001, 0x02, 0, 0}, {0x4004, 0x02, 0, 0},
> > -	{0x4407, 0x04, 0, 0}, {0x460b, 0x35, 0, 0}, {0x460c, 0x22, 0, 0},
> > -	{0x3824, 0x02, 0, 0}, {0x5001, 0xa3, 0, 0},
> > +	{0x4407, 0x04, 0, 0}, {0x5001, 0xa3, 0, 0},
> >  };
> >
> > -static const struct reg_value ov5640_setting_XGA_1024_768[] = {
> > +static const struct reg_value ov5640_setting_QCIF_176_144[] = {
> >  	{0x3c07, 0x08, 0, 0},
> >  	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
> >  	{0x3814, 0x31, 0, 0},
> > @@ -473,7 +472,7 @@ static const struct reg_value ov5640_setting_QVGA_320_240[] = {
> >  	{0x3824, 0x02, 0, 0}, {0x5001, 0xa3, 0, 0},
> >  };
> >
> > -static const struct reg_value ov5640_setting_QQVGA_160_120[] = {
> > +static const struct reg_value ov5640_setting_VGA_640_480[] = {
> >  	{0x3c07, 0x08, 0, 0},
> >  	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
> >  	{0x3814, 0x31, 0, 0},
> > @@ -484,10 +483,11 @@ static const struct reg_value ov5640_setting_QQVGA_160_120[] = {
> >  	{0x3a0a, 0x00, 0, 0}, {0x3a0b, 0xf6, 0, 0}, {0x3a0e, 0x03, 0, 0},
> >  	{0x3a0d, 0x04, 0, 0}, {0x3a14, 0x03, 0, 0}, {0x3a15, 0xd8, 0, 0},
> >  	{0x4001, 0x02, 0, 0}, {0x4004, 0x02, 0, 0},
> > -	{0x4407, 0x04, 0, 0}, {0x5001, 0xa3, 0, 0},
> > +	{0x4407, 0x04, 0, 0}, {0x460b, 0x35, 0, 0}, {0x460c, 0x22, 0, 0},
> > +	{0x3824, 0x02, 0, 0}, {0x5001, 0xa3, 0, 0},
> >  };
> >
> > -static const struct reg_value ov5640_setting_QCIF_176_144[] = {
> > +static const struct reg_value ov5640_setting_NTSC_720_480[] = {
> >  	{0x3c07, 0x08, 0, 0},
> >  	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
> >  	{0x3814, 0x31, 0, 0},
> > @@ -502,7 +502,7 @@ static const struct reg_value ov5640_setting_QCIF_176_144[] = {
> >  	{0x3824, 0x02, 0, 0}, {0x5001, 0xa3, 0, 0},
> >  };
> >
> > -static const struct reg_value ov5640_setting_NTSC_720_480[] = {
> > +static const struct reg_value ov5640_setting_PAL_720_576[] = {
> >  	{0x3c07, 0x08, 0, 0},
> >  	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
> >  	{0x3814, 0x31, 0, 0},
> > @@ -517,7 +517,7 @@ static const struct reg_value ov5640_setting_NTSC_720_480[] = {
> >  	{0x3824, 0x02, 0, 0}, {0x5001, 0xa3, 0, 0},
> >  };
> >
> > -static const struct reg_value ov5640_setting_PAL_720_576[] = {
> > +static const struct reg_value ov5640_setting_XGA_1024_768[] = {
> >  	{0x3c07, 0x08, 0, 0},
> >  	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
> >  	{0x3814, 0x31, 0, 0},
>
> Is it me, or does this mean that ov5640_setting_XGA_1024_768,
> ov5640_setting_QCIF_176_144, ov5640_setting_PAL_720_576 and
> ov5640_setting_NTSC_720_480 are all identical ?
>

Ah! Fun, I didn't realize!
meaning I've not re-looked at this patch after I formatted it :D

yes they are!
There likely are more opportunities to remove more black magic tables
then. I wonder in what the other modes differ now. I'll investigate, I
wish we could remove the ov5640_setting_XXX tables completely, that
would be great if we can almost fully control the sensor programming
sequence and not rely on opaque tables!

> --
> Regards,
>
> Laurent Pinchart
