Return-Path: <linux-media+bounces-61987-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIotHoQLC2pN/gQAu9opvQ
	(envelope-from <linux-media+bounces-61987-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 14:52:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF97B56D0E2
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 14:52:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10DF13044A76
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 12:50:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1844244102B;
	Mon, 18 May 2026 12:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hnvsPi1I"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6240343CEEA
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 12:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779108605; cv=none; b=N/tp1PgwqMDvjcdgmjaDSf7QHZMoQ3S5r9/IotbKulKdH6c2hcM9dDNdrWZE2WKU4F64BsGROiGDGbcZAeCwnWepumq3pjoD2yQouB+6BtVxIeOZ2K9JjSl2wA0f9+z3TduVY5vmElI2SmXnNbpLy3wgadoInCtbmHfxWZom05E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779108605; c=relaxed/simple;
	bh=hnhjwsGDmLy5hoDXIQt5+VDD6x50FSd8ahg1XH5JUCU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E052SSSDTZycVbfdrqGmvC73UX6xR2IuD4L6gsUWf808uICgot/Ng6CUbR779sAsTUzS2ywbQfCJOH/0J5AMpNeF8XLskaXpcPR0r+vkPP64sdgIwgtYJ8v/yCM98vEYSH4+ZxyYdm0i4oUqjoEspaB/aUo2dy81eJyF9xWfOGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hnvsPi1I; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ba17c8cfacso22119755ad.2
        for <linux-media@vger.kernel.org>; Mon, 18 May 2026 05:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779108604; x=1779713404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+kR1uWbklt4iMogl7XGhEDFycrnSG5eLMhDf2zVjKyM=;
        b=hnvsPi1IPhV154Z+jw1nQDRs+/UMlYhYvV1HU5y781I0d4cDwE/p80Qwowuvq8dSDX
         v+K9gka5/bGb1YJUTwkeDuseLiXtlLMuP+umTphX5gIIG88Q5osJkVC2ZKPt2m7Fwq4J
         mtFQbBxDeuuAwOzMbs3BF+5ARBn8Qlzqd8ze2ZQYs7vbuw36NLNtPoea5PBtRDX4ru68
         QlEAmetKVpdswyzss7mQEMo6rryYk1M9CsKw42P4uyP54mUSDnf/0WsB1/rtn7bnvYWi
         KCpR0OHdhF0sum3uC3XMdojmjykK/3gpiOxQYCNFLkrqkcXnRbDh2+rkjT16Rbdu+83/
         1h1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779108604; x=1779713404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+kR1uWbklt4iMogl7XGhEDFycrnSG5eLMhDf2zVjKyM=;
        b=oKDEODJ/DdHXUgMD92f0ZrjwQZjcjlsFFVFBCLa6r0qnsXVqShewJTfsann18XGsMb
         NxnyanuGx+Q4TMQLDMcbxn4xCG9Fgjzn6Z7PMurmjjztfE30RxdExgHLK6Ea2Gx68+fj
         Y8/3EPensI+3czVZy2z3mzFjvL3oxB3ls/tflPiKo+R7yW9jt80r4rXn2VmRDWO/8n+V
         MVaIln5Mn5bW0RAP4KHpi9Ba9v/rSXWsYjmqroiSPsOik+dCsEXRtbkRGyoEwNTl9Ekr
         MnpeStZLu9CxU0xuK1Df6TIOON6BK52gp5uj3TJ9Wp76fiViHlneH7rMmMCS3Yffa6Gz
         GpEQ==
X-Forwarded-Encrypted: i=1; AFNElJ/evxpzXWgRT2/XRZJN8ubBmBPUxf/LeF7cpMNI0tjOMXA3kY51+BRN5AW9ur7eWGM/rBegAKQUxPGdBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyzdIPeWeFhvtdbsqpL+bgkOcLKsPhlVDCPedP/WCQifbGtHWD
	YMnhUxVGYV48/88hJI2nHnOTZpGi5h55mNA9pD+/HieimDi/f6Uj4rJO
X-Gm-Gg: Acq92OHaHoIJ/2fm6Sx9NpfYMx/jVW0d7IByTojnxMeUyjkkno55AGqHdLDXgw+YnIm
	b44TG0YaSQb70Q8KIES+Irctoc07buBuf926f0n1F8jj3jQTV2UXdfQQpwnwBOV/pITFiOBJnmH
	Siw4L17J8Sch6oJwa3HuFcQauGwhNDoamnO4LO2QIFsA0KVxZxFO5+4j2H4ZxqrGDCj20JlIZjD
	Vv3mUxoS7xIURK+hOpE2JHccBjGYbgsnOZB1xAi81xJ7hJ1eWANKRQEm2d1k6eib9bxFlfixWTt
	ee+8WlKe6FzupjijudXMj79j6A4vrmvP5/trmaodV9xhAVlRm1esEmmwIo60gLpDTw5JxuwSDSZ
	SF7MHlIv9jHN2OBFtMjh87GXBWKTYg0MP4UPUYWjsuqXdLQ0GNfoQA92BPmivxe9Qfnkx5lIPpR
	EmRcgW8Q==
X-Received: by 2002:a17:903:2ecf:b0:2ba:b643:1f81 with SMTP id d9443c01a7336-2bd7e84407dmr159020445ad.15.1779108603610;
        Mon, 18 May 2026 05:50:03 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe4935sm156159725ad.42.2026.05.18.05.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 05:50:02 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Yannick Fertre <yannick.fertre@st.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Hans Verkuil <hans.verkuil@cisco.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] media: sti: hva: avoid double free on video register failure
