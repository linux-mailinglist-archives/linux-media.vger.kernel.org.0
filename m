Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EDC18EE96
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 16:45:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733125AbfHOOpK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 10:45:10 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:58917 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731992AbfHOOpD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 10:45:03 -0400
Received: from cobaltpc1.rd.cisco.com ([IPv6:2001:420:44c1:2579:f038:4b04:f67a:276f])
        by smtp-cloud8.xs4all.net with ESMTPA
        id yGzohwQmCDqPeyGzthYZOa; Thu, 15 Aug 2019 16:45:01 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Maxime Jourdan <mjourdan@baylibre.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv3 04/12] media: s5p_mfc_dec: set flags for OUTPUT coded formats
Date:   Thu, 15 Aug 2019 16:44:48 +0200
Message-Id: <20190815144456.54583-5-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190815144456.54583-1-hverkuil-cisco@xs4all.nl>
References: <20190815144456.54583-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfFme2n57nAKbPhAyrj7hQg0HSZEodKdCQ9T7onUMIgK2Iln5OZAksLz2HRZ0gIq0/fixp2yLuIqFbDirsCL7E5a9jwlvPaHIRmOCHmZQudYhVbJcepuH
 CRZ4whejOJQg6egcDun9ni9ycewgXgb7F0pKt9U1hQjcQGf7tT60IFJw4BKP4l6i2hT45+dViFUsgIAUBOTZpSMmLqRIypJiSJ39Krk3IPQQqKVoRx5Ay1Pa
 U2xTD2Tek4QSbyeCPb7XG3f3qWgaKDQ9Vrw7D07lJTr9V6AcQuMNRAzNTCVIY0jq5CN4LbEEhCltZWtFmcrzAMS1P2Ff2dHgTdb52yMnVJfogqW6D8TTTE0u
 Z2fkWfop1/4AVe8d5yA1l0H0aFsMZnGtROLm/3ykEzx2m4qje9pbCooVcgOiBF7Tievhur0W
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Maxime Jourdan <mjourdan@baylibre.com>

Tag all the coded formats where the s5p_mfc decoder supports dynamic
resolution switching or has a bytestream parser.

Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 .../media/platform/s5p-mfc/s5p_mfc_common.h    |  1 +
 drivers/media/platform/s5p-mfc/s5p_mfc_dec.c   | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc_common.h b/drivers/media/platform/s5p-mfc/s5p_mfc_common.h
