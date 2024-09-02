Return-Path: <linux-media+bounces-17402-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A466E968F25
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 23:17:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C941B1C223A9
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 21:17:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D61D186E38;
	Mon,  2 Sep 2024 21:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IdnzTVw1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D151CD2B;
	Mon,  2 Sep 2024 21:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725311862; cv=none; b=dVwqvhaICDbHOpzeFOGLKf15XHoY0XWL91jpkPepZrGfcRpAZpZ69arOW1znQtVgGpjhoEkLadJZEHjuTlTmGlY27O5gugaEZTrcLR7hXZxeZHmDq6X30CQMuUtTJyqavQctV/jIEflrVtqAPqs7ymJhFd0PsC+02mw/MqWFbMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725311862; c=relaxed/simple;
	bh=80aPDSnGNAQD7IqO7/1IaAaLRuff8y24141lFwKXRpg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c6SLwCryKYUd7Bc+++WuMF2GAiJH3Bi8L9kQ0dC846dCwbIgEw9qPp3eMG2qbbCVzF9X1HAfBgaUcOD7hDRw+UiS35hdEdFRE5LK9Dh0N3Em5ynbnd1dvJ8/wHJur8CD7jSKrrra+jWvsoUU9pMXB5kutx5XXCB/rwAjB6zc/24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IdnzTVw1; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2f409c87b07so58218151fa.0;
        Mon, 02 Sep 2024 14:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725311859; x=1725916659; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CKib6jKP2mrCyM+V29AlCtiUJQjLQa5Et0ZRvZUbC/o=;
        b=IdnzTVw1Anjgfd96f4vTMo4phTj7Db9OZq1CCJmrZGiPY0e/+6ierocAwhVykY2QJU
         CB/N6Wy5j3AFlNlCjsncnpXtCkdOdeFEwGwGSjPfLyet7sVryLOKoAim1mWpVZPGLsaz
         Hs0xpuhLvzi0XH5jj8eyEwG5y1G729NB0VmT5W8It24aO6l2sYIjop5L1ENoqeDXXu7f
         5QyGAF5Mh4qKReDYBgJV8Li8ByiJRnh//Ss0hPPJVx3JgWtyM/nM5D+kXnQpT/SNetee
         tnuk88lB7SQGiv7sWK1Iz1u5R4WoHiVhHdNOVwPIwi1bog9zFBCRaZqizvZGrHHQJ2Gz
         6upg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725311859; x=1725916659;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CKib6jKP2mrCyM+V29AlCtiUJQjLQa5Et0ZRvZUbC/o=;
        b=V6mqvJldPskMWHTKerns+JP9tvXITBVbesEcMQP3Nl5bb6Y46rZRVPHHzGYn4mEEUY
         d5QQk1vHJINSi95lncBwVAtAWRnZesXerrBzwUdy9tUUi13xAfUbWcHnllxqAqYaoGKL
         Rvjjmiib2f5FmsO7L0i2rtLQ8ukl8CUE/ul0yY96oKpvkFQEZWHkTrMwLpGiFjexwfgs
         TMPPyYlZVttshuWsgMxNRXrxFpP21Pn2yjOApoBFkuwbmhCgtkvvxpIhkdYM5E9lrFVb
         bzoSJm5QGp62KvulKJGTB1Yt/XPesX4Sijq6WLqVyBgr8pLe4hqhrz20YQBUpQ53Vvgf
         aViw==
X-Forwarded-Encrypted: i=1; AJvYcCUv0aBjQJxiN6pkCqM4/kBxh+4CONnHpuigmsqRGhSJPj6JrXUBVdRlChLqZh10G8gNd2/7xv4jHMY4zzc=@vger.kernel.org, AJvYcCVPLIoWlnogdgGrGYJt5K1uZBM1kni49ZioQOInUkWwUYuYTCNTjf3dZC3ipykPXaEcxcQGg2Rs44JSUco=@vger.kernel.org
X-Gm-Message-State: AOJu0YzflMESP3QbFz8mc7ajZ461dtgDH8NgLmrWDxciaFf6rH5R2KWS
	0iBFjmtUixYnj8N9d7t55xbLGuTJL56ZzgKLetYanbT7AZ7IQc6509seXVU0xGGwddm4sjQK/Qn
	tK+F5MAf/rUlOcH8NnDD/T0Wyf/o=
