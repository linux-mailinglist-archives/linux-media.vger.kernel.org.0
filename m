Return-Path: <linux-media+bounces-54529-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IP/TDKt/qGmYvAAAu9opvQ
	(envelope-from <linux-media+bounces-54529-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 19:53:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E2D206AAB
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 19:53:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D930E3029247
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2026 18:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BD893D34AA;
	Wed,  4 Mar 2026 18:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R3mQQIJF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9254E37881F
	for <linux-media@vger.kernel.org>; Wed,  4 Mar 2026 18:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772650226; cv=none; b=oth+QG8qHGmMUfg9r0jKYjU4EPFMMNwV6DTVwLDnj0ritPlAfOhi35ZNL9/QieCnGDC76aN8p5GHJTaA4Jff4J1GG5cq9iYS4CM/znvi+EfutU9bJtlAEaQakGRUNcHdiHLYb4MPkWQxuO7CcNKau0hGaqCX9au8ys674vR7Yo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772650226; c=relaxed/simple;
	bh=RTUoC20+hs5o1NjiDj56CArTzfaT0BOQTJKMZ8k4DGM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fofTQ7r9907jP8HyrzjaEpqsqjAHf4lla3JqExFKnZEM1cz/MZML0XnE3G0qAE//fgXjwpbDZvc5byBg7964XVYQxFFiFpgeYRi0u97YJe66tDiYwyVLwL48LIePl7cCrzqldcG0VN0mHu7iSKQnwbzngprfZC4/pY/krq7G2Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R3mQQIJF; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38a2f92fab4so13761111fa.2
        for <linux-media@vger.kernel.org>; Wed, 04 Mar 2026 10:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772650224; x=1773255024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZAFPHVpy9gxZCYrgCFG0BaQtK3S7WRnxsZcnxGpFCQY=;
        b=R3mQQIJFfI4EU6UxNJ+jyT+cLYAXZu/BREtH9gdlY5w8svgxM98se52CL4KLKmDsm5
         wNyu0skcaS5vAmw9UNN9AJ+ZIuSRZOneaPD4cu7WLP/6G/Fj54/WNM/lJCd7jcVeXecR
         VLEVZ/MUbyNfn86vsPZOOAMGiRfcs9+cV34ZIARGFeLfW84rYDli6H1ZxPtHglKcGOYG
         UOS6vx0wAf2EOcVHyE7d+e+MtFNR49ouSw/HFgzxx7noCi1LEatqRlRgAj/uHyqGtMB5
         fXKExJocrEVWdN/JW+Uxhy8pV1dHxncAPkcEjZBlqKa4DS9JQiMi+WErziMy9k71Cj+g
         iBhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772650224; x=1773255024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZAFPHVpy9gxZCYrgCFG0BaQtK3S7WRnxsZcnxGpFCQY=;
        b=ZWy6n7oVbO8wAgKAsgWDOlomg5vooXesS7RVzUwwkFHNPFw10H5w9bkxlpVihMRCNG
         8pscc0lqpZ2oC1tAhajl9dLboEwply/etmU1tlIkxksVTOc4wDLqyRCnWeKRRkTQLx/Z
         sUSdrRTdUOq/GzFElHdZWH5QQZKN0+KUiVUEEBYC/7MrAs1e9UV7bjwc/4gIszjiW6+V
         tQ4aJQMYo6sbiIAZdjnNS0ulZQ9HGRZBJTOLcUOKfjH5kiZM/cPnXoFxtqH1RDGhH+fs
         eUpgwRioro8c7Hzwf2HDcsEa9CErxpoV3+EVibFzW/Rt96rlbOIuw+uxBa5A547/jYC3
         IcDg==
X-Gm-Message-State: AOJu0Yxx+6d8hvAMF4e4x+dY/iFJqpUKs6Uzpm7BdemOQvdyMjiaTyx0
	prURF9hgAlFAI8fEuJp/xqWdrgmBJX3POPyny6jPK2gRazyvqWoIy76SS6GFHQ==
X-Gm-Gg: ATEYQzyKMe7nmdYfM+kSDsz0LsYN/sPpDBb9ucPjc5/+eDOuBNNpLoI84zO8Knj/kmv
	2QE+SRnXuD2xzDcxz6xwnFa+GHATkVH2NmKux8L8q3VXF8ImY0KRlXKNS6sA5vgNvmi+FUNc2Zu
	qaucc0wDsSvy9lNr+sy7nUEqqlvqNVUo93SafXcRrcIS5+3XjRcZorkIp6Usm2Lcx3M8zqpJAL6
	KV8PoF2xvuLVN8mrsOcSJxUvVDylQTxsm8PGFAQg5DKoQzQW3pbWdM2IezjAvQGWQDIpPEGPlHa
	8HC5t6T2kH41VuswhR6klrR18mZTWhVeiqrcivA4nl1Gfdtfb0BJB88SBdHG5PumWpT5zBqyLOa
	enh88AloB3Ku8yeXZDNLlxK9cHWRjSyHXRTgjka+Npu9lYYV7PTRNRIaingWMH1Fa0rfrs9P6sI
	wHzdjsTJEzdw3D
X-Received: by 2002:a05:651c:20c7:b0:383:1d66:c204 with SMTP id 38308e7fff4ca-38a2c9ee584mr16374911fa.38.1772650223495;
        Wed, 04 Mar 2026 10:50:23 -0800 (PST)
Received: from xeon ([188.163.112.72])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f30179e9sm36636101fa.33.2026.03.04.10.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 10:50:22 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] media: i2c: mt9m114: add support for Aptina MI1040
Date: Wed,  4 Mar 2026 20:49:59 +0200
Message-ID: <20260304185001.82988-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 84E2D206AAB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,linux.intel.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54529-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Slightly different version of MT9M114 camera module is used in a several
devices like ASUS Nexus 7 (2012) or ASUS Transformer Prime TF201 and is
called Aptina MI1040. Add support for MI1040 into MT9M114 driver and
document it in schema.

---
Changes in v3:
- state_polling > state_standby_polling
- added check for device_get_match_data

Changes in v2:
- dropped conditional polling of command register 
- switched to device_get_match_data
- cosmetic changes and typo fixes
---

Svyatoslav Ryhel (2):
  dt-bindings: media: mt9m114: document MI1040 sensor
  media: i2c: mt9m114: add support for Aptina MI1040

 .../bindings/media/i2c/onnn,mt9m114.yaml      |  4 ++-
 drivers/media/i2c/mt9m114.c                   | 31 ++++++++++++++++---
 2 files changed, 29 insertions(+), 6 deletions(-)

-- 
2.51.0


