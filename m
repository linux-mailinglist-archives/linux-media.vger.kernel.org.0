Return-Path: <linux-media+bounces-48889-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A21CC38CC
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 15:26:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3CB72300500D
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 14:26:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AFE834D384;
	Tue, 16 Dec 2025 14:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AWbLLbAv"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7999834C155;
	Tue, 16 Dec 2025 14:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765895185; cv=none; b=YWX/h6w0gIR2zMiTsmAtmMeWoMfiSQGC2pXF6Mi9OMrGoUwSHUdQcmETQwsEsTHXJMpiQDJJLDB5DnvirrjUTTDoYc5Ql4L44OxD2cYlogsj8jKD061qOu1wpVfDTGrhgN4he8gU4U1vsoxPJ/cbCAg3TFXLLhSP80QcDKWZpms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765895185; c=relaxed/simple;
	bh=VVgdng7M0JzhwueoxHr8KaGzLmH+L+ByH2S75VMJM9g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dlBi23SJSx7l2M3U17H796jIHGsBB/awMJp8y7OWKG+Ga1qaE3OMyJ5DPBf6/pP486swN0ZBhH/hrNC5z2vWaAYKnsh814PR3fc5e2zd3h2p7uH5v2B0xLKImzy5meemBfq0eFdASjJMgKOYXrb3G0NOuVrsfu2Wy3ehf8n58eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AWbLLbAv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52381C4CEF1;
	Tue, 16 Dec 2025 14:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765895185;
	bh=VVgdng7M0JzhwueoxHr8KaGzLmH+L+ByH2S75VMJM9g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AWbLLbAvamySnCpOWcicu38aIvPshSauKTqfJJLewRrof7mvNyr9A0ki/uQjYCCH8
	 725sGjHZY7UMmEfKHM42w3jqXyr7Wyb63LLGZBKJxqxayJAwQ09hg6oHdN1UO45pLL
	 IhfF5l/k9xS8U1kh7tme8bAJ978ETeD4So9Crvyv+QPl/k9lic/7uRbzj8CQFmj+c0
	 7t6haqgkmg/RfLhba1WEkrJgkoybMCfuH8xnWLnePaJoxpcTY9kbw5oWLTQnJNkE5a
	 HdA16U+ae5RuzRRPlOHzqenOOdnYs7aom5MaI+taWW75hXIEVn2MgOeUtvMjeEf0HC
	 OLUlYBH9WpZEg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vVW0N-00000000sub-1llu;
	Tue, 16 Dec 2025 15:26:23 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Randy Dunlap" <rdunlap@infradead.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v7 3/6] docs: media: v4l2-ioctl.h: document two global variables
Date: Tue, 16 Dec 2025 15:26:14 +0100
Message-ID: <8ebe25ff579962fec09b586f00e77fae7802985f.1765894964.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1765894964.git.mchehab+huawei@kernel.org>
References: <cover.1765894964.git.mchehab+huawei@kernel.org>
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


