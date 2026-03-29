Return-Path: <linux-media+bounces-57489-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yF1mFELFyGnBqQUAu9opvQ
	(envelope-from <linux-media+bounces-57489-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 08:22:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4BB350ED1
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 08:22:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 46AAF301F9C4
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 06:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5D452BEFE5;
	Sun, 29 Mar 2026 06:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OrD4X9RK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162B82853F3
	for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 06:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774765366; cv=none; b=ZwIE21n7AStJt2883DqW0+2/EBDD5+l1Oxng+Ryumo5L65JSQ9CngpR9HnWhkV/piRvjS1dmrolCPfTzgi+n3sWiHy2xOC3W5D1WJxX4yrOjo3R4hRGxvcQbXNOrl9GoyAqfdDn7P7TpEv5cxD2GCm9PdXwJl+1sUpQ76bEZK6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774765366; c=relaxed/simple;
	bh=1NJ9txRS/sn2VYWeK0X022VlU7VuWTesL6jGa1e4M0g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EIurMdKEyX3M//Xpac1QMNqnAsUQB6FhAhCIAqaxsa26IaFrVSKa+LEx5SoADQvFGea9BD9Lpot+3ecJt1t9WMoc9X9dTSEmnVxesi/RoLC9Lm9PhEEunLf+k7BLtrC5NqfhlSiV/ore2MV4gHtv2ASItVwdd061VvC9eK5adjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OrD4X9RK; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-60508c1df45so1164552137.0
        for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 23:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774765364; x=1775370164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eTmuafzjN7+tejhsrhvW0OEJHSa9Jt6WQaBKlOmOs9M=;
        b=OrD4X9RK8KNNkhre/4O5EpoHJCgMwscbXC7dpsvAzXoe2nDunSAAlLPZoUJ6QXtOt2
         k8u2qw7MpTUgopaz6nhdUjWq6z1ClJQ2PbZ7nTD4u62TwEblt2jWh32Pg8FVdDzpLhSq
         w3CNSy3dZ0QTPaknAbqUDP+LsQlswMAz0yEwzR3jB+j5LeCDmqllfU2wBwPzSAdOnL/0
         TFDScR8KlqUjoFzGs0DiATEer0bl46bCC8kyLEWbo0GCrbb8L/umKH6wRI4GWzYkPzNC
         0dq6wSDKM3Y8vQgvU4qXErawPGfSBi6QSb35y9T9Yu87+IJ8CCmslobl7jHcjhaYZGoP
         Jb/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774765364; x=1775370164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eTmuafzjN7+tejhsrhvW0OEJHSa9Jt6WQaBKlOmOs9M=;
        b=bxYNg/+xFgigmJlkeyO07b30hZmkwSDnjTyVZkNEkB7Cf8Q+84JO0z607hSjyP0Pzd
         iWGd0/noHTRHhIdibTv9WL4nQ0uoctzRE3zvovQrvmDBRvXwLWrbNKED4pEjbg82Mdvc
         FNiDDKL+LryCelb5ck6uFfasA4OBA1QLvClHYCu4A4OQA7hkDmAH6Lq6DZkG056Doe6O
         vdfNubwL6RSsLBgCQYAgekwrfmgtO5+/iRzKGtmaKctoK+8VecHuFgsnlkYsZGdEzJSW
         Vt1EdCjnytV+BHr8lXnI0NYNnqvJfP3sSrAxXybJgabtTkOrVdKepoxfZepMT4Ear+XQ
         HRLA==
X-Forwarded-Encrypted: i=1; AJvYcCU5i2l2aVuu31v9bTk1Q0dyaptlbVVhbWiDZ6X+91cFp3/rtPCh045FbggTcVsDOoYeG7ULsf8sUUhlPA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw56Ew1hdjTNI4WGb9eOsWNCjUXat6ZBobAZgIcv6qRQsFuf3z6
	rNpM5ZXKGtitPjfDcWJt72camHTCrrxtc0vAmA7yWIg0TUTPO7t+zoe398HJ0T0n7Ot8kw==
X-Gm-Gg: ATEYQzxqI4SdBSuSztJeaSIOZCwR2Vh+5dicLEyKUkuXD02g+T2hdPQ14N1RnA2G3Lw
	iNFLVHYrHeLT+i7arhGpic9PaSSrkmZa7/aFr8IGEJseIkwfz09UYJkmT2CBDV1rItBgtKvVzf2
	LdmI7WOwTZVV6TmdrI/mbgVNU+jlg+DP3bqRsctCI+JGsvlieoS+RNX7GLXhU6c1vYZei7LC42C
	rnXRJ4MvIDsymb3kecoLmRljTyoyX/gOYy/Ddpt6Z4pbk8XY1rNhoVX/BoKbPb7vieAiTY7hYRw
	Psl3v1gsTDJw62xutSaBgKZe9rKerIxG4jkHAmzbdXJTPiWvruBusT3QKqmEKC2xGBIoSNkAmqd
	bvIbpaODbPvz5AaF4mTxEGmJDfKqIgQwN9xOUr7RCMLX0HRvuYwJv1BUZow/DT63IKLMdD+100E
	yINGoGmGdKHJJoeE2U0KvXjZ9H
X-Received: by 2002:a05:6102:26c3:b0:602:8de3:8df4 with SMTP id ada2fe7eead31-604f92c4d39mr3130236137.20.1774765364018;
        Sat, 28 Mar 2026 23:22:44 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac6:d6db:aa::11:19a])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60512d3a037sm4475072137.9.2026.03.28.23.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 23:22:43 -0700 (PDT)
