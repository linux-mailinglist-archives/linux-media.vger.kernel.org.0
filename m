Return-Path: <linux-media+bounces-50138-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C461CFE02E
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 14:41:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 48B67307CE4F
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 13:36:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E50133F364;
	Wed,  7 Jan 2026 13:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VZqe0JAp"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29ABD33EB0A;
	Wed,  7 Jan 2026 13:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767792997; cv=none; b=qe388VwBe5NrmE0e7TumYOMDF7Ghyil5P0tGBoGhwtuo8TJIBz/8uNqqBIVKuwGR0jnkwRjLYfktRuq1BIv9JqKLmVwxI7/LIm2kzM66tSnEcTbKflDOG0uW55aXI+8H8aVJgpX5ZbZVGILP6wCm/i/YO37aPxK4l166wK535Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767792997; c=relaxed/simple;
	bh=5v6FyRxHJcd6yBaWtKXdII4MCpnFH5zMXKpCRzlg/pA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iPxjgC7lR6yqBfv6mhTZQkgMiQvoItHy7D7vq5AUcgYhcyaS0ZE6iR3MkJ4KPciKpzaY+wjIWcwpwyIhADttadQFyqMedEOihYCTMXIQ2xDp0ahPNvMXIZ1IqVp4fXob6t/2BONt7hw1QEWgocgeDW8/+0nlFS3s4nd4Abn4wvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VZqe0JAp; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767792995; x=1799328995;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=5v6FyRxHJcd6yBaWtKXdII4MCpnFH5zMXKpCRzlg/pA=;
  b=VZqe0JAp3OSIMxhoeLf/nf/Ke12l0k7gdDAJTKu0lAqTbZmyGKXOjXg8
   wknkeCWUfxqlHXAg9ZgN9z9lMWEgMcGTgmkB1XPv7kZV0Zxiuf6QXubjN
   QDUrEJWdhdm+6bIIMGGEH7Iujpeb+Zw8d/mhEE1wSReh4gsLL9y7pxack
   GIDDqxWSCL3or7pDMjwOq8bhQObGWdo0KVOF+2/NidcYLJN+/DVJMfiwb
   9gz19gd504GlcsyRVxzTBGpGamBKq7Q+IEBuRJ2FjefrSxQasTzDN47Rx
   A5Syg8VMQyEt90bfUXD4/oYzk0lMdR5qbTJqEZLogyxBxiUWvi4YfYhgT
   Q==;
X-CSE-ConnectionGUID: tdTvoEsfTI26obEeiM11Nw==
X-CSE-MsgGUID: lIBziKKaQWOB3uhPpoM6bQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="86747750"
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; 
   d="scan'208";a="86747750"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 05:36:34 -0800
X-CSE-ConnectionGUID: j7MIqVFSTk+wQS9dsFXLhg==
X-CSE-MsgGUID: mamNXkKWTQm65Lxa6qbAOA==
X-ExtLoop1: 1
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.143])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 05:36:32 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 602FA121D80;
	Wed, 07 Jan 2026 15:36:46 +0200 (EET)
Date: Wed, 7 Jan 2026 15:36:46 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Wenmeng Liu <quic_wenmliu@quicinc.com>
Subject: Re: [PATCH] media: i2c: imx412: Extend the power-on waiting time
Message-ID: <aV5hbvzYxKpV5OzO@kekkonen.localdomain>
References: <20251222-imx412-v1-1-51c7e724b376@oss.qualcomm.com>
 <aUkLKECix4vohyTB@kekkonen.localdomain>
 <bbf6dbc9-42b5-4dd6-9346-c8f38e460709@oss.qualcomm.com>
 <CAPY8ntD9GO_Y13K=Ko5kxz-o1edaocJP=Ns50rUheJP0iJ9fNg@mail.gmail.com>
 <ffa7b849-51da-42f7-be1d-c3c7e1903e6e@oss.qualcomm.com>
 <CAPY8ntDAiJcJiixo2mTqcb898UC3AR-+NVPFPS6EtrGoEWKewg@mail.gmail.com>
 <88bcd810-872e-4705-91c0-df2a35f4a3b9@oss.qualcomm.com>
 <aVO4oX2I-FEuR4WS@kekkonen.localdomain>
 <b2cf8a59-a8bc-405c-8b7e-78805d0b4502@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b2cf8a59-a8bc-405c-8b7e-78805d0b4502@oss.qualcomm.com>

Hi Wenmeng,

