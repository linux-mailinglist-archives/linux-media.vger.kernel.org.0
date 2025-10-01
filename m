Return-Path: <linux-media+bounces-43479-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 792DFBB0DCB
	for <lists+linux-media@lfdr.de>; Wed, 01 Oct 2025 16:55:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C359F1947496
	for <lists+linux-media@lfdr.de>; Wed,  1 Oct 2025 14:55:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 435AB30E830;
	Wed,  1 Oct 2025 14:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dfio1jXJ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AE12FD1B4;
	Wed,  1 Oct 2025 14:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759330199; cv=none; b=jcQcWz+zJNKsmWZ9/ked2UKlbxwnBd5mAO3zQtKm41B0JU5Z6zFbeDhdqwIN7rzuD3n2zziKZEllYeOb/t3AksZtozoj22102O1UDiEqvB+B3Xf6vw0HHeadhiH246syILiSNDYdBzJ7ssMxnr/VY1tNbghXbuRPqQ12NQ1LXfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759330199; c=relaxed/simple;
	bh=WG4gx5Qo+/GR9i6asjO9yctRH4XUw9ZpdhzPixKnIo4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j/CToQl3FdLjG5Hf77UkpdwmPbGh0qzcykmX1ZS9PjvKMn6ZL4EzTgMHAbT8aYM0x69E16iVuwP3Zj5eHEHfHxpHuRWiL0dZdrYuJYAXtEQeCAbY+E1yqo+TwmsjF91rGx1/GwdTrgIAgNliFCpQrW5eMrb6eNeRilY53dOfkwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dfio1jXJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21D64C4AF0C;
	Wed,  1 Oct 2025 14:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759330199;
	bh=WG4gx5Qo+/GR9i6asjO9yctRH4XUw9ZpdhzPixKnIo4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Dfio1jXJn169oci4d38KEYvss9nFLEraDNNYDoCIrF6+cFj1sQMivXpgZfBp9VlkK
	 Ty/Egds+U5KZPm3h8HrDR/u5MSJgkeiBI7H1O40e3v1il9gG0CLwRFK0+DiSkar5Q5
	 u6S9r+m8gE+wtkAUOatsEODNnBiS09dZ8JtdlKnO3roPWOCJ320k/cmXkoa3YPWQ5y
	 qdLcl/tdJd+Hp4zag1uwH7h9z/dwkBIhQ7sICv7UjdeA+pXl0GLfQBoiCaEroxI3TX
	 kLW4y0QytdbnZMFURizCTgsn5Y5czA68K2w7DloU3IPZu/TRNO/LwjDBQ2xO+XQRo2
	 8j7h1FkIk3xPw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1v3y9V-0000000BLIh-1kH0;
	Wed, 01 Oct 2025 16:49:57 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Jonathan Corbet" <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab@kernel.org>,
	Sean Young <sean@mess.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH 11/23] docs: media: rc: use TOC instead of file contents for LIRC header
Date: Wed,  1 Oct 2025 16:49:34 +0200
Message-ID: <94dc601b4777ca544489ffc6cef9a2da5fe28e0e.1759329363.git.mchehab+huawei@kernel.org>
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

Use the new :toc: flag for LIRC and enable warnings.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../userspace-api/media/rc/lirc-header.rst         | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/Documentation/userspace-api/media/rc/lirc-header.rst b/Documentation/userspace-api/media/rc/lirc-header.rst
index a53328327847..ba4992625684 100644
--- a/Documentation/userspace-api/media/rc/lirc-header.rst
+++ b/Documentation/userspace-api/media/rc/lirc-header.rst
@@ -2,11 +2,19 @@
 
 .. _lirc_header:
 
-****************
-LIRC Header File
-****************
+*****************
+LIRC uAPI symbols
+*****************
+
+.. contents:: Table of Contents
+   :depth: 2
+   :local:
+
+
 
 .. kernel-include:: include/uapi/linux/lirc.h
     :generate-cross-refs:
     :exception-file: lirc.h.rst.exceptions
+    :toc:
+    :warn-broken:
 
-- 
2.51.0


