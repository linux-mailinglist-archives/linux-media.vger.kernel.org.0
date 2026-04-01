Return-Path: <linux-media+bounces-57885-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLIHHjwozWnTaQYAu9opvQ
	(envelope-from <linux-media+bounces-57885-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 16:14:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E468837BF3F
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 16:14:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A826330CB1C8
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2026 13:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B066C44CAE6;
	Wed,  1 Apr 2026 13:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZHlgfvFP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDBB43CEFF
	for <linux-media@vger.kernel.org>; Wed,  1 Apr 2026 13:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775051899; cv=pass; b=oUQwobu+QIflNll/949DtSTdvP7aBUxgFR/9J+2a1z+bozV+16Mphr7YXBJXIoHk2pADGKJCx6EY3SvJB2D/Dvk9DovzQoIwVbzdBJtt3K22w4gZDUVuL87D6Ikye8Lmfsx5fBrZoIkzu//PtZBsX94QnshUuxlEqwg7oj6m5bs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775051899; c=relaxed/simple;
	bh=yhNeFedUdrXpT3X+DpvTR8s219BXDZ1Ce/bZiJGHibI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bge3Fb1QAsTbr6qlcx3Hiw9qk2NaAZToeGjHZdJ0tn7MZOzjHN5Kny61Dv+oBgVD0QPjeMDaRBoMvPzS6GY0S20WaErJb9WlfHcubjEiZTVmu7nSjwfpOLhdxMnVXtB4VKvO2kZlj/h/QwVKS6YfTytqd/KBO+10QTJ7HO7X/sk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZHlgfvFP; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b9825ba7e8dso958978166b.3
        for <linux-media@vger.kernel.org>; Wed, 01 Apr 2026 06:58:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775051896; cv=none;
        d=google.com; s=arc-20240605;
        b=X1TK5n90/p4LtbTw9wJ/VDvD4r6gkm+IhPsvc3JeXkI1mOG5d+OgX974Tvb6adUB3Y
         V66bOLuHXCW080iyfscWGjcY1EFnupENQvD0Oz9CKecZemxynFsNJDKtkq7gTTL9nKom
         ZAaf/SOhKtE28ihVmJWBj1rq5XzdqkbXU1PrBJQMSUzQtXrA1s6pCebvq5HSgRZLY0V+
         QV/bhGI/cbkLKXrtY3Uob+SWUYFjqCp8HBvCd8xfKlGdema9d3H8XzGY3L4u+zLQMHXj
         JxsB3xSLbDsUla9ZuUVa+2O45BB5blnf97cdNM09XXMbfelFoQaAy2/kFV5b1U1oBlAj
         gz7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7DEF1YQXfK11/0d7O1oBw13SL+FA7YK4uGSZjbMEHhw=;
        fh=D+CKpVk24NLJX4Lv92LahumC7P22WpDrj83HqsqtPUk=;
        b=aoBkBrY/4axUU3DNRuZbgBAhCfVO3Gj5M8mJ9rFt4lfjm6XolK1nP18st/oyXbH12l
         x71X1V1LrIwip/HdAuzQkFd6RpDOVrRc2UnFAu9v9asy1MAYy922AEkulny32d/SBhd/
         ooEudi5Xg32rMj+hIoyiHV578Rr4I5nFhv8p0qL5xceuk2Km39FOSpofX0GhTALigh4q
         u2M9NjqU2VQaVwfupRCtUw4v/9aeneZqHcScE26R+GJGjbeSpYKTIlrexn6EMIZob/Ke
         BVSY9GKm0scmUy+8HYK9IMCvVPLxJ1EWcfCUOZ3I6SA1TTQ9TjkrZ7GmdZWYjvbRkwJd
         D0mw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775051896; x=1775656696; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7DEF1YQXfK11/0d7O1oBw13SL+FA7YK4uGSZjbMEHhw=;
        b=ZHlgfvFPrDvqzg2KVh1915h+Hmb3ZVpuuF4vnT/UPxjBdp2K4501jk0FvI7XzGTax/
         NBWy/NkrWZSkV2J3ai6E2cGgoiorlnZynVtnvlce5vE1M8vKO/rvIn9kayruC3sBqA/3
         scLcLRtV+Rj8NDrLmufXInUlE6KV4I9YYXR7WxSV1wFQZt6ZoSlu5Uc73oaXNBQT+dRK
         +WuVcBPeH5Jun1jl3yvg/BwYF+SqzNnKmq3GlWArjKn/QlBLM9r6fsX5u0aaimk9EMp1
         zbDtLbpnf7izWG9TIQ4ganTKZheG4J6IsUCgZH8jKCiR4/dxpJjE764YUXUY0QJZzG0c
         YwsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775051896; x=1775656696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7DEF1YQXfK11/0d7O1oBw13SL+FA7YK4uGSZjbMEHhw=;
        b=nD2VdE7iZP0pzVzuQSS5sKtq/1F757F1RHBx5C3W/pEcjQkMc1/exQQCfcYbpvr477
         EpyNrQDNHDcb+vV4KEmV8GxX14bXlox6H6lTgMkCwgmg7/P5f7LrXJ594iPkGBhRKeE5
         OtMsXWW/9AqGM75XVFNyaRcK0XoeLNMgjYib+rUrazxNA3TcOdQGlKmY6DddjaeYDClB
         38O5R1NxxMwyssR0fLUOcE+//ZMdJASWTFB/tB1a8e1iovE4uNoEk6QVUY91g5baBrz7
         zVr/YnVxTQOb2M4NDxcAMUYY78VcF4i+FmxfTRpW1mvtaMg/0mVVFCcqyOLFGOptD2nh
         j8pQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkYSQgY3TrEYVLFMrAhpojRz2BSK1jNz+LMdtlHG+EvJIx/gZfgWDlqLjZ5wSl915u2ReggzNZVWOXTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDzQhrG5YU9hyEzF0T/aK5ZK+mnr8F94HknOm4MehvzqlaDaAF
	Le6UtrE2MsZswvoyeCLvt90wZwXRQ7aqgHeEoiLJPK0e9Vuo6C5Wpuj8XbeQXAcAfgJkLDPz2n/
	AJP+QHlgtBuB/l+0FWrI2kyejSKBuTYEc1dVY0y9AEQ==
X-Gm-Gg: ATEYQzwqK8Yc4MfmhLhhXOEfQK+zt+Hb5QF7YGpfxZ1ytqNUwHipuz78Ip5uONnZrNz
	KKvBh9GhZjStJCSXgb42EabsQNNaMJrLWAJRKUBL4/8i5DStnHvZGVwq96IRbfnCEC3spHvKCCO
	qN7gPLdlU2lHbADapvfz2PsEgDQICxWub+95wvTY2Cswz8vLO7P+8x8u7pn+UxSvIqjDt+2ff/I
	UVtQ4Mv/0BKG0/Y6fXkzH16XEsKBXiIBIH4d7Bew9cnJQhpEUeTwdgxRdnQML8mCrbheA7cm9jl
	Yc1AbX4/Th3DMT8BiAfQNLzbxTtP6LRl/yTSAfkPgXM4jYKsix0=
X-Received: by 2002:a17:907:1b0b:b0:b9c:2f1d:7157 with SMTP id
 a640c23a62f3a-b9c2f1d9a2amr89571466b.39.1775051896032; Wed, 01 Apr 2026
 06:58:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260212092846.61602-1-marco.crivellari@suse.com>
In-Reply-To: <20260212092846.61602-1-marco.crivellari@suse.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Wed, 1 Apr 2026 15:58:03 +0200
X-Gm-Features: AQROBzBZl7l3WfBtleDQwr-heugtdgr5-IFuzQx8NjWBHLrGL2c8RutfEnal5s0
Message-ID: <CAAofZF41vfedmXq5Ba-4eS3VkG+xTfjM4GS6dcBCrJ7fEY0etw@mail.gmail.com>
Subject: Re: [PATCH v2] media: synopsys: hdmirx: replace use of
 system_unbound_wq with system_dfl_wq
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	kernel@collabora.com
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linutronix.de,suse.com,collabora.com];
	TAGGED_FROM(0.00)[bounces-57885-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marco.crivellari@suse.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: E468837BF3F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Feb 12, 2026 at 10:28=E2=80=AFAM Marco Crivellari
<marco.crivellari@suse.com> wrote:
> [...]
> Changes in v2:
> - improved commit log
> - rebased on v6.19
>
>  drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Hi,

Gentle ping.

Thanks!

--=20

Marco Crivellari

SUSE Labs

