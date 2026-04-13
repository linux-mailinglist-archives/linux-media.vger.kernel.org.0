Return-Path: <linux-media+bounces-58654-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENumCWy/3GliVwkAu9opvQ
	(envelope-from <linux-media+bounces-58654-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 12:03:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E0E3EA283
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 12:03:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BBCDC300C013
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 10:03:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 056E43BA222;
	Mon, 13 Apr 2026 10:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lVYWRSkf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0B13B892D
	for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 10:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776074579; cv=none; b=DS4i32rE9ci+YaKXhzMFEDsKGdXtQ8RiR8+t0JCTaAyegeGDIGftDymcphzOklPuahGzX2EwEqEJszeHYZ6hMRkVtAq9Q+tRlfHIaaZ4n0byas9gAmmXVJ0VPmSn/eattJvQxhp9Z4oDBFAhe3tIFuiKpmM0obZqQ3TterF/1x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776074579; c=relaxed/simple;
	bh=kcFblZIautjwHK2Vy2J3AGSdQpVSXAg+nv5VyeOoIG0=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Cc:Subject:
	 In-Reply-To:References; b=UxIhlnldOe+luMoUaAFzKjyPd98WmND9x1KAwWGKLYoEJZsOnsv6vp/c6dMeJKotOL3hqPOpKXkNhyrZRAkzSrni/3M6uuChlN4/mjGn9pM9b1cAvSutSZ2ATRG9i2kumZIanFW1Ruk+hhivLeUy841YRCJEAStMEzIZPAtgzYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lVYWRSkf; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-66ba9898ae8so6324021a12.1
        for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 03:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776074573; x=1776679373; darn=vger.kernel.org;
        h=references:in-reply-to:subject:cc:to:from:content-transfer-encoding
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=09a3O6d1W+1rc2kx9Pz8OV5bGy+ArYt+o+cPEdWVuHE=;
        b=lVYWRSkfHe5q59cGnMsqB9WrjsW6BHINQrgyuXGUh1+uv74lf65Xd6WnJXJSYuqGil
         D/By5bCww61lwJUn9mZFql+9VTNvbv4i3KhK/PqbX/eUq19n2B8iDii+fbyYJNb4DKaD
         DQRT0vNCWRjgHyj9RNqDmUfMccF1B3FB1yxhBrcPq0jeZNa0CXfGlfNTFLzWD/csk0tA
         wEXbBc6uqTYrfAcuItuxT0uPTgJIjV/i+dAk/6ehtHh6POmXi7ZsLzDvnYPFQhewnlXK
         NYNE5fN8eF0o3lypOvU9ko1xcpkZy1NMErTtWC41AR6994bCK0ZQ1l43DcAYRWYhLPJ5
         aaxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776074573; x=1776679373;
        h=references:in-reply-to:subject:cc:to:from:content-transfer-encoding
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=09a3O6d1W+1rc2kx9Pz8OV5bGy+ArYt+o+cPEdWVuHE=;
        b=n5Fmr5p0MPctQWdtpk56LxPV+lVJjYkDjSM7oFvq9BIJ4pJWuJI5U6cpAiDfAQYfu3
         ScSoJToBJjn49W9OYhwP0JcXhmBUrv2dQFvsJHgUogp42KM+6nU0xEPZVBnwvfqUMn/H
         jPIn5BTIkfFrEC7YJGsBM3ToXli+uOONi/uh/VPz6KEk3IxeZf7tOl3L4AlI7JNIScFe
         4S4uYUI2XKkIvF1TnzSqhhLfRlUX46N4Q2MXDyH4ZT5BdmnKZF7cDVagXldUntRcbk3Z
         5P2cCjFsOZSTTOqpOJkprl0wPJ6K39zM8EvnfBZ5+nbbTELfCljtIl/bEiCK7odj6KLS
         EwJQ==
X-Gm-Message-State: AOJu0YxFORsEJd3A+wCXlNJj+VXm9Duf42+jUPipGR8wxQfFPuah1Lm+
	OczfWHN33gN7zJBB7Z36+kjISSRVi1bsS7pXd62m+/DMg/1WAS3dl26i
X-Gm-Gg: AeBDietUP/JgYASI7MAVTr5quQq5pvSfCb9vG5hjfQn4M/YwGiVPv+qwidEYXCYwX01
	ITKKiJfemyGUEmkF5VQFB1S6OWfLRUejAHiPFVw3U2KujFfoKiJH2X9BRWpYNHtQtV7uN4cyhHs
	8kpnew61hh4LtXiLN3IZ7lXOIpIB7glYXpWsnImLB/OVnXsg12OBWkw049FTd+u25cTDyYdPcCb
	G3sRdlauBLGqq/fzFDe+H2Btxcj6UmvUv0VFYxlb4UMn2dLnbzLG7NgurJhKHjAXrJfS3Dqnv3N
	tFXxN/JPHl+PHcymVJP91j/2sg8+ytYdYdMI972OPn28PrDFOetkq9HNDsg3Bv+/3GfAL/b4VL0
	6wF+UtxQhP0BDNpL6nzO1a0uIeUzUNlnE1W3j+24esWCN+SxGg98JW2kz/yKgK1S1V6cp8ysqK7
	eQ27sN2+5/h0g6DCZFRu7qSxqPYJNHxgXVrJdwmpjwXMcFSbH0k4xs76ARmY4tCrY9ibvCsTgCL
	k7b/CMZvmwpK4GmAWPaMYmNYO9QMtEvxkyY1IBbCmoqglpZdttZjwq36Em0wQ==
X-Received: by 2002:a17:906:dc8e:b0:b9c:ba09:db7d with SMTP id a640c23a62f3a-b9d76d8e108mr590538266b.20.1776074573148;
        Mon, 13 Apr 2026 03:02:53 -0700 (PDT)
Received: from ahossu.localdomain ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7c8a78sm298786666b.50.2026.04.13.03.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 03:02:52 -0700 (PDT)
Message-ID: <69dcbf4c.170a0220.3ae28e.ec02@mx.google.com>
Date: Mon, 13 Apr 2026 03:02:52 -0700 (PDT)
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com, bingbu.cao@intel.com, mchehab@kernel.org, gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] staging: media: ipu7: fix double-free of pdata in error paths
In-Reply-To: <20260412205057.386856-5-hossu.alexandru@gmail.com>
References: <20260412205057.386856-5-hossu.alexandru@gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-58654-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hossualexandru@gmail.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mx.google.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 01E0E3EA283
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 13, 2026, Dan Carpenter wrote:
> We need a Fixes tag.
>
> The put_device() frees isys_adev as well so this is a use after free.
>
>     ret = dev_err_probe(dev, PTR_ERR(isys_adev->mmu), ...
>     put_device();
>     return ret;

Good catch on the use-after-free in the return value. Will send v2 with:
- Fixes: b7fe4c0019b1 ("media: staging/ipu7: add Intel IPU7 PCI device driver")
- Save error code via ret = dev_err_probe() before put_device() in both
  ipu7_isys_init() and ipu7_psys_init(), then return ERR_PTR(ret)

Alexandru

