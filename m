Return-Path: <linux-media+bounces-43491-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D373BB0DFC
	for <lists+linux-media@lfdr.de>; Wed, 01 Oct 2025 16:55:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 783D7189E7F5
	for <lists+linux-media@lfdr.de>; Wed,  1 Oct 2025 14:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49BA530F925;
	Wed,  1 Oct 2025 14:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DE9TZu76"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F8630215A;
	Wed,  1 Oct 2025 14:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759330199; cv=none; b=TPSj1gcQzXrILUMzdB3A5pUdM+gkmyQCaDin6fKY0ocZ8K3ynb+6+WT+Ab0Sx/Ar8CxFbv0J7y/++JfIhKn8X4XN2YI65pmEp36f+ZKJOvshlZEVzNclNT6+kD2DAMvzFK8wh5YOS3I8MBJqWsTM3bFzvmvLX24GAK7RunUu4Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759330199; c=relaxed/simple;
	bh=4SMG2xnHWkUrwcb9TUgCCE+356hByF3nNXHaJFswRdM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XtuFUw5jGySgOuITfaru826X2z07WGAgIRvLeOUlwCLXxt1GTdjTLr67QWhMsbfD4Ok45fe3x26BV8d8TCVCyLN3XS3E1Kh3aNAMOSaRGQzH9xEWgZH8cMlKcP+B8dB1Qx1FV1tcA/1PWS+t5l0mZhWQq7rRHNdaO5UHxWUr34E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DE9TZu76; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56EBEC2BCF4;
	Wed,  1 Oct 2025 14:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759330199;
	bh=4SMG2xnHWkUrwcb9TUgCCE+356hByF3nNXHaJFswRdM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DE9TZu768NvMWMLIikmberUP/hL8Nae1quZpLuxH3KA2lUYvXA5KwG7G0rsy2b6YY
	 SUqLaDMV1DVNO45cgudFF4FXiN5WFgfj2Eu0IOY6KEB2OWiOGfo1oCc0o3+nxqKoTY
	 SXwibql4kbmsq6QpELw4j8kvldj4FS25E+L4aAVd7PgABqnyUJWZidMeQj2MLEzfMD
	 NDR5xbZKxxXE4eVog/dnjRPkLvdPAp1IzLGG31z0t//XrervE5QKJ5EKXtP2n2+8gh
	 JVwsUdWVnX6yXlS1jUsMF4G++1r4bIXF0L8eUj17xmEAvNetCXwHM1PcHT1klnlKkV
	 bA1EA1DbwVLgw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1v3y9V-0000000BLJ5-2Qvb;
	Wed, 01 Oct 2025 16:49:57 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Jonathan Corbet" <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab@kernel.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Yunke Cao <yunkec@google.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH 17/23] media: docs: videodev2.h.rst.exceptions: ignore struct __kernel_v4l2_timeval
Date: Wed,  1 Oct 2025 16:49:40 +0200
Message-ID: <a6a0dc7366b1a5d7184b8f7d4ba27689051a1f6a.1759329363.git.mchehab+huawei@kernel.org>
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

This is an ancillary struct used for year-2038 compat logic.
It is not meant to be used directly on userspace.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
index 9bcb5ae6fbc4..c41693115db6 100644
--- a/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
@@ -18,6 +18,7 @@ ignore define _UAPI__LINUX_VIDEODEV2_H
 ignore symbol V4L2_BUF_TYPE_PRIVATE
 ignore symbol V4L2_TUNER_DIGITAL_TV
 ignore symbol V4L2_COLORSPACE_BT878
+ignore struct __kernel_v4l2_timeval
 
 # Documented enum v4l2_field
 replace symbol V4L2_FIELD_ALTERNATE :c:type:`V4L.v4l2_field`
-- 
2.51.0