X-Google-Smtp-Source: AGHT+IHSLLp0w3QEjIlzTm2Te9eaMN4ikgNsM5+wEmQ5/vUch+lvWml4KpNwpeyIaDLH+D2XC8YkE9j9PUIMLaw5ZXk=
X-Received: by 2002:a2e:4602:0:b0:2ee:80b2:1e99 with SMTP id
 38308e7fff4ca-2f6265ea66cmr51725811fa.44.1725311858409; Mon, 02 Sep 2024
 14:17:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240902-imx290-avail-v3-0-b32a12799fed@skidata.com>
 <20240902-imx290-avail-v3-2-b32a12799fed@skidata.com> <CAPY8ntCj=u4ZQJwjhvZF30x08Cf0h7R5yQTim7QCKd8bi_M08w@mail.gmail.com>
 <CAJpcXm5cLjvqkuCB25strgYaUo4p058yLAXg8+LZ_7T12+3-ug@mail.gmail.com> <20240902200610.GU1995@pendragon.ideasonboard.com>
In-Reply-To: <20240902200610.GU1995@pendragon.ideasonboard.com>
From: Benjamin Bara <bbara93@gmail.com>
Date: Mon, 2 Sep 2024 23:17:27 +0200
Message-ID: <CAJpcXm6KiSgzxJ+AuC2gatSDmYZJhoEuKyF1QGCficJbYDuDmg@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] media: i2c: imx290: Define absolute control ranges
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Benjamin Bara <benjamin.bara@skidata.com>
Content-Type: text/plain; charset="UTF-8"

Hi Laurent!

