Return-Path: <linux-media+bounces-41526-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB949B3F715
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 09:53:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 23EC21A85908
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 07:53:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C54112E7BCB;
	Tue,  2 Sep 2025 07:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JkajFgX9"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6262E7650;
	Tue,  2 Sep 2025 07:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756799591; cv=none; b=c/7odbuiNRA0vYeysAnoJH12iYjPeeJxTmyEAWI56kqVPYqo0xYep3ZIjIEvEM4c13RS9XLhbGWvI995W8GSMecInny+vxqsCFLVlqDIuqahUhzMqSCj3rRJJcKnJ2oLYS2JMF0SypS1ATRxM4eBXaVttQgKo4xvqi6DHB01OOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756799591; c=relaxed/simple;
	bh=pbOAkPhU9C1NlkUI7+2kdIrQmYlgLm/+UnUQyns5KZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=laSxu9hAZBLdYuUttJkDalgDC2xKkZVhX5Io52Q2/vHTFpqyGkOHUdz311VZsamdbk8RBQpmP1NQ8jXJgWGa2IH71MYh2e3ApMZvovv4/D21WzvEZCJnPdYnQ9DyQtzwm7kvd1uioUWnHLO3/Vp3vOx9CBzj9oUCHF+tMJmpTXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JkajFgX9; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756799590; x=1788335590;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=pbOAkPhU9C1NlkUI7+2kdIrQmYlgLm/+UnUQyns5KZk=;
  b=JkajFgX962HdWcFGCfQIdNxQokevn8eyhxwLNXNeXC+0mdu2zJoSsI3L
   eH9UIaVZp8H2qpT/tA4wTAYtj25wfivYswwYwuzuhTYo54UklM3SP57EP
   1JTrepPCAor35fRoUkOKs1eSXrVdlZiD6jvohlLF/UOGOI0dCOYAb4WAK
   BNUMsI7qIQrLi4m8WllaPKU6BCs9I/tmV7hcu9XlJyKqvgqoE0C4hxNbM
   X95HPoleyulojoJzuAfYdtt5MtG5CF9fX/eeMIUHiEYWK4jVX6agj01dE
   QWhAeqfFyw6vIvEYt4F1L/tD4FSXo6f5QA+STIjXbZZAY4bq6RLm6faZM
   Q==;
X-CSE-ConnectionGUID: LzaYjZgbQX6y+/oc9UT8zA==
X-CSE-MsgGUID: z48Ig+PzR62ofy9wVWFipg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="81642573"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="81642573"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 00:53:09 -0700
X-CSE-ConnectionGUID: VafrqJKgTtOyg3OFOE7GqA==
X-CSE-MsgGUID: FxldCUVuTpyzB8PTGKKUvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="194851096"
Received: from agladkov-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.32])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 00:53:04 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 7977F121F49;
	Tue, 02 Sep 2025 10:53:01 +0300 (EEST)
Date: Tue, 2 Sep 2025 10:53:01 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Matthias Fend <matthias.fend@emfend.at>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v9 2/2] media: i2c: add ov2735 image sensor driver
Message-ID: <aLaiXTw2cieUCzn_@kekkonen.localdomain>
References: <20250829090959.82966-1-hardevsinh.palaniya@siliconsignals.io>
 <20250829090959.82966-3-hardevsinh.palaniya@siliconsignals.io>
 <PN3P287MB18298FB93EDC498572742B2A8B07A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PN3P287MB18298FB93EDC498572742B2A8B07A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>

Hi Tarang, Hardev,

On Mon, Sep 01, 2025 at 06:44:46AM +0000, Tarang Raval wrote:
> Hi Hardev, Sakari
> 
> > Add a v4l2 subdevice driver for the Omnivision OV2735 sensor.
> > 
> > The Omnivision OV2735 is a 1/2.7-Inch CMOS image sensor with an
> > active array size of 1920 x 1080.
> > 
> > The following features are supported:
> > - Manual exposure an gain control support
> > - vblank/hblank control support
> > - Test pattern support control
> > - Supported resolution: 1920 x 1080 @ 30fps (SGRBG10)
> > 
> > Co-developed-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
> > Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
> > Signed-off-by: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
> > ---
> >  MAINTAINERS                |    1 +
> >  drivers/media/i2c/Kconfig  |   10 +
> >  drivers/media/i2c/Makefile |    1 +
> >  drivers/media/i2c/ov2735.c | 1109 ++++++++++++++++++++++++++++++++++++
> >  4 files changed, 1121 insertions(+)
> >  create mode 100644 drivers/media/i2c/ov2735.c
> 
> ...
>  
> > +static int ov2735_enum_mbus_code(struct v4l2_subdev *sd,
> > +                                struct v4l2_subdev_state *sd_state,
> > +                                struct v4l2_subdev_mbus_code_enum *code)
> > +{
> > +       if (code->index >= 0)
> 
> Hardev, I believe this condition is always true.
> 
> You should write:
> if (code->index > 0)
> 
> Sakari, Could you please remove the equals sign when you apply the patch? 

Done. I also switched it to container_of_const(); the diff is:

diff --git a/drivers/media/i2c/ov2735.c b/drivers/media/i2c/ov2735.c
index da5978b96146..b96600204141 100644
--- a/drivers/media/i2c/ov2735.c
+++ b/drivers/media/i2c/ov2735.c
@@ -402,7 +402,7 @@ static int ov2735_multi_reg_write(struct ov2735 *ov2735,
 
 static inline struct ov2735 *to_ov2735(struct v4l2_subdev *_sd)
 {
-	return container_of(_sd, struct ov2735, sd);
+	return container_of_const(_sd, struct ov2735, sd);
 }
 
 static int ov2735_enable_test_pattern(struct ov2735 *ov2735, u32 pattern)
@@ -428,8 +428,8 @@ static int ov2735_enable_test_pattern(struct ov2735 *ov2735, u32 pattern)
 
 static int ov2735_set_ctrl(struct v4l2_ctrl *ctrl)
 {
-	struct ov2735 *ov2735 = container_of(ctrl->handler, struct ov2735,
-					     handler);
+	struct ov2735 *ov2735 =
+		container_of_const(ctrl->handler, struct ov2735, handler);
 	struct v4l2_mbus_framefmt *fmt;
 	struct v4l2_subdev_state *state;
 	u64 vts;
@@ -697,7 +697,7 @@ static int ov2735_enum_mbus_code(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
 {
-	if (code->index >= 0)
+	if (code->index)
 		return -EINVAL;
 
 	code->code = MEDIA_BUS_FMT_SGRBG10_1X10;

-- 
Kind regards,

Sakari Ailus

