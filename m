Return-Path: <linux-media+bounces-53497-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Jf/J7JMoGnvhwQAu9opvQ
	(envelope-from <linux-media+bounces-53497-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 14:37:54 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB271A6B4E
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 14:37:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DE87630054F4
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 13:37:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A33AD3624B0;
	Thu, 26 Feb 2026 13:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g+DCrr0l"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E452D7DF5
	for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 13:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772113070; cv=none; b=fYKeSbnio+GlC/Buiw5qC4nraRItZdmGRi8pfybg7FvWnckv+LKoz/Ld9TjmhmhjztmBE6n5MG8DMCejHqmzFBhPdahNWX4imzaOmFfQREDZc4pGEB2YIMhYkPMaIy0SjNU7llQ1X62Pz4TOE8OZTT5sLODmlxND2A/7oa7pxKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772113070; c=relaxed/simple;
	bh=p+20JonP0Jy4y4F2rw2k80AIapVHWSMYxBvIXvPHD5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=paWfp+Hj/Zlo8LGIbMg/zS2s8O7j6MmgjZLPEdzDdAItH1BuIL3wa5YPFyF5b5WNvrpZEcuaVxSB6jm7p4l6+1ggJFnjtwdr0Y3Jf71tCqCpRYLAhTN90vn8MBvxDOEAvX3OHwwrxbodOlyLCisTentELQjv1+dIhFtIDc4PVio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g+DCrr0l; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a1061de37aso138312e87.3
        for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 05:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772113067; x=1772717867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iw3xh5/u1uovEVZwechfiDHXRbe6U3bjxS4DqnPgahw=;
        b=g+DCrr0loD16gQEtixB5OOfT6Pn42bc/pn87hyN/vi5k+p1gWWA9U303KRXP5CBNjh
         BwUkdroKvCaqK54N2fKsCaEPlIMaHPbYlml9rDe5I6Ipec5VJlQSWTdn7GmrCeL7ZjVl
         +t0GUiTIALz8IcD4Gdsj7GGvdmncCvuDOOIHUV++1leR0gcqlHUB1R/Yyex6rh1tYRJX
         j3MU+lF7bXBh8YOAvKux2gBC2lHp8MZh4tnDfIJSDrC16Q+3sOU3UrHukcCe5rn/jyc3
         Y++UqCQQ86xzzJ4XYtf730W0VpAuZ6e1y2LQIzHYQTNvpfEcUrIz+82O9uRM2s9Ri5eb
         ORGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772113067; x=1772717867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iw3xh5/u1uovEVZwechfiDHXRbe6U3bjxS4DqnPgahw=;
        b=xJMSKMRd5ioGd30vQOdW9ecLV2QJuk9e7ZiLicZ04QxGSw+S/jWS9wz9Kkqz3qTya3
         GNdthpLDrBVWwfsaCUcL53IdAsclJ1A+8EJAq0RQziw7PC6azFXtolxyIQD0yXCQvAbo
         q+8ne4SiAnH47R9Uf5z4pk8edeDizem5lbFRzF1NKl1dP/FP+F4GpeCeI5n1WrNnlEm2
         7fpEeB/aRAmgD7s4lneDhVV/9OsowDrxc9VxJd2EQrm5K7w3jcgN+ky7UJx/o1FlYaSj
         XNHp18B5NVZNmkuyv0bzn/D4zMtGbcV+E7YYS/FKlFWUT3H2SEzKAIG2IRuKaIj9nbv1
         5Bqg==
X-Forwarded-Encrypted: i=1; AJvYcCUyGkWaypyrq2gCq6D6KyJYd2Ec85HqsRjxElVsaggnHRRmtLO2iEYStLnPFwTI89rgHBZxWJWe9lWFxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHkhvl5hjRR2Y8v/9QcNpmNaSAvATWZiqk83qwnVjstGuruZ5T
	egTAyX6hk1RFpNK6FViE7G33TSfSfxI+Shb88Rx4ooCXN8+lsuniYqY0fWP4T2OpQLs=
X-Gm-Gg: ATEYQzx5DqTKpkEDpt7DLKR4kbNNRRnOZgVJCDuX5lz3UTrkzMxZtwdNquJG1CgU4vY
	X0nzBI02C2aW09g4lqhI/2em7468nf5Sra5eHpxQWGSig2DJG5UL+pXx+lD1Wmbec1Q8nn6ltL3
	DM646OCA2LRx+sEqOSw7lclKPeZ86rK1A5ubc422uXN3qUJCOobT0iPii50Wp0CPblnNmZu1JPf
	quLu8L18hTioHXyDU5Dw64sBBb1iwWgIsozWVMh6aT4GN6yn+7auBTp/HzLUiuJXR0MFpruJcJZ
	gcnySln01H3RTUtrhWW0+tEHoSlcrr5SIb82/hpZhvv4dtZm/1TdMpDjltynGGb8jA2KYI7bB1J
	KQX2bH/annRtYBQruueZxwIsUilR1KOOLooF/ka1YjTMC1Mh0wsEhV/zjApO+F6EtrAI/xwNoFP
	B6iL9JE+4x/Dcxi+89Edn++lKtxZ5jI6rnRIMV/AeAHEW3dxVi99d0frL8k4Wjkd5oOQ==
X-Received: by 2002:ac2:4bc8:0:b0:5a1:e9c:5d59 with SMTP id 2adb3069b0e04-5a10e9c5f52mr72034e87.1.1772113066900;
        Thu, 26 Feb 2026 05:37:46 -0800 (PST)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f302292bsm6572041fa.45.2026.02.26.05.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 05:37:46 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Shawn Tu <shawnx.tu@intel.com>,
	linux-media@vger.kernel.org
Subject: [PATCH 1/6] media: i2c: og01a1b: Fix V4L2 subdevice data initialization on probe
Date: Thu, 26 Feb 2026 15:37:34 +0200
Message-ID: <20260226133739.4050870-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260226133739.4050870-1-vladimir.zapolskiy@linaro.org>
References: <20260226133739.4050870-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53497-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,linaro.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3EB271A6B4E
X-Rspamd-Action: no action

It's necessary to finalize the camera sensor subdevice initialization on
driver probe and clean V4L2 subdevice data up on error paths and driver
removal.

The change fixes a previously reported by v4l2-compliance issue of
the failed VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT test:

  fail: v4l2-test-controls.cpp(1104): subscribe event for control 'User Controls' failed

Fixes: 472377febf84 ("media: Add a driver for the og01a1b camera sensor")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/i2c/og01a1b.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/og01a1b.c b/drivers/media/i2c/og01a1b.c
index c7184de6251a..7b892b26203c 100644
--- a/drivers/media/i2c/og01a1b.c
+++ b/drivers/media/i2c/og01a1b.c
@@ -1042,6 +1042,7 @@ static void og01a1b_remove(struct i2c_client *client)
 	struct og01a1b *og01a1b = to_og01a1b(sd);
 
 	v4l2_async_unregister_subdev(sd);
+	v4l2_subdev_cleanup(&og01a1b->sd);
 	media_entity_cleanup(&sd->entity);
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
 	pm_runtime_disable(og01a1b->dev);
@@ -1153,11 +1154,18 @@ static int og01a1b_probe(struct i2c_client *client)
 		goto probe_error_v4l2_ctrl_handler_free;
 	}
 
+	ret = v4l2_subdev_init_finalize(&og01a1b->sd);
+	if (ret < 0) {
+		dev_err_probe(og01a1b->dev, ret,
+			      "failed to finalize subdevice init\n");
+		goto probe_error_media_entity_cleanup;
+	}
+
 	ret = v4l2_async_register_subdev_sensor(&og01a1b->sd);
 	if (ret < 0) {
 		dev_err(og01a1b->dev, "failed to register V4L2 subdev: %d",
 			ret);
-		goto probe_error_media_entity_cleanup;
+		goto probe_error_v4l2_subdev_cleanup;
 	}
 
 	/* Enable runtime PM and turn off the device */
@@ -1167,6 +1175,9 @@ static int og01a1b_probe(struct i2c_client *client)
 
 	return 0;
 
+probe_error_v4l2_subdev_cleanup:
+	v4l2_subdev_cleanup(&og01a1b->sd);
+
 probe_error_media_entity_cleanup:
 	media_entity_cleanup(&og01a1b->sd.entity);
 
-- 
2.49.0


