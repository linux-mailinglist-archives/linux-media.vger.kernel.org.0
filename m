Return-Path: <linux-media+bounces-59957-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YD3QMkve8Wn3kwEAu9opvQ
	(envelope-from <linux-media+bounces-59957-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 12:32:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B82A492FD2
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 12:32:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D1F4302F9B0
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 10:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B93AF3E4C94;
	Wed, 29 Apr 2026 10:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eGGXGRcy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655D63E5594
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 10:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777458673; cv=none; b=lLEq/OuoZKPnpvNFk1ijAqjDrrq3QpcC+Vn+uKpH2AyFnQNH4ELPocGMdiElAi70Y8jGCOpBmUTiiA9bpRmFT2BuJccW1nAMUXR7ce/jHrb3UcffHmY9GiiG8isidrWCuxYHzgG6Rt66Uf4/0ICq8SVCyJ6ApI7hUNvkA7MA5m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777458673; c=relaxed/simple;
	bh=IsPYo5A1NKgvPCB5OTEUwXERR7zAmjTkNZR4+UsSSBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IHEXvEPeHLHA0ZrCUO/0tB15Z2jVLwZ0WuYkdvq6kveCmykFNvUYUkLiVjbDAxkp3mEb3seuk/ppC1av6nO5fbqSuQ3bjG31hXT2GU3Qs/cYbP8RBCuGpN94lyGdocHD75ka8VD79D/pct4EcXlg/rCE5YtsH3d2/GExYN1c0mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eGGXGRcy; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so89365565e9.0
        for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 03:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777458669; x=1778063469; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2n5GHFY1IUCVIi1ZttxoD6PyKrxGhAIV1l0a9WHxBdg=;
        b=eGGXGRcyUpb8mpfFZHKsjFBQFzknnVKs9G4+uEZhUmXvAPeLUaqApncfo2YZfqjrmj
         RyWntMDdcVctQCWdgUF92fHZunP/VuWMkZ5F+wlwJnJqeAdvSZ7vVMiZa4kzUlgxtjxT
         ilQrKQeZXF9SKrQr3bXX73IOe7FJpYByR0LBIp3JeP73tm6+8+TsEYmC+DpukeZqB4sz
         IBARE7UaJhhDeRPFN1idCxixuNSAYYsjpswtyz50ubMXroEIF1coe9f4+7elK6aEeJLo
         UDWsnI3jxc9ZVOlZ93KbSBtNyYFOmvlXf3k2lIDHV10WjpU0OEIGn9JhxBWWFhr+aqXy
         IZxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777458669; x=1778063469;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2n5GHFY1IUCVIi1ZttxoD6PyKrxGhAIV1l0a9WHxBdg=;
        b=A9/cUk1SUHTZszGeJEV2o9X1Wz0OluFs1DWiFxIMZv3b+7u15sjomAwvi4K6l1l/Q0
         TTNjs0cP8AyXRg/PagsDejrv3CqoIo3wTjaC+2xo/02sTwV62JHCwBzm6cFOwrwSwsZ2
         ELaQ4VqyAZgtKoaGNPwyzTo7cltBZVeakrAnZDFkLv9s9F2sgi2az8HM1LyBBXz4jI0j
         LLjfG0nbgDxN4R6eFK5G7PSXAAM9wicC4fwpsP5ZLWyYD7vKiv2/WDDeAn8pY9vYNKvl
         D7JVfbq5E3/2npjUglXL1j34EZqNrJY3sR8JUyQzKEs3KFOSD1yMAsCo8rlu7QHGD0HF
         OeKg==
X-Forwarded-Encrypted: i=1; AFNElJ8HSVmjSVRiLBlk6xlDxWGWBFn5jPfqCbDK7o0Wqan+aKCB/gseNR9VPw3qhpxx9NRSx3TaxdG7/43ehQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJUgwEtqSDKks7ExWLy2POy5TLSkmRVvDs8MeCbvQLndVomoZX
	6wbit5Q1oaG5Hdxr16ocRuUvsxPdvCI4OTWeXYgxACgU3FuVe8AQ/UcE
X-Gm-Gg: AeBDietlO4UgaRwQXL8+YjMg6CmN3cut+rqEooYYK77bu17aG1hMjaUdSdBpXQ9vip2
	UQoNFRjjuMIqf3fVhO1E6G7F0Vw3tWyS0BR+qyrwrN2tQxSaoipcCnahmGqiudSO5ROOqGHxgyU
	aUHPqAy4lvTsTMssLWTmFjuwVbkGsl2tRvsAoQdnRClN3V7+e+JfoJumlDp9BOt+fB78ZHSi4Im
	8VY+Yr1/2oDCqs3rCpkuQIFDOcVDuxeCzFZyMLCQ+drFz5nBq9FeFOaDxrbx52dkIvfa5B7fIj6
	A0srXzdzl+Hn4KkSEvhHIOXnPGCuzwUiWMGw5t+IdVDuNgz1fArW2zba+bAQyKS5vKjDZxQ8aHB
	t7sHA8PKDKc3bvQOlBuUsQK67iSVFjfMSwYx3e7E3CBOS1z5D/z5HdvrH1FFvFbrZGqtnujy4hP
	jLDQOZjTOheGmYhW+6n1cf11NHsCBFXw==
X-Received: by 2002:a05:600c:3b13:b0:488:c40b:c8a4 with SMTP id 5b1f17b1804b1-48a77add9cemr108962985e9.1.1777458669022;
        Wed, 29 Apr 2026 03:31:09 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c2ddc65sm23523735e9.4.2026.04.29.03.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 03:31:08 -0700 (PDT)
Date: Wed, 29 Apr 2026 13:31:04 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Nas Chung <nas.chung@chipsnmedia.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Keke Li <keke.li@amlogic.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 0/6] media: Fix new smatch warnings
Message-ID: <afHd6LT7rCPlqDQE@stanley.mountain>
References: <20260428-smatch-7-1-v1-0-46890dffb611@chromium.org>
 <afC7qXCCkTTOS7jr@stanley.mountain>
 <CANiDSCvn3EbrPUiGYzE1zDHp=kKPJLAgHx17OJvv7gWLZM9tBw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="PCA+ff0wVcep1+Lo"
