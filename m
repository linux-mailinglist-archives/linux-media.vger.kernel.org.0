Return-Path: <linux-media+bounces-31669-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A90AA85DA
	for <lists+linux-media@lfdr.de>; Sun,  4 May 2025 12:14:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 681813BCA5F
	for <lists+linux-media@lfdr.de>; Sun,  4 May 2025 10:13:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 650AB1A2C04;
	Sun,  4 May 2025 10:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZNRma+3q"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4C1193436
	for <linux-media@vger.kernel.org>; Sun,  4 May 2025 10:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746353650; cv=none; b=JAW+DmT1uth0vYXOnndgdZeeQajlcKqiR2jivSdXR7JE5b2ruukr4jNwSUsf33bOlXGHGKbfXFJVXaYHF+7POylMQzegDiAMST98YeHraM+BdGbB+hEQwO7j3szUj4mEefL7elckuP+3IAoAcf8iMahFrUNaRJ6HyvRIaRkfPHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746353650; c=relaxed/simple;
	bh=oLuuM6qggeCbiEAOaUZVpCFlDFNpYiitHCuQRxLW9TY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mDc80juR9qXW+4kcOJ3RlSDS10CiaovMCbrxfruMhj5yF2YVVO4/ul7SsKBwbvdsyu9GzL4+Ld7qnmQCFo1rdzDlxgq8jTIuh0j6adMblbNhgJFviAEnaI1V0T3a/SbODuTPCVdOz5hbsLdKaUabYhZ+8pmZd2Uco+S0nC4W4XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZNRma+3q; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746353648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0JZbEY+1t9zKeOoL0g6bW9wDNVU+30P6sdlGqikFh0w=;
	b=ZNRma+3qwchbZMXFAmffK6+3OYOvGJWO7BY2HkdQkZfyBn23W70Oh0XxybZX6kP0CoTZZ+
	reQBgojHvz5XzElTpErAGUFb5r9sqpCFjj+aaELY0xf/soxfCOl55ieswi4OsriqkPNMSM
	+96oQxukygMt9LBD8k0ycRDicVvnAO4=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-393-_TnqKeB4OXyIVkS4dB2SqA-1; Sun,
 04 May 2025 06:14:06 -0400
X-MC-Unique: _TnqKeB4OXyIVkS4dB2SqA-1
X-Mimecast-MFC-AGG-ID: _TnqKeB4OXyIVkS4dB2SqA_1746353645
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B16F218001CA;
	Sun,  4 May 2025 10:14:05 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.45.224.28])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 54B641800352;
	Sun,  4 May 2025 10:14:03 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathis Foerst <mathis.foerst@mt.com>,
	linux-media@vger.kernel.org
Subject: [PATCH 09/13] media: mt9m114: Put sensor in reset on power-down
Date: Sun,  4 May 2025 12:13:30 +0200
Message-ID: <20250504101336.18748-10-hdegoede@redhat.com>
In-Reply-To: <20250504101336.18748-1-hdegoede@redhat.com>
References: <20250504101336.18748-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Put sensor back in reset on power-down.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/mt9m114.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 43efcbdf614e..fa7c2137c6ba 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -2202,6 +2202,7 @@ static int mt9m114_power_on(struct mt9m114 *sensor)
 
 static void mt9m114_power_off(struct mt9m114 *sensor)
 {
+	gpiod_set_value(sensor->reset, 1);
 	clk_disable_unprepare(sensor->clk);
 	regulator_bulk_disable(ARRAY_SIZE(sensor->supplies), sensor->supplies);
 }
-- 
2.49.0


