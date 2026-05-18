Return-Path: <linux-media+bounces-61978-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UISaMVYBC2oH/QQAu9opvQ
	(envelope-from <linux-media+bounces-61978-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 14:08:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D53056C45F
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 14:08:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ABECB3006104
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 12:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D30843FD952;
	Mon, 18 May 2026 12:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j5X3u8h5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D394B3FD945
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 12:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779106127; cv=none; b=PKGCMupsZl+P0NnMwvEqimzT0CzVgLWzGILxuHiuaysCNUlTZ06rBWdXeA0vCrgjQGTHoZ9/aWkW7AStHA/csDuK6W4EOl/bh5ckpczmDT6mqzVrXR33XHreqbe/rw2Zmatkdo5I+mV7d+DhgN3bEKwg1mLBg/SL3kZNvMao1aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779106127; c=relaxed/simple;
	bh=zlGH5jEAEssmNm/OKOrVqj0vtMiAu/0ivcXixYxnHWo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZJvFWbTMw6CkqwEtXrRcUa+lpWDDzPaAU+B51hftc3uZeYdtZzRnYAzTV3T7wSKhtjhnqiL35uq/AUh2RwO7HqjB4BrPoXwtvRqRkiYENBJGQlrqHdKsiy9ms2WfBqqP9HCSd9AqBJ8VahqLLvOuJPWnQSmxMJZ71NZD5xgoU5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j5X3u8h5; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-836ebdeb969so901975b3a.3
        for <linux-media@vger.kernel.org>; Mon, 18 May 2026 05:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779106119; x=1779710919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i6DawpBpNprrDJmZUeejuEEC3bbIORGgrCvdJmH0V7A=;
        b=j5X3u8h5Jn0GHe6ldftes6NB1yZxDSBt4V/YZcj7XUD8tx3PLlBaH4prsD9BfOjKvU
         PMDcdAzGPdTe6bMGX+LAjA2ITXxkMl4Pw9X9Y4ytEfGhpVDMlE7cBA5yKcDKOIjXAeek
         7TSk9Xy+VdBCTn1oCCUp3YMU4BJV2mRGbn2EdQ9W0ssDosNlJpDkUJCbOaN9qjoJsqbt
         BGNx26UioBYIeYBEiDlscNnWeZwBhLAdPGZ6dbfBWfrrqG1ZN56ylDE2wjSgbCi/K3gS
         hyuxBF6k4di22pAFxp3lFsLt9QQ3NxXX/EnSU6SDtK7G6dwSzBCAPCSrh2GqY4Nk+FNe
         tyPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779106119; x=1779710919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i6DawpBpNprrDJmZUeejuEEC3bbIORGgrCvdJmH0V7A=;
        b=VIOMZFTWUhu1KFbGtHAKu4iJkW09UbkKGSG2jdGVpOPm3s1BsbJoSpbtQZdnaXy9+X
         GWsbKdXPua+X6qimwcTVgXV17NG7YB55otBqktOrzpxVk0eE0IfPrsErnDPHkmXdkGLP
         DtAmQ1o0vFlomrezTqs0JhXIhrHsJ8OVhHZ8CZX7jmcEw1h9UHKfhFc6OottfSYDn8Sy
         8WPWlx5toDILExA2FyvMEETjPfbe79va1EfErSZZfXJWGmNkrMCO1ABA7r/xc+TB6Pys
         rNX5XeZXRcXpTKlpeLFvb+rjfl1bDFT82i+2/vN3t4CHIHrcyOpFf39KF5AyVbVAgD7S
         73Ng==
X-Forwarded-Encrypted: i=1; AFNElJ8vGhtJuXAOZQRheW+yBu9kXrwpcayagLWwstGT2mJ2/oHPUK0u5ZCOj7NEIP/C6+pbbq1yhXb99z+zZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YynZ9YxZNNLbXmJVZ+zweeocJ44yxxvuPaUs2o2Ytu0iu8sjJuk
	BrBWEZ5kS9wsEI55ydPkKzT9bjRimDKc1btikbMRbQb1S32cxiiFu3n9
X-Gm-Gg: Acq92OGxqOTYg+dS8yQVkJqjwya6fFRHHrmLiAeaIOXjFuVojEHoAbkIH6c7gDkUxg/
	vp+f4v93MvfelaUMHQQBD+/ljB/eidJFgC+fwOYAdMInoHxgn9BR2Lza/3JHjUHZsAgX5kuqJIN
	JEk652GODxXcQ4w3ZgyI3/xUHPLCP44VCRXlaZCL2M66tKUqrH166hVBp2QxkakzmZ+L3ZyeMqE
	BIp4SeSuPNrdzj2Y7pvGBWObjSyjABsQA7Qbu4iRUUpLgs27bdxqf1B5BkuL6SoPrIY97ikvy71
	oI0F5FoVf6dTPL9JOHgeQNRNszEoFjfsAqmChTVHVJO2nLMv54+RnhR5y9AUzw3fXx7F0VEJxQt
	7p20Rjcd/3+b7k0bBZ6lSxRVIMNbvjnTwqQb2pJMIywFVowq1uHNvogVji/ATey0qUED0Q/KdQA
	OQGMl+YmhsD6R19A==
X-Received: by 2002:a05:6a00:1911:b0:82c:9f7e:518c with SMTP id d2e1a72fcca58-83f33cf10c7mr15241822b3a.25.1779106119153;
        Mon, 18 May 2026 05:08:39 -0700 (PDT)
Received: from lgs.. ([101.36.107.181])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19664712sm14666966b3a.12.2026.05.18.05.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 05:08:38 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Devarsh Thakkar <devarsht@ti.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Haoxiang Li <haoxiang_li2024@163.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] media: imagination: e5010: avoid double free on video register failure
Date: Mon, 18 May 2026 20:08:24 +0800
Message-ID: <20260518120824.993116-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 6D53056C45F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-61978-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[ti.com,kernel.org,collabora.com,163.com,vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

e5010_probe() allocates a video_device with video_device_alloc() and
releases it from the fail_after_video_device_alloc error path if
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

  e5010_probe()
    -> fail_after_video_device_alloc
       -> video_device_release(e5010->vdev)

Use video_device_release_empty() while registering the device so that
registration failure paths do not free e5010->vdev through vdev->release().
e5010_probe() then releases e5010->vdev exactly once from
fail_after_video_device_alloc. Restore video_device_release() after
successful registration so the registered device keeps its normal lifetime
handling.

This issue was found by a static analysis tool I am developing.

Fixes: 609ba05b9484 ("media: imagination: fix a potential memory leak in e5010_probe()")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/imagination/e5010-jpeg-enc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/imagination/e5010-jpeg-enc.c b/drivers/media/platform/imagination/e5010-jpeg-enc.c
index 42ad9ee3993b..7f4076d3bca8 100644
--- a/drivers/media/platform/imagination/e5010-jpeg-enc.c
+++ b/drivers/media/platform/imagination/e5010-jpeg-enc.c
@@ -1045,7 +1045,7 @@ static int e5010_probe(struct platform_device *pdev)
 	e5010->vdev->fops = &e5010_fops;
 	e5010->vdev->ioctl_ops = &e5010_ioctl_ops;
 	e5010->vdev->minor = -1;
-	e5010->vdev->release = video_device_release;
+	e5010->vdev->release = video_device_release_empty;
 	e5010->vdev->vfl_dir = VFL_DIR_M2M;
 	e5010->vdev->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
 	e5010->vdev->v4l2_dev = &e5010->v4l2_dev;
@@ -1106,6 +1106,7 @@ static int e5010_probe(struct platform_device *pdev)
 		dev_err_probe(dev, ret, "failed to register video device\n");
 		goto fail_after_video_register_device;
 	}
+	e5010->vdev->release = video_device_release;
 
 	v4l2_info(&e5010->v4l2_dev, "Device registered as /dev/video%d\n",
 		  e5010->vdev->num);
-- 
2.43.0


