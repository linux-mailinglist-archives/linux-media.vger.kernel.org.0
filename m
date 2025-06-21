Return-Path: <linux-media+bounces-35532-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A749AE2A04
	for <lists+linux-media@lfdr.de>; Sat, 21 Jun 2025 17:52:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA89716C923
	for <lists+linux-media@lfdr.de>; Sat, 21 Jun 2025 15:52:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ECEE221299;
	Sat, 21 Jun 2025 15:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bXxqCRHn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490A11531C1;
	Sat, 21 Jun 2025 15:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750521144; cv=none; b=kmnOglT5XC/DGwF46cLZdL3JSQfBNQZx71UopaxO8noWnnAbQh2ktXVTLbEUUW0blaqKZcZvKBuZnWAKPzGevs9mtl5ix/M7PtmDa4MNsEHYOdDFdB+zrqZk210eQ2aHmhYrBFSRytoO9ckzZCFt1ilI3cSH85JqCkM1PuE7D3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750521144; c=relaxed/simple;
	bh=WydwX0JZAmT9huK4qTTIQ0UjKIOEmjIxw5ox0gKnLcA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=INQmTSAjUjMkY5qkQhBmOYFP6eGlPN7cjeCZCRwC6bhgHaaUthTyh+EWjdq34zAnEdQzgksS160iGRiWuJNYfiId4Ej8IIXbHHg/YAZ7YxOOSjrT4abPB3LiDmS3MwYO6S52bE7PdNGV6jWS/Yex07RpFwbFykYdccwyp32qKA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bXxqCRHn; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-7115e32802bso23592047b3.1;
        Sat, 21 Jun 2025 08:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750521142; x=1751125942; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZQ8CkrcNNsUVoneJHIbJkRnJ1Ln8Tw2HezGEVAsNGNQ=;
        b=bXxqCRHnz5D8d482DWMLgAGs0FWBqcXLHIFhW6Jw9G9gb5Y527w8ljNjyCSIABCsJ3
         2UAMdn5S9D5gUweq0EDNDupUwlzQWfBZRSbZkEllZFsL0EBsfLMocKgdEABCs8QCzUTj
         7KfG1m5R2lC7faHgcXHCRh2/y7SiHUXBms9rkBJoxmOY9FXPMSgc3DN1eug3nIWmi619
         kv8s9WNKjorDYkNmbYH+EKDxdSNAEhaEsMM0QW232pKpEj6vIEucUCvCM1lwkHfBkWwJ
         UIHgK4ELTayYmFsSJ6Q8z2twBIDdut1etgG6imJzVcZZhZ8/2wRYrVtpm48944myRiCh
         eYRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750521142; x=1751125942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZQ8CkrcNNsUVoneJHIbJkRnJ1Ln8Tw2HezGEVAsNGNQ=;
        b=UkFY+XmApeqytlwYPDtKw8FegmIGE8qqsWyDGdRxXgt6cJpljsA2VO/T2ANTJfSaAL
         ew1oYCb83lQ/I/DJFuGah0ajxI7g7/h7SU6KRekq6L4/CmMXlvidfeVeD+lSPS04ZcY7
         HSlNfVv0jd57L9qVrOr23bBCazD22HXG7PYRLgYILjBrqUIJtK/ByOdiIOkAvR4A/cdZ
         mF0f5/l7+kSDegXvFi7F2NoEanb3lP5AAbWFfZOj5CnIsmHBGJDveCXm6jkGlgVGnsx1
         Nh29SPCLvNLOdkji7XALWMLmFFovA1RP991REkM7GqIj2B4xDb1JBxJcpI9Bjj3t73Lq
         JELQ==
