Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53B9D216122
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 23:57:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727853AbgGFVyp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 17:54:45 -0400
Received: from o1.b.az.sendgrid.net ([208.117.55.133]:38039 "EHLO
        o1.b.az.sendgrid.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727789AbgGFVyj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 17:54:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
        h=from:subject:in-reply-to:references:to:cc:content-type:
        content-transfer-encoding;
        s=001; bh=xRvXleIsFrOUoVEFb2+EqS1sO8vNP09eztv2NUch3P4=;
        b=S1nVBMGmkIVtJMfuJDtwUDlmFM36++kjO/Sbbw3SBF8V8MLUQ0Wa2NB0F8t1ZP48hTSJ
        JisXget+1VHsk17FOWWgMnzDtNWN/XDp5tbZ99jItemPZevfJGfHzlI2LtJbd5FtUnKbPi
        Gy8qguUJHcFQ6DKTvydNbrTVCU1K60Pos=
Received: by filterdrecv-p3iad2-5b55dcd864-5dqzw with SMTP id filterdrecv-p3iad2-5b55dcd864-5dqzw-19-5F039D9E-D
        2020-07-06 21:54:38.266225202 +0000 UTC m=+881111.140990039
Received: from bionic.localdomain (unknown)
        by ismtpd0008p1lon1.sendgrid.net (SG) with ESMTP
        id RkkRZ2UwQbil5L0N__xREg
        Mon, 06 Jul 2020 21:54:38.020 +0000 (UTC)
From:   Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v2 12/12] media: rkvdec: h264: Support profile and level
 controls
Date:   Mon, 06 Jul 2020 21:54:38 +0000 (UTC)
Message-Id: <20200706215430.22859-13-jonas@kwiboo.se>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200706215430.22859-1-jonas@kwiboo.se>
References: <20200701215616.30874-1-jonas@kwiboo.se>
 <20200706215430.22859-1-jonas@kwiboo.se>
X-SG-EID: =?us-ascii?Q?TdbjyGynYnRZWhH+7lKUQJL+ZxmxpowvO2O9SQF5CwCVrYgcwUXgU5DKUU3QxA?=
 =?us-ascii?Q?fZekEeQsTe+RrMu3cja6a0h1vz2=2F=2Fhk378RB7Ov?=
 =?us-ascii?Q?uU+Unwr2NFFYBDDmKvAj6aOu7u4GSrColBrbVrh?=
 =?us-ascii?Q?TX5qJmcTnPslZyASlbiJvcXj2p9JfMzqQjp2c5D?=
 =?us-ascii?Q?wej9bazdn0FDJ3De97GWZ5P2JxHPOyDbQEAv+dt?=
 =?us-ascii?Q?SFg9upo7V2PjhaujJhfQ+LfJPCspTtgQ+wyWhRQ?=
 =?us-ascii?Q?GbSEJS+zCDI3TbCnYaHwg=3D=3D?=
To:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Jonas Karlman <jonas@kwiboo.se>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Rockchip Video Decoder used in RK3399 supports H.264 profiles from
Baseline to High 4:2:2 up to Level 5.1, except for the Extended profile.

Expose the V4L2_CID_MPEG_VIDEO_H264_PROFILE and the
V4L2_CID_MPEG_VIDEO_H264_LEVEL control, so that userspace can query the
driver for the list of supported profiles and level.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
---
Changes in v2:
- Moved to end
- Collect r-b tag
---
 drivers/staging/media/rkvdec/rkvdec.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
index 4faee9262392..b21031535330 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -144,6 +144,19 @@ static const struct rkvdec_ctrl_desc rkvdec_h264_ctrl_descs[] = {
 		.cfg.def = V4L2_MPEG_VIDEO_H264_START_CODE_ANNEX_B,
 		.cfg.max = V4L2_MPEG_VIDEO_H264_START_CODE_ANNEX_B,
 	},
+	{
+		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_PROFILE,
+		.cfg.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
+		.cfg.max = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_422,
+		.cfg.menu_skip_mask =
+			BIT(V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED),
+		.cfg.def = V4L2_MPEG_VIDEO_H264_PROFILE_MAIN,
+	},
+	{
+		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_LEVEL,
+		.cfg.min = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
+		.cfg.max = V4L2_MPEG_VIDEO_H264_LEVEL_5_1,
+	},
 };
 
 static const struct rkvdec_ctrls rkvdec_h264_ctrls = {
-- 
2.17.1

