Return-Path: <linux-media+bounces-51445-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MvQFD1ydGno5gAAu9opvQ
	(envelope-from <linux-media+bounces-51445-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 24 Jan 2026 08:18:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E85107CC99
	for <lists+linux-media@lfdr.de>; Sat, 24 Jan 2026 08:18:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 620F2300D303
	for <lists+linux-media@lfdr.de>; Sat, 24 Jan 2026 07:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37CF5221FBB;
	Sat, 24 Jan 2026 07:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e2PN5TG9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8469B286A7
	for <linux-media@vger.kernel.org>; Sat, 24 Jan 2026 07:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769239085; cv=none; b=eA7hhPoITIqp6TKrZU7OUIqR44NV00ZmvY0TLcxpeEKib7sHnXZ2qWwfKXyTO7mZBXZvxhwvdQbgjqzb8VEkdsU/NixQ4+7nwtK5tylMLWfHVTGnwEmLv8k5W88wEGSzT10/rT/Ic+GRheXSifqg2Epqcw6KZ26TosIOVZJJozs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769239085; c=relaxed/simple;
	bh=/KLL2Mpx2PKzYBW2vOuOmi3JG0TJeYzpG3CSSS+Jxmo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MyhejFom7E+GkZdirgkK6B9stlxpqYfEsUoQtA1P/hzmXpOJtFN8IgjQb8N6DG44cRW1VNX5Xhl1PlELXzofsl0vq1bv6tCYeQ8VN6F/iym8CcySPcMj8nDkGgrC7LcNKCUmxKDMzMUDfOASJmmoA6Dtp2ySsJnkxaoj0GQNqIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e2PN5TG9; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-81f4dfa82edso1313069b3a.0
        for <linux-media@vger.kernel.org>; Fri, 23 Jan 2026 23:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769239083; x=1769843883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N1ibEYxFuhvecxJdBg72dzs3SWu8/xEmbRFebi7KwNg=;
        b=e2PN5TG9nyj21lJL/6GEOqdiUrfclXR4KzVI+p3Fyf1FJftGq1NVg7jIJhPnnMEgUS
         9WW/YBMt5nElzoecadCl7y0Bgi+lkiaeNTXuWu3pGUG8+yn10xtd9t6WNx6YEsViX5g8
         /Ue8nuSY/REY7zjC3dadQYcjsW0PBURQzyprOfU/CZuuYdFIJfFNpjMj/NL21wxmJLX3
         X71kyMe9LgSi71ogq2PQiOp66r8+ko0dIRlQIEHVTBZPM0E/RrF2DvzHWYfYbe871sW0
         ClfuyiOMPCJCzn7sPg53A/XJTlKj09glpo7m4RVSIkzMXppRP+Ej0QuwaCPvexu6CA5c
         et/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769239083; x=1769843883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N1ibEYxFuhvecxJdBg72dzs3SWu8/xEmbRFebi7KwNg=;
        b=GIaxVzzeOaB9n+Ztjl2eEjR0FlnmAZEv0cs5cWiYyjuDLhs4BAcvQPiVEwDVscLhaV
         dNdH7gVt67ND81glh2Y6kjI4l3CR+H9y4vULocF10MtKHY0Fr6eDZ5ySXi7RWx1SGcER
         5SUgdJ000zaFYCtOmU8FicbtgrtxUSqWaB4fAZxYh2pISOuGf+Cg7d4JVQmx9QAuvlXC
         /XydnrtaXEmFTOkXpwDL1egVy9bDj8scPW0xLWxyaPpCuq+CQybZ1OnNpFpiHq/d0HP7
         CZ0qwf3EpRk0bfavklMWbrtXvUivMllkcjUhUlhNNJCTAw2sBAz02rstryoS2PcijXvd
         KdtA==
X-Gm-Message-State: AOJu0Yxu0xesPYx+ulYB4t/dxIZZ0r4dIriF9qwqvANSaD3zO1qHFP6Z
	yajJXHiOBf4Vs6BzjdpRwcvacynQTHfteXrzhuFZ0m2Q9hbEqSDzfgDcMCH56CK+
X-Gm-Gg: AZuq6aI/luZZ/YoeN0zV5LCLsbqtukE9xlN8LwIjEgISs5eWGP3zn+Gk9EhQ1s7nEx7
	eRVS+bo5Hf1lcJ/l0AuA8OLGD5HU6XLCHFdpLQp5rR1693rL8eBIFQfYf06pWZXtH7kC143I7gS
	yDu1wOV4JPDhnq2NB4yW4XuySKbEUTvhWlO6tCIiyoQkjzZqxb/W0PmaIdWGuOj0JFV2iP63a9P
	Ya9M4/aVFo4DNnJQ8kqFqhaWTTKYccMO2zQ2N2QkrfQM3MFmrGm/B2PySUPwZVwQKCkKJ3ALwNa
	kMzmyfkCx7ZDVpyIYqlmOniZ3Lj/qQW49ajKa5EqjBaVMPrlzivL8dz77jU281Pqq/s5z2MeFto
	At+7JOGg8/POnMcW3OwG8uzKBshiu0YXa6Kitx3q56loObReElnC583AXqVt19SE0ikVc6R2Fn/
	hgHmCpxntwi2sqXQCieF9gyba+7rm8LEuTgnw=
X-Received: by 2002:a05:6300:614e:b0:38b:d9f5:3c4e with SMTP id adf61e73a8af0-38e6f8052ebmr6163375637.55.1769239083421;
        Fri, 23 Jan 2026 23:18:03 -0800 (PST)
Received: from saikiran-Yoga-Slim-7-14Q8X9 ([2402:e280:3d17:646:1ce:3fd2:e11e:72d7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c635a42e8ecsm3645344a12.32.2026.01.23.23.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 23:18:03 -0800 (PST)
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
	Saikiran <bjsaikiran@gmail.com>
Subject: [PATCH] media: qcom: camss: Fix pipeline lock leak in stop_streaming
Date: Sat, 24 Jan 2026 12:47:49 +0530
Message-ID: <20260124071751.5885-2-bjsaikiran@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260124071751.5885-1-bjsaikiran@gmail.com>
References: <20260124071751.5885-1-bjsaikiran@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linaro.org,linux.intel.com];
	TAGGED_FROM(0.00)[bounces-51445-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bjsaikiran@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E85107CC99
X-Rspamd-Action: no action

When a browser or application closes the camera, if any subdevice fails
to stop streaming, the video_stop_streaming() function returns early
without calling video_device_pipeline_stop(). This leaves the media
pipeline permanently locked, preventing any other application from
accessing the camera until reboot.

Symptom:
--------
1. Open camera in browser (via pipewire/libcamera)
2. Close browser
3. Try to open camera in another app (e.g., qcam)
4. Error: "Pipeline handler in use by another process"
5. Camera remains locked until reboot

Root Cause:
-----------
In video_stop_streaming() at line 315-318:

  ret = v4l2_subdev_call(subdev, video, s_stream, 0);
  if (ret) {
      dev_err(...);
      return;  // ❌ Early return without pipeline_stop()
  }

This skips the critical cleanup at line 321:
  video_device_pipeline_stop(vdev);

Solution:
---------
Continue stopping all subdevices even if one fails, and ALWAYS call
video_device_pipeline_stop() to release the pipeline lock. This
ensures proper cleanup even in error cases.

The pipeline MUST be released when streaming stops, regardless of
whether individual subdevices report errors. Failing to do so creates
a permanent resource leak that can only be fixed by rebooting.

Fixes: Camera permanently locked after browser closes
Tested-on: Lenovo Yoga Slim 7x (Snapdragon X Elite, ov02c10 camera)
Signed-off-by: Saikiran <bjsaikiran@gmail.com>
---
 drivers/media/platform/qcom/camss/camss-video.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 831486e14754..578c0ae3d997 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -312,10 +312,15 @@ static void video_stop_streaming(struct vb2_queue *q)
 
 		ret = v4l2_subdev_call(subdev, video, s_stream, 0);
 
-		if (ret) {
-			dev_err(video->camss->dev, "Video pipeline stop failed: %d\n", ret);
-			return;
-		}
+		/*
+		 * Don't return early on error - we must continue to stop
+		 * remaining subdevices and release the pipeline lock to
+		 * prevent the camera from being permanently locked.
+		 */
+		if (ret)
+			dev_err(video->camss->dev,
+				"Failed to stop subdev '%s': %d\n",
+				subdev->name, ret);
 	}
 
 	video_device_pipeline_stop(vdev);
-- 
2.51.0