X-Forwarded-Encrypted: i=1; AJvYcCUA6YX6N2jiU1ZUKVf2empO4X1P+bMSfdL+hqznWdzJbbbce9waRjq+n9qUoNa4qcMoc9X3VizIfHrPnlc=@vger.kernel.org, AJvYcCVPaSLiYOPsKHx+VzFGJc/jq0dCgY4gqFuy0atQ6CGorM8A9/BRUKQIhRv2U7/UBuxkpJQiYTeFduOS4lE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw61A6dog+ahhhiYHlafP8D/E3W4xihOw+HQnay4IrjoV96Seh8
	4/Vc4g9uRM/KyLiRI1lLfRAXkx2zHyidMH6h9h3pDqtXTk7ooFLpdSlt
X-Gm-Gg: ASbGncsORAkhgQLHY0SFB+GUSJp/40AGdAXPS4tQYNhjNmGfRC/1y86YLtvsV6eNXQG
	vimQ6u1zk5PLU/hVD0x6ytWt/9vRPzqMthQVIGzn5IaQE+hRhJAqRbPE1RD7OXzUpRlsFeTSJkR
	C6kIBmJM21qOnY/d657OjkbJgjh9mX8WSW3HLI2ZoAMudE98kASvZtcOAB4QPqdGssjJkZj3mhf
	4lpC/SO1DA0yj/3OWEYC8NfeN4pzsUmseIJuuE5a+CRg88Ib0ion+lsZTr+y1GvSZbTLoG/3ikU
	vMFfYAHlh8FSaJf8aY2UYV6YDxlgqY9OPycn20JQN59XxFpEbDmMWdLWFxzAfYAuA8hdCk7e8Qp
	f
X-Google-Smtp-Source: AGHT+IFEcgCwCLooPL3ro7gv9kjZTIaHBSc31uLgFVLo8IYKmnXV8AAe4vvupw43aJ1SDz+GwLTgKw==
X-Received: by 2002:a05:690c:6d0b:b0:712:d70b:45d5 with SMTP id 00721157ae682-712d70b47e1mr36652427b3.33.1750521142268;
        Sat, 21 Jun 2025 08:52:22 -0700 (PDT)
Received: from trojai4.cs.purdue.edu ([128.210.0.165])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-712c4a21f9esm8598817b3.40.2025.06.21.08.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 08:52:22 -0700 (PDT)
From: Alex Guo <alexguo1023@gmail.com>
To: mchehab@kernel.org
Cc: alexguo1023@gmail.com,
	hverkuil@xs4all.nl,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: dvb-usb-v2: ce6230: fix null-ptr-deref in ce6230_i2c_master_xfer
Date: Sat, 21 Jun 2025 11:52:19 -0400
Message-Id: <20250621155219.517909-1-alexguo1023@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

msg is controlled by user. If accessing msg.buf without sanity
check, null pointer deref would happen. Although there are some
existing checks on msg.len, they do not cover all buffer access
points. Therefore, we add an additional check on msg.len to
prevent potential crashes.

Similar commit: commit 0ed554fd769a ("media: dvb-usb: az6027:
fix null-ptr-deref in az6027_i2c_xfer()")

Signed-off-by: Alex Guo <alexguo1023@gmail.com>
---
 drivers/media/usb/dvb-usb-v2/ce6230.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb-v2/ce6230.c b/drivers/media/usb/dvb-usb-v2/ce6230.c
index 7ebaf3ee4491..6490003f5a85 100644
--- a/drivers/media/usb/dvb-usb-v2/ce6230.c
+++ b/drivers/media/usb/dvb-usb-v2/ce6230.c
@@ -101,7 +101,7 @@ static int ce6230_i2c_master_xfer(struct i2c_adapter *adap,
 		if (num > i + 1 && (msg[i+1].flags & I2C_M_RD)) {
 			if (msg[i].addr ==
 				ce6230_zl10353_config.demod_address) {
-				if (msg[i].len < 1) {
+				if (msg[i].len < 1 || msg[i+1].len < 1) {
 					i = -EOPNOTSUPP;
 					break;
 				}
-- 
2.34.1


