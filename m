Return-Path: <linux-media+bounces-47650-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5D1C7FC7D
	for <lists+linux-media@lfdr.de>; Mon, 24 Nov 2025 10:58:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70C633A7127
	for <lists+linux-media@lfdr.de>; Mon, 24 Nov 2025 09:58:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECB3D2F998A;
	Mon, 24 Nov 2025 09:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HCn1FAer"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418442F745B;
	Mon, 24 Nov 2025 09:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763978276; cv=none; b=nggaabpP96PB+KHxgYP9YrDRdE/sdsf+NcUtbp4ptmi6aQGhwIiKeIFkIz1C8bZ7Ggi/sVwczuwKAgCWDierQjNC+3I4XMCNcfomicDGBqfjrRF8JGWl0kf/38CceXG6utz0vO8uDqnmYjg25y/t4gCar4LmxXXFq/ayj2UTaTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763978276; c=relaxed/simple;
	bh=Ik0bwiscH39XA81eEpRwbrxBFIfeeaIoMwR5sWLhRX0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BEYgnnhBCMCxvlUElnZUxSBqd+IwEczsqeDHMZj3aFIGz9AqWVxKnJ3KpOecsqF43VuQ0NS0rqslg+jaOdppB0d3y1wNCfJSF7ZzMHJgbMrEjp7FxoGYicAW6j3VeFKtG6nd7uaz6Z4Yj4OTK8R8TCZkVI9lQq8CYFCZBuPloP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HCn1FAer; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAA92C19421;
	Mon, 24 Nov 2025 09:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763978276;
	bh=Ik0bwiscH39XA81eEpRwbrxBFIfeeaIoMwR5sWLhRX0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HCn1FAeracqS4C5RHH3gtIyy1o4+mdfUbxdO5ZGnc8l6dh9Y3LGt8kBTnHoFH51fF
	 qPhDuAsobF8jmLaz9Ove1jV/2HyPEb722xX6psuwr/j+Ap3du3JQmvuz08f2s5PLC5
	 TVzBN4Sy5o8K9HFCGhHJ7lw+GDgpLky33+sV2Y/xGfqjdqXp7pAUNW4P7jvoGbE7v6
	 KTZb0nPbFgxH60KjiH0pPdqMKvX8wq7rmCavaUdT7A41n1dhkkN5kEru6RLNhP4ei8
	 E2vTR7mDr0iMoWyWcTChcqw025mvusNdDvsjnwM6AjqjEjoXFXnijN5NaJu6efmcSr
	 4DuL+z2/+IJrA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vNTKU-000000013c8-0kV4;
	Mon, 24 Nov 2025 10:57:54 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	"Jonathan Corbet" <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab@kernel.org>,
	"Randy Dunlap" <rdunlap@infradead.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v5 3/5] docs: media: v4l2-ioctl.h: document two global variables
Date: Mon, 24 Nov 2025 10:57:44 +0100
Message-ID: <8a834e98624795aa02070752d3d49a9ba40a86e7.1763978209.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <cover.1763978209.git.mchehab+huawei@kernel.org>
References: <cover.1763978209.git.mchehab+huawei@kernel.org>
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
index 6f7a58350441..54c83b18d555 100644
--- a/include/media/v4l2-ioctl.h
+++ b/include/media/v4l2-ioctl.h
@@ -663,7 +663,22 @@ void v4l_printk_ioctl(const char *prefix, unsigned int cmd);
 struct video_device;
 
 /* names for fancy debug output */
+
+/**
+ * var v4l2_field_names - Helper array mapping ``V4L2_FIELD_*`` to strings.
+ *
+ * Specially when printing debug messages, it is interesting to output
+ * the field order at the V4L2 buffers. This array associates all possible
+ * values of field pix format from V4L2 API into a string.
+ */
 extern const char *v4l2_field_names[];
+
+/**
+ * var v4l2_type_names - Helper array mapping ``V4L2_BUF_TYPE_*`` to strings.
+ *
+ * When printing debug messages, it is interesting to output the V4L2 buffer
+ * type number with a name that represents its content.
+ */
 extern const char *v4l2_type_names[];
 
 #ifdef CONFIG_COMPAT
-- 
2.51.1


