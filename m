Return-Path: <linux-media+bounces-8061-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D84D88F707
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 06:15:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D92551C2404E
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 05:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34361405FF;
	Thu, 28 Mar 2024 05:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lpZztm4Z"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9C118026
	for <linux-media@vger.kernel.org>; Thu, 28 Mar 2024 05:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711602899; cv=none; b=WIWPprv4dq/oBHA7WowY0PwNJqmGBweJhNT+TLqfCYd/YatsDKM4bGCBCI9SMOD8OUd9S7GS0BDDHmlpcSsT6RoHIZXuGyT6LDRNs3H3m+wzrew1CLyRFzZa+nAb0FkKjILkOXJjgn6GqCSDaw8oZvzBoPri9jMq96IS123NkBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711602899; c=relaxed/simple;
	bh=2EPZRor9QrJOjCmxrA3GZX5JmhoQ6mfy5ccU7ElxgD0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HTTmnXerOgqA3s6295NK3nFy7z4yB6RENsaAr9polsVqqAAnVpmUz+fxg2WfKIZnBd4NG4nkIbK+pzqtqALSRf6HOmouPR8p382df6/lhz25Mqh12E1j0qrzGl4lhvNcneSETQsdNCyuo2Mh8/sFPPVtPAtpQnZhyNECXURIvr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lpZztm4Z; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1e0e89faf47so1688605ad.1
        for <linux-media@vger.kernel.org>; Wed, 27 Mar 2024 22:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711602897; x=1712207697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7R/TEAO3zmsktRBKQhrymEWAHBiB7lCybP6vbYknfOU=;
        b=lpZztm4ZeLxuTSx9jDbx4c/kOVC4jUzS/RdEDcoY2f0XDpI3o6arG+eI2pkNuqYTld
         12ZaxPE3VQ/Vej5Wd3NpaZkzAXW903aX0dsHMThP7Xb00xabgherC3JgUaArsCDCBBt/
         RMwBv88e8roNY137i65X4uDZPYM3IBT7sfNnuXUVh5aAZSE34gZK6j5TGMRcN8ZcTjfk
         IniFTxRmnF923+hlCgpTLECLl7ROD85bCOzXZyc2NVHTrdB/8+Ipt8u0MmQL9vqaf+N6
         D0uG8JQUzBUTB3gyt8A1ZM8Me/naWXESgIzs6zhpnP3n28QDynYZ+u8b5kP3AkQ4IL2v
         4djA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711602897; x=1712207697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7R/TEAO3zmsktRBKQhrymEWAHBiB7lCybP6vbYknfOU=;
        b=JSAjqwNqF79pMJFl5YBYH1D7WwU453BsBspDLWg9rcRQIwyn0TY7R6aCpvQKZ/56PA
         pmvA0Unsq5qahn+zDiExhdUW46/FUOoq11TWn2Md705V2u2nJc4gXhKwNcPRaS2nTW3Z
         40YrWDapUUclmrUgM3ocW9msnsel1HFL9MGsjPx2jaA/IGYv+s44fOG1A+Xv+R5ELXVy
         j7LMXZzX3iww/iXkleKAhepoygjbj7OGijMqD2XM8H2VFbxxVKd7eXsSk8+UnTZrA+eX
         Ibf/OsvBMzFyqQL2btuYxKcZ3A79Dq4obF2DgdXq5Tl8iIVJJXdRZvsVYvSGQNJo6VNd
         BkIA==
X-Forwarded-Encrypted: i=1; AJvYcCU368Dy/onxomgcjgrB1oseISqjxaWIDAlin8c1W986mqmwrASikfK9EDxRmWnQ30Wlzp/xi0rluckh5izclrXh0HBfcDf9ffb+HZE=
X-Gm-Message-State: AOJu0Ywd/49LgpZuMXgWW4XAlvb9mXnEwFZGrYu82rv1AdXxQ0iwYsVH
	hSgosycIOu6P17doTe7Gieq3Ul9VLzrUOJgwmdT+bcikWWNumsi5ZIIp4nf9
X-Google-Smtp-Source: AGHT+IEBS/XyQwLmV1zoih8RFnzjgiAm9m/JUrTizbIhBzB3WdwC49NtVGsM1Lv1Iw0ZSip7ZZZ7lA==
X-Received: by 2002:a17:902:c3c4:b0:1db:ce31:96b1 with SMTP id j4-20020a170902c3c400b001dbce3196b1mr1778030plj.6.1711602897565;
        Wed, 27 Mar 2024 22:14:57 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:ba70:b18e:9570:2643])
        by smtp.gmail.com with ESMTPSA id b15-20020a170902d50f00b001e0eae230f2sm492030plg.151.2024.03.27.22.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 22:14:57 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: rmfrfs@gmail.com,
	hansg@kernel.org,
	linux-media@vger.kernel.org,
	laurent.pinchart@ideasonboard.com,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 2/2] media: ov2680: Report success on link-frequency match
Date: Thu, 28 Mar 2024 02:13:20 -0300
Message-Id: <20240328051320.2428125-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240328051320.2428125-1-festevam@gmail.com>
References: <20240328051320.2428125-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

When passing the correct 'link-frequencies' in the DT, the
driver should report success on the match case:

port {
	ov2680_to_mipi: endpoint {
		remote-endpoint = <&mipi_from_sensor>;
		clock-lanes = <0>;
		data-lanes = <1>;
		link-frequencies = /bits/ 64 <330000000>;
	};
};

However, this does not happen and the probe fails like this:

ov2680 1-0036: probe with driver ov2680 failed with error -22

Fix it by returning success upon link-frequency match.

Also tested passing a wrong link-frequencies value in th DT and
confirmed that the driver correctly rejects it.

Fixes: 63b0cd30b78e ("media: ov2680: Add bus-cfg / endpoint property verification")
Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 drivers/media/i2c/ov2680.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index f611ce3a749c..37c21749dc14 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -1128,7 +1128,7 @@ static int ov2680_parse_dt(struct ov2680_dev *sensor)
 
 	for (i = 0; i < bus_cfg.nr_of_link_frequencies; i++)
 		if (bus_cfg.link_frequencies[i] == sensor->link_freq[0])
-			break;
+			return 0;
 
 	if (bus_cfg.nr_of_link_frequencies == 0 ||
 	    bus_cfg.nr_of_link_frequencies == i) {
-- 
2.34.1


