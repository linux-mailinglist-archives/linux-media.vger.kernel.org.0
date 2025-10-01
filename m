Return-Path: <linux-media+bounces-43480-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD32BB0DCA
	for <lists+linux-media@lfdr.de>; Wed, 01 Oct 2025 16:55:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8744D1947F64
	for <lists+linux-media@lfdr.de>; Wed,  1 Oct 2025 14:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4415130E832;
	Wed,  1 Oct 2025 14:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G/YtICIZ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A4B2FBE13;
	Wed,  1 Oct 2025 14:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759330199; cv=none; b=hZpzKgDAZ4GyQzUUIjOhctJgQdkB7jrXnFoSgTef/vN99pGqxH+L2yS3TAEGRyO5jsOj0hJWNpkUhBoG8a1KmVGhXZQjpgacX+dInZXOPRNCxkmV/V3+JFKklMoubj2FTF1L1PB3N9BCYkAbsUhIw9v8Db56jyXiiG7qI/XjlW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759330199; c=relaxed/simple;
	bh=BpmyC/Co0NOcMnA6DqxMPq8qTUiM3ZaK0OlRbzpqf08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lLkW/ubqxvsXQTTcxZYM4tV3YDKOt/z2sOpCHnBscCmeYXcDuV8iCpuWW4SlxAlUR7MuTGG5yg1F2ZsOcxGhKHOXW6lu7ZEybg43UyyQ5Thzg5UElzR/aSri5FYnfYGfd1CCJTfjlnHeZzf8XS21QwSjgw+FTLOEdU778zRxdtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G/YtICIZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21B64C116D0;
	Wed,  1 Oct 2025 14:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759330199;
	bh=BpmyC/Co0NOcMnA6DqxMPq8qTUiM3ZaK0OlRbzpqf08=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G/YtICIZ3cWYb8GuvlOhv4yYvwpKXuGFMAjzzaq2lyZl1ekvmv4frjMa5FuHXAzrc
	 kc4kwA13PDK0GtzNkce3454+PtNT+E0wEcnRFGyn0Hoy4EnbYrlyTbAvkj5oazg+rU
	 ID/BMikyxLYHCEce8UWKEbfPbXmAH8RdOwF+jVwKlyakIh/KUkaq3DzX3iO7t1V75O
	 NSUl9tNAeUxNFAXIMejGGR9zrqwcgdKpxI93Qdb+r9dNHq5eqVm8qcJyvztOSPG9E8
	 vJbrZyGR2we6bMhr/P7yKS8V3piNWr/nLSCdX7u/1ZbSP/T/OtAxo1Jgk3LD/QxwUB
	 3PR+g6hD1WGtg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1v3y9V-0000000BLIZ-1Wkp;
	Wed, 01 Oct 2025 16:49:57 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Jonathan Corbet" <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH 09/23] docs: media: dvb: use TOC instead of file contents at headers
Date: Wed,  1 Oct 2025 16:49:32 +0200
Message-ID: <dbe95d83ae2117ed532fda423fd1c1d9906b7a19.1759329363.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1759329363.git.mchehab+huawei@kernel.org>
References: <cover.1759329363.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

All we wanted were to have a way to link the comprehensive
documentation with the actual symbols parsed from the header
file, as this helps to identify any broken references.

Use the new :toc: flag for DVB.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../userspace-api/media/dvb/headers.rst       | 27 +++++++++++++++----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/Documentation/userspace-api/media/dvb/headers.rst b/Documentation/userspace-api/media/dvb/headers.rst
index c75f64cf21d5..e78122944a69 100644
--- a/Documentation/userspace-api/media/dvb/headers.rst
+++ b/Documentation/userspace-api/media/dvb/headers.rst
@@ -1,25 +1,42 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
 
-****************************
-Digital TV uAPI header files
-****************************
-
-Digital TV uAPI headers
 ***********************
+Digital TV uAPI symbols
+***********************
+
+.. contents:: Table of Contents
+   :depth: 2
+   :local:
+
+Frontend
+========
 
 .. kernel-include:: include/uapi/linux/dvb/frontend.h
     :generate-cross-refs:
     :exception-file: frontend.h.rst.exceptions
+    :toc:
+
+Demux
+=====
 
 .. kernel-include:: include/uapi/linux/dvb/dmx.h
     :generate-cross-refs:
     :exception-file: dmx.h.rst.exceptions
+    :toc:
+
+Conditional Access
+==================
 
 .. kernel-include:: include/uapi/linux/dvb/ca.h
     :generate-cross-refs:
     :exception-file: ca.h.rst.exceptions
+    :toc:
+
+Network
+=======
 
 .. kernel-include:: include/uapi/linux/dvb/net.h
     :generate-cross-refs:
     :exception-file: net.h.rst.exceptions
+    :toc:
 
-- 
2.51.0


