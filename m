Return-Path: <linux-media+bounces-22228-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4330F9DBA6E
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 16:24:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE5781642B5
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 15:23:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 162D21B6D15;
	Thu, 28 Nov 2024 15:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FKdfNihd"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF7E847B
	for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 15:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732807434; cv=none; b=gGWRW2S45h/b1wMVu6siXhtkRLWauPHAXtMnK9LEsQpFPj0hpM2iWH9yrFy/jFH0rmBBGZkDy2ZiQcwk/Jp8DKPC0P0W/3P2icJ/lCB77b+9QJVGOBgO0OnGk1XeAiVkvBD0CL3fJLMribi1pUynd7WIVsmyBP6wq1NuT5+uMAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732807434; c=relaxed/simple;
	bh=xoG/VHpr+QoxBmHeYUYAzAJ5O6ry77abPWPhs2PwPxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KnRjteVwifS9bDj29z35WEKmAJSXKS1N6+/oXzpEfx8A9kbncnwoDHIMNxBU2h6PXq4QrSiCJ8Tg2Twkg5lITlSCwGriTOzmGwODFzFpMAg8p5Hz/CNzcEck8tdq23zJRlGWlkDf7SK3BetOpzePg8PkBzCugsjvKd3Mg+0NUqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FKdfNihd; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732807431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vLGFkY7C3wP0n8eTAaprK6q2X74+CdPRsHkduFusCyM=;
	b=FKdfNihdkBsYgtFxkHcpvXiaY4ZhLDBxh55O4+LGCnl27O+cMxEtPPMahjOOxk05+Y5lHg
	UeYJCeXfX522a2PrUPoZsW1xl853F1hKwtWydXEnDhqcvbIGR5W7x7zpZGTOpfLL3qYuL2
	tOrndgWgcooO7aEFM+LbT66jOdwi7vc=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-22-2V6JzWGdNvmF85kFn1GJyQ-1; Thu,
 28 Nov 2024 10:23:47 -0500
X-MC-Unique: 2V6JzWGdNvmF85kFn1GJyQ-1
X-Mimecast-MFC-AGG-ID: 2V6JzWGdNvmF85kFn1GJyQ
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id ACEC019560A3;
	Thu, 28 Nov 2024 15:23:46 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.193.119])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A99B6195608A;
	Thu, 28 Nov 2024 15:23:44 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	linux-media@vger.kernel.org
Subject: [PATCH 1/4] media: ov2740: Debug log chip ID
Date: Thu, 28 Nov 2024 16:23:35 +0100
Message-ID: <20241128152338.4583-2-hdegoede@redhat.com>
In-Reply-To: <20241128152338.4583-1-hdegoede@redhat.com>
References: <20241128152338.4583-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Calling the identify function may get delayed till the first stream-on,
add a dev_dbg() to it so that we know when it has run. This is useful
to debug bring-up problems related to regulators / clks / GPIOs.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov2740.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 387c529d9736..e7a611967b40 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -644,6 +644,8 @@ static int ov2740_identify_module(struct ov2740 *ov2740)
 		return -ENXIO;
 	}
 
+	dev_dbg(&client->dev, "chip id: %x\n", val);
+
 	ov2740->identified = true;
 
 	return 0;
-- 
2.47.0


