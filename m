Return-Path: <linux-media+bounces-64833-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id slk0LK7yLmqm6QQAu9opvQ
	(envelope-from <linux-media+bounces-64833-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 20:27:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFE3681E15
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 20:27:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="Qi/cRaT5";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64833-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-64833-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B646130028B4
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 18:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26F0D3955F1;
	Sun, 14 Jun 2026 18:27:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0071B78F3
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 18:27:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781461673; cv=none; b=RNSe3VWhEO1CwhnQ4/fH63As4OQuPovObeavVfleOMa3PKZ5o9SNvb7z+yaklDyyiTozc/zntbIdwF9CQ7xjy10dXAInRIX/waCnhPb6KzT7VtsQjAkg3loy99XEmyWzm0JJXTE4Z50jZ4N5iF8vgy02G+TN602JIbdwuIu21h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781461673; c=relaxed/simple;
	bh=yhbbjrVQWZ72m/RxLMMZRM7xXRT953TwNtuGpsS1UbI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VxgzcWoIdcgZk6bSwZg32y9nBqTssBaPGWBr7B2BX6xG3F1MrTcYRL66JBdEdE2b3m7N6S3f96Nb5ihBODEWCYHkSPWcWmNI2hKacqy163FBZa8TGVnBh36snG4mChExmeJN5Y0KHU2sPkzUMfj/MjdH1EJ5ev/u6v5yYDJD/pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qi/cRaT5; arc=none smtp.client-ip=209.85.214.177
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2c0c3543590so17530375ad.2
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 11:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781461672; x=1782066472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9SoTdLwxyOq3CasMYzATlm8eMMsWmmxEYv3g7Dp7PcI=;
        b=Qi/cRaT5NmqAcP+EGuDJeWgR4qOu8KTuPLVaq4jtFWkan8zov6MkrXECimucIICCFv
         ll5QJtfDD32F6tNQy0YlKUPbLUZmJ1IKqhMC3iHGXQ8fSqP3XI9uMYXP6+68bqNXNryr
         Fg88oZgh/I//aNYrPZ/rZVTzGk+6p9UtDGqDjFsOtfOvUYdlnN7f41r0Jk+KpL+h0hnZ
         PXlN+L7V1qleFUURjeb70bYT4mZWcw6xIbh/wyvjAV8FivsODQGNvMzFLTQqk9gdGSpf
         Q2fRGvxhilvN1JLteyqt7sc0Alf/tQ+gf8NmBJGUTc5fkKM3gMxNKub7flyErXf30C0n
         +9Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781461672; x=1782066472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9SoTdLwxyOq3CasMYzATlm8eMMsWmmxEYv3g7Dp7PcI=;
        b=W+27QeP3eRvS8iDFBxm1qal40rPPlC2WGczFiJw5NfmN8cZaDxwdPpx9IePxb2tfGE
         i/yz0FoRk7BNcYDxavDY5NLNOXVijpVTYtvgMS0EvwA6RfR3gIXI39Un54B62WBWPc2Y
         F51vGWUwltuBux+qVRcWMDqvLmGzTJPNZ0NHJS1b1+jNy+GDqiENPHk4mfBnmYgN+4/L
         lbd+AYOvxPsRfggYio2Y3mVIJUZrSEP6g+q92PBGLe/go2yfycX4ZO1XgwM9t8YFbqiA
         PSFrxrbKPBgeH8w44uVN4kjDdoovy3Cvlzxr7vHhxWLqCHy0Ntqa6pMSLSbQkZKafH/t
         kFGg==
X-Gm-Message-State: AOJu0YxB2HysXwqPsg5kH4Janwwy/ofaJ3uuDDCxYfut1js8axfkRYEf
	5dfdRS7gD4tjvqiSPT+3DPrceYVLcXgSFAGM7dTnwrtZu4RhIE8QMdBYxZH1Jye+
X-Gm-Gg: Acq92OFBswHUTlDcEgWS+MoHuSKj1CgDgZNgnxty0QDIVPv997CxUiRFMtHerboacCm
	zV3bJn10ZNzDUYk3O1rT1G4ztKzsRTj2RcdwwMdAgd/FcpeCMrkvf/McE4WvqyqhhkDs+P47HO6
	PpidmhEHaO7jVyLRjPH2Pwaa5E7qvbKgZ1HG3O5YSTZgGXUNcshuCkf/sZe7YJwWTkb2we8qVjr
	bzUdoD+Fs18DmXO5CdxSiGlcHxbXzbQTv8h5LodPLkY3hx3DlFW4FPjhekL3ysa2+yRHlyTebpP
	If9h0jLgX0PcM3rY8azAP2N2Ibv05RUzdgYYEzY+b4jLASGOq7q+XxoV68r0uke46taSc+KiAsV
	25D7nSWQu9pb9YTTIsC/a++/OikrRKTqVvg9CI8UaC8bk8hM6bFLBHrjFdDrJuw2WFH+5j618tT
	1RMteJ87tmv0ocy8cXEeQVjxsDZONkOpFj2yUpBBtArazJxkUgA/NM
X-Received: by 2002:a17:903:198b:b0:2c0:a3dd:4e76 with SMTP id d9443c01a7336-2c4137e55f0mr119599895ad.28.1781461671993;
        Sun, 14 Jun 2026 11:27:51 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e5369sm79161335ad.9.2026.06.14.11.27.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 11:27:51 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	Eugen Hristev <ehristev@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v2 08/22] media: platform: microchip-isc-scaler: Add missing media_entity_cleanup()
Date: Sun, 14 Jun 2026 23:57:04 +0530
Message-ID: <20260614182714.7999-2-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260614182714.7999-1-birenpandya@gmail.com>
References: <20260614182714.7999-1-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,jmondi.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-64833-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:birenpandya@gmail.com,m:ehristev@kernel.org,m:mchehab@kernel.org,m:hverkuil@kernel.org,m:jacopo@jmondi.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4FFE3681E15

Fixes: 920b2665f392 ("media: microchip: microchip-isc: prepare for media controller support")
The media_entity_pads_init() (or media_entity_init()) function initializes
the media entity, but the driver forgets to call media_entity_cleanup()
in the error paths and remove function. Add the missing calls to fix the
API violation and prevent potential future memory leaks.

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


