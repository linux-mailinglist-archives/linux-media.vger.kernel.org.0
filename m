Return-Path: <linux-media+bounces-13471-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7863D90B70D
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 18:52:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3EB4284B08
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 16:52:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20E0B1662F7;
	Mon, 17 Jun 2024 16:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastree3d.com header.i=@fastree3d.com header.b="JQGXBoT5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D861D9526
	for <linux-media@vger.kernel.org>; Mon, 17 Jun 2024 16:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718643125; cv=none; b=SaK1ZWAYPnJVIzKMX7hC+3TyDOfMxS5doWXxgPBmRvdGsi8Y7pEEBhTWH12PBI75Qbrv3FiRhnvRdqGt0i2dp4EKG+HmhUXjWXJKih3AEqFMeg72AfDP80abwyDsD+P73b43NIUR0hktL1NczgTASmG8NXYsvUAk3JmYByUhJCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718643125; c=relaxed/simple;
	bh=BGc6LgeUZi8IAXY+QwxYTgol0vC1bqv/71LkGwhoYN4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Kv4/7nVVkTXtoqVbBnCLWsSfkfGVYAtvcPLqfWzfOUkyod+iryT6O0tOdizKk+6KBcwm+54hZDxZ+x8BMbFYI9uLD4kMJ1LSyOSYCeQbTcdc5mR8KCPl3g6wk+kZUWlYrVcEXPzAZEyeTOfuDPWE0lXZHETrUFgwa20+AMrffEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastree3d.com; spf=pass smtp.mailfrom=fastree3d.com; dkim=pass (2048-bit key) header.d=fastree3d.com header.i=@fastree3d.com header.b=JQGXBoT5; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastree3d.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastree3d.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42121d27861so35901305e9.0
        for <linux-media@vger.kernel.org>; Mon, 17 Jun 2024 09:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastree3d.com; s=google; t=1718643122; x=1719247922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w6wOEKIjVAp9FHpjTnKAaa9Qg4U3uYlDpDQmjJL6hDQ=;
        b=JQGXBoT5BukrEo2b7Jnmyt0WeTJpW6QFNrBlws1KAgPCNjSPa/ERgLxyeiBmXRWw4B
         uDs0zA3DJ+EXuNJNNETGQgtwOczPkNyuunPj8R2Wiorod9OI6LiRnWHiwG5zPYxUE+JR
         SeqJhR6DIWHJSrURO2phzouP+MpyMQeqcNobvIWLPeHmzetc0CH7F40b1Y+iXgMjPsCC
         h+xU+CRfbJSRjlsA5RsnbrK5GW7MoRmWUhP0WIuxKR1S7wGWqfUG272nSOku4RSPpmq2
         4JB+eHjtKvY8P8n1Vju7uD1mHSBHxOAwJZP1eTuZP6Dqsv2gngo+QCEx9pxRB6QaScJX
         pErQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718643122; x=1719247922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w6wOEKIjVAp9FHpjTnKAaa9Qg4U3uYlDpDQmjJL6hDQ=;
        b=DZsxQnCsmw+r0R7YMceiud9SEbbdc6kDJPTinLYRbcLYdtadLM/w+udjDupmTGLhGH
         1CIaVlALRp1021vtc9J1olZwxyZePDf88L3Mx9Hc9Mwf4Cg9hOeeuE8AkQRm6B5Pd2tJ
         oxm3vQFjHIENKC7BN8YxyKLQN/1co+y3Xg/t6ZphDD65MmxWIsuPVcwB6YVY/A8poqBR
         fDAQQxUBFBHUdDNTlpuPrMGzOm7SRfPxSVCG4yTlCjV7ZZPUez1HL3Vw0O2gxJzAhecV
         t7gmLOLcNfsg5UglzvJkleKT9mwnsLKVabLEc7qYIA+Yp9PJhczA+JlPRbO5L2B75h4b
         unMw==
X-Gm-Message-State: AOJu0YybH2L023pY2JIjCG+oMiZ+B+bplAQbZ1xAghxTVvPH5pH0jLfW
	sbTW2Qi7ci+1Nb0pzMnfjXts3lO88K7Z+aE6dM876ZujZ42adYPpK0szECY7IQAp3cxWpmwXb/U
	=
X-Google-Smtp-Source: AGHT+IGyFlNPrJD6kQSlEcyKScg4FS1joIacZIRYlSd8In62DtSTxX7NocGCg9lgNF6y3xptDVZ1aw==
X-Received: by 2002:a05:600c:4fd6:b0:421:7e88:821 with SMTP id 5b1f17b1804b1-42304844de5mr102167615e9.32.1718643121361;
        Mon, 17 Jun 2024 09:52:01 -0700 (PDT)
Received: from localhost.localdomain (229-206-127-185.static.world-connect.ch. [185.127.206.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4229207d1a7sm119790145e9.1.2024.06.17.09.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 09:52:00 -0700 (PDT)
From: Adrian Fiergolski <adrian.fiergolski@fastree3d.com>
X-Google-Original-From: Adrian Fiergolski <Adrian.Fiergolski@fastree3d.com>
To: linux-media@vger.kernel.org
Cc: Adrian Fiergolski <Adrian.Fiergolski@fastree3d.com>
Subject: [PATCH] media-ctl: libv4l2subdev: Add Y16 format
Date: Mon, 17 Jun 2024 18:51:50 +0200
Message-Id: <20240617165150.502266-1-Adrian.Fiergolski@fastree3d.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Adrian Fiergolski <Adrian.Fiergolski@fastree3d.com>
---
 utils/media-ctl/libv4l2subdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/utils/media-ctl/libv4l2subdev.c b/utils/media-ctl/libv4l2subdev.c
index c614f4a2..cb86a932 100644
--- a/utils/media-ctl/libv4l2subdev.c
+++ b/utils/media-ctl/libv4l2subdev.c
@@ -1146,6 +1146,7 @@ static const struct {
 	{ "Y8", MEDIA_BUS_FMT_Y8_1X8 },
 	{ "Y10", MEDIA_BUS_FMT_Y10_1X10 },
 	{ "Y12", MEDIA_BUS_FMT_Y12_1X12 },
+	{ "Y16", MEDIA_BUS_FMT_Y16_1X16 },
 	{ "YUYV", MEDIA_BUS_FMT_YUYV8_1X16 },
 	{ "YUYV1_5X8", MEDIA_BUS_FMT_YUYV8_1_5X8 },
 	{ "YUYV2X8", MEDIA_BUS_FMT_YUYV8_2X8 },
-- 
2.34.1


