Return-Path: <linux-media+bounces-64814-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 17ckBkXeLmp25QQAu9opvQ
	(envelope-from <linux-media+bounces-64814-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 19:00:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E518681A3F
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 19:00:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=muskLpMg;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64814-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64814-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E8253032770
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 16:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A11A39A045;
	Sun, 14 Jun 2026 16:57:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52C037C0EB
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 16:57:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781456236; cv=none; b=cnDgoWTFqbyC4zW39R/bEoESuE3N9YDS3N4q2KsvdzBJBqugRv4CD62tMvapg0QBhVzvk9cs7kFON9yS9yJ7nlfayrAWvWHMy2MtQbWz709xpBMvKmDNufVAiLdFRITAtb9lFNNN+jZKNtFtddvuh4MnEupQaIlHCrD0yVGQhS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781456236; c=relaxed/simple;
	bh=aMgBCX8axpR/xGo2NX1aRg3kBHTbAUgdP8AE16JCLng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uk3scAA1LMFwAuMFrKnHWRlicE/h1a3C15rQ8R9xA4DzfEd4Vn5ggKe6Xj9JgqK6L3MULC2Q4Fzkfcn4iSUw3YTFB39OmwrwBMi/7PutpCOLTHUJfbWTaBmAKyVeOq6wITcXdrofL4tb9rlxEsQKpuzV0+VniQxoTNht5PJqHZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=muskLpMg; arc=none smtp.client-ip=209.85.214.169
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2c0c379e8ffso16388345ad.3
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 09:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781456235; x=1782061035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F116xATG0sy6t8QTRcaXDWApsr128oHT/pRvAL50PTs=;
        b=muskLpMgRo+iMp1TX5O/vGTtyRsyyR6k8Xrhe6LjXsJLypXqJDfMWzAnhlS3cf+jAW
         4hiKWCvsmxlpSk3ElmG2kwOYp4k7irvtbuAxRQQQxA5L9wm0DeAig+5zpfkGoUJFoags
         tiVEt/y/ZaaQGTyETWtDRuY6RE+rpJGrMzVJOLJchLM85PUUxwAfYkZ7SHhIwekSHWTf
         ZSwYYMroEL+nrW6zWjazehY0owYt8tFS+inwPBx4JWS8uudlPiQZfItRQe2Z70Q5tXaJ
         UBFzk5PJ8SZkN8R/eXXgLY/tjt1kLzkDnIm3MRqlX6YlX+E4vbjbPMgYrlFOEunmIlzo
         7Ohw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781456235; x=1782061035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F116xATG0sy6t8QTRcaXDWApsr128oHT/pRvAL50PTs=;
        b=GDf/DcRl45li+IbvqHaxFx6G3hqSSSj47DlXt6f0L+Diku5FWOjVMVMiNvSC2JjKhp
         Db/vRRq7jBbIqozIH+qRDjtMJsjMGNaQdFnQ9YN1fN3Nm268+f3HzZ3wj1oNCvbg9nrC
         ONWsbI8mg6uOXy8pDwbXqKAqp4Wo6ZjTU/uPZJPWb2c0nYIMoBOx/3hzpMj/FWGWG7zy
         SL8Epf93jqghr/HUsMPIkmhMoPuuGbJOibCrDuaCfGRQB8tBjHX+QxJZ7vA3+XXDtsTf
         scA5oKLThYv+chOdZBMcL4wiMMDNYH4bZxWqC+eV9OCpDqYkVvTuFypnM8WehaopcN15
         IC6Q==
X-Gm-Message-State: AOJu0YzeQxcHYFzVm/bmaMNwPfkYBCnBiDJI8khBKmu61gGppSEQgYBX
	QMDBOzmp6MzmKDlJtPuCXpZu7FGJ1XdKfuO86J/mZEp4mMDXuQi+KwhfCdStn7EP
X-Gm-Gg: Acq92OHmemKc0y4/Dmu9Od8OBpOMe4HVUtJilRnTdfPRQOIsAMmjA8U9zDzloqEbKRN
	p1u6HIvV9Geilnx+OaTmjdtWvA3vGtx+NRscfFGEMnP9S8sXfIr253gC247hgIwlIj8zK4MD0VB
	u5vMxeTLSwiaEWT5HvLPmSf85v0L2v9ablfs76doUYGF1mPfnM2j3KUwK34Sta2UVeLSSaSZBna
	fJwX/nMk0AhMgcyy8ySUma3UwPmgVpfxa0HT582KqxJ6+AwbwXg63Iv8pJGfsLHcfxb8aT+aJ5w
	jGSyOADLZeeQqQqbHDDeIIaKbMUZC0nJ3q1KIk0/Ic1gvC2W/fQfN1WqbOMp4AgSAxkoOhHEelP
	yJtaT4kSwQuwnqEG/6XIlhG/WwBK0Vrv2xsEId6WF99FYgOk7cC4j0vtfJINLUPNAZD0g1z9Z/4
	sYH4/Y1q/XLZLM3Tjwd65Xd3UuHpSb0UcuAxwtIGfgXfrjJB0Ujuxb
X-Received: by 2002:a17:902:ea04:b0:2c2:8659:da44 with SMTP id d9443c01a7336-2c6642355a3mr83616405ad.36.1781456235067;
        Sun, 14 Jun 2026 09:57:15 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e5590sm85284025ad.14.2026.06.14.09.57.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 09:57:14 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	Eugen Hristev <ehristev@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Jacopo Mondi <jacopo@jmondi.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/22] media: platform: microchip-isc-scaler: Add missing media_entity_cleanup()
