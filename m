Return-Path: <linux-media+bounces-57810-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAEoHb8kzGnHPgYAu9opvQ
	(envelope-from <linux-media+bounces-57810-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 21:47:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4F9370CF6
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 21:47:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8712430B340D
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 19:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3D533FA5EB;
	Tue, 31 Mar 2026 19:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qbIDyqoK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3213F20EF
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 19:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774986211; cv=none; b=nb9QnYFdWVmw8aOKfXh+fo5aCmswtH93oN/LRxPcM9j0Sw4sRP1YuqAhRdaRRUbZtBnx+spEYAqPpk7XOpAtLiR8AyzUQ1v3yy3xf5yWBA0lxxxwIcTYOZeDu5ANWlJhR5Ef0W/ei0m4YHlZTevk1Ub1fo3j10TrbdNUT1x9Pms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774986211; c=relaxed/simple;
	bh=/MNqRrFHFC2WqhLreC+/2rydPkjQ8ipbpo3qxRn9Epk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bjw+9Cwkie1D3Vj+v1BDOoIcrxszQIYnQxukM6gwlInM+p/H5J9s86Im3aAtIydFXnpsRSuHtmn2pWWsRmXOOElQFBLDlz2iY2CWHquLJ+IosCzyd0K7YMpU4PhIc1PEHPq5wDOnfebnl+4qTdN2UE3nAq20dtCcXHB6/C/qbnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qbIDyqoK; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-79a535e7c00so30259317b3.3
        for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 12:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774986209; x=1775591009; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7dMNu0l7hZLwXtDpNqW37ilehWYmKAByHIWOjqdmC4k=;
        b=qbIDyqoKT/zjFjdqaPelWJjQdNwVr/BgpU7jODjzLaGZ0chGs7Z3peB389VMRUeDEh
         kyfQ3ivBZSZ9X0501Stobg44I2MNAO75qVhnkZ7ILHoyDLSazQp2HxErzIeJe/zUjbgV
         t9Zww/InlgiruLPs9azT7MxQCP2Ir00cbHmtG2bG53vw5MtmHyJSl1LtXCU8iopDMhZx
         /u1eK/Qj1RV6JrYW1T3HLfEI6F6/JhUVUZVHRSVmooHnTudV5XmvZJ9RgwHQyiQMiGSi
         oXG8lv3Ggih/bsGfYpLrB2XXLYFIlKuJAsfMZW21CNLDHKUweZprcK1G1rze57+ndExk
         AgOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774986209; x=1775591009;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7dMNu0l7hZLwXtDpNqW37ilehWYmKAByHIWOjqdmC4k=;
        b=px9xPnuMEImVy7Gnv2zVrJjrgPuMLyOTzKjvyCKQd21pEjKeVF0Ai2xQpLaJf9Ztsg
         6aXyDNl+Q/C94eBiszajLZhZ2BUGcgbvFTiD1bLqL54CNaAT3PQVu4P3TPD8TaxANkZz
         XKgMHf2T6sXlEXy4EBJXkCU7AmPK9WJleLZnJyi5kqSM+6rI/MWyuTBQwafU7YjArYvS
         32h/PIW/f0w821BW0uB6kQ+ePhJ/HuQmKeJuQL5SUwz8slJofUBXK+b5DqycVPkXoUd8
         HZMKZ3afv6tnC3Xosn2oLr4luDRQa7R/hPXhWj5ISaJOZWBuyUu/a/JsymTxX9LgIiLB
         XUrg==
X-Forwarded-Encrypted: i=1; AJvYcCXRqMERooDdj5x8h6ySKntYYtvJGhVb3UadiRUtVOGijjG2fQNCCaJR1MONlWgy0vi+U7actXcV5Akvrw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwWwQm8aM0M2WpEr0mVEKpMGkEyPLuiAbnMSOIxEZQazIXmdbO
	dmIh2XcqZaeQUnS+EC6pHxL3jMmi5FlgQgXAMP+ttBBT9LibFh3dGlns
X-Gm-Gg: ATEYQzzsYncEPQJLLwYRXpsp5abT14fWk40mEw32q5TQ3r0R/OsobSc0qUPwbtxlYyH
	ZMW3b2Ccor1sw0Uufgg+kqjpaip8xEOATtgnv7G6oEDvK6smEylLsmOzPb1AJ7EzK1vZwWuqOUl
	BB7kciUrRcimlbuRu+uK3wrQXGnm+kXqOnVuiV1r5bSCnMimptAivsNlJdjAdKg8ngJhKl/v8Lg
	9H2A/4Li3UnNSh4FjQx8zvvVDBlaQU1X/lwz7zM95pCoc37ahwTCz77Xan3kFt7nYwjYgs8DMon
	UQvFF3VAdsDRsMpNMEdm+VTp8WwfSsQ1KYp64ddYVNcWknhnbUwDkukevaDLF8Ftntsu4Z0cXEh
	wbXAP7OlcavECYrkSbnO/2OLZ1c1aTHWZf/8RGE2GnLmqsXtoB7Lcd7twgpkACt/MGwPtkroahS
	TX3jktIOCYgG5+UBDPdY6Ey1m70nuESWpg/wI=
X-Received: by 2002:a05:690c:38a:b0:79a:c7f8:d9a0 with SMTP id 00721157ae682-7a211e4ea2amr8562427b3.33.1774986209251;
        Tue, 31 Mar 2026 12:43:29 -0700 (PDT)
Received: from localhost ([199.7.157.124])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79cb7135d8asm53647957b3.4.2026.03.31.12.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 12:43:28 -0700 (PDT)
Date: Tue, 31 Mar 2026 15:44:12 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: David Heidelberg <david@ixit.cz>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Robert Mader <robert.mader@collabora.com>,
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v9 7/7] arm64: dts: qcom: sdm670-google-sargo: add imx355
 front camera
