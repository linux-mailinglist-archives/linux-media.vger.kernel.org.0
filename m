Return-Path: <linux-media+bounces-8060-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD04C88F706
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 06:15:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5B5D1F24BBB
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 05:15:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEDAE3FBB8;
	Thu, 28 Mar 2024 05:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HP7ID8+L"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12A518026
	for <linux-media@vger.kernel.org>; Thu, 28 Mar 2024 05:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711602897; cv=none; b=fFKBlp4VoyumnYdxPuPXBnaiANTi3j2+AdRFnqYuOE606wumq57KD+AS/5hzCdexXJhjid5wGrVo5w2WbO319mJ327XLTJ8RvjDF+Gf1eUPXIRk3VRFZH1BB0kxhkHnnyRTcNR8ivpGS0UzwN+9Hb7slRCoWlt6b1M1aYxwevQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711602897; c=relaxed/simple;
	bh=trUztcXBMs5OtcQkM6L5zAjPMeq4iHwSnTYH7Cn31b8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pzkHM8EPwoBSVgtZH4UEFyJv6szRIsc0Vw19B0TYhi6NJlMvNofo6uHxkOEK31QG791CtKXIvZlZPcohxNgdi5h9aWZtdXbpahBn/KjitPp1RnP76y9x6JKm5Bx955qQkJ2yXpYuu3StoWGjwelfsWocNt9zcZpzfwHBesLrUvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HP7ID8+L; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1def81ee762so1368765ad.0
        for <linux-media@vger.kernel.org>; Wed, 27 Mar 2024 22:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711602895; x=1712207695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=al+bOrMYpCO69loz9WSbHwDyCvLHsj+k363/YJ1kS+o=;
        b=HP7ID8+L86UHvt9qoxSqpuonqifbDicfXH1BS04u140LpdHRxwlrmOgrRZuF68SmvJ
         6caj0RAVGQRfOXWO/ztsS3p2wahEs5jncuNB1KbzOdAtm2DxDo2SHPAUH0/W3r6Z3FAj
         xaO1teus3IV4vKSXxWHf9fQyXYo8pN+NlgjjcbzJTn1auEQ+fXATR6O0JJ4ept7tQ5YG
         ECUG1IlWTTfg6w9d8KEw5IHcTZ/oVWmAaEa/CxgPqfm5ZKemrU0BWKPKsJOO8jRg92uJ
         Qts7+1Y/0ZGnrbLRvk/pAkHZIRE+K8vbB+Sk3FGy0hyiA0Fe78IX17Bd3ZaNih8FC2NP
         HYWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711602895; x=1712207695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=al+bOrMYpCO69loz9WSbHwDyCvLHsj+k363/YJ1kS+o=;
        b=bh8Y0s5zaKvSa6rdYd6BQ3IOr4YdpeGDVW2/JVlk8NkzMRmRDK7+Hoa3i2hyan1jIk
         KGZNN+Uj9THuRPoHqjXgak/4OQKiiWpFP7M+uOkNpukKm6eM+43h4Z5cE+UJ/+MMulSd
         3WtVEhDMi9a+WRcdNoHUcVigv0LgL+D8NNM7MEGfzzU8EcGoA4IHOIJeKO62vVXfCDsk
         PU+nLZAYqZhh+oQpZrfG9uBwYc5LSB/ms2ubWGNB2MCDfTZAo9P72DCixkqGguZxQglw
         ZIoRjjGPyE7ngayk6dN/LI23hxUQHQXXWI1aPqhAkfI4tOFCx17DVO3sAPRwlXanaiqe
         HEhQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9EOXvFFlVvswkQmf+aYZptgX9omTjEYcGhQuskxzPbO0eFFmzTWqPFC/pb12k3IRynci9QAvslhJYGNlOMfHkgE9u4THrtAgOGKw=
X-Gm-Message-State: AOJu0Yyzr8lSm/XyYSEQInrQsgIISt4ioe12OU9wVy7VO5ST+hgMKQiX
	qJBVEiXIgqxU1ULYg7KsEJIlqZyd1aMuouKdRZJ3vaWGBRp1MlLV
X-Google-Smtp-Source: AGHT+IFSrPQNNhxoTs8f2wdufeJyd0f5yeWeQ81raNPm3FXfLsMRQ9Zz06N5034jbp7YbLWmLvyEPg==
X-Received: by 2002:a17:902:c3c4:b0:1db:ce31:96b1 with SMTP id j4-20020a170902c3c400b001dbce3196b1mr1777965plj.6.1711602895050;
        Wed, 27 Mar 2024 22:14:55 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:ba70:b18e:9570:2643])
        by smtp.gmail.com with ESMTPSA id b15-20020a170902d50f00b001e0eae230f2sm492030plg.151.2024.03.27.22.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 22:14:54 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: rmfrfs@gmail.com,
	hansg@kernel.org,
	linux-media@vger.kernel.org,
	laurent.pinchart@ideasonboard.com,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 1/2] media: ov2680: Allow probing if link-frequencies is absent
Date: Thu, 28 Mar 2024 02:13:19 -0300
Message-Id: <20240328051320.2428125-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

Since commit 63b0cd30b78e ("media: ov2680: Add bus-cfg / endpoint
property verification") the ov2680 no longer probes on a imx7s-warp7:

ov2680 1-0036: error -EINVAL: supported link freq 330000000 not found
ov2680 1-0036: probe with driver ov2680 failed with error -2

As the 'link-frequencies' property is not mandatory, allow the probe
to succeed by skipping the link-frequency verification when the
property is absent.

Fixes: 63b0cd30b78e ("media: ov2680: Add bus-cfg / endpoint property verification")
Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 drivers/media/i2c/ov2680.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index 39d321e2b7f9..f611ce3a749c 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -1123,6 +1123,9 @@ static int ov2680_parse_dt(struct ov2680_dev *sensor)
 		goto out_free_bus_cfg;
 	}
 
+	if (!bus_cfg.nr_of_link_frequencies)
+		return 0;
+
 	for (i = 0; i < bus_cfg.nr_of_link_frequencies; i++)
 		if (bus_cfg.link_frequencies[i] == sensor->link_freq[0])
 			break;
-- 
2.34.1


