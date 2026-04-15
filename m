Return-Path: <linux-media+bounces-58834-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOi5Auq732mOYQAAu9opvQ
	(envelope-from <linux-media+bounces-58834-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 18:25:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 557EB4065B8
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 18:25:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13135304AAF4
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 16:23:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A79723DE440;
	Wed, 15 Apr 2026 16:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WjSSL+X6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9E031960A
	for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 16:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776270203; cv=none; b=UO52KpuZM3Ng+8wVbHqRucjkw4Vf4sT8EEeHpu849K67kZtf+sovWYsRWGzW4Ilc4LuyWhD+ShUks0/amOEHDJwJTUovVkJubj5Z5VCo5kD7w6zjIqJWScWsQimvM+GsQ/BKkMhdeBbAycIosfMu+jNP+aUvfcecXmTVDbndijU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776270203; c=relaxed/simple;
	bh=GHCU+bbFUJa7ME8vQIA0RMnlQLkMVDn7IlOjIXvxDPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iOE6Zq2XAGivg9JHABEOWIq9EmXMqJGhLAcFkNXzeiecNjbKJLYXZ4aCghq2uR/HU4KKbbQ1RBCqihWaXHXt0dGfrr61X+MbwnIbu7OQo5os2fMv+SDsDpGncx7nF6ln5b03X0cXrzH8ik3hHb+sajeOtGZlM9qNy8H3OhH9h4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WjSSL+X6; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-483487335c2so77364765e9.2
        for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 09:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776270200; x=1776875000; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w5SisJyRtRtkzZampcjxbirVuB3MRSAAjgkwq2Gw8Sc=;
        b=WjSSL+X6JDeO2S1BJpPtDeL2FcKIOcUCqNlaWAg3Ek6pA7f9NijP0gKsEFzpqnIu0Y
         drSZ78NWNxOvopWtzq9Idch1n3hguQlSHyriTDYH2/Bp4ffESe5VG4MgIfOkr5ftl8YU
         IO237cT9BkEbPb4jvMqunRSqorKD9BWc7LCsF6g8RRxKqbnSeawGZx7GWLuw84B1SdsN
         oUhzkDNBzmFWapilsMRZ3UokwLgaua8tGpaH4eiTcjq2scK64xgIKhbR6lLg1FBx5FUT
         EmZgTnU25IVvHNn9V5MGg/kvMypvCze4oo+J918WMgmZlir+XNX/A0uLlpfP9zVVSYXu
         uhtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776270200; x=1776875000;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w5SisJyRtRtkzZampcjxbirVuB3MRSAAjgkwq2Gw8Sc=;
        b=c2RrXwCCn9cumJ2LbBUacB490kLCaPEygy6CeuKlGN1Kwzu07l/FDT4dfPH8942MSi
         Wp8wgHYtMr+0Ny5+jN/BjY6vlupIjByfDjDrex75xJ71iU4ds2qZllqh5AcA2zsW+f1B
         JgqG+Rr9RDCzuMcr3LywdECJLS9oHo+wDv4/JZ05Hl3bSpPstQhzT3IIQRrQOetHtzQ2
         YL1MyKdER4VoNIkSZl+yfwvrX8um8rg7Jg3Sstyy1ViqH30N/w5nZljZrANM8Mqktx62
         8C30SzKxNcLWbE6cuX+HvSo+Nn7UQOpE6VR+ZW4I0e8EYKeYdWmfdvsa+Flxr6RD1C37
         pKng==
X-Forwarded-Encrypted: i=1; AFNElJ/gsLC0G9JsB0/TmD7WuuTZ2kKz+F0aAcbHTnw7TD8OW4ed4NpLqLChCCdu8mu/dTS1difdpXAEIhQ/+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt/90Fxw8VECOu1Op/BfTF7B2mJrmfmx51QISaxmf7Fk8yUklr
	Pv+J8jGqXoQnApVhPRD1xu+LrpKd6BV2JjrG8sYQwMBteNLes17vjQoW
X-Gm-Gg: AeBDietjpiDKtcdHtS4uycSr2q15aFfj8cVl2EKa7WgcqAMRgw6/XJNo/uVIJ1Yf5Rg
	4s2tQZff/ouogo4arrWjBfwvceYgyatleRhMNmg1U2+TitWVT15SrbmXzmtI10eM5DPwjJEiguy
	IJ/IR32fjORpa4c7yXDN91RzqiA5QcuoaNmGhUQz524LaxxiXgE0W1XHCgqEae76EAxFe+U7ABa
	oMgBkYdSEEU5mFNPZH8yXWhJTOJH1eZKd3goomPX+PLkJn3MLmSqCgNKj2kVQQRSlFgXwOxTVNd
	mhY+iyYljJsuyLRm+VcSYMgpotSILLBd0UdbRUYp1fNAtKMT+NxrHYgAvI5vjaUU/NB8jwG0zs3
	vNA4cxhLvJoMQ7g7Og8jOVk5Ze39ZjNf3Y4q6NEVA/Fyl9whT0zTkAvCS2YiaxMZM/4ARDYJ2gy
	Ih2asS+Qfki/zZhkRDhro=
X-Received: by 2002:a05:600c:8284:b0:488:d228:a133 with SMTP id 5b1f17b1804b1-488d683d280mr295721625e9.14.1776270200141;
        Wed, 15 Apr 2026 09:23:20 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f0eac687sm22601145e9.21.2026.04.15.09.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 09:23:19 -0700 (PDT)
Date: Wed, 15 Apr 2026 19:23:16 +0300
From: Dan Carpenter <error27@gmail.com>
To: Yuho Choi <dbgh9129@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Peter Zijlstra <peterz@infradead.org>, Kees Cook <kees@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Thomas Andreatta <thomas.andreatta2000@gmail.com>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] media: atomisp: gc2235: fix UAF and memory leak
Message-ID: <ad-7dDQTF46ijzzb@stanley.mountain>
References: <20260403002319.12771-1-dbgh9129@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403002319.12771-1-dbgh9129@gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58834-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,linuxfoundation.org,infradead.org,gmail.com,vger.kernel.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 557EB4065B8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 02, 2026 at 08:23:19PM -0400, Yuho Choi wrote:
> gc2235_probe() handles its error paths incorrectly.
> 
> If media_entity_pads_init() fails, gc2235_remove() is called, which
> tears down the subdev and frees dev, but then still falls through to
> atomisp_register_i2c_module(). This results in use-after-free.
> 
> If atomisp_register_i2c_module() fails, the media entity and control
> handler are left initialized and dev is leaked.
> 
> gc2235_remove() unconditionally calls media_entity_cleanup() and
> v4l2_ctrl_handler_free(), but these are not initialized at every
> error path in gc2235_probe().
> 
> Replace gc2235_remove() calls in the probe error paths with explicit
> unwind labels that free only the resources initialized at each point
> of failure, in reverse order of initialization.
> 
> Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
> Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
> ---

Thanks.  LGTM!

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter


