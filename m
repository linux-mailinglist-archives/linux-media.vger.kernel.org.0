Return-Path: <linux-media+bounces-47613-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98928C7CFDE
	for <lists+linux-media@lfdr.de>; Sat, 22 Nov 2025 13:38:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57AC73A93A8
	for <lists+linux-media@lfdr.de>; Sat, 22 Nov 2025 12:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D64A2FCBE3;
	Sat, 22 Nov 2025 12:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GN+Vt+Lg"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE511DDDD;
	Sat, 22 Nov 2025 12:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763815087; cv=none; b=S/3POPoRBwJpJabplRpB2S42KVhSs+5FOwn7D8+1kNhWyYgkoL9AL3wslU6qGFZ6MiDVc6vxsemv7VG42ctWmNjXzG56+2PbEHS5ip/y1UAwu0mon+bmxTgscOqBx+cWsXj6mdNpUMxdkXX3On3kw9geyGqpRM7A5wnbMpJao0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763815087; c=relaxed/simple;
	bh=EHqiTl/gEFOctfX43h+L9XFYer9UoRGKk7O6CT/FANo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W5WVUNg/0hF402N/klqpLqQLI3YoUebeEks9Qsk/7pbYf5aCXF2nhyi3/KLPYjfHz4PFnl1IpCf7rRxSqjLm6FtagZbe/UM6bDo3RH6Q6XI31qirejthSEQKr8vo49oIePIG8He18jsfX8RDgdEQwoYJdV9Ws93cOwdqJdmQma4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GN+Vt+Lg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CDEDC116D0;
	Sat, 22 Nov 2025 12:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763815087;
	bh=EHqiTl/gEFOctfX43h+L9XFYer9UoRGKk7O6CT/FANo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GN+Vt+LgFN2f9wjxgOpTq9pYMB3Ob9rLqKVveeX4KCeYDwLCoYBJS3ng4V04GSYMh
	 vbUDCvFjr5olUDgQPCFh5pqMp521X/eW8/WGwb3jjopXqqn4B+xlCU5UAhxf8Np80+
	 0SQJapjuh/h2iQ27i3FOOJu299KTzL5FiLRLOL9AmLil6MmP+JVbaWZ3tu/vub8f5A
	 sPN+nsHDyhaO58y99K0gX7v+PIESfVCHBrEf/X7Q9+vw6Yx0c+5tiFKBg3NxIpm4SR
	 e7MPjObN9DN863JUX5dvysNabjsJT36S3KmIv24R8v8w/3oQ24MCBinfDPK3Mg2Ggv
	 vYWADoM63KuTg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vMmsP-00000004pmD-2F9W;
	Sat, 22 Nov 2025 13:38:05 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	"Jonathan Corbet" <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab@kernel.org>,
	"Randy Dunlap" <rdunlap@infradead.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v4 3/5] docs: media: v4l2-ioctl.h: document two global variables
Date: Sat, 22 Nov 2025 13:37:57 +0100
Message-ID: <7f471a4d2749c7dc7985e35c69b6f5e67e0aa33d.1763814816.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <cover.1763814816.git.mchehab+huawei@kernel.org>
References: <cover.1763814816.git.mchehab+huawei@kernel.org>
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


