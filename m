Return-Path: <linux-media+bounces-18375-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E67797B7AF
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2024 08:08:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF7AB1F23AA0
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2024 06:08:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17291170A00;
	Wed, 18 Sep 2024 06:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ccu5jhtP"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FED1662E4;
	Wed, 18 Sep 2024 06:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726639657; cv=none; b=O3ms/5o2+SgoyHq/JFub5NJBI6dR9xAHeljRTnv5mycIyQS1rYYjjaG28qy8qNVyOxsJeNxP3KyLQR52bNSUwYXTo+ze0HCATXekeOCd51fyxk9fs7Ef8/+C6NWeobqIHKdsb1BpA87GTE8kT8nqhFObfkbVkoLezZwuu9u59tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726639657; c=relaxed/simple;
	bh=4+Kjm45EumF1BZkBC+vch/qxAQMK2SWvZ+EcU8j+cTA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aWalo9dl1+XcKbFs0CXBKwQ0Ybp8AVLQA4Io0O0+2zS+rB/zlIBcgjRS6NwK1VP625XCbJjiQvWStULq27HTJV4Z9qIjEqXuJqzfNqWYsbvfggw1kHzvYcWSzQDsAT2SXO+5rBIkfgt9jkiWcZvTqGVHSnUZUY95dXzSP5Pgmn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ccu5jhtP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A3C5EC4CEE2;
	Wed, 18 Sep 2024 06:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726639656;
	bh=4+Kjm45EumF1BZkBC+vch/qxAQMK2SWvZ+EcU8j+cTA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ccu5jhtP1wFFhLTJ2Jxp1o+q714FG0m0mRoJ68ybmQHTRIKDrRhFD/oXVBk+/sn3x
	 uCKyk+LUDsUbWVwaOTbn35235JeH0pD4Mvl1qh4IbthZALkp5OCtt/Qb6250sj0A4v
	 oxcnk0A4q5gsMlHAAZwZEsLiNFHKM7sILNcIJAxZ9gMDwgLbKGT9HylRKCns+ZJMOq
	 MipM6h4acrvLce7X74OjBgF4xwdFkHVWsK0q/0Yc1hq5Wsd7d+dI1cZCyh4xHboyDO
	 sNfMQ7b02ArPX7cMszuECn5zrXX26W4VngPT48r/LE6P51e8T+d1pfutwFvuPA2+6H
	 6pN6Iy1krN6EA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 986ABCAC589;
	Wed, 18 Sep 2024 06:07:36 +0000 (UTC)
From: Keke Li via B4 Relay <devnull+keke.li.amlogic.com@kernel.org>
Date: Wed, 18 Sep 2024 14:07:19 +0800
Subject: [PATCH v3 8/9] Documentation: media: add documentation file
 metafmt-c3-isp.rst
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240918-c3isp-v3-8-f774a39e6774@amlogic.com>
References: <20240918-c3isp-v3-0-f774a39e6774@amlogic.com>
In-Reply-To: <20240918-c3isp-v3-0-f774a39e6774@amlogic.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 Keke Li <keke.li@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726639635; l=2506;
 i=keke.li@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=rUBd8+yUBOxLjKjvST1rZmnj73w+JEufrqFVM56kfIk=;
 b=umhZtXyWm5l3d16imxC3hRyCvlhDSs+brlI2w+6I5pg2d79B0fSj2Kor1GABxoWgSCO6axCwJ
 TNdX7IB2i1hCjo8HjSm3D9L0mZngrJQUAI95+jptQ3Dua/Jpu8xNMn1
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
2.46.1



