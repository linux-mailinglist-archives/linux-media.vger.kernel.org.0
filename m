Return-Path: <linux-media+bounces-57496-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJdRKevRyGnprAUAu9opvQ
	(envelope-from <linux-media+bounces-57496-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 09:16:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A763351009
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 09:16:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C57693024539
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 07:16:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F09122D1931;
	Sun, 29 Mar 2026 07:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="juweVOqC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5BF221540
	for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 07:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774768594; cv=none; b=aqmplIa3UZ/GzmSX+Xu1lBKfPF49pxIUPqV6KN7iX8jvRrPHVhWgDqdhpO2t9nOCZl314Rw6oZCGx1QzYTmq7mOibpOAZy4rAHqNtbMiWeRG0YSSPr/FgR7O1wh6J1YLCqgCWw37Vaou8E0lQ9OJtdA+OE46LQTeWSZnciEkDmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774768594; c=relaxed/simple;
	bh=nEeadJO/2VXHlqj2GhD2b9UbKa7ccc0BljwIKBpHWLM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ksEnFtua/Phq6UqqDGJwsiXHE0Htg1Z92dmPObcImk6ujsv4q0zqVXm5ms3yGYkQ5URvD2LhMQIvVTrSJh4wwOdKXI9LziIh28ci28IUcmXXanT71hbeCLwZnjKm+rgAT+ru8Ko97iwfAf78v2ANwElZCsYF8PA2XXMclLSeYTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=juweVOqC; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-604fb44270aso586696137.2
        for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 00:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774768592; x=1775373392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nSlLWkq4h8uaqpliAQo5iTD2HSvpKos26zajciLvI7A=;
        b=juweVOqCT9fNZl0vp0mzqcL4q2xv1isq1BONA8nfrImCvTZ/UWsM8E8eUzoA4IxX7C
         JnTYL6FJrxx8+piV7K477VtWk5UCcjAPmJk3TdK4SqgIOhcugsbSUkRjFhCSCW/69/z9
         7Jta9SV4mQiD8SYiDcwy6Md57JEylxK2E6BhfoskDREJ+PqSe5KKf6lOAc9s7L8Wix5q
         72o+Slr+6P3eXsZ0016r6BLZWjWfOpoI33ujWb3ESCM+Sl5muvEtd638Zdw4fNopgBwS
         nEXK2XlGmh6K46mgkPtwMS3HXQbUTbB4dWDhLOmSCEi1pfNIz7DAYVh8MZkyNwJ3ou0M
         0JDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774768592; x=1775373392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nSlLWkq4h8uaqpliAQo5iTD2HSvpKos26zajciLvI7A=;
        b=tJshMZG1HkPaNwSFtZdRfKrLaHE//luVY6M+0JW6YA+b19JxX5kj5NHTB6D4ISVJtC
         bIFpwGXNVhlIaIpeEQxjtzo8nR3EXe2mr0DkJ98OeYA028T3CGGVjGSoG5dYLjbq40d+
         aooTnF2ll9AxIBTVbeayQn+0MNzv4QlENxD8YllOSewVAJat0HtPrZmQBSciy+2cG2NA
         tveqZfFK0YntvFRA63PEy5E3tcpDTFaMFWqZeCiOIH2lwyAELYb8HbvygSbvKv+/RhOl
         zrJxzrQJMNaFa+02iYNcLBQRfpYGFM1bb1dOZCA7Wy9JmzHrJ+FFA17ufh6NOuDmbsSb
         U3rw==
X-Forwarded-Encrypted: i=1; AJvYcCVDZNEws8YNGTu35U8ER/jq1Ti1gT8fp8+h4pG9Z21lPt/u9M6CfRHtHfj/ykQsOpP8F91Xbre7Q88gxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkA21IEAu2aLTCcEDgzeDwzRjuRlYV3VU2Io+HfN13vAFSLPn9
	tNtPpmYnZmlOW2eI2yYjLsl5XXMhGwc8+jC876Qyr8TbTnNJtENZB65d
X-Gm-Gg: ATEYQzx7dkIcJhEQvCLPH66XYJubFkaH2tEd1J9Br5u0oh9/o2QuNJDH3b2DjNk9EDe
	taYyQ1PPNZDFsPZNSG0KlhzI0UQ1f8SRpN9HqJuxZSx5z5ES4vEXeoO8g76sQId5Lv8cZ0XB0Yo
	UYMzZWkGuzz7f/X1ll3era+4jE4OsN/ekR+hoOeyQ/fo/cD8kvvXPFaRJBrfOBxzebEGupVxinC
	XVMdMsPs6sKtIf2Ern1qJqarMy0k25hTyvCDajvQT9qO7TpV/9OPDDN3Oy+J2PkJRXBjLF/qKOF
	BGS0UEsexhaQuVmG1FnH+AWP3DKgMiErfgextdOXks/jYX4iRgFgNbzVQG36EshUnGwqsWYrB3i
	A3g3SDoD0EWpqtDb1q1ZxkYSIF/IRap4vilVUaLfdpCD9fkILo9yk5X6N/JWvHzSQVgSEsYmrdL
	erhJ00Ul85IYFwdDPAUyPtNu36
X-Received: by 2002:a05:6102:4421:b0:5ff:219b:497a with SMTP id ada2fe7eead31-604f8ff5ff7mr3225622137.3.1774768592246;
        Sun, 29 Mar 2026 00:16:32 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac6:d6df:aa::11:19a])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60512a5afa9sm4390638137.6.2026.03.29.00.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 00:16:31 -0700 (PDT)
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
	=?UTF-8?q?Sebasti=C3=A1n=20Alba=20Vives?= <sebasjosue84@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/4] staging: vc04_services: vchiq-mmal: validate component index in event_to_host_cb()
Date: Sun, 29 Mar 2026 01:15:39 -0600
Message-ID: <20260329071616.507876-2-sebasjosue84@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260329071616.507876-1-sebasjosue84@gmail.com>
References: <20260329062229.493430-1-sebasjosue84@gmail.com>
 <20260329071616.507876-1-sebasjosue84@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-57496-lists,linux-media=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4A763351009
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Sebastián Alba Vives <sebasjosue84@gmail.com>

event_to_host_cb() uses msg->u.event_to_host.client_component as an
index into the instance->component[] array (size VCHIQ_MMAL_MAX_COMPONENTS
= 64) without bounds validation. While the kernel generally trusts the
hardware it is bound to, a bounds check here hardens the driver against
potential firmware bugs that could otherwise cause an uncontrolled
out-of-bounds array access and kernel crash.

Add a bounds check on comp_idx before using it as an array index and
move the component pointer assignment after the validation. Use
pr_err_ratelimited() to avoid log flooding. Note: this file does not
currently have access to a struct device, so dev_err() is not available.

Cc: stable@vger.kernel.org
Fixes: b18ee53ad297 ("staging: bcm2835: Break MMAL support out from camera")
Signed-off-by: Sebastián Alba Vives <sebasjosue84@gmail.com>
---
 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
index d36ad71cc..9c6533f82 100644
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
+		pr_err_ratelimited("%s: component index %d out of range\n",
+				   __func__, comp_idx);
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


