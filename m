Return-Path: <linux-media+bounces-56429-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCcNFyiRvGlU0gIAu9opvQ
	(envelope-from <linux-media+bounces-56429-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 01:13:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE0B2D4692
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 01:13:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C99AB31D5AC9
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 00:10:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7207175A63;
	Fri, 20 Mar 2026 00:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PNFa2KsA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81159824A3
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 00:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773965408; cv=none; b=HyoDI/dUARzfktCZTpxBpVSDKEPkMbirG7eBqCVk72SfJEKeZ1R3jH06K0dkJ7tRoBKFzNod8adKclYO4bcc5AGeIsq4kDaVKb4PETt/7zRVHEwOBiSSYDY2YYUIfxhfXXM2FVtu9+/rn+oCAIdep8y24a8vldXA12AV2NQmDNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773965408; c=relaxed/simple;
	bh=wde4TF8CgNzn8si/JL9P12OCZloroRuFEPIxq/TcvgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TKH/98ffRpU8yY6IBKViJsn/yew+Ej38SQqlSYv3KJElHBQ6uTrrJlxIpPm2foDwEQwK5cOs+L//620FtGUVmtVZ6H3JP+ohmtI3VX2AhXJ4pYUdfrZZddcd/CUFWY3XqO05AdVcxzbeA7uIcKspTuFtNXzWu2KkCHuKMvZ6ZZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PNFa2KsA; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1279eced0b9so168969c88.0
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 17:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773965405; x=1774570205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TVHeDChmbK7H9JMCFb+9pqFytvxF0fdzrozCeGR4L7s=;
        b=PNFa2KsAuefw4vdeT0WGKNfO0QhJXFSjEvelmrVPgiCXb9ZTX7ZMvYF0hqiQpLmjXA
         kdH3VO7+cfrMpkvlFvt0qdtNitwvaFxPKV7igMbsb+mTO9dnrAK/mL9jcqmlnWLo4SIx
         6iYRQSxj6E1r9NT5uCPseuemLWO+zF4lYQqBLHMAXUaVI73C8fFjVkVc0oBt5p+k8ae3
         pan9EPvbZ62U9d0iygUeYdmg5Ee2pcHaAUQECB4AMwB9Zzu2oiQ/X3FsB2x56vffLedE
         AGkEEjLU8Zq0VGIqmy9UzzGOhJWWLKTe6p9gHPNkoJFRGCKvHsAZ15iinRKBRpMmHdzD
         2Wkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773965405; x=1774570205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TVHeDChmbK7H9JMCFb+9pqFytvxF0fdzrozCeGR4L7s=;
        b=i1ricrfc57Ywxv1wrvh01gOchk4Oo8+L9UsEY5RYWc4RiU79upFWp9spiGUWSJnxoj
         Zjt3yZuRjzlTalFqNz+pO7F/gGTEBMOFwklfdDWxJT9FvoAkhgKfVqqLjJFytXqMpuXE
         CFrl1ONY/3zO4TYK/OMLj+++9MCzSTeBs7ilSN7DnB0hZIWfpZIETVyrRT6I5bOj0mut
         xBDh864oSo1mJj/RX8UrO0HqmHQImVEk0V/IT6WJ3pPbfibdbagu3+Cc0DVmB2PdEHF/
         DXDuy30ckdH1YAaqiQFEi9NZNmqd04UIKjUakrDqqnog822WTbwzTbvHlf+3qhxMKdRf
         Q6dg==
X-Gm-Message-State: AOJu0Yyg5iYhASEAQrpx7/MdKWN6GV7H3tQYhy+pihmT7oZp3I1IpTdB
	rEWS1jKxH/2zBKdx+PPdwrZMZ1+pZcgHxsKXwG9DSuvGHapmQbnp7jap
X-Gm-Gg: ATEYQzzA2Fyqts9K9M2W4DWxxEc4WgI/k2jf/gmIXpLPt2J8tZz5gkwqP8P6agmjqou
	TzrVkwONeoBf490GIdyIYXK9s47Qby6UWdwFmNIeXzRsKpY41mIt27Z2YIYi2+QlU3n1gahc5wN
	syQacwOxEsKuf4H9fWMfd3L2LgA4I1yppgSFdmpYVS8ZSZAYc2+pmXZhRaWJXTBPuKTNaRCKJa7
	2qdvZ81qAfqAJWHxAT4p/TQfy8Db39M1nKr1dg7BmaWbZ3Unext50XSwm3gsPtY6UfsB1KiDUcu
	qxVdp8a9XvYsAecd3DjAP8hcRTVDKiVdY3MhGrS7qMTYvU+qkudqPg2l3my4HDkUc5oJrWZ/yj6
	XCgiSpR1YAsBz1zYMgmkSbOQzc5YWNelvTjAmj9roTA4l0mWKzQ1JduGYam1/IjywV1eeUPDuT+
	uv/xN8Uu67rlm/fx3w9VPVrS5np0XbLdG+
X-Received: by 2002:a05:7022:2216:b0:128:cf70:9042 with SMTP id a92af1059eb24-12a72691fdbmr635944c88.18.1773965404564;
        Thu, 19 Mar 2026 17:10:04 -0700 (PDT)
Received: from TC-LAPTOP.lan ([209.76.64.37])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b3253d0sm927960eec.29.2026.03.19.17.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 17:10:04 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	lee@kernel.org,
	djrscally@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH 4/5] media: ipu-bridge: add sensor configuration for OV8858 (INT3477)
Date: Thu, 19 Mar 2026 17:09:32 -0700
Message-ID: <20260320000937.9177-5-tchatard@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260320000937.9177-1-tchatard@gmail.com>
References: <20260320000937.9177-1-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linux.intel.com,ideasonboard.com,rothemail.net];
	TAGGED_FROM(0.00)[bounces-56429-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tchatard@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.926];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CFE0B2D4692
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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


