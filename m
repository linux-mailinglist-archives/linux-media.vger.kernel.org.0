Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBC2421158B
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2020 00:01:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727818AbgGAWB0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jul 2020 18:01:26 -0400
Received: from o1.b.az.sendgrid.net ([208.117.55.133]:34092 "EHLO
        o1.b.az.sendgrid.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727797AbgGAWBZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Jul 2020 18:01:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
        h=from:subject:in-reply-to:references:to:cc:content-type:
        content-transfer-encoding;
        s=001; bh=/hlV6hA1ZYGaBqGX5CuSHDD8AHkJj9B4bVowPHBuF0Q=;
        b=i+PDCCR8woDXP8XrEH2UmLpPM6mRLNVRXMfs5Z6ZmR3uT69GaxtZxBEC2ao+Yt9lnwsJ
        dFSIdyQlo4NLkXXk+O95MmSRRR+xCNG18pric39pl+jjqHlBYEDbSbjp69lGJsQ1eRZHP8
        qqIQZaGcImcRG+mF1wxtfSUqe5kH1Q+E8=
Received: by filterdrecv-p3iad2-5b55dcd864-blwjn with SMTP id filterdrecv-p3iad2-5b55dcd864-blwjn-19-5EFD0686-18
        2020-07-01 21:56:22.338823217 +0000 UTC m=+449226.382650002
Received: from bionic.localdomain (unknown)
        by ismtpd0001p1lon1.sendgrid.net (SG) with ESMTP
        id f6p5tSF0SMyqCKQjV1K26Q
        Wed, 01 Jul 2020 21:56:22.083 +0000 (UTC)
From:   Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 4/9] media: rkvdec: h264: Fix bit depth wrap in pps packet
Date:   Wed, 01 Jul 2020 21:56:22 +0000 (UTC)
Message-Id: <20200701215616.30874-5-jonas@kwiboo.se>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200701215616.30874-1-jonas@kwiboo.se>
References: <20200701215616.30874-1-jonas@kwiboo.se>
X-SG-EID: =?us-ascii?Q?TdbjyGynYnRZWhH+7lKUQJL+ZxmxpowvO2O9SQF5CwCVrYgcwUXgU5DKUU3QxA?=
 =?us-ascii?Q?fZekEeQsTe+RrMu3cja6a0hzj4dPdmtAAZkhLfl?=
 =?us-ascii?Q?L19oMHdMci4bWAbRSDQ9w19LQaxlqG0eCicKN=2F0?=
 =?us-ascii?Q?KUuxS7ZdMw2eVEhP2W6v0bnkNIY+u8Muh7sJ5aQ?=
 =?us-ascii?Q?Lifmu7gIb1Bn6FeLQP5+FRMk6w0YrlbV+q83tZM?=
 =?us-ascii?Q?vIujaWEXu+5J4IbyWKjdSA9Zvd51lrYhsGqtrTz?=
 =?us-ascii?Q?RsgXko2gPPJYPh17usvCA=3D=3D?=
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

The luma and chroma bit depth fields in the pps packet is 3 bits wide.
8 is wrongly added to the bit depth value written to these 3-bit fields.
Because only the 3 LSB is written the hardware is configured correctly.

Correct this by not adding 8 to the luma and chroma bit depth value.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/staging/media/rkvdec/rkvdec-h264.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c b/drivers/staging/media/rkvdec/rkvdec-h264.c
index c9aebeb8f9b3..9c8e49642cd9 100644
--- a/drivers/staging/media/rkvdec/rkvdec-h264.c
+++ b/drivers/staging/media/rkvdec/rkvdec-h264.c
@@ -662,8 +662,8 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
 	WRITE_PPS(0xff, PROFILE_IDC);
 	WRITE_PPS(1, CONSTRAINT_SET3_FLAG);
 	WRITE_PPS(sps->chroma_format_idc, CHROMA_FORMAT_IDC);
-	WRITE_PPS(sps->bit_depth_luma_minus8 + 8, BIT_DEPTH_LUMA);
-	WRITE_PPS(sps->bit_depth_chroma_minus8 + 8, BIT_DEPTH_CHROMA);
+	WRITE_PPS(sps->bit_depth_luma_minus8, BIT_DEPTH_LUMA);
+	WRITE_PPS(sps->bit_depth_chroma_minus8, BIT_DEPTH_CHROMA);
 	WRITE_PPS(0, QPPRIME_Y_ZERO_TRANSFORM_BYPASS_FLAG);
 	WRITE_PPS(sps->log2_max_frame_num_minus4, LOG2_MAX_FRAME_NUM_MINUS4);
 	WRITE_PPS(sps->max_num_ref_frames, MAX_NUM_REF_FRAMES);
-- 
2.17.1