On Mon, Jan 05, 2026 at 04:14:21PM +0800, Wenmeng Liu wrote:
> 
> 
> On 12/30/2025 7:33 PM, Sakari Ailus wrote:
> > Hi Wenmeng,
> > 
> > On Tue, Dec 23, 2025 at 02:19:18PM +0800, Wenmeng Liu wrote:
> > > 
> > > 
> > > On 12/22/2025 10:16 PM, Dave Stevenson wrote:
> > > > Hi Wenmeng
> > > > 
> > > > On Mon, 22 Dec 2025 at 12:20, Wenmeng Liu <wenmeng.liu@oss.qualcomm.com> wrote:
> > > > > 
> > > > > 
> > > > > 
> > > > > On 12/22/2025 8:11 PM, Dave Stevenson wrote:
> > > > > > Hi Wenmeng & Sakari
> > > > > > 
> > > > > > On Mon, 22 Dec 2025 at 09:35, Wenmeng Liu <wenmeng.liu@oss.qualcomm.com> wrote:
> > > > > > > 
> > > > > > > 
> > > > > > > 
> > > > > > > 
> > > > > > > > > 
> > > > > > > > > The Arducam IMX577 module requires a longer reset time than the 1000µs
> > > > > > > > > configured in the current driver. Increase the wait time after power-on
> > > > > > > > > to ensure proper initialization.
> > > > > > > > 
> > > > > > > > Is this somehow specific to the Arducam module? If so, what's there in the
> > > > > > > > module that requires this?
> > > > > > > > 
> > > > > > > 
> > > > > > > 
> > > > > > > Yes, This issue occurred on the Arducam 22-pin IMX577 module.
> > > > > > > I have tried changing the sequence of regulator, reset, and clock, and
> > > > > > > found that this module must wait a sufficient amount of time after reset
> > > > > > > before registers can be written (10 ms is a safe duration). This issue
> > > > > > > did not occur when using other IMX577 modules.
> > > > > > 
> > > > > > Is it the probe that fails, or starting streaming?
> > > > > > 
> > > > > > Google has found me a datasheet for IMX577 at [1]. I'm hoping you have
> > > > > > an official datasheet, so do correct the following if that has any
> > > > > > updates.
> > > > > > Section 7-2-2 on page 30 for the startup sequence.
> > > > > > 
> > > > > > The sequence is meant to be regulators, INCK, and then XCLR. The
> > > > > > driver does XCLR before clock, so that would appear to be wrong.
> > > > > > 
> > > > > > It also states that T6 as the time from XCLR to being able to read the
> > > > > > version register is min 0.6ms, but T7 as the time before you can send
> > > > > > "Streaming Commmand" is min 8ms "To complete reading all parameters
> > > > > > from NVM".
> > > > > > That would be a difference between probe and start_streaming, although
> > > > > > admittedly sending the mode and control setup I2C commands will take
> > > > > > up some of that time.
> > > > > > 
> > > > > > Plausibly the other set of modules don't have the NVM programmed and
> > > > > > hence they are ready sooner. Either way I'd say that does mean the
> > > > > > driver currently isn't following the defined power up sequence, and
> > > > > > the patch looks reasonable for IMX577.
> > > > > > However as this is a shared driver does IMX412 have this restriction
> > > > > > too? I can't find a datasheet for that one to check. For the sake of
> > > > > > ~9ms it's not going to make a huge difference though.
> > > > > > 
> > > > > >      Dave
> > > > > > 
> > > > > > [1] https://en.sunnywale.com/uploadfile/2021/1222/IMX577-AACK-C(Awin).pdf
> > > > > > 
> > > > > 
> > > > > Hi Dave,
> > > > > 
> > > > > this issue appears in the write register when streamon
> > > > > imx412_write_regs.  poweron->streamon.
> > > > > 
> > > > > static int imx412_start_streaming(struct imx412 *imx412)
> > > > > {
> > > > >            const struct imx412_reg_list *reg_list;
> > > > >            int ret;
> > > > > 
> > > > >            /* Write sensor mode registers */
> > > > >            reg_list = &imx412->cur_mode->reg_list;
> > > > >            ret = imx412_write_regs(imx412, reg_list->regs,
> > > > >                                    reg_list->num_of_regs);
> > > > >            if (ret) {
> > > > >                    dev_err(imx412->dev, "fail to write initial registers\n");
> > > > >                    return ret;
> > > > >            }
> > > > > 
> > > > >            /* Setup handler will write actual exposure and gain */
> > > > >            ret =  __v4l2_ctrl_handler_setup(imx412->sd.ctrl_handler);
> > > > >            if (ret) {
> > > > >                    dev_err(imx412->dev, "fail to setup handler\n");
> > > > >                    return ret;
> > > > >            }
> > > > > 
> > > > >            /* Delay is required before streaming*/
> > > > >            usleep_range(7400, 8000);
> > > > > 
> > > > >            /* Start streaming */
> > > > >            ret = imx412_write_reg(imx412, IMX412_REG_MODE_SELECT,
> > > > >                                   1, IMX412_MODE_STREAMING);
> > > > >            if (ret) {
> > > > >                    dev_err(imx412->dev, "fail to start streaming\n");
> > > > >                    return ret;
> > > > >            }
> > > > > 
> > > > >            return 0;
> > > > > }
> > > > >    > but T7 as the time before you can send "Streaming Commmand" is min 8ms "
> > > > > I think the usleep_range(7400, 8000) represents the 8ms duration
> > > > > required by T7.
> > > > 
> > > > I'd missed that one.
> > > > If you've delayed for 10-12ms between coming out of reset and sending
> > > > the first command, then does the Arducam module still require another
> > > > 8ms here, or can that be removed as you've already complied with T7?
> > > > 
> > > > Have you asked Arducam as to why their module takes longer? I can't
> > > > find an IMX577 module listed on their product pages so presumably it's
> > > > discontinued. There are a few links for a Luxonis Oak DepthAI board
> > > > [1] which is made by Arducam and is using IMX577, so is it that one?
> > > > Generally I've not encountered an issue with Arducam adding any weird
> > > > delay circuits on their sensor boards.
> > > > 
> > > >     Dave
> > > > 
> > > > [1] https://shop.luxonis.com/products/oak-ffc-imx577-m12
> > > > 
> > > > > Thanks,
> > > > > Wenmeng
> > > > > 
> > > > > 
> > > 
> > > Hi Dave,
> > > 
> > > Based on my testing, moving usleep_range(7400, 8000); to the beginning of
> > > the imx412_start_streaming function allows the Arducam IMX577 module to work
> > > properly. In contrast, other IMX577 sensors do not require this delay. I
> > > believe this corresponds to the T7 timing requirement. I have not yet
> > > confirmed this with Arducam, and I plan to compare once I receive another
> > > type Arducam IMX577 sensor.
> > 
> > Thanks for investigating this.
> > 
> > Have you checked how long it actually takes elsewhere (where the sensor
> > works) before the mode related registers are written (and when they start
> > being written) on systems where it actually works? As I²C writes require
> > sleeping and depend on a process getting scheduled a large number of times,
> > this might play a role here.
> > 
> > These patches might be useful in sensor drivers at large (but won't address
> > this problem)
> > <URL:https://git.retiisi.eu/?p=~sailus/linux.git;a=shortlog;h=refs/heads/pm-resume-delay>.
> > 
> 
> Hi Sakari,
> 
> Based on my testing, it takes about 6.5ms before the registers become
> writable. I believe this is not a CCI issue, because I have tested multiple
> platforms and only the Arducam 22-pin IMX577 shows this problem. This delay
> seems to correspond to the time required for T7. I made the following
> changes and ran multiple tests, and this approach works fine:
> 
> diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
> index 459cca36493e..5be698863653 100644
> --- a/drivers/media/i2c/imx412.c
> +++ b/drivers/media/i2c/imx412.c
> @@ -798,6 +798,9 @@ static int imx412_start_streaming(struct imx412 *imx412)
>         const struct imx412_reg_list *reg_list;
>         int ret;
> 
> +       /* Delay is required before streaming*/
> +       usleep_range(7400, 8000);
> +
>         /* Write sensor mode registers */
>         reg_list = &imx412->cur_mode->reg_list;
>         ret = imx412_write_regs(imx412, reg_list->regs,
> @@ -814,9 +817,6 @@ static int imx412_start_streaming(struct imx412 *imx412)
>                 return ret;
>         }
> 
> -       /* Delay is required before streaming*/
> -       usleep_range(7400, 8000);
> -
>         /* Start streaming */
>         ret = imx412_write_reg(imx412, IMX412_REG_MODE_SELECT,
>                                1, IMX412_MODE_STREAMING);
> 
> 
> From the perspective of the spec timing, I believe the above modification to
> the delay position is an acceptable change. What do you think?

Could you also add a comment explaining the issue? Otherwise there are good
chances someone will (at least try to) "fix" this later on.

-- 
Kind regards,

Sakari Ailus

