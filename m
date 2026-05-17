Return-Path: <linux-media+bounces-61844-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HWLFKekCWp8jAQAu9opvQ
	(envelope-from <linux-media+bounces-61844-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 13:21:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DECB9560B04
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 13:21:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 31EFC300D60B
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 11:21:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C92835FF6E;
	Sun, 17 May 2026 11:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KD9hztnJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C165835A933
	for <linux-media@vger.kernel.org>; Sun, 17 May 2026 11:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779016859; cv=none; b=jcHrhSoUUROm5QSBR4H2AneQKQlvnNykder6+mRBrNpkBjEL99DInln1X7OlfMHY++JNFb/4mVPoghkwnBbmC7+NKsLLdt+Fa8PccXWCy/TzX4LeXhfjq6BKzc9+7SN7OcWuOdUDEhMtKTom1/mVaz4CwzwCASfGKndMswWe0rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779016859; c=relaxed/simple;
	bh=0FEaLogsDoMA10mynhfXjWCCmhduignknw3VZEplDtw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M85gBQkRBr4qYbN0yYkXOHck6WBP6M5k+fiGN1NwMbn+sWvBYfcVUy7cNcYVzPr/Vb9/qW/xaR9a3IUBvL2110DQoRtiN/GM7J19rna6Wckka6dmlXMvkoQsD7ggJ26OpbH7cmg+tTZQVGXrsyONKyWZSamZ4NSxWsJ8EChIU8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KD9hztnJ; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-36643b96b99so1253581a91.0
        for <linux-media@vger.kernel.org>; Sun, 17 May 2026 04:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779016858; x=1779621658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q/ortlMh8x+p+Fhr+BMJcjANUffMVhXyAdYtT0wR3sU=;
        b=KD9hztnJIimyNEY4KBlZxQwoXyuzqSmx0XoxRkT65bcTcsSe8f7tPGoDfL3YDDEgaN
         74wqF5YsvpU+miuIUBCKX8BNO9QOHanBykK2hstWi11aD79WlCuFi3tMk+WQCKoYY/NI
         TTSkrYDaXhiuu8JXzTkyCEMxYYfX8tTddoUktFxXGnB3qPJvpFRjqoeU+eRTNyFCmXSq
         7kFgvT/h52f5mxRYqX/Xk6SnQEjGpdlNGyIvo0ZINiWNNtw85VZpOj+4tJUcg0cUFnlD
         rFntKFpJYs77U87nX8U6ekTyDlKvERrVs/7txqWFVnQfPrYHAzVNzdLC6qNXRLQbmMNV
         nGZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779016858; x=1779621658;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q/ortlMh8x+p+Fhr+BMJcjANUffMVhXyAdYtT0wR3sU=;
        b=N8JfKlB8yBOB2a+2ml8ldcyfKzydwD10xxzGc42F6/4txhpCFt2BWk8Dd0oXGFUvxP
         +f6wziQREevhzxiekDxTnkQT7rrxKgi6IKEfPLmArtElHGkWGrNk5Yw5VNDwOzk6Tiu0
         FzxKAHW7vmB51QfDZdUbEKzCsK18JvY73mZyvQ1sPJvfl08REd42f3xVigEFwf26C5MB
         bpM0WE1kSbNYeE6s6YwYjEHGqq5bCF2tZqmAEgsEqLT7KB8yE+SgArWDjuDReSP/iRoR
         1Y6TUzKK2WCIHRZwIAPJTpn29lNrGkv8bDplVz5FSl71prc0uTBzBXxEtMBwsn3qjZHQ
         BupQ==
X-Forwarded-Encrypted: i=1; AFNElJ84rvBEpKAU2c5E31eWxKY0IHoZ+BscZyPPPRGLDnj5fnbTYH84X3xeZ7CWivbqNuva4eQo10I8gHXVcw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVe2rbMZyQfaiWMTyaVmBW4OddM7qCzolCi0VAZVvrCbp79pw0
	jkP07c/mVXFk8ee1eiEdAwmlBjZ1kDzpu45OhlxrBxv3tUPFcX4Luvcd
X-Gm-Gg: Acq92OHXFg/cf5oceV4JLbJpncpzepkabRo7YFGQ4iHwsxPEX/ncRZRts1pJ1PEDCV1
	GNOBIrQVwmd0zyM+d4JR1tn6tJLUTUtqF8tYz4KSVl4yFpFcgj5nGZik+fsVrKQyWvp0I5wyJii
	1MQcmJqLDefvxL9EWYo/+3W8Evewaxvwmep3eOsfvemKad+pwyTGInBlYF+ojIy0rBGrhsxe7v4
	HKsCUGCrIUK7XICRqQYqqiuxQ0cpoYYzki6jj6An7Un2RXjdmKNkdzB2xfCAIKQlYh/pDfaiIOf
	Hlne1QRyxNZY8rTP7pT5MjkTPhRI/yVMNYn4RyMW/JSJyXWifPoddqfRgNGGz6+Xq53a8JlSlC+
	SLFlVy8hn3AatepphlcFGDRFRGDEuHlDtpGTxBHaHCXqUz9ipByA34dYpQ03JrXmAUz9H1aL6gC
	5NAnDL7w==
X-Received: by 2002:a17:90b:5706:b0:369:a9e8:dbf6 with SMTP id 98e67ed59e1d1-369a9e8dc5cmr2010367a91.12.1779016858087;
        Sun, 17 May 2026 04:20:58 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36959fa9d84sm2883385a91.8.2026.05.17.04.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 04:20:57 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Bluecherry Maintainers <maintainers@bluecherrydvr.com>,
	Andrey Utkin <andrey_utkin@fastmail.com>,
	Ismael Luceno <ismael@iodev.co.uk>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hans.verkuil@cisco.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] media: solo6x10: avoid double free on encoder register failure