Message-ID: <acwkDD7XsjMGucQ9@rdacayan>
References: <20260217002738.133534-1-mailingradian@gmail.com>
 <20260217002738.133534-8-mailingradian@gmail.com>
 <1349f725-a20f-4935-a829-208c8e583ad9@ixit.cz>
 <acHxgIsyPiQTeqCB@rdacayan>
 <eff25adf-c5fd-484d-a9ae-ec27c0d9c100@ixit.cz>
 <acJuN_FRqMTGgl8C@kekkonen.localdomain>
 <acsjH0tZ-jj7N7c5@rdacayan>
 <actxn5kvN3auqCBm@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <actxn5kvN3auqCBm@kekkonen.localdomain>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57810-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[ixit.cz,kernel.org,gmail.com,linaro.org,intel.com,collabora.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2C4F9370CF6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 10:02:55AM +0300, Sakari Ailus wrote:
> On Mon, Mar 30, 2026 at 09:27:59PM -0400, Richard Acayan wrote:
> > On Tue, Mar 24, 2026 at 12:57:59PM +0200, Sakari Ailus wrote:
> > > Hi David, Richard,
> > > 
> > > On Tue, Mar 24, 2026 at 10:35:24AM +0100, David Heidelberg wrote:
> > > > 
> > > > 
> > > > On 24/03/2026 03:05, Richard Acayan wrote:
> > > > > On Fri, Mar 13, 2026 at 07:26:47PM +0100, David Heidelberg wrote:
> > > > > > On 17/02/2026 01:27, Richard Acayan wrote:
> > > > > > [...]
> > > > > > 
> > > > > > > +&cci_i2c1 {
> > > > > > > +	camera@1a {
> > > > > > > +		compatible = "sony,imx355";
> > > > > > > +		reg = <0x1a>;
> > > > > > > +
> > > > > > > +		clocks = <&camcc CAM_CC_MCLK2_CLK>;
> > > > > > > +
> > > > > > > +		assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
> > > > > > > +		assigned-clock-rates = <19200000>;
> > > > > > 
> > > > > > Extract from #sdm670-mainline:erebion.eu discussion:
> > > > > > The imx355 can operate on 24 MHz (on both Pixel 3 and 3a), but Linux kernel
> > > > > > driver can operate only with 19.2 MHz.
> > > > > > 
> > > > > > I assume it would be worth it mention at least by comment here.
> > > > > 
> > > > > This might set the series back because the devicetree isn't meant to be
> > > > > written for specific software, but it's included in v11 because you
> > > > > already asked twice.
> > > > > 
> > > > 
> > > > I would say node with lower clock frequency is still much better than
> > > > nothing or placeholder saying "i2c camera here". Instead we'll have small
> > > > placeholder that value can be bumped to 24 MHz. Important is this can be
> > > > easily improved when at least one consumer of the device-tree gains support.
> > > > 
> > > > We have very scarce support of cameras on mobile phones in mainline, thus
> > > > leaving a comment that HW can do 24 MHz is reasonable compromise IMHO.
> > > 
> > > The bindings could document the supported frequency range.
> > > 
> > > In DTS it may make sense to set the frequency the vendor uses as it may
> > > affect the link frequencies (albeit I guess they're the same in this
> > > case?).
> > 
> > Is this review relevant to v11?
> 
> I'd think so: it doesn't mention the frequency should be 24 MHz.

Ok, please check the dts comment in v12 when I send it and continue there.

