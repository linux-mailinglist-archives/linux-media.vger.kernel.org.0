Return-Path: <linux-media+bounces-48888-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 71438CC396E
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 15:30:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DBF133006DB8
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 14:30:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11C602D7DD4;
	Tue, 16 Dec 2025 14:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RzhC5oXy"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E765D2D193F;
	Tue, 16 Dec 2025 14:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765894780; cv=none; b=Fj5NYxhv/7iOJeg479Atp+KJhAEQXOf0P00HDNpDfqmBBpfZ8Mb738t1STl0wTRyoym2dHCXtNkTZeoVM8+CWjyaK5QK+YV3jUaAyQp98NWHkL9cZ8aN9YH3hsC7NTdugjELgqRTOf7+ucRohlm7YfYIswN+xd8TVPjUa/ti090=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765894780; c=relaxed/simple;
	bh=VVgdng7M0JzhwueoxHr8KaGzLmH+L+ByH2S75VMJM9g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BN3jg4fWEipAtemu8samoIj4ZmjhlMPDfXQakId9iKKXqXG3WLaMpFQfr+gEK+vF9TItNQrZvvSO5ybxTDiWp3V+pGg8aXUNYaA1TsznDc/cXUGzhKfW5AkyztIq0w51lFkbY/3vzGkyzAWvu7gDQ4Xyt2go5lwhkVqiW9M9VYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RzhC5oXy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 723EDC4CEF1;
	Tue, 16 Dec 2025 14:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765894779;
	bh=VVgdng7M0JzhwueoxHr8KaGzLmH+L+ByH2S75VMJM9g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RzhC5oXyAWN+5eW3siLBYnKoCk7kMGL8wOvSwvHKbsRYQ21CGONtjmJspAdRpDv6V
	 s9AmJteJAEzn0+Xro/dHGtTE+9gFQqCbvhOmzorMXCVMP0gxVVA5owU9AS1aZF3lQY
	 T088NY5NMvgxOCdfwy+/TgwzJddHWmlFNaq3tTSXwti47TSH5OA/nCUOEmdPyOVoWp
	 jO2Nk0w12TurIbZu0qKgSTGiDxrk6IkZ9xmMU2FSN/4GYUuB9/aj+hj/18fb9zc+NA
	 3b5T01S6GdaGBm9h4mWz/XOe2EOcx5K68KktXUWrI8ap0pVF3swHOVBJx203qOc9e9
	 XkvWtUWZgWDwQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vVVtp-00000000sSq-2He8;
	Tue, 16 Dec 2025 15:19:37 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Randy Dunlap" <rdunlap@infradead.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v6 3/6] docs: media: v4l2-ioctl.h: document two global variables
Date: Tue, 16 Dec 2025 15:19:25 +0100
Message-ID: <8ebe25ff579962fec09b586f00e77fae7802985f.1765894670.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1765894670.git.mchehab+huawei@kernel.org>
References: <cover.1765894670.git.mchehab+huawei@kernel.org>
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

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
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
2.52.0