Date: Mon, 18 May 2026 20:47:18 +0800
Message-ID: <20260518124718.996943-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: CF97B56D0E2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61987-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

hva_register_device() allocates a video_device with video_device_alloc()
and releases it from the err_vdev_release error path if
video_register_device() fails.

This can double free the video_device when __video_register_device()
reaches device_register() and that call fails:

  video_register_device()
    -> __video_register_device()
       -> device_register() fails
          -> put_device(&vdev->dev)
             -> v4l2_device_release()
                -> vdev->release(vdev)
                   -> video_device_release(vdev)

  hva_register_device()
    -> err_vdev_release
       -> video_device_release(vdev)

Use video_device_release_empty() while registering the device so that
registration failure paths do not free vdev through vdev->release().
hva_register_device() then releases vdev exactly once from
err_vdev_release. Restore video_device_release() after successful
registration so the registered device keeps its normal lifetime handling.

This issue was found by a static analysis tool I am developing.

Fixes: 57b2c0628b60 ("[media] st-hva: multi-format video encoder V4L2 driver")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/st/sti/hva/hva-v4l2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/st/sti/hva/hva-v4l2.c b/drivers/media/platform/st/sti/hva/hva-v4l2.c
index 645e4f155dd0..4e93a7d4b245 100644
--- a/drivers/media/platform/st/sti/hva/hva-v4l2.c
+++ b/drivers/media/platform/st/sti/hva/hva-v4l2.c
@@ -1305,7 +1305,7 @@ static int hva_register_device(struct hva_dev *hva)
 
 	vdev->fops = &hva_fops;
 	vdev->ioctl_ops = &hva_ioctl_ops;
-	vdev->release = video_device_release;
+	vdev->release = video_device_release_empty;
 	vdev->lock = &hva->lock;
 	vdev->vfl_dir = VFL_DIR_M2M;
 	vdev->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_M2M;
@@ -1319,6 +1319,7 @@ static int hva_register_device(struct hva_dev *hva)
 			HVA_PREFIX);
 		goto err_vdev_release;
 	}
+	vdev->release = video_device_release;
 
 	hva->vdev = vdev;
 	video_set_drvdata(vdev, hva);
-- 
2.43.0


