Return-Path: <linux-media+bounces-52492-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGxwAebqimlEOwAAu9opvQ
	(envelope-from <linux-media+bounces-52492-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 09:23:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A9D11838E
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 09:23:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D49D7304227B
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 08:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A34933CEB0;
	Tue, 10 Feb 2026 08:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OaE/7xbv"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0A32DAFD5
	for <linux-media@vger.kernel.org>; Tue, 10 Feb 2026 08:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770711754; cv=none; b=bah80u1LKUK78Kx0zgqBKvoOHMFa65RUDTp1SVvXwCS3jon0zBemtaVQNqzR0+9TfuPlrBKdWmJB43lkgKF/vHV/OY1cXhZTG4/9+sQ1VeTv0jR+G7kAYW56O5ZGS2w+CJogUi8MocK27X4mcIgISYTVs+/sxH+dGI+TBu9VdH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770711754; c=relaxed/simple;
	bh=2sCGzoSzlhrxwPHsDW8b9Ti5c4ohWUGul3MmOV8ix28=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ff8060ofwPhqw3FDQCCTEfl9IINr6GijsqkfAZ0xr+istkpwxL/oymvVcRD0BVHsfPTP3P+ZVlIKT39NdF8R/oMJg0x/H75qIGBGn3QfPG1c+Zs45S+2ZCIhjpkfNkr/nWbKAjXSkgxbmbJ9HF2Ef7JrGIYWvceiPCcocDttBFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OaE/7xbv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:2edd:807a:f3c0:8d1b:28a])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D2D4C13BE;
	Tue, 10 Feb 2026 09:21:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770711706;
	bh=2sCGzoSzlhrxwPHsDW8b9Ti5c4ohWUGul3MmOV8ix28=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OaE/7xbvj8dC3s7OeCTN9xB0smCmmpHIx+bSDixOlCYXKabB+zBvlypCZK42NEIuk
	 G/JLU9x/EZq8LRN3vxp2UgTZTUpjU+EV7sili0prWSrNAM6lG2f/HoIbyc/eNgTYAl
	 Ugzu4zanYtyqeypn7jknL2K6+AEeFOV8sNsOCqNM=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 10 Feb 2026 13:51:21 +0530
Subject: [PATCH v2 4/8] platform/raspberrypi: vchiq: Add helpers for vchiq
 driver data
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260210-b4-vchiq-isp-v2-4-4403944152fe@ideasonboard.com>
References: <20260210-b4-vchiq-isp-v2-0-4403944152fe@ideasonboard.com>
In-Reply-To: <20260210-b4-vchiq-isp-v2-0-4403944152fe@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Naushir Patuck <naush@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, Umang Jain <uajain@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1152;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=2sCGzoSzlhrxwPHsDW8b9Ti5c4ohWUGul3MmOV8ix28=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpiuqpNbLnpjWWFjFBfm5h7MB/8L4M4aL6I5jcD
 kgmrATChFmJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaYrqqQAKCRBD3pH5JJpx
 RZZ+EACK+HeASA8fGyGscG/gA1uvbi6igIXBgE1fIoppYkEDCBoYyusRlw4u9m90vxw3vIG7gxl
 Xg63mxp1w06yPcZYcmUPRBICp2bRtBUTn6/u4gEzuWGlYbWIIl1V6ENJtn/emgBQHtEKg9VxnYB
 CFpTQtmpejAwMJwHoV9eyVQZ2fdIHFs+kFfpapk/N7C3QG2xeqwKXxbB3bEVJ8j0ix5YAka44bh
 gettuz6gE2/6G8d+JMeSC8IMCakWqhoBbcjCBGNMojCr7V9Tq01mHfrv9OgLRXpSi8x2bu+w9+y
 xUwjPhvseLi2St1kz3coOLMjQihFdM0AQNaAlUZv2Z8pIHp/pU8bobG9VXdDf3bX/wv4b5mq65o
 YKUHrtdxXKBdvAg6oRUkNLHfrGJg1Ur1xNOTi9YMkdgUP/nN5tQHPDCnHMBOSp4upYqq/XJVFlZ
 oBRQaLDh7lJNC8E4m/Bts8iBlvaryBNSCL2k2BOxWa7hujZI2iGFvXPFypsryCknZX5jXPw7J2M
 bKbs1PwrAfj//aGQv624Q/kilbv3ZC+M7vUhBF3YEyuhDoXMzeGjbaHCytywPODGXCkbR/CYGu5
 qE68Tj9EX9xW0VdDtJzYQ2u5cRjyx9vgVoGOwiBlHr5Yr6yzBSKkmF7eOb8tYiVGyyGSWcYAbnh
 CNYyD23tbluO3aw==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52492-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,raspberrypi.com,gmx.net,vger.kernel.org,igalia.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:mid,ideasonboard.com:dkim,ideasonboard.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 51A9D11838E
X-Rspamd-Action: no action

Add helpers to set and get vchiq driver data. vchiq_set_drvdata() and
vchiq_get_drvdata() wraps dev_set_drvdata() and dev_get_drvdata()
respectively.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 include/linux/raspberrypi/vchiq_bus.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/linux/raspberrypi/vchiq_bus.h b/include/linux/raspberrypi/vchiq_bus.h
index 9de179b39f85e5e94c1e948030fccf0c52a00fcd..6eff6b0bf5995683ef0468bc811334b7ff4f8c19 100644
--- a/include/linux/raspberrypi/vchiq_bus.h
+++ b/include/linux/raspberrypi/vchiq_bus.h
@@ -37,6 +37,16 @@ static inline struct vchiq_driver *to_vchiq_driver(struct device_driver *d)
 	return container_of(d, struct vchiq_driver, driver);
 }
 
+static inline void *vchiq_get_drvdata(const struct vchiq_device *device)
+{
+	return dev_get_drvdata(&device->dev);
+}
+
+static inline void vchiq_set_drvdata(struct vchiq_device *device, void *data)
+{
+	dev_set_drvdata(&device->dev, data);
+}
+
 extern const struct bus_type vchiq_bus_type;
 
 struct vchiq_device *

-- 
2.52.0


