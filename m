Return-Path: <linux-media+bounces-17398-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D0E968EBC
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 22:07:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B240E2838B1
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 20:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B97152139A8;
	Mon,  2 Sep 2024 20:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="h3RNh8MR"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987D21AB6F3;
	Mon,  2 Sep 2024 20:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725307607; cv=none; b=KI+xkHyoAoHCMGfUghTgAh8T2saggTa6mxWGajITZ18W9Fvxm2cI043V3iKhQHX4WNYHUDdeb2PmqTg7nj+jVA4QqBq6/3I4lSkRBYeUugBrPZl3AxN/Vj773s8vDbSBFoM2Cq5Hfq4b9D8OVt3ZEm6ZjJvpDZdH1dL0562YbWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725307607; c=relaxed/simple;
	bh=NsEQey3zJtwiqME5qiEk/k0Is3t6hGH2+t6QVXSCcn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RRHXWW7zWnvv6eH/CnxyXf/gUSGQhtpihBVGoLRTmdj8VIoCn4natxULdQPp9bENXMc88tKYEzhkyM3r9T2ERuw4nWW/YX+DnjJDJRAW0OnXPlakit+fhQzWME/D7gimwlePYIwHNK+rtw5oq9W1EMa+x6nowNAsZIaY+CmtUvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=h3RNh8MR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 706CD4CE;
	Mon,  2 Sep 2024 22:05:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725307532;
	bh=NsEQey3zJtwiqME5qiEk/k0Is3t6hGH2+t6QVXSCcn4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h3RNh8MRraJQhJc+sRbC6fGL1LhgYzmP2Yq+EWAq7Vg5jOpgSk6Fok0CtkUNlMuJC
	 IhGCoMGtN8KKCPY8gGFYTPZ6fDLUmHyX5z/dqcgPO/2qg/HkyIvvdZSnEoVIRyu+Zv
	 XvpMjS46TST6QSudETBiKWFp7G5R29Htj+5rX9yY=
Date: Mon, 2 Sep 2024 23:06:10 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Benjamin Bara <bbara93@gmail.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Benjamin Bara <benjamin.bara@skidata.com>
Subject: Re: [PATCH v3 2/7] media: i2c: imx290: Define absolute control ranges
Message-ID: <20240902200610.GU1995@pendragon.ideasonboard.com>
References: <20240902-imx290-avail-v3-0-b32a12799fed@skidata.com>
 <20240902-imx290-avail-v3-2-b32a12799fed@skidata.com>
 <CAPY8ntCj=u4ZQJwjhvZF30x08Cf0h7R5yQTim7QCKd8bi_M08w@mail.gmail.com>
 <CAJpcXm5cLjvqkuCB25strgYaUo4p058yLAXg8+LZ_7T12+3-ug@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAJpcXm5cLjvqkuCB25strgYaUo4p058yLAXg8+LZ_7T12+3-ug@mail.gmail.com>

On Mon, Sep 02, 2024 at 09:43:36PM +0200, Benjamin Bara wrote:
> Hi Dave!
> 
> On Mon, 2 Sept 2024 at 20:00, Dave Stevenson
> <dave.stevenson@raspberrypi.com> wrote:
> > On Mon, 2 Sept 2024 at 16:58, <bbara93@gmail.com> wrote:
> > >
> > > From: Benjamin Bara <benjamin.bara@skidata.com>
> > >
> > > For now, the driver activates the first mode (1080p) as current active
> > > mode in probe(). This e.g. means that one cannot set VBLANK below 45
> > > (vmax_min - height), although theoretically the minimum is 30 (720p
> > > mode). Define the absolute possible/supported ranges to have them
> > > available later.
> >
> > Currently the driver will set the ranges for VBLANK and HBLANK
> > whenever the mode changes.
> >
> > How is it helpful to fake these numbers? Seeing as they aren't
> > reflecting anything useful, they may as well all be 0.
> >
> > > Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
> > > ---
> > > Changes since v2:
> > > - new
> > > ---
> > >  drivers/media/i2c/imx290.c | 36 ++++++++++++++++++++++++++++++++----
> > >  1 file changed, 32 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > > index 1c97f9650eb4..466492bab600 100644
> > > --- a/drivers/media/i2c/imx290.c
> > > +++ b/drivers/media/i2c/imx290.c
> > > @@ -499,6 +499,10 @@ static const struct imx290_clk_cfg imx290_720p_clock_config[] = {
> > >  };
> > >
> > >  /* Mode configs */
> > > +#define WIDTH_720P     1280
> > > +#define HEIGHT_720P    720

