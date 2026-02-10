Return-Path: <linux-media+bounces-52496-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBnuBOrqimlEOwAAu9opvQ
	(envelope-from <linux-media+bounces-52496-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 09:23:06 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79216118396
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 09:23:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9377A3034CB7
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 08:23:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9725D33D4FB;
	Tue, 10 Feb 2026 08:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OnOsiLaJ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC18C33CEAA
	for <linux-media@vger.kernel.org>; Tue, 10 Feb 2026 08:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770711779; cv=none; b=pf72h65MeRnzZKvbWNufjVN7AQTgSETJisTahIy8rCKCMwxtatDKfK30jCyNTC8um78Fy4laKu965gfh4netfplrsCkl7L3z5vApVEvhaPp6+j2g2ITWMHqqLXt3zRDfiHKfr89zC7Mpzg/w7YzLCoRafcG8XJkqD2Z8tQxWuPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770711779; c=relaxed/simple;
	bh=xmJwrHf4q2IDWFmUdj1fcF9TnssMBp/VNjUuGh/3isk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sHxJsoZG5iuuj1Jpk5rjUloSznxZuM5skVWuiKW05OvM6fPUDx+/Yj+4rneuVGOvBDRoALHDr14qdbX9ookBHRSlZGvZ2wuBg10b+hC0st8lLO5EPVRil8mfBVO3garyJXqGboqpoxthmTgkSH9WTSDR7dLHdJn4z7XcoJ+ZvXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OnOsiLaJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:2edd:807a:f3c0:8d1b:28a])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 00503E47;
	Tue, 10 Feb 2026 09:22:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770711730;
	bh=xmJwrHf4q2IDWFmUdj1fcF9TnssMBp/VNjUuGh/3isk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OnOsiLaJ62/I/jx+Raogy2bbzYGESHRB4OFoJHF6m3i9ALguOzfikyP1QRC9mJciy
	 Fn4rVDH0JGRXCYA8YJpbhMRIHPgFmX4PanXbEaBeuVL4QfJgxAq7DhdQfJgOPpvVpl
	 gfBTJm1j3midaTTUYr5mX+d0Y1ljnwDmRmG3KfmI=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 10 Feb 2026 13:51:25 +0530
Subject: [PATCH v2 8/8] platform/raspberrypi: vchiq: Load bcm2835_isp
 driver from vchiq
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260210-b4-vchiq-isp-v2-8-4403944152fe@ideasonboard.com>
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
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1901;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=eCv09Mqfnqp7/pBKKBSALZWW1w+B4jVcEjaPNOpfR1M=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpiuqszBMQ7N/fdI7W3EWteUiC56elLz5T2pw8e
 k3psNCy2mCJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaYrqrAAKCRBD3pH5JJpx
 RXV9EACFhSkcLBDcWa/vFcd1fE1Qi9NqDcLorozj0jJnx13En05C8DFxTDCRyUL+fY9XLI2fB9Y
 U9d8K8PrgmlwcCrthic4KEXIjUbOaWJo2C1jo2732Je6FUjpqTzbdy3wwU3rN8g11M+SZBGGmEk
 L+gf5sI+oW00Yt9qlaedonTz+bKSTPSmmRdKMlfAiyUKXLHsiqb4knw0qZUoWq0GI5QHid2fODB
 kVASjaZyVvN8MmaEkgvKSoVYgYqvCC39a0bWbbsOpomL1HcATOF6M6bg+SVvA3+/buRWE9YxIRE
 OzSwxAuEa3eIsBPNwcg2olFQTtJPiILjqyItSPu7agvHJMKKetVOrBn9Gn/5tU8AiBBHepfw0an
 NmToH1/GwpygbmYTiAIur/IndOvXswnQRA2wuVqZG6zGa6UjQKkPgoVqmBJPT2alMJyoiSIsaXI
 duG7b7TrwJl4/tpkaMkYP84yONPC2TBwqunQ3v6pHXyBb/yDzCwHZ/whOzxWubNaLKjsiM4/xfC
 t0p5iQ5ZTa97RXpH9tRWMhDAsJBrqu6oa7qvE0Z605e54fBmqAaGBLVWLCijrSnbhk8S0ZdgFHu
 0+1voZ1ygL7mpu0rOMS3CnhM8k4xmG347Q38eTJNsf0DnewuGSGHKt/yDCuzqBKYv7joweGoY4y
 e67LAgOYcFqw/0A==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52496-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,raspberrypi.com,gmx.net,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[raspberrypi.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:mid,ideasonboard.com:dkim,ideasonboard.com:email]
X-Rspamd-Queue-Id: 79216118396
X-Rspamd-Action: no action

From: Naushir Patuck <naush@raspberrypi.com>

Broadcom BCM2835 ISP driver is managed through the VCHIQ interface, so
register it to the VCHIQ driver, similar to the audio and shared memory
drivers.

Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c | 2 ++
 include/linux/raspberrypi/vchiq_arm.h                    | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c b/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
index 00c31f18bb69fa8f21a2a048393ea76615eb926b..fe841c13677bd9cb63a825a7f99d45470d457c18 100644
--- a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
+++ b/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
@@ -1416,6 +1416,7 @@ static int vchiq_probe(struct platform_device *pdev)
 
 	mgmt->audio_dev = vchiq_device_register(&pdev->dev, "bcm2835-audio");
 	mgmt->vcsm_cma_dev = vchiq_device_register(&pdev->dev, "vcsm-cma");
+	mgmt->isp_dev = vchiq_device_register(&pdev->dev, "bcm2835-isp");
 
 	return 0;
 }
@@ -1424,6 +1425,7 @@ static void vchiq_remove(struct platform_device *pdev)
 {
 	struct vchiq_drv_mgmt *mgmt = dev_get_drvdata(&pdev->dev);
 
+	vchiq_device_unregister(mgmt->isp_dev);
 	vchiq_device_unregister(mgmt->vcsm_cma_dev);
 	vchiq_device_unregister(mgmt->audio_dev);
 	vchiq_debugfs_deinit();
diff --git a/include/linux/raspberrypi/vchiq_arm.h b/include/linux/raspberrypi/vchiq_arm.h
index d59837eaaa8c0e699575897c01d17359a58b0e62..ea1bd419e471cf3c8e66445ca6b6c706458657bd 100644
--- a/include/linux/raspberrypi/vchiq_arm.h
+++ b/include/linux/raspberrypi/vchiq_arm.h
@@ -63,6 +63,7 @@ struct vchiq_drv_mgmt {
 	 */
 	struct vchiq_device *audio_dev;
 	struct vchiq_device *vcsm_cma_dev;
+	struct vchiq_device *isp_dev;
 };
 
 struct user_service {

-- 
2.52.0


