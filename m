Return-Path: <linux-media+bounces-13758-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E518990F994
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 00:54:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99E33281BA0
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 22:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F41FD158865;
	Wed, 19 Jun 2024 22:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JN9EfW3q"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F76F763EE
	for <linux-media@vger.kernel.org>; Wed, 19 Jun 2024 22:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718837650; cv=none; b=deJygKWy7AzhBLeQSKpyJoLAmEsT197KQxs3R7LbdSayeePtuanhwpiv3Txq1DzSwx5aP350qOW+HOaf2lCT7FsZnSOzafDUN19LOd8UDb+ETsrucuW8ajvFdUXQtI1bctBNtTmSqCE6ar3De14kIKk93xDy1xiEjxbW40gxHN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718837650; c=relaxed/simple;
	bh=Drd9Bx3D75uZ9g2S3TpO56ggyrBG6CHbkLM1LZzD93o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=luU9QvaGlxvRBxoBGzjaKtMNppqiPTRvSGkEZwxu7p5chDxtbjUqWYvwvHAiRIhqmytDn+/39dpnavCdwP9S/P8vA2b/1prZ2uxlwoJag2yOlE0oMdw8Hx2CcJvrzXFMGBHJYSvrXPT7CtwigUaUF2Hc5aN1C+IJExu1mHhmyAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JN9EfW3q; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 98A338E1;
	Thu, 20 Jun 2024 00:53:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718837627;
	bh=Drd9Bx3D75uZ9g2S3TpO56ggyrBG6CHbkLM1LZzD93o=;
	h=From:To:Cc:Subject:Date:From;
	b=JN9EfW3qZynFbhQiWiZLHUuCJBXq3D7umEejAphICpvxACtY7xh94Oz+WEyd9MGUn
	 +qwYCAFgCYaJi/ZWEA2Xz9LocBT2JfHNf1WGDhVUj0otn+Dfl6Qw6gMqcgpY13amVp
	 KlijA1E0nPRNVgnqqI+PJRcDEUv6NlkBEqLWO/kU=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH] media: v4l: subdev: Fix typo in documentation
Date: Thu, 20 Jun 2024 01:53:43 +0300
Message-ID: <20240619225343.15873-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the incorrect reference to the v4l2_subdev_enable_stream()
function with the correct v4l2_subdev_enable_streams() spelling.

Fixes: d0749adb3070 ("media: v4l2-subdev: Add subdev .(enable|disable)_streams() operations")
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 include/media/v4l2-subdev.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index e30c463d90e5..4ccea9ddb455 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -681,7 +681,7 @@ struct v4l2_subdev_pad_config {
  *
  * @pad: pad number
  * @stream: stream number
- * @enabled: has the stream been enabled with v4l2_subdev_enable_stream()
+ * @enabled: has the stream been enabled with v4l2_subdev_enable_streams()
  * @fmt: &struct v4l2_mbus_framefmt
  * @crop: &struct v4l2_rect to be used for crop
  * @compose: &struct v4l2_rect to be used for compose
-- 
Regards,

Laurent Pinchart


