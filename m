Return-Path: <linux-media+bounces-64340-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KHLuB1+gKGquGwMAu9opvQ
	(envelope-from <linux-media+bounces-64340-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 01:23:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F90664C42
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 01:23:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=rq0DEHZQ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64340-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-64340-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 006AE300F783
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2026 23:23:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 716D0375F9E;
	Tue,  9 Jun 2026 23:23:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E76530C629
	for <linux-media@vger.kernel.org>; Tue,  9 Jun 2026 23:23:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781047381; cv=none; b=SzE5koZqbk81g3iYQ0nuVGf10Kv2r0gY05fENYrNyYPZJWnnFmt8LJcIE7qCsGmduW7Yf3o+EyJKYFyyZ2J7Sscylah4RAWY1Ac/R0JLz6CIKgvZmrEwaaOIoU4nJIlDdJ0BZmlFZmgIxxHGx7+8YdYI80TV1CUySWExNziMrN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781047381; c=relaxed/simple;
	bh=szrL5mj9tdq582KuGMr0rnMjPnleP7obgnXGMJNviCk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aLxdYmoe+dGSz/fw1Spym+FYVCYYX6RkTR3cbZbOpZgM19CcwgiFf5dEzxwz/+TyV4Z1YPmWfR9VZyTA+OuhB4r6SG2plSfbUelQF/2RtZuuHmt8YB00S4ED6p1t6KkB6Wjx997704hV0+xrwsJxWY0qYPdzUsAvo86XBr9iX0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rq0DEHZQ; arc=none smtp.client-ip=209.85.221.49
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-460166910e6so3165056f8f.2
        for <linux-media@vger.kernel.org>; Tue, 09 Jun 2026 16:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781047379; x=1781652179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G4fcUh6qnvmVQlhVPaVQSAbftani1jbO5uAmtO5ohYE=;
        b=rq0DEHZQFD0mZl4aqa+5u8EEr34874U0bLTLAmG7hBxzym83ihLYzR5K8owt9b5iAz
         vKfoAEyZoz1VeNJo0UTiy6qHTABY+KlKL60SrtIkc2QmI7MFEJwh/7bHfwhEY7IM2gzw
         y4E4X07Bo+pd96giiiFSFvir5n3l2744Upnt9jRWPrGMjP8qo7xhEla0int0x1NwNBvI
         CccQjIQADtRIVnMjRSnEYQcEutGsRPmMS6QSONoJXSpHR/sVO3NywHPm4AdJNfy3fzNX
         Q/zg3GSqp4/qU/Gee5ORbtCTPsZBQlLWiFSgGh7n4EF6N5z6WIh/5vZ9pQFqXoy6a0ij
         71jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781047379; x=1781652179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G4fcUh6qnvmVQlhVPaVQSAbftani1jbO5uAmtO5ohYE=;
        b=Kp8sW6sBUNEOO/dL5Xgo2pSBwVWsiGWYD2OQaIw9Ge8iWyDNak5jMHAhG2OtRJ+sdM
         9G4NDdkkUcZdFcvak1v+BDgZhsGs6M8rRKq7mkDjTndGuuVHRwp+rlkH7EhGGEhBPu4m
         7ugEYLW+/EnCb0NMnwN8tBOXC2vfawyAuX84VH0CEiexGZJtWKgos26Rbx+M1tMGQ1AC
         NTEYaZEBJbtBG4lrIxx7j5zEtud4tugbv8xi8pzDhAr6F+ePy2dtifAPoVEZPltwnfOC
         2ZAP4PaIDYa9+A0BX0jzEP7irTra3kXsPVno7nzRod5YdZxdUFWaIsnzD8w6T0qL0EpY
         mlfg==
X-Forwarded-Encrypted: i=1; AFNElJ8LPUd3S5pr3MaGMAFOJTT3FNONQjYUyfgycYDtCUYjS8g/Y7J7m1Cq5K159JvvqnY0ODRPnLk+T+q3Fg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyalscwakbvJM0ZIjLoPw47umb3jSncHAx8D1a0X/YsEMUToDW
	saBhXbWW4EG3FRax/pbn6/m+Sq7En0/lQ5tf6yr875EzF5cMotmAyjwT
X-Gm-Gg: Acq92OEIMJj8xqj4+/4Cs0H9SlTk0ZxyxYfaL5t5qY9hMtMCG+UW3ryg6wg8pxGM1Se
	ydV29BNYtrGrmumoD3jufYiIvhrkeTXuNYSEYrg7fdNpfLOUpsKo4JwXs0ry6YvtrsQUq3Y5rpu
	4PGPdHrvpaFPNJ2ktiAP7tzZh/ZvXrQffD8Wc9E2MdrqjrHLx/b9hxFGX2+W/ovjwHs5kV+fpI7
	x4QBd3X4o2C1ssoDUXYZbpJPbHDHESkhFVn2gEGbj10Jp+4Nf4fKl/yZodSz/Mq2FfPYsOCi7e8
	G8LoYBTM89xGDaxQvbhdpAYgQLed56BS1QjF9SN5kVkKhvZZ9/6GxwlRLvC+XC0OaCVHX1QPVFo
	tMWFrtvUaZ7RhUh9e4LAeTI3OACk7KZAGnhasB/Zz9EUCmToTFjn/fFNHJJ7Vv4ZwnjDaSIjeGh
	apUK1r0B34ug9hwKHztRVzGYj6rD2cVVd3fA6ReYTp9IVididlvGjRPl8X/yfpVIh4DNV/CXFfA
	XMJn+Z+sVNwB84=
X-Received: by 2002:a5d:4c45:0:b0:43c:f52b:8003 with SMTP id ffacd0b85a97d-4603063a18amr26277785f8f.36.1781047378683;
        Tue, 09 Jun 2026 16:22:58 -0700 (PDT)
Received: from garuda ([79.106.123.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2f2710sm51994747f8f.14.2026.06.09.16.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 16:22:57 -0700 (PDT)
From: Jurison Murati <eng.juri@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 1/2] media: i2c: ov8865: Program the mode on stream start if needed
Date: Wed, 10 Jun 2026 01:22:54 +0200
Message-ID: <20260609232255.13559-1-eng.juri@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:dan.scally@ideasonboard.com,m:hansg@kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[engjuri@gmail.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-64340-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[engjuri@gmail.com,linux-media@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 12F90664C42

The sensor registers are only written in the runtime PM resume
handler; ov8865_set_fmt() merely stores the requested mode, relying on
the sensor being runtime suspended between uses so that the next
resume applies it.

That assumption breaks when something keeps the sensor powered. On
IPU3 platforms, ipu_bridge instantiates the VCM device with a
DL_FLAG_PM_RUNTIME device link to the sensor, so a userspace process
holding the VCM subdev open (e.g. wireplumber's camera monitor) pins
the sensor runtime-active. A subsequent set_fmt() then never reaches
the hardware: the sensor keeps streaming the mode programmed on the
last resume while the CSI-2 receiver expects the newly negotiated
format.

On a Surface Book 2 (IPU3, ov8865 + dw9719 VCM), requesting the
3264x2448 mode while the hardware was left programmed for the
1632x1224 binned mode makes ipu3-cio2 report "frame sync error" and
"payload length is 10340352, received 2585088" (exactly one binned
frame) for every frame, and the inverse case stalls the stream after
a single frame. Camera applications end up displaying one bogus frame
forever.

Track the mode actually programmed into the hardware, invalidate it
when the sensor is powered off, and reprogram the sensor on stream
start whenever it does not match the negotiated mode, re-applying the
control values afterwards.

Signed-off-by: Jurison Murati <eng.juri@gmail.com>
---
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -670,6 +670,10 @@
 	const struct ov8865_mode *mode;
 	u32 mbus_code;
 
+	/* Mode currently programmed into the hardware, NULL when unpowered. */
+	const struct ov8865_mode *hw_mode;
+	u32 hw_mbus_code;
+
 	bool streaming;
 };
 
@@ -2383,6 +2387,9 @@
 		return ret;
 	}
 
+	sensor->state.hw_mode = sensor->state.mode;
+	sensor->state.hw_mbus_code = sensor->state.mbus_code;
+
 	return 0;
 }
 
@@ -2618,6 +2625,25 @@
 	}
 
 	mutex_lock(&sensor->mutex);
+
+	/*
+	 * If something else kept the sensor powered (e.g. the VCM's PM
+	 * device link holding it active), runtime resume did not run when
+	 * streaming was requested and the hardware may still be programmed
+	 * for a previous mode. Reprogram it to match the current state.
+	 */
+	if (enable && (state->hw_mode != state->mode ||
+		       state->hw_mbus_code != state->mbus_code)) {
+		ret = ov8865_sensor_init(sensor);
+		if (!ret)
+			ret = __v4l2_ctrl_handler_setup(&sensor->ctrls.handler);
+		if (ret) {
+			mutex_unlock(&sensor->mutex);
+			pm_runtime_put(sensor->dev);
+			return ret;
+		}
+	}
+
 	ret = ov8865_sw_standby(sensor, !enable);
 	mutex_unlock(&sensor->mutex);
 
@@ -2895,6 +2921,8 @@
 	ret = ov8865_sensor_power(sensor, false);
 	if (ret)
 		ov8865_sw_standby(sensor, false);
+	else
+		state->hw_mode = NULL;
 
 complete:
 	mutex_unlock(&sensor->mutex);
-- 
2.49.0

