Return-Path: <linux-media+bounces-41381-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B6256B3D14B
	for <lists+linux-media@lfdr.de>; Sun, 31 Aug 2025 10:06:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 332A516D052
	for <lists+linux-media@lfdr.de>; Sun, 31 Aug 2025 08:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F1742459FD;
	Sun, 31 Aug 2025 08:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j14owpiy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79493FC0A;
	Sun, 31 Aug 2025 08:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756627584; cv=none; b=il93zMaB1YaiG/arE10na960LLUk9pwxuSpCCp+mzrKNDiagX/gBBSBA4C0Osuu+cWtyJfY1bzisyv3Ep7jtK4Up4YgCRBXLaMJ84DwIfAtvlkgZE6xgKZW7FZJhNUpZ2esCXCR9x7AYQYu1OhrBSuvzjiWayVmcMmyInSDfsVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756627584; c=relaxed/simple;
	bh=sC/MwN32ASJyToPylL4/RsioygsZUR8faGvfbPh0KQs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C8aRVZDI96Qyr7b1nzlzfhcf5+UQrcd9by1zd7neuXIqoZMxCtvLN4ob8GM8ld/gvSU4Ewg8tt3vxebGtxFXjcQ5mw/h1y7wB35rBX4dIdeg3rt9HAGfN3rWDcQV2vYTcZxYnShSzVXJq+CWn+wV2Z0FquJ1HgndIlRkyM98DUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j14owpiy; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7724cacc32bso245791b3a.0;
        Sun, 31 Aug 2025 01:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756627583; x=1757232383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WbpZYkM8/eax+hHyTSyOF259hZWxfQyVQUfEKray7Ow=;
        b=j14owpiyuDfu5En4yUX2aGz5sWRXUO0OxWtAVZdlXPPWVsHTpAncKhEftrewKyOKE6
         MYeZb5PF+2v3CxPvYDJhv4ATZdP2TVtkNnwAPEc3Tk2aakpaoNZDdzkbXr9v+H/RT5pK
         nFZr4eAGaq0HfcuVkZbxIQtfIBhoYgQxDBUfIsftnaWKSmYMtm+6JqL1BXnnqrSgblZ7
         cQwXqj6qrq9wXyoTcWXOH3sHktEP83vly8VxFMXhhTAYZbcFdbaqTs6/JqnNer296kwK
         AxkJQK3171eAiWoq4dAHFtRMAKJivl/AcLleNdCK+1ukeH9zbkvvWsj5DUuuh/O0IHdQ
         Xm4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756627583; x=1757232383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WbpZYkM8/eax+hHyTSyOF259hZWxfQyVQUfEKray7Ow=;
        b=sWbwDWAhnjZYsIRWJeCrrLdUvbOQY7Q7S5EBL6mTgHhyH4QRmMDSrsAHod9SJysWeg
         COwBk0RPvfONwBlBnSXbBPmsCX9yZFh7LBQZXeAgvgAqDoL8pDtRmSx30Nzi+dx5x97J
         EQdF/NgNWQmU8Sya2do0XPSdlE7bXGaWKapGQKVsrbgUSXY5mW/eJOTkvxuLPVBswKke
         gQ/PpLJBXOu4ccbL0zCvOBGXSqzhtNCax2wWpd2gNLCIl13CISOdgnY5AF6S/U0X+XUo
         /oO7G1Ty+SNfDTauzL9aSDGNFr1ErF0YIGOY2NKYgFFyqLRR4f+1E9vsZAX6pzCL0sLw
         Bftw==
X-Forwarded-Encrypted: i=1; AJvYcCWDkTBTTwz2vZ+9AL7vckrHz/sqvVtAq6ggroHFqWzplX2gf+sbLzV4MuJAt/TEdmuWM25RTJIKo9bSiBI=@vger.kernel.org, AJvYcCWNOjKGfdWUjc6RaRkALa90+Oku7S5lOB+ZTljazohecL4RTFISDUwqy44qGW/FMfRjHFA87W24/wNab3w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh16BmuPB7vS4AU40f4xV3IH+3XcZnYA3afBNy/PP9PFdE3aE9
	eShod9JNnZGmXmI61JC3rEJp+/0aqC/GrHhWaHRmwLpBASskU/ttsN1et9W/Uw==
X-Gm-Gg: ASbGncsndMNhEVjrlOKMcUnnqx6pMcvh8+Y+I3m3NfI41u9dfTBsZCP8pijfytek9Xu
	ROqMRSocasjVaIT3O/um7DXG4sf3dDQoJ5IhXuXTKVouLB/1y7vGAlA7ZRRMYp+EmZ93OZjEjzw
	z8WCHTczJQ6vWUeOex4QowfPHeTzVgdEJoObyHU92JejK5/2AQdl3U+nzLBkSICrPrttNExrOVM
	A2hFNOzyZmmJRoLmNV7IWqhiMOCe02zhgdeTEcff83c+oP0LHgrIDPeH63T7LKgH1KukDxGmkE6
	eQoLaqeHlgt0zvUeSo9a6MGqgSMFTfEHbNz+Fx8yQjkMddR64nnfKY2DwQ4B77nhx0ApNny6F3N
	8N9EuCUqR5LUo14KlsH42Xj4rD+gN9ia3NK50rSAGf3kQ/QLH/ZQfhyNfsN5ijjbdBPI=
X-Google-Smtp-Source: AGHT+IGlEsUtrwZ+VnzBoAfFAvxDvG1fjQuDu30tCr7qELt/71Ds3Y2NFXainPeqtpilY/2/ANSw8A==
X-Received: by 2002:a05:6a21:32a7:b0:243:6e5a:51ef with SMTP id adf61e73a8af0-243d6f43198mr5962282637.43.1756627582611;
        Sun, 31 Aug 2025 01:06:22 -0700 (PDT)
Received: from tech-Alienware-m15-R6.. ([223.185.128.79])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd006ef70sm6433007a12.7.2025.08.31.01.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 01:06:22 -0700 (PDT)
From: Sunny Patel <nueralspacetech@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans Verkuil <hverkuil@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sunny Patel <nueralspacetech@gmail.com>
Subject: [PATCH] media: v4l2-ctrls: Enable support for u64 value
Date: Sun, 31 Aug 2025 13:36:06 +0530
Message-ID: <20250831080606.35545-1-nueralspacetech@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added Support for unsigned 64 bit value

Signed-off-by: Sunny Patel <nueralspacetech@gmail.com>
---
 include/media/v4l2-ctrls.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index c32c46286441..7b2bc459f378 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -250,6 +250,7 @@ typedef void (*v4l2_ctrl_notify_fnc)(struct v4l2_ctrl *ctrl, void *priv);
  * @cur.val:	The control's current value, if the @type is represented via
  *		a u32 integer (see &enum v4l2_ctrl_type).
  * @val:	The control's new s32 value.
+ * @val64:	The control's new u64 value.
  * @p_def:	The control's default value represented via a union which
  *		provides a standard way of accessing control types
  *		through a pointer (for compound controls only).
@@ -313,6 +314,7 @@ struct v4l2_ctrl {
 	void *p_array;
 	u32 p_array_alloc_elems;
 	s32 val;
+	u64 val64;
 	struct {
 		s32 val;
 	} cur;
-- 
2.43.0


