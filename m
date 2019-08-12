Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A449889C46
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2019 13:05:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728034AbfHLLFV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Aug 2019 07:05:21 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:32769 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727995AbfHLLFU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Aug 2019 07:05:20 -0400
Received: from tschai.fritz.box ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id x88XhQAyTur8Tx88chi11N; Mon, 12 Aug 2019 13:05:18 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Maxime Jourdan <mjourdan@baylibre.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2 04/12] media: s5p_mfc_dec: set flags for OUTPUT coded formats
Date:   Mon, 12 Aug 2019 13:05:05 +0200
Message-Id: <20190812110513.23774-5-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190812110513.23774-1-hverkuil-cisco@xs4all.nl>
References: <20190812110513.23774-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfDRv5jbgUAiVk0jpFvYjwj97C4WdO/qhGKfS4rRlt1tQ00u/EadhKZypAT5d3IIVBop0Yes7I9V+7rYquh9uyqTLdHIqtDOFtB4Ax1x4n1ITUOo/4ZMf
 FTQ6GjZ7emIzhqZPAxLLEx02QTUVLyjtzgRUkR8nle4EUewS/Si7eSxh7ItEyP9279Qofv3k7LS42HlBz1yjEFa1pxG/IK/8H3zD4TeuwPwktrxRLBkSLuwb
 +CqII/Y2dvA6UkZ8nusabdWMQH9ll1L0AatwykHRaC1oJWWmOxHP2QQ8xkIdUcTj
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Maxime Jourdan <mjourdan@baylibre.com>

Tag all the coded formats where the s5p_mfc decoder supports dynamic
resolution switching or has a bytestream parser.

Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
[hverkuil-cisco@xs4all.nl: added CONTINUOUS_BYTESTREAM]
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

