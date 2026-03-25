Return-Path: <linux-media+bounces-56975-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBhTIsLBw2n6twQAu9opvQ
	(envelope-from <linux-media+bounces-56975-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 12:06:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7E43237EA
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 12:06:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0E1B030396AD
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 10:58:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C2EB3A7831;
	Wed, 25 Mar 2026 10:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="C3xDVnHm"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0CB3A8721;
	Wed, 25 Mar 2026 10:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774436297; cv=pass; b=shonHQDeVmD5BZ7ZO9du7pNoGaEaqNS/p1gNcn6IiWXbcqM+693NVRFqQ86orb6aMRPKhloU4373tGLRY/yiJ8XY/0zLCU+yuPLGMcLZ5FT61FJZ3RwipUu0iQisuUZmb3OOv60Z8OdI6wFPHZBpurkNpPoLlUAbs4k3wMhMJ3I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774436297; c=relaxed/simple;
	bh=A+bdSqXFXVm/PoON4Ql3pNe4T0JuqG8zJ4wWht72dkk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LwgOODBM9OttP6MaRXo31XyEQSOcYAaTi14rQGB9ddT2cjTCw09x2uYMIRXjXGNyQx/Bwt0wtsynLHUhPbZfNSmk1XdtB5fthY8S2sdhPi19Tj9qxkT/B25il+d2njCJ6ilAzy6GYb+WIChiePsqCdcMddxYjoT7Tn5tpC56+m0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=C3xDVnHm; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1774436278; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Y7YCwHKzH8hiDAmnV1KUrd+IVN07UtPzFkqbD9FwE9D5lEDFGtb0pzQuy6wIWTTiyRrQA+9boVCvdlYQwC8J118KESfTl03jOaKpBWCAMObuNBdsqoQtNFWEwB8bM+nQuHNPleBHD9g3FEiVJwvp3MKB1+rFx5OWkQJVODGtVD4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774436278; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=LZX8KGo4PZ6B753XIW7wXx0NwuBo24mvyseB5KdfeiA=; 
	b=CSLvxmGzf4i89ZEayN2s55qxcZIMlJhv2q1BTjRTfONKLbEW6Qrh/dyGxrlawwXo4KZz82vY+FMhWmK0XWpilb8+NLTmajP2yZ6zBspNjaf8DI5twM7KLFkLZviuq9kbvHmXPhXeX+vzEEoNk1Tmwiqn3KOnsPkDLaPj9GXGzbU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774436277;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=LZX8KGo4PZ6B753XIW7wXx0NwuBo24mvyseB5KdfeiA=;
	b=C3xDVnHmMoUC+rQxmG9E1JQGdTZt5KBGSMQtDER/26nRZ60Ab2ZVKuGGoUUlngr3
	x0GgV++pKowKdzTmJZAgMWAJgRt4YkB8ukFwD6DHLEzDXJmuE74FaxMLTC37YmifT19
	bwy5QQJ78qoC3xTCMy58YLRQGVaSW/k49DFv4cfg=
Received: by mx.zohomail.com with SMTPS id 1774436275676558.7550111861934;
	Wed, 25 Mar 2026 03:57:55 -0700 (PDT)
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Ross Cawston <ross@r-sc.ca>
Cc: kernel@collabora.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v2] media: synopsys: hdmirx: Fix HPD lane hold time
Date: Wed, 25 Mar 2026 13:57:42 +0300
Message-ID: <20260325105742.63236-1-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-56975-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,xs4all.nl,r-sc.ca];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.osipenko@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[r-sc.ca:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,collabora.com:dkim,collabora.com:email,collabora.com:mid]
X-Rspamd-Queue-Id: EF7E43237EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Increase time of holding HPD lane low by 50ms. This fixes EDID change not
detected by source/display side.

Fixes: 7b59b132ad43 ("media: platform: synopsys: Add support for HDMI input driver")
Reported-by: Ross Cawston <ross@r-sc.ca>
Closes: https://lore.kernel.org/linux-rockchip/20260209061654.54757-1-ross@r-sc.ca/
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---

Changelog:

v2: - Corrected commit title prefix as was suggested by Sebastian Reichel
    - Corrected mixed up s/sink/source/ in the commit message.

 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
index 61ad20b18b8d..4c8957505a50 100644
--- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
@@ -506,9 +506,9 @@ static void hdmirx_hpd_ctrl(struct snps_hdmirx_dev *hdmirx_dev, bool en)
 	hdmirx_writel(hdmirx_dev, CORE_CONFIG,
 		      hdmirx_dev->hpd_trigger_level_high ? en : !en);
 
-	/* 100ms delay as per HDMI spec */
+	/* 100ms delay as per HDMI spec + extra 50ms to cover internal delay */
 	if (!en)
-		msleep(100);
+		msleep(100 + 50);
 }
 
 static void hdmirx_write_edid_data(struct snps_hdmirx_dev *hdmirx_dev,
-- 
2.53.0