Date: Sun, 14 Jun 2026 22:25:45 +0530
Message-ID: <20260614165630.3896-9-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260614165630.3896-1-birenpandya@gmail.com>
References: <20260614165630.3896-1-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,jmondi.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64814-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:birenpandya@gmail.com,m:ehristev@kernel.org,m:hverkuil@kernel.org,m:jacopo@jmondi.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6E518681A3F

Fixes: 920b2665f392 ("media: microchip: microchip-isc: prepare for media controller support")
Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/microchip/microchip-isc-scaler.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/platform/microchip/microchip-isc-scaler.c b/drivers/media/platform/microchip/microchip-isc-scaler.c
index e83463543e21..c368c66d9c8b 100644
--- a/drivers/media/platform/microchip/microchip-isc-scaler.c
+++ b/drivers/media/platform/microchip/microchip-isc-scaler.c
@@ -222,6 +222,7 @@ int isc_scaler_init(struct isc_device *isc)
 	ret = v4l2_device_register_subdev(&isc->v4l2_dev, &isc->scaler_sd);
 	if (ret < 0) {
 		dev_err(isc->dev, "scaler sd failed to register subdev\n");
+		media_entity_cleanup(&isc->scaler_sd.entity);
 		return ret;
 	}
 
@@ -229,6 +230,12 @@ int isc_scaler_init(struct isc_device *isc)
 }
 EXPORT_SYMBOL_GPL(isc_scaler_init);
 
+void isc_scaler_unregister(struct isc_device *isc)
+{
+	media_entity_cleanup(&isc->scaler_sd.entity);
+}
+EXPORT_SYMBOL_GPL(isc_scaler_unregister);
+
 int isc_scaler_link(struct isc_device *isc)
 {
 	int ret;
-- 
2.50.1 (Apple Git-155)


 drivers/media/platform/microchip/microchip-isc-base.c | 1 +
 drivers/media/platform/microchip/microchip-isc.h      | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/drivers/media/platform/microchip/microchip-isc-base.c
index a7cdc743fda7..27e180aff9a2 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -1949,6 +1949,7 @@ EXPORT_SYMBOL_GPL(isc_mc_init);
 
 void isc_mc_cleanup(struct isc_device *isc)
 {
+	isc_scaler_unregister(isc);
 	media_entity_cleanup(&isc->video_dev.entity);
 	media_device_cleanup(&isc->mdev);
 }
diff --git a/drivers/media/platform/microchip/microchip-isc.h b/drivers/media/platform/microchip/microchip-isc.h
index ad4e98a1dd8f..40a54d7d7e10 100644
--- a/drivers/media/platform/microchip/microchip-isc.h
+++ b/drivers/media/platform/microchip/microchip-isc.h
@@ -392,6 +392,7 @@ void microchip_isc_clk_cleanup(struct isc_device *isc);
 
 int isc_scaler_link(struct isc_device *isc);
 int isc_scaler_init(struct isc_device *isc);
+void isc_scaler_unregister(struct isc_device *isc);
 int isc_mc_init(struct isc_device *isc, u32 ver);
 void isc_mc_cleanup(struct isc_device *isc);
 
-- 
2.50.1 (Apple Git-155)


