Return-Path: <linux-media+bounces-1542-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8D98032E2
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 13:34:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4893F1F21098
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 12:34:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0802E2377A;
	Mon,  4 Dec 2023 12:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="acI6P9xA"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D57390;
	Mon,  4 Dec 2023 04:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701693256; x=1733229256;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mnr4bWi12b9AfsIeCU0DhhtBPdySntmuu+VSuI/vb0U=;
  b=acI6P9xA3h+ZqVWVJX2wmZEPLYu2b7wkX+EDUXOZcyv6G8ORh+Ri3GBQ
   bKu+uZsjbus0EX276+pRfqYoE8R8cGtnJjMun0cDPhOOi8+1WxM++LydV
   t84nnF/OFJfbCaHb/0Ur+ficRbspBqUd7waVQv4gRWSeje6B23owEjOm1
   cZy1YtX431EQBmGgvqXlTsvmIcIUoBw4PON8as441m+MzR+gXZ0FfNOPF
   212vZqY3aPm2BAqXvAkZl8Pse1oq92CKtyFeaR37Mrp3j+7ahxRWsypuS
   g6iQGw4qZlCaJIbwAFzqeecSDdtroUXGyr1gvz509Z96qrdaiS4RE+gtp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="575985"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="575985"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 04:34:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="746827684"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="746827684"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 04:34:13 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 6D80311FB5E;
	Mon,  4 Dec 2023 14:34:10 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1rA898-003fEM-2n;
	Mon, 04 Dec 2023 14:33:58 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: stable@vger.kernel.org,
	gregkh@linuxfoundation.org
Cc: hverkuil-cisco@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	linux-media@vger.kernel.org
Subject: [PATCH 5.10 1/1] media: smiapp: Correctly initialise try compose rectangle
Date: Mon,  4 Dec 2023 14:33:48 +0200
Message-Id: <20231204123348.873466-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <2023112431-footpath-exes-5997@gregkh>
References: <2023112431-footpath-exes-5997@gregkh>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

commit 724ff68e968b19d786870d333f9952bdd6b119cb upstream.

Initialise the try sink compose rectangle size to the sink compose
rectangle for binner and scaler sub-devices. This was missed due to the
faulty condition that lead to the compose rectangles to be initialised for
the pixel array sub-device where it is not relevant.

Fixes: ccfc97bdb5ae ("[media] smiapp: Add driver")
Cc: stable@vger.kernel.org
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
[Sakari Ailus: Backport the change to the smiapp driver.]
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
Hi Greg,

Here's a backport of the ccs driver patch as in older kernels the driver
was called smiapp.

This patch also applies to all stable trees older than 5.10.

 drivers/media/i2c/smiapp/smiapp-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/smiapp/smiapp-core.c b/drivers/media/i2c/smiapp/smiapp-core.c
index 6fc0680a93d0..3bf96b047132 100644
--- a/drivers/media/i2c/smiapp/smiapp-core.c
+++ b/drivers/media/i2c/smiapp/smiapp-core.c
@@ -2647,7 +2647,7 @@ static int smiapp_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 		try_fmt->code = sensor->internal_csi_format->code;
 		try_fmt->field = V4L2_FIELD_NONE;
 
-		if (ssd != sensor->pixel_array)
+		if (ssd == sensor->pixel_array)
 			continue;
 
 		try_comp = v4l2_subdev_get_try_compose(sd, fh->pad, i);
-- 
2.39.2


