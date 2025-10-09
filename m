Return-Path: <linux-media+bounces-44120-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9DBBC9E2C
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 17:58:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A63E63AF83B
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 15:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 237152EFDA8;
	Thu,  9 Oct 2025 15:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="IwHXWjoh"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1852225A35;
	Thu,  9 Oct 2025 15:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760025283; cv=none; b=N9SsCWJo+LoyEkKDzs7gNsvRXfNfFCZ7T+fE5PvNI/Wb79sm7CFNBCUnj5Rx1H6odprrZ2t0oe9nj7dW0sNJwZkJFf9+QBv2FfwBkCCWeVn+CmnA7CzkPf0TeYHJiaURs/W/wyrEwrYo4z4jBldEsDnaOBXbONN0fN2LwBWdExs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760025283; c=relaxed/simple;
	bh=3DYH/BgNF8fj6OXrTHIEeZty0YWNPAzxdxzDlmcpIhk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hn3+53r6zI2XX7R/T6r6t/s6SFZFZ57U8JnDk9u6uMsC3DmiXd9nZIwtG7091mZN124h8TGpYkJQn8oQSgWJKNMNGMnZyxI2Unz+B+JAKIWN2hAhDrQL1iZF1YaV0ocRYPSlpeXHMz3JsmEt2ATrvW0Tgqxzv+HqjlxFWlij3gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=IwHXWjoh; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1760025282; x=1791561282;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3DYH/BgNF8fj6OXrTHIEeZty0YWNPAzxdxzDlmcpIhk=;
  b=IwHXWjohPsBv5ZjC7MgI+JSpwqqNqq3q1lTXOtaRCDjKAMFAGeCpmfkq
   Pgb8m+bhA22JOiwZkj3MIqcpsgS7I/hEUaSubBMq6F6VI5WrcvNAcciQu
   IiT3KN0lMK/PkcjCwq/f328BCOiVtGcfXo6HhwBmgQTMcXQKJeRkRQ0ij
   eoyhdF2T2Zl5WZZN3QAxUECnUcAi28gsUd7wh0Va67MIJMWZ9rirR997b
   QnUEJI9E//kcQ59vWZCuj9qkOG8FuthsKAdKlm7+imJT7tJhwlQ07eJXl
   UxU3D8GTGGvgkOltnDsEeyu3ytxKyoNd04ZVx2UugpZHt/uMugqk7w5eS
   w==;
X-CSE-ConnectionGUID: /X4p8s51R2m1uwZxUki7lw==
X-CSE-MsgGUID: 7ZYvUhveRQOgT/nHVgq2lg==
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="214905338"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Oct 2025 08:54:40 -0700
Received: from chn-vm-ex2.mchp-main.com (10.10.87.31) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 9 Oct 2025 08:54:31 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex2.mchp-main.com (10.10.87.31) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.20; Thu, 9 Oct 2025 08:54:31 -0700
Received: from che-lt-i64410lx.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 9 Oct 2025 08:54:23 -0700
From: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: Eugen Hristev <eugen.hristev@linaro.org>, Chas Williams
	<3chas3@gmail.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Balakrishnan Sambath
	<balakrishnan.s@microchip.com>, Hans Verkuil <hverkuil@kernel.org>, "Ricardo
 Ribalda" <ribalda@chromium.org>, Laurent Pinchart
	<laurent.pinchart+renesas@ideasonboard.com>, Jacopo Mondi
	<jacopo.mondi@ideasonboard.com>, Daniel Scally
	<dan.scally+renesas@ideasonboard.com>, Tomi Valkeinen
	<tomi.valkeinen@ideasonboard.com>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-atm-general@lists.sourceforge.net>,
	<netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
Subject: [PATCH 09/18] media: microchip-isc: Register and unregister statistics device
Date: Thu, 9 Oct 2025 21:22:42 +0530
Message-ID: <20251009155251.102472-10-balamanikandan.gunasundar@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251009155251.102472-1-balamanikandan.gunasundar@microchip.com>
References: <20251009155251.102472-1-balamanikandan.gunasundar@microchip.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Balakrishnan Sambath <balakrishnan.s@microchip.com>

Register the statistics sub-device during async complete and ensure
proper cleanup for the same in isc_mc_cleanup().

Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Signed-off-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
---
 drivers/media/platform/microchip/microchip-isc-base.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/drivers/media/platform/microchip/microchip-isc-base.c
index cd379f95fc1c..5b49b6ff5ae9 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -1912,6 +1912,13 @@ static int isc_async_complete(struct v4l2_async_notifier *notifier)
 		goto isc_async_complete_err;
 	}
 
+	/* Register statistics device */
+	ret = isc_stats_register(isc);
+	if (ret) {
+		dev_err(isc->dev, "Failed to register stats device: %d\n", ret);
+		goto isc_async_complete_unregister_device;
+	}
+
 	ret = isc_scaler_link(isc);
 	if (ret < 0)
 		goto isc_async_complete_unregister_device;
@@ -2036,6 +2043,7 @@ void isc_mc_cleanup(struct isc_device *isc)
 {
 	media_entity_cleanup(&isc->video_dev.entity);
 	media_device_cleanup(&isc->mdev);
+	isc_stats_unregister(isc);
 }
 EXPORT_SYMBOL_GPL(isc_mc_cleanup);
 
-- 
2.34.1


