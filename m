Return-Path: <linux-media+bounces-44896-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D34D6BE8F5E
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 15:40:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38011188D95E
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 13:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 355E62F6930;
	Fri, 17 Oct 2025 13:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cGrgLsAo"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947602F690E
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 13:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760708319; cv=none; b=pyitHbqmVrmDQ6C2jLpIsX5xKrjfudsBrigCW26xy8vublIIs11vYb49LuSxSshXYOyYDTLHiuspGg9zFUubCiPvezjmOcOe4E3ylytALEtbUOVUXrOy05kKQiITYyrt63QuNX4txXMe0R67u3SOV/b/3Yiotn4xNDxTwWENl0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760708319; c=relaxed/simple;
	bh=9W+ZkiZF8RrPzB6qu8FA9+JATPd6DBh/eT33HlRBEqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=INiOO2ddjSQf8peJsxNkn0Xt6+zmxK/LT6j6JHWjQFQ/oatJjevjYctk7ezTlqW/e0Tes6fLaBpV9NCW7OOrgfZLMxj3R9ONtHjrvR4pADviogCHpzEJMVu8NRLdDXVVqX96/T+nAaVXD/PPfoGuReFSvOwJY3q+3ZQAmbQ+DHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cGrgLsAo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D17AEC4CEE7;
	Fri, 17 Oct 2025 13:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760708319;
	bh=9W+ZkiZF8RrPzB6qu8FA9+JATPd6DBh/eT33HlRBEqQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cGrgLsAo1MdpK3UVVo8NW4oc90+dntCYdJnKYVYv65hy2a79lwZPGXAPa8+cduqzX
	 KfRYojorhYewxYO5JiMMSLjix+w6xmbIFSXBiuNRD1rifGibi8kM7sUevDUaXQsE2j
	 RuFu+zYhzQouN5p7AU1I1kt3drzEzJDsSpb2OEmwde19ydjqxRRCQbkdHfPqjZWYlB
	 mVhx5MA0gWCOb3oy75oH/SRtK154wnKQ+/Sv1dTGUlvsF9nUDwATxuRfP5fz+hBqk+
	 0KnMtwUzFUZ0E2xjXIzrjRG7RYPfaRo2TrHjhZpevoU3uvS15vBUNpg8OzmfoEOXqF
	 IEXXffncl97OA==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	laurent.pinchart@ideasonboard.com,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCH 05/14] media: omap3isp: use V4L2_COLORSPACE_SRGB instead of _JPEG
Date: Fri, 17 Oct 2025 15:26:42 +0200
Message-ID: <87140b46e4b6fdc463714b0ec3d1ec17ff65db67.1760707611.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1760707611.git.hverkuil+cisco@kernel.org>
References: <cover.1760707611.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

JPEG colorspace should generally not be used unless it is actually
dealing with JPG data. This fixes v4l2-compliance errors:

	fail: v4l2-test-formats.cpp(416): pixelformat != V4L2_PIX_FMT_JPEG && pixelformat != V4L2_PIX_FMT_MJPEG && colorspace == V4L2_COLORSPACE_JPEG
	fail: v4l2-test-formats.cpp(521): testColorspace(!node->is_io_mc, pix.pixelformat, pix.colorspace, pix.ycbcr_enc, pix.quantization)
test VIDIOC_TRY_FMT: FAIL

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/platform/ti/omap3isp/isppreview.c | 2 +-
 drivers/media/platform/ti/omap3isp/ispresizer.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/ti/omap3isp/isppreview.c b/drivers/media/platform/ti/omap3isp/isppreview.c
index 26f7167d1f4f..9992db782870 100644
--- a/drivers/media/platform/ti/omap3isp/isppreview.c
+++ b/drivers/media/platform/ti/omap3isp/isppreview.c
@@ -1796,7 +1796,7 @@ static void preview_try_format(struct isp_prev_device *prev,
 		fmt->width = crop->width;
 		fmt->height = crop->height;
 
-		fmt->colorspace = V4L2_COLORSPACE_JPEG;
+		fmt->colorspace = V4L2_COLORSPACE_SRGB;
 		break;
 	}
 
diff --git a/drivers/media/platform/ti/omap3isp/ispresizer.c b/drivers/media/platform/ti/omap3isp/ispresizer.c
index 5dff48489394..ad0127f5b5cb 100644
--- a/drivers/media/platform/ti/omap3isp/ispresizer.c
+++ b/drivers/media/platform/ti/omap3isp/ispresizer.c
@@ -1405,7 +1405,7 @@ static void resizer_try_format(struct isp_res_device *res,
 		break;
 	}
 
-	fmt->colorspace = V4L2_COLORSPACE_JPEG;
+	fmt->colorspace = V4L2_COLORSPACE_SRGB;
 	fmt->field = V4L2_FIELD_NONE;
 }
 
-- 
2.51.0


