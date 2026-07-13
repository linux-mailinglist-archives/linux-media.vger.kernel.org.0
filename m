Return-Path: <linux-media+bounces-67486-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id x67tMfTXVGrjfgAAu9opvQ
	(envelope-from <linux-media+bounces-67486-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 14:20:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3618D74ADD8
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 14:20:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=PjOEqM4o;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67486-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67486-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 75EE932C35C8
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 12:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42264408604;
	Mon, 13 Jul 2026 12:11:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD2940242B
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 12:11:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944715; cv=none; b=P9AGXXWfLxhZn/XmW/8A0o+JYFUvJRQj7sr9a1N5u2bOEv+/75rcxULbj6uw5su6YaEvWz6kp5chpNeKe3XpOsBUQkc7mbGxMNXcv4lN3RNGBFMQ9DBqLesM5qu2NQ87X/0mBZOETOHPOEua4+6OyAtCy4R2V/Tdp67LN1pTuLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944715; c=relaxed/simple;
	bh=ptkcLZC/rZ3ISEyM/x91NL/C1Etf2/yRncxk30AlMs0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QaZpjAJnVcePcs90aUYAK5YIuZrcKZVQpt+rSQWj35UlLT5nRBsmePcGkEQd2Hj8zI4pAF6TLG+DnhJeLEtgvseRJIoll6/T+pWt+UuO+wxk2721btd+8lF55HhYQbqy41Q1qZB/1HECNsw1NBamHdqfzTFBHv7Q8xX8BRCkLyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PjOEqM4o; arc=none smtp.client-ip=209.85.216.50
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3811e59df58so1977396a91.1
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 05:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944714; x=1784549514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M8Fc1y4+RwjniJfgwRtIk0X9ABaeOzCopsCGLc1zspc=;
        b=PjOEqM4o0ovCqKiaFjVJqWCJuuV52AYTqcRtlAQKII5bEone2chz6L8trltPCyiVBE
         Ky6SzkltMCBjlmmvQwgdYzyTbz5/o566wdNMqeVUThx0jsoZ5KZsoa9HwrQ1uuW0AvZv
         MRZ9Xaj2NQoViPTRh0aqYe057dUQ/0J28AoBf8+boowUuo3ydhhxZ14M9x/ngp8K3li9
         OsUL10czxNdEHr75rUzuQxlC3mrZNAHOqKfSrXvJMi1scas3gY5NXz7V3MGyTv7zFBD2
         fuIU3VcJXBpvhnZPgQF4yjNy0f1ah688qtByKTDbCFYmNrmB9INUZ8iVLwbBiplXdNpq
         MoCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944714; x=1784549514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M8Fc1y4+RwjniJfgwRtIk0X9ABaeOzCopsCGLc1zspc=;
        b=bZOhWZyQDz9GilziwnvPIP4Y0JW1l4skSmLk4bhqnt+9uBVAX7khFTuVbN99NZTobO
         /iLrtHK6VHClH0lAKtRz3ycM64/mIY3kCaDayWWKMQD3jbHrAndLbgefaCPlrhoar953
         GkflNwGjV/vmCEJsJPH0XzWAiy9QDuPqFqNX4+YRA1nOCgxnPSRE3Di+EXn7mVd1JBbK
         JvoQy1F4D7KOFUhIzoQF39ZEHNk2JTdg0w6iFR0JL8qjbXHANh24K9vf2YgXAdP2No1x
         NY+vea5oVh/sqhsecMXkgJmjAlafBP7BJVUD9lOKR852TuJnlc2+PD9lFcaHLwa8S8kY
         ga1Q==
X-Forwarded-Encrypted: i=1; AHgh+RpIdQqyfAX7D/gRZakXnzzeofhBQXks8GuGwIgeKDRRb/T8AdI+t6714XabkA9Ggo7k3msdEoLxORB3uQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl0Y7uBx19enFomGi/iArf26CNFmPUbzg4pmpSPyvZZn5SA/I9
	Ywkopl4eGPs54z43zPYrCFXIptDnzXee5b47ob/l/U1jhe3Vl7oNLUwZ
X-Gm-Gg: AfdE7ckKirhcjm3O8ZcA4c/eMSbd1wEA6scxkEfCzzPkMf9KoiiMdT4WCsc0KznDKhv
	XFXgw7nFyKNnmErv9ZJ12lcNkSRLQ/QuGBlzRheeT/fYMxU01X8i2AYB3CDVskG43nE1nxO8ik6
	Wkw/Ynkgu9AgSaS5Ri4O6UUIZ1TcPm0yzP1nwWc5o6z4r9dTTenoMYCKS8r4QgOepp+/susR/lr
	On8FOCAbarJ32BwPQbLcwMJM79RuU6nFP5gllpyezQRyXLAnDEbCJUz2do70kGdfJImUKygXckS
	Y5iWMtwuVO8bLq8uQl2X1pRW3FyK9RjFgofOiJkBXkdpmJ/PqRKHFiCpwMd2hfqH67L7kwN/R+b
	/FfHORXm+/lO5H7K/EwojOq1w4t6mbLdXQgr+Bq2uCZzWOfyISp/cSa3NZ1lEZ5bgIAt99ocz+w
	5xU6GBAHrbZg==
X-Received: by 2002:a17:90b:4c51:b0:37c:607b:2cd9 with SMTP id 98e67ed59e1d1-38dc7607589mr7644160a91.0.1783944713757;
        Mon, 13 Jul 2026 05:11:53 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:11:53 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Doruk Tan Ozturk <doruk@0sec.ai>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v7 17/19] media: meson: canvas: Fix Use-After-Free by linking canvas provider device
