Return-Path: <linux-media+bounces-19452-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B30799AA1A
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 19:33:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 096E42868EF
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 17:33:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14C5A1C9EAC;
	Fri, 11 Oct 2024 17:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FMiun0dN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5D51C579D;
	Fri, 11 Oct 2024 17:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728667866; cv=none; b=i6jkC/TPJlkT9/I4lwC+gX5yPksbLan3JEiyeWApNLNL40QauRlNDKIVTRhf3amFIGn0nvN91swhKIPU15+8Vh1lXEG2e/Ybr7RX5KUFQy5F11eFgZFfuVIzast7zLE4wpi98/1S8oh3WauGeD13S8/D0i3Ig/040TpfkBbnA6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728667866; c=relaxed/simple;
	bh=EqMgQ7qYiKXRyYfaLbrU8JB9/SiOPCFQH5V8Wh0MYjg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WHda9olewb4Ok26wPZYprbsA8gsyaACMQTmszoHd7SfpqR8y9Q9mUppFuOWQ/ueFE/ucdJSW0Fo8XWp9LMPpItxxAD6DFztLvPQhHlyNnc0Q8+noEQFxh3sJ+hXbN61Yot2e+JIBmHpBKXtnbS0sRrWCxh8iltIttTMZClXDzig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FMiun0dN; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-37d5689eea8so504530f8f.1;
        Fri, 11 Oct 2024 10:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728667863; x=1729272663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LMIpghf6+FEz2yCIvJrjByNXfmRyRcuz+y+EE9o6Ajs=;
        b=FMiun0dNd+IILbZAVIrrCnNS/z9uyaaEumjaainQT2lpbaCVgdVSys76vNzgm/WtpN
         pmIXdhWvX+E9hjnkTtjESUAMxjo47jdXAOkUjRjj6VbiT+/t9zJi6IoK16apidMPtjmM
         MlUhButF90w2BwJfbXqGFjtuyM/zfenCAaXsOBrIGtjbKQyPZVH7kMtAT1+unI4XwcNe
         5fZRUAUmMgDcvsMBuyVjUG2GRrAvGD6G6NKmaGr3lNG0yIdBk1IOYlo+3f43a1r0cVXp
         beep5+0wqi+DjBiDY7YlhvTP9IoGQI2/44V/aizvYi8+c1kILM2JXemm+d0JPsQey55B
         Ua/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728667863; x=1729272663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LMIpghf6+FEz2yCIvJrjByNXfmRyRcuz+y+EE9o6Ajs=;
        b=g8AntTeTYabCMIYMK+qt8OUlBvAZX0nXc5KIjNTDnZepyWTs/uVX8nSUz7qId6J+22
         Wtqgjk9YMT5VUwmpLRJGnhimejbnhg1xH48Ywsy41RPYRq4HvZvG1cENgdDNVIZmbA+G
         ofbNhd9z0gAj21fXlkkC7oH2O4kIWHPY2SXmhDslEE2tD8DhmKBsULdZpHrcvsAUoXcP
         VFzPNmJeuNR2gWZS9iqyct+qQIP+sUiyHNmwgyhS9roy4tPXcktJncJNPaFIGBGjGQ8q
         AMpErfB3JJdAhP36VOFms7UQv1RIlA5SFb9NP9o5L/VosViz98g3+O7VwmjRSETEGXUd
         3tQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFU9bY0jBGUbDMmWLpn9czUYB7lgaxAKM/4fqy38agtLk/MS0CIZwoF0KgrIx4WBBsBpVq65EM/zrnuf2vUDfzV/4=@vger.kernel.org, AJvYcCXSg+PPcO86SCIPlMuMUy1kJNdMDYsng8b/1wkhT4bWD+MIlg+0mgAoU4/XsZ7JSS6yTs69qZwoP+GlMhc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpWEsXy3lvcgcdFr6vYCkWBCsG0zbwKZ0vYnbJtwUcfTf615Gz
	z5GYtCCQGdgS1uF9TXyGxYrpqxFqVsRDgR1HqSl942hk5hXlinD2
X-Google-Smtp-Source: AGHT+IHJDrSjf/JJ9A9xmawa48UiBP702BiB7GiOR1bCg+qvxZ5UplsYBUQfPClH9A+KrrHRkqLDeA==
X-Received: by 2002:a05:6000:44:b0:374:c4e2:3ca7 with SMTP id ffacd0b85a97d-37d5519020bmr2291600f8f.5.1728667863046;
        Fri, 11 Oct 2024 10:31:03 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b79fa0asm4396516f8f.83.2024.10.11.10.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 10:31:02 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 04/22] media: rzg2l-cru: csi2: Use ARRAY_SIZE() in media_entity_pads_init()
Date: Fri, 11 Oct 2024 18:30:34 +0100
Message-ID: <20241011173052.1088341-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241011173052.1088341-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241011173052.1088341-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The media_entity_pads_init() function was previously hardcoded to use a
magic number for the number of pads. Replace the magic number with the
ARRAY_SIZE() macro to determine the number of pads dynamically.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index 2f4c87ede8bf..abacf53b944c 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -804,7 +804,8 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
 	 */
 	csi2->pads[RZG2L_CSI2_SOURCE].flags = MEDIA_PAD_FL_SOURCE |
 					      MEDIA_PAD_FL_MUST_CONNECT;
-	ret = media_entity_pads_init(&csi2->subdev.entity, 2, csi2->pads);
+	ret = media_entity_pads_init(&csi2->subdev.entity, ARRAY_SIZE(csi2->pads),
+				     csi2->pads);
 	if (ret)
 		goto error_pm;
 
-- 
2.43.0


