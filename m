Return-Path: <linux-media+bounces-43483-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D841ABB0DCD
	for <lists+linux-media@lfdr.de>; Wed, 01 Oct 2025 16:55:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 332571946E4C
	for <lists+linux-media@lfdr.de>; Wed,  1 Oct 2025 14:55:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52C0F30E83C;
	Wed,  1 Oct 2025 14:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y2FGyfm4"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88BAE2FD1C3;
	Wed,  1 Oct 2025 14:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759330199; cv=none; b=pTQvoRq+w9tscwWIi8QCxZv6kwvPzS1+loDfRsnX3+tTpGLyEmqviF+jL+VnRMtWXhbMAFxkldtuZmzu2lx7fKArcqQ7l/Jmg47miL6+ktJK7FfW8DG2GSG2gL5VQT0xr3PAZZ/IS3VDRiRvhiraapxF0iJRTleppPI2FcIZxKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759330199; c=relaxed/simple;
	bh=naZuDICkTezFGayqpf9/NE/sb4ApSBYZii7vMtjwXmE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lxJrOIiZxbNW04sd9oTkuXrHWD4/2IG3EqXGuOJxto8aTNXINUMxyfDGC3vvIqw8WslgsxOv/6klAZ4EBuDB79442T8I5p9h3eRc3mg3DKdJQuCh56TeP5vI06lSYpY6cNCuY+ukLjOvVl1f9Vea2faQ8LjZGBJtI1xIqPHTa0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y2FGyfm4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3842BC2BCB1;
	Wed,  1 Oct 2025 14:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759330199;
	bh=naZuDICkTezFGayqpf9/NE/sb4ApSBYZii7vMtjwXmE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y2FGyfm47/9BeG5J/XMUk5PBCvaNYKcI6001sYsAsFI9IHd0aaIdvq5u6r8IiXKGw
	 QSHti7BSiXs3BW4nuhwtBdSs3+wOFrqyNrymaoRczsR7ezCmvgAgtuJvLUoZS/34ph
	 99zZBi4dJH1j7g/BXDnN76gb76vp0KjxLQk8YfZzeW0IAiRFtGhrbHdsRmNEOLINXZ
	 MXQU/wPEIb27U0cuiFt+WM7de4MywZQSTDqmebmIDpbZbwG59nNvLtEOFra1egjLoL
	 w2u4v02/9y7GZcb+6pHiEpPvi4IgO0Ie4wCWbrv/dc0oM+tKnjKTyhJkDyNfWjBuGh
	 w1pU14khHTy7Q==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1v3y9V-0000000BLIl-1r2S;
	Wed, 01 Oct 2025 16:49:57 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Jonathan Corbet" <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH 12/23] docs: media: mediactl: use TOC instead of file contents
Date: Wed,  1 Oct 2025 16:49:35 +0200
Message-ID: <5c8a87be712397563fc8ca914c3d92fe675e4071.1759329363.git.mchehab+huawei@kernel.org>
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

Use the new :toc: flag for media controller and enable warnings.

Here, we need to adjust the exceptions file to setup the C
namespace accordingly.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../userspace-api/media/mediactl/media-header.rst         | 8 +++++---
 .../userspace-api/media/mediactl/media.h.rst.exceptions   | 3 +++
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/userspace-api/media/mediactl/media-header.rst b/Documentation/userspace-api/media/mediactl/media-header.rst
index d561d2845f3d..a47ac5b2e99b 100644
--- a/Documentation/userspace-api/media/mediactl/media-header.rst
+++ b/Documentation/userspace-api/media/mediactl/media-header.rst
@@ -2,10 +2,12 @@
 
 .. _media_header:
 
-****************************
-Media Controller Header File
-****************************
+*****************************
+Media controller uAPI symbols
+*****************************
 
 .. kernel-include:: include/uapi/linux/media.h
     :generate-cross-refs:
     :exception-file: media.h.rst.exceptions
+    :toc:
+    :warn-broken:
diff --git a/Documentation/userspace-api/media/mediactl/media.h.rst.exceptions b/Documentation/userspace-api/media/mediactl/media.h.rst.exceptions
index 9b4c26502d95..09aaec2b4718 100644
--- a/Documentation/userspace-api/media/mediactl/media.h.rst.exceptions
+++ b/Documentation/userspace-api/media/mediactl/media.h.rst.exceptions
@@ -1,5 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 
+# All symbols are mapped inside MC C domain namespace
+namespace MC
+
 # Ignore header name
 ignore define __LINUX_MEDIA_H
 
-- 
2.51.0