Date: Mon, 13 Jul 2026 17:37:12 +0530
Message-ID: <20260713120840.17427-18-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260713120840.17427-1-linux.amoon@gmail.com>
References: <20260713120840.17427-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-67486-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:dri-devel@lists.freedesktop.org,m:linux-amlogic@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux.amoon@gmail.com,m:doruk@0sec.ai,m:nicolas@ndufresne.ca,m:sashiko-bot@kernel.org,m:martinblumenstingl@gmail.com,m:linuxamoon@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,baylibre.com,googlemail.com,linuxfoundation.org,lists.freedesktop.org,lists.infradead.org,vger.kernel.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linuxamoon@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,0sec.ai,ndufresne.ca,kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linuxamoon@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ndufresne.ca:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3618D74ADD8

The vdec driver retrieves a canvas instance using meson_canvas_get() and
stores the raw pointer in core->canvas. However, the helper drops the
provider device reference via put_device() right before returning. Because
no formal device relationship is established, an unbind of the canvas
provider driver triggers a Use-After-Free (UAF) bug when the video decoder
subsequently attempts to access that memory block.

Fix this lifecycle hazard by enhancing meson_canvas_get() to establish a
formal managed device link between the consumer device and the underlying
canvas platform device. Using DL_FLAG_AUTOREMOVE_CONSUMER ensures the
dependency link is automatically torn down when the consumer driver
unbinds.

Additionally, handle missing link conditions using dev_err_probe() to
clean up upstream error diagnostics, and ensure the canvas platform device
reference count is dropped safely along the uninitialized driver data
path.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260530111022.9C6D71F00893@smtp.kernel.org
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/soc/amlogic/meson-canvas.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/amlogic/meson-canvas.c b/drivers/soc/amlogic/meson-canvas.c
index 79681afea8c61..5102a491bf778 100644
--- a/drivers/soc/amlogic/meson-canvas.c
+++ b/drivers/soc/amlogic/meson-canvas.c
@@ -54,6 +54,7 @@ struct meson_canvas *meson_canvas_get(struct device *dev)
 	struct device_node *canvas_node;
 	struct platform_device *canvas_pdev;
 	struct meson_canvas *canvas;
+	struct device_link *link;
 
 	canvas_node = of_parse_phandle(dev->of_node, "amlogic,canvas", 0);
 	if (!canvas_node)
@@ -70,9 +71,18 @@ struct meson_canvas *meson_canvas_get(struct device *dev)
 	 * current state, this driver probe cannot return -EPROBE_DEFER
 	 */
 	canvas = dev_get_drvdata(&canvas_pdev->dev);
-	put_device(&canvas_pdev->dev);
-	if (!canvas)
+	if (!canvas) {
+		put_device(&canvas_pdev->dev);
 		return ERR_PTR(-EINVAL);
+	}
+
+	/* Establish device link to prevent Use-After-Free */
+	link = device_link_add(dev, &canvas_pdev->dev,
+			       DL_FLAG_AUTOREMOVE_CONSUMER);
+	put_device(&canvas_pdev->dev);
+	if (!link)
+		return ERR_PTR(dev_err_probe(dev, -EINVAL,
+				     "Failed to create device link canvas\n"));
 
 	return canvas;
 }
-- 
2.50.1


