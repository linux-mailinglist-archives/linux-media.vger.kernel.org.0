Return-Path: <linux-media+bounces-21505-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D133E9D0BEC
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 10:38:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E8811F21FE1
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 09:38:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7838B194091;
	Mon, 18 Nov 2024 09:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IlMpVefa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F3E19308C;
	Mon, 18 Nov 2024 09:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731922651; cv=none; b=o9xZZbNvZd3/wimC1g76YeQO+FhpwbT8C99AHQJo+/xaGSj6vTcweHhk418gvfv33AMH8S70wYR8NTp+XRhT84ujCPoopWzSK16hr0jMplB2kljbnCCJ6pWWgoY0z0/vZM/jFXqR5Tgc6e8mnmRFzn4siymVrS0gq7URPMy3RK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731922651; c=relaxed/simple;
	bh=OM7DQBUjAWe6PBNM50Gz0yNLuREAxgsFpfEeVs5Bjqc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bey6Zn87QiOT/tHEa0N3m59nCLhCWvPPwt1WoTjzQio/AIPrKyXXJQZIu4Wv5/rQf/7dzsu5uAEuHqf4DIc+bEPTwiwcCcZoiH4waA50ATFCCvsxVtpbKjwnLUOMJETpuwyT4aSKUteG1EzJbFJ8lgbszk9cbAq9cb7hJI1hsD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IlMpVefa; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-72410cc7be9so2991449b3a.0;
        Mon, 18 Nov 2024 01:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731922650; x=1732527450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QW2IfhgsXhjkhuWBMY7B99CaNdpS5A7CGa3sZv7P9ac=;
        b=IlMpVefahi7nnUDt6ivnbqQHGbcgEOY4LnRmKG20Apkg2Pfd5fYuM4CC7ooZcTE3Ve
         Hqia9FT3JNIIOwYlsJ4OQHqZWh+NT40iH1DKWdJq8x9prWbNkwRBQWkP2gmdA+vadsnw
         rXzZ33/giE958hoU1dA7p5XVBhWUUYjV4z/BEnjlfD7Fv0vC/l7AvvYJ1bAXLgg6CoV9
         qHxlPajmksScrMHjUY1HCTe18JGSsIgYdBCN4/xQz2kHlGKcCjoI91KUbdztl/eh4zoq
         0AoJoXNoTVL0z8E75xhPb+i7ndNQVuW0OXnTRKDfP867dTps2NmYstcWyHeRfy/Jrp70
         Bi0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731922650; x=1732527450;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QW2IfhgsXhjkhuWBMY7B99CaNdpS5A7CGa3sZv7P9ac=;
        b=v2t4TRWOa7ePzCN30JwQeFW7axS1bUC/iGn7VSGwCArQnXVCnK5J0cG2vzVchDwoZD
         JajIZ06EdX++OoQYPwW0sHYEyY+on7dWtG/cPINDtVGgyQXjrlnZtApJ44jVRvcl4pRj
         ZOWd7bagpr1w8Mmr4QjAPZFdqwlSz1fou9XU3RWAARa+opm0pK8os9Uiwy9QmaNqVo2R
         5CLnuvZX4TjUJIbo9mxxd8mHjwQniIcrEymraf9dnHFzKGrIc4uLAmhj3CXtcHOMQ6Y+
         h68P9A6i1548DlLrZ7aUCPORaeQgaPk+s82kWf2uQd4hr/WQZXTOJ7BbRVfbKB1lT7Jd
         7TIg==
X-Forwarded-Encrypted: i=1; AJvYcCVp3VVvsTJ/ipHrScCTQGtrrvp81RAkb0P1iuW+XXScRqL51K9r1NLq38mcuKiolFKzEnIeZVaImrNTLrU=@vger.kernel.org, AJvYcCXZw8joohTPJpavXeBmqihZYKiBi6ccWn+DagDQvkbNQdBJGvKUSVVjEG+w3RkSB799OgQ7yFnjR3aTHn0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLPLJpey2+oxYypQWlQrnrv8Mff2quHJCYB8Lxz5tWlubXraNO
	QcVBOiGPRmcftTpE+xrJNKv5IjWu7Rd2vcwDm9A/XZFxUSh+F35a+JpP7Dvs
X-Google-Smtp-Source: AGHT+IFnG8Al6NvOlovgTgrF7vExh8IbHZLAN5WSBXRN88bM7aNfyvAEiT0oobaDYvExVOElAobNIg==
X-Received: by 2002:a05:6a00:4f8e:b0:71e:7887:81ac with SMTP id d2e1a72fcca58-72476d1764cmr13964427b3a.16.1731922649762;
        Mon, 18 Nov 2024 01:37:29 -0800 (PST)
Received: from HOME-PC ([223.185.133.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724772010f6sm5716632b3a.195.2024.11.18.01.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 01:37:29 -0800 (PST)
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
Subject: [PATCH v2 media-next] media: rkisp1: Fix unused value issue
Date: Mon, 18 Nov 2024 15:07:21 +0530
Message-Id: <20241118093721.55982-1-dheeraj.linuxdev@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit fixes an unused value issue detected by Coverity (CID
1519008). If ret is set to an error value in the switch statement, it is
not handled before being overwritten later.

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


