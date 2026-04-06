Return-Path: <linux-media+bounces-58129-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPa6FC8m1Gn5rgcAu9opvQ
	(envelope-from <linux-media+bounces-58129-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Apr 2026 23:31:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C06ED3A78E1
	for <lists+linux-media@lfdr.de>; Mon, 06 Apr 2026 23:31:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8CD27302B229
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2026 21:31:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C40938F243;
	Mon,  6 Apr 2026 21:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WaXkBy/B"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2C01EA84
	for <linux-media@vger.kernel.org>; Mon,  6 Apr 2026 21:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775511083; cv=none; b=lrvPrtlTGhT5AGe1NNxa4eNc+bfvyZvBUWDVKwsHjKJRXRT0finf+wz+uSA880kqKxKlgRoukv+SJ2fO7f5cf98VbmvvtWUESpyIYrgw4hS7FBGYPkaeZE4eLLnMIyudkMs8omoN+bx6pKHWD3NgsYYeGe/v7wzmNqRPaZgRReo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775511083; c=relaxed/simple;
	bh=5lEmVosmeuBFQdJSXSghbeCTHfp905dvVKwXttkmT3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NAsP9zezMbAU1xXfNMoc3BOJOOgB3SJnuzMwJBzUOGsdpCucwJ0zdUGtlFs4dO00lPM5qNJ7SarWAirkt2qZGA5y6/D82KVnbB/unHKuJPCj1trc9inFkW6nQovNb3DiucLw0KQoO0zFMlP1k/qSNXdWaUEpG4ckPdU4HkWEUc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WaXkBy/B; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3878de20527so36378131fa.3
        for <linux-media@vger.kernel.org>; Mon, 06 Apr 2026 14:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775511080; x=1776115880; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GyThv2DxbTG/BKeYrv8aDgw2xYo6966hqmjyrursIqE=;
        b=WaXkBy/B5JNxJtY3l2yYziBbRXT7iNU4dF+0EwetGOr4UYJlx6FNCdw4F+amC4w9x0
         z7aHF5PaaRISQvioj/dT4x1w/36YlVl/bd9hsJRW69blxrq9cOiu53zBmMDXMqhSJSTR
         +RxcErgGzMzj9/p9FUeTfm19LvcKXyR9T9YBvUGto3S++ddte6z9lLwGZPBAko84szNz
         JngoJQDCwLqbL0AZQyMOtHfTKOXwWGoVt/8G1PhkxzJaXHggIxLzP4wkQe5xKb6ud96i
         FvBYDFehHyrR17LsY2f29LFfaFFqS5veLHChFRTzAXQ/k1VArv5B4FVyf3j82ibfFxK4
         ptYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775511080; x=1776115880;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GyThv2DxbTG/BKeYrv8aDgw2xYo6966hqmjyrursIqE=;
        b=V3anlow9PE7qeTOcAC7vdUqGNE4Dd7YJrFxHD7HFYqOmKwPvZTYOzKZj877fZJwrkt
         Rp/Mz+zUkX04vTS3NIuN2JYCPcxy0QkX2oL+0Ag+98LcaTEgvPIE0V9RJU8Oi+VyD+26
         P8YuKfxI0oT9AVL2bnn0sgUhyS+amDEkdLU4rqa+OS1p6t0omssl4ElrQuoU5cezLk5B
         eYl77hqgVDShoDyoyKQB/b94N1JGZZ3jJ8CLeEHZg6QcXmq1tqDGF2HzSpnfcplKIVPK
         IBBbgDX0yYfM+CTh6yioBkF+HTTx6eg8luJleOWHJvudjMNpB6bbwHBBJpVhbuJ86KtE
         r74A==
X-Forwarded-Encrypted: i=1; AJvYcCVuWeo9DDHXmb5scmp6r4u4bcXXNIOln22koXmhjYHS4UulhNDM02JJYf/qBYxHrh5ldAXUkn+JKEZ1qA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGR9houmKEX6VBB7yrVDgVP5OiFTA1zQACwZX6wRrBY/5R0ncn
	UZLhzaqF2kA+4rPcEl4bh/IqrHg4Gf1M27vnGsETiDXlv9bD6Sl4L4Aq
X-Gm-Gg: AeBDieviD1ESByj3Jxtjtswn0vMdOwYpVj00930Wtydsr7QYibjUGTu9naW8Y0+/yJj
	EsZGZqR5rc/ptkBTmVQJfbAhYg+JZL3fVB7/ffZvuI7fI4WPsy/8QJe4/L/HUKCJVBrtc7P8d1I
	2T9HDxc2TDaa+wIpRg7UxJwn01K/qhrDfZoi8bj6uKYzNTSbaAlar5K2okKwN2ohbzyOcZ4Uszc
	EwNQqTUens0vNdjDgbDZgnSrpGnVJgM3xMx12aJIKGpyTgb4ws61KeeMimIim3le8JqFALU8pls
	0PnufEV0n9NdTKeZHM625yPYddZloaCwDQP/JF6n0G+tP2nsNlG+tW3Y88bLqzCsvhBQ/losi5s
	LMJgSNijlq7ibRaKP9y87HPfv6bDAKIW/GFQVsaHA5xyzc0ClFn+c759NzlMrDUGQdCGRzuho2e
	Em2AxvGf3yIs7ONwPqfcX+5RSPhpY=
X-Received: by 2002:a2e:bc11:0:b0:38b:d8dc:4adf with SMTP id 38308e7fff4ca-38d9d439ed4mr46799101fa.32.1775511079668;
        Mon, 06 Apr 2026 14:31:19 -0700 (PDT)
Received: from localhost ([94.19.228.143])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd217c708sm32952631fa.39.2026.04.06.14.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 14:31:19 -0700 (PDT)
Date: Tue, 7 Apr 2026 00:31:18 +0300
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: cedrus: Fix failure to clean up hardware on
 probe failure
Message-ID: <adQmJhxNkAe-ChRp@skv.local>
Mail-Followup-To: Andrey Skvortsov <andrej.skvortzov@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260401191441.1217646-1-andrej.skvortzov@gmail.com>
 <20260401191441.1217646-2-andrej.skvortzov@gmail.com>
 <ac5oecJ05oZD25VF@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ac5oecJ05oZD25VF@stanley.mountain>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58129-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,sys-base.io,linuxfoundation.org,gmail.com,sholland.org,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrejskvortzov@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,skv.local:mid,sholland.org:email]
X-Rspamd-Queue-Id: C06ED3A78E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-04-02 16:00, Dan Carpenter wrote:
> On Wed, Apr 01, 2026 at 10:14:41PM +0300, Andrey Skvortsov wrote:
> > From: Samuel Holland <samuel@sholland.org>
> > 
> > From: Samuel Holland <samuel@sholland.org>
> > 
> 
> git am isn't set up to deal with two From: headers.
Sorry about that. The first line I've added manually and the second
was added by git send-email. I'll fix that in v2.

> 
> > cedrus_hw_remove undoes, that was done by cedrus_hw_probe previously,
> > like disabling runtime power management, releasing claimed sram.
> 
> The first part of this sentence is missing.
Thanks, I rewrite this part of the commit message.

-- 
Best regards,
Andrey Skvortsov

