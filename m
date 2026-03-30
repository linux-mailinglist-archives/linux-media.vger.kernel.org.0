Return-Path: <linux-media+bounces-57598-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +HlaFeJYymn27gUAu9opvQ
	(envelope-from <linux-media+bounces-57598-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 13:05:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CA835359E4C
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 13:05:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9137730B4C45
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 10:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D94C3C2773;
	Mon, 30 Mar 2026 10:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cPxR6xvo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171DE3C1984
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 10:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774868204; cv=none; b=eMsk8ApaAo/rADcZj4EvGWUKB6M2jneNyr+raT9zM167Wcu49OpJEhF8CDnCK78zOz5raEUfuV7BIVKQ6M0VAAbViBUYC/KJ+uf1CKVbIA39gYZwSxXhxLs7pt7DHK/3zdUkz2aaTogrgVOYP42bqU7QJN3p0F3ukHHo8Ca/Lcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774868204; c=relaxed/simple;
	bh=m2CkOrXUMCZ8u/WunDlRMPt5n3OFxplRgyHeNoeq1XU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MAZkmK2X954KwPkvDXnBdxB2P0g54i4NMZReANE7Oxbhh5y8ZsoN0zDpM8E78KPXwD7PfW4YgGEdEjAGD5sy9TSRbheAF/ENuAePT9AIebzIQQpR44OgrJ2fPYjBYIwFHHj9nLDAvPnVIEAb9huEQ7GqYIh+FLfiesH7xXD9ips=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cPxR6xvo; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43cfb723793so581230f8f.2
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 03:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774868200; x=1775473000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zSCuUeGQ5Wwf5AGsJZnlfwfrW2VQbpTSMnU1lclD7ek=;
        b=cPxR6xvo1OosRP+Cbamt+4XlzdSe+j1FOo/0bu/GbAzRfdHJ78YROC4hYJLp/7skhU
         +vH7nX2xax6YWUl+kzqCTiCoKo2frwdRFmiTnNwBYDKe88UJZdla4ZlMpz/RKhMe+6TO
         iM17uvt+VjyHSzDfpfUxkqo4aD0VTxfrW0EhcSBMuLNZg/8bWOqsGWZyCWuYnMHB95GX
         fhTyKBtTWHwXdzwodRZA1y8ezoMP1FLvf0frxe2dJrMftW0koWPB+rhpU350gnmoMH23
         DCKY3Xq+bPRvc715Zt4X4D/L0qirIddGjEfoOf3oh7GTim1REGWeoJ4aKzA2+SLhsgWV
         Ua0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774868200; x=1775473000;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zSCuUeGQ5Wwf5AGsJZnlfwfrW2VQbpTSMnU1lclD7ek=;
        b=pjzububqks8aLxLhoOKgLyqVEonpbbI1RQofFtNkZJIczhTt1WjPkYAR+RrjsY4Fyd
         O+MX1ExxfQT531/o1+uzR0Hc/WDAn38jy/OdT6xHtDdYaVTArmc1+nKegZXdir1p/1t0
         Q/1UJNGdbAJ48XiP2lQNIyCQSH2uvf53DeBFWVZdZw6WY2maSLYxCLjlU994xT71aVDh
         RIlSUw95lCqWhInVPDwSLqOrLKC3l+q9M5wnRXgtVK4kZCff7KCcZ0FTS/r/fDJclFiK
         06GUKk0QhBGtNOVwMqkrf9v/DNZDucHnZZNNb1Uz/Bes3k+ekKRztGYI8brSM0E3n50f
         QGoQ==
X-Forwarded-Encrypted: i=1; AJvYcCV21Sc1WRGZfW810IH/bd+JF42V9oCzqXRoBeC5rXTV+xL70XSxJx+VoRxKr1XvvMOAv0eF6OKTrf/8UA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCocE6O5tT1PWeCJIeZ2oG9aYk3mUJtYMKQoTD1KnpRTR9nxBr
	biIbtRQg+U6tMfvyLSug24/926PcMXffmUi/fjXYH/vyhTvqQlxZtfMD
X-Gm-Gg: ATEYQzzyRVc2C6/ThV4bxiMh7hgTE0ZVxhZoS67xbIgqlVOjazDzB5esXRVqxgfJ82Z
	KFJNJ/sInhaBh/wPItqAtpLYMrJwa9+QqUqq34NK5Zjsltz9wnPb95An0ql51b47mJhE/nw59Ku
	9Am5+Yf4gr5u3jbNzN4avmkU1fOT46FpFqQkNzaSLW9duZOZCRCIPL392w9CceqQ08qtDngtwBv
	IAz9hmAfUNd9qgLnIIot4kWVoyle7JR/C08bY0y0UWAS7AGms1Syp129ifSSxNvMzQ62HR/tRMZ
	FJ1PmT/elLvZG37NmbMDT6qVxiTxwaLwCo99nvLbVIm2nOy4WRTJJz1R6s3/aVYJKit1OvWF++3
	EOCHhsp2ysswugWXxnyaMXziHPpnmFgqGZy0tMQS5ltcIiHFT367DdidHroYdEX+sy4Js5KTEBY
	qO3+BgAtHqswU4NPglQYmE5k14vJ0OvdV3/vJvrgrp
X-Received: by 2002:a05:6000:2c10:b0:43b:4960:60f2 with SMTP id ffacd0b85a97d-43b9ea766f6mr20597624f8f.47.1774868199956;
        Mon, 30 Mar 2026 03:56:39 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:e60:2c8a:54bb:d692])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf330872asm16376324f8f.17.2026.03.30.03.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:56:39 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] media: dt-bindings: media: renesas,vsp1: Document RZ/G3L VSPD
Date: Mon, 30 Mar 2026 11:56:29 +0100
Message-ID: <20260330105637.130189-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57598-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,glider.be,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: CA835359E4C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

The VSPD block on the RZ/G3L SoC is identical to the one found on the
RZ/G2L SoC. Document RZ/G3L VSPD.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 Documentation/devicetree/bindings/media/renesas,vsp1.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
index 07a97dd87a5b..5447b9b78930 100644
--- a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
@@ -25,6 +25,7 @@ properties:
           - enum:
               - renesas,r9a07g043u-vsp2   # RZ/G2UL
               - renesas,r9a07g054-vsp2    # RZ/V2L
+              - renesas,r9a08g046-vsp2    # RZ/G3L
               - renesas,r9a09g056-vsp2    # RZ/V2N
               - renesas,r9a09g057-vsp2    # RZ/V2H(P)
           - const: renesas,r9a07g044-vsp2 # RZ/G2L fallback
-- 
2.43.0


