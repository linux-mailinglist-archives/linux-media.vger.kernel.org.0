Return-Path: <linux-media+bounces-62709-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QB1BEaYcFGoGJwcAu9opvQ
	(envelope-from <linux-media+bounces-62709-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 11:55:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FA75C8D59
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 11:55:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6845E3032073
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 09:52:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 881963E8349;
	Mon, 25 May 2026 09:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OXe63wV4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29C43E5EE3
	for <linux-media@vger.kernel.org>; Mon, 25 May 2026 09:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779702771; cv=none; b=mQ5m3fBImu9PHDtB/4Ob85qVT4UkZJF2MaqvCcpIGtraJ0Bv87s4CyKhc21tzs3p75Es40iLV65k97VdVIM5oWdrouJI/5L/9GuIC27jF9FflzlwXnYkJHhFFXHZ5O9J64sypH4iFo7ZsF694NhTYKKR6wFZec+bPYsTF3lFq/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779702771; c=relaxed/simple;
	bh=4B9KkP1btML4C6oNkrTHn+OUIMQeidMbAkDiIWR3XwY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cws8AG3R4Cx9ouC5eUTB2cGrpMZeq7+Cglw7q+fKruPNrT5sIapeG2lNHXn//cE4bT5dPvzp5zcR1EqJANleDn/gjPEfZ7AXkqixybPeVNpLPN6ttAtMlKFYRBbbHZAEWw1oshrBtLenrA5As/C7O0DGur+Q61CNI131/b4ucP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OXe63wV4; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2bccb978bd9so59972455ad.0
        for <linux-media@vger.kernel.org>; Mon, 25 May 2026 02:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779702768; x=1780307568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oIFEnpVuawucZlIPGTpnFigTasBUEJzr8Hl8oaehmP4=;
        b=OXe63wV47PkWs03ZPySrt/2gPtLAHsNor9VUjIKALf3FkjA6cYDgOa0x/xOdhjrIq9
         9/4nS71Ud18+q7jSmnX3qNwWtjo8bKyCcl0YRZdDo+1JpCJ9uX/zyQop8lqS+aNADYHm
         blBqlSguNEVntBR71ip6tthOLJajRioknYfAw2IYmGkdMrk7RnG4WSFCVjKBc4bt16lQ
         oY4xHEtPyjmFbmRKQhI3ENk+nwAWSeZd0UjIohGGbBO1VxPNJL44cP+4T3LMdqhxtLwj
         gUVtDRItqp48RB+ZvaYQt68BhIVyFOL2N1/bBxM8pGmZD1zs0Kk+5Ueq1YN5QT8DD6cO
         o8Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779702768; x=1780307568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oIFEnpVuawucZlIPGTpnFigTasBUEJzr8Hl8oaehmP4=;
        b=mBpJ0uJPkjHpaRLRvJrSy+sRA56KDQ3aPfljieEq7+A7F5Yr9TIVQgz8+C123Zpnul
         t0ChSU+sN7mwCpXsPKGA6Npk2QjHdtYPKl9HcCDU3gML2+U6rf519R7kNpWSTsXKAo4C
         LNklSODGUgnYmzMQ/4w3IaSUay93t4rassgiS/jHvohMBnbyQZrcaM1IRkPjWJgYBjsY
         udyLt0udtX9VaVu7a8tBXQsrA6oGyjx4VN5/MJ61YZmHrrHUrJf/8kCoU6M7I3ZkPAfI
         ULg3lsjftH6sRVHsdgPE2FV1GPD3iCHAeS7MvvKpXWIfhbXyTehGdvPSv4TnIbn1SdQs
         F/5A==
X-Forwarded-Encrypted: i=1; AFNElJ8tA+HTRwz+pNAAwTs2dZPLgdeVY13FKtypzByGSObR8yOd5yGmGCekpKY6CkUz9o+gt8add+BMmIQO6w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7OzKgw1jlR0zoPC9m9iBrBu2V7SP78Tl6KDJyu/QAQ2WkLWna
	goWN1r0/NyNANVHsz/9FbogvNmZBvbA4qj63l1c1aEF3Sek1ZKmYMO3hxlhbbA==
X-Gm-Gg: Acq92OEta+FZ3mYhr6h9l8b3MYgsAxsZb5WNHEjjG/cRLp1DvgQOo8ThZIK/tS9cL5/
	U1C/qcZMxjzX0n164jJjHhUlQAN1q2qH7qTuf2TumNKcO9uuf3cryUtGp4Rv7kxoYC2uXz4mP5j
	mLwHMfAoIfcdBj+Hhm+F4Hwl90cXnH85F9cAbTlVSEZVDFJskpI/y9pFaBi7p2IHb8T1LgWbRti
	V04AU8W/Bd0zPVYu98wKpzra1zBW2R6sH/L6+W4e+xiKq4Q6hfqiRqfAq1e+x3zbSSOzduvVp4I
	bLK4VbR2IjoW2ZOwVMMJfT9axTQOKRkQbMhv41tZIbJH1/GyNNPAP+wPYJZbJdUGYKa9tbzUhRI
	yPyXzMkUuR6pSvUuNPid2j2hd0mSD+bL6J/3U8FhX1nH7vYFiha8jdE+/h4w+Bsl4xvSgPWWt43
	cqe8Ujeuh85KDJ0FXhHVTt
X-Received: by 2002:a17:902:f546:b0:2bc:8e7d:3dce with SMTP id d9443c01a7336-2bea23e2057mr157194235ad.27.1779702767866;
        Mon, 25 May 2026 02:52:47 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.230])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b2cd6sm92533615ad.52.2026.05.25.02.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 02:52:47 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Maxime Jourdan <mjourdan@baylibre.com>,
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v5 2/6] media: meson: vdec: Protect session exclusivity check with lock
Date: Mon, 25 May 2026 15:21:50 +0530
Message-ID: <20260525095216.12078-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260525095216.12078-1-linux.amoon@gmail.com>
References: <20260525095216.12078-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62709-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,ndufresne.ca,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,linuxfoundation.org,baylibre.com,googlemail.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linuxamoon@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 95FA75C8D59
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the check for an active hardware session is performed without holding
the core->lock mutex. In multi-threaded environments, two concurrent
STREAMON ioctls on different file descriptors can simultaneously find
core->cur_sess to be NULL, bypass the check, and concurrently call
vdec_poweron(), corrupting hardware state.

Fix this by wrapping the session exclusivity check inside core->lock.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260521090944.F35401F00A3D@smtp.kernel.org/
Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v5: New patch.
[High] Concurrent sessions can bypass the hardware exclusivity check,
leading to simultaneous hardware programming.
---
 drivers/staging/media/meson/vdec/vdec.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 18a22b79e835..e72f54af026e 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -286,10 +286,13 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 	struct vb2_v4l2_buffer *buf;
 	int ret;
 
+	mutex_lock(&core->lock);
 	if (core->cur_sess && core->cur_sess != sess) {
+		mutex_unlock(&core->lock);
 		ret = -EBUSY;
 		goto bufs_done;
 	}
+	mutex_unlock(&core->lock);
 
 	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
 		sess->streamon_out = 1;
-- 
2.50.1


