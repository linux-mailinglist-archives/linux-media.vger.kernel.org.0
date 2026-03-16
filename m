Return-Path: <linux-media+bounces-55910-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEr9OZMGuGkWYQEAu9opvQ
	(envelope-from <linux-media+bounces-55910-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 14:33:07 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FF929A751
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 14:33:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6ADC730602F9
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 13:30:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47652399357;
	Mon, 16 Mar 2026 13:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="R+upUlIU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF95398900
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 13:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773667834; cv=none; b=iinbd0172bxxNbGz46kzO352pzX8n+sfPplMchaVafiWSFa8k7SYirI4zJ38iZg4MtHtimOGMwXhp7gTXHzizU2vjk88vz4VdAFwYv4vx2t7z7CP9MmjZ8axn5emlMa4af1EZDdxzr3F+CSacn4itL1yMmjyjEZrrH0L6rSB+ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773667834; c=relaxed/simple;
	bh=8axnWdWKdYn5Kl6u06D/mWzG9d0fvx1AzG9O88LlXyE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=i61VHPsthU6wuTkyBSkmZXxusj42zhRJDYT+uV7wgTzWRJefFnrXmxLiHDNh4MaAVpfcD2nqymkWP1U9R9YVMmP8kErTkW+qH7tPzkE+SB0AWJSu5IVijfbDJg2Pu9f8dFIsraI4qeu4ePJvf9gPh2jGZkYGG/J4iJwHENlgRu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=R+upUlIU; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a13d1c6f25so4763409e87.3
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 06:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773667831; x=1774272631; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cC73jGyhZq61g5sKds/SJ/dQra55zzMykZbYPaPMQ2Q=;
        b=R+upUlIU1qkBsffgGG59KBvAX0+zxhH+ePpKSQc2ItkRUz8vL5+wafveNQhFOJjrdI
         v78HFd/0PAFeBQ78yYU/4QLKOfmilLYLLi4gom+e88AuLnB8arwDGRLfGX/z37eRg4a0
         XBcOXT8RVEJo24elMA44t5BEjwQewI/U7f3L4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773667831; x=1774272631;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cC73jGyhZq61g5sKds/SJ/dQra55zzMykZbYPaPMQ2Q=;
        b=CUjhOgI82x/qZph1sO5E5/kSr1jKGz6+QCkr4KSf5gEv5M3TsuamYAPJJV4I5ngXgZ
         BA9cjWyad5YfYY0XthKua6B969DGpeufy2Il17Y7cMuf9YVTbkG56vOQ9F8MwYIqvUki
         /uFWy25EDzLGCpi1f6spjm68G9//xs8UCMQM+xVRXy9F8p9qNGail9Gqkh14Ftue3tm6
         eXMo6OHbQDZ2/NIJHBJRK6fYxK9ex/meg3vZsmuYZ49bf3/k1zCGEtF7zuCjfalPloIO
         5ZnZqXrfX4YeG968v97VF3vJ+KqSaAwRaEOgIjn+nTtAzWMSyI/Y5pK//OdQ+jUTLG8N
         IcpA==
X-Gm-Message-State: AOJu0YweihBVRm9XyAW9uLHh8iOQk3SXU3Ial1/sFvrvTOa//xgVWyXc
	wjtzXsLYIh+oYteeb/SSFNZeIyhfuASWi6ekAj48U3w+fJNuqfSGAsrLO/b2v/G2lw==
X-Gm-Gg: ATEYQzxZZOaKW05NzTGy6tHmf3ZEtX3MVXk+GTjwM93sE7D58+LadnrMK/9RterCqQM
	arjzuGYxzYq07auuPjOVLPltoygzoIusKeRvsZ9YYtm7drvA+wEiRiv8UF8rihfWAKaTccYleRw
	K8n529PfJQP6pctNmQQHbu1QlOSWScREXmhQSYqsqNU3DqFnwjqgpMKm+qDp2XvvfQVloLGia+d
	wfVoBUYZ/lxaUQK6PlkjpIxfbfKMgBpEBHsTTMgPEyCRumoN1bMy1/rHJly0OZtMQ8DMbwQ392Y
	PrfT/aMRurzHWoOoG7PB9KtvmuLZiMIZxDfYXlqBrRWoO8fFWBhIsdXU+cxGjDBH5kP2cFPLev8
	DPZMAsJg72F9A4GYqzBgQjrf6p6Hms9mkv/YYO2HdZKLqG0UrAzobyRJb7Sxihp77ndWch0ysw3
	sZjN2h5PfMWq9bN4zlO/qdmjmzRhDxfKXCsZRGk+mGE+rk5htYz/na5boBZaVpzPK/dTs5leL13
	Q==
X-Received: by 2002:ac2:4891:0:b0:5a1:268d:289a with SMTP id 2adb3069b0e04-5a162706b41mr3038624e87.18.1773667830821;
        Mon, 16 Mar 2026 06:30:30 -0700 (PDT)
Received: from ribalda.c.googlers.com (27.69.88.34.bc.googleusercontent.com. [34.88.69.27])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15636b69dsm3469985e87.82.2026.03.16.06.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 06:30:30 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v3 0/2] media: uvcvideo: Fixes for frame sequence number
Date: Mon, 16 Mar 2026 13:30:28 +0000
Message-Id: <20260316-uvc-fid-v3-0-c793354469b5@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPQFuGkC/2WMyw6CMBBFf4XM2pq+oMGV/2FcYDuFWUBNK42G8
 O8WNhpdnpt7zgIJI2GCU7VAxEyJwlRAHSqwQzf1yMgVBsllw5XgbM6WeXIMBda11ubWeAHlfY/
 o6bmXLtfCA6VHiK89nMW2/jeyYILVqIyzyhou9dkOMYw0j8cQe9gyWX6r6qPKoipvurZtXMu1+
 VHXdX0DpahbDdwAAAA=
X-Change-ID: 20260310-uvc-fid-e1e55447b6f1
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Yunke Cao <yunkec@google.com>, Ricardo Ribalda <ribalda@chromium.org>, 
 stable@kernel.org
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55910-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DKIM_TRACE(0.00)[chromium.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 96FF929A751
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series fixes a couple of corner cases where the frame sequence
number is not properly handled.

Please note that the second patch has not been tested in a camera
without EOF.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v3:
- Fix typo in commit message.
- Add new patch
- Link to v2: https://lore.kernel.org/r/20260313-uvc-fid-v2-1-3f7a996d9047@chromium.org

Changes in v2 (Thanks Laurent):
- Improve commit message.
- Remove original timestamp and sequence assignment. It is not neeed
- Link to v1: https://lore.kernel.org/r/20260310-uvc-fid-v1-1-5e37dc3c7024@chromium.org

---
Ricardo Ribalda (2):
      media: uvcvideo: Fix buffer sequence in frame gaps
      media: uvcvideo: Fix sequence number when no EOF

 drivers/media/usb/uvc/uvc_video.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)
---
base-commit: a7da7fb57f2a787412da1a62292a17fa00fbfbdf
change-id: 20260310-uvc-fid-e1e55447b6f1

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


