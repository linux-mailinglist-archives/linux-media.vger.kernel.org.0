Return-Path: <linux-media+bounces-61552-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MWwJXn6BGqNRAIAu9opvQ
	(envelope-from <linux-media+bounces-61552-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 00:26:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0537A53B6C3
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 00:26:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E1D0E305ECEC
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 22:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8476D390CAB;
	Wed, 13 May 2026 22:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ApOfw2Ez"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BDD38BF6A
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 22:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778711154; cv=none; b=o9Mo4QAedOWSNQmEEwNVj0rfgYYmeHrDYerZxs/cIQOuKJyt5uWzrCLWlmnugwJPGurHrJAX5yLFOcmDFBJqnJyQUrxt10O8jVXfiUdK9wpeuIrswrgQpNxxO6A5XKzmgGOWmwI+7wLU8Df03dFpxnA4uORiUIIP7aRrk9YOmwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778711154; c=relaxed/simple;
	bh=noh7GRB1Gf7yGrwZfJwFyhDDj5+mcLq1/fBuJK9XvXU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bBqCVop0x1wz8FLM8UK1Y/VShpdYa3ZlbarXJR1DfI+s7fH3xjKsr1B2c2n88NgRro323yGTAO5eHtn5/zrNrx/sHIh7VZ+2f7Qei1xUM76m6l1xyUmjfMz+wqjbB2WUpfpJN5e6inMCpiLBG34cL9BcQa8KVv5yL9Xky/dWgVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ApOfw2Ez; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8d560ede296so819660385a.0
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 15:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778711151; x=1779315951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=49hbsMefGeWZo+jLb2kzmTEJRaJFF0WB/q/qItccdrw=;
        b=ApOfw2Ezlhlk/bhZ+k4A9DXKuzIsHxYyeL3jIDngqqWS3mTj67YbVZVmzn3IYVuAho
         12WiQOeoJzyKXDjjzTZIQczNQUAlDkbMdjjKoIxisviEc/ZG+AVyZF9jvm+tKjLSW/Rx
         2nTqMwrGG8UpAmsn5YSitKAecC3ZbRHFxPfWcPLUGpMvOv07mkRkTasO8i9O0YdaAZin
         0wKqrM0ymuh7zOhaMyV7NmddcxE9veRGv8guxZHm5QjUVZ8P5XfsF2D5Cp7fDIXP3eKI
         Ii5wdvIjlizIR7byg2XVsJO4Qe2by/+GvPEACnVHFv4IBeaNvakT2bSwiONWBPDCpqs6
         Hvmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778711151; x=1779315951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=49hbsMefGeWZo+jLb2kzmTEJRaJFF0WB/q/qItccdrw=;
        b=PcTwywE79snIcjSndKURwtmlPKqPMVq9PuP/KL92kuk32HW63tz1gJelGs5BVO4dFF
         S9HWl15BHwjw+ARSdvl5LbnXVcISigAEP/tgLszoN3EgYKY4h7WBtc8+8uVHTNe6WWoC
         4dtlLYDLrmXNH9k3Eiyb028YfF6R4gxoi1d3C/KMB9H/4YDVejLHC2+brJc+Bft2KDVt
         9TOF3k8Lk5/QObHcSzuiixyVDTivOc+3BharHgOZqRtB9ovuCQF2nHddQl5KQqhrJJQX
         FTCsfh8grl0CDULGA74zeyCXs3scpMu7SQh4U6S9WQH4EtVibCyM4PZEaHGnO2Z0iYdg
         dIDw==
X-Forwarded-Encrypted: i=1; AFNElJ/9hmBi0QTQeblyF3+qNNxctthuS6yNB9iHdtLZiYPhRYTxWb+YvtTrCIh+qYZB1bTS3p4Iyw+c+Wh+wA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzekuL9LqbR0pkkkKrjLb5sYOb3h1J1fEV8nRAxtS1TIxDcQ7ns
	zlpFTfioiH8BUkUchu037+6vA3tbDO58+KtZmkN5R+lLhyLbJN0svafy
X-Gm-Gg: Acq92OGo7IPzifoyYrCYI7xP4UxghBHHCy2pcPOEoggQuZHLCUJL/H0qwkZShIUGPwC
	bRqS5U10hFaothOfN4yCaZfWE98d3cMMdbut6wPPRoNb6cl+sPAIvTiL/xozLFogWkpBGNoKb/f
	KpN2qSI54XPQ02aP11mMzQAOS/kvwOple8zYDLzjj7T2dFA54y9LO5a+LACKWyYxxE9O7mGBNzE
	/0adZdcF+qHkP6HyBMfaHw0auWNy3WSMWgZDj5MZbO+0ahiZXORYJhJLWii/YFhxiNHjgYw3qu0
	40s2wIbW6p5cJSf1wwnNb2Xl+zb2nxLezeUSkpWGdQJhilkB/LIo4uPtB4qeEUItr2vIklpoIQ5
	QLvy/ngwXEoI2almDaOW0E++fqERR1WJlElPJmg73+/8qM0OntFLoRSkuIsND0tiNZ9ivURiCyR
	1WzjSexT9yOm7dGe2j/8wG/vo1lu6W1XLxNxvCOSliQ11dPa3IxJK/F7vJPBiGWeJ+7cXheIwVk
	AnhU0VVfPQiqbO6gkD8HkxJsXwW9EBbBGCjzsXQ0fg=
X-Received: by 2002:a05:620a:4808:b0:8d7:531:cb8e with SMTP id af79cd13be357-90f8b5c66efmr851275285a.49.1778711151563;
        Wed, 13 May 2026 15:25:51 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910ba9454basm81938685a.12.2026.05.13.15.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 15:25:51 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: Hongju Wang <hongju.wang@intel.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] media: ipu6: return -EBUSY from busy video S_FMT
