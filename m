Return-Path: <linux-media+bounces-60460-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHxpF9wY+mlYJQMAu9opvQ
	(envelope-from <linux-media+bounces-60460-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 18:20:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AC54D1241
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 18:20:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E79E83022BB6
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 16:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E38548B364;
	Tue,  5 May 2026 16:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LUGuG6NT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2269944BCAC
	for <linux-media@vger.kernel.org>; Tue,  5 May 2026 16:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777997917; cv=none; b=m2xIh5WTbnbXY+PhcJFqHv+mW3ew3vnsXXzkjLX365EhGz4e8xdbKZpfL3tj4KkrvcSiq6tzXq9GdXsg+4B7FI9YYj/MLr9Z59XGfPVMBvZHDfa8semW+9FMOVNl6PFcBpeHCLQecw6zgjIeggxfWHoACJ7gpY7ajtE9CU/1yVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777997917; c=relaxed/simple;
	bh=eVs3CfOcVeYDqCO5ry0qkJJJOLsr43VkIKZBYscM63Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e9dbhDEnwyuNcC/8DB9wAgtE8RHvoKeXoRYZu31XwozfF4dWcGaX/6nJ8tYzOx/2xStksxM0Skz8+mmACyV0KUEQpwHTtE01qcvr/RYCKfaZmbfxnwj4lpWThxy6sY//PTB8E2I1wn93Vb6LvKAZ6AlxyRZFYYP3OQn4v1D4xkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LUGuG6NT; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-448528f4e69so3234330f8f.3
        for <linux-media@vger.kernel.org>; Tue, 05 May 2026 09:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777997914; x=1778602714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eVs3CfOcVeYDqCO5ry0qkJJJOLsr43VkIKZBYscM63Q=;
        b=LUGuG6NTZRGJgsINbg7YBAehLj3ovvjJNmgueO0bFuM3aRzJ+Q3JZUV0qxk88+KT7r
         fMoW1T+3+8hUnRIpROGXhnXsEAudSVZW8usrNWBi9v9P/KRwcyGMQMWc6LdJPFD8SlnG
         oADB99hxqjNDkFVrSYQDcnysdi5Ip3NKj5Q8YxxpIDDZEDK04Dp19IxI/U3zv+oRoZ+R
         lqrXhr6fIkA9Z5VrqZsfy7ym12fQ3oE6U1WwaxGMSQdBeKbVKRln3BzI5PU8eR3f3sQg
         JLntWgJ5+sgL/+50qv0ix5FgJaKAobjbdyybOlPx81fAJgypadFQg24WkGNf1GR6Ntep
         D4vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777997914; x=1778602714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eVs3CfOcVeYDqCO5ry0qkJJJOLsr43VkIKZBYscM63Q=;
        b=RUZEWj6RH1Q69EfFII+rzmtcXvtWyxVDsp3JrUIbdhGuobclUOj1DOZR+0hDazUjMZ
         vtLFp1lCX685maYac+rLuuJQP8Ycq8QHvupcaaZbHAwj5etAWxeRsTFTrWg0U0qUb60b
         Ha2oBOdXHKwqO0G1ic7a4FiEkQQ4xk8ixttjamuQVumu/LeMfCok4uViDau6Pyn2JICp
         cAE8zVCLLmZJtRD/mqq4gxLcJqvWaGvWNNUf6h9l2pVcJ9MGH0/RDh7o+ovzaWmcNwz+
         +Z8JDlWsUU4zjrAhPAvu22E+OQ+gYPKiX/YpUlMcoXOEDO/8xB6n2CROqWh/rOxk6CkI
         LfZQ==
X-Forwarded-Encrypted: i=1; AFNElJ/tp/dkF1+EFVSO4veiWjx+nkm/cp1nZMm8MU2WRQr3uOt7xAaCPm6HC8qnLr1TtLcyeWbjOH8tPVzOZg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxyENI8Sn6Bc+T5vYJ25qLBwDW21boDx8Wc9Oo7o96C30JALLN
	mILYr1NZfZ+UVRZfD8y9jUChGhVxfrDOKsWDt5sClquahD8cNlVbH5gD
X-Gm-Gg: AeBDiet/fZQx0pQXwKjsCZYFFUhiVbFHIZaRqmvmlm4J2+ac2rqz12YBGXFemXPM3tb
	PAaalaxnrsUxhsfwM5AczgPU7FXtB4NJ+zXVtrQZIAwomYw41Z95667AikYlFXkmYnr60QHzJ1n
	YgslPlY+Yi8puCL2lqFScF6Z7PCsxrjnrln3sbXRzGgi51ePiIfM5SCYxiUXId0K7+WzONot3nF
	U/S+J5HcupYzciuOrR3C1+zbtxEIAWRC6Jn9cViyxd/B2qrf9qXVTipTY6qbmBrItk8kQj1zvET
	8GE8se8uIJzEbAPJqb/+Laemc1fMeYdmeEAfimavI86FhGr/u+8oGmrgG2qxenCApyNqi2PdDX1
	p7PWJuZypfFRMSL6W5W8pYZaTv3M3tAXH73ZQGUOy1vjgqE5MhjgDQN/WC/Y+NVyYwSQsPpTTV9
	Xgx823+YvAEzLDD4Uf8D42vNJ01xqrbpoMg2tdecuNEVx4RTBNFxaaQhFRKm0efuglqOquB3Mju
	RP0DF/PrqkZdJu0gYvYlBqKF6Bd
X-Received: by 2002:a5d:50c8:0:b0:44b:cd2f:a3c8 with SMTP id ffacd0b85a97d-44bcd2fa400mr16334421f8f.4.1777997914315;
        Tue, 05 May 2026 09:18:34 -0700 (PDT)
Received: from jernej-laptop.localnet (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055960aa2sm5411552f8f.29.2026.05.05.09.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:18:33 -0700 (PDT)
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
 Re: [PATCH 5/7] arm64: dts: allwinner: sun50i-h6: Add missing SRAM region for
 video engine
Date: Tue, 05 May 2026 18:18:31 +0200
Message-ID: <0QgbHBOXTsqa8Ms4s4GfYg@gmail.com>
In-Reply-To: <20260505134812.408316-6-wens@kernel.org>
References:
 <20260505134812.408316-1-wens@kernel.org>
 <20260505134812.408316-6-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Queue-Id: 48AC54D1241
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
	TAGGED_FROM(0.00)[bounces-60460-lists,linux-media=lfdr.de];
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

Dne torek, 5. maj 2026 ob 15:48:09 Srednjeevropski poletni =C4=8Das je Chen=
=2DYu Tsai napisal(a):
> The SRAM C region contains a partial alias to the VE SRAM already
> referenced by the video engine. To avoid access through this alias
> window, the region should also be claimed by the video engine.
>=20
> Add a reference to the SRAM C region to the video engine node.
>=20
> Fixes: b542570e5605 ("arm64: dts: allwinner: h6: Add Video Engine node")
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



