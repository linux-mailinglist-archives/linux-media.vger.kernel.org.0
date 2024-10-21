Return-Path: <linux-media+bounces-19979-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C499A5E80
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 10:22:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B93511F21129
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 08:22:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18D041E1C2D;
	Mon, 21 Oct 2024 08:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IhvDZ62S"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8611A1E1044;
	Mon, 21 Oct 2024 08:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729498932; cv=none; b=aUaO7FKw5eCLv2mX6C97/tKeQqetVZ4rzaIscxjnbBK7hsMuCTgjt1r26kEzwH1irxX5uz7DnTbH7nRVu2WPIoEdMNOJnK2rQx8fUiM5FhqAxJvo8XslYGX4YJo6uuKO73+Hx7sudk2TeFOfQbskfgE+JqgrbS/qEnigvRoPjhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729498932; c=relaxed/simple;
	bh=CUtRWOGgFMrEPS9Uxgwd36aHoGenAAkzEO1oWqdGUv0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=dU7PsI783oYcWxFCUyjrRDQnZB51NGEwUcRgtYWhdABUChDKAAz1T2X2fjHOKNOr3blRbNTctZkfQ4BrNYCwVbqXIjHW3LAhVXtcX883S26TeyJ3zMPDBL+Bf5+yCjxLNeOZe7yPkahZFpW8GkWhH8PS7Ln/Y2esHyOZw86hcUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IhvDZ62S; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43155afca99so29321335e9.1;
        Mon, 21 Oct 2024 01:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729498929; x=1730103729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VtMfxLCDqNvKMrpaQRtboDIsl9z0E7BP3ybOVuKjw5Q=;
        b=IhvDZ62Sg7G97lwj0cXqgOu8NaFSHmfWiv13P42+mbZLUVA7xLW1+k7fetou5yTvFl
         ulzBrVOi5qOc+Iqfw7G52TCY/SpOEzTOVdmxxQvtRiV3JR7ZoZovPtw7ZkQ2q/znw1uw
         tKkeIPHKNPioWf3H4AF2yUt7QVKSmqD2XLH5pW89Aos4toS1vUycQjonUPzp/CuHlPS/
         R6vL8//5IL46luL81WuLaKsit+adxYektOA/DtmChvWG1OHYc1hyqJUE5mOopHkblqyv
         CSHja68DmMvrMx6e7/BCTzQFbB5XM4MY6xGZBX/4saLsEKIlhOgvmFwUQozcWEfULdsS
         OQ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729498929; x=1730103729;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VtMfxLCDqNvKMrpaQRtboDIsl9z0E7BP3ybOVuKjw5Q=;
        b=buENROBmhHbxJf+u1CuoTScXvRjKS9Yx/+Rr3W+WuMCsXgYcg9B6lPJzDdbDRxwA5j
         WujKeIZ3Gv7tamtFutOQbs8D2xGp0hhKfFcMFmhF2aB4opgG86c/YaLmOJX4EI569NEv
         x/gzZcz6hPB8ExNJnA5pfqWLhS+L/NK5izG6MKBuCh1IrqNCMM2cBXvpLygxDB75/ngV
         ZodsK2o40k38iuxCwIOJ3Yhg+K0vffJbatY99oLUn3ccctruIohShcrDdTgLLbDTIbq8
         dDcpqxRDyp9jQNMCnHCN+x3cwT+Wr7ey0zVl8VDowevXWcij15FDwvbdIxrns5IZZO2w
         1NWg==
X-Forwarded-Encrypted: i=1; AJvYcCUp+LVfN2lv1GHjyA6Avj6kbEG1Ls18g1FkOfhCXe7x6XlE1m10yEcCLmpDIX/TuTpk2xqyeOyCiXA1M3c=@vger.kernel.org, AJvYcCWUreX/jNpCY4hcEXai9nw3bRHqrqGlvBdfv1JUZk348GzAchr8OkBKEb34+fidczdyHPv7ia3hneUng+E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuxfRygwABsCK8PbOl1NSikNll1EH0vh6wzcAyaY7zFIBrz/pu
	R7X5uF4B4XrSvNRgSJoaxzo0uN+ACtmobM3rsML+QzOs9slZRNEk
X-Google-Smtp-Source: AGHT+IHE/VYwX8+/wpf/5jQDvTLEjKjfs3z8SFwRadisGBNDZQKHDnMnOsyWI8kd0wbfQsvFT3M1DA==
X-Received: by 2002:a05:600c:34d3:b0:431:55af:a220 with SMTP id 5b1f17b1804b1-4316168501fmr58654615e9.12.1729498928506;
        Mon, 21 Oct 2024 01:22:08 -0700 (PDT)
Received: from localhost ([194.120.133.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f58ae0asm48665365e9.23.2024.10.21.01.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 01:22:08 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] media: raspberrypi: rp1-cfe: Fix spelling mistake "Orphanded" -> "Orphaned"
Date: Mon, 21 Oct 2024 09:22:07 +0100
Message-Id: <20241021082207.733506-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a WARN message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/media/platform/raspberrypi/rp1-cfe/cfe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
index 045910de6c57..da9e1a1e4d0d 100644
--- a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
+++ b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
@@ -641,7 +641,7 @@ static void cfe_sof_isr(struct cfe_node *node)
 	 * Unfortunately, there is not enough hardware state to tell if this
 	 * may have occurred.
 	 */
-	if (WARN(node->cur_frm, "%s: [%s] Orphanded frame at seq %u\n",
+	if (WARN(node->cur_frm, "%s: [%s] Orphaned frame at seq %u\n",
 		 __func__, node_desc[node->id].name, node->fs_count))
 		cfe_process_buffer_complete(node, VB2_BUF_STATE_ERROR);
 
-- 
2.39.5


