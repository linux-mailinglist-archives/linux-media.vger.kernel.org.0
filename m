Return-Path: <linux-media+bounces-21568-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B11679D20C0
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2024 08:27:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 63C621F253D4
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2024 07:27:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 549C5157E82;
	Tue, 19 Nov 2024 07:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mQT9ynyw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792F41EA90;
	Tue, 19 Nov 2024 07:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732001227; cv=none; b=VbLux0oFP2ac9+1UvEii7PdUoNUJ10OEI+Pb62MCBy/6Wo38EH2AhabwghZFTTVgFBCvaUz2FQRM9vXYqzHFobvfT5yaPvKGRvRrAk1uj/WwpJdOiuhjhyPDLUS+GlljI3rH0IHhySvGcDFQ+HzmMDt0QukUKZP0oVHBASVrfrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732001227; c=relaxed/simple;
	bh=87WqM/RToAWHBabVrXOKARdciBADfQ6jEzm+5XDygEk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jgR932HFCqWIAmbY34Pxu8yPc+3PDcv8XRgc/LmTXugNtIBpAr0Ap3EveWkpOJR3VvsLmD1g1kea1R/OgnaGl+72YNPnliy0aIZyJ1Pd/XlagUhb+76WNnLX/w/cuvLJNziTLWzzF/Z8q9Vs52eMOuepvlspnAHmp7NZI/LbwEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mQT9ynyw; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ea1c455d0eso2722281a91.2;
        Mon, 18 Nov 2024 23:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732001226; x=1732606026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xNSzNCYfMVVqwmNC/dkjD9KuK0iM34sxaAeB6M/XILU=;
        b=mQT9ynywlaoc7Uf0RBVbswM7Gz7Q/qonPwyBrzup+RFh3zF/+VbT0tBGfvNah4780R
         DCJLLJeJsEKf5TPeOXvp9skoH51eugcw8pC0QwaJg288y/dPNvrqAYPxk2xXGA1Q87Ze
         ATcm4BdduGz/7/q2iKcEGbaBLZtzCa20Nnp+oYdqa1zXuFde5ku41MLUgGnbDbJDSQ9X
         nI78lJGGWSbAq1Epo7T3/mSLjqqQ6HlqRMVZ3zH59Y1dMqFa3L1yL09YMydOeyueqHSj
         rpNAVbZgV+gsUS4goq3+R+74K+W5wQHafZJPWoIlR6h56yXiR39zEjpBOc6Hf1L0yGsL
         vwDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732001226; x=1732606026;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xNSzNCYfMVVqwmNC/dkjD9KuK0iM34sxaAeB6M/XILU=;
        b=Kf37/X3GtCNp4mdd+0gwg7OTLxQqZ7r8actRIkzdypE/bEG9W8NPiN7CCapcqS1alh
         aCI/7tNBmG8xw1oicRFI50iqYBZq840a7QoB4OIM7hBzEOs8RJKSkwv3JMVB0oijNwDh
         hSc0aNmPpz0C9sQPxb+k8mSs0UlVJbYaisFBt0MMxZbsqKmraKfijRd6fxctc/Og/ywV
         5gV1j7zmT7z1sMmMcxOvu4FrTDpz3ko+xADOWRFFFMKysKk6/fenWN6bSUC97u9mhRCW
         ePwWbv54z62Y6HiF++6rMOG/wkVfIjBw3TSQ4pHBlWXVZkNN0179VvvI21V4Uy3wSpmj
         ke1g==
X-Forwarded-Encrypted: i=1; AJvYcCWuYaDLGn7PyA5VhRWY9VjIw9QT5jytHLZqH9qEORNwA4bay5MQBak7JoxPwDW6wMdjmpEaG6j0ZJiBrHs=@vger.kernel.org, AJvYcCXgyXj0Pp5WsGqKghoFigReKzMfLbmDiHTzA/7Rrp2/ifFH6PWlLwvzDyHSNkI+djmlfnnT/cbm5EDlEs4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMsRtgdUGzasATXyaDZ0fjYvBh5juy61+SZz5J3BcOt9Rrn5DS
	oCGATpfMFEXCkyBpYJ2w0+MXS3rLSqEYGrvUhQfZH1tSQ7nBDoeQ
X-Google-Smtp-Source: AGHT+IEA/iTsZZHtlCuUDTuhDZRJe4+zgwhrGD2wA/t1BYs6ZH3429oBnqwQmKCFm9ZWFlUypW/zRw==
X-Received: by 2002:a17:90b:390e:b0:2ea:4578:46d8 with SMTP id 98e67ed59e1d1-2ea4578787dmr12919293a91.9.1732001225619;
        Mon, 18 Nov 2024 23:27:05 -0800 (PST)
Received: from HOME-PC ([223.185.133.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ea8f04c67fsm2423849a91.43.2024.11.18.23.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 23:27:05 -0800 (PST)
From: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
To: dafna@fastmail.com,
	laurent.pinchart@ideasonboard.com,
	linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	heiko@sntech.de,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
Subject: [PATCH v4 media-next] media: rkisp1: Fix unused value issue
Date: Tue, 19 Nov 2024 12:56:53 +0530
Message-Id: <20241119072653.72260-1-dheeraj.linuxdev@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit fixes an unused value issue detected by Coverity (CID
1519008). The error condition for the invalid MIPI CSI-2 is not
properly handled as the break statement would only exit the switch block
and not the entire loop. Fixed this by returning the error immediately
after the switch block.

'Fixes: 8d4f126fde89 ("media: rkisp1: Make the internal CSI-2 receiver
optional")'

Signed-off-by: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index dd114ab77800..9ad5026ab10a 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -228,6 +228,9 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
 			break;
 		}
 
+		if (ret)
+			break;
+
 		/* Parse the endpoint and validate the bus type. */
 		ret = v4l2_fwnode_endpoint_parse(ep, &vep);
 		if (ret) {
-- 
2.34.1


