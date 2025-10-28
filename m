Return-Path: <linux-media+bounces-45858-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD43C164BA
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 18:50:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7EEE5542293
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 17:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C135134C9B5;
	Tue, 28 Oct 2025 17:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ISIFDhl2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDF434DCF2
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 17:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761673555; cv=none; b=sWAua2ku4LZMXdhqiCndJ3m5kpdZGwZ//K6fA3/iOyVN7hSDMNt0pJf/xkL6ytoKUCwc21gccaPNG02blnxu3avDwDyUGUyENHI4iBfPj8YNUCs2QVpV3NzfUxTgXYj/3abQ5m5nesQaFJbESnxkCcQjtRm3qMzfnUkN59mUgzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761673555; c=relaxed/simple;
	bh=gkwlHXctBby/vONa7Ww6NBygBOS0ybOI0aemv/zS+AY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fnePFLEvmVRM7IKmYb01GlHroyiFDcaYHe0H4BYdyTdgkbgZOM+o+98lBMk4cX67mK4r56SrRCK/YPtmAc7AsUq2vwn/ixsek4r9Lr+UBCVqgS4gLU8T+sO6Ax/chTERUhDVW26wPz1e3QnXlmBU0ofY16ZaDBqQ1eLGr1J/nHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ISIFDhl2; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-57992ba129eso2536383e87.3
        for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 10:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1761673551; x=1762278351; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XHUzga/mAPCqvLPpKSKKbcPHE+v/6vbGaHZw4+lnY9M=;
        b=ISIFDhl2rJAXg2lS5y742NIKIv44QwRGWy2HZPlz4lfLNj5KhBZp+GlLnBTsz3xJ2I
         QkAxLjHPrEHLQA828jZF3ZKwOfH/WyNKVuOxgxQE0hyPSKp9oDZsWQsXtgmmcNi0AaP5
         4IX1v4dKrS9cKA0JvfV/h+ZQhBslZ4Rq6OQV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761673551; x=1762278351;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XHUzga/mAPCqvLPpKSKKbcPHE+v/6vbGaHZw4+lnY9M=;
        b=iX3JtvkyNClgb+ddDtTZi3sjVFtBss5WYMPIjFq+kP+HZeWHJTY5jsZf0528SWQvy6
         pg9fyvN+7mg9RxXBLLzoibki2PHa6kUuwM9ymiV6fg/LySo8sJCbFzngpjaSYFUQDKPy
         1B1jDWuGDJUsoTYKh0Vi9a+YWXu4GvZxJqIXP1RSiqA5XJv3UVBssfRgrKv+6GXu08Uo
         3iMUwgN4xbmNI4PNRymn9qIyEcSQXt2enhZmhtZINGoba98D0LfdeAOVkFIm4pHnz+Dy
         LsinjJfGahTFs10zbOaOSq8VNMAy9yy+S/68bPFt0gcfPbLJMtsdbZf4pWxeFFrrcoPO
         L2Fw==
X-Gm-Message-State: AOJu0YxcYmhfUQeTaid9uRdZp9jxCvPcAwl4WYmFIVvSlanMkAb2OyNN
	Fz+wKP8dx9NteCqFCHYwim0TA3lM5gH31y7NnZFAd+fcZHN1PW4pBktURmf3oDXBgg==
X-Gm-Gg: ASbGncugRYJntRsKkAwoc+iCh6KqWk5cGaCC/QxL8yx7lmu8N/8m02kdEL63KNIp6W6
	+NEcmwV9LYR1Chx09B3cForK0/KF2Kh8Z7ygez4ZNj0EYPcTjSvoGcxjO7b1bQkIglPGrzi+Jyg
	cHwvYECzTqx3aaLdkl1bUQeREExiL/Zy8qJHHUBlChgCi51WuZi4CSpD2tf1F/7AGxYoJg8QtI5
	/gvfhgWLY3v+X9Att8ONN71cGr5Eg93r/PrueLF/QngV4g2pCLTrTND94fjrNt7IVEt7ANr2zS2
	B1K6uHykRn1n5rGnk/QPchIr6hrVahTqo7iiVYYlAd6LfZzIlj0K5mlocczN1TZnPIpXKafWwqc
	CLbkJJsnyyVmyAzsSp+NbDCtARpwwjPuMj2uSRb8D+URWdmEk9UHwePZyVgcPrO7ZPBoI42MHNJ
	UcaOmXTfXsP7S0Azay8+ExqJ7EUXQpzC0BOTbBFMbvH23YKXBjeRxQupk=
