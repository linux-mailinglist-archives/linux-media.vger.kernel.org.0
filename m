Return-Path: <linux-media+bounces-66645-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ekajB1LvSmqwJwEAu9opvQ
	(envelope-from <linux-media+bounces-66645-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 01:57:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 650E670BC9D
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 01:57:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=IsOCTkf+;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66645-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66645-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EBC55300DDE5
	for <lists+linux-media@lfdr.de>; Sun,  5 Jul 2026 23:56:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7DD4374A0C;
	Sun,  5 Jul 2026 23:56:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E04B36403A
	for <linux-media@vger.kernel.org>; Sun,  5 Jul 2026 23:56:48 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783295809; cv=pass; b=cKQJ8w1FAUPPeiSImH2LTYysOPqhKNDeNI23xIMFnjSOKaC0Bb7E9sCpjTwUmQHanDqgpDjtvJ25nHwQaomKj6wIMnYokSKuNluRTeqxVmPjb5bX6Y9/JAoLHw3XY7oxFVb1WFHO9lKvmEYfU6eEWTJJgdzu+Vm+gbU4rUn8y4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783295809; c=relaxed/simple;
	bh=64A3RjqKwHf5tCXSdbvzN8P2GTNUK3YmMcpWKlrj2Dk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P0sH9rel+jpKIUIt2tgItlrbS7nIqrgV5+HLggonb10wWBYLZEqzUNegj7/GqeCr0O5GysGpkzRq/ZiPEgSZLXXaFLBUVlupF+i4h3ryu7J6v5579Te3WsGX5qRrWToWz7X8red+BXs0n0dRkjsKeY/JnanOzLdFJc77M/kZpII=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IsOCTkf+; arc=pass smtp.client-ip=209.85.161.50
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6a17e867991so67595eaf.3
        for <linux-media@vger.kernel.org>; Sun, 05 Jul 2026 16:56:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783295807; cv=none;
        d=google.com; s=arc-20260327;
        b=ZXg7/qMLNP2lGxwjOloeu69ifGrnRPTo/w0B8kBlhNauplca32k0cmqwBwiK26Rilq
         OMlMqgYUcztESA32n6m441QCGP5F+4P60v1tt1nF1zGuTe5SDiNOU7r5BAhbjtcfyRTj
         psWX6fYLDB6rwTVPiuAlx32nFsNk0O0fOH2I8Iqk3ONe1aqwxCYfuhibG4Qqirni+6TE
         d7SIl9FM9LPdVVvlawdAOeYOT5rCgH1XqWAXFxrqc25ryq35SeG+lU/wZAUwa6+44MoQ
         nwnawZc4BlmXaLDNM3ZgaBeAg5J9MXgbe7Gm9TPvRYO3khGTzDdAyiR4+2C+dk7vRXRQ
         H2ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=64A3RjqKwHf5tCXSdbvzN8P2GTNUK3YmMcpWKlrj2Dk=;
        fh=yhugYcyN4mhfAmk9U1+/LZ02+0TaP+wvxit25nQGC/E=;
        b=nOw9qNCuT4CfZ+OX6DbP9bqox5u4PZr7DsqsCRwigWspncLwcvk3bpPAAoy+/6KUgm
         NB/0B2FLlX6QrQUDG/A2Y/b0NT312HfjCpAi9Gg+5OJ55bENk9ahnIyl6YEqxbKJZF2r
         yJyVk1p4769ypQMj1aFMZbl7sAcTvQqO+Z16R90TzPiKM06mNrCasUERTSfNV+YUBcyH
         Y/Fidwhqfe2OjCQITRUZM5gU1vdfGbH+SWAC9xTUpVoKLE6qZuYhOUSMKDhi/DiYq5Iu
         qmin8gbOsVF+ugr3gzFVheEHV2hW2Rko/loVL5m7yAY0UqaY100eu3076E3jwtHVpE8C
         hFLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783295807; x=1783900607; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=64A3RjqKwHf5tCXSdbvzN8P2GTNUK3YmMcpWKlrj2Dk=;
        b=IsOCTkf+Fu7pbI0GDTAoLyMssHuAI7N8W+7bjqr9jFL2+Ml9699i5OmSpwcGxDuEIZ
         KF1Sow3wegTfa91WL0TN7HRAWVtAZoLQ7TSQxujbsLei0Fv+K1gbivEWPg6cvacg2RR7
         gIzNnTdK5Mb9nd1Dz19e+6joH3EfQIC6tppvSXaiQWB+7KOuUHdtEQpLpyAJHf7fZIPT
         z5JCxau7d0qP/dHxe2ZX2dGrT4f5r1OcD6iemWKjmhQqWpAmrByJHutL8XMulKwyMK/j
         Dq4wwK+FHaswgY0hLFtZRc+AHm9kIU2N/HTwc03LY1IbFJlS/JhKPZV8qiSYl+QTaYQC
         Pn3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783295807; x=1783900607;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=64A3RjqKwHf5tCXSdbvzN8P2GTNUK3YmMcpWKlrj2Dk=;
        b=nUBEYN23pOwQTkdMNMzPRKFDzYguczFNiehqb/10BD+RMZCM2+X9oiq5/ruq+2/63i
         HCxB4T9y8PGAq4ph4VCiwniqrbhJ+Q/s4S2BHNjjZWs5gExy947BiQiAFdX9A2Y6aqhI
         INuKBMmyd/DgZPfDh7CfioCXU3iDqdFRtCtXoBvjks9WtiSbfRGxXSu+L5asdH4xJQDH
         NaJ10Xq8NF5raHkGYYymgUn+xZ8R+eXTIU4Jr8mQYrTRHWadrrMaZ2xlZbLvVDO9viAR
         Ee+osgGarxrcFDwUVNucMLv5X5jbtSs9y1jH3NiXkdRs8BLU6VSRHlhskWiM0h3w9nFL
         a0tg==
X-Forwarded-Encrypted: i=1; AFNElJ9PAYL75vnBb9lQsGgYCtSdkIRTB4gsmQ8Vg9II+PyoFig4sFFRH4FDCWOlHyDLE1YgV5BBYzfKv9qwYw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/QkcSbwNQHNhbelMQ6E9dYbpiOVcq1pUbHs7mlMg+o76LSd/P
	NcSww/7DdJoQRgwb34qdgHRVnDI4jZ7VMhcCPv0ubJ5eXFuFpLKQYRsHrum7/fVcyx8MB2WFcWG
	sopZ/VYYcjl3EVBTIXx8ZaCAlGlZoF88=
X-Gm-Gg: AfdE7cl4ISAT9n4KJ/Z4mZEuR2RS5L9ihKR+dE4Da1WTawvJ9GwN+g8kM4ZQpoWltnE
	J8bj4jScFxqNvLPq3NYVxL2YuzPiIbfKMMBW7Z1ozq42A9HA5sxEvIOnDRmagg5Yc2z/Iens0uL
	76SY6MVeFc1xdzaKJhpiiTNZiJqSGgynhOtdREK07eBFr1HUwmLAuntiDmnz/h+RZ1d8Y702WMM
	Kqgn3G0X3u0dUXDPtnh1XfkDFfxD1tSl7C3sKMGQhl2itw+sk1OVOoNLGecJw2F/eUAsV5Ik8Tq
	uC8vm4vn
X-Received: by 2002:a05:6820:c090:b0:6a1:334a:90f7 with SMTP id
 006d021491bc7-6a32d8e1f4fmr1968742eaf.0.1783295807040; Sun, 05 Jul 2026
 16:56:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260705073844.146578-1-nealpatalay0@gmail.com> <akpopoFZyWW2e9En@ashevche-desk.local>
In-Reply-To: <akpopoFZyWW2e9En@ashevche-desk.local>
From: Neal Patalay <nealpatalay0@gmail.com>
Date: Sun, 5 Jul 2026 16:56:36 -0700
X-Gm-Features: AVVi8CfaWYTJPFlFAn3GUSPgkRxVwBdu7ezv3P3Yzznr9ibVYaCCBIIVkcP7O3I
Message-ID: <CAGjuiT_WMkYOJJ40AJPcF_mbyZv+0pvgMOv8fp6hxPN29N_2Wg@mail.gmail.com>
Subject: Re: [PATCH v3] staging: media: atomisp: refactor pipe graph dump
 stage formatting
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org, 
	gregkh@linuxfoundation.org, sakari.ailus@linux.intel.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, mugrinphoto@gmail.com, matt@mattwardle.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66645-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[nealpatalay0@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,linux.intel.com,vger.kernel.org,lists.linux.dev,gmail.com,mattwardle.net];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:andy@kernel.org,m:hansg@kernel.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:sakari.ailus@linux.intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:mugrinphoto@gmail.com,m:matt@mattwardle.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nealpatalay0@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 650E670BC9D

On Sun, Jul 5, 2026 at 7:22=E2=80=AFAM Andy Shevchenko wrote:

> The blank line must divide the definition and code blocks.

Thanks, I'll fix this.

> Missing period at the end.

I'll fix this too.

> If for some reason len is > 0 and offset is 0, this will write beyond
> the boundaries.

I'll add a check to make sure the offset is greater than 0.

> Broken indentation. Note the statement fits a single line.

I'll put that all on one line.

> This will continue writing even if there are more than 3 lines.

The original code completely removes the third line from the output
by writing the third line into enable_info3, and then overwriting that
buffer with everything after the third line. I'll assume the author meant
to remove all flags after the third line.