index 96d1ecd1521b..31b133af91eb 100644
--- a/drivers/media/platform/s5p-mfc/s5p_mfc_common.h
+++ b/drivers/media/platform/s5p-mfc/s5p_mfc_common.h
@@ -723,6 +723,7 @@ struct s5p_mfc_fmt {
 	enum s5p_mfc_fmt_type type;
 	u32 num_planes;
 	u32 versions;
+	u32 flags;
 };
 
 /**
diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c b/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c
index 61e144a35201..1423c33c70cb 100644
--- a/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c
+++ b/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c
@@ -62,6 +62,8 @@ static struct s5p_mfc_fmt formats[] = {
 		.type		= MFC_FMT_DEC,
 		.num_planes	= 1,
 		.versions	= MFC_V5PLUS_BITS,
+		.flags		= V4L2_FMT_FLAG_DYN_RESOLUTION |
+				  V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM,
 	},
 	{
 		.fourcc		= V4L2_PIX_FMT_H264_MVC,
@@ -69,6 +71,8 @@ static struct s5p_mfc_fmt formats[] = {
 		.type		= MFC_FMT_DEC,
 		.num_planes	= 1,
 		.versions	= MFC_V6PLUS_BITS,
+		.flags		= V4L2_FMT_FLAG_DYN_RESOLUTION |
+				  V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM,
 	},
 	{
 		.fourcc		= V4L2_PIX_FMT_H263,
@@ -76,6 +80,7 @@ static struct s5p_mfc_fmt formats[] = {
 		.type		= MFC_FMT_DEC,
 		.num_planes	= 1,
 		.versions	= MFC_V5PLUS_BITS,
+		.flags		= V4L2_FMT_FLAG_DYN_RESOLUTION,
 	},
 	{
 		.fourcc		= V4L2_PIX_FMT_MPEG1,
@@ -83,6 +88,8 @@ static struct s5p_mfc_fmt formats[] = {
 		.type		= MFC_FMT_DEC,
 		.num_planes	= 1,
 		.versions	= MFC_V5PLUS_BITS,
+		.flags		= V4L2_FMT_FLAG_DYN_RESOLUTION |
+				  V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM,
 	},
 	{
 		.fourcc		= V4L2_PIX_FMT_MPEG2,
@@ -90,6 +97,8 @@ static struct s5p_mfc_fmt formats[] = {
 		.type		= MFC_FMT_DEC,
 		.num_planes	= 1,
 		.versions	= MFC_V5PLUS_BITS,
+		.flags		= V4L2_FMT_FLAG_DYN_RESOLUTION |
+				  V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM,
 	},
 	{
 		.fourcc		= V4L2_PIX_FMT_MPEG4,
@@ -97,6 +106,8 @@ static struct s5p_mfc_fmt formats[] = {
 		.type		= MFC_FMT_DEC,
 		.num_planes	= 1,
 		.versions	= MFC_V5PLUS_BITS,
+		.flags		= V4L2_FMT_FLAG_DYN_RESOLUTION |
+				  V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM,
 	},
 	{
 		.fourcc		= V4L2_PIX_FMT_XVID,
@@ -104,6 +115,7 @@ static struct s5p_mfc_fmt formats[] = {
 		.type		= MFC_FMT_DEC,
 		.num_planes	= 1,
 		.versions	= MFC_V5PLUS_BITS,
+		.flags		= V4L2_FMT_FLAG_DYN_RESOLUTION,
 	},
 	{
 		.fourcc		= V4L2_PIX_FMT_VC1_ANNEX_G,
@@ -111,6 +123,7 @@ static struct s5p_mfc_fmt formats[] = {
 		.type		= MFC_FMT_DEC,
 		.num_planes	= 1,
 		.versions	= MFC_V5PLUS_BITS,
+		.flags		= V4L2_FMT_FLAG_DYN_RESOLUTION,
 	},
 	{
 		.fourcc		= V4L2_PIX_FMT_VC1_ANNEX_L,
@@ -118,6 +131,7 @@ static struct s5p_mfc_fmt formats[] = {
 		.type		= MFC_FMT_DEC,
 		.num_planes	= 1,
 		.versions	= MFC_V5PLUS_BITS,
+		.flags		= V4L2_FMT_FLAG_DYN_RESOLUTION,
 	},
 	{
 		.fourcc		= V4L2_PIX_FMT_VP8,
@@ -125,6 +139,7 @@ static struct s5p_mfc_fmt formats[] = {
 		.type		= MFC_FMT_DEC,
 		.num_planes	= 1,
 		.versions	= MFC_V6PLUS_BITS,
+		.flags		= V4L2_FMT_FLAG_DYN_RESOLUTION,
 	},
 	{
 		.fourcc		= V4L2_PIX_FMT_HEVC,
@@ -132,6 +147,8 @@ static struct s5p_mfc_fmt formats[] = {
 		.type		= MFC_FMT_DEC,
 		.num_planes	= 1,
 		.versions	= MFC_V10_BIT,
+		.flags		= V4L2_FMT_FLAG_DYN_RESOLUTION |
+				  V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM,
 	},
 	{
 		.fourcc		= V4L2_PIX_FMT_VP9,
@@ -139,6 +156,7 @@ static struct s5p_mfc_fmt formats[] = {
 		.type		= MFC_FMT_DEC,
 		.num_planes	= 1,
 		.versions	= MFC_V10_BIT,
+		.flags		= V4L2_FMT_FLAG_DYN_RESOLUTION,
 	},
 };
 
-- 
2.20.1

