Return-Path: <linux-media+bounces-64821-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8LDNIM/eLmrU5QQAu9opvQ
	(envelope-from <linux-media+bounces-64821-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 19:03:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA59681AE0
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 19:03:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="KO/UfW7B";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64821-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64821-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A99933044F01
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 16:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB0113CAA53;
	Sun, 14 Jun 2026 16:57:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F5039A045
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 16:57:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781456272; cv=none; b=opUDzINBsMX3LP7bkP34GXSprIvR6n+6R9ET6oGYH8UKPMV1Sl4NAGsqD+s5Zip3UZlN0EjASf6CxOSsOME6eAZbMlEc9eWAXnCe0fF+c/qPl3+Uw47+xxKFxxbzEXBgBQ5nB0qtMUhnyFBD6twxw6sIcq6gruuVQYnQMwfVVVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781456272; c=relaxed/simple;
	bh=TKAhuQzADQmd45vSNfhAJB3pNZ0xH/OI34dYUFf2eZk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hQ3t321Y5CBAw9MKR+2u3g+Yi3SwEKpdyGXOar0Nu/cOEXYU+ihbZzCT/5IzbD+I2R2y85Vmep8rfsqaeofa3XL8q5mkcTTkmGCP8xj2XUFJZf9lg17SdzwqfwPel9U8IVnQe+cLvpbf23SYhR7wpXSCY8/UchcHEn0AJfWW2Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KO/UfW7B; arc=none smtp.client-ip=209.85.214.169
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2bf237e1433so30953645ad.1
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 09:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781456270; x=1782061070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=12MSNokFaabh4fDmOIWwIlWEtszIMUGKPbC8mGYEmNw=;
        b=KO/UfW7B/xZER5U9efiy4RVI3sUzGrDIZgPB3vxIl6sSPTxqYdXYkftKQSmmkfjMV4
         t1R7hRF2EvCg4M41jLcqTJQHPcTeU9YpIP9tvscB9aZXTHLxttyp9pYYp967BiIlvDRA
         4sSdmOgVRMwImJ3H5pYKrEymmA0KL+6kHZXObPqbWRI0e590LWmSxchv6JsEA9yPiHQz
         t7dCCejepJOt45hRxzblwGTCjqGm6RiVHyb/hBXhs6i8Ga2g/Kn4/U/19SywiiZw+ycr
         ctBM/eTgf6LU8dXxdZkhgfKgQuFduCkPRBzQigDZi2ch5mQuXIebUCpJBT60D8kymA/b
         RQYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781456270; x=1782061070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=12MSNokFaabh4fDmOIWwIlWEtszIMUGKPbC8mGYEmNw=;
        b=K6+/EIdR5qvWp9rXA+2Kxutv1jLeu0/LrRJLEMTmV+BIjSQof8fRoE/kmmLd2ZO4Co
         ZxLX99kyGaaiO3ap6TSzoQm+mu2RO/DRR35ZHc9MeFb63WfplNBgC16bChB7s4sHFzYR
         aVvgmA/IOmapcdDzSnUFJ4NqwWQIAslb0TGbm97RIJvFUorC/i/avw5llM3piZrbprX6
         G5m+gimYQiMeshtIeQZmJw5A/dZ+SyHnKlQ6cPZZS66OPKsO06XZ9trOYKvzidriaLWD
         2MRyrGX8sT6eaGRsDzFN3bipSM6dqwBeCiWVtf0S/GhTQ9q5dbNIOfZgRXWsreFORAaR
         xYig==
X-Gm-Message-State: AOJu0Yw/QANaVadZY7ZO1vyM0M8L6PloWbqosNAzzrKG99iwKDS9DjdA
	FJOfFLLpAYDAtj4RIZcs650Rrdj56dgiSEf8y7sud+u76KMBf+mn6R7EDOsmLop4
X-Gm-Gg: Acq92OEyYA9XrhR3/G26YkBTA/AArH2wOvcw0+Kb3BxCzCfKzGA6TdxJ7VlHAqRByg2
	mv0XLEBG8KphZ7hmAfbTMhfRNWAonxXbbObDzo5UozMPyCSQG1pzco332zgQ/KhhG0SZlYCiLbq
	77zXMHWxBAdYtMV9tcXzAyEtP4PwEbma6pGmKBCtYppj5woS/0lw5IbLDJJvFFvIZjwv9ZkOBwd
	Vb8WjoC8AG/62zjYrkDYlkNMVbExrc0qupmx2DT3jan7aVhVdW3MP3LW2X056W/V2EvnfAOimWq
	actWr3YWlw9Da90BILJJS3pNyW+9et0MR4ZqwV1v51Kx8M63sD18A2OGHkqefTK/hLaq9kduAAx
	9I9mupxP0Jh/uzlnyWSIi+2F8VOxJs7F45ol22hnrIFQORxq7pAOQ9y6n2zEBrY6uksn3ChmEAx
	vwaDLYvCFk2D3hKGpxsoNlWSAHh9/x8T0qCoFO/HjhBZl2TJg5qlu6dxCUHNjgofc=
X-Received: by 2002:a17:902:e750:b0:2c1:e04d:7cb5 with SMTP id d9443c01a7336-2c412841372mr129707285ad.34.1781456270599;
        Sun, 14 Jun 2026 09:57:50 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e5590sm85284025ad.14.2026.06.14.09.57.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 09:57:50 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	Jai Luthra <jai.luthra@linux.dev>,
	Hans Verkuil <hverkuil@kernel.org>,
	Vaishnav Achath <vaishnav.a@ti.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Pratyush Yadav <p.yadav@ti.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 15/22] media: platform: j721e-csi2rx: Add missing media_entity_cleanup()
Date: Sun, 14 Jun 2026 22:25:52 +0530
Message-ID: <20260614165630.3896-16-birenpandya@gmail.com>
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
	FREEMAIL_CC(0.00)[gmail.com,linux.dev,kernel.org,ti.com,linux.intel.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64821-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:birenpandya@gmail.com,m:jai.luthra@linux.dev,m:hverkuil@kernel.org,m:vaishnav.a@ti.com,m:sakari.ailus@linux.intel.com,m:p.yadav@ti.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1CA59681AE0

Fixes: b4a3d877dc92 ("media: ti: Add CSI2RX support for J721E")
Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index b75aa363d1bf..b88e3ac3dac8 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -1079,13 +1079,16 @@ static int ti_csi2rx_v4l2_init(struct ti_csi2rx_dev *csi)
 	csi->v4l2_dev.mdev = mdev;
 
 	ret = v4l2_device_register(csi->dev, &csi->v4l2_dev);
-	if (ret)
+	if (ret) {
+		media_entity_cleanup(&csi->vdev.entity);
 		return ret;
+	}
 
 	ret = media_device_register(mdev);
 	if (ret) {
 		v4l2_device_unregister(&csi->v4l2_dev);
 		media_device_cleanup(mdev);
+		media_entity_cleanup(&csi->vdev.entity);
 		return ret;
 	}
 
@@ -1105,6 +1108,7 @@ static void ti_csi2rx_cleanup_v4l2(struct ti_csi2rx_dev *csi)
 	media_device_unregister(&csi->mdev);
 	v4l2_device_unregister(&csi->v4l2_dev);
 	media_device_cleanup(&csi->mdev);
+	media_entity_cleanup(&csi->vdev.entity);
 }
 
 static void ti_csi2rx_cleanup_subdev(struct ti_csi2rx_dev *csi)
-- 
2.50.1 (Apple Git-155)


