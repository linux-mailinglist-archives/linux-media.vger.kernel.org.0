Return-Path: <linux-media+bounces-22512-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B359E15D0
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 09:31:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B3A9162A62
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 08:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 530811D90A1;
	Tue,  3 Dec 2024 08:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t42RLmlH"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44493F8F7;
	Tue,  3 Dec 2024 08:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733214687; cv=none; b=dZYPzyAHJ4FWR3wCZeRpkQrBPqR1nOXT8WKoobanIrWjNopblw1x8T1WbPPIcLTyaKk+n08sxo+29CayJP1oNmUJyQFOtbhujvkvUTL1xBAcDKEB3lfnXaMNhLRZIlkxgFIrxYGpVa0S+fsAWbaH7FvUpAbEB3m1DFZbjsy8BiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733214687; c=relaxed/simple;
	bh=x3znFn98rErh2FCBpaz9WvVdlFADMKizJofigQdXDp4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l3kLVX/U9xiYckieQtGNch/NDntMhEZliBmTUKbL0Q5k46C8QTC2kod7jwwn2RBOcAWNvqKqDfyxA8bW436BoAPxqltiUcYNjXkR0PdhlsueZGSyumG0G63rKld3/Zhh9EjygzT/xUqJ/ku0kwSJ+CkkdeneToXvtLOI5cSl+/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t42RLmlH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45D21C4CECF;
	Tue,  3 Dec 2024 08:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733214687;
	bh=x3znFn98rErh2FCBpaz9WvVdlFADMKizJofigQdXDp4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=t42RLmlHAIcnhWWs3lUH+Bz88axkSdXYA8oFKDhpTWmLJHGdOlM3M1LManNS0sdvT
	 YyxMTDDBXmLm3kC1Yw5PE7dyA6cSk5+RZIQxCcK4nWi0SbYwcTeZyzfi1GRftNKStm
	 HcI8vkNtiQ8vl60KrSkfL5kKNxd7VGn93wDeV5NnnmFqXPBBLN7lmBfTRJzkQlJCvV
	 jCxUI33Qq3dZ/VJqyzHbe0sbLXuZyuimDzJ3kzaPYEBZfv9XwwfRg/hs0gNjqfCFGV
	 n2opd19xlVIJFgdwMd7/IXO1V80184HNi1YJSli5Yk7HGx59K4q8kagHj+mWlZjxvP
	 KCjGBGozwZpKw==
Date: Tue, 3 Dec 2024 09:31:20 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Bill
 Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Hans de
 Goede <hdegoede@redhat.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Yunfei Dong
 <yunfei.dong@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/3] media: cx231xx: Convert enum into a define
Message-ID: <20241203093114.0ca49c01@foz.lan>
In-Reply-To: <20241202-fix-llvm9-v1-1-2a50f5acfd0b@chromium.org>
References: <20241202-fix-llvm9-v1-0-2a50f5acfd0b@chromium.org>
	<20241202-fix-llvm9-v1-1-2a50f5acfd0b@chromium.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Mon, 02 Dec 2024 15:47:15 +0000
Ricardo Ribalda <ribalda@chromium.org> escreveu:

> The code is running arithmentics with the enum, which when not done with
> care makes the compiler a bit nervous.
> 
> Because those enums are only used as defines (no argument or variable
> from that enumeration type), convert it into a define and move on.
> 
> It is required to build with llvm 9 without these warnings:
> drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:673:17: warning: bitwise operation between different enumeration types ('enum TS_PORT' and 'enum POWE_TYPE') [-Wenum-enum-conversion]
> drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:680:21: warning: bitwise operation between different enumeration types ('enum AVDEC_STATUS' and 'enum POWE_TYPE') [-Wenum-enum-conversion]
> drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:687:21: warning: bitwise operation between different enumeration types ('enum AVDEC_STATUS' and 'enum POWE_TYPE') [-Wenum-enum-conversion]
> drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:702:17: warning: bitwise operation between different enumeration types ('enum TS_PORT' and 'enum POWE_TYPE') [-Wenum-enum-conversion]
> drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:709:21: warning: bitwise operation between different enumeration types ('enum TS_PORT' and 'enum POWE_TYPE') [-Wenum-enum-conversion]
> drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:718:21: warning: bitwise operation between different enumeration types ('enum AVDEC_STATUS' and 'enum POWE_TYPE') [-Wenum-enum-conversion]
> drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:727:21: warning: bitwise operation between different enumeration types ('enum AVDEC_STATUS' and 'enum TS_PORT') [-Wenum-enum-conversion]
> drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:737:21: warning: bitwise operation between different enumeration types ('enum AVDEC_STATUS' and 'enum TS_PORT') [-Wenum-enum-conversion]
> drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:749:21: warning: bitwise operation between different enumeration types ('enum AVDEC_STATUS' and 'enum TS_PORT') [-Wenum-enum-conversion]
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/cx231xx/cx231xx-pcb-cfg.h | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/usb/cx231xx/cx231xx-pcb-cfg.h b/drivers/media/usb/cx231xx/cx231xx-pcb-cfg.h
> index 5bc44f194d0a..62ffa16bb82c 100644
> --- a/drivers/media/usb/cx231xx/cx231xx-pcb-cfg.h
> +++ b/drivers/media/usb/cx231xx/cx231xx-pcb-cfg.h
> @@ -57,19 +57,17 @@ enum USB_SPEED{
>  };
>  
>  #define TS_MASK         0x6
> -enum TS_PORT{
> -	NO_TS_PORT = 0x0,	/* 2'b00: Neither port used. PCB not a Hybrid,
> +#define NO_TS_PORT	0x0	/* 2'b00: Neither port used. PCB not a Hybrid,
>  				   only offers Analog TV or Video */
> -	TS1_PORT = 0x4,		/* 2'b10: TS1 Input (Hybrid mode :
> +#define TS1_PORT	0x4	/* 2'b10: TS1 Input (Hybrid mode :
>  				Digital or External Analog/Compressed source) */
> -	TS1_TS2_PORT = 0x6,	/* 2'b11: TS1 & TS2 Inputs
> +#define TS1_TS2_PORT	0x6	/* 2'b11: TS1 & TS2 Inputs
>  				(Dual inputs from Digital and/or
>  				External Analog/Compressed sources) */
> -	TS1_EXT_CLOCK = 0x6,	/* 2'b11: TS1 & TS2 as selector
> +#define TS1_EXT_CLOCK	0x6	/* 2'b11: TS1 & TS2 as selector
>  						to external clock */
> -	TS1VIP_TS2_PORT = 0x2	/* 2'b01: TS1 used as 656/VIP Output,
> +#define TS1VIP_TS2_PORT 0x2	/* 2'b01: TS1 used as 656/VIP Output,
>  				   TS2 Input (from Compressor) */
> -};
>  
>  #define EAVP_MASK       0x8
>  enum EAV_PRESENT{
> @@ -89,10 +87,8 @@ enum AT_MODE{
>  };
>  
>  #define PWR_SEL_MASK    0x40
> -enum POWE_TYPE{
> -	SELF_POWER = 0x0,	/* 0: self power */
> -	BUS_POWER = 0x40	/* 1: bus power */
> -};
> +#define SELF_POWER	0x0	/* 0: self power */
> +#define BUS_POWER	0x40	/* 1: bus power */
>  
>  enum USB_POWE_TYPE{
>  	USB_SELF_POWER = 0,
> 

IMO keeping them into enums are a lot better than defines.

Perhaps the right thing would be to join both enums here.


Thanks,
Mauro

