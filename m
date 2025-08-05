Return-Path: <linux-media+bounces-38929-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD0BB1B429
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 15:10:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AC22182A6F
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 13:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CEF0273D6C;
	Tue,  5 Aug 2025 13:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aZobDmXg"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8444A2749DA;
	Tue,  5 Aug 2025 13:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754399407; cv=none; b=iOqEu5Qy5hQxOZACjyqtUFD1k3sikDOa1U3/QIQW5EMBIR3lCHPeJmh5cdw0jKMjlm9HKT6QlN4sbnJB+oDbLC8r4lCYS6yP66Wd6gkA5zxkpRwvnyJLGh7bG/DRARHvPMIDcSyiNtrxz2Y46YSiCqI60XEnXcqBMYdvrpRBtv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754399407; c=relaxed/simple;
	bh=mM1PN7qys62gLBy3sxKygh7hbsoeeNkZqeyBgBr51CY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kGhffHtNHZM8U9hjoCuC0+Z92ZFDG15BTLr/ks0/f0Br1pLVf3Em/kL7aHudKEZ7kzOrgwgW6yl1t/Zlgmd3Pi7s4Uq519O7vJ90zrZCXlL4o6O942w9M1JXxYsObGVOai0wc6FXtdU5jCXzafGQb+sR5k6Pf9Y61h9eyDRhpG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aZobDmXg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 948C5C4CEF0;
	Tue,  5 Aug 2025 13:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754399407;
	bh=mM1PN7qys62gLBy3sxKygh7hbsoeeNkZqeyBgBr51CY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aZobDmXg83uj4dBvBBNpUvOQ7oTFWsMsFOvC2hr6iGJttmw/gC5emVKO4+Z9B7We4
	 pXLAM69Pu40dmhahfKoXNBIFr3vJlFajPhM9M7tJvFrBBdu5dwcsm7xzCtvkIgPx8A
	 /CgWjkBMXOaf/EQk+rYWVXMf7CnISOMkaqAV/9HvmqRFMf5bNDGArD1KTP57zpvvl7
	 tqRzTpz5vtcqDa6OHc+xJvQtt/GYSD/Ddwl9DMTfJeMigWpM9HB0GFHdbrqtWS9YWs
	 N44lXf8GpdU688/Of+nU0W0mKs3fd84nmwFdm8mTuZL8cX9LAHAxr561oKgmePp2HC
	 /SwutT36fM7IQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: chenchangcheng <chenchangcheng@kylinos.cn>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	hansg@kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.16-5.4] media: uvcvideo: Fix bandwidth issue for Alcor camera
Date: Tue,  5 Aug 2025 09:08:44 -0400
Message-Id: <20250805130945.471732-9-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250805130945.471732-1-sashal@kernel.org>
References: <20250805130945.471732-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.16
Content-Transfer-Encoding: 8bit

From: chenchangcheng <chenchangcheng@kylinos.cn>

[ Upstream commit 9764401bf6f8a20eb11c2e78470f20fee91a9ea7 ]

Some broken device return wrong dwMaxPayloadTransferSize fields as
follows:

[  218.632537] uvcvideo: Device requested 2752512 B/frame bandwidth.
[  218.632598] uvcvideo: No fast enough alt setting for requested bandwidth.

When dwMaxPayloadTransferSize is greater than maxpsize, it will prevent
the camera from starting. So use the bandwidth of maxpsize.

Signed-off-by: chenchangcheng <chenchangcheng@kylinos.cn>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Link: https://lore.kernel.org/r/20250510061803.811433-1-ccc194101@163.com
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Based on my analysis of the commit and the surrounding code context,
here is my determination:

**YES**

This commit should be backported to stable kernel trees for the
following reasons:

1. **Fixes a real user-impacting bug**: The commit fixes a bandwidth
   issue that prevents certain USB cameras (specifically Alcor cameras)
   from starting. As shown in the commit message, devices can request
   unrealistic bandwidth values (2752512 B/frame), which causes the "No
   fast enough alt setting for requested bandwidth" error at line 2080
   in uvc_video.c, preventing the camera from functioning.

2. **Small and contained fix**: The change is minimal - it adds only 8
   lines of code that perform a simple bounds check. When
   `dwMaxPayloadTransferSize` exceeds `stream->maxpsize`, it caps the
   value to the maximum packet size. This is a defensive programming
   approach that doesn't change any core functionality.

3. **Low regression risk**: The fix is conservative and only triggers
   when:
   - The interface has multiple alternate settings
     (`stream->intf->num_altsetting > 1`)
   - The requested payload size exceeds the endpoint's maximum packet
     size
   - It simply clamps the value rather than rejecting it, allowing the
     device to work with reduced bandwidth

4. **Follows established pattern**: The code already has similar
   workarounds for broken devices (e.g., the Chicony device fix at lines
   226-227 that masks invalid bandwidth values). This fix follows the
   same philosophy of working around non-compliant hardware.

5. **Hardware compatibility issue**: This fixes compatibility with
   specific hardware (Alcor cameras) that would otherwise be completely
   non-functional. Hardware compatibility fixes are typically good
   candidates for stable backports as they enable users to use their
   existing hardware.

6. **Clear problem and solution**: The issue is well-defined (devices
   returning wrong `dwMaxPayloadTransferSize`), and the solution is
   straightforward (cap to the actual maximum packet size). The warning
   message also provides visibility into when this workaround is
   applied.

7. **No architectural changes**: The fix doesn't introduce new features
   or change the driver architecture. It's purely a workaround for non-
   compliant hardware, similar to other quirks already present in the
   UVC driver.

The commit meets the stable kernel criteria of fixing an important bug
(camera not working) with minimal risk and without introducing new
features or architectural changes.

 drivers/media/usb/uvc/uvc_video.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index e3567aeb0007..11769a1832d2 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -262,6 +262,15 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
 
 		ctrl->dwMaxPayloadTransferSize = bandwidth;
 	}
+
+	if (stream->intf->num_altsetting > 1 &&
+	    ctrl->dwMaxPayloadTransferSize > stream->maxpsize) {
+		dev_warn_ratelimited(&stream->intf->dev,
+				     "UVC non compliance: the max payload transmission size (%u) exceeds the size of the ep max packet (%u). Using the max size.\n",
+				     ctrl->dwMaxPayloadTransferSize,
+				     stream->maxpsize);
+		ctrl->dwMaxPayloadTransferSize = stream->maxpsize;
+	}
 }
 
 static size_t uvc_video_ctrl_size(struct uvc_streaming *stream)
-- 
2.39.5


