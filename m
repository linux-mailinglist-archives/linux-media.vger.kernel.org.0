Return-Path: <linux-media+bounces-41690-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB00B421F2
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 15:38:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 484057BBD50
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 13:36:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77C70309DA1;
	Wed,  3 Sep 2025 13:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DfKs6bwJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC092EACE2;
	Wed,  3 Sep 2025 13:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756906661; cv=none; b=CMKS8k080mqm+O8nZXrLqLCDNcsoLKfohAtB4ZR/JinYuun5vFrsY8LXu9TLDxQL2vt7UMUf8N6B5AQZ2oaiHT1Htp/urzbUhZyanIgt4A55yk963ehK5FGZkWQbn0ookDIhFHNDEHKV7dfk6BSQcP2YncQhYZY3Jpwal7WkP8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756906661; c=relaxed/simple;
	bh=4Pv/lZEmRfsRDnM/wSl9bsAh9CeiyqAEPN2KUA1IfR8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=knFOwwrS/18T/zJIkOO4u/78uKBlgllsW8bPLP5gKxt7T/TNEsKLx9acMov/1VJEVyAUzASxGxEywMbLrx7QbrKFe8uS2UXRtY6kua8tQpPtlglJj5087AbzjuVqTiKGptQWx7QrRJ0Z593fmiw1yRewdmrMcA2mgYFZCxvCRhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DfKs6bwJ; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-24a9cc916b3so36962525ad.0;
        Wed, 03 Sep 2025 06:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756906659; x=1757511459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j0IPIvNKxRX3PZ8lrrWw+UHXMJcK73G3kVKGuC4cM1o=;
        b=DfKs6bwJkfyX+MH4pxXtcjOG53XUyaKhXkoq9lExEPK6Kf2FI/PsuGdZSw3lSEUhCg
         Is2pe459S1kKCHjqYuK6RHmqsw0S6hXNWtHIwls9Rjvg18dfF7VxSnirJUL2eECnO0u2
         ZCZENTJD8K79PaIzSXRqbnDvCDcuiPx1xbsj7pnIlSULhQt6Paq088JbbTpg6EhVTXDn
         QiYlijyKfWhdGemMf9NGX1lgA7i2KzDcF5NaTOvSosDwMfBlZaVM2kR02xMFq6BWI0Kr
         ZxlC+Q1iepgRmJ0uJZM96rDdhpZHYW5B3WmFi4z64gmCW6LZ7rX51czXLyYVvGIsWT2O
         /fBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756906659; x=1757511459;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j0IPIvNKxRX3PZ8lrrWw+UHXMJcK73G3kVKGuC4cM1o=;
        b=trUOZnFcuRkEjxvSs2MN5Q8138MFGF0esZd1oUq8fibvFeOWXfsOhAOGrkaAS8Lrrf
         L4duJgv4S2BOKKXyA6I/H+QpV25VUAQt/PmZ79I/JSsEk9bxstN24cqf9ex0FjJRmkVP
         wQJQJB9uzzvpwU4cg/9+3VqJKMLCGqpdDnQ3zAf4zxm1EnBBAOcDkkWjoBWBo61Rlkv7
         RMVLukIxqZT9NPgVMRC3RZAnRR4A2i6sOcf2OcjJVMhB/b1FKoH/6GAlTVOJ//oAm7JB
         F0KcBXOkeqNUPOcl/HUmwjIV+47ZREwQIMzFZ0FJutQ7iMN3b2AtUrYngkZboHyG3wHA
         mTPQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9ENQ9QAfF0Ehz/UX7zIAWBg5+XW076YzBRjUJjHbdHPncS9tIDwC+Qkzgk7bN44MDSRTTd2xTFrnE3uDmxe1l07A=@vger.kernel.org, AJvYcCVZv815wdiT8roUtwQSVHVWjm2QZ5w4VP2KLlEJATTS5Frs4xUI7XYVcO1M3FlE0/SxZsivXYq2c9znEnk=@vger.kernel.org, AJvYcCXP/p5DTFQNJMWw1BiND/C9RVxawkQBxCCLtVTi9AkU8SQLY0nxvvKQVknGfLxZlHXcSNb63bf6@vger.kernel.org, AJvYcCXnW0qmWGL+HCahHpbLhnWmUryEqdnhp4jI+7cL1c/cbDBb9CYWg/N/pMZpVvdhVatxAitPHGq87Ybf9KU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9qio5D86UdaLbo21knMfeMGT9BOVbyJTLQ4/c/njYhPH/L0NT
	jhs7hhT5ENGPqKBDR8gydyL34kUTkE4tqClqi9Zie0xkBdDKCJNr//6K
