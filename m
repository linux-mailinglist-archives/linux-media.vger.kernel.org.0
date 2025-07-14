Return-Path: <linux-media+bounces-37622-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 40909B04025
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 15:37:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E253B172F63
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 13:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0313024DD0A;
	Mon, 14 Jul 2025 13:33:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0682F22;
	Mon, 14 Jul 2025 13:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752500002; cv=none; b=M4vZLNPUCY1p6VwxwbXabH/2i5ctLwFxloZPaKXw9fktvogqzWuNK9rDU1BUQElWqKM2zZwJ4I5AlXchewIOhzsMGhM78zjFzoiY8kFWOfgRxJZ2CTXR11ZNKwthwSCCq369dy978b4T054K5GZ1Z4Al4I5P+Zv+uCuwQRTyNHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752500002; c=relaxed/simple;
	bh=syaNzE2k+TfdB4nZ7gRKkacAe0BHDNNRDfRCSOQeNDM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=A7raoqneAda8PPfSo+NZoB36Neskrus6RErvVNaUTrCCiZtVMmbgG5QLCnHBmt8IF6wGLxQhjF/Twyb2eT43Ww/4y7QEibRoxDF7KE0h+yHJ8klXY6m4RAwM32GRi2yJlyKenZf4Y7C3wVFAxZm4+UQ25iNg8HwFK7SyFSCX8Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kzalloc.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kzalloc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-711751e2d9fso3023687b3.0;
        Mon, 14 Jul 2025 06:33:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752499999; x=1753104799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KU07zJlErne5IHOWTf+eZ1lD+FhkeNOKbb2XYlEZz/w=;
        b=ofcGrRi3Z8A2zkEn3K08Dn+4yZPRx/GhvecQRKgOK6g3R3uT8hOnhUfszH3nCrCxv2
         kvI8plV911aIDa8288TADtkP6wU2+5KtiFbV5xbWj/sznqJPCjjhYFV2EfYh0HAmzFbH
         JCErCl4ypgPa86+JbaO7s2LRUUX+ssYkYHiwc8KrHN0rIErB03PHGvFdxonjQ88BF7Ve
         8OQ4X8bYYMn8AlWdWf6p8LhGqIsDOUEVz3YTtxSHVjJi8218vKgHsx8F9JX62HWe/N4R
         FUbHTnBONtEJy1rQj8sal6IeijmRe3RZjx83FM9FohIu4/f4nvJQVBoR3iVrKDF5+5Mq
         Uoow==
X-Forwarded-Encrypted: i=1; AJvYcCWXTa6D+LCmoLsP70pRSGdkMjyPXpZe3QGp+9q35sX8PHqsDLvZqPcx/UKD2DGsSTInj42mkOyTa9VXpFc=@vger.kernel.org, AJvYcCX9TxYRTR7jvjtyS+QC5C/wBXs4Uu5ZanqktkKYEHV7GBVo7il7+Tii1qLuf8g3fsiHuwoBSFQ1rD8bwHI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiYKMMfj5JPfc0ghKDDTEYS04/yZEw6GEGjBZRKMRnYY0VST/w
	870YIQOdwllpMKh1QFeWv+KzyJC/tbs4LsLwjnP4AMcOPOrQaWv4kqox
X-Gm-Gg: ASbGncsKQlDwO2SN3UW1T1tdCR+WScnShRDq4QW+ChpYBVs6hmCRq5WBCeRtEWGkGNB
	yd9Gb75g04M970aaiWzgK9mPUpRkl4K0bQYdzYpdnf5cEULpsZ6MunAv6/MJTfeXJ67nDMxyerk
	ZNK0vLIlO6aXlyGYYI8ZxvU9rrPOMXOQZLfWtpG3DvpWUqAioj3MZasuP2cQRo7+VY84BNP+/Z7
	BU5Ij2G12aYvPw85C5HW0RMIEzrRWAjXidjH/Csj+7fnPWHwcUGwl6gsrOdw4sull+iOAMGOWqG
	dlkWsV0ESVw7FIeKxvypaeOJXnBhGSlazmjBTtbwy2KGbixa9rlwct1GOpqO440kzRgoO1NifX6
	jwh7sMvhxFvziTt4+VJGrzHpZf7WFLTer
X-Google-Smtp-Source: AGHT+IG23Nw3mmpVgL1TES4A9um44rpcXVNTNOQ0aY++9Ni/xRYuKk5oJo9hBrVq4DmmiovM+DoIRg==
X-Received: by 2002:a05:690c:4906:b0:716:585e:46a8 with SMTP id 00721157ae682-717d8e9fa83mr80250387b3.1.1752499998820;
        Mon, 14 Jul 2025 06:33:18 -0700 (PDT)
Received: from ysk.ysk ([89.234.162.240])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-718056e564bsm5712677b3.19.2025.07.14.06.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 06:33:18 -0700 (PDT)
From: Yunseong Kim <ysk@kzalloc.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Matthew Majewski <mattwmajewski@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Helen Koike <helen.fornazier@gmail.com>,
	42.4.sejin@gmail.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yunseong Kim <ysk@kzalloc.com>
Subject: [PATCH] media: vim2m: remove unused CLIP macro
Date: Mon, 14 Jul 2025 22:33:11 +0900
Message-Id: <20250714133311.95698-1-ysk@kzalloc.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CLIP macro, which was used to clamp color component values to the
[0, 255] range, is no longer used anywhere in the vim2m driver. Remove it
to clean up the code and avoid confusion.

The following issues were reported by checkpatch:
ERROR: Macros with complex values should be enclosed in parentheses

Signed-off-by: Yunseong Kim <ysk@kzalloc.com>
---
 drivers/media/test-drivers/vim2m.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/test-drivers/vim2m.c b/drivers/media/test-drivers/vim2m.c
index 1d1a9e768505..97cab9c558e7 100644
--- a/drivers/media/test-drivers/vim2m.c
+++ b/drivers/media/test-drivers/vim2m.c
@@ -268,9 +268,6 @@ static const char *type_name(enum v4l2_buf_type type)
 	}
 }
 
-#define CLIP(__color) \
-	(u8)(((__color) > 0xff) ? 0xff : (((__color) < 0) ? 0 : (__color)))
-
 static void copy_line(struct vim2m_q_data *q_data_out,
 		      u8 *src, u8 *dst, bool reverse)
 {
-- 
2.39.5