On Mon, 2 Sept 2024 at 22:06, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Sep 02, 2024 at 09:43:36PM +0200, Benjamin Bara wrote:
> > On Mon, 2 Sept 2024 at 20:00, Dave Stevenson
> > <dave.stevenson@raspberrypi.com> wrote:
> > > On Mon, 2 Sept 2024 at 16:58, <bbara93@gmail.com> wrote:
> > > >
> > > > From: Benjamin Bara <benjamin.bara@skidata.com>
> > > >
> > > > For now, the driver activates the first mode (1080p) as current active
> > > > mode in probe(). This e.g. means that one cannot set VBLANK below 45
> > > > (vmax_min - height), although theoretically the minimum is 30 (720p
> > > > mode). Define the absolute possible/supported ranges to have them
> > > > available later.
> > >
> > > Currently the driver will set the ranges for VBLANK and HBLANK
> > > whenever the mode changes.
> > >
> > > How is it helpful to fake these numbers? Seeing as they aren't
> > > reflecting anything useful, they may as well all be 0.
> > >
> > > > Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
> > > > ---
> > > > Changes since v2:
> > > > - new
> > > > ---
> > > >  drivers/media/i2c/imx290.c | 36 ++++++++++++++++++++++++++++++++----
> > > >  1 file changed, 32 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > > > index 1c97f9650eb4..466492bab600 100644
> > > > --- a/drivers/media/i2c/imx290.c
> > > > +++ b/drivers/media/i2c/imx290.c
> > > > @@ -499,6 +499,10 @@ static const struct imx290_clk_cfg imx290_720p_clock_config[] = {
> > > >  };
> > > >
> > > >  /* Mode configs */
> > > > +#define WIDTH_720P     1280
> > > > +#define HEIGHT_720P    720
>
> That's pure obfuscation :-) Just use the values directly.
>
> > > > +#define MINIMUM_WIDTH  WIDTH_720P
> > > > +#define MINIMUM_HEIGHT HEIGHT_720P
>
> Driver-specific macros should have a driver-specific prefix.
>
> > > >  static const struct imx290_mode imx290_modes_2lanes[] = {
> > > >         {
> > > >                 .width = 1920,
> > > > @@ -512,8 +516,8 @@ static const struct imx290_mode imx290_modes_2lanes[] = {
> > > >                 .clk_cfg = imx290_1080p_clock_config,
> > > >         },
> > > >         {
> > > > -               .width = 1280,
> > > > -               .height = 720,
> > > > +               .width = WIDTH_720P,
> > > > +               .height = HEIGHT_720P,
> > > >                 .hmax_min = 3300,
> > > >                 .vmax_min = 750,
> > > >                 .link_freq_index = FREQ_INDEX_720P,
> > > > @@ -537,8 +541,8 @@ static const struct imx290_mode imx290_modes_4lanes[] = {
> > > >                 .clk_cfg = imx290_1080p_clock_config,
> > > >         },
> > > >         {
> > > > -               .width = 1280,
> > > > -               .height = 720,
> > > > +               .width = WIDTH_720P,
> > > > +               .height = HEIGHT_720P,
> > > >                 .hmax_min = 3300,
> > > >                 .vmax_min = 750,
> > > >                 .link_freq_index = FREQ_INDEX_720P,
> > > > @@ -846,6 +850,30 @@ static const char * const imx290_test_pattern_menu[] = {
> > > >         "000/555h Toggle Pattern",
> > > >  };
> > > >
> > > > +/* absolute supported control ranges */
> > > > +#define HBLANK_MAX     (IMX290_HMAX_MAX - MINIMUM_WIDTH)
> > > > +#define VBLANK_MAX     (IMX290_VMAX_MAX - MINIMUM_HEIGHT)
>
> Here too.

Thanks for the feedback but I will drop this patch. As we need to decide
on a link frequency, we need to decide on one of the two "all pixel"
modes the imx290 supports and therefore already know the mode-specific,
tight ranges starting from probe time.

Kind regards
Benjamin

> > > > +static unsigned int imx290_get_blank_min(const struct imx290 *imx290, bool v)
> > > > +{
> > >
> > > This function is never used in this patch. I'm surprised the compiler
> > > doesn't throw an error on a static function not being used.
> > > You first use it in patch 4 "Introduce initial "off" mode & link freq"
> > >
> > > > +       const struct imx290_mode *modes = imx290_modes_ptr(imx290);
> > > > +       unsigned int min = UINT_MAX;
> > > > +       int i;
> > > > +
> > > > +       for (i = 0; i < imx290_modes_num(imx290); i++) {
> > > > +               unsigned int tmp;
> > > > +
> > > > +               if (v)
> > > > +                       tmp = modes[i].hmax_min - modes[i].width;
> > >
> > > if (v)
> > >    return h
> > >
> > > With the complete series my sensor comes up with controls defined as
> > > vertical_blanking 0x009e0901 (int)    : min=280 max=261423 step=1
> > > default=280 value=280
> > > horizontal_blanking 0x009e0902 (int)    : min=30 max=64255 step=1
> > > default=30 value=30
> > >
> > > Set the mode to 1080p and I get
> > > vertical_blanking 0x009e0901 (int)    : min=45 max=261063 step=1
> > > default=45 value=1169
> > > horizontal_blanking 0x009e0902 (int)    : min=280 max=63615 step=1
> > > default=280 value=280
> >
> > The idea here is to have VBLANK=30 available in the initial "after
> > probe" state of the sensor. VBLANK=30 is a valid value for 720p mode,
> > but it cannot be set after probe, because the driver (not the user)
> > decided that 1080 mode is active. The idea is to relax the ranges while
> > the mode is not set. Once the mode is known, the values are tightened
> > to the real mode-dependent values.
> >
> > Kind regards
> > Benjamin
> >
> > >   Dave
> > >
> > > > +               else
> > > > +                       tmp = modes[i].vmax_min - modes[i].height;
> > > > +
> > > > +               if (tmp < min)
> > > > +                       min = tmp;
> > > > +       }
> > > > +
> > > > +       return min;
> > > > +}
> > > > +
> > > >  static void imx290_ctrl_update(struct imx290 *imx290,
> > > >                                const struct imx290_mode *mode)
> > > >  {
>
> --
> Regards,
>
> Laurent Pinchart

