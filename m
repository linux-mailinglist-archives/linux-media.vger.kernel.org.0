Return-Path: <linux-media+bounces-59576-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFWPFShO7GnIXAAAu9opvQ
	(envelope-from <linux-media+bounces-59576-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 07:16:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EB9465022
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 07:16:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 16F5D30305F1
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 05:14:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7777228725B;
	Sat, 25 Apr 2026 05:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bE0tNSjI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A53287246
	for <linux-media@vger.kernel.org>; Sat, 25 Apr 2026 05:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777094060; cv=none; b=Wxf7lmoYglSd+ApM9/T9+pR8aXoQxcICxJKnGB0JNPc7VcmB0LQFjehLK8dIcZWrtDjlN01EALj8O9q0qoz6kalYO6MaxEtxOhPoqB6KKlscsNkWcunVN5GynV2LmE0BqOb9rQ2JE7vLW4SmzE7UUErolmnwsfR7gwpMHo1r7DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777094060; c=relaxed/simple;
	bh=wde4TF8CgNzn8si/JL9P12OCZloroRuFEPIxq/TcvgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tm7DesRXKU9Ho7RM4HrEDRcEPyb0SYD7LI2dANDi0/yVw4EYx2/ZMZN8T35JjRW5Rh+TirK83oTz+RbHx9q49x+Yt+gcAR/lQ+UAc4szkpPUXRaYHBcunjQY/mf3IQ/a46NvgIrTH5EYYHHsYYwKedlgBIFUKlqJQkYyNT6JCzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bE0tNSjI; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2d891442388so14402871eec.0
        for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 22:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777094059; x=1777698859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TVHeDChmbK7H9JMCFb+9pqFytvxF0fdzrozCeGR4L7s=;
        b=bE0tNSjIQLjK1jV8fqg0eFzXobNvnWukshZl0P2CgeIyKQw0p/pFWMx1EGztGbcZWj
         TIIzm9yUdYxWC5y2YEXtvOcJNzFT3pblMeVPdbcI4vgTOewuMS5oRLiy0dBi031Jgfb7
         lVaPDd0t5BD25OKsxcvbCEfshlLnQrQCU6mZD08bDKvLPk2X6/J21gogQfQk6oG7gCCg
         1Tichz2/rSdIGLz0RYVUmdPncSubhAtj0TCoE0SBxGnt1UwldiEKcNkZhQor04Ja2KQN
         0Izx1KgNePPFemfZHZYY8a24RTQAxuNm8odZBAwhao/Tr0JhxZj5D2cW7RLed3j8fQYq
         sP5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777094059; x=1777698859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TVHeDChmbK7H9JMCFb+9pqFytvxF0fdzrozCeGR4L7s=;
        b=DCAzBGkqQl8OaDxZ/hWExxTkSwgWJqAemUTbkxFN4bJwzgV3t/c3FqKBHnY+2TrDbw
         TVdAV2ScHC1dKJ3uVfV2QwuyGEVHfEynD07aTFsqljN5f3992dT/RDw9U3lm/X5J91+F
         k1Kx/oBUW2kHYFSRcDWM7vgWi+MObmWWaSPGd9000JouAd3KAzg3LEEPvFRaYe8uWsLd
         8iHpiqY0OBjjPvIT7XuUzbUzw5DZnr3Uv/nW2VM7DULehbVgTpnWQuR+8ZBHybTUdS6E
         ne4MEsAIeuci67GGGTMSarKGSM47e11QwRpmwdnjJxUNB0T2IwKqHDzCHeeh++oy6GV7
         rn5g==
X-Forwarded-Encrypted: i=1; AFNElJ9JoHabat6piU2Sm10nKDBoYUuQTR7APL0ngLlsNCfhfDf5SQyBB6Ak/zhXMntAmwoi4jJz+OAKQhOVfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfm7+Xk04xKqkU0gWUfdnaEyF4TzONsAWM7Sbf8z16o+Q3Ux3X
	+K+M9xJ/Uqrtioa08lhzhePW7iOozvWBnwDL17C/ezYeZK7v5fByjaeu
X-Gm-Gg: AeBDievlFhRXFzN2i4UutjDczGHNkxxPdMCOvKI9fmAvt7ZEsVdODBGaltBJMGjVHu8
	yCgQj4KeCOJPqZQGoG8ZJ3FePk2oe6XnYpo0+U3w7omhpd2V3zH/ZhPeztdCq38qJwjC8bk3Mnq
	ihDGGFWC78Mpm/M7iZ4I4jfUIFGuE2sjGiK9v1WHL+4wTGLxJeCPJcZZP19e52Pxs/9ah98Xs5w
	j0pkXO7hTYzy10JvGzizlCI6EhK0GnH7KXk+CqWbXHltmWLs4mFOHf/f3hE3H6x6kkHuGMc97Ys
	mmZRDJuC8rCTuN9MyIHEg09oRptqtA6J2pSjo88d+epfYeDfz8yjfjuCDdyPZVk822sFBHNGkzW
	oDd7GoMJm0nNbewat3JW0YhO2AAxWxGKF+VUzkSK/l/ll5CL1uhq9dAscFIgTlE+lMSi/X4Vtgg
	efmP7JJEUGpEwOVGIL3WkKpR+xMYX1tWl95Q==
X-Received: by 2002:a05:7300:bc97:b0:2de:6fac:f666 with SMTP id 5a478bee46e88-2e4792151e8mr20448732eec.27.1777094058926;
        Fri, 24 Apr 2026 22:14:18 -0700 (PDT)
Received: from TC-LAPTOP.lan ([66.142.131.45])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ac84c38sm35973806eec.13.2026.04.24.22.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 22:14:18 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: hansg@kernel.org,
	lee@kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v5 4/5] media: ipu-bridge: add sensor configuration for OV8858 (INT3477)
Date: Fri, 24 Apr 2026 22:13:41 -0700
Message-ID: <20260425051342.8960-5-tchatard@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260425051342.8960-1-tchatard@gmail.com>
References: <aehzn85IsUI-bcKW@kekkonen.localdomain>
 <20260425051342.8960-1-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A3EB9465022
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,linux.intel.com,gmail.com,ideasonboard.com,rothemail.net];
	TAGGED_FROM(0.00)[bounces-59576-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tchatard@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

The Omnivision OV8858 is used as the rear camera in several Intel
IPU3-based devices (e.g. Dell Latitude 5285 2-in-1). Its ACPI HID is
INT3477. Add a sensor configuration entry with a link frequency of
360 MHz to allow ipu_bridge to create the firmware node for this sensor.

Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index fc6608e33..f51749d0f 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -63,6 +63,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("INT33F0", 1, 384000000),
 	/* Omnivision OV2740 */
 	IPU_SENSOR_CONFIG("INT3474", 1, 180000000),
+	/* Omnivision OV8858 */
+	IPU_SENSOR_CONFIG("INT3477", 1, 360000000),
 	/* Omnivision OV5670 */
 	IPU_SENSOR_CONFIG("INT3479", 1, 422400000),
 	/* Omnivision OV8865 */
-- 
2.51.0


