Return-Path: <linux-media+bounces-28213-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E10A611A0
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 13:40:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A2601B62195
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 12:40:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A9321FF608;
	Fri, 14 Mar 2025 12:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dVQXj2E0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265891FF1C2
	for <linux-media@vger.kernel.org>; Fri, 14 Mar 2025 12:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741955985; cv=none; b=hsGMiob6nYwGC6WqLW9F4Yyudir5GBqZIjzA+gI+h5B6g1QzA+qD9+bcKlgcNgQRbB5dJeocM9KLxtx6Mg0lfIjUWhFscWJYja7+vYqd14dNQmXJtuO+R+sdS9XXXLzelaxhdTMRMxX+FYvpmtRpp0At3OoM4NfzGeolojiNjqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741955985; c=relaxed/simple;
	bh=/pW0R9D7uHZMJK4vBJP4tRWLf2TE8r624WgltpYA3/Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jAmaGUIPmVNRAJg2XonhXztkCptbo8fe+ig6OLDWrI46a9sVdZVdvFa0WZgiuiw2XCK//j8r2+a6OFBiB7ItYX+/ovAZWxjfGTxGQdaNipC2hCbXcuDKtTSja0eWHeujhEP+54oJfQa6Hl/50sAoMyyjrwdxjhk6NlkrhPJ7R1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dVQXj2E0; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6e86b92d3b0so18218666d6.2
        for <linux-media@vger.kernel.org>; Fri, 14 Mar 2025 05:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741955983; x=1742560783; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MaXgm+yzeWHhK7udzVdjry9arnq39Mnq6+YB4TtmdM4=;
        b=dVQXj2E0n0ucQOeUOYq8YkDp8sfX5nqXhh95OTkcF4PVEGR4/yemMgzJapk3ud4go5
         HGq6vdNpWo5SENMAm7sUNllFCZxvygDDnHO8qg+PH6VNQDNfNrglNd/+FzdaT3RUzDlM
         u6GcIzN5T0bb8yRvQ2xBS02uqMmGOGiNmMRJg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741955983; x=1742560783;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MaXgm+yzeWHhK7udzVdjry9arnq39Mnq6+YB4TtmdM4=;
        b=XsKt2jjoMzJ8kNVkiIB1QnUxQDApgHKgU3j6H8ILYny86rUwCzgO1arcpn00hoUj0L
         LlMHkGNrrPJ97A0U9CuM0G1fhVKlOliS8u8qzYtvPvQwsYUyu5E4zHEm9AEhD5TWpvTX
         mHbe38zhMVi7OzHvYh2Ax0pOeQF8D38uBrMu6jxFRtEmzZKGtMoeKLrOGyxPBB9mT5yT
         D3R1ubNkDv6LmCjkqDO1i2Nx9rPpgUqaaNi1HgSD0n1Ya4vVoQQmKosgw8A4TuLcQDhR
         K1YF6E2nlkocqEvPwsUW8u/h5sWbcXVTLSjQoOgC3iN76VjjS948Zi1c5dt5KuT9e27r
         WI4w==
X-Forwarded-Encrypted: i=1; AJvYcCXbW/ymzyFnLuWd3pl+jsun6VlG2KTf+QEv5TiSHgDZEWIrVQ0FYuu15RM7xvD2Ug2OakJHq5Ypril3jw==@vger.kernel.org
X-Gm-Message-State: AOJu0YypWu+DK+C6ntpbP1fWmz+xVm5HeprbcUU4QdJ2S3dOkqdctflo
	eiCv+mNZpz+TK43ITjN0RjnapWZh1a0Bz85uVy/tK8wuyhsx53sOMCrZPOStkQ==
X-Gm-Gg: ASbGnct3+yfEEFY+zvgva5pYBBiEcHqyHAr3dZd9gk5/Kf5amxtFWeaWw+8vt2yxtdF
	VmyNj2sKGl/a1D2PTg0ybB1ONfSQ/VgSMh8xPo0w6Mde4I0bO88BGl14o9a5rZ2BoLtFXUdUORD
	OkMtEzJq518vKwHmFX/6bTcjRHFCjDWs7L9rLAyYreTN62m8PiaAMTIqvp5PGo96SkWDX0wtWgr
	uJ+o+x5ohGAAx6lVvWu4JHQdHLHvfZl//+sQNkKuVTy4QKiNmFb56eoKXsW2o5RH530gHBVGKTa
	83pnd+a2xz3aZJxGXC4oswwkGI6jE99XM3My6g1Wqem2DrqmeWfI0vmyBdwaNzShU6w1WVVMJy+
	ARFwih/p751cSrLCqB7JJ7Q==
X-Google-Smtp-Source: AGHT+IFM5j0VZpj6YX0U9qAjNIvQTnIzXPOHOx3wYEsvxQbTFHkI9LRKWp8ElODaAGpHTftIynH4cw==
X-Received: by 2002:a05:6214:1c4e:b0:6e8:9535:b00 with SMTP id 6a1803df08f44-6eaeaa0800emr25952736d6.12.1741955983076;
        Fri, 14 Mar 2025 05:39:43 -0700 (PDT)
Received: from denia.c.googlers.com (15.237.245.35.bc.googleusercontent.com. [35.245.237.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eade24b8c2sm23031586d6.50.2025.03.14.05.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 05:39:42 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 0/2] media: vivid: Add more resolutions to the webcam
 emulator
Date: Fri, 14 Mar 2025 12:39:39 +0000
Message-Id: <20250314-vivid-fix-twice-v2-0-dcfca4053704@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIsj1GcC/3WNwQ6CMBBEf4Xs2TXtUhA9+R+GA5QV9gA1LVYN6
 b9buXt8M5k3GwT2wgEuxQaeowRxSwY6FGCnbhkZZcgMpKhSpTYYJcqAd3nj+hLLeOaqIa0NkWk
 grx6ec7kbb23mScLq/Gc/iPqX/ndFjQpPpi4t9arv6vJqJ+9mec5H50doU0pf/jv5c7EAAAA=
X-Change-ID: 20250314-vivid-fix-twice-9e5821142248
To: Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hidenori Kobayashi <hidenorik@chromium.org>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Add 3 more resolutions, that are present in most of the webcams. Now
that we are at it, fix a comment.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v2:
- Fix Hidenori's email
- Link to v1: https://lore.kernel.org/r/20250314-vivid-fix-twice-v1-0-7463c2b0ba63@chromium.org

---
Ricardo Ribalda (2):
      media: vivid: Fix requirement about webcam_intervals
      media: vivid: Add more webcam resolutions

 drivers/media/test-drivers/vivid/vivid-vid-cap.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
---
base-commit: 695caca9345a160ecd9645abab8e70cfe849e9ff
change-id: 20250314-vivid-fix-twice-9e5821142248

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


