Return-Path: <linux-media+bounces-16369-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1028954404
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2024 10:24:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80554282F3E
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2024 08:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76BF813B2A2;
	Fri, 16 Aug 2024 08:22:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from zankapfel.net (zankapfel.net [5.45.106.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CD21D69E;
	Fri, 16 Aug 2024 08:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.45.106.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723796522; cv=none; b=Ezqkw7z4wW9rjQZcxb1bxscIPrUKlKQdY+nDo233dkzmpAV60w1D7cDfw4Up9pm2M+AcaktWQ7M8MqcgQVHujh5X3wpEaWq0vGirJjmtalgm11xDZrm+h3LHt/mvqqGfqEBs4gr0JPeV2vW0Ayy98h3yPRn2kQ2boByUiiufJY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723796522; c=relaxed/simple;
	bh=dJutqAQVcljlp82cpgl/IdcJB4ac05DroeGFgObXzKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TkpJBS7AdtA3nGavc62gb9sHP+gVkrcKOs/t+xZHlBHoq9L2mhiLLfd+q6td6kypRyKh1LJqB3bs0HKZlKGhkPir7sPFKReyKD82JeEPfzLfXhE3sJssOUTr5jxazacw/tjLRh9/6wLOPHNpEsyp5OXM737P23tjKj4/26OhztQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zankapfel.net; spf=none smtp.mailfrom=zankapfel.net; arc=none smtp.client-ip=5.45.106.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zankapfel.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=zankapfel.net
Received: by zankapfel.net (Postfix, from userid 1000)
	id 1FBE61279BA; Fri, 16 Aug 2024 10:12:17 +0200 (CEST)
Date: Fri, 16 Aug 2024 10:12:17 +0200
From: Phil Eichinger <phil@zankapfel.net>
To: Jammy Huang <jammy_huang@aspeedtech.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	"eajames@linux.ibm.com" <eajames@linux.ibm.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>,
	"joel@jms.id.au" <joel@jms.id.au>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"sboyd@kernel.org" <sboyd@kernel.org>,
	"jae.hyun.yoo@linux.intel.com" <jae.hyun.yoo@linux.intel.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: aspeed: fix clock stopping logic
Message-ID: <Zr8J4V/OL++W+lp1@zankapfel.net>
Reply-To: Phil Eichinger <phil@zankapfel.net>
References: <20240719094056.1169057-1-phil@zankapfel.net>
 <4f571812-9f3b-4285-8745-76a511e143d6@xs4all.nl>
 <TYZPR06MB65685ED0C73E35A848004820F1852@TYZPR06MB6568.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <TYZPR06MB65685ED0C73E35A848004820F1852@TYZPR06MB6568.apcprd06.prod.outlook.com>

Hi Jammy,

please see my comments below:

On Mon, Aug 12, 2024 at 08:05:52AM +0000, Jammy Huang wrote:
> Hi Phil,
> 
> After some investigation, I think the problem is 'reset is not assert at aspeed_video_off() with
> clk off'. When clk is enabled in aspeed_video_on(), reset will be assert and de-assert by clk_enable.
> But there is nothing done for clk_disable. Thus, it will look like below:
>         // aspeed_video_on
>         enable vclk
>         reset assert
>         delay 100us
>         enable eclk
>         delay 10ms
>         reset de-assert
> 
>         // aspeed_video_off
>         disable eclk
>         disable vclk
> 
> I think if we add reset before disable eclk, your problem will be fixed. Could you try the patch below
> which I add reset in aspeed_video_off().
> 
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
> index e6f3cf3c721e..b9655d5259a7 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
> @@ -308,6 +308,7 @@ video: video@1e700000 {
>                                          <&syscon ASPEED_CLK_GATE_ECLK>;
>                                 clock-names = "vclk", "eclk";
>                                 interrupts = <7>;
> +                               resets = <&syscon ASPEED_RESET_VIDEO>;
>                                 status = "disabled";
>                         };

ASPEED_RESET_VIDEO does not exist in mainline for AST2500. I have added it to
drivers/clk/clk-aspeed.c and include/dt-bindings/clock/aspeed-clock.h like in
the Aspeed fork.

> diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> index 7fb421153596..62c65b13dc7b 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> @@ -451,6 +451,7 @@ video: video@1e700000 {
>                                          <&syscon ASPEED_CLK_GATE_ECLK>;
>                                 clock-names = "vclk", "eclk";
>                                 interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +                               resets = <&syscon ASPEED_RESET_VIDEO>;
>                                 status = "disabled";
>                         };
> 
> diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
> index 9c53c9c2285b..fc633f574566 100644
> --- a/drivers/media/platform/aspeed/aspeed-video.c
> +++ b/drivers/media/platform/aspeed/aspeed-video.c
> @@ -25,6 +25,7 @@
>  #include <linux/workqueue.h>
>  #include <linux/debugfs.h>
>  #include <linux/ktime.h>
> +#include <linux/reset.h>
>  #include <linux/regmap.h>
>  #include <linux/mfd/syscon.h>
>  #include <media/v4l2-ctrls.h>
> @@ -310,6 +311,7 @@ struct aspeed_video {
>         void __iomem *base;
>         struct clk *eclk;
>         struct clk *vclk;
>                                 clock-names = "vclk", "eclk";
>                                 interrupts = <7>;
> +                               resets = <&syscon ASPEED_RESET_VIDEO>;
>                                 status = "disabled";
>                         };

This is bogus.

> diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> index 7fb421153596..62c65b13dc7b 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> @@ -451,6 +451,7 @@ video: video@1e700000 {
>                                          <&syscon ASPEED_CLK_GATE_ECLK>;
>                                 clock-names = "vclk", "eclk";
>                                 interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +                               resets = <&syscon ASPEED_RESET_VIDEO>;
>                                 status = "disabled";
>                         };
> 
> diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
> index 9c53c9c2285b..fc633f574566 100644
> --- a/drivers/media/platform/aspeed/aspeed-video.c
> +++ b/drivers/media/platform/aspeed/aspeed-video.c
> @@ -25,6 +25,7 @@
>  #include <linux/workqueue.h>
>  #include <linux/debugfs.h>
>  #include <linux/ktime.h>
> +#include <linux/reset.h>
>  #include <linux/regmap.h>
>  #include <linux/mfd/syscon.h>
>  #include <media/v4l2-ctrls.h>
> @@ -310,6 +311,7 @@ struct aspeed_video {
>         void __iomem *base;
>         struct clk *eclk;
>         struct clk *vclk;
> +       struct reset_control *reset;
> 
>         struct device *dev;
>         struct v4l2_ctrl_handler ctrl_handler;
> @@ -704,6 +706,9 @@ static void aspeed_video_off(struct aspeed_video *video)
>         aspeed_video_write(video, VE_INTERRUPT_CTRL, 0);
>         aspeed_video_write(video, VE_INTERRUPT_STATUS, 0xffffffff);
> 
> +       eset_control_assert(video->reset);
> +       usleep_range(100, 200);
> +

I assume you meant reset_control_assert()?

Anyway I got your patch compilable by adding ASPEED_RESET_VIDEO like so:

diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
index 411ff5fb2c07..9684fb086d38 100644
--- a/drivers/clk/clk-aspeed.c
+++ b/drivers/clk/clk-aspeed.c
@@ -278,6 +278,7 @@ static const u8 aspeed_resets[] = {
        [ASPEED_RESET_PECI]     = 10,
        [ASPEED_RESET_I2C]      =  2,
        [ASPEED_RESET_AHB]      =  1,
+       [ASPEED_RESET_VIDEO]    =  6,

         /*
          * SCUD4 resets start at an
	  * offset to separate them From
diff --git a/include/dt-bindings/clock/aspeed-clock.h
b/include/dt-bindings/clock/aspeed-clock.h
index 06d568382c77..421ca577c1b2 100644
--- a/include/dt-bindings/clock/aspeed-clock.h
+++ b/include/dt-bindings/clock/aspeed-clock.h
@@ -53,5 +53,6 @@
 #define ASPEED_RESET_AHB               8
 #define ASPEED_RESET_CRT1              9
 #define ASPEED_RESET_HACE              10
+#define ASPEED_RESET_VIDEO             21

Anyways during testing it almost immediately caused the crash again,
when the clocks were disabled in the original order.

Cheers,
Phil

