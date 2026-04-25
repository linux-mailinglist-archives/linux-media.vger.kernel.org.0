Return-Path: <linux-media+bounces-59587-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENfzH9Wd7GltagAAu9opvQ
	(envelope-from <linux-media+bounces-59587-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 12:56:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BD29E465FE2
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 12:56:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B9CE930151C2
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 10:56:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 011FA3932D8;
	Sat, 25 Apr 2026 10:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KJiZ0syB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455F43845A6
	for <linux-media@vger.kernel.org>; Sat, 25 Apr 2026 10:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777114566; cv=none; b=HuRDWG79ri+YmYtWQaJ42HN5IutejiVC6WR85dsKCbmoSKoi5auTk+Zx4zSPX/I+T/HEMqw6sf+uY9FwbIwSWE+RRZF39Ei+Sfv4BhnkRKS46IPjEpL4zr2diseD84dJEmyU7QrMkTjaqgOuKTl7iYJLD7ZPn5PK7Yn9wEmLpY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777114566; c=relaxed/simple;
	bh=rxaZPWENivHVITTeHkS0y/dXeZqFrXaYDRpVRjDTB9w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bILZxbDqf+FYwL3sBz6Ngt9J4eyBXWsCe6e+0Y0+wSgfzD4+qiDPMtpa5hqKQ5gDe8D4HJ2VTt7XfmVnWUlNRtxok//PurKF50SmW//zBp7wBT8I1X9Mr//ovNTjQNhuaIdfqx/CNf6x9wSB3Gtg4xhpABb+KF+nwcJ+/c2nja0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KJiZ0syB; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2b0afa0210bso40048765ad.2
        for <linux-media@vger.kernel.org>; Sat, 25 Apr 2026 03:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777114565; x=1777719365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/BL7vCpwHFg/qJ/N6VS4Lzp/N+c2rjtsENFKEs8/Vu4=;
        b=KJiZ0syBW5x8zi40qXtoEfiPPd1dp0cRrKt8hYxEnNg6iQKi2x3FfntlwkQp80tS28
         7n1NX99Rflsv3Ht1/4Nc7lmfTx1wIab0bPwTnjeFPxTtGNXT3wCZsjRMDCEyS+eaQZmP
         2kZt8sGr/1PLSocsxv/Jn7xFMvUGeAiV6Mn2Gj2TtPbAVvfvABTlzfAq7AlP9AWlwcMC
         aQskxu7fhFOyiVe/ZAVIAz9cpgbTEYu72To8I94gTelvBtU2aaEF8OJ/BNvIl+dydpVz
         s5RS7f8V5XKBVm2JyxE9QpUDgmQY8dBvhkKok4iIjf2MhLJQypJtU1I9LtNi/Pl3NS/I
         McJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777114565; x=1777719365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/BL7vCpwHFg/qJ/N6VS4Lzp/N+c2rjtsENFKEs8/Vu4=;
        b=RIvRn+hfVsL5Oiq0+BcwUL2i3fRx7yq6S2kOTBXcY2nOBhf3LAsHADPGi4f+sPNTea
         qR2rl4BS+CE05vcx+nZuBG91c+I5e5Hqu9QzCuYTBnIN7rVG+tvCBH0U7IwWZBZXUs2Z
         Vljv2TxZ5+NZgX66NnaBUHhdiTxxIUSV6tm2WCuUn5h0mWmS6epY4/rMwuq+NQHgg4dK
         T7eZHGsbUut5ml0A6LDX4GEdOE02q+P8fLhO0gKK74HGoHpmJjVYtu19ommp8FFkyzq2
         zha7qnBHC2iJ7M6z2tO67/rEICsXF87S2nlahwGWybw9NUQjGWcTCrl/+sUS/5ZiMN5o
         XDpw==
X-Forwarded-Encrypted: i=1; AFNElJ/wYQsIdbJFG8XkXw9ZGgU2ivG413GtrYedjclGDw/JKXvZ5h6KIASODhU+rqhV69JM99Jw8NhnjxswsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKCNUTduAy3MypO3glOQo+dk5am4CwNKNffnVL+xSzLoC/Up5w
	sPmvefHPf6B+CnCupq7H6SnB8WQGRytqCwt1/FYb3J0B0kJtw+9Wbc2m
X-Gm-Gg: AeBDieu99jS/ZZE9cKBIJyAvAmQrz51sxbxGyurYnJZ4LidnI+S7QsgZ/pflzBbmQTK
	xbj3C4xNpV9NKUVP93V2TW82dFSZsr1Re+xtUGnM/xY0CdoAnSl3lzFrml8i7lVdsp1z7wvTQZ6
	4+TpC/ULdbFj7Oea+r35mL72epr92x/i4z0upH+a3YfGtguGSm2s9bIkRSChLZNacYQSm4Ou1Cy
	uedyOQdN/ftfjB2iHX4+LXbHUZwVMfGdpvf8SOWIrwBBcTek3FVzIbJZMrQdKm+Do4RVsSAHyv6
	ZLonQRTGs3KJ3FRfcc3BhqR56il5RCu8H4/i0f6rGW5RWtJp5WOGc9eb7rhCxV/oQU2MhIfFTcn
	5/jMEXl+C4ZOuhZ5NXvm5wcCqSf1lAeAq143fKMu9uYVf94Y9frLONJdx/2tcKpfiUiGANu3up3
	zV3S5A/j1k9sfkoFDhwCap+yxbZtMu
X-Received: by 2002:a17:903:1ac6:b0:2b2:50bd:83ac with SMTP id d9443c01a7336-2b5f9fbe8b7mr344293685ad.40.1777114564649;
        Sat, 25 Apr 2026 03:56:04 -0700 (PDT)
Received: from nuvole ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa33486sm303832345ad.33.2026.04.25.03.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 03:56:03 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Martin Kepplinger <martin.kepplinger@puri.sm>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH 0/4] support camera found on Gaokun3
Date: Sat, 25 Apr 2026 18:52:56 +0800
Message-ID: <20260425105300.745044-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: BD29E465FE2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-59587-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

This series adds support for front camera on Gaokun3(3.0GHz version).
The front sensor is Hi846, this series also fixes a error blocking
Hi846 driver function, and supports more mode on Hi846.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
Pengyu Luo (4):
  media: hi846: fix hi846_write_reg_16 handling
  media: hi846: Add 6MP and 8MP mode support
  arm64: dts: qcom: sc8280xp: gaokun3: add front camera sensor node
  arm64: dts: qcom: sc8280xp: gaokun3: describe rear camera module
    information as musch as possible

 .../boot/dts/qcom/sc8280xp-huawei-gaokun3.dts | 255 +++++++++++++++++-
 drivers/media/i2c/hi846.c                     | 161 ++++++++++-
 2 files changed, 410 insertions(+), 6 deletions(-)

-- 
2.54.0


