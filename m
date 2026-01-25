Return-Path: <linux-media+bounces-51512-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YMCzDVpQdmk4PQEAu9opvQ
	(envelope-from <linux-media+bounces-51512-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 18:18:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9606281930
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 18:18:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D0FC30071C7
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 17:18:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87E4023EA89;
	Sun, 25 Jan 2026 17:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HwqGjKKT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A910E2206AC
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 17:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769361481; cv=none; b=q5qB1x3q6fqJbF9lvb8Eb0jA7+w8DtgpFNJ32Cqk4QjCYscpVcPgaaeGn+dEIhtKodb668kjFl3KHRfuEeEN0RJ79UewVPKMk7A/Tr6DIuiSm0NNK1s52z45gS9RiZVXwBfcdyzQRw7czEZO9M+f0V6Vsey1KoZW+BVVbRsGp6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769361481; c=relaxed/simple;
	bh=IIaOkiMl0+0OniP81s+srZPjVFERVFHSDf8B5qCgaXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mzvpQvzwa7f2v3sFnPlbPriHfSeZAT0aQnJg263FFg9flX6X1+3F649cDj0rKE9kzeB+DkSsspOEKUC+G+a3YEOK3wIGuw51aCLZ1P2BBWxTzgk4nL2yv7ihSMgOGQVSoHOJldSbes+Rpew23SHksrBZSZ5elZtrQj0F+0jhRI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HwqGjKKT; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c2a9a9b43b1so2298274a12.2
        for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 09:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769361479; x=1769966279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vtPcAa/eA0+6dIk9uSAqy9NJNwcCQhRCZhxbQHlEB6E=;
        b=HwqGjKKT+2BeO1/dhHGeehoHcFG0rObTgrPaKcmYCASTc04+veXdsoFGNa6gL7UVk6
         nORJ71Bo9/f6H4AAwVVvdliudfCiW22NFPGVTaJKFioECxl7V3pRucz4uVtnenmL7hjq
         dfSSKdyoHNWI8SCTn4ZKT/MKqPOp/hAQTPIScCOF+/85rLsGPrv6EcAtUP2k+DB+ULJV
         aYBqVHl4tqetuTkU07x99N7HzXzR8xGUJMuvAqBaKoEMVKyJ+HoVL3STUeispGpwuO+z
         Bybe8tYrr2IFdMGnFlvYqS8ycdKCEOHNg2GNu+nGnPg7qwtoFarDdu4NJkKIu7E5K6dP
         Q2UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769361479; x=1769966279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vtPcAa/eA0+6dIk9uSAqy9NJNwcCQhRCZhxbQHlEB6E=;
        b=NS0Efaxjiv6iDen2KK9zvMJ1uU3Bhmbf0onvIyPpEER0fA5BsaV0Uxu4gWhPXvEGtq
         F9gh8XDAnIalPE04d/0e4UOb8TjIXJQbxg8xX1XU0Cit1lBSKr72M7/yWGOHSrHjvo6f
         YO5NDCJTPbukYRVXnecad2nzRIafU0bjtlndgjWg1Ww6YkeBrhbECzZbRIZ/13xfsug/
         kZX/chzUCnXFyWRdWu3M5Rul++IH1M39egiNR45/zZjEerzoaCBLwpx7nzYCjOafU1yn
         MqgfqXhb7E1NqYQUmh4VR5v38YenBnj+41ATdrCE8NIgVjhRx7EWQ/8td57Z+X32aZZU
         /7Tg==
X-Gm-Message-State: AOJu0YyfNYF/612ymwJzTe6hAYlzqh7xzhnADYd5z/dQP6jw1ZS/Z+sp
	jps4Ewypw9Ypp7zlFnSHYOisNwa0ldkjWgwAxid5ADAzPMeRV/+LqBzmj6UB/Hnz
X-Gm-Gg: AZuq6aIWZ06YVQHYJpBTSBzjXXtHzLOh5uKdUYJzDSGuLYp0ReGv20QnjGj9mM8/N96
	4+8/cyZJOCR4LdWx1WU6T90PaeCT0/uejHscoV/UuSaesKjtsufH6OY6E5/Sd587LkjZ3wTyhIT
	oz1CoLOwPA4/pyvDO76Ld1bM8d6IcWNhABub8NHQwyJLuK01jHopM/grciQqj57LXl8ACL7BERe
	9HmTbk0tjp88fqtO/m2AHP6+Xiih32Sol7wteySVbSLzswD8vrHhYczqHpMCrOq2ZvQbNR6HW6R
	6Ukez6fpxjlhFRCTBFWFFXv28N82gH7R5HEUp+nxTIzvjSKz1JuzbwRol0MuRPQlmDxPZ/LsuzQ
	KdPskbc+gIINLfhWmcXpopj/n7GRIXkbIBnXWADWo0v6O4cvTmY8x20fibeb0h/y84NtyuEjutH
	75Ov26Qx2XE5SEs6eYnGY6hCHy0RsVOfzJksDq
X-Received: by 2002:a05:6a20:1592:b0:350:ee00:3cc1 with SMTP id adf61e73a8af0-38e9f16a07amr1775048637.30.1769361478645;
        Sun, 25 Jan 2026 09:17:58 -0800 (PST)
Received: from saikiran-Yoga-Slim-7-14Q8X9 ([2402:e280:3d17:646:35ca:7619:a2ef:5e6c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c635a3f2e12sm6924293a12.22.2026.01.25.09.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 09:17:58 -0800 (PST)
From: Saikiran <bjsaikiran@gmail.com>
To: linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	rfoss@kernel.org,
	todor.too@gmail.com,
	bryan.odonoghue@linaro.org,
	bod@kernel.org,
	vladimir.zapolskiy@linaro.org,
	hansg@kernel.org,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	Saikiran <bjsaikiran@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] media: qcom: camss: Fix pipeline lock leak in stop_streaming
Date: Sun, 25 Jan 2026 22:47:44 +0530
Message-ID: <20260125171745.484806-2-bjsaikiran@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260125171745.484806-1-bjsaikiran@gmail.com>
References: <20260125171745.484806-1-bjsaikiran@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linaro.org,linux.intel.com];
	TAGGED_FROM(0.00)[bounces-51512-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bjsaikiran@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9606281930
X-Rspamd-Action: no action

When a browser or application closes the camera, if any subdevice fails
to stop streaming, video_stop_streaming() returns early without calling
video_device_pipeline_stop(). This leaves the pipeline permanently locked,
preventing any future camera access until reboot.

Fix this by logging errors but continuing to stop all remaining subdevices
and always releasing the pipeline lock, even when errors occur during the
stop sequence.

Fixes: 89013969e232 ("media: camss: sm8250: Pipeline starting and stopping for multiple virtual channels")
Cc: stable@vger.kernel.org
Tested-on: Lenovo Yoga Slim 7x (Snapdragon X Elite, ov02c10 camera)
Signed-off-by: Saikiran <bjsaikiran@gmail.com>
---
 drivers/media/platform/qcom/camss/camss-video.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 831486e14754..242c44f97801 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -312,9 +312,15 @@ static void video_stop_streaming(struct vb2_queue *q)
 
 		ret = v4l2_subdev_call(subdev, video, s_stream, 0);
 
+		/*
+		 * Don't return early on error - we must continue to stop
+		 * remaining subdevices and release the pipeline lock to
+		 * prevent the camera from being permanently locked.
+		 */
 		if (ret) {
-			dev_err(video->camss->dev, "Video pipeline stop failed: %d\n", ret);
-			return;
+			dev_err(video->camss->dev,
+				"Failed to stop subdev '%s': %d\n",
+				subdev->name, ret);
 		}
 	}
 
-- 
2.51.0


