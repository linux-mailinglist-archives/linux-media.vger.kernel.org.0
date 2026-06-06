Return-Path: <linux-media+bounces-63992-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kvqCCL6cI2rCvwEAu9opvQ
	(envelope-from <linux-media+bounces-63992-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 06:06:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 722C364C55C
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 06:06:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="GUnx/FYI";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63992-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63992-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0AECE3024502
	for <lists+linux-media@lfdr.de>; Sat,  6 Jun 2026 04:06:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C911A299931;
	Sat,  6 Jun 2026 04:05:59 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1202353E0B
	for <linux-media@vger.kernel.org>; Sat,  6 Jun 2026 04:05:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780718759; cv=none; b=TpoWCZxNcZG/U2VVVZuYAgYr8XsdJxcE5P5eO1u4TJd1BSKSzl3w4OAFtl7+PU7o5XmNSei7V2HCjAD/4dP9mpqffH84pWQSHtZifosIgp039iUdzGkpDTQSvfYwMR0KkNyaQl0MYcvEBGsYiqD686edQimiPuED6C9rpyKy5LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780718759; c=relaxed/simple;
	bh=xnBRnJXWvcPOCK3VSSoikSoYNqSFsf/wCh5C9GPtC/g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pXHQtjz7dlhmY5u5XbYcjgSCYc/pxHqjgJTCCHAlO1t/EApEP/66UaE5mSpYCgDIHfWafDvNb1WX9mI2sbFr1IsMzzDWrxoW/vtntjUyCMaFtoBelOUs7FL8FGjCYRMmGA9Rcy/5May+JeYtCXhXS5nQaSKnMKkkqwdHR8eiPg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GUnx/FYI; arc=none smtp.client-ip=209.85.160.44
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-43ccd4f6f6eso2039462fac.0
        for <linux-media@vger.kernel.org>; Fri, 05 Jun 2026 21:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780718756; x=1781323556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CizLVc3DfZ0Sy4nESmuVmKwW/Q8mmz8CwUNoPSBdboc=;
        b=GUnx/FYImCfdiK4vXV/B76U4axUJfp5YcFzt8yPJ8Oe9JGi5f+sPk0Vu7r3qA0CjeZ
         8vEagsKg4UYX56GG5K6uRsDFOTyOyZJD0G6HjvhIrpmw8IbL+OEMXIgAUGjVTK+k+EvO
         ypidzzbqUVEtAhH8RmCprOkBsGFvuw5tBwVzUiV59rPt8BwS7K0waWuTeNdVCW2APeQ/
         +tivcMyam5WWKu/r9vtTw1uoszeWVN5Y9b90Gu0kgWF2DNLST+/uWGqKhjjE4Lp5ng+X
         1+bVcBkAm9Nsipbtxz4JMArg/mSK/UicdClWq6YairCBPRYjeQv340v3XX8xcLhwkBNy
         kblA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780718756; x=1781323556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CizLVc3DfZ0Sy4nESmuVmKwW/Q8mmz8CwUNoPSBdboc=;
        b=Jh2Qw8akPhblXoEsoDcYmBzQwl7EX0pidlP1C+XU/aJTDu1Oej4B8D0YP+txIcc+32
         egmdL7xb+O/7S2qwxM8qDKo3oQoCfWygGTyUbgJgFj2OnskWnjiF3od/KVKvzfRhTw1s
         svDQVT4XiWV6cQ/8eJRHgyGdqzEhuQ0JwjRyWmmqpTQicx8t/OKscD00cR64XTrvKF9S
         /IYduRBd3J3YWAAnM/9Dv6kGbxvS68Gtj7s5mkCYQQWyYyh0sjOHXjYnu12hLVySD7ZG
         nw8haacJR5XqBRNBtJyxyXE15tlhDit4Cnlpu3FD2fbz6lzXLHIbyhZf7fo5O3JJetlp
         jDGw==
X-Gm-Message-State: AOJu0YwKRY+1PudWj6+fDvKUJvrb5ejuhsYyEZirUc8kjzNscUi3Nm6t
	g6nUmnKi3mo785S5DjSsH91JLMxrGyHHpxf2pPBbNYbYpNDD+HDjnnlbjSFS8g==
X-Gm-Gg: Acq92OEJ4d6g3CMLSVrfUWNDglh0Ioo9znesWTkQlH/lzFaRISY9Y1F5V4OcQTX1j5S
	y5eETRvG3veW8/Ov0NYsMbB+yR/03ChuCXlYzEZW+YSpzc8UfMKyE+7MUFvSiIgtQAENPY5CFjG
	OhyxCM8NfLJ8n+cvK8ll/4hkfeCZjxxa23KsEfLi809B6LaoxXIQUsOHqLEdrRxSW/eRgCmKR9u
	808xVtGqjGXvNuhwFVWpYQy637QYJlSJOsOhtugrlu/+QSMD/eZKQjbOx6ajXf3Eq9Qy3AY02lq
	NBOirOpFlK5/tLJTz3c6/rbz/DMiB7Aod2MrihoyQTyBvlXXbp2HklptPk07PLROzrq9tz0ncLv
	KEZsrNE1mx7KvfcH7SgwaWl6ZZvUMlTiy70MYPY/HGIoTmugCyLzsa7Bd/r6idh2JiLwaqokg7h
	KMqmP0YdxEH92li5+04/s9O0V9r7kRKHc467orq2ArhVWM5HRXhqFw3FpcqHWDztOK1mYaViF+6
	4lM6hAkUOvhfA==
X-Received: by 2002:a05:6870:51ce:b0:43d:7b24:96 with SMTP id 586e51a60fabf-4413cba64abmr3810061fac.0.1780718755825;
        Fri, 05 Jun 2026 21:05:55 -0700 (PDT)
Received: from princess (76-224-4-192.lightspeed.clmboh.sbcglobal.net. [76.224.4.192])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-440d84def23sm9751094fac.17.2026.06.05.21.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 21:05:54 -0700 (PDT)
From: Ben Hoff <hoff.benjamin.k@gmail.com>
To: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	mchehab@kernel.org,
	hverkuil+cisco@kernel.org
Subject: [PATCH] media: hws: Remove stale control ioctl prototypes
Date: Sat,  6 Jun 2026 00:05:49 -0400
Message-ID: <20260606040549.8967-1-hoff.benjamin.k@gmail.com>
X-Mailer: git-send-email 2.53.0
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63992-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER(0.00)[hoffbenjamink@gmail.com,linux-media@vger.kernel.org];
	FROM_NEQ_ENVFROM(0.00)[hoffbenjamink@gmail.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_THREE(0.00)[4];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 722C364C55C

The HWS driver uses the V4L2 control handler callbacks provided by
hws_ctrl_ops and does not implement legacy vidioc_g_ctrl, vidioc_s_ctrl,
or vidioc_queryctrl callbacks.

Drop the stale prototypes from hws_v4l2_ioctl.h.

Signed-off-by: Ben Hoff <hoff.benjamin.k@gmail.com>
---
 drivers/media/pci/hws/hws_v4l2_ioctl.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/media/pci/hws/hws_v4l2_ioctl.h b/drivers/media/pci/hws/hws_v4l2_ioctl.h
index 53044f78d6fa..9a81e940e33e 100644
--- a/drivers/media/pci/hws/hws_v4l2_ioctl.h
+++ b/drivers/media/pci/hws/hws_v4l2_ioctl.h
@@ -17,14 +17,10 @@ int hws_vidioc_g_parm(struct file *file, void *fh, struct v4l2_streamparm *setfp
 int hws_vidioc_enum_input(struct file *file, void *priv, struct v4l2_input *i);
 int hws_vidioc_g_input(struct file *file, void *priv, unsigned int *i);
 int hws_vidioc_s_input(struct file *file, void *priv, unsigned int i);
-int hws_vidioc_g_ctrl(struct file *file, void *fh, struct v4l2_control *a);
-int hws_vidioc_s_ctrl(struct file *file, void *fh, struct v4l2_control *a);
 int hws_vidioc_dv_timings_cap(struct file *file, void *fh,
 			      struct v4l2_dv_timings_cap *cap);
 int hws_vidioc_s_dv_timings(struct file *file, void *fh,
 			    struct v4l2_dv_timings *timings);
-
-int hws_vidioc_queryctrl(struct file *file, void *fh, struct v4l2_queryctrl *a);
 int hws_vidioc_g_dv_timings(struct file *file, void *fh,
 			    struct v4l2_dv_timings *timings);
 int hws_vidioc_enum_dv_timings(struct file *file, void *fh,
-- 
2.43.0