Date: Sun, 17 May 2026 19:17:54 +0800
Message-ID: <20260517111754.946843-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: DECB9560B04
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61844-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[bluecherrydvr.com,fastmail.com,iodev.co.uk,kernel.org,cisco.com,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

solo_enc_alloc() allocates a video_device with video_device_alloc() and
releases it from the vdev_release error path if video_register_device()
fails.

This can double free the video_device when __video_register_device()
reaches device_register() and that call fails:

  video_register_device()
    -> __video_register_device()
       -> device_register() fails
          -> put_device(&vdev->dev)
             -> v4l2_device_release()
                -> vdev->release(vdev)
                   -> video_device_release(vdev)

  solo_enc_alloc()
    -> vdev_release
       -> video_device_release(solo_enc->vfd)

Use video_device_release_empty() while registering the device so that
registration failure paths do not free solo_enc->vfd through
vdev->release(). solo_enc_alloc() then releases solo_enc->vfd exactly
once from vdev_release. Restore video_device_release() after successful
registration so the registered device keeps its normal lifetime handling.

This issue was found by a static analysis tool I am developing.

Fixes: a7eb931d635c ("[media] solo6x10: move global fields in solo_enc_fh to solo_enc_dev")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c b/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c
index 91b5c4161930..ab85d86b68fc 100644
--- a/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c
+++ b/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c
@@ -1295,6 +1295,7 @@ static struct solo_enc_dev *solo_enc_alloc(struct solo_dev *solo_dev,
 		goto pci_free;
 
 	*solo_enc->vfd = solo_enc_template;
+	solo_enc->vfd->release = video_device_release_empty;
 	solo_enc->vfd->v4l2_dev = &solo_dev->v4l2_dev;
 	solo_enc->vfd->ctrl_handler = hdl;
 	solo_enc->vfd->queue = &solo_enc->vidq;
@@ -1304,6 +1305,8 @@ static struct solo_enc_dev *solo_enc_alloc(struct solo_dev *solo_dev,
 	if (ret < 0)
 		goto vdev_release;
 
+	solo_enc->vfd->release = video_device_release;
+
 	snprintf(solo_enc->vfd->name, sizeof(solo_enc->vfd->name),
 		 "%s-enc (%i/%i)", SOLO6X10_NAME, solo_dev->vfd->num,
 		 solo_enc->vfd->num);
-- 
2.43.0


