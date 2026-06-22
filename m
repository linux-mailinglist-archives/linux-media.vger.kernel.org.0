Return-Path: <linux-media+bounces-65412-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IuaZB4qfOWrWvgcAu9opvQ
	(envelope-from <linux-media+bounces-65412-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 22:48:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 746E66B2596
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 22:48:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=rHHkvQ3Z;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65412-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65412-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 76F51308D430
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 20:44:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72F2B3655DA;
	Mon, 22 Jun 2026 20:44:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f202.google.com (mail-qt1-f202.google.com [209.85.160.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E1E363C6A
	for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 20:44:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782161054; cv=none; b=EeVvjoUmWVngA9EEOA/cVqP6x+lhP1lhOKgF97rzdn+M0jLSUNf02Za/FnxQNFSK9RRW/dXHo0Yz/jqoEM29IgMYGbTJeFDzT91YGCGWTKTOp7OS1lDv8yFaIuNE//3/uoysSXkRPklSl79jMgk4/+9qEU4Mt82aw7HIpr4V/qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782161054; c=relaxed/simple;
	bh=rZdLN5tzkGsE01tHBYLqly9HFJvaHp5kpnYWUOkPpCc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=anMjE7aUioJ5dVwUc4LP1OSwU/kPdpLPGluV/BXEaJXNdQIIfUo96koOyIl2Br46OuvDUYv1P5rdBZhbRBx+fP/11FvqzD5NSdmCuQilVNAP5vOyfXX1s9/plsuAayRr05D/qnEYcc7AaGpJaEJb1ROqbyk/6VViEtoEky46bPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--briandaniels.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rHHkvQ3Z; arc=none smtp.client-ip=209.85.160.202
Received: by mail-qt1-f202.google.com with SMTP id d75a77b69052e-51a08feb103so51321511cf.2
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 13:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782161052; x=1782765852; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=56mHhpj/siMw9Lq+ab4+IGXdy9XN2OLNariufEr+eMk=;
        b=rHHkvQ3ZNFDpbXFsx4uMYxyoXXSZlVRe36TLw0vpkGuEkypVpC5xpF7fQNlJtBN61f
         P1oE0A6p97JqZe323cVbo/37xsG6tdrAYN1vCTMEVD2ySv7BEysGuDN33ZLCQI9y88bW
         uYQknw7nkW/k97PlzakaaJVgNtH1BQburANUn6OFC+M0Jle1Bjhn/igbncrUME01cZUZ
         Du7xQGEOojJErs+fLg768zRo9JDWQj7xBCRqacwSQDqULTws4BljjAhf5Xbztmw9cbZs
         /ysU3fJtiSNrjpwBhpD3609b75noDqJsMxd/7TlR/ePU960uKB5f91BthSK3Ez0AMsDI
         WnFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782161052; x=1782765852;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=56mHhpj/siMw9Lq+ab4+IGXdy9XN2OLNariufEr+eMk=;
        b=FCi7rnPuWzlXlaiiEito3ZY8Q+/7ixZjuWUzNCED2Yig6alvn1YnH4HByZ3ObZPkl0
         f7QGkSJiNlWKbq1efvoTea3clBNU9VBWh2hkG6gy5e5a6vMX/8xjmhI2tcnpD/pVF41G
         Rc5KaJ1fOfm9HBXTwaJd6h6HXfr7edapfoIcKogg48rAi1ezKa3mMzi2eCDnuzHpJt4y
         iaBWRMuX3Oj2HBl7TnqNOXPcGSpsgeG73TYcq3BIaNoSYsleetAb+I3SWgCeKa0KnQAG
         rRDjW644eywXgS8W8zqrmoTgFpRexLShk7uEDnpJa74LKMBj0spvVuj+ur/Pv4XV+4BC
         swRA==
X-Forwarded-Encrypted: i=1; AFNElJ9QBqoFqQwQikX/53KnJWj8+uUzNaEru//TgxZTKLTvZUuT771SDIKAOdiLGWo4/bzEiktB6qNbwSG8Kg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoXxpqFlovoX8BIntTd3xq+Xr0bjb2mp++ny3i2y8wKjbKXRZv
	cCJbWciLidDj2cXEQLNnZRIDG6rSJ3hOPU86eNEjG4vd0FkwU2M1Xg2+ht2xpMmxESYOkEQDxK3
	j9ce342JV6VwEC5K1PyN2uD/YrJLE
X-Received: from qtam14-n2.prod.google.com ([2002:a05:622a:e10e:20b0:516:d746:4e0f])
 (user=briandaniels job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:622a:2d0d:b0:519:f8e2:dae4 with SMTP id d75a77b69052e-519ff3f4bb9mr159603471cf.39.1782161051759;
 Mon, 22 Jun 2026 13:44:11 -0700 (PDT)
Date: Mon, 22 Jun 2026 16:43:42 -0400
In-Reply-To: <20260622204343.1994418-1-briandaniels@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260622204343.1994418-1-briandaniels@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260622204343.1994418-8-briandaniels@google.com>
Subject: [PATCH v4 7/8] media: virtio: Add virtio-media to the build system
From: Brian Daniels <briandaniels@google.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: acourbot@google.com, adelva@google.com, aesteve@redhat.com, 
	changyeon@google.com, daniel.almeida@collabora.com, eperezma@redhat.com, 
	gnurou@gmail.com, gurchetansingh@google.com, hverkuil@xs4all.nl, 
	jasowang@redhat.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mst@redhat.com, nicolas.dufresne@collabora.com, 
	virtualization@lists.linux.dev, xuanzhuo@linux.alibaba.com, 
	Brian Daniels <briandaniels@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[briandaniels@google.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:acourbot@google.com,m:adelva@google.com,m:aesteve@redhat.com,m:changyeon@google.com,m:daniel.almeida@collabora.com,m:eperezma@redhat.com,m:gnurou@gmail.com,m:gurchetansingh@google.com,m:hverkuil@xs4all.nl,m:jasowang@redhat.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:mst@redhat.com,m:nicolas.dufresne@collabora.com,m:virtualization@lists.linux.dev,m:xuanzhuo@linux.alibaba.com,m:briandaniels@google.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65412-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[google.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[briandaniels@google.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[google.com,redhat.com,collabora.com,gmail.com,xs4all.nl,vger.kernel.org,lists.linux.dev,linux.alibaba.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 746E66B2596

From: Alexandre Courbot <gnurou@gmail.com>

Add Kconfig and Makefile entries for the new virtio-media driver.

Signed-off-by: Alexandre Courbot <gnurou@gmail.com>
Co-developed-by: Brian Daniels <briandaniels@google.com>
Signed-off-by: Brian Daniels <briandaniels@google.com>
---
 drivers/media/Kconfig         | 13 +++++++++++++
 drivers/media/Makefile        |  2 ++
 drivers/media/virtio/Makefile |  8 ++++++++
 3 files changed, 23 insertions(+)
 create mode 100644 drivers/media/virtio/Makefile

diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
index 6abc9302c..7bc7306fa 100644
--- a/drivers/media/Kconfig
+++ b/drivers/media/Kconfig
@@ -136,6 +136,19 @@ config MEDIA_PLATFORM_SUPPORT
 
 	  Say Y when you want to be able to see such devices.
 
+config MEDIA_VIRTIO
+	tristate "Virtio-media Driver"
+	depends on VIRTIO && VIDEO_DEV && 64BIT && (X86 || (ARM && CPU_LITTLE_ENDIAN))
+	select VIDEOBUF2_CORE
+	select VIDEOBUF2_MEMOPS
+	help
+	  Enables the virtio-media driver.
+
+	  This driver is used to virtualize media devices such as cameras or
+	  decoders from a host into a guest using the V4L2 protocol.
+
+	  If unsure, say N.
+
 config MEDIA_TEST_SUPPORT
 	bool
 	prompt "Test drivers" if MEDIA_SUPPORT_FILTER
diff --git a/drivers/media/Makefile b/drivers/media/Makefile
index 20fac24e4..357e786cc 100644
--- a/drivers/media/Makefile
+++ b/drivers/media/Makefile
@@ -23,6 +23,8 @@ obj-$(CONFIG_DVB_CORE) += dvb-core/
 # There are both core and drivers at RC subtree - merge before drivers
 obj-y += rc/
 
+obj-$(CONFIG_MEDIA_VIRTIO) += virtio/
+
 obj-$(CONFIG_CEC_CORE) += cec/
 
 #
diff --git a/drivers/media/virtio/Makefile b/drivers/media/virtio/Makefile
new file mode 100644
index 000000000..1d69d5fd4
--- /dev/null
+++ b/drivers/media/virtio/Makefile
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for the virtio-media device driver.
+
+virtio-media-objs := scatterlist_builder.o virtio_media_ioctls.o \
+			virtio_media_driver.o
+
+obj-$(CONFIG_MEDIA_VIRTIO) += virtio-media.o
-- 
2.55.0.rc0.799.gd6f94ed593-goog


