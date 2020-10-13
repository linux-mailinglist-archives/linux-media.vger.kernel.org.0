Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7971028CACF
	for <lists+linux-media@lfdr.de>; Tue, 13 Oct 2020 11:13:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404196AbgJMJNI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Oct 2020 05:13:08 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:38993 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403911AbgJMJNI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Oct 2020 05:13:08 -0400
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 726CD200004;
        Tue, 13 Oct 2020 09:13:03 +0000 (UTC)
Date:   Tue, 13 Oct 2020 11:17:03 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Hugues FRUCHET <hugues.fruchet@st.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        Alain VOLMAT <alain.volmat@st.com>
Subject: Re: [PATCH v3] media: ov5640: add support of 160x120 resolution
Message-ID: <20201013091703.odh7sgmhj6fbt4zj@uno.localdomain>
References: <1602145756-4354-1-git-send-email-hugues.fruchet@st.com>
 <20201012153608.mex6m7qmjv7vy4s5@uno.localdomain>
 <aeb90bb7-d0b4-0620-c7ae-d1ba2f4186a3@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aeb90bb7-d0b4-0620-c7ae-d1ba2f4186a3@st.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hugues,

On Tue, Oct 13, 2020 at 08:48:41AM +0000, Hugues FRUCHET wrote:
> Hi Jacopo,
>
> On 10/12/20 5:36 PM, Jacopo Mondi wrote:
> > Hi Hugues,
> >
> > On Thu, Oct 08, 2020 at 10:29:16AM +0200, Hugues Fruchet wrote:
> >> Add support of 160x120 resolution.
> >>
> >> Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
> >
> > Looks good, the new mode works for me on a CSI-2 2 lanes setup
> >
> > Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> >
> >> ---
> >> version 3:
> >>    - fix wrong array affectation
> >>
> >> version 2:
> >>    - fix missing max framerate
> >>
> >>   drivers/media/i2c/ov5640.c | 26 +++++++++++++++++++++++++-
> >>   1 file changed, 25 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> >> index 8d0254d..40d6983 100644
> >> --- a/drivers/media/i2c/ov5640.c
> >> +++ b/drivers/media/i2c/ov5640.c
> >> @@ -98,7 +98,8 @@
> >>   #define OV5640_REG_AVG_READOUT		0x56a1
> >>
> >>   enum ov5640_mode_id {
> >> -	OV5640_MODE_QCIF_176_144 = 0,
> >> +	OV5640_MODE_QQVGA_160_120 = 0,
> >> +	OV5640_MODE_QCIF_176_144,
> >>   	OV5640_MODE_QVGA_320_240,
> >>   	OV5640_MODE_VGA_640_480,
> >>   	OV5640_MODE_NTSC_720_480,
> >> @@ -416,6 +417,24 @@ static const struct reg_value ov5640_setting_QVGA_320_240[] = {
> >>   	{0x3824, 0x02, 0, 0}, {0x5001, 0xa3, 0, 0},
> >>   };
> >>
> >> +static const struct reg_value ov5640_setting_QQVGA_160_120[] = {
> >> +	{0x3c07, 0x08, 0, 0},
> >> +	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
> >> +	{0x3814, 0x31, 0, 0},
> >> +	{0x3815, 0x31, 0, 0}, {0x3800, 0x00, 0, 0}, {0x3801, 0x00, 0, 0},
> >> +	{0x3802, 0x00, 0, 0}, {0x3803, 0x04, 0, 0}, {0x3804, 0x0a, 0, 0},
> >> +	{0x3805, 0x3f, 0, 0}, {0x3806, 0x07, 0, 0}, {0x3807, 0x9b, 0, 0},
> >> +	{0x3810, 0x00, 0, 0},
> >> +	{0x3811, 0x10, 0, 0}, {0x3812, 0x00, 0, 0}, {0x3813, 0x06, 0, 0},
> >> +	{0x3618, 0x00, 0, 0}, {0x3612, 0x29, 0, 0}, {0x3708, 0x64, 0, 0},
> >> +	{0x3709, 0x52, 0, 0}, {0x370c, 0x03, 0, 0}, {0x3a02, 0x03, 0, 0},
> >> +	{0x3a03, 0xd8, 0, 0}, {0x3a08, 0x01, 0, 0}, {0x3a09, 0x27, 0, 0},
> >> +	{0x3a0a, 0x00, 0, 0}, {0x3a0b, 0xf6, 0, 0}, {0x3a0e, 0x03, 0, 0},
> >> +	{0x3a0d, 0x04, 0, 0}, {0x3a14, 0x03, 0, 0}, {0x3a15, 0xd8, 0, 0},
> >> +	{0x4001, 0x02, 0, 0}, {0x4004, 0x02, 0, 0},
> >> +	{0x4407, 0x04, 0, 0}, {0x5001, 0xa3, 0, 0},
> >> +};
> >> +
> >>   static const struct reg_value ov5640_setting_QCIF_176_144[] = {
> >>   	{0x3c07, 0x08, 0, 0},
> >>   	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
> >> @@ -552,6 +571,11 @@ static const struct ov5640_mode_info ov5640_mode_init_data = {
> >>
> >>   static const struct ov5640_mode_info
> >>   ov5640_mode_data[OV5640_NUM_MODES] = {
> >> +	{OV5640_MODE_QQVGA_160_120, SUBSAMPLING,
> >> +	 160, 1896, 120, 984,
> >
> > These values do not match what's actually applied on the sensor, but
> > this is not only related to this patch.
> >
> > See ff66ea3a-bd2e-9bd6-894c-bf372de69a31@ti.com
> > I should try to re-submit Tomi's patch and the on-top clock rework.
>
> Thanks Jacopo, but there is a problem with link above about Tomi's patch.

Yeah, that's the message-id not a link, a link would be more useful I
agree:
https://lore.kernel.org/linux-media/d0510b81-9ae1-9b6f-02c5-f4eb08e67bfa@ti.com/

Thanks
  j
