Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CE832F68F2
	for <lists+linux-media@lfdr.de>; Thu, 14 Jan 2021 19:08:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729463AbhANSFy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jan 2021 13:05:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729450AbhANSFv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jan 2021 13:05:51 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABAEFC061795;
        Thu, 14 Jan 2021 10:05:09 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id AE9681F45C6D
From:   Helen Koike <helen.koike@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, mchehab@kernel.org, hans.verkuil@cisco.com,
        kernel@collabora.com, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Subject: [PATCH 2/3] media: videodev2.h: clarify v4l2_pix_format_mplane.sizeimage docs when to set to zero
Date:   Thu, 14 Jan 2021 15:01:48 -0300
Message-Id: <20210114180149.1755892-3-helen.koike@collabora.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210114180149.1755892-1-helen.koike@collabora.com>
References: <20210114180149.1755892-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

sizeimage field should be set to zero for unused planes, even when
v4l2_pix_format_mplane.num_planes is smaller then the index of planes.

Signed-off-by: Helen Koike <helen.koike@collabora.com>

---

I caught this with v4l2-compliance, which throws an error if we dirty
planes, even if invalid, so I would like to make it clear in the docs.
---
 include/uapi/linux/videodev2.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 79dbde3bcf8d..d9b7c9177605 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -2227,6 +2227,7 @@ struct v4l2_mpeg_vbi_fmt_ivtv {
  * struct v4l2_plane_pix_format - additional, per-plane format definition
  * @sizeimage:		maximum size in bytes required for data, for which
  *			this plane will be used
+ *			Drivers should be set it zero for unused planes.
  * @bytesperline:	distance in bytes between the leftmost pixels in two
  *			adjacent lines
  */
-- 
2.29.2

