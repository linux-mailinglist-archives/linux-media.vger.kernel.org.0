Return-Path: <linux-media+bounces-44147-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D92B3BCBDF3
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 09:10:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 991F74EDCED
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 07:10:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF191271A71;
	Fri, 10 Oct 2025 07:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KsS/Fw5y"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DB9635;
	Fri, 10 Oct 2025 07:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760080212; cv=none; b=aV9OXAkZKLgShE9T1chc6xm/UBgqX5TspNB92rRzw4TvL8KnkgBhWsN0unXKI0nOY6mIhxsD/nbqHSljvLl1YyN/QkKMD7K4lfXTyc4Ya2M0yNfx942dWsXX5mmfC2mtUJxaJPymysrX3t3smnHCWciKAMgBrwpnOpgUnUwFvJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760080212; c=relaxed/simple;
	bh=mFIn2mObs5dKqhQdsiISRpULCebc5OTRrwRrnVShcDk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D+htmomVawABnmVJVgE3pEGDwQoEMrNjNJAC0iTS75RyWxkIrVvif8Lm1TOuQgqa8tlyRHRO+o3Eu8u2CjT/PHzf80ScJNP68TGSaEqu6fxS4Z1z/CfVYlQCzRUqhIKrlBz5Ig7sR2RXjEI6TWfweLwezjz+KDhNW4Mk5SaHmVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KsS/Fw5y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F17FC4CEF1;
	Fri, 10 Oct 2025 07:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760080210;
	bh=mFIn2mObs5dKqhQdsiISRpULCebc5OTRrwRrnVShcDk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KsS/Fw5ye6Ox65qBuy/P6/foDTiAIKzEiu6zJeYo0FQ7M88DUFy9q6rjovsk4vsCA
	 7yJhql4MoBmS5qVaZVj5PBdZ2mOi9RgeQ6AAl8T0PXj3XrM0orYCw9PU3OLaRuGuKe
	 khYzYf9hMW16IikqH+mDUsyeqL47odxBGsh9vvMiJi999lkW706pZcHNhXuuCiopHy
	 oK71lZ5aiMWuIKz3U7D/UIWXVhlMmHFplvbMyqlIBABccj0lCRFQtxNVD3DW4oicWt
	 JnpNilQjLyJXsazpF9RG/WSnVwkedGPpvFrjv3zPhNEs+gwzwQXNFyxhgZlalnSC/h
	 xhrcGKdtEEyVg==
Date: Fri, 10 Oct 2025 08:10:00 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Hans Verkuil
 <hverkuil+cisco@kernel.org>, Malcolm Priestley <tvboxspy@gmail.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, Hans
 Verkuil <hverkuil@kernel.org>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?=
 <u.kleine-koenig@pengutronix.de>, Rusty Russell <rusty@rustcorp.com.au>,
 Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, Sami
 Tolvanen <samitolvanen@google.com>, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 1/3] media: dvb-usb-v2: lmedm04: Fix firmware macro
 definitions
Message-ID: <20251010081000.1104c7b1@sal.lan>
In-Reply-To: <20251010030610.3032147-1-kees@kernel.org>
References: <20251010030348.it.784-kees@kernel.org>
	<20251010030610.3032147-1-kees@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu,  9 Oct 2025 20:06:07 -0700
Kees Cook <kees@kernel.org> escreveu:

> The firmware filename macros incorrectly included semicolons in their
> string literal definitions. Right now, this wasn't causing any real
> problem, but coming changes to the MODULE_INFO() macro make this more
> sensitive. Specifically, when used with MODULE_FIRMWARE(), this
> created syntax errors during macro expansion:
> 
>     MODULE_FIRMWARE(LME2510_C_S7395);
> 
> expands to:
> 
>     MODULE_INFO(firmware, "dvb-usb-lme2510c-s7395.fw";)
>                                                      ^
>                                           syntax error
> 
> Remove the trailing semicolons from all six firmware filename macro
> definitions. Semicolons should only appear at the point of use, not in
> the macro definition.
> 
> Reviewed-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> Signed-off-by: Kees Cook <kees@kernel.org>

LGTM.
Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>


> ---
> Cc: Malcolm Priestley <tvboxspy@gmail.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: <linux-media@vger.kernel.org>
> ---
>  drivers/media/usb/dvb-usb-v2/lmedm04.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/usb/dvb-usb-v2/lmedm04.c b/drivers/media/usb/dvb-usb-v2/lmedm04.c
> index 0c510035805b..05c18b6de5c6 100644
> --- a/drivers/media/usb/dvb-usb-v2/lmedm04.c
> +++ b/drivers/media/usb/dvb-usb-v2/lmedm04.c
> @@ -70,12 +70,12 @@
>  #include "ts2020.h"
>  
>  
> -#define LME2510_C_S7395	"dvb-usb-lme2510c-s7395.fw";
> -#define LME2510_C_LG	"dvb-usb-lme2510c-lg.fw";
> -#define LME2510_C_S0194	"dvb-usb-lme2510c-s0194.fw";
> -#define LME2510_C_RS2000 "dvb-usb-lme2510c-rs2000.fw";
> -#define LME2510_LG	"dvb-usb-lme2510-lg.fw";
> -#define LME2510_S0194	"dvb-usb-lme2510-s0194.fw";
> +#define LME2510_C_S7395	"dvb-usb-lme2510c-s7395.fw"
> +#define LME2510_C_LG	"dvb-usb-lme2510c-lg.fw"
> +#define LME2510_C_S0194	"dvb-usb-lme2510c-s0194.fw"
> +#define LME2510_C_RS2000 "dvb-usb-lme2510c-rs2000.fw"
> +#define LME2510_LG	"dvb-usb-lme2510-lg.fw"
> +#define LME2510_S0194	"dvb-usb-lme2510-s0194.fw"
>  
>  /* debug */
>  static int dvb_usb_lme2510_debug;

