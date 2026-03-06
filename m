Return-Path: <linux-media+bounces-54750-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFCdMCK4qmkiVwEAu9opvQ
	(envelope-from <linux-media+bounces-54750-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 12:18:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A6A21F8D3
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 12:18:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 45A8A30C3F55
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 11:17:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2494387376;
	Fri,  6 Mar 2026 11:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EtGS1Sgo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB25375AB8
	for <linux-media@vger.kernel.org>; Fri,  6 Mar 2026 11:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772795861; cv=none; b=qkpfDsBa0aDIi/nTsZr5tb1BW/GWNZgH2jECO4h4BrgYTlsi9jEG2UTk/gu3Yqjq8BEScD3va1NJO9kd0YDMeC+XAIbj9vq9oIm5+iiGGYGEpoRrFRzMm9dfeXcn9USCufZnOGbM81GhSamL5pgjAHUYM/FAfExyofmPf2asb04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772795861; c=relaxed/simple;
	bh=kxQFgF00FqetWB186Nthnk42/+P9gNKbmE6csqOG0aE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UZoxutTwl9bkO2y8njIKdcStZS6wQRaP5HgRgwLq2/Msc/FoPZs9s9eDzGe18M4F9vFgkKWesleYLDS4hM9j3uCMX9ZMFIGhxf4QnGgaP3Lqjora8eAIJMeKE6vKslT0ouE9Jmw2DAVVjjVRghFBO/vQIvZPyRdnH4HEZYyndBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EtGS1Sgo; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3591cc98871so4066245a91.3
        for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 03:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772795859; x=1773400659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vYnXWBkw/qH+Q2zyzZAhfnGzimObPmqYD2+6iLvE3JI=;
        b=EtGS1Sgo28fPwgXsijN9sDIvla7uefOu7YMqcp3F6iZXAJo81aCrjpB/UqhBL6tm57
         XzW0ObZ+hewDy1OZzRQbhdBX5B6tIIOZdTJIEcX1ahYYv6ttg9Sb7YidgdNeo/SPaNI6
         t4mcx7FGyIXMu22xSV6ojKnB6DB1CWWgf7fF4CxlHWSTIpadKTiN9wQ5j8JZmV8pBhBQ
         JvhycE33wSKMAIzkcoRaUvVHu56wRQ7O2kSBX/RSANGvQxktM/ZbzGszquTBN3T0wo9k
         0ZBr/ot9IOf3P+J9k1N8H9hVwnaMdweXy9NdunSXODYanQVAXysB+EYoPErVDiRvQIgs
         t3Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772795859; x=1773400659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vYnXWBkw/qH+Q2zyzZAhfnGzimObPmqYD2+6iLvE3JI=;
        b=VBS6SJagyweq8NO4yDxeifohK3QOpDawLYiMpiAHS6vZ5QGrflJnQcEFVwuEZ+m2MS
         rhSO3McpTPU4UlcsAO6/U0xx5QqpaTI0KT6vzzIyStE8bt9vxH2y/5uRfC9OTwGzXGpr
         tc6Zzz7FtfJFQWUijm6JnP5mcRCaBGfieilb5Spi/XnjtS8uhM0LzTAJcvANtsiJKEQH
         PVvv4SnsYtOPe2nAb6YxTKsJ/gKCKlg+BzNcZ/o+0bLprD3gNTli0TUArcAD5eV5NGrD
         T+CSwwKZMafKD/R72SxanN+5XdgNlcA2rvKu/Sg57O2sh57M71TtPFL7Z0uJ58gSclmz
         lpFA==
X-Forwarded-Encrypted: i=1; AJvYcCUNWtlBBC0mRosS9xjlk+dmdsMz8bWMR1xtRX9rkQuA2x7rYotKMYT/JO/Hhk+bV/LG075faLoNIMHdYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrwbDOGCg6HzqfDfF1XziqedF6rRKUbhqiTzYe28k1LpN8gwfz
	fERLFSxthpt6/ZFBJfkNV0VHulXahpfn+8PY34tfcT6oPbtlyeSBxNJP
X-Gm-Gg: ATEYQzxIjW7wLfMvI+cgRxeVuAuTTQE91PcMA/2XsH2nVg6cgo/ZbCrJSUgqEtqwEgY
	6qE7MBVrjK3/l+wO8xmJvsMO8jPsv+gVOubNkcre4Yv2TydYbGMaud1VD3wArEnUjFyjWEzKhbg
	nViztbCbxjh6XEDk98w/JNRqEw0DUzFwP4lTyYxdZLZf6eqjtOvd0y2gU3A0hWQuNHFlwdgnQDi
	hQLpqPzMQfsJmFw95SVfCFytkOK2z5BR6v3EAju14G/3XzSI3HhqsjjLkXBoiL3ukFxa7Mpd/nN
	DOT35XkpVUSGOEYVxfXhR/hY+v7U1dXLe5DiRjEdAFGO7rr1gN/BL0/yvKDXUMwU2MHanNp+V39
	j5IXeH7IVxvwDiYSgy1YMiLskIpKtKPNph7alvbqSq1gZ0JA2ztueSZ2izLmpcXtVrwm7xWqK5h
	M6X2gK8swWSqLd2s/uwNwDJVw4ooEERXWuDA+gEywDPkTQN0D/tQkwXnA=
X-Received: by 2002:a17:903:2b0b:b0:2ae:5dba:c8c1 with SMTP id d9443c01a7336-2ae823677d9mr19770335ad.7.1772795859044;
        Fri, 06 Mar 2026 03:17:39 -0800 (PST)
Received: from localhost.localdomain ([222.109.75.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840ad379sm15847745ad.76.2026.03.06.03.17.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Mar 2026 03:17:38 -0800 (PST)
From: Yuchan Nam <entropy1110@gmail.com>
To: laurent.pinchart@ideasonboard.com
Cc: sakari.ailus@linux.intel.com,
	w@1wt.eu,
	security@kernel.org,
	hans@jjverkuil.nl,
	linux-media@vger.kernel.org,
	Yuchan Nam <entropy1110@gmail.com>
Subject: [PATCH v3] media: mc, v4l2: serialize REINIT and REQBUFS with req_queue_mutex
Date: Fri,  6 Mar 2026 20:17:14 +0900
Message-ID: <20260306111714.25524-1-entropy1110@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260306104421.GC242211@killaraus.ideasonboard.com>
References: <20260306104421.GC242211@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 28A6A21F8D3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,1wt.eu,kernel.org,jjverkuil.nl,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-54750-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[entropy1110@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
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

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Yuchan Nam <entropy1110@gmail.com>
---
Changes since v2:
- Use guard(mutex) in media_request_ioctl_reinit()
- Drop explicit mutex_unlock() calls

 drivers/media/mc/mc-request.c        | 2 ++
 drivers/media/v4l2-core/v4l2-ioctl.c | 5 +++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/mc/mc-request.c b/drivers/media/mc/mc-request.c
index 8ad10c72f9db..69e2f9d4ef01 100644
--- a/drivers/media/mc/mc-request.c
+++ b/drivers/media/mc/mc-request.c
@@ -192,6 +192,8 @@ static long media_request_ioctl_reinit(struct media_request *req)
 	struct media_device *mdev = req->mdev;
 	unsigned long flags;
 
+	guard(mutex)(&mdev->req_queue_mutex);
+
 	spin_lock_irqsave(&req->lock, flags);
 	if (req->state != MEDIA_REQUEST_STATE_IDLE &&
 	    req->state != MEDIA_REQUEST_STATE_COMPLETE) {
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

