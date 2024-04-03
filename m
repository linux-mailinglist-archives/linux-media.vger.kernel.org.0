Return-Path: <linux-media+bounces-8484-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE57896880
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 10:26:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 421FA1F22CBD
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 08:26:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B023780031;
	Wed,  3 Apr 2024 08:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wBr+68VF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFC56DCE8
	for <linux-media@vger.kernel.org>; Wed,  3 Apr 2024 08:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712132225; cv=none; b=mXQvuRK2Nkp4j3HJQZRFipzdDjFGMJ8qt8TpUyVtCF/5xmxx3/xs+FoCW2/7te2gqA55NFARtHG5iiE86Sjwq5kQ201+m5JzOgeJIt1IJb8XcL4U8GREi+1vTsDk5XyR6Vbf4NhL+3gPrCfP30zJ+hztWImG+aEISJhZrnJGZJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712132225; c=relaxed/simple;
	bh=n5R7WGm59ESZ+59G2PLjiM2d4ZhatkRsGKXuNPZQztU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d5E0wKk4F8ZTgutSCIGpNkKQJ9LFXc0ckV/mXeYlvaezN+HnpGK1Csq2mNi3VBJtv1GmSiX/LX9+Ax3ooYJ2y7lyU/M1CoUixkNWmyarb7CVXKieq4oUv8UmggDVq+2t9BD96FqQ9qinCvhfQM2JdKqBDGZEZzDKfNoKmZw7EZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wBr+68VF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-154-34-181.elisa-laajakaista.fi [91.154.34.181])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7E1A27E1;
	Wed,  3 Apr 2024 10:16:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712132184;
	bh=n5R7WGm59ESZ+59G2PLjiM2d4ZhatkRsGKXuNPZQztU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=wBr+68VFmnwqn1Ez9Wdc+8/xc0kruJsbrZL2QvliuIUCAKdSYCRY+mpTfqsqejqbh
	 MlICnKt3CmpSyA6kEU8S+DAAtHSwhUbarvHBGWY6Ndl8LJLmiDrknOuBMpT6SyD2vr
	 O6q0gTmhKCJJHiOn2nX73LtfGWlMu9ZBV5W9ib3g=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 03 Apr 2024 11:16:28 +0300
Subject: [PATCH v4l-utils 1/2] v4l2-compliance: Fix use of routing on
 32-bit platforms
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240403-v4l2-compliance-streams-fixes-v1-1-a1c383cc2139@ideasonboard.com>
References: <20240403-v4l2-compliance-streams-fixes-v1-0-a1c383cc2139@ideasonboard.com>
In-Reply-To: <20240403-v4l2-compliance-streams-fixes-v1-0-a1c383cc2139@ideasonboard.com>
To: linux-media@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2158;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=n5R7WGm59ESZ+59G2PLjiM2d4ZhatkRsGKXuNPZQztU=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBmDRB8ypJzB6oyP0FKgKqALO33d3K2ym5JjLXig
 DJ2lZ0nuNCJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZg0QfAAKCRD6PaqMvJYe
 9eeKD/4xmiCRE33W79Uxt1yHs/4IwcBM0O/iV2bcog4/+etsY+nIpVtcZ/m6a1Nr9/8nJ92N+pN
 0f4ij9ga/m4RGhjFuLQXD//EEBsLyCfr5rMCTEN3eWAlWwiJMSH8TwjP39ElWx4Ex9ix1omDM3S
 jCUUokknKE29BOa9umzfSOY7tEVo8idEc2omZX57QLJFzdrNQz3IR1n9WryEB3nr69D7q+Pi93M
 Zqqr+uwSXv0y97g0A2SqWDNZlrHpTEETvthxfANigfP4c0+SQA3b3B5oh7nwIeyfWMOzgWHvrpf
 s/+81f1rZ0A4SHwYeHcSywT1Jw86JIgyXdaSeePD/Opp3AYr6C4xKWR3fb1A8O1Svwi9xTruUzs
 OqJoUc1X0DnJZrglUP+K0FWFn6OwNGgxEYu/h9VOji50hcjlrM0kSGLHtmBDFLLhncm4sTjXWhf
 F1DlkPoP15lgEAYGl4h+40RVQ3D9TQFTTSBFVebXxGpWP9t0Ud4mop6SSwitVXxc8UyUV9aUkWq
 oh4mkvCnOIBAJDhxDNij/5JtKXyEFWUM3Gacx7ZH9Xoggch2Aq8fd6itJqdTj6qdgl/nk628ExV
 b1B1mhMRWjZaWiR2ajPyu31XWwYbs498hMfqlyon1abl5F/gvgwDpo4fOV9O3A++PjbNfalpPOV
 ttw+3G+vQ22Dz0A==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

At the moment we do:

routing.routes = (__u64)&routes;

On 32-bit platforms the 32-bit address will be sign-extended, possibly
resulting setting the address to, e.g., 0xff000000 -> 0xffffffffff000000.

Fix this by first converting the address to uintptr_t.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 utils/v4l2-compliance/v4l2-compliance.cpp   | 4 ++--
 utils/v4l2-compliance/v4l2-test-subdevs.cpp | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index 2cf97909..82615c17 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -1274,7 +1274,7 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
 				which <= V4L2_SUBDEV_FORMAT_ACTIVE; which++) {
 
 				sd_routing[which].which = which;
-				sd_routing[which].routes = (__u64)sd_routes[which];
+				sd_routing[which].routes = (__u64)(uintptr_t)sd_routes[which];
 				sd_routing[which].num_routes = NUM_ROUTES_MAX;
 
 				ret = doioctl(&node, VIDIOC_SUBDEV_G_ROUTING, &sd_routing[which]);
@@ -1305,7 +1305,7 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
 					routes = sd_routes[which];
 				} else {
 					dummy_routing.num_routes = 1;
-					dummy_routing.routes = (__u64)&dummy_routes;
+					dummy_routing.routes = (__u64)(uintptr_t)&dummy_routes;
 					dummy_routes[0].source_pad = pad;
 					dummy_routes[0].source_stream = 0;
 					dummy_routes[0].sink_pad = pad;
diff --git a/utils/v4l2-compliance/v4l2-test-subdevs.cpp b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
index ebca1b94..fe7a9e1d 100644
--- a/utils/v4l2-compliance/v4l2-test-subdevs.cpp
+++ b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
@@ -586,7 +586,7 @@ int testSubDevRouting(struct node *node, unsigned which)
 	int ret;
 
 	routing.which = which;
-	routing.routes = (__u64)&routes;
+	routing.routes = (__u64)(uintptr_t)&routes;
 	routing.num_routes = 0;
 	memset(routing.reserved, 0xff, sizeof(routing.reserved));
 

-- 
2.34.1


