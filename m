Return-Path: <linux-media+bounces-32002-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 663F1AAE9CC
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 20:48:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BED971C42039
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 18:48:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DAB2211283;
	Wed,  7 May 2025 18:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QR1ru3r2"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8432328C845
	for <linux-media@vger.kernel.org>; Wed,  7 May 2025 18:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746643693; cv=none; b=JrHyl8w3K7YzHOBwFrgS2M8+DYWIl1XEHKCNnXhQBUWyFgb2vCrfsjFpLhMFPoCXRq9nx//wTmTQd23cmPYv4/ErizEbsip4WXMBIoa/0tADhDKuf3MDAxfgUNUWPIAc8SK6fHf6h7jG/e25o06BWQa9zGkzasIV/MTt9N4KRa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746643693; c=relaxed/simple;
	bh=v5oThwdDdtkszxNUvAaqGLbnmiBSqdZvEvtg5OD2P8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IFk+6UyUZ41LKnjzW8rR/i9XRm1m9R7G7RyPB+TPaI7fB1ICa9wwd/7zpr8Wh5eKUdv7PCsUshSAxXkHrm7m/n8Yx90Pi+dYBcdyDciDmWXHqEYJFp5GkjCXXztB7AYp7IY5ENPM3Qahf/SGFzXhP1eF+QpXs9Lmk3XNLCbdYt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QR1ru3r2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746643690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tuWtXnwoXOYvMMWOvvVq7Of39TLCMjs5J40TvfP2xBQ=;
	b=QR1ru3r2PgMlExtTDwC4p1yVgnSbtFxRB2KoWlCRmkcshgKBVnuFXHuZpd3SM7VfqLI0eQ
	FX2ysrRvRIxXthZ0lLbUjzJPT0FCGUXLMpvc/4NKvCm0vLC7x9vUrC8ftETFeSwyfAL60l
	RtnLzPWa93MQW/NkoJMXTGOijvaKtMo=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-144-tuNEBcXcN2Ov9eqfjqJwnw-1; Wed,
 07 May 2025 14:48:07 -0400
X-MC-Unique: tuNEBcXcN2Ov9eqfjqJwnw-1
X-Mimecast-MFC-AGG-ID: tuNEBcXcN2Ov9eqfjqJwnw_1746643686
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2509B1955DC5;
	Wed,  7 May 2025 18:48:06 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.44.33.122])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7BF6430001A1;
	Wed,  7 May 2025 18:48:03 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 5/6] platform/x86: int3472: For mt9m114 sensors map powerdown to powerenable
Date: Wed,  7 May 2025 20:47:36 +0200
Message-ID: <20250507184737.154747-6-hdegoede@redhat.com>
In-Reply-To: <20250507184737.154747-1-hdegoede@redhat.com>
References: <20250507184737.154747-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

mt9m114 atomisp designs declare both reset and powerdown pins in their
GPIO type DSM, but the mt9m114 only has a reser pin. The powerdown pin
seems to control the regulators suppyling power to the sensor and
the privacy LED.

Add a mapping of powerdown to powerenable for the mt9m114 for this.

While at is also add a comment to document the ov7251 mapping.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel/int3472/discrete.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index c706671e2f63..4c0aed6e626f 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -142,6 +142,9 @@ struct int3472_gpio_map {
 };
 
 static const struct int3472_gpio_map int3472_gpio_map[] = {
+	/* mt9m114 designs declare a powerdown pin which controls the regulators */
+	{ "INT33F0", INT3472_GPIO_TYPE_POWERDOWN, INT3472_GPIO_TYPE_POWER_ENABLE, false, "vdd" },
+	/* ov7251 driver / DT-bindings expect "enable" as con_id for reset */
 	{ "INT347E", INT3472_GPIO_TYPE_RESET, INT3472_GPIO_TYPE_RESET, false, "enable" },
 };
 
-- 
2.49.0


