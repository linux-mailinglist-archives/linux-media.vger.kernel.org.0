Return-Path: <linux-media+bounces-58634-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0AVBEYKi3GnMUgkAu9opvQ
	(envelope-from <linux-media+bounces-58634-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 10:00:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C46A3E8A57
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 10:00:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99551304225C
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 07:53:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AB7539EF1A;
	Mon, 13 Apr 2026 07:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gIPnpE8v"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB80939A05A
	for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 07:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776066795; cv=none; b=f9bzWioJ8UuydZvo8qnbduf3b09kbStrN6nCZC19AZqke+LonK/OGrx88+45VEZDgk3PX1BixsrIHK+uj3Nuci6xcDXByR/vwtIK5EqNdC/KjNWHLxDxLJ2SqCsr96tFinQQ3m3Iy/DkdcHbYzBm2PxrnOydptJJU2TJv8hTbIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776066795; c=relaxed/simple;
	bh=qURxmoeHtBYQQZeErf/My6lgX3gSGhOBzfCSynLVIZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jp0IjIDIcr1Nk8LhYHnL+J/NEugcoMfIrhV6IAzHdbTBpvkhApP2OAV+lBdR7ObbLsxFdAPrDkKzS5EgHfnecjvepcBn+RZ71Yb8KHkq+5nwG/d6N8o7Az6MkK8rkaEgnOsxqTA/I3WM6+EL0gHl6r6jKm7aJAgbZPZSsZnl5To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gIPnpE8v; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488c21c636dso23625465e9.2
        for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 00:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776066792; x=1776671592; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5p9ZJZXABKCmpzl6zl3MItAQjfacdhE/eXpBJaxRNq8=;
        b=gIPnpE8vbQ2exAGgrElXM9dU70STAef4BFQKq90nihInyVoyXpgKxCEw9mlrbFj/kb
         S7S2h29ltdHHG1qeJlNWHgChOWm4Y/rRWEHgQfr7mtHD28Gwn5JRKrUgLV23IdRmzjfh
         tH/sr/QfsRO6eB+jLU7niWKVOc4qQedHYsXeySRo8lNL/JvS0PFbu9kza7Kb9Q+Fcgt3
         5RqJTNbgeTkk9JUtJyiUQGmRAmW158HQhRcDcZvh3ZWAPQA+nkuG31bU7MWKeIPNVyOz
         00Pm/L89QHb1AycLywmnOIkay8/dEdX4WqzI71z0Oc6S6kpHojXywOsVeg+nNj899hpZ
         oKDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776066792; x=1776671592;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5p9ZJZXABKCmpzl6zl3MItAQjfacdhE/eXpBJaxRNq8=;
        b=mWy9OosJY7GRNxD9+iCJtK168RxSvR+mTOZyGMi/5qYzQVeM+QaZTA540TF+SMmhbN
         fwvK32+7CU3+HmSQWcjqRoB82UASr9zchEpIkZ9tLbtnG3Y09aor1UyeUU77WoAXR49d
         6a6Ijs+K4d/67Bvblc6ZIM+kog4xonPGxnd7M6ysNRZFARe5DGpTpJuCoD/vh2N9Zkro
         ih6bNHJ8rCsMcgy+TRcUBnA/AN0Lhi/8lyGOXnagoCyrZIXMa7JFwAXy2kqXZXDciciT
         5rQ8gvR82y99eX8qNjp385LCc5KRNyxJMCHpBETUeNOt95LVFxyt5Ix2LSuZMWB9tHyu
         /qlA==
X-Forwarded-Encrypted: i=1; AFNElJ+Fw0kKnutVlF5IpcgRs0KSX6Vr/ZdOtM1xfTL+IKaPysUXpRz6pTNQu5X8B1CH3Ax1rUZSOpsdWYQIHg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz12Jqqi2lxSFGo1ala/SiRp6l9M2IL4JfP9/ctBM9LKKRvAIN1
	hfzSgoGrhTX/jxCIY8oftjIOeu1/PLuKl2IyJTMgi4/My31J2m+h5rxxRk8skOeH
X-Gm-Gg: AeBDiesTPXsP/fM+m73pXmf/Vct+8Z4Gfe4lOFuUzfyanCFxJVq1/jEwCdov2frTh7N
	dR22Qzv9cV+G8r1k3JpaSjiVKEEXktfQp+N67mMHteeuyfbYorN10hFmD20VV/6jPvU/0v6/R02
	pvPnXQmK5j/jJp6YecuMVHeKwZAZ/HGtwaTSqxmmQXCz1jsxoegBGSmE2UVd8Av9Otfurrm/uJw
	wElFxDeoFz9DV+CukMKaymiJiay5TfKdDcBVx6nqo7VgDZHmw2kADy/GJEH46i/xyxyIFtwzEuZ
	EZeKNVnJwhEx7Lup5KMkjGtd7foOymy7rkC6MUdGM7E/s38UFu677kiWT97DzFH82OxB1yFONBH
	F+ewFpf2qKU82NPIxR7c2IQ420J5OChsgrX2+bHWhdwesBcBIzpBDuMrNOIWE5xZVEH803r6nYZ
	7bx2vZv3jGt/NfNuZsEGyvFcV7MmComg==
X-Received: by 2002:a05:600c:a11c:b0:487:2671:fb8f with SMTP id 5b1f17b1804b1-488d67fa40fmr115755205e9.8.1776066792070;
        Mon, 13 Apr 2026 00:53:12 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5934a6dsm303076735e9.11.2026.04.13.00.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:53:11 -0700 (PDT)
Date: Mon, 13 Apr 2026 10:53:08 +0300
From: Dan Carpenter <error27@gmail.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, skomatineni@nvidia.com,
	luca.ceresoli@bootlin.com, mchehab@kernel.org,
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: tegra-video: vi: validate format index before
 bitmap_set
Message-ID: <adyg5BpDpi5I97-s@stanley.mountain>
References: <20260412154843.29056-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260412154843.29056-1-dennylin0707@gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58634-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,nvidia.com,bootlin.com,kernel.org,linuxfoundation.org,vger.kernel.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stanley.mountain:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7C46A3E8A57
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Apr 12, 2026 at 03:48:43PM +0000, Hungyu Lin wrote:
> tegra_get_format_idx_by_code() returns -1 when no matching format
> is found. vi_tpg_fmts_bitmap_init() used the returned index directly
> in bitmap_set(), which may lead to an out-of-bounds access when the
> format is not present.
> 
> This can occur when TPG is enabled on SoCs whose video_formats[]
> table does not include the requested media bus formats.
> 
> Validate the index before calling bitmap_set().
> 
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---

This isn't a bug which can occur in real life since the index is
always found...  If there were really a bug, like say someone were
writing a new driver and messed up, then this would just paper over
the issue and make the bug harder to find, so in a way it makes the
code worse.

regards,
dan carpenter


