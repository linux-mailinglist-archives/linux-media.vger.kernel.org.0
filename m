Return-Path: <linux-media+bounces-54770-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCk3ACnPqml4XQEAu9opvQ
	(envelope-from <linux-media+bounces-54770-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 13:57:13 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 974DE2212A8
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 13:57:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E76EF30390A2
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 12:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CC2438F225;
	Fri,  6 Mar 2026 12:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kUHZFVUt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF2C39020F
	for <linux-media@vger.kernel.org>; Fri,  6 Mar 2026 12:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772801632; cv=none; b=Kx/w7RhOdtiFQFzR0tvtEuZhWfD+/m/NVpJmXYrSYOXc11uRSQmjlMPTocgNpWTKw0BLmzJh/nn3m2SjPXiZz31TN0GZdbGUd2KUkadXWhOgipatIOKvlckPg3aGAQtCub5ARpUd7T1b7owdaTkQjekjpkI9R1v25qjy4sdWm64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772801632; c=relaxed/simple;
	bh=lk3J/0myuPulEZOU22yofh3RTU9+tKO22u2tikmqBYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yw8sX+nNIvYt3kcE02TMOQWMGjS/Jku9lveYm5u2J7r9B7n56io1fZLKVUyfnS/C8L3wbQdKJQ4K68rzPcSvXSk1dTGaNcTkgrRcSrR9HjdMiPdHqP+tDiQ0hbsV75ipco2qtgF8iZz3Zue+2EBtwWXsOKOvC8aNPoNl4keOADo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kUHZFVUt; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ae46fc8ec1so39423465ad.3
        for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 04:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772801631; x=1773406431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WMarrm7JpP1p2eI9Be2YtW3tsN95FbOLkt73JrG5xCk=;
        b=kUHZFVUt9gmXntYyxPyRxtxo2n+vVh6OQwWcfMYpLSJsBWdJq3IiGcwB+XEzy+Td8T
         N2JNH1q9r5YTg2VfC+W4biHtVnS/hLpwBJEzBVTNmeknI/vN3r9JH3X09WrC/Uc9xPCa
         bu/astA7qcAC8vW7uuZBAtQLJswFtapm1FVIac/2513YhBikRSQJEHLxkRTgjn6c+Sfz
         5oZWqiKGmgsRT3DVHR5znTPmzcd0x2AEZHFWUvpz8/uJFCukx2WY6urIaVvW15g+jacB
         s0VzQCUfLEyrHG58Vmmxgqhv8ijHd5KrLr49nue5JaKL22I3zpl/IcWp1/hvdBsc9zrr
         1eBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772801631; x=1773406431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WMarrm7JpP1p2eI9Be2YtW3tsN95FbOLkt73JrG5xCk=;
        b=accwGUygE3D3Y3tLvCFr8rVO4k6KUDT10HW/B+1Q0++QGhPN1tUxco6riCi9B2zZ1c
         jJsU5DvSQFvM89uzpfWfsxze/5/egUZQCg9YXcShQYjT+uQl+PlDVPUUY8DZWCc9IKVK
         O0zeP/KgNl/WqDi3qq/RkBzpqZ2Y2Hr0b5HMyRy6BpsLcWsqRZn4RGDt2bpGgkkNKVnK
         m2d2GR8/2E3gs34VVa198hiPKbjTL43m5OttGLedL5kfhyo4UTOhCdnggmeGVAkXfJGX
         wBdEjRaRlAjfyQOzr1u1pmd/BHEXj3iHEbtga9RXv4ZzWxGbAb1BQ4sRP/o8q8/1/1tz
         zJSw==
X-Forwarded-Encrypted: i=1; AJvYcCVqU1ZqKAl4z1ihR9iutBz08B4TkIn5erG4pHwzXOQnB/rCD8exL8XkZfgtUqk+DEjlb5AeN2GchZzTjA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw91I+Os+tWS7RAFQlbMoXefMh3KHXb7PBXNMCSArsMwoZXZO0T
	ADEgDLrJlF3CWDpzb1agkYrYmqQS+S20FVGEP+sW98yEHgKxa2kXqiqb
X-Gm-Gg: ATEYQzzHvrDmvgqElvTAnDLR3M23E9okal4wbqUNsnde3h896uV8j6tu+h2J8NsZRJb
	Z07h9vKJsQZ2ZF4ts/SpFgNQ8EJf5WoDmuImztshxyTucIxWZBJH3aqSHcmpgTGvPRz03nuY9wy
	d+iHMyvzqBApy5P8QkGWBrm6VsXQDKn6z2RK09vel0Sm70f/ZoSYdvUkHqyerCyPLICa3N/44xL
	5EJyjsT6+Iw7ykAHiqoQMAnNbsDqeGWGyHzBuKrACK4cTVc7h5AUCfCWikjVbt/5bb/roLuVZMQ
	t/sBCGbDxS79fakn1JSEw/5K6z/qQqchjSZ4NpLaVU34wTnI18aUU44Rb7LXjLWjTSyCHIup3H4
	PhMQ+qnoGFQd0rsXCfwMtVwnjqPdZwm9AqWcX5rjIZtHEB6dwTU4jFjx10Ahk6AA6P84s8X2RWg
	E2p5ykVzwYZTs6JVXI4xCPY/R6BfsjVcjmjStY0mnbKNnkKVD8uGjkE4Im+s7zu0eihQ==
X-Received: by 2002:a17:902:e890:b0:2ae:5163:c2aa with SMTP id d9443c01a7336-2ae823a1852mr21849015ad.20.1772801630811;
        Fri, 06 Mar 2026 04:53:50 -0800 (PST)
Received: from localhost.localdomain ([222.109.75.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f74e7bsm19149515ad.46.2026.03.06.04.53.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Mar 2026 04:53:50 -0800 (PST)
From: Yuchan Nam <entropy1110@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: laurent.pinchart@ideasonboard.com,
	w@1wt.eu,
	security@kernel.org,
	hans@jjverkuil.nl,
	linux-media@vger.kernel.org,
	Yuchan Nam <entropy1110@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v4] media: mc, v4l2: serialize REINIT and REQBUFS with req_queue_mutex
Date: Fri,  6 Mar 2026 21:52:23 +0900
Message-ID: <20260306125223.76040-1-entropy1110@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <aarKTtVvHpc9WBgZ@kekkonen.localdomain>
References: <aarKTtVvHpc9WBgZ@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 974DE2212A8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,1wt.eu,kernel.org,jjverkuil.nl,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-54770-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[entropy1110@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

MEDIA_REQUEST_IOC_REINIT can run concurrently with VIDIOC_REQBUFS(0)
queue teardown paths. This can race request object cleanup against vb2
queue cancellation and lead to use-after-free reports.

We already serialize request queueing against STREAMON/OFF with
req_queue_mutex. Extend that serialization to REQBUFS, and also take
the same mutex in media_request_ioctl_reinit() so REINIT is in the
same exclusion domain.

This keeps request cleanup and queue cancellation from running in
parallel for request-capable devices.

Fixes: 6093d3002eab ("media: vb2: keep a reference to the request until dqbuf")
Cc: stable@vger.kernel.org
Signed-off-by: Yuchan Nam <entropy1110@gmail.com>
---
Changes since v3:
- Revert guard(mutex) usage in media_request_ioctl_reinit()
- Restore explicit mutex_unlock() calls in media_request_ioctl_reinit()

 drivers/media/mc/mc-request.c        | 5 +++++
 drivers/media/v4l2-core/v4l2-ioctl.c | 5 +++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/media/mc/mc-request.c b/drivers/media/mc/mc-request.c
index 8ad10c72f9db..4f632a9c292b 100644
--- a/drivers/media/mc/mc-request.c
+++ b/drivers/media/mc/mc-request.c
@@ -192,6 +192,8 @@ static long media_request_ioctl_reinit(struct media_request *req)
 	struct media_device *mdev = req->mdev;
 	unsigned long flags;
 
+	mutex_lock(&mdev->req_queue_mutex);
+
 	spin_lock_irqsave(&req->lock, flags);
 	if (req->state != MEDIA_REQUEST_STATE_IDLE &&
 	    req->state != MEDIA_REQUEST_STATE_COMPLETE) {
@@ -199,6 +201,7 @@ static long media_request_ioctl_reinit(struct media_request *req)
 			"request: %s not in idle or complete state, cannot reinit\n",
 			req->debug_str);
 		spin_unlock_irqrestore(&req->lock, flags);
+		mutex_unlock(&mdev->req_queue_mutex);
 		return -EBUSY;
 	}
 	if (req->access_count) {
@@ -206,6 +209,7 @@ static long media_request_ioctl_reinit(struct media_request *req)
 			"request: %s is being accessed, cannot reinit\n",
 			req->debug_str);
 		spin_unlock_irqrestore(&req->lock, flags);
+		mutex_unlock(&mdev->req_queue_mutex);
 		return -EBUSY;
 	}
 	req->state = MEDIA_REQUEST_STATE_CLEANING;
@@ -216,6 +220,7 @@ static long media_request_ioctl_reinit(struct media_request *req)
 	spin_lock_irqsave(&req->lock, flags);
 	req->state = MEDIA_REQUEST_STATE_IDLE;
 	spin_unlock_irqrestore(&req->lock, flags);
+	mutex_unlock(&mdev->req_queue_mutex);
 
 	return 0;
 }
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 37d33d4a363d..a2b650f4ec3c 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -3082,13 +3082,14 @@ static long __video_do_ioctl(struct file *file,
 	}
 
 	/*
-	 * We need to serialize streamon/off with queueing new requests.
+	 * We need to serialize streamon/off/reqbufs with queueing new requests.
 	 * These ioctls may trigger the cancellation of a streaming
 	 * operation, and that should not be mixed with queueing a new
 	 * request at the same time.
 	 */
 	if (v4l2_device_supports_requests(vfd->v4l2_dev) &&
-	    (cmd == VIDIOC_STREAMON || cmd == VIDIOC_STREAMOFF)) {
+	    (cmd == VIDIOC_STREAMON || cmd == VIDIOC_STREAMOFF ||
+	     cmd == VIDIOC_REQBUFS)) {
 		req_queue_lock = &vfd->v4l2_dev->mdev->req_queue_mutex;
 
 		if (mutex_lock_interruptible(req_queue_lock))
-- 
2.52.0