Content-Disposition: inline
In-Reply-To: <CANiDSCvn3EbrPUiGYzE1zDHp=kKPJLAgHx17OJvv7gWLZM9tBw@mail.gmail.com>
X-Rspamd-Queue-Id: 0B82A492FD2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.56 / 15.00];
	MIME_BAD_ATTACHMENT(1.60)[c:text/x-csrc];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain,text/x-csrc];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59957-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,stanley.mountain:mid]


--PCA+ff0wVcep1+Lo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 28, 2026 at 03:58:08PM +0200, Ricardo Ribalda wrote:
> 
> The only one that deserves a complain is this one:
> https://lore.kernel.org/linux-media/CANiDSCtm4Nh4Ub4rbEBvpjV8GXT9VQ5eFXZTHn=Wy=0RpR=3JA@mail.gmail.com/T/#m650723c33ec0318d8f32f1a6cc74c74a952ae11a

Thanks.  I've written a fix for this.  Let me test it tonight
and I'll push later.

I've attached the validation/ test so you can look at the new
ouput. ./smatch sm_mask1.c

regards,
dan carpenter

--PCA+ff0wVcep1+Lo
Content-Type: text/x-csrc; charset=us-ascii
Content-Disposition: attachment; filename="sm_mask1.c"

#include "check_debug.h"

void func(int a, int b, int c, int d, int e)
{
	if (a < 65)
		return;
	if (b < 0 || b > 7)
		return;
	if (c < 7 || c > 17)
		return;
	if (d < 0)
		return;

	e &= 0xf0;

	__smatch_implied(a);
	__smatch_implied(a & ~7);
	__smatch_implied(~7 & a);
	__smatch_implied(b & ~7);
	__smatch_implied(c & ~7);
	__smatch_implied(d & 0xff);
	__smatch_implied(d & 0xf0);
	__smatch_implied(d & e);
	__smatch_implied(d & (unsigned char)a);
	__smatch_implied(b & (unsigned char)a);
	__smatch_implied(c & (unsigned char)a);
}

/*
 * check-name: smatch: mask #1
 * check-command: ./smatch -I.. sm_mask1.c
 *
 * check-output-start
sm_mask1.c:16 func() implied: a = '65-s32max'
sm_mask1.c:17 func() implied: a & ~7 = '64-s32max'
sm_mask1.c:18 func() implied: ~7 & a = '64-s32max'
sm_mask1.c:19 func() implied: b & ~7 = '0'
sm_mask1.c:20 func() implied: c & ~7 = '0,8-16'
sm_mask1.c:21 func() implied: d & 255 = '0-255'
sm_mask1.c:22 func() implied: d & 240 = '0,16-240'
sm_mask1.c:23 func() implied: d & e = '0,16-240'
sm_mask1.c:24 func() implied: d & a = '0-255'
sm_mask1.c:25 func() implied: b & a = '0-7'
sm_mask1.c:26 func() implied: c & a = '0-17'
 * check-output-end
 */

--PCA+ff0wVcep1+Lo--

