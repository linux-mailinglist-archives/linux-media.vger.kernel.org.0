Return-Path: <linux-media+bounces-53720-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +HXuNOimoWmivQQAu9opvQ
	(envelope-from <linux-media+bounces-53720-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 15:15:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 784DD1B8950
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 15:15:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1FB4C31A7AF1
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 14:08:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1A16421F07;
	Fri, 27 Feb 2026 14:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Sr7DMt0Q";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="boXpR4hS"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F76842B72B
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 14:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772200995; cv=none; b=cS3Z9NvOJUiLOfzDVPv2EP2vLkpXWvaBZ67fqGbDmQ2L3qmGkWoRfMDV1ftJ7eimHeHfyyON7SVRPnbxzKslczWt1uQTuWDvHS/IdFdJEO91f1hi5lPbCa2v/OXkMQDdCnXrfTmG/+PuiN+l1bQLEJtdZ7b5r3w+eP1U+3KAFl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772200995; c=relaxed/simple;
	bh=B7fHy1cGZkNQ2wdNUr90lrf+1d59/jJ2MVkVEhWoe5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JX0vbAMhJ4UiarsOh2jug06qT/8NaDKqHQQ3AykNyhM+caQPH0F9/XwKNg/KXva6AZ3Ub//PaoalNl5PLiN6kXCB6Muib6Ff4JMRyXMKXbQgNPLbxfGFg1Qmlb7jAv5yRGmUCQtqUCu3aUOJE0ZClNc5RwKpJtnPu/BlBZ1e1Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Sr7DMt0Q; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=boXpR4hS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772200992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oV2BIg3dhsX9PonNzGGB5cY2QemaB9h/4eyj8OI7C6o=;
	b=Sr7DMt0Qf7a4MHqdkKNmmGBCUsZYBIUB7kPwn3EeWNYIb2+TgpcqtCw7uxP8DPKVw/Kmed
	RlmmTiMbns5BkT29HHV8I8MefoqSzTVIMoxSxDyOtqVHeO/8zzU4/PZLUz9Boimj6g72i6
	fM/FEr22Hiz8LzoqmynD0YCUea/JRYQ=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-319-Qxo8cBcvN2O6JLpN_QDRAA-1; Fri, 27 Feb 2026 09:03:11 -0500
X-MC-Unique: Qxo8cBcvN2O6JLpN_QDRAA-1
X-Mimecast-MFC-AGG-ID: Qxo8cBcvN2O6JLpN_QDRAA_1772200990
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3591c9cb81eso7565961a91.2
        for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 06:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772200990; x=1772805790; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oV2BIg3dhsX9PonNzGGB5cY2QemaB9h/4eyj8OI7C6o=;
        b=boXpR4hSfhQlKeGSFZlV+YZuPVp1AqjnLT6UMdf4CNueczybmSHAtwmH6NZSN3O42o
         D75b21dGmBw17Y/Dl9nkh0KlSH3+/6cGaYWGwdx2RyAUhvxk/kspWkgR0N0qYMBLDcNf
         /mhwQWBB4EKSdYiAebbvEmNl+fEgK7TEKGbSLZ5eP+pgiuBK1rIT3yPHy5wcSTlWbrLf
         vr52uasLVVG7RFh+ovMdT4h2sOCywSAKI91vXKA3bTfRdMG8NPUeKJBJKBh7q0yZUNQd
         zAnLA1XeTpVWguuuahhSXhOfKfrVu7IHVwnTWCzg9wEX7CFlR5YndbeEJUjlgyQN0rok
         k4xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772200990; x=1772805790;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oV2BIg3dhsX9PonNzGGB5cY2QemaB9h/4eyj8OI7C6o=;
        b=eRhlKIkTbisvwZc88Jm/tQiiKVjyd5tmYFKPzY/0/IcvgXRzmrsybRoR2M2hnI9uoW
         idOrqieLSxvtCS3Kw1OiRaN1eCZasA45K/1V+YbiPZKiT6wtDhGOYJrKFwwbfeHtPZt5
         KwY1g/iiFBxLlO6nB/nq7Gnbj5KrELZIwImro6/sYWFrgSF7pLszF1aqrD480pl30hNe
         QZGA2fY32w1XZyfx3HEZ2i/yC8Xv/jCMdK1E2iLIKT7KqMpnZS34jppV7rmJUdXL+D8m
         eCeV60hHxUFw76jPqX37lOMy5LSUA5tQdvplFII0KqAykCitPaIY6kbnzjbTNBG5KLHK
         JhFg==
X-Forwarded-Encrypted: i=1; AJvYcCWqtP7nyxheqlCH2O62nIO/6tReOS1V8BSX0X9iHtWwSvLooD89sQi3EUS7XkGU3YwZssRwmAZMKztVgg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9cdN+RM+OvN22hkL0VhHxNTE+G6t4aMdwtUZ5yoKCG1+MGjnN
	7vDXTLam49OsXBlhdXHfdUcabxjFvBOox4CVsD1kwnaRh4n+FIGu6TX3NeYqIWK0IX0uLsRHYUW
	ZEEexpz8JwA8rtpT5RYkMojqpF2mk/QVzCOIX4PFJB9APJ9D4RuwnP9XQ1cCbhy0E
X-Gm-Gg: ATEYQzy369GNTVdplYFABCYS6TU5dGkRnzfJcspuleGtdf4Th3K+LBO3v23zhMIo4aI
	h+En/eTv41LFA4rmhXwjXzjXyge1SuxLz5/xDAYji4dBC+jXZCUzmvFpnii7XEiey75SWX6wyx6
	JpizNQVBeoUFFkiIckhKB2eJupGjxm7x+OqaLoD9IZpznlm1LGukTZdXIakBlES8H//HjJYwTWh
	KDlvEnST4p00SafwSIqzbkn5nxoq5VwrbRt/aTFWN7FHMtaSKmpFbETlGVPYp2Is5LNNxFdcqzH
	bDtKP7gmH5MWXsXB3SCe8OI6if+Hp1D+VunuUB/sW/JiKn6nS0Xc2/P7RVFBfCEdtLX8L7R7BfD
	rYqFdf+55C17fCq4HDpm7+FPn7+YstrjZSfSdUE5TYQ5xQibV0RLlhw==
X-Received: by 2002:a17:90b:5710:b0:341:88c9:6eb2 with SMTP id 98e67ed59e1d1-35965c3385fmr2137030a91.1.1772200989866;
        Fri, 27 Feb 2026 06:03:09 -0800 (PST)
X-Received: by 2002:a17:90b:5710:b0:341:88c9:6eb2 with SMTP id 98e67ed59e1d1-35965c3385fmr2136984a91.1.1772200989423;
        Fri, 27 Feb 2026 06:03:09 -0800 (PST)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb ([2601:1c2:4400:eb20:99f3:ffd5:11da:6745])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35913269232sm5305497a91.5.2026.02.27.06.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 06:03:09 -0800 (PST)
Date: Fri, 27 Feb 2026 06:03:07 -0800
From: Jared Kangas <jkangas@redhat.com>
To: Larisa Grigore <larisa.grigore@oss.nxp.com>
Cc: gregkh@linuxfoundation.org, jirislaby@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, sumit.semwal@linaro.org,
	christian.koenig@amd.com, chester62515@gmail.com,
	cosmin.stoica@nxp.com, adrian.nitu@freescale.com,
	stefan-gabriel.mirea@nxp.com, Mihaela.Martinas@freescale.com,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	s32@nxp.com, imx@lists.linux.dev, clizzi@redhat.com,
	aruizrui@redhat.com, eballetb@redhat.com, echanude@redhat.com
Subject: Re: [PATCH 00/13] Add DMA support for LINFlexD UART driver
Message-ID: <aaGkGwbk-sh0YJqj@jkangas-thinkpadp1gen3.rmtuswa.csb>
References: <20260216150205.212318-1-larisa.grigore@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260216150205.212318-1-larisa.grigore@oss.nxp.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53720-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,linaro.org,amd.com,gmail.com,nxp.com,freescale.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev,redhat.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jkangas@redhat.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 784DD1B8950
X-Rspamd-Action: no action

Hi Larisa,

On Mon, Feb 16, 2026 at 04:01:52PM +0100, Larisa Grigore wrote:
> This patchset enhances the LINFlexD UART driver and its device tree bindings to
> support DMA transfers, configurable clock inputs, dynamic baudrate changes, and
> termios features. It also includes a series of fixes and improvements to ensure
> reliable operation across various modes and configurations.
> 
> The changes added can be summarized as follows:
> 1. Fixes with respect to FIFO handling, locking, interrupt related registers and
> INITM mode transition.

Tested this series with the default devicetree configuration by booting
the board to a login prompt about 200 times. Without the series applied,
I was seeing a bug roughly every 30-50 boots where the kernel would
would hang in linflex_console_putchar() waiting for DTFTFF. In my tests
with the series applied, I didn't see any regressions and the bug no
longer appeared. Thanks for the fix!

Tested-by: Jared Kangas <jkangas@redhat.com> # S32G3, interrupt-driven

> 2. Removal of the earlycon workaround, as proper FIFO handling and INITM
> transitions now ensure stable behavior.
> 3. Support for configurable stop bits and dynamic baudrate changes based on
> clock inputs and termios settings.
> 4. Optional DMA support for RX and TX paths, preventing character loss during
> high-throughput operations like copy-paste. Cyclic DMA is used for RX to avoid
> gaps between transactions.
> 
> Larisa Grigore (8):
>   serial: linflexuart: Clean SLEEP bit in LINCR1 after suspend
>   serial: linflexuart: Check FIFO full before writing
>   serial: linflexuart: Correctly clear UARTSR in buffer mode
>   serial: linflexuart: Update RXEN/TXEN outside INITM mode
>   serial: linflexuart: Ensure FIFO is empty when entering INITM
>   serial: linflexuart: Revert earlycon workaround
>   serial: linflexuart: Add support for configurable stop bits
>   serial: linflexuart: Add DMA support
> 
> Radu Pirea (5):
>   serial: linflexuart: Fix locking in set_termios
>   dt-bindings: serial: fsl-linflexuart: add clock input properties
>   dt-bindings: serial: fsl-linflexuart: add dma properties
>   serial: linflexuart: Add support for changing baudrate
>   serial: linflexuart: Avoid stopping DMA during receive operations
> 
>  .../bindings/serial/fsl,s32-linflexuart.yaml  |  31 +
>  drivers/tty/serial/fsl_linflexuart.c          | 972 +++++++++++++++---
>  2 files changed, 846 insertions(+), 157 deletions(-)
> 
> -- 
> 2.47.0
> 


