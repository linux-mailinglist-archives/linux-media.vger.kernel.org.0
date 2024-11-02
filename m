Return-Path: <linux-media+bounces-20714-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 761609B9DD4
	for <lists+linux-media@lfdr.de>; Sat,  2 Nov 2024 09:03:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90724282DA4
	for <lists+linux-media@lfdr.de>; Sat,  2 Nov 2024 08:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A5AB156228;
	Sat,  2 Nov 2024 08:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="E+7LDat+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BB02B9A4
	for <linux-media@vger.kernel.org>; Sat,  2 Nov 2024 08:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730534623; cv=none; b=ANyB8UeKGaVZvVVfX/uG/V5nAFh6L3Lg/GNdwHU83MQEMTAl4vYfsq7mvrbbHp1tookxmZadI3g1VZz/lVJdxj0L8hHOQ/xkbXK2nROv1jNgC/6vbWR91m9Fj5uct+qofFYtSzpOqtdlzqw5czDgL/kJimvFCtxy4hCz0HIUui0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730534623; c=relaxed/simple;
	bh=DpQb3bVsQXLg3llCZLUBQWAzCQ2JQBwz4rkG076GzGA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=P7TV9uBBncHF98MZw7e6Cqo+Zc9uKjGDX3RzqzaoJfn+TGBaJdKCSX5ol0SbDW7bbMzeKx7Uej74LnxUhP86O8T5zI+4JxUUO/Zd7DbX5tKZoRP7xJp2fpXwrXZEzYt9vrtQzZ9sIjaBW680Gtc/RzXCYsHhoslacwKMRlVgL7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=E+7LDat+; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-72041ff06a0so2343547b3a.2
        for <linux-media@vger.kernel.org>; Sat, 02 Nov 2024 01:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1730534621; x=1731139421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h8f4dWec77U0oSAZ6eSzsVZbgWnhbkE3ElWrbp4Lhl8=;
        b=E+7LDat+gUc5I7R8KxHYEWA87asWclNE4votgwz+O840LGYVCDFWrRmQh1441BXeMz
         d3UgFzdbV5zRYHNIgRhWCQmthx/N8kyLGW/2RAn9a77PcNiwwjE5BlMGXUhp1KCeszwK
         MGr7QB21FR9RzncQSbOwq2W9r3BfMClpLUSe0i5KORYBioWviQyOyqW27TfimMBc6v2Q
         K/E5TWIOlYJcM2UX5YIKVr9FBKaS6Wfv5+nh/oqxEnQX3UaFtiJQwD9xwmFZZNPcJcXd
         8NZO3sF4+1nRO+UL1BvScGTk+3+kMkMSS0g7t28fvSDBeeEjwn9SIsszpj1LbKV3LB7S
         rTVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730534621; x=1731139421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h8f4dWec77U0oSAZ6eSzsVZbgWnhbkE3ElWrbp4Lhl8=;
        b=DWlavwQVJlVKnSNIZAsBTMcaa3WCUbq0fjgG9ZJ9HM6ltTmrBEC+Z1OjNXiAWeFlP4
         rilBHILoJNFv1wZKb8n/BEZtMRxYsjXC5DvSW9tTG0TVE4L6fFi1vHImegiaaZkChM4h
         +GV92OcP+ANAKrK+1W83Cmobz3z/wSe9moZdByU9ePVjiEzveVmzBhTTwwigCwMV/OBm
         IvU4FFBJy/Zlz3G3UMoDAgJKgt9jqdEIKfH9fcJ1mEDf3ABbQh8NBmSt+VZHyA7fEqne
         xY/061frKdqOROuzLWoqyIEODm7Rm/RqeXXsyeczxvmsRIYBZ+IeALD8l7fqAXKu7BMn
         hLvA==
X-Gm-Message-State: AOJu0YxIn1/kBemU92etuMP77vQy6i0wnFXMzM972tgr5ahvjaGa8iJy
	YnsVGw8tWgXEt9neQ32rHyjquZTvUvU+KABMpyVEYzykKhV1pTtlyyLcYoebaFs1SanGKNpsLwD
	CI1w=
X-Google-Smtp-Source: AGHT+IF3H7cZ+HJeD4ziQiiBOLpjlYgccAMsJGr1Z3V0OvddcCn5wSC2MXrIesJ+VZMbFq+fQHF8Ww==
X-Received: by 2002:a17:90b:53c5:b0:2e2:9077:a3b4 with SMTP id 98e67ed59e1d1-2e94c29d0f2mr8712323a91.7.1730534620753;
        Sat, 02 Nov 2024 01:03:40 -0700 (PDT)
Received: from localhost.localdomain (133-32-133-31.east.xps.vectant.ne.jp. [133.32.133.31])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e92c54e6a3sm4415306a91.1.2024.11.02.01.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2024 01:03:40 -0700 (PDT)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	michal.simek@amd.com,
	hans.verkuil@cisco.com,
	hyun.kwon@xilinx.com
Cc: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH] media: platform: xilinx: Balance refcount to prevent memory leak
Date: Sat,  2 Nov 2024 17:03:27 +0900
Message-Id: <20241102080327.463134-1-joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In xtpg_parse_of(), the refcount of the device node "ports" is not
decremented after loop. This commit makes sure that of_node_put() is
called on the device node when leaving the function.

Fixes: a5562f65b137 ("[media] v4l: xilinx: Add Test Pattern Generator driver")
Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
 drivers/media/platform/xilinx/xilinx-tpg.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/xilinx/xilinx-tpg.c b/drivers/media/platform/xilinx/xilinx-tpg.c
index e05e528ffc6f..bb3ca16dd47b 100644
--- a/drivers/media/platform/xilinx/xilinx-tpg.c
+++ b/drivers/media/platform/xilinx/xilinx-tpg.c
@@ -718,7 +718,7 @@ static int xtpg_parse_of(struct xtpg_device *xtpg)
 
 	ports = of_get_child_by_name(node, "ports");
 	if (ports == NULL)
-		ports = node;
+		ports = of_node_get(node);
 
 	for_each_child_of_node(ports, port) {
 		const struct xvip_video_format *format;
@@ -731,6 +731,7 @@ static int xtpg_parse_of(struct xtpg_device *xtpg)
 		if (IS_ERR(format)) {
 			dev_err(dev, "invalid format in DT");
 			of_node_put(port);
+			of_node_put(ports);
 			return PTR_ERR(format);
 		}
 
@@ -740,6 +741,7 @@ static int xtpg_parse_of(struct xtpg_device *xtpg)
 		} else if (xtpg->vip_format != format) {
 			dev_err(dev, "in/out format mismatch in DT");
 			of_node_put(port);
+			of_node_put(ports);
 			return -EINVAL;
 		}
 
@@ -753,6 +755,7 @@ static int xtpg_parse_of(struct xtpg_device *xtpg)
 		/* Count the number of ports. */
 		nports++;
 	}
+	of_node_put(ports);
 
 	if (nports != 1 && nports != 2) {
 		dev_err(dev, "invalid number of ports %u\n", nports);
-- 
2.34.1