X-Google-Smtp-Source: AGHT+IHULMgeVfud9vMFV5zbcJw3QyVQP//46uytXUYFgLdDKpRs/hL664KIzsHzrYhuxtoQRSiJeQ==
X-Received: by 2002:a05:6512:1152:b0:592:fbb6:889f with SMTP id 2adb3069b0e04-59412a3dbe5mr45810e87.20.1761673551401;
        Tue, 28 Oct 2025 10:45:51 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f558bbsm3216378e87.50.2025.10.28.10.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 10:45:50 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 28 Oct 2025 17:45:47 +0000
Subject: [PATCH v4l-utils] v4l2-compliance: Fix test for UVC USER controls
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-uvc-fix-v1-1-dfcc504ff8e2@chromium.org>
X-B4-Tracking: v=1; b=H4sIAEoBAWkC/x2MQQqAIBAAvxJ7biHFwPpKdAhba0EqtCQQ/97Sc
 YZhCiSKTAnGpkCkzInPQ0C1Dbh9OTZCXoVBd7pXnbb4ZIeeX1ysI2tIDdYbkPqKJPo/TZBNwOf
 mkGCu9QMm1328ZAAAAA==
X-Change-ID: 20251028-uvc-fix-a8ce84e198f4
To: Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

v4l2-compliance only supports priv_user_controls which id starts from
CID_PRIV_BASE and are contiguous; or compound controls. This is not
enough for UVC:

The UVC driver exposes two controls V4L2_CID_UVC_REGION_OF_INTEREST_RECT
and V4L2_CID_UVC_REGION_OF_INTEREST_AUTO and reserve space for 62 more.

Make v4l2-compliance aware of them.

With this patch the following v4l2-compliance is fixed:

fail: v4l2-test-controls.cpp(326): expected 1 private controls, got 0
  test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: FAIL

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 utils/v4l2-compliance/v4l2-test-controls.cpp | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/utils/v4l2-compliance/v4l2-test-controls.cpp b/utils/v4l2-compliance/v4l2-test-controls.cpp
index e4925ca3977b5b87a6a8e9ad5794847fa7009e50..6f645c4f9aca94a4ef586b11d6fd11268f1bf195 100644
--- a/utils/v4l2-compliance/v4l2-test-controls.cpp
+++ b/utils/v4l2-compliance/v4l2-test-controls.cpp
@@ -316,6 +316,22 @@ int testQueryExtControls(struct node *node)
 		priv_user_controls++;
 	}
 
+	for (id = V4L2_CID_USER_UVC_BASE; id < V4L2_CID_USER_UVC_BASE + 64; id++) {
+		memset(&qctrl, 0xff, sizeof(qctrl));
+		qctrl.id = id;
+		ret = doioctl(node, VIDIOC_QUERY_EXT_CTRL, &qctrl);
+		if (ret && ret != EINVAL)
+			return fail("invalid query_ext_ctrl return code (%d)\n", ret);
+		if (ret)
+			continue;
+		if (qctrl.id != id)
+			return fail("qctrl.id (%08x) != id (%08x)\n", qctrl.id, id);
+		if (checkQCtrl(node, qctrl))
+			return fail("invalid control %08x\n", qctrl.id);
+		if (qctrl.type < V4L2_CTRL_COMPOUND_TYPES)
+			priv_user_controls++;
+	}
+
 	if (priv_user_controls + user_controls && node->controls.empty())
 		return fail("does not support V4L2_CTRL_FLAG_NEXT_CTRL\n");
 	if (user_controls != user_controls_check)

---
base-commit: 796dc550a682e8f65fe6457cd5fec5ee123f39aa
change-id: 20251028-uvc-fix-a8ce84e198f4

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