From: Sebastian Josue Alba Vives <sebasjosue84@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com,
	=?UTF-8?q?Sebasti=C3=A1n=20Alba=20Vives?= <sebasjosue84@gmail.com>
Subject: [PATCH 1/4] staging: vc04_services: vchiq-mmal: fix OOB array access in event_to_host_cb()
Date: Sun, 29 Mar 2026 00:21:11 -0600
Message-ID: <20260329062229.493430-2-sebasjosue84@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260329062229.493430-1-sebasjosue84@gmail.com>
References: <20260329062229.493430-1-sebasjosue84@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[broadcom.com,lists.linux.dev,lists.infradead.org,vger.kernel.org,raspberrypi.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-57489-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sebasjosue84@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AC4BB350ED1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Sebastián Alba Vives <sebasjosue84@gmail.com>

event_to_host_cb() uses msg->u.event_to_host.client_component as an
index into the instance->component[] array (size VCHIQ_MMAL_MAX_COMPONENTS
= 64) without any bounds validation. The client_component value comes
from the VideoCore GPU firmware via VCHIQ message passing.

A malicious or buggy GPU firmware could send a crafted
MMAL_MSG_TYPE_EVENT_TO_HOST message with client_component >= 64 (or
negative), causing an out-of-bounds array access in kernel memory. This
results in reading/dereferencing a bogus vchiq_mmal_component structure
from memory beyond the array, which can lead to kernel crashes or
potentially arbitrary kernel memory access.

Add a bounds check on comp_idx before using it as an array index.
Move the component pointer assignment after the validation.

Fixes: b18ee53ad297 ("staging: bcm2835: Break MMAL support out from camera")
Signed-off-by: Sebastián Alba Vives <sebasjosue84@gmail.com>
---
 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
index d36ad71cc..4772126d7 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
@@ -477,12 +477,19 @@ static void event_to_host_cb(struct vchiq_mmal_instance *instance,
 			     struct mmal_msg *msg, u32 msg_len)
 {
 	int comp_idx = msg->u.event_to_host.client_component;
-	struct vchiq_mmal_component *component =
-					&instance->component[comp_idx];
+	struct vchiq_mmal_component *component;
 	struct vchiq_mmal_port *port = NULL;
 	struct mmal_msg_context *msg_context;
 	u32 port_num = msg->u.event_to_host.port_num;
 
+	if (comp_idx < 0 || comp_idx >= VCHIQ_MMAL_MAX_COMPONENTS) {
+		pr_err("%s: component index %d out of range\n",
+		       __func__, comp_idx);
+		return;
+	}
+
+	component = &instance->component[comp_idx];
+
 	if (msg->u.buffer_from_host.drvbuf.magic == MMAL_MAGIC) {
 		pr_err("%s: MMAL_MSG_TYPE_BUFFER_TO_HOST with bad magic\n",
 		       __func__);
-- 
2.43.0


