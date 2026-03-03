Return-Path: <linux-media+bounces-54372-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GGlLCz2pmmgawAAu9opvQ
	(envelope-from <linux-media+bounces-54372-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 15:54:36 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC021F1D74
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 15:54:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D1CC30E97F3
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 14:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BED33E95AC;
	Tue,  3 Mar 2026 14:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nV5Na4mv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E443B7B77
	for <linux-media@vger.kernel.org>; Tue,  3 Mar 2026 14:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772549389; cv=pass; b=SFoAcY6rszagGTYPhUkI7YQUVSqzy8rccjmZg441cSLcSNaAoX5Ol9xxUlBlO5Bl1WPObP0nPkis+lUxPlg0EP0CKs2fuIh0l9nD2b4A7SPJ/QPGn0KKUSvtshMyHx1obcu1TacCWD3l5YfUD1o4BIGtgt6B2D/w7U723WpyOGw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772549389; c=relaxed/simple;
	bh=jvAzp6dpxqY0yyNgTqgcnpXzYfjvOHL6PLfoLaBzefw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sjeQRTzEElqKqoxiUjFaPnE7aU26OY28ZI4ladTzdg3hwnd0YeZ0rCtbgfJpyQrogy05UVPDziYLYu/0bcBkQKnXsBqKio2M8CoB4hP03Cw3OEtzzlxyGTk9YjemW+2hjgzzXNCfLowcMaHDPOBIAGE24XXb5tlfWSkvXQvEEyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nV5Na4mv; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1270ac5d3efso5563250c88.1
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 06:49:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772549387; cv=none;
        d=google.com; s=arc-20240605;
        b=CHW0CL3+qVxB3m6wO4T8fFyUuA7C+JBSoL0lfaaZyam19MsTjpnQ8P3WowiQiK/wnC
         7BkAF/UwKzv6PRGzSARXPTDbn5eNRCqWLb13zni402YNe119iLw+eBqBUX8ZAQXIok/J
         Qvjt4XFjvnmxOyHAIBH0IYIMExfdoAGY/Y2fLchYaks6xz7FR1xNIdq+ps0RLSS1+j/h
         NncTDAnEqmb+JyGc/V0TZIxS3w3Rx9Co+QhlPqd2fsYcqktqtEPsnGLWQ4vSzd3ZQldX
         o14w2eKUNi6mAFqRos1BOanw9DUgWcFQ/czWR51DFNV0l8RDSdg4yeosNeKSWT6JMvqL
         NKmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i7XkfEBbe1ovhz+Dww++CuP1T9u5bmr6ROt0FvsszSI=;
        fh=lggn+koa+I5bhRVS/E0r0aMBW3vJtD8+8ajD4mSlGTs=;
        b=Iq3LrOrES22EIN2ZqLqGsHwc1NQLUQc8c2QLAbFvfTXsAFrjM6+REWxiN5g4vM1eNx
         EQHELsO68iqFgxzyXwh+k/DLBFAOx3GjQ8TgmlFFG+7w6ynrFutTD46vJLLqkj3qzJlx
         fnf1k6ivD+sn2WCOJZ0Rtf+RLVCb4x82f8NHB5zNTOeObH6mNW2auxyIpLBsOuomCjap
         V9IuWC4sEx2YM/uIIBWTyCKkBmud4ybBrEYKXC/z1vj2NS87r1cnk5JmscXJI3kszqSG
         a4xMTBxcdUO6CMOCxwB5IFzYqpw1rOsmb394GF/yN35EqghKSZcqDawhFcu1eDGBgzxM
         Fd4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772549387; x=1773154187; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i7XkfEBbe1ovhz+Dww++CuP1T9u5bmr6ROt0FvsszSI=;
        b=nV5Na4mvfWlQQgCMjlL6zF0TUwEfNM+cKLnopsVRUbsoUB7vvdtsHkr5yZBBPRfTwY
         g0nIOBnSKdnOypGXipK98y+iAl3Fz3Acssxo2zBm/8Y3E4U8kCYCrFyeQNyXguG7SAq0
         k8mfx8xargGKRRMxdCLLkfhHrvYCSlnQlZZSNI5QgUZ0tnMbAVz7B9vnZYAFBx4v8uo8
         Dlvb3f4NSxJ/xB9bu107ABWLGhND5338FZQqAFXJUea5a37QbvNv1To741YuUKNHLNRi
         MBJGv8qbBt4CNq3+iEmiBmPkENZMU7b86KVmXeDnW8uyigZhjp2UWQJA1OkV34xJSy4b
         znmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772549387; x=1773154187;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i7XkfEBbe1ovhz+Dww++CuP1T9u5bmr6ROt0FvsszSI=;
        b=iVdIvatyLDYupOKnxaeaDlSB7tO/Y4vTllfinyWyhUo904Z/MSd9Ff7KFfUp7dO8Zm
         1h3WHOa/mNpGEz1mbDo6mYnjebWwmfKbomdKfspeGChzpNKPErBlk+iYRJbFsrLVKhb5
         K2FBXl7RM8dsP5IPBFnpHddPWli05fLHR3cFRfiLM5Sju4gPSpXDUqNHVXAdYTPOkilX
         yLJGYXZDXp6Bi8MkMTk+1UKPV8CrWSgZzzY1mWzJO2APKx4b227jkKhLBgv5WT/eriny
         A3cI9dDELN/eY+c/YFZlkeQ8XGeCu0tC8QyWX5bbf4FMEqBmvk6zlimTye5ArgVdb/IJ
         9E0g==
X-Forwarded-Encrypted: i=1; AJvYcCWCwMpXnPKoNbqW5sXFQbbX/+vLLXHTD+0JlPDeTXh80sjk5X/JFQahLTyVbd2wUVxqs9HuO7541w2r8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdGeCUoJImC1chdh2xsEGipKkTNhYJrd9GkzVYJWlnfFmGl0ET
	xvb7HVwarrmQdy6S3bg0TwpQIOOWMM6TGZIu1dXzR5wawrvEJr2o8F5yLiMETLLnpHro2Gr4Evg
	l95i8U40I2vEgEam8dRiV/dWWGPmbgno=
X-Gm-Gg: ATEYQzxObf/eRdxUsoKpInJ59m6YQmz/xWmijsJHz21G96zue+DKnvuPkwV36KwgFEY
	oTrWCEbadExBIvkqEX+tYC+BtQhSjE7tLYTf2mqPEUWMJEjohLwEC28G/2srF6FWgpx7KiqEV92
	zJtfHp3MJwVHagj9BYmNXZBzftE13r60HZxdU2HNH48PZKpKYkAcbuSthCuL/9cm0mxb/hWOlTf
	BAEC4XHdpJfdhlD5dxrjgB664zm5mKy/dobPQDK1E74RGTmsRp4DZHUFcibvB/nFiUrdtzb0+Ua
	m03S59bC
X-Received: by 2002:a05:7022:1283:b0:11a:2ec8:de1c with SMTP id
 a92af1059eb24-1278fc2c05dmr5177308c88.36.1772549386888; Tue, 03 Mar 2026
 06:49:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260302165932.2408181-1-eagle.alexander923@gmail.com>
 <177247427736.4158949.14911192456280885035@t16> <CAPY8ntBjzkcSnQ2kVV+D+qsog1o-05vshn-uQxy+bh+TPc=UCw@mail.gmail.com>
In-Reply-To: <CAPY8ntBjzkcSnQ2kVV+D+qsog1o-05vshn-uQxy+bh+TPc=UCw@mail.gmail.com>
From: Alexander Shiyan <eagle.alexander923@gmail.com>
Date: Tue, 3 Mar 2026 17:49:35 +0300
X-Gm-Features: AaiRm51e56Eic4FyG0Aafoq2HKKtoi1psLGdHMh_T6CZDikh5DQZXb-VQtFSJK8
Message-ID: <CAP1tNvQAMMfg50tX+08L_g3OvJRn0wSV8GD-GNCkLNuADPXUMg@mail.gmail.com>
Subject: Re: [PATCH RFC] media: i2c: Add AR0234 camera sensor driver
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Isaac Scott <isaac.scott@ideasonboard.com>, linux-media@vger.kernel.org, 
	Dongcheng Yan <dongcheng.yan@intel.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 0CC021F1D74
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-54372-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eaglealexander923@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hello Dave.

Thank you very much for the review!
...
> > > However, there are a few areas where I would appreciate feedback and =
help:
> > > - V4L2_CID_PIXEL_RATE handling: I am not entirely satisfied with the =
current implementation. The pixel rate depends on the number of lanes and t=
he link frequency. Ideally it should be updated automatically when the link=
 frequency changes (and when the bpp changes, though the sensor only suppor=
ts 10-bit for now). I would like to make it a read-only control that always=
 reflects the actual pixel rate, but I'm not sure about the best way to int=
egrate it with the PLL calculations and the link_freq menu. Any guidance wo=
uld be welcome.
>
> You've probably been pushed towards that conclusion by the CCS PLL
> framework, but it's generally not true.
> The AR0234 datasheet confirms it has separate dividers for pixel clock
> and MIPI clock (AND9820 figure 13). On almost all sensors of that form
> that I've encountered there is sufficient FIFO between pixel array and
> MIPI to allow the pixel array to always run at max sampling rate, and
> then use horizontal blanking to give the MIPI block enough time to
> send each line of that data. I've always found handling it that way
> easier than trying to recompute PLL settings for all permutations.

Regarding V4L2_CID_PIXEL_RATE: I fully agree with your explanation that
the pixel rate should be constant for a given configuration (number of lane=
s and
bits per pixel). The only scenario where it would change is when switching
bit depth (e.g., from 10=E2=80=91bit to 8=E2=80=91bit), which would require=
 a PLL recalculation,
so this is something to consider.
Currently, I will remove any leftover attempts to modify the pixel_rate ran=
ge
in ar0234_set_framing_limits and rely solely on this one=E2=80=91time initi=
alization:
  pixel_rate =3D ar0234->pll.pixel_rate_pixel_array * ar0234->num_data_lane=
s;
  v4l2_ctrl_new_std(&ar0234->ctrls, &ar0234_ctrl_ops, V4L2_CID_PIXEL_RATE,
    pixel_rate, pixel_rate, 1, pixel_rate);

...
> It references setting LINE_LENGTH_PCK in units of "pixel clocks", with
> a maximum pixel clock rate of 90MHz and a minimum LINE_LENGTH_PCK of
> 612 clocks for 1920x1200 @ 120fps.
> But 612 is less than 1920 so there is a multiplier in there, and
> 1920x1200 * 120fps =3D 276.48MPix/s, so that's greater than 90MHz.
>
> A multiplier of x4 may make all the numbers fall out as line length =3D
> 2448 pixels (1920 active and 528 hblank) at a pixel rate of 360MPix/s.
>
> Figure 13 then confuses me again as it has an "mlanes / 4" block in
> computing the pixel clock which is unusual. I'm expecting that you
> will therefore have to compute PIXEL_RATE with that factored in, and
> potentially have to compensate in the values programmed in
> LINE_LENGTH_PCK and FRAME_LENGTH_LINES.
>
> Seeing "#define AR0234_HBLANK_DEF (612)" in your driver tells me that
> HBLANK is not being handled correctly at the moment - that is the
> minimum line length register value.

About AR0234_HBLANK_DEF: you're absolutely right =E2=80=93 the name is conf=
using.
What I actually meant is the minimum allowed LINE_LENGTH_PCK value (612 clo=
cks).
I'll rename it to AR0234_LINE_LENGTH_PCK_MIN (and other
AR0234_HBLANK_* definitions)
to avoid ambiguity. The HBLANK value used in the control will then be
computed as
LINE_LENGTH_PCK - width / 4.
I'll revisit the limits later to ensure they are correct for all modes.

Regarding testing: so far I have tested the driver only on a
Rockchip RK3568 platform with 4 lanes. The ISP driver used is a ported vers=
ion
from Rockchip (not yet the mainline CIF driver). I plan to test 1=E2=80=91 =
and
2=E2=80=91lane configurations
in the near future and will update the community once I have results.

Thanks again for your time and guidance!

