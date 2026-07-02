Return-Path: <linux-media+bounces-66414-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Qa0AA5XcRmr2egsAu9opvQ
	(envelope-from <linux-media+bounces-66414-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 23:48:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AD76FD08F
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 23:48:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=VHgh3Qxv;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66414-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-66414-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0A103300B8D6
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 21:48:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E4CB380FE0;
	Thu,  2 Jul 2026 21:48:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECCC312834
	for <linux-media@vger.kernel.org>; Thu,  2 Jul 2026 21:47:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783028880; cv=none; b=CoDWkgD63pQhZ/YToR6s4da+BrT9ONpzN7FyMFXDlexXdMdfzdQP4hPSxxqEg2eDSHqWJaibO9NPJVDHw8DV8HECRGhEACeo1/M3+P/fr9Xf2fVQ8HsDe34gSnBdJBkpCI7VoU98/oZNCrhpMZCQFTLrQ8cynbbtSysox540SJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783028880; c=relaxed/simple;
	bh=OyxQNflj8nYngatuVMplYZtDtpx74K4BynyzlTtiD3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uZLdfSVhPfNQ/Nbx9Eyv414Zgg4uYYHQkb7D+j9mwoDjXlU0xjOtuMx1kvggSuzTpVrQ4dvBIpXelIVJa3A8yIY/8cbWbQ6Tu56RoMyM4x4HDaAtjWwvgqEzQY/y6ndyAVgyLjt881augvQFFf0FOQfienX8ghIrb6unZn2Nfio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VHgh3Qxv; arc=none smtp.client-ip=74.125.224.47
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-664b3831a20so3135942d50.3
        for <linux-media@vger.kernel.org>; Thu, 02 Jul 2026 14:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783028878; x=1783633678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=18nIAbqKxzsmmO3drAP1NepHg/ALBFCMR+9YkWtnWsM=;
        b=VHgh3QxvLUkhmKr+rK3iEJ7gOvzGwv7hAusppw1rd5aM5N5Ro0QzxNjjJYvl7Np3oB
         IIHJBTFBrSnCQ6/uRxIw8IRYomVXZ2UTaLEcymb3mFGbOJrSsKZnoOtnWG3ewRmCWZsE
         ZGcmUMv+OBMM4O3lsxRx8yztoQpZ5I6EfvS85rpDd4PSAafq9yVS5ZR44YNkcrWmoTF4
         UMxwkwqtP73/afKk1fTSoLhFD3n5AMtL07Fm9DJNNZ2xrVDlusmY5TVYlAvnKBCiy6XA
         dRBFEaG1EOOmJtlYbWOtGa7DBgxpcy0dADXZrbemfgt9Q4scdVfQouhACv7/NqXqyhcv
         oEOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783028878; x=1783633678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=18nIAbqKxzsmmO3drAP1NepHg/ALBFCMR+9YkWtnWsM=;
        b=lAr8Nnt9QBepW1Z9JChXVm16wKPenLIte5NHRlP4YsTSurNddwVgSu1nJQwg+4d7AD
         VjNiD5MjqP2cUZ6qLo4ZW+jqCLE1S3lVHXTkcw47mVwXNj/Xvsx94m3Nh5m6qFpspL+H
         GrtPtFncR5NuKps5U3ap8hH1os2Q0b5OKfwvMZsQT/r+t3YpPbHWtN7v16m5fVG/neo3
         dMMxmzToxNcTx1xPlZHBFZ6KpZq/GegEsh3Z2UnT8qfJx5WDi5RWqeLl4LQbir4Shn6f
         uJT7z1tv1IqGULB8ZgW6026h0ByKXc8lkHlUlpevyFFu1cx2yadoAnBWykFVMoadPXfq
         wLAQ==
X-Gm-Message-State: AOJu0YyCsmkLM5kKu4dJvRJ2ZQdLzoXt3hcKzq3QqMR5oH4DH4Trt3G1
	UY8vIOE2tgiQkttQn2GWRlnXWhEle82WyJ9Sm61QpTFnFGCuK1DiFbcn
X-Gm-Gg: AfdE7ckniAQkNpuY6oIhwmq+uaxUN7ydJktVn6Btf3sxHaKEYhXFsoTz2/jrmxvkfLm
	x9SmexcLuXboTzjXM2dpwVzWFyZIjTwkXSAVAWsc1RNG+Iiaa/fzJik54KZG2OCUxuSSSg2lebA
	Ft7g4zhUy0xtB92MZIuCV5ryq6vaVumUhd4vgEEmGjji5pT0zHoTIVPzv33uTuOK/YRQTkGLefn
	M/61VXfxzOWTlaIWKoQz4K4jbSaSQCvJiqNBh1e4afv493oUNzmA//7BoORO1uVS1ZKHj+O6FS7
	hkzMugP4OttB0Zd4EpCUH0HKGLg3X0XlzuZsdYwKzPJbmKhZP1JQJeYvzPOoZIGq7UYB5wEe2X/
	U3pzqVPyJonYFs5EzYzZkIbccOre5PeVX2PmuATMoBdqNypJajLpKUquJU1K7LWVBXr3E332Gx0
	S+JCRjf6VU+tKPQQC/o1eYG4r+Vxtc6g5EQD5Ozjiemwzlt00=
X-Received: by 2002:a53:d018:0:b0:664:f107:6cfc with SMTP id 956f58d0204a3-66521a8b7ecmr6972277d50.36.1783028877506;
        Thu, 02 Jul 2026 14:47:57 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:169a:36bf:d0a4:1d7c])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66624021a75sm1631772d50.11.2026.07.02.14.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 14:47:57 -0700 (PDT)
