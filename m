Return-Path: <linux-media+bounces-47174-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F025C61327
	for <lists+linux-media@lfdr.de>; Sun, 16 Nov 2025 12:23:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id C033129130
	for <lists+linux-media@lfdr.de>; Sun, 16 Nov 2025 11:23:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 145952BD586;
	Sun, 16 Nov 2025 11:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NqPqJIBw"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6400C283FEA;
	Sun, 16 Nov 2025 11:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763292218; cv=none; b=Zr1x1/koLpCs2y4gGFAdnwfqneGfNcnH8KfwRof7rsjJgg28PujAh4utpc5qMfh1jlReDOxa3oStl5merHcUeoTmNWASoYAcbOzXsKEZNMcUnHkmzHa9TEuzFybZSTaeQh7FaOC01kXP2ClLgrWbc02PWitODsIoHieUvCXbvJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763292218; c=relaxed/simple;
	bh=EHqiTl/gEFOctfX43h+L9XFYer9UoRGKk7O6CT/FANo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pPGvb5WXEi7UDhVNwxOZhBZTClmOvJdjONwqdv4nVb5oOiptXssY0/eyvn0KdXmPWEXjPpZng1PG+1DbXa+N6JDV6aWNF0cvmzqgffLB/lI7UI0dK9koIyKOR5KLHChgyvvRJBs00DuovIFChEY/D6MsNGDBQAteF0jhuuoxb9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NqPqJIBw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4AA6C4AF09;
	Sun, 16 Nov 2025 11:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763292217;
	bh=EHqiTl/gEFOctfX43h+L9XFYer9UoRGKk7O6CT/FANo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NqPqJIBwGuzNI4yCzjpPv9SoRUzoMSXlQV/EbFss8EAAmqNhR5Uw7lWVLxV+46glu
	 Ps7YtQtfChFpVeeyar+XGkBMKqQuvke2C1ngFm/bq4Ql87FxL8kpWTxjff5CvuUCkw
	 +Ekeo1NiVIk0vhZeiTjd0I3nANbuvLWdngZAz9E0WeY0BqTDaKPW8PB5oPIvhrHamC
	 8OnBEEdSdlNKxS7hA2u69LPz4LBnheFYBYrvLm3/wyTMe7bi8mBS4DELG3W3lgc7KU
	 9Bf+ssn4pMl+PViMJHgBnVJwbH2RKggU88/6Bt0CSopuVMgB42SjZsfD1CB8NVhpH4
	 15BDP38KJuFYQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vKar1-0000000Ffki-32jL;
	Sun, 16 Nov 2025 12:23:35 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab@kernel.org>,
	"Randy Dunlap" <rdunlap@infradead.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v3 2/2] docs: media: v4l2-ioctl.h: document two global variables
Date: Sun, 16 Nov 2025 12:23:31 +0100
Message-ID: <fc7e0f482b17fe9dc663848c469265205ea0f6ae.1763291890.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <cover.1763291890.git.mchehab+huawei@kernel.org>
References: <cover.1763291890.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

The media kAPI has two global variables at v4l2-ioctl.h. Document
them.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 include/media/v4l2-ioctl.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/media/v4l2-ioctl.h b/include/media/v4l2-ioctl.h
index 6f7a58350441..ed63841a100c 100644
--- a/include/media/v4l2-ioctl.h
+++ b/include/media/v4l2-ioctl.h
@@ -663,7 +663,22 @@ void v4l_printk_ioctl(const char *prefix, unsigned int cmd);
 struct video_device;
 
 /* names for fancy debug output */
+
+/**
+ * var v4l2_field_names - Helper array mapping V4L2_FIELD_* to strings.
+ *
+ * Specially when printing debug messages, it is interesting to output
+ * the field order at the V4L2 buffers. This array associates all possible
+ * values of field pix format from V4L2 API into a string.
+ */
 extern const char *v4l2_field_names[];
+
+/**
+ * var v4l2_type_names - Helper array mapping V4L2_BUF_TYPE_* to strings.
+ *
+ * When printing debug messages, it is interesting to output the V4L2 buffer
+ * type number with a name that represents its content.
+ */
 extern const char *v4l2_type_names[];
 
 #ifdef CONFIG_COMPAT
-- 
2.51.1


