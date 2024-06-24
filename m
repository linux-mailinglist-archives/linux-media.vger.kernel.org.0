Return-Path: <linux-media+bounces-14038-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE28C9146C5
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 11:56:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 14EEDB2439F
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 09:56:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47459134407;
	Mon, 24 Jun 2024 09:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aAuL2nim"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F39F13248E
	for <linux-media@vger.kernel.org>; Mon, 24 Jun 2024 09:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719222963; cv=none; b=XK9q5aMIbfU+5/9GNwEmkLjuRbNJXhIOimpAvUUYpnSMmPF62jYb20IA0mmQlB40DgB5X0ztmAtLppgJ00EGNQITpW4fybSPoRLAgTOFFm/v/79VJAAXb3xKMT1Dlx7PSvvK1fdyWxcBoHhBNYbYRt9150knU8IaOjRDiLokgc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719222963; c=relaxed/simple;
	bh=Z+ybKs8LSEAIG6A+4bC/ShBudIgAMGPcBSsJSKdVzts=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oSewQC8/JlNAMWd9cSpP5KmJUzsuSB6kKu4xeXmoBSZPXXAsjBZZ3fkfek7HT23t8/66ChxDC0KDxzTuc8YX5+BrOq0A3cILGQeeGFtv330BLjrj6MZeGxtjy8m3d9IyWB+gGaf2A0RKJLJFC9ew8bIcGKSTgQH7YONW0kTp960=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aAuL2nim; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-421757d217aso45140735e9.3
        for <linux-media@vger.kernel.org>; Mon, 24 Jun 2024 02:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719222960; x=1719827760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7EEqxuVwryGkI9e6OWNQevVQjBpVhdVGw/fICJinrH4=;
        b=aAuL2nimrCPKE97PN0OIVu958FH2a/oznAbRoj1xfBXn30GVyemgLL+TF3tyh9fijT
         W48wkcBcsVoVPy52e1DsmuD10Jv6bwGsFAWXPrax7tDDOzY5WeYxC3ZG9IO5wipjLhy3
         P2nP2/rJtqW+iWvwntDSglJSwCpf68bBYYTXhIkzOC/eiEgFjA/gUHKPCS7Uq075MhSz
         KC7e2Pq7PH6XRYDFJlV5/Foua4E9Yk/BgA8PKOvhr6ogIGQQbAXxBsvsLaeTMY4YhQOE
         v+/PNg9Ufph3FkFVl/DGiIaoPtuc/NhpOG4quZo29gdrrZZ+61OQpsJ76ijCAg1W0aYN
         7CKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719222960; x=1719827760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7EEqxuVwryGkI9e6OWNQevVQjBpVhdVGw/fICJinrH4=;
        b=tPYnXcCIjj/uCVzvbkqaimmcw7owkch6U0K8KZL2ArgDANhOSNjdMKVWXxJEI5C/6b
         TMxLaUDeaLVXfDmunB54aIHf+i/YqISXTdKWjyN/tqMoiuQB+T6aOQNw3keHEimToXRh
         av1Mg25bn3Ro8zcAMGbEWuUvOt1NRkQIyGYnixmd2cRW3kezltZaSuvklB1YKyI9WCsh
         rn+rnNf2vGFn7KIJrnCwm8fTSIMtcBW8CfbELzHmP9h9WJ65ChTI/+gykkPN20HZvOSX
         HkZ9KSRMWp8anhiOl7glIzt339/4+16qvA10iabjYxAKrGEtGkuHyBjJ2VtsxFpK6ziW
         SpwQ==
X-Gm-Message-State: AOJu0YyN8R6j2m4h7R5pB349pk3/np8EJD8QAZWIywbzNt0u5yQJhqwD
	SEcMrFa+qIFqPS2duG0G5Yy3a7kdxtlbVqNL+q+Jav8f3E7PX94UJwNF0qU=
X-Google-Smtp-Source: AGHT+IFeYfGx9dY1+Y4lwz701h3lzH3qMQaL8/luX72kzAtXfnk2rxIu6sXEAbyPs1mVaUKkPO9kbw==
X-Received: by 2002:a05:600c:3c90:b0:424:90f4:309d with SMTP id 5b1f17b1804b1-42490f430dbmr23751625e9.8.1719222960271;
        Mon, 24 Jun 2024 02:56:00 -0700 (PDT)
Received: from localhost.localdomain ([105.163.2.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424817b5ca0sm128258475e9.24.2024.06.24.02.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 02:56:00 -0700 (PDT)
From: Dorcas Anono Litunya <anonolitunya@gmail.com>
To: linux-media@vger.kernel.org
Cc: anonolitunya@gmail.com,
	jaffe1@gmail.com,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 06/10] media: vivid: don't set HDMI TX controls if there are no HDMI outputs
Date: Mon, 24 Jun 2024 12:52:59 +0300
Message-Id: <20240624095300.745567-7-anonolitunya@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240624095300.745567-1-anonolitunya@gmail.com>
References: <20240624095300.745567-1-anonolitunya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hans Verkuil <hverkuil-cisco@xs4all.nl>

When setting the EDID it would attempt to update two controls
that are only present if there is an HDMI output configured.

If there isn't any (e.g. when the vivid module is loaded with
node_types=1), then calling VIDIOC_S_EDID would crash.

Fix this by first checking if outputs are present.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/test-drivers/vivid/vivid-vid-cap.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-vid-cap.c b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
index 2804975fe278..de4cb85e397f 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
@@ -1553,8 +1553,10 @@ int vidioc_s_edid(struct file *file, void *_fh,
 		return -EINVAL;
 	if (edid->blocks == 0) {
 		dev->edid_blocks = 0;
-		v4l2_ctrl_s_ctrl(dev->ctrl_tx_edid_present, 0);
-		v4l2_ctrl_s_ctrl(dev->ctrl_tx_hotplug, 0);
+		if (dev->num_outputs) {
+			v4l2_ctrl_s_ctrl(dev->ctrl_tx_edid_present, 0);
+			v4l2_ctrl_s_ctrl(dev->ctrl_tx_hotplug, 0);
+		}
 		phys_addr = CEC_PHYS_ADDR_INVALID;
 		goto set_phys_addr;
 	}
@@ -1578,8 +1580,10 @@ int vidioc_s_edid(struct file *file, void *_fh,
 			display_present |=
 				dev->display_present[i] << j++;
 
-	v4l2_ctrl_s_ctrl(dev->ctrl_tx_edid_present, display_present);
-	v4l2_ctrl_s_ctrl(dev->ctrl_tx_hotplug, display_present);
+	if (dev->num_outputs) {
+		v4l2_ctrl_s_ctrl(dev->ctrl_tx_edid_present, display_present);
+		v4l2_ctrl_s_ctrl(dev->ctrl_tx_hotplug, display_present);
+	}
 
 set_phys_addr:
 	/* TODO: a proper hotplug detect cycle should be emulated here */
-- 
2.34.1


