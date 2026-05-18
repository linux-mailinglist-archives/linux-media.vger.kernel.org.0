Return-Path: <linux-media+bounces-61876-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DEBH96eCmpY4QQAu9opvQ
	(envelope-from <linux-media+bounces-61876-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 07:08:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68481565DEF
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 07:08:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 999B83005AAC
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 05:08:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5354238838F;
	Mon, 18 May 2026 05:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c/KWwwZm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280E338657A
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 05:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779080913; cv=none; b=RGiaTlfyJU+OjQhM7HU1MqQJ5rJZ2aIJ6BFLPtF+13TXwTY0EXFiB8TDldqDBfo3IdbWGzyukVNCeCimHgsbZ2X7a8e/KBGMDoC1hJwnKKQ24x/h7LvFBwQakByfChEieSvcJzFGXwzMyZKlT2sTwjbbvTP5iwsfzhbggeD95Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779080913; c=relaxed/simple;
	bh=+36rpvZixCz3dcHBWPHznA1fUug/+AJB870vCAqLJa0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=knAiC91STvicTMoLF7ajPSRkqCcJ8mV1rURF4TKbYVWkFoBNOTPROjryATtBuW0ye/fxPMPFruBksq2Ou9fmweZuBAv26BY+mLcsWI4kR7FQFR4D4+fa1W09dR6gB2oKL+SGMDbdoi/6YxNi8QxE+XZngwXJWvif17xFScmAZh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c/KWwwZm; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-45562c41ec7so895892f8f.1
        for <linux-media@vger.kernel.org>; Sun, 17 May 2026 22:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779080909; x=1779685709; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DuHdrpK6dCZDNp5i65/Z1rewEsn0x2ZcutMsNSGxc+Y=;
        b=c/KWwwZmU+E5MN5PxmRYydErplOrvs+t0Kc7xkHoPNqLoZRKxZ75eUsfOwgYmFr/GW
         yeJtYXeTxQK1BPrIlRhPjNjPaIvphTz1TOAryMtSaApbb4tU3xtSmGX6QxlEdP4dQCSv
         YUAH+l2yhDc0p10dhs0grqr9RI4w+sDkGH82XTTONyZypVJWrt0GwQfdXK/bmqRE2h+3
         g4mWrS4T1s/eMBHoN53Umwe7Ggb1Tsl+DbD08UFYURiRlUt7XFBp8lyENGlnnDNdTD5v
         DPR65p12x4DFdWSWhxBwdTpdpebfHBkHSFS8O280IxvWZ0f6eox6YDsnNm6JQmNe0z+/
         VYDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779080909; x=1779685709;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DuHdrpK6dCZDNp5i65/Z1rewEsn0x2ZcutMsNSGxc+Y=;
        b=Ied8mfvi5X+OV8UTqdACdmIarbu/yxazXl9hVTfjvlshSTTGXM/1eeMB7QSCYVGPUS
         2P3ppFXKzdV/5WKpLmJ0cmOauURxUytgHDbeflx5Gu3iMeAVsalOTbTnBrt0BcciEc1A
         yJncFtpeNHO5KupCb42X6eV4xqfU4P7QAfhHm5GUA4c/kZGaeyv2Ikh5/nkOECWzh91+
         wxk324foIrsj1Rvo3c/jL+i4VE9k3lWp3EVZ264mznDuMvyHWLWdJdWTChxG9fIy63/O
         TuPi9XTDZBED40UbXKYHbkaw6enanpRMqYElLXMnBsIzWWDqTDDSglnkgDpMEZ+7s4qY
         Ch8w==
X-Forwarded-Encrypted: i=1; AFNElJ/wELkaGVwCayR8P6hdmf2DWvsjGURE/EzX9Kg3SItJR3jjz5OC77svNEmY4JVLj9RY4y/ZuQ5Cyj00lw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvhhk8zKCMKRR5i9Gd5s3ZBEqeayOfRQDl0ZVn+PbaN5oeKxm0
	JMs1X70alCXIblAOPEECywg0/REgAMjrBlhxhD7bkDrdHLGrHhKN6pZH
X-Gm-Gg: Acq92OH+B+JDrxcTxeaEUfTXtCjHABld84bJ2JKVBrpO6Jt98Nn1TYsbjq0+qU/hOAW
	LHKWpK2zDzrqTn2RXd5ElPrcNC4GtFDzVABlkg3tpDTh8+JTEdBcYp6AwD9AEOC2jHjot5PRlKt
	GUMVN5MV9ODdS8odjTVZQRIAJsQHKF7np1U1YjdiY5Jnn6AVp8q0zKUu/TnvanGP8XTw/pDAbYd
	Jy9CtJ4cIKIMii2aIHyqBbqHuL4MiN4riKOMJlmAlbUxZvtV1H14OffcsrGlJMs10j9rHh7njiF
	dN23BFfIY+0Lu+u7ubZ2cgZSpybXWOS3jxp1amBJaZij81Cts/p58L+ahvKJ0eLbx0gGd2jHsOE
	TUYW82+lqiVmqgHVmLdyap5f7GRBJiVbh5QK7+hGazoK92lLsk3lId+4KhbZVH1zJnKkSB/wI21
	RMKme4OEuo+8m/znvrGV9EvxeQG4ylUw==
X-Received: by 2002:a05:6000:25c1:b0:43c:fb48:6856 with SMTP id ffacd0b85a97d-45e5c5af3c9mr24564453f8f.13.1779080909605;
        Sun, 17 May 2026 22:08:29 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a19a0csm32564625f8f.20.2026.05.17.22.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 22:08:29 -0700 (PDT)
Date: Mon, 18 May 2026 08:08:26 +0300
From: Dan Carpenter <error27@gmail.com>
To: Diego Fernando Mancera =?iso-8859-1?Q?G=F3mez?= <diegomancera.dev@gmail.com>
Cc: thierry.reding@kernel.org, jonathanh@nvidia.com, skomatineni@nvidia.com,
	luca.ceresoli@bootlin.com, gregkh@linuxfoundation.org,
	mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: media: tegra-video: prefer using the BIT macro
Message-ID: <agqeyhCD9g7IjqjS@stanley.mountain>
References: <20260517060511.231437-1-diegomancera.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260517060511.231437-1-diegomancera.dev@gmail.com>
X-Rspamd-Queue-Id: 68481565DEF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61876-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Sun, May 17, 2026 at 12:05:11AM -0600, Diego Fernando Mancera Gómez wrote:
> Replace open-coded bit shifts (1 << 28) with the standard kernel BIT
> macro. This improves code uniformity, matches style guidelines, and
> prevents accidental signed overflow issues.

It doesn't prevent any "accidental signed overflow issues".

> 
> Signed-off-by: Diego Fernando Mancera Gómez <diegomancera.dev@gmail.com>
> ---
>  drivers/staging/media/tegra-video/tegra20.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
> index e513e6ccb..08fa234af 100644
> --- a/drivers/staging/media/tegra-video/tegra20.c
> +++ b/drivers/staging/media/tegra-video/tegra20.c
> @@ -177,7 +177,7 @@ enum tegra_vi_out {
>  #define       CSI_SKIP_PACKET_THRESHOLD(n)		(((n) & 0xff) << 16)
>  #define TEGRA_CSI_PIXEL_STREAM_CONTROL0(n)		(0x0018 + (n) * 0x2c)
>  #define       CSI_PP_PAD_FRAME_PAD0S			(0 << 28)
> -#define       CSI_PP_PAD_FRAME_PAD1S			(1 << 28)
> +#define       CSI_PP_PAD_FRAME_PAD1S			BIT(28)
>  #define       CSI_PP_PAD_FRAME_NOPAD			(2 << 28)

This change makes the code  less readable.  There are two bits, 28 and
29 and they mean something.  0 meand pad0, 1 means pad1, and 2 means
no pad.  The patch jumbles the pattern.

regards,
dan carpenter