From: Justin Suess <utilityemal77@gmail.com>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Sashiko <sashiko-bot@kernel.org>,
	Justin Suess <utilityemal77@gmail.com>
Subject: [PATCH 0/4] media: rc: sunxi-cir: support the A523/H728/T527 IR receiver
Date: Thu,  2 Jul 2026 17:47:46 -0400
Message-ID: <20260702214750.3428694-1-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,lists.linux.dev,kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-66414-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sean@mess.org,m:mchehab@kernel.org,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mripard@kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:sashiko-bot@kernel.org,m:utilityemal77@gmail.com,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[utilityemal77@gmail.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[mess.org,kernel.org,gmail.com,sholland.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[utilityemal77@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[104.64.211.4:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F2AD76FD08F

This series adds support for the CIR receiver found in the Allwinner
A523/T527/H728 family (sun55i). The only board in this family that I
am in possession of that has the IR receiver is the x96qpro+, so it is
just enabled for that board. The Avaota A1 may have it, but I don't have
hardware to test, so it's just enabled on the x96qpro+ for now, but
left in the a523 DTSI for future use.

The sun55i family carries a newer revision of the sunxi CIR IP that is
not backwards-compatible with the prior hardware. So a new pulse
capture mode field in the control register resets to 0 by default,
which captures nothing, and the sample clock divider became selectable
instead of the fixed module clock / 64.

Solve this by adding the two new registers, enabling the setting of the
pulse capture mode register and the selection of the clock speed.

The new compatible is therefore added standalone, without the
usual sun6i-a31-ir fallback (it won't work).

Tested on an X96Q Pro+ (H728) TV box with the Google TV remote that
came in the box (using NEC keymap). Was able to press buttons and
get readings from lirc / ir-keytable.

The series is based on tag v7.2-rc1 on mainline.

Justin Suess (4):
  media: dt-bindings: allwinner,sun4i-a10-ir: add A523 compatible
  media: rc: sunxi-cir: add support for the A523
  arm64: dts: allwinner: a523: add IR receiver node
  arm64: dts: allwinner: a523: enable IR receiver on the X96Q Pro+

 .../media/allwinner,sun4i-a10-ir.yaml         |  1 +
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 19 +++++
 .../dts/allwinner/sun55i-h728-x96qpro+.dts    |  4 +
 drivers/media/rc/sunxi-cir.c                  | 76 +++++++++++++++----
 4 files changed, 87 insertions(+), 13 deletions(-)

-- 
2.54.0


