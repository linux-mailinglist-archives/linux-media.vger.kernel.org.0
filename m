Return-Path: <linux-media+bounces-8149-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99707890DCC
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 23:44:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FB6029DBB5
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 22:44:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45CC83FBBF;
	Thu, 28 Mar 2024 22:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ukq5N/dd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBAA3E493;
	Thu, 28 Mar 2024 22:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711665869; cv=none; b=tiWwBNusk0OBMz1TkYFd7GWb6d48OeZOGyxRRy6J3iIbgRb5Vmlk3WC6C0nEolJ+V9f1KUjUeh7Ok15xvpPLxSoPrEiNTCbBfNlsJW+BFraymiXk6/yQ46q5uj7kidAdbaGr3X7+jbBGN9ORhXbIB6nJC7kbI4wgM7MX4wpOz40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711665869; c=relaxed/simple;
	bh=3qqI+cC7l+4KpTmatlpAGZ3kbLeZEK6AaseXV3SlGK0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RwCMfOVp1iheHh7Cv5Pvm8BPjmha5Z2i4a1VslV44r5Hwo7RKN7YJJXG/PtRSdvXlFTlu0iTZNevl/JW5Q/X5ienEhk9BbLH9lu0/KkeGtEQjacwPJx4U2zP8LhjFs55Yp4x1RjJ6gohoGbQ9y1pIsPe8+a0szDX5UscfKhzCGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ukq5N/dd; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1e0e89faf47so4104375ad.1;
        Thu, 28 Mar 2024 15:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711665867; x=1712270667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gsEeW25cJF7eFI8zfTlsm+IXArJ9Y7+N5NoiN3PNCOI=;
        b=Ukq5N/dd3c2jbj/xDS7vhuE3siH/74ZLKhnz+kQHkAHMcZaz/fNpQL9dZTieJChsdm
         csSreTzPOU4IQFbGLuh96AurXNlO8jt64hwjFtzKqCOW4jsw2LS+JYKow4H3X6qg9Txc
         eL7BlojddxZ07Q24ZbSCuQpA943W77xiLk3pKyR8rqPJ0v2nA6mU8hkBqYgWVdxZEz3R
         yY6XIZLG2MqOb+y9ml7gxs/elK2avO+UARQzQjVLcy5oufJy5mPlwffx1C3baNVbxlwO
         SIIAEtvQvkubnun5Tufvb/8f6byhAYu4593UwpSJbQZZuIA45Ulrb6m34m1Ia8siTrgm
         tXIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711665867; x=1712270667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gsEeW25cJF7eFI8zfTlsm+IXArJ9Y7+N5NoiN3PNCOI=;
        b=gTJM7vz2IUIHHgeMy5uCBDX9S7l9L7ALBGuSlX7LldsC8/jUDVOgGh4x9yU6oLsusn
         rrQ+eIdIA+EdXqN2DQE4N+2TRtShKg1ND87x5SAeX1BgtEz5RXIpIRUmv09Caw2ulZkq
         roH6KwblNdqkNBajPUD/u3L8k9p72NckvQ1axzKXnEip0Cq91YJLK5il+ohEPxZUNS6b
         GFgpx94a0bxIMOgxrzTsl9xqXk8NX6azgv8TpOtWlfhQFsH2KtcdtVLMpR4SibQmeChd
         EbCVTwU1zAWEmpiKDBtkUmGhDiHs/GCYZ9Mpga8IGMGKhyfDnV+w4Uqcc2QFJHalVOzn
         /bQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVm6BiaUds89WLN4XHo+qox4Rb+o5PEwUopnXNGgotSH9HXJ3WyTBJxylQu+o7sz5GJ/L/s646cYeEcyx7evKBxQ9E7kwW5vAhnpjTo+O3f1sImMK9s294SwOoXPdIxGuyU/TE=
X-Gm-Message-State: AOJu0Yyt/9OJYPeTQ5zoRtFZqGgazmjI0C7SE2++FipkyCegF1gq+cSH
	ex1GNePLOP7gUqNRG3J1xsJb4+YtfhIXd0RLFUhB+3k0aD63DUMi
X-Google-Smtp-Source: AGHT+IFI5yoiJk39+iQc2eLx0GYduW8sMA76pD480GdGwU0X2s6QbKm/33hw06RkWzVowIceQ8I7PQ==
X-Received: by 2002:a05:6a20:12c5:b0:1a5:69bb:1165 with SMTP id v5-20020a056a2012c500b001a569bb1165mr553943pzg.4.1711665867543;
        Thu, 28 Mar 2024 15:44:27 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:918f:1fce:e47c:7f91])
        by smtp.gmail.com with ESMTPSA id o4-20020a1709026b0400b001dd59b54f9fsm2152522plk.136.2024.03.28.15.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 15:44:27 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: hdegoede@redhat.com,
	rmfrfs@gmail.com,
	laurent.pinchart@ideasonboard.com,
	linux-media@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>,
	stable@vger.kernel.org
Subject: [PATCH v3 2/2]  media: ov2680: Allow probing if link-frequencies is absent
Date: Thu, 28 Mar 2024 19:44:13 -0300
Message-Id: <20240328224413.2616294-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240328224413.2616294-1-festevam@gmail.com>
References: <20240328224413.2616294-1-festevam@gmail.com>
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
ov2680 1-0036: probe with driver ov2680 failed with error -22

As the 'link-frequencies' property is not mandatory, allow the probe
to succeed by skipping the link-frequency verification when the
property is absent.

Cc: stable@vger.kernel.org
Fixes: 63b0cd30b78e ("media: ov2680: Add bus-cfg / endpoint property verification")
Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v2:
- Fix memory leak and print a warning if 'link-frequencies' is absent. (Laurent)

 drivers/media/i2c/ov2680.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index 3e3b7c2b492c..a857763c7984 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -1123,18 +1123,23 @@ static int ov2680_parse_dt(struct ov2680_dev *sensor)
 		goto out_free_bus_cfg;
 	}
 
+	if (!bus_cfg.nr_of_link_frequencies) {
+		dev_warn(dev, "Consider passing 'link-frequencies' in DT\n");
+		goto skip_link_freq_validation;
+	}
+
 	for (i = 0; i < bus_cfg.nr_of_link_frequencies; i++)
 		if (bus_cfg.link_frequencies[i] == sensor->link_freq[0])
 			break;
 
-	if (bus_cfg.nr_of_link_frequencies == 0 ||
-	    bus_cfg.nr_of_link_frequencies == i) {
+	if (bus_cfg.nr_of_link_frequencies == i) {
 		ret = dev_err_probe(dev, -EINVAL,
 				    "supported link freq %lld not found\n",
 				    sensor->link_freq[0]);
 		goto out_free_bus_cfg;
 	}
 
+skip_link_freq_validation:
 	ret = 0;
 out_free_bus_cfg:
 	v4l2_fwnode_endpoint_free(&bus_cfg);
-- 
2.34.1


