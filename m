Return-Path: <linux-media+bounces-2876-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6D681BADC
	for <lists+linux-media@lfdr.de>; Thu, 21 Dec 2023 16:34:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE6CF283E90
	for <lists+linux-media@lfdr.de>; Thu, 21 Dec 2023 15:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A89941A85;
	Thu, 21 Dec 2023 15:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fKwGDsRO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90AA539ED
	for <linux-media@vger.kernel.org>; Thu, 21 Dec 2023 15:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5B3F4480
	for <linux-media@vger.kernel.org>; Thu, 21 Dec 2023 16:33:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1703172823;
	bh=1LBFN2/gw9U8ZGp9RmQorAHxCqCElWUdXz4PSGbyOOw=;
	h=From:To:Subject:Date:From;
	b=fKwGDsROBp3wCjqPD3kxUOeq6Hyj+ubujm7B0WSWQpV0jR/dbdxiSB4IzBcsndPhW
	 DCOhge3DskppMMQbclv449PbVoTxprmXdOEDFBwlxscJ0HJvv1dWUujLO9bZDpmYBS
	 HVkLGWD2NP0pS9FVVh6kRT2IERS+i+lOJYgEshys=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Subject: [PATCH] v4l2gl: Add missing dependency on argp
Date: Thu, 21 Dec 2023 17:34:40 +0200
Message-ID: <20231221153440.30000-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The v4l2gl application uses argp_parse(), but is missing the dependency
on argp. This causes compilation failures in environments where the
function is provided by an external library. Fix it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 contrib/test/meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/test/meson.build b/contrib/test/meson.build
index 29b51df640e0..48ee67b1e350 100644
--- a/contrib/test/meson.build
+++ b/contrib/test/meson.build
@@ -107,6 +107,7 @@ if dep_gl.found() and dep_glu.found() and dep_x11.found()
     )
 
     v4l2gl_deps = [
+        dep_argp,
         dep_gl,
         dep_glu,
         dep_libv4l2,

base-commit: f105c1eff03489f9e317009c4d9f56a61171ee5f
-- 
Regards,

Laurent Pinchart


