Return-Path: <linux-media+bounces-60936-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Dse3NW4R/mnBmgAAu9opvQ
	(envelope-from <linux-media+bounces-60936-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 18:38:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6358F4F97ED
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 18:38:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E835F3010B94
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2026 16:38:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B8563ECBD4;
	Fri,  8 May 2026 16:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oe599OyB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4347C3D6461
	for <linux-media@vger.kernel.org>; Fri,  8 May 2026 16:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778258280; cv=none; b=Dt/8sjBi8/CWEOB3uxEoVEw/Z+POLLq5cspiyrOd/c/EXgidbUOD+2Nn/Besb25KrGA3ZLkSfMNvELzc26pqli64QYIr8N4pBW5I8VFIrMkMEsU5/cSxJ8mn4q751YOmgO/SYidKPuXHdYij7I33J6DNzDMqyByLCYqTqP3BCeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778258280; c=relaxed/simple;
	bh=JmEPlcwNq3vcqNKJWKNO6QNPDU83hS1QQxRfWJzQN3g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WSJFdFtkt78oyW0W8koPuGRIvk/t7qXv0FtCKqM4u+ot6VKdL15qxS4P1apkC0wDXQ5O2Zg6I2TwjoDeqGJQcFVYcvKqWr4tBPLr7bGKBwtfEbAepp1G9auyj5iFl8kUQRxUGWZ0pPQNpLId9mw61Jp6qSM2pkXXdDg8ut9bIqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oe599OyB; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so25096945e9.0
        for <linux-media@vger.kernel.org>; Fri, 08 May 2026 09:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778258278; x=1778863078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dXsQ6CLFzIyjou5etpdrBM9Re6KaQSXKRxNEgoiBOUY=;
        b=Oe599OyBOzZAUNIpIb9S84QP7d8jyo7IPlN24Zc0aVPhDJWK98jArPS4MA/VTaUd3T
         /J5NO5Us6bLUOs9UvHz+lzhN9ISIXPGmoakLL9BOehlzJ/V97XN7u8agn9Qhx7I50fCF
         wcEmYI9MwvGnl4sUVnOKdAt987valbrSRst3JHzXE6D+4yKikiilRjVj9kb664ipD9hu
         zLx3re4+j2TSAT/9h7+FhWJuJ50tziUGtGvGzNKASppeskAf0g3Az/a1+6++elT4V11H
         ySjVe0rik1p/6v9+n4FYLIa/M3tIb8N88as2/SDu3eoJ9wy10FZ0191RWi2VlyJa/FQ+
         D5Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778258278; x=1778863078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dXsQ6CLFzIyjou5etpdrBM9Re6KaQSXKRxNEgoiBOUY=;
        b=IF9otSWBLHpwCcUd8yP60vizgEX5yFouClF6PkJ24H9mVljI/kiO61MNKb3NPCwV7R
         MWTH+kpfzGnegWY8bsGhWjiCNUXyDnyc7tioyV/d4qbQk3r+vMY2F4CTowzSIZf7uUan
         zeNRRLOdEnyliZhBMUC8htFbMzWyiWNM+DS4V4/CqyMKiD44+o3k6FCLFY8s6dsJQzS6
         voGUpcJxys2L+uUlFvJ/4lwCSrzmf3+aFIosDHSpUihYmUJVBfK4Mvah+FcV8uM0kK0E
         2atP1cz1Plt+v1s4jml5DaWJAyjKhF9sltnu74lgbCDRtUlE2cHdR1lYJE7Iqd/F9Nf5
         V8jg==
X-Forwarded-Encrypted: i=1; AFNElJ/s3xN0XXXUTTUtGFkeMGO8s6e+nbkVfeHj58mvAN6I4QaPRYoiz9ixawKQu4Hn82MOaWlJ8n5HogCofw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1tejePFPKM5/h286bMd91hwpyTUIOYuUNRANhXO6cti0g8srv
	B1cQtHMWbRElgur5aLjudh218nfnanfaofRvqXC/rpBkjJ7YPw6whCMr
X-Gm-Gg: AeBDievkj6vytn2SCTdo01pXOEODMjmIGqeq9Q0p5L7knB32iEgH4I7Oq70+qdnNOZ5
	X0hOg3dSLOiwEfztuejI1pwm4N8hSyaoyCjgpgmFMsRRCg46uH3Ccdo3Hi+zHxiIrEu34IQRTUc
	e8hc/Q9O9GE8kJz92FPfI0c/eeqkhaMT/Z6hwCOtLJ61UWGMbUsgxxTttVbvhOD454KXf/01mhV
	ZT9tS3LNwAFaIQH+Pdu+0NaPbx8khrVaiTXBn6CXZLsIFiGLJiTrbt4I22MMXssVE/5cZajB4EG
	BKM/c+Byrl4n7CS7mvLW9Fp9zR7HTBoQwov6NklYw4CFkL8F3GYjiCyIeOjM7HGMKwrSBdcBLp9
	cEfpYwXFNpVEVfkteXHE9w0MwRI07U0RI7oeZhpbA25rtxfgCqgI5TCqT/o3SBwYSgViXGeNr/T
	Zb0eQReHLFYHerFLnqR4x0GDwV5QhVh0RoBX4BtY72JfGBsnBqhqQkSTRqgTQcYeW07Of3n8ydo
	L+oRQ==
X-Received: by 2002:a05:600c:a110:b0:48a:5c23:cab with SMTP id 5b1f17b1804b1-48e51f3c363mr169157405e9.19.1778258277431;
        Fri, 08 May 2026 09:37:57 -0700 (PDT)
Received: from arey-arch ([2a02:1210:7298:ec00:73f0:d2e7:188c:1f61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6dd373aesm6257735e9.7.2026.05.08.09.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 09:37:57 -0700 (PDT)
From: Adrien Reynard <reynard.adrien.08@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)),
	linux-kernel@vger.kernel.org (open list)
Cc: Adrien Reynard <reynard.adrien.08@gmail.com>
Subject: [PATCH 1/5] docs: fix typos in userspace api documentation
Date: Fri,  8 May 2026 18:37:55 +0200
Message-ID: <20260508163756.16213-1-reynard.adrien.08@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 6358F4F97ED
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60936-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_NEQ_ENVFROM(0.00)[reynardadrien08@gmail.com,linux-media@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Signed-off-by: Adrien Reynard <reynard.adrien.08@gmail.com>
---
 Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst    | 2 +-
 .../userspace-api/media/v4l/vidioc-subscribe-event.rst          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
index b8698b85bd80..8d5db414f8fa 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
@@ -64,7 +64,7 @@ should re-allocate the memory to this new size and try again. For the
 string type it is possible that the same issue occurs again if the
 string has grown in the meantime. It is recommended to call
 :ref:`VIDIOC_QUERYCTRL` first and use
-``maximum``\ +1 as the new ``size`` value. It is guaranteed that that is
+``maximum``\ +1 as the new ``size`` value. It is guaranteed that is
 sufficient memory.
 
 N-dimensional arrays are set and retrieved row-by-row. You cannot set a
diff --git a/Documentation/userspace-api/media/v4l/vidioc-subscribe-event.rst b/Documentation/userspace-api/media/v4l/vidioc-subscribe-event.rst
index a6fc3c5fe99d..845a90573e54 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subscribe-event.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subscribe-event.rst
@@ -94,7 +94,7 @@ using the :ref:`VIDIOC_DQEVENT` ioctl.
 	a V4L2_EVENT_CTRL to be sent back to that same filehandle.
 	Normally such events are suppressed to prevent feedback loops
 	where an application changes a control to a one value and then
-	another, and then receives an event telling it that that control
+	another, and then receives an event telling it that control
 	has changed to the first value.
 
 	Since it can't tell whether that event was caused by another
-- 
2.54.0


