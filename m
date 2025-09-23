Return-Path: <linux-media+bounces-42998-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDA2B97260
	for <lists+linux-media@lfdr.de>; Tue, 23 Sep 2025 20:00:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1AB7C189617C
	for <lists+linux-media@lfdr.de>; Tue, 23 Sep 2025 18:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6D29281525;
	Tue, 23 Sep 2025 18:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="in0c0VEy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C632DF12D
	for <linux-media@vger.kernel.org>; Tue, 23 Sep 2025 18:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758650406; cv=none; b=p10Kj4Nc1O580ljhf0IJlstZrBlqo93cxONndBB74YxK5ABwXoKTCUbe/P1bFAY/Nxoi2shHF0itKaYZOQ4mlCbSr2GnZSCdYZHjRrkpk0uY61yd1loLqEeBK1Yoa9TvUzX9gsg0aBE1DgjurgMmis/Q8I+9CH+5ylbXVyUGtho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758650406; c=relaxed/simple;
	bh=7Bo1kzD0/rFjU3dEcXj4ae5Kzk5PeuyJqqmxduk1MfU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p/HhqE0vkFVXu1hmtLImK9oXrqllIe+2ntzS7kdqF5d6nVrJ4O3cCQP/0WZu9/nIg8gAqg0o9JnHOybQNjJ08mGUlbLQ4OGYRN/US8OKfXaIs9CiELSrtdLeMo5Ayuj5SXgaJlWBpAOqreYxsn8g9dapiHYFqwSIsZTzzNq4L3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=in0c0VEy; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-27a6c3f482dso17861685ad.1
        for <linux-media@vger.kernel.org>; Tue, 23 Sep 2025 11:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758650404; x=1759255204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GPN+oc06mTdPxDaONBr5KXu8+tb7IBNS+Yxkpiu/3UU=;
        b=in0c0VEywPEsCmDmyF9Mh9y/0tVbSnwScqRLuwG9aR3v8rE+SamUM+a6vizHm+BPAi
         RXOkjJGZipXzKXOoOixY9isMZLj9zYUP7MRTUfabQh+tB78XEMHLSL+4Q/2F1pBZMd7B
         WeTIm7bxVyG7ew/WQhRAbfHuW9zkpB5FUW2xxELpWD3scLVyYtNz7Iw6sLJdWF0Nilxy
         zwNfGSJPSnqjtDwYg2GtzZuEbX/YwZyB6/I8e/uFGRnPNqqFa5XnuI5LklQaw9Zzj/qd
         f8K/Phn0eXLtgFV+w9Lu3CiQKu5vB7jOk8ELeg+sbs6g4DWZF8KA3vCz78yihsK25HDj
         C+Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758650404; x=1759255204;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GPN+oc06mTdPxDaONBr5KXu8+tb7IBNS+Yxkpiu/3UU=;
        b=gN1GNgF0lHMWb+1FxUWe75HGroyzureZAPpiStKNxtdGBWwQzh2dk3G2CK9vaQV908
         8mmO9MwOo4ByRF0jDyI7xGGbnCpINSM3af8+UW0fS0EC9xWOtXXbVJuTu7OPf76o+Cs7
         yZjbhFLAiGihneZrb6DKYTlQdnhR6Xl+VseORfsloPbQNlo5OrmqfApcZCRGFFvrPEYk
         Z5+aVzLql+x+RhpNtiFCUFTnbaRkJwPtIxiPErJjE8Eq8NTB290oAdpAexQWczHcAmpy
         ZFUyOiOHE70Y8M/ZpNU4ycWgZOxIx6Z1i4Zhfv6iSvQxXs5WGcXRxpYjA2hkfoCYLTiR
         xh2A==
X-Gm-Message-State: AOJu0YzIqH8eFSluu35D5WrGDGj6VsGa6QjTPYSw1rTwrNO+EYOdM8pi
	oNFRd+5u69o0Hg1HuXnKKjuhmKy+ETSot/y1s//Jr72HsxSIcUxAb4jx
X-Gm-Gg: ASbGncugbEFjSLADjdmLBOsNkjD9/ULlKTT3HZ/rENYU2n2o9XDl0znqdXNmmB2W/Ds
	ZkeCGj5IqHMgIqfhufekAHaIkEXRNSH9QWMKcR1U/8ya4jNpvVxz3l4xPxrN00iIpETOtB3Ubk9
	imDihAc7o8w+Ao4NY1MvkXkZ9zgloxaIIkr9J2UtSViCYg9ocwr94k34lB8U8HpuCNjj9sEiMJa
	s3u1uONBizcMFc+xSSjO1qZHIyawxEWW4G3DWZjs6tWfduPkgpgkT/upNwAD+PAhsp9J6S743Gk
	5IDDVGIwgxtrTr1ZyPE1nblWokyVZWfEd9NiiDC6kJuWknHDHKOB+aaVZvqUpPWCm9KpEEG17Yw
	fgFGUtTxQs7NxyJ21XUPG4uBnAg==
X-Google-Smtp-Source: AGHT+IEWKPk22+IFda8QlIhnbmRUEgNAemmbBXNZ0koD7vh+dtohjy+qJSjFHMQPXGRYWGDbqNSDrA==
X-Received: by 2002:a17:903:1590:b0:23f:f96d:7579 with SMTP id d9443c01a7336-27cc5431617mr44289415ad.37.1758650404028;
        Tue, 23 Sep 2025 11:00:04 -0700 (PDT)
Received: from Ubuntu24.. ([103.187.64.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26980368dc1sm164122485ad.152.2025.09.23.11.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 11:00:03 -0700 (PDT)
From: Shrikant Raskar <raskar.shree97@gmail.com>
To: hverkuil@kernel.org,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shrikant Raskar <raskar.shree97@gmail.com>
Subject: [PATCH] media: saa6588: Fix unsafe debug printk macro
Date: Tue, 23 Sep 2025 23:29:27 +0530
Message-ID: <20250923175927.4380-1-raskar.shree97@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The existing dprintk macro used an unwrapped `if` statement, which can lead
to logic errors when used in if/else constructs. This patch wraps the macro
in a do { } while (0) block to ensure safe usage.

This change resolves the following checkpatch error:
ERROR: Macros starting with if should be enclosed by a do - while loop to
avoid possible if/else logic defects

Signed-off-by: Shrikant Raskar <raskar.shree97@gmail.com>
---
 drivers/media/i2c/saa6588.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/saa6588.c b/drivers/media/i2c/saa6588.c
index fb09e4560d8a..71d34d229564 100644
--- a/drivers/media/i2c/saa6588.c
+++ b/drivers/media/i2c/saa6588.c
@@ -50,7 +50,7 @@ MODULE_LICENSE("GPL");
 
 #define UNSET       (-1U)
 #define PREFIX      "saa6588: "
-#define dprintk     if (debug) printk
+#define dprintk(fmt, args...)  do { if (debug) printk(fmt, ##args); } while (0)
 
 struct saa6588 {
 	struct v4l2_subdev sd;
-- 
2.43.0