X-Gm-Gg: ASbGncuTYmZGoInsLESgTT+yB9gtz5bU1jorVzdhIJ75ZWX5UFuap/uqsKEe52VNrRV
	fyTWJ9xCWuXIrR4LYiPfO4d4/otZ8q4h+xWelPWQoIMCd6smFTSHREsh43e5P94K6U8qv2P+QJq
	hjvR4V5K4i07wP+VUuzpEGc0J36KS/00Vtgt7gcjNiohAQglKITYL4CdHSEGp8hXv6HD7YUwC68
	aV7i0pkVF5z1+FglronqUMflLb4BFbqtW/pM6F1R0E4mHJ2DCNpG9wDqefLgjxKGG4yv3tzQSDG
	AXu0iUVxpdV1Lfi/gFjUAz5IOgzlMXD/GS7YLZ7e9v1hzBsLMkgfZb1X8gFYQsCCXmA9k4bT1vv
	p0dM3Y1xKeKZIE+feCDKVvJNHbvAtgI0LhwNBe5C24hUJVmgvN/hyWCvbKMhHUTj5gDpfWwd1K0
	c3B+pEvEpQLpQEmfNnb2t+ovXqrTpxbiPqOjeM28Sv6ojJ/i4l4rm27KxU
X-Google-Smtp-Source: AGHT+IE3ddf9hK7F0KaN7V3DmayhHVnNCIX3cwwbaTIxo3HIL3JNiS8r9JtynDMZISXdX38A9mDSzA==
X-Received: by 2002:a17:902:d4d2:b0:24a:8d33:96da with SMTP id d9443c01a7336-24a8d339826mr201854925ad.40.1756906658477;
        Wed, 03 Sep 2025 06:37:38 -0700 (PDT)
Received: from vickymqlin-1vvu545oca.codev-2.svc.cluster.local ([14.116.239.35])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-24c9e39094dsm16152645ad.84.2025.09.03.06.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 06:37:38 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH] media: renesas: rcar_drif: fix device node reference leak in rcar_drif_bond_enabled
Date: Wed,  3 Sep 2025 21:37:29 +0800
Message-Id: <20250903133729.2523130-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function calls of_parse_phandle() which returns
a device node with an incremented reference count. When the bonded device
is not available, the function
returns NULL without releasing the reference, causing a reference leak.

Add of_node_put(np) to release the device node reference.
The of_node_put function handles NULL pointers.

Found through static analysis by reviewing the doc of of_parse_phandle()
and cross-checking its usage patterns across the codebase.

Fixes: 7625ee981af1 ("[media] media: platform: rcar_drif: Add DRIF support")
Cc: stable@vger.kernel.org
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/media/platform/renesas/rcar_drif.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/renesas/rcar_drif.c b/drivers/media/platform/renesas/rcar_drif.c
index fc8b6bbef793..c5d676eb1091 100644
--- a/drivers/media/platform/renesas/rcar_drif.c
+++ b/drivers/media/platform/renesas/rcar_drif.c
@@ -1246,6 +1246,7 @@ static struct device_node *rcar_drif_bond_enabled(struct platform_device *p)
 	if (np && of_device_is_available(np))
 		return np;
 
+	of_node_put(np);
 	return NULL;
 }
 
-- 
2.35.1


