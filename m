Return-Path: <linux-media+bounces-17435-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE03996944F
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 08:58:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 888571F23EF4
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 06:58:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A0EC1D6DD6;
	Tue,  3 Sep 2024 06:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a5qkG8n1"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848911D6C47;
	Tue,  3 Sep 2024 06:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725346638; cv=none; b=sRUIqDXnCTfgUsP3dVgGBnztIg6u6ogiOoWYa0pCovGUOtj0xwMg5okM7PwHDBY+/6kc37lIuQnYK+XXxb2DBx3uw1SX1rOlHPn/bPN/mpqYRfI0+NFiiHLwIZDOTlZJpvkhrzapm5zo5XExM1B/zn86gb/bFA8tP6otJn0HsxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725346638; c=relaxed/simple;
	bh=s9gUVHwdnMQOF85JYOYDrA5BR8h2scy7XK7hATBXzh0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jCxR/1PF0xJIOAMmm0WvjGAUVmQ+ygSwbEgoq2FZ4KCdVM/PfAUGyvZXM9j7tsaL/7QYGUZzCb9FmQzWZAAnc6HXambqMEqHtFlW5xt/rom8gLt1rGV3d8yWUYBVhS+HI+zbQ/3JcIHkDZQEpa728XEO3BYidXypQSGQU/UsfYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a5qkG8n1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2346EC4CEDC;
	Tue,  3 Sep 2024 06:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725346638;
	bh=s9gUVHwdnMQOF85JYOYDrA5BR8h2scy7XK7hATBXzh0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=a5qkG8n1dPhh+9ljBkC6thYDzFKxL0j1hbV8TJsAoq5UIy2A6vFwtgNVnjcHDw5zt
	 KnKPzU4Y04NIq0XcYsW6DcMBLSYagPVM2bs1EoAsbyChdQmH8E0cFjGUFcxAXueBQd
	 nFHbQklrSzRwKANTkuUaU5h7bSZEbcYbzsVLq0uDb525W3J0J1OqLUc0Yhlhn2AXo4
	 z2lG+ouUD8N176jRbwv5b9f+/jwm0OhX3pqlmetwRy1ndiOlCGD/d+ZQvtGONO9ia5
	 xiXfOTz5u+T3KtWuEZtfkEYJnatRgof4zyjUbm4w5lBnu0dynPe1tFfKM/kVtnl+mZ
	 ubd6CKgQEtaxw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19B3BCD3430;
	Tue,  3 Sep 2024 06:57:18 +0000 (UTC)
From: Keke Li via B4 Relay <devnull+keke.li.amlogic.com@kernel.org>
Date: Tue, 03 Sep 2024 14:57:12 +0800
Subject: [PATCH 8/9] Documentation: media: add documentation file
 metafmt-c3-isp.rst
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240903-c3isp-v1-8-8af0edcc13c8@amlogic.com>
References: <20240903-c3isp-v1-0-8af0edcc13c8@amlogic.com>
In-Reply-To: <20240903-c3isp-v1-0-8af0edcc13c8@amlogic.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 Keke Li <keke.li@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725346629; l=2506;
 i=keke.li@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=RHCTzcGX1z73glIL4+V4zFkW7ouwcZXrGMofjfIJSyw=;
 b=CcNOWMmHfPD3bzbUy8+J3qomBfjSI0HbVnpSdm2iZQfuxWoT9d4AFAPFzMP1uracVk0kbRNJD
 SeAVkDDtUPhBa/+/WHjs45V7I6wglbc2SxmAcgvmDKLtriWLQj8vjM2
X-Developer-Key: i=keke.li@amlogic.com; a=ed25519;
 pk=XxNPTsQ0YqMJLLekV456eoKV5gbSlxnViB1k1DhfRmU=
X-Endpoint-Received: by B4 Relay for keke.li@amlogic.com/20240902 with
 auth_id=204
X-Original-From: Keke Li <keke.li@amlogic.com>
Reply-To: keke.li@amlogic.com

From: Keke Li <keke.li@amlogic.com>

Add the file 'metafmt-c3-isp.rst' that documents
the meta format of c3-isp.

Signed-off-by: Keke Li <keke.li@amlogic.com>
---
 .../userspace-api/media/v4l/meta-formats.rst       |  1 +
 .../userspace-api/media/v4l/metafmt-c3-isp.rst     | 39 ++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
index c6e56b5888bc..3a420747f6e7 100644
--- a/Documentation/userspace-api/media/v4l/meta-formats.rst
+++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
@@ -12,6 +12,7 @@ These formats are used for the :ref:`metadata` interface only.
 .. toctree::
     :maxdepth: 1
 
+    metafmt-c3-isp
     metafmt-d4xx
     metafmt-generic
     metafmt-intel-ipu3
diff --git a/Documentation/userspace-api/media/v4l/metafmt-c3-isp.rst b/Documentation/userspace-api/media/v4l/metafmt-c3-isp.rst
new file mode 100644
index 000000000000..bbaf3542c1ca
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/metafmt-c3-isp.rst
@@ -0,0 +1,39 @@
+.. SPDX-License-Identifier: (GPL-2.0-only OR MIT)
+
+.. _v4l2-meta-fmt-c3isp-stats:
+.. _v4l2-meta-fmt-c3isp-params:
+
+***********************************************************************
+V4L2_META_FMT_C3ISP_STATS ('CSTS'), V4L2_META_FMT_C3ISP_PARAMS ('CPRM')
+***********************************************************************
+
+.. c3_isp_stats_info
+
+3A statistics
+=============
+
+The C3 ISP can collect different statistics over an input Bayer frame.
+Those statistics are obtained from the "isp-stats" metadata capture video nodes,
+using the :c:type:`v4l2_meta_format` interface.
+They are formatted as described by the :c:type:`c3_isp_stats_info` structure.
+
+The statistics collected are  Auto-white balance,
+Auto-exposure and Auto-focus information.
+
+.. c3_isp_params_buffer
+
+Pipeline parameters
+===================
+
+The pipeline parameters are passed to the "isp-params" metadata
+output video nodes, using the :c:type:`v4l2_meta_format` interface. They are
+formatted as described by the :c:type:`c3_isp_params_buffer` structure.
+
+The structure c3_isp_params_buffer includes the necessary parameters
+required by the ISP.
+These parameters are written to the ISP hardware.
+
+Amlogic C3 ISP uAPI data types
+===============================
+
+.. kernel-doc:: drivers/media/platform/amlogic/c3-isp/include/uapi/c3-isp-config.h

-- 
2.45.2