That's pure obfuscation :-) Just use the values directly.

> > > +#define MINIMUM_WIDTH  WIDTH_720P
> > > +#define MINIMUM_HEIGHT HEIGHT_720P

Driver-specific macros should have a driver-specific prefix.

> > >  static const struct imx290_mode imx290_modes_2lanes[] = {
> > >         {
> > >                 .width = 1920,
> > > @@ -512,8 +516,8 @@ static const struct imx290_mode imx290_modes_2lanes[] = {
> > >                 .clk_cfg = imx290_1080p_clock_config,
> > >         },
> > >         {
> > > -               .width = 1280,
> > > -               .height = 720,
> > > +               .width = WIDTH_720P,
> > > +               .height = HEIGHT_720P,
> > >                 .hmax_min = 3300,
> > >                 .vmax_min = 750,
> > >                 .link_freq_index = FREQ_INDEX_720P,
> > > @@ -537,8 +541,8 @@ static const struct imx290_mode imx290_modes_4lanes[] = {
> > >                 .clk_cfg = imx290_1080p_clock_config,
> > >         },
> > >         {
> > > -               .width = 1280,
> > > -               .height = 720,
> > > +               .width = WIDTH_720P,
> > > +               .height = HEIGHT_720P,
> > >                 .hmax_min = 3300,
> > >                 .vmax_min = 750,
> > >                 .link_freq_index = FREQ_INDEX_720P,
> > > @@ -846,6 +850,30 @@ static const char * const imx290_test_pattern_menu[] = {
> > >         "000/555h Toggle Pattern",
> > >  };
> > >
> > > +/* absolute supported control ranges */
> > > +#define HBLANK_MAX     (IMX290_HMAX_MAX - MINIMUM_WIDTH)
> > > +#define VBLANK_MAX     (IMX290_VMAX_MAX - MINIMUM_HEIGHT)

Here too.

> > > +static unsigned int imx290_get_blank_min(const struct imx290 *imx290, bool v)
> > > +{
> >
> > This function is never used in this patch. I'm surprised the compiler
> > doesn't throw an error on a static function not being used.
> > You first use it in patch 4 "Introduce initial "off" mode & link freq"
> >
> > > +       const struct imx290_mode *modes = imx290_modes_ptr(imx290);
> > > +       unsigned int min = UINT_MAX;
> > > +       int i;
> > > +
> > > +       for (i = 0; i < imx290_modes_num(imx290); i++) {
> > > +               unsigned int tmp;
> > > +
> > > +               if (v)
> > > +                       tmp = modes[i].hmax_min - modes[i].width;
> >
> > if (v)
> >    return h
> >
> > With the complete series my sensor comes up with controls defined as
> > vertical_blanking 0x009e0901 (int)    : min=280 max=261423 step=1
> > default=280 value=280
> > horizontal_blanking 0x009e0902 (int)    : min=30 max=64255 step=1
> > default=30 value=30
> >
> > Set the mode to 1080p and I get
> > vertical_blanking 0x009e0901 (int)    : min=45 max=261063 step=1
> > default=45 value=1169
> > horizontal_blanking 0x009e0902 (int)    : min=280 max=63615 step=1
> > default=280 value=280
> 
> The idea here is to have VBLANK=30 available in the initial "after
> probe" state of the sensor. VBLANK=30 is a valid value for 720p mode,
> but it cannot be set after probe, because the driver (not the user)
> decided that 1080 mode is active. The idea is to relax the ranges while
> the mode is not set. Once the mode is known, the values are tightened
> to the real mode-dependent values.
> 
> Kind regards
> Benjamin
> 
> >   Dave
> >
> > > +               else
> > > +                       tmp = modes[i].vmax_min - modes[i].height;
> > > +
> > > +               if (tmp < min)
> > > +                       min = tmp;
> > > +       }
> > > +
> > > +       return min;
> > > +}
> > > +
> > >  static void imx290_ctrl_update(struct imx290 *imx290,
> > >                                const struct imx290_mode *mode)
> > >  {

-- 
Regards,

Laurent Pinchart

