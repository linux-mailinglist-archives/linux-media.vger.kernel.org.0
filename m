Return-Path: <linux-media+bounces-60461-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yF50I+0Y+mlYJQMAu9opvQ
	(envelope-from <linux-media+bounces-60461-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 18:21:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 797194D125F
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 18:21:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 51638302836F
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 16:18:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6E6B36EA8A;
	Tue,  5 May 2026 16:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cbbFgloP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E94389452
	for <linux-media@vger.kernel.org>; Tue,  5 May 2026 16:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777997932; cv=none; b=SeTeZ6Mh93rNVWdx7WzVtysLz1WZEbNXwz4IhidQz1UrphsE7N5IJTa0BtHtIURUtlDRLgPAjSCDyAQR0Q8LpVDLwqW2qIEchk/CBcd29JlwnmUb+jNXoeDuYxKMCAv9cyZKs9t/E6dONVxF6Ki2mqNzmYhyylg5Oefbi5QgTic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777997932; c=relaxed/simple;
	bh=kFgK8lPtkO+1vWsJ8rKW8KSPYA1D7WBjiFbzZGEngaU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fbx13jrzHV0LF5dC+1SFM3J6ER1mQ4P9kTqWJqzftXBSaI0n4ykC9laGNPEFyacsBAstrte6WdF5P6Ehv4DhnU4p+ttl9QZQAmr6kNbQIZKtMklruK6ck/aaVlc7WHkh0mgp8ljrOafEHU12AnzaxastEYcGy/E7aIMzMUSjKh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cbbFgloP; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48896199cbaso47925975e9.1
        for <linux-media@vger.kernel.org>; Tue, 05 May 2026 09:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777997929; x=1778602729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kFgK8lPtkO+1vWsJ8rKW8KSPYA1D7WBjiFbzZGEngaU=;
        b=cbbFgloPVj92mDTeO6wAhCwJKNq/DbmGqRhsakbAcyysDO2KNfly5Lk5nnOfuyu42A
         2hKzQCXiSZm0wCKjgeQ1pCsrvhkcq8/YNEXC1+xzymHxbRaQYR+ypbFN0Q3ye5aLOBxE
         SeYC3+n81iEJ9sFqUfqFTTHFEwUP9LfcXgAbU9y0acWc40ic97IAxctERGURU0gVbxju
         Xx/bWTu0FVN61ZlCgIAMmyZb4AGhjMbb7zEbb3ar9I8sKLbC5I6curWTJgL5A8ye4jpD
         HoyoTlEhbYbHLZfsdEmRglQvKfArGpXXVKNUzA7DdzJZfUrWJNS91K9U8AJXPXzU9425
         w08A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777997929; x=1778602729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kFgK8lPtkO+1vWsJ8rKW8KSPYA1D7WBjiFbzZGEngaU=;
        b=TknhYkiSyrq+GMzOV8eE+wPp+S1BeyIkd3skWtfJjtg47LWe4vHR10gHNFCvUKT9yr
         In3T4sAWl8L+aDIoPjeyv3o776lXDMgGtXd87kBd9rdU4UUF3r/aboKtd6kyjaQZ7vRB
         Ik0ZTmQjhAZqri0+iyPT33Oyy2/SiUga3eqrLGIhKXcvQrgXAz8rtsOSSXyCGjEbl3uz
         bVG0dUKsBM5vW93aKFltJ3A2nZA0ALMtczw6VEgU8u4UQ1myu6970rzSfpqERVlg5eQd
         PEfhFciZtlvYqh5szUqkameQFgW6RIW8Sp2dxsZyjIsxPZueWoxpgnmbJgMdAUeYUfhR
         VwXw==
X-Forwarded-Encrypted: i=1; AFNElJ+THetYB479RyzXNe8ADFrKbRBByzfuaVRentTm5W7FM4lIhmFHlMKIJt7o63AL8Mk1nvcx5q01FgcmYw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2z77Hn0i6kUPNet3NJGNBYlEtH2IDgVuSAJAiWpwcc5JwiBTi
	6xyJTXkCy6oN676g6XvWdXKvW497+2U+iFq8o2/SAMMANMYmHHeVC+RE
X-Gm-Gg: AeBDiesrwtYY9WJDY6yk88WOF2BESubIi4+7o/zP7FiBpNEtMB8BhBW8DIE9Nkai3yz
	njLRdVfnN3t5YwQ22FLKdR9jE+PD1gL7C4EYUrT9MbOzhhf186JljhXcnTVo4SLQmcn1u8w/Ecp
	64/1EIQ160qGVnHyIrjJWP33BcQ5FMtLBIOFgjmXk05PVvGJwDlD6MPtE3gY4/tWJSW7QwCN/dX
	fUa0k0e8IRD9qceaMpk+Tm0JvqYIKBi/0wZuhZi8z1lJ6OaeDdrO8Qyn4AjQ/hTa1ToHtVCRFBN
	iZxSU5Q3+oLJQZNQOhnsWXmeWuAl69btIEDqG2gl1/bI3XP906Ze4e2sSy1T+DRMWQri0P4FAqR
	sGkPGeadvYoMlKEjWcezaCAPsN+HPo6oKCbL5hRZuzBRNbP0Kfy8mdBe8xZTJtdwzYG4ZN9UcqD
	8zk9nmkChf5INZvnkGoGQnOK8XoBHJKT67dY+SR3gSkxh5WSbtm80PW7LQEI/y7WyFEaBy93V0G
	Ces7JxBNi4otfFbHPgqIGwJcGwL
X-Received: by 2002:a05:600d:8408:b0:48a:53ea:13df with SMTP id 5b1f17b1804b1-48d186dc892mr46627055e9.2.1777997929083;
        Tue, 05 May 2026 09:18:49 -0700 (PDT)
Received: from jernej-laptop.localnet (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055e2d3d0sm5425787f8f.34.2026.05.05.09.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:18:48 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 6/7] arm64: dts: allwinner: sun50i-h6: Add missing IOMMU for video
 engine
Date: Tue, 05 May 2026 18:18:46 +0200
Message-ID: <YPmvp_egR-m-cMSokrsA5w@gmail.com>
In-Reply-To: <20260505134812.408316-7-wens@kernel.org>
References:
 <20260505134812.408316-1-wens@kernel.org>
 <20260505134812.408316-7-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Queue-Id: 797194D125F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60461-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jernejskrabec@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

Dne torek, 5. maj 2026 ob 15:48:10 Srednjeevropski poletni =C4=8Das je Chen=
=2DYu Tsai napisal(a):
> The video engine on the H6 actually has two IOMMU ports. The one already
> listed is simply named "VE" in the user manual. The missing one is named
> "VE_R" and is probably either read-only or used for reference frames.
> Either way, it should be listed.
>=20
> Add a reference to the "VE_R" IOMMU port to the video engine node.
>=20
> Fixes: 62a8ccf3a248 ("arm64: dts: allwinner: h6: Fix Cedrus IOMMU usage")
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



