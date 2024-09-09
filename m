Return-Path: <linux-media+bounces-17944-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C586970FC1
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 09:28:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6E731C21233
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 07:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E51671B3F38;
	Mon,  9 Sep 2024 07:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ruIrWjqf"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B33D1B151D;
	Mon,  9 Sep 2024 07:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725866680; cv=none; b=JLaSALlOCOdyu5+FynB00GaObpEVGwmGR2ffMQjvSwqaOTovURsabDbrhQcjb3T2bcIJwpfbvS7M8bNf1xUuKCTbg5WWXKqT0BETYt64Co37EvRu+C7k/N94uyYHfDba6EYNHon5g0oqZXZHewBzX+ZRwk3OanfcgJw8ViLJt9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725866680; c=relaxed/simple;
	bh=o4+uVank0bJKAcoZGCiT6SL6/mNMLN7HU7UKysUU7ds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UiDi2pKtnmQgS1KdSKLBiTMYi5X7ou9EsqyIRhiFg8YVVryzuN4vgsF/0UEeYaaIZzIIcE5iVEbXTI1PLysIv7sYDqT8/lcz5GSLLsQ+KUXv/Awj1iwG+CSDUgBAb6YztTK1VpoP2pWRNajjkEXallLd0hClTcCYOKigL7FkdBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ruIrWjqf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0421AC4CEDC;
	Mon,  9 Sep 2024 07:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725866680;
	bh=o4+uVank0bJKAcoZGCiT6SL6/mNMLN7HU7UKysUU7ds=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ruIrWjqfI/eQthz+jQFaCdvR8eRkKtEiREbhad2zpRHPWTDr+HgMYdVI0e1ZByduo
	 om6D/PWPvvkJXg8AyxlV+jrbk4p5p+O34JBFH9Xddkg1CEMo9IrVxJZIiszroew37g
	 JESCtjjokffZ31XcXLvdKGHy4MO9YA4IK2ZSoI0WTssk8sxvdG0weoFwy5HujzDwnc
	 aVRehTxWQ1OiitMgdnoQjDFV7c1samdpVwVz1/xJ9bdSkHo+P/E3qz/V4eNbUvjp6z
	 lt9pu++hEAo9dWsb6iDJErur27de4eV+pR1toSyBOLsexhh1hqfWuOlX6YSHeyDqlM
	 6AmgYPK6lIVoQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0AF7E6FE49;
	Mon,  9 Sep 2024 07:24:39 +0000 (UTC)
From: Keke Li via B4 Relay <devnull+keke.li.amlogic.com@kernel.org>
Date: Mon, 09 Sep 2024 15:24:18 +0800
Subject: [PATCH v2 8/9] Documentation: media: add documentation file
 metafmt-c3-isp.rst
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240909-c3isp-v2-8-3c866a1cea56@amlogic.com>
References: <20240909-c3isp-v2-0-3c866a1cea56@amlogic.com>
In-Reply-To: <20240909-c3isp-v2-0-3c866a1cea56@amlogic.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 Keke Li <keke.li@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725866660; l=2506;
 i=keke.li@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=LXvHV2hOOcgP/hYAIlNthbXxTF9I6vZM9l8s8/RnSA4=;
 b=Swu51VVbouF7/N/5r/Dcsq9kPh10E3Z+Z8VBhItJ+4fv6EzROyz3D68nhiJKDSCotlZSkaK2B
 wPwh5j5dW9wBWKCi1h+X0893qh20iJFp9BtGIMCIDMQROE6o/yuBqCN
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
2.46.0



