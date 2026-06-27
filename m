Return-Path: <linux-media+bounces-65780-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DgTUJBNwP2qDTQkAu9opvQ
	(envelope-from <linux-media+bounces-65780-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 08:39:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F16CB6D1549
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 08:39:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=cYUNIGts;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65780-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65780-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 291B3303746A
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 06:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7715938F941;
	Sat, 27 Jun 2026 06:38:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9290036E47E
	for <linux-media@vger.kernel.org>; Sat, 27 Jun 2026 06:38:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782542335; cv=none; b=a/17ZrpafZitz0TeEzDex8keSPSjD/xOE9kVjz7cu3TQGswKrlmvD1ShDu1kLgxLAmWWTutXnIVYZmwJGoPHk/MN1FkZYFnXoLfieJcy/kd1X2rQ2EUZe1tqG9dNaElngfchc3/BZBWCv5do+/9vjrH1GhSzXmoiukR8JD2orK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782542335; c=relaxed/simple;
	bh=ParnwBExfgSuCvGNbbNh3YhRq5Zw4wfCqZvmdKMow3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m9jblWMLqKeSCE20tt/dC8gB+mvSd0V8IDCuT3RHCZtlDFkwJnfd5IVHXLvb8Q0aFrx/zE2ZsJ7UvJmODk6TpLsglYVpycnvNJrnhXLx2c2yjYaTF1rx+JvlxTO1xVRcwtaks2gIAWAx7iJQ6BunPh8mmovmOAxDQk9YGXNPado=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cYUNIGts; arc=none smtp.client-ip=209.85.128.49
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49241dbf9c1so14534255e9.2
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2026 23:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782542332; x=1783147132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ParnwBExfgSuCvGNbbNh3YhRq5Zw4wfCqZvmdKMow3E=;
        b=cYUNIGtsu5USkdNL1kWDKED6UGY3amvoVIWndLefcSqLPshsB81MT0e0ZrsIDrz/dU
         KJ05e5/u9VhQpC2Qmoa3vNlt93sAFHTncf0HL3i7pDuYZra+1tPyJuxG5uleoyxaMGO6
         zEjC2gKZTzShWeNkdXpfzk0l3NpEJr4vPXkYmJK9ext0Te707EAzAuUFPXLblYvChTMb
         s1gWsDa56z9cxveMF3ue2cWC37z56xzQyqNQ/F8Epo6i2PsEqwos0/f80Ka9z2KN5fNE
         ZFsBJ4UaBZZMCQMo8kvcCVub0+MdwpuZMljji14J67jIA1LtRSDOQzdANCzvB/s/lw1b
         9X1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782542332; x=1783147132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ParnwBExfgSuCvGNbbNh3YhRq5Zw4wfCqZvmdKMow3E=;
        b=c/BWLCm3o7ocT5GHTvegIYV9kGqJIKI6D+dcNlE8DhOxAs4sZxOKIwgczzVUoX23Kr
         U/tnFDfVdOP/bgNeVSN2EJh7sQcR9AwmtJ0heYNaqPuxhRmUPuX3/ZcOCg/M7ickNn0A
         LesMCtuNVtALHwsxInLidQbCkMn+TGZq4p9npm1cZTpo0aa9TZoyX/1N3RGvAr7mXfpg
         uWZeElpMDithKM+0fyYyLSfkh53gWk2daasYA5co1ExlbVftQ+TmIj6boHOUOgBLPQIK
         f7Y4bqbFYDF9V3xC/h6u0ehK3XjMhmCJMEKagdsjOqPGGTreNwe68pa4lyyFL9G6eHDA
         T4qQ==
X-Forwarded-Encrypted: i=1; AFNElJ+4GTSp4r8jUSaHqyETnkJNKCzi/YDCSCLYiYx/VffOWJoOtmy/byecllL4SWhhPTB2ug2jHmBoLDja8A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0v3kjXusKR9HZni8y6xcADbbMIrOwRK4tcHZHqE4XUOBicISP
	0m9X5omR1THjPKb5dOU9BrflZmnzOynUmmLodjsKEz0msfn3MIHvHM8z
X-Gm-Gg: AfdE7cnvI6y9izlhGgcswT8zeVFB8KJIY9z+GX18kNh6GdDy25n1P/D4Wm75SRRxtPu
	ucKxa/7yZPibgLX8POgNfcNWMUV/XoaJSS0Jzd0+P1dXRXrzHrFFVMs4tnsjrCqAERfv7Hy/EwK
	YM2ZlaSseMlSgkNC9J/BX3izOgD5VqyLnDvm/QlZkwq/981WYMglJ1fzecOmiuvcXAdSEYXTsG6
	dKU3bfOIvdGXq8HNcJ9yRyXpSoQ0e+3+dYtNK4ERQ9/v8PwD2rE4hM0PEKiWWz29K6hG5sDp5zb
	crorE54Rw6Wg+QTiqGfTtb91s7eLb/jUs7wwSubG9/1GNI1vRT2gF7JxkL1/bzgBqv7X3ljWB+h
	pPWBx+FZlQ7htA9VF8lsJm7TR7P35L9Dc8+KhsyQ8TLrH8BZ7atlASdunClXrMekSIS1GieDDgQ
	f+zThdwHvrCdMDL9imopGV3jxa8Rk38jHCtY4SxkPO73RQksuQe6XkQvvYegKGlG30LQ==
X-Received: by 2002:a05:600d:8499:10b0:490:e196:6574 with SMTP id 5b1f17b1804b1-49266864b4cmr108469495e9.13.1782542331948;
        Fri, 26 Jun 2026 23:38:51 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4927038578bsm67964385e9.4.2026.06.26.23.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 23:38:50 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: mripard@kernel.org, Dawei Feng <dawei.feng@seu.edu.cn>
Cc: paulk@sys-base.io, mchehab@kernel.org, gregkh@linuxfoundation.org,
 wens@kernel.org, samuel@sholland.org, hverkuil@kernel.org,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, jianhao.xu@seu.edu.cn, zilin@seu.edu.cn,
 Dawei Feng <dawei.feng@seu.edu.cn>, stable@vger.kernel.org
Subject: Re: [PATCH] media: cedrus: fix memory leak in cedrus_init_ctrls()
Date: Sat, 27 Jun 2026 08:38:49 +0200
Message-ID: <3HodGaD_QKy_OLZfdyJ49A@gmail.com>
In-Reply-To: <20260624085920.578446-1-dawei.feng@seu.edu.cn>
References: <20260624085920.578446-1-dawei.feng@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65780-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mripard@kernel.org,m:dawei.feng@seu.edu.cn,m:paulk@sys-base.io,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:wens@kernel.org,m:samuel@sholland.org,m:hverkuil@kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:jianhao.xu@seu.edu.cn,m:zilin@seu.edu.cn,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[jernejskrabec@gmail.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jernejskrabec@gmail.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F16CB6D1549

Dne sreda, 24. junij 2026 ob 10:59:20 Srednjeevropski poletni =C4=8Das je D=
awei Feng napisal(a):
> In cedrus_init_ctrls(), the V4L2 control handler is initialized before
> allocating memory for ctx->ctrls. If this allocation fails, the function
> returns -ENOMEM without freeing the previously allocated handler
> resources, leading to a memory leak.
>=20
> Fix this by calling v4l2_ctrl_handler_free() on the ctx->ctrls allocation
> failure path.
>=20
> The bug was first flagged by an experimental analysis tool we are
> developing for kernel memory-management bugs while analyzing
> v6.13-rc1. The tool is still under development and is not yet publicly
> available. Manual inspection confirms that the bug is still
> present in v7.1.1.
>=20
> An x86_64 allyesconfig build showed no new warnings. As we do not have an
> Allwinner SoC or board with a Cedrus VPU available to test with, no
> runtime testing was able to be performed.
>=20
> Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dawei Feng <dawei.feng@seu.edu.cn>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