Date: Wed, 13 May 2026 18:25:34 -0400
Message-ID: <20260513222534.2787169-1-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 0537A53B6C3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-61552-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michaelbommarito@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

ipu6_isys_vidioc_try_fmt_vid_cap() rejects video format changes once
the vb2 queue is busy, but ipu6_isys_vidioc_s_fmt_vid_cap() ignores
that return value and still commits the user supplied format to
av->pix_fmt:

	ipu6_isys_vidioc_try_fmt_vid_cap(file, fh, f);
	av->pix_fmt = f->fmt.pix;

That lets userspace allocate and queue buffers under one capture
geometry, then change av->pix_fmt before STREAMON.  The queued vb2
buffers keep their original plane sizes and payloads, while the IPU6
stream setup later derives firmware output width, height and stride
from the mutated av->pix_fmt.

On a Dell Precision 5490 with a Meteor Lake IPU (8086:7d19), Ubuntu
26.04's 7.0.0-14-generic kernel, and an ov01a10 sensor path through
IVSC to /dev/video32, the following sequence reproduced the bad state:

  1. set /dev/video32 to 640x480 BG10
  2. REQBUFS and QBUF two mmap buffers
  3. call VIDIOC_S_FMT again with 1280x800 BG10

The second S_FMT returned success and G_FMT reported 1280x800, while
QUERYBUF still reported the old 615680 byte queued buffer lengths.
A subsequent STREAMON on the same live sensor route wedged the host
display/system hard enough to require a power cycle.  No KASAN,
IOMMU, oops or persistent crash record was captured, so this should
be treated as a local availability failure rather than a demonstrated
privilege escalation primitive.

Return the try-format error before committing av->pix_fmt.  This
matches the metadata S_FMT path, which already checks vb2_is_busy()
before assigning av->meta_fmt, and preserves the intended "no format
changes while buffers exist" invariant.

Tested on the same machine: with the patched modules loaded the busy
S_FMT sequence above now returns -EBUSY and av->pix_fmt is left alone,
while v4l2-compliance -d /dev/video0 still reports 48/48 pass.  The
existing compliance suite does not exercise S_FMT after REQBUFS, so
adding a busy-queue case there would catch future regressions of this
shape.

Fixes: d3bd039cd2a0 ("media: intel/ipu6: support line-based metadata capture support")
Cc: stable@vger.kernel.org
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
Assisted-by: Claude:claude-opus-4-7
Assisted-by: Codex:gpt-5-5-xhigh
---
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index 3ac48d2076da..88fceab6ed86 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -323,8 +323,12 @@ static int ipu6_isys_vidioc_s_fmt_vid_cap(struct file *file, void *fh,
 {
 	struct ipu6_isys_video *av = video_drvdata(file);
+	int ret;
 
-	ipu6_isys_vidioc_try_fmt_vid_cap(file, fh, f);
+	ret = ipu6_isys_vidioc_try_fmt_vid_cap(file, fh, f);
+	if (ret)
+		return ret;
+
 	av->pix_fmt = f->fmt.pix;
 
 	return 0;
 }
-- 
2.53.0

