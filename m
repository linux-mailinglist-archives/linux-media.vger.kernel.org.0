Return-Path: <linux-media+bounces-60057-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0OMsOFcr82mwxgEAu9opvQ
	(envelope-from <linux-media+bounces-60057-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 12:13:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 969DB4A097C
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 12:13:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DE856302F7F5
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 10:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 597893FE369;
	Thu, 30 Apr 2026 10:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="arE6awJw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A9D3AE1B8
	for <linux-media@vger.kernel.org>; Thu, 30 Apr 2026 10:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777543784; cv=none; b=DLx1G51yYkSsCOphSL2I4IjdP+e0n8/mf18GckkC6f6hcTc8emcZWjuHwP9c/IfnUtc8EpXmml3/06S2bd54B8znfXs0VsoV05mWwjg1LkXJywrxsFiR/j3LpfPRH1VGxtg4FlkGNeVhtZurshiw0KO9T2M6FHmKcjE+P3mtQ1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777543784; c=relaxed/simple;
	bh=BDV6z///Ag0jrLfv5FPR55ob2qwhAFZ2RbGtzx56J+g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=id/e7J2LzJ/iSeR3j2F3f6Jdk+55PTXlF5W5HAQigVT1Nl7OpIYBShqeVS/58Qn4okBl0K8eviOgPCwlK33ofZyO5MnJwwhUa8hYmqCaA1856bb7wCJ30chNZ1EkRr8TkVPChDMFF6+bSmEKJX707J5OGkhvPIPGbZK/k8SS7ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=arE6awJw; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so7195035e9.2
        for <linux-media@vger.kernel.org>; Thu, 30 Apr 2026 03:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777543781; x=1778148581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8A7MIAnU12KGVZkkr1Zar0mlpdikKahBDagAl8oeFpQ=;
        b=arE6awJw2yH6l1bUFQPGLft8webnnCwNgDSv4w51yo1w78K9u+8NY1Pq5CIf1SZMVM
         f4e8hS8I9DtsPZfLv1wx3Xsn99qbicVerDtsIXmwjsXIa/bbOPVNRdqleLOH6+/i3qWP
         nTm+BxONKuY6ln6B0jMnVCPPj8rEcq+Tb6psGeffkE3LFtKt1lhkT716erlhOO0MaOC3
         GycN3+6NnkZXopYXJVAvQAO02LSgIkkWImbWuQhrLatJylLM7RfbByZCZ3DlI3KDwoan
         2XTAODwt0nQSj02S01Wx9BXUDZvKx+uCZpV/m8br10vNdEc1r6J8s0cWbDHW2r3Ko74H
         a8JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777543781; x=1778148581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8A7MIAnU12KGVZkkr1Zar0mlpdikKahBDagAl8oeFpQ=;
        b=pEXDAMOype1NAPn4oRhOfqj4GKm7inCnubZe8F3C9h4VfFBizPLFAwGx2H2djdc8MO
         F709XD6EFI3uBMN4HoKWq2E3ue8djAjEMq4EMxCRGbkb6dhPpO52y3307kjZe828Wiac
         lEr9Sitr8AjTDcF8p18ZFzignFa0Kn5QftySeX0T2GauHlLUV89NNSiOn6S6utTkxlQc
         VGIQNN5nercXzsu7V4AxBByX54THah7/V8+fOGBHIlDkr1mdd+YlF47jKtQG9IodmXbR
         Gq22ncHfHb87HT5Zrys8Rb0jGOe39Mf28pBUReVupG9DLg0VsXi7Qm278l57pfkdXC6R
         faTA==
X-Gm-Message-State: AOJu0Yz6e5H5gJnvhbMHt9vVMoNG9OwvYQ4lOTSi+X8H9UdqdwANJdAA
	VQ/pJFIS7bfP40pY1ykAiym05bTY1aQvo4TuTA4giEVY8T6WAkj3qxxw
X-Gm-Gg: AeBDievqz57rS7YFLOWhtw7h/mRGtItdfRMrOtPUA+50+m52z1XNk1kRR2oAJ0jN/bT
	2WjF8NGBxoL5+6M7roThrCBPcnDwaCiat4h37kBh+2NclEJU/vmofsJpeEGxeEZ8Rb5J5VesGOW
	h+pPT1qy5lvL76TH4WJIIvG+UWNSrYk4bIk9mBjHVa7SJyKk0Zz9xVs/3yx97bA63e/7OMaCqDX
	/Lq4jZbwMmJ5RCZM2EsExnVa3XpixM4NE0ibOfAIooO824b62Z4aI431Svt8KNCzxilP5l0ZYq6
	XTcvLAZlolSFbJpBe0iHLIve71lK/75fwhGBoDpSgZAYJEGo2CRWCp94bOXxA0gY/kLNT4sBuuM
	dAOcRzWo2irBBvbPmKRY9EuQE4V0ETxCXq1XyRYx8k4IzttyQ5W8QO5/0BmctlxxSaHDCVHSN4o
	bTOzi6N0tNKThqx/7cTK+woHhlWL3gCmba9a4FWeRw82sw/WEeh0gDxa/spprKORxXL0+npRaqe
	MrsPNeU0+TAi5Cg1Hwe65yS8znG8EeLb1+zy/7uDTf4B3j3IzxidDJIyw==
X-Received: by 2002:a05:600c:6285:b0:483:709e:f238 with SMTP id 5b1f17b1804b1-48a84486f35mr40572135e9.29.1777543781304;
        Thu, 30 Apr 2026 03:09:41 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:182e:1592:d4cf:18a0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7b9313c9sm40252315e9.11.2026.04.30.03.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 03:09:40 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/3] Add VSP and FCPVD support for RZ/T2H and RZ/N2H SoCs
Date: Thu, 30 Apr 2026 11:09:26 +0100
Message-ID: <20260430100929.1088281-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 969DB4A097C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60057-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,pengutronix.de,glider.be,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt,renesas];
	NEURAL_HAM(-0.00)[-0.987];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,renesas.com:email,bp.renesas.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series adds support for the VSP and FCPVD blocks present on the
RZ/T2H and RZ/N2H SoCs. The VSP implementation on these SoCs is identical
to that found on the RZ/G2L SoC, while the FCPVD implementation
matches that found on the RZ/G2L family.

Note patches apply on top of [0].
[0] https://gitlab.freedesktop.org/linux-media/users/pinchartl/-/tree/next-media-renesas-20260430?ref_type=tags

Cheers,
Prabhakar

Lad Prabhakar (3):
  media: dt-bindings: media: renesas,fcp: Document RZ/T2H and RZ/N2H
    SoCs
  media: dt-bindings: media: renesas,vsp1: Document RZ/T2H and RZ/N2H
    SoCs
  media: renesas: vsp1: Make reset control optional to support platforms
    without a reset line

 .../devicetree/bindings/media/renesas,fcp.yaml | 18 +++++++++++++++++-
 .../bindings/media/renesas,vsp1.yaml           | 17 ++++++++++++++++-
 drivers/media/platform/renesas/vsp1/vsp1_drv.c |  2 +-
 3 files changed, 34 insertions(+), 3 deletions(-)

-- 
2.54.0


