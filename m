Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AECE272D8F
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2019 13:28:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727485AbfGXL21 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jul 2019 07:28:27 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:49121 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727228AbfGXL20 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jul 2019 07:28:26 -0400
Received: from tschai.fritz.box ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id qFRUh3sccLqASqFRYhNLFP; Wed, 24 Jul 2019 13:28:24 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Maxime Jourdan <mjourdan@baylibre.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 06/14] media: s5p_mfc_dec: set flags for OUTPUT coded formats
Date:   Wed, 24 Jul 2019 13:27:08 +0200
Message-Id: <20190724112716.30288-7-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190724112716.30288-1-hverkuil-cisco@xs4all.nl>
References: <20190724112716.30288-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfFC498lD+po9WiMzrYXpfJgSvpvSxWWE0u59aoSJULnLkPmdCLDJZQDe7WcLbZxR3JsGfFfEpMNaUo76rDK1yFe5MszJq3Yb0mgG8+7nsaPeU43XkMEf
 BsiEcuAlX1owM1KBW6G1QTCLP7AfVIAShXTj+nMfZXsuAWSVJWigUZmnZ/0fUSopzzd/2VUMho6tkFMlZu2cN4gT+ufJ0IK1GHe+qNaAWXvyrEcN0yjARAzM
 HVFaNI3MWkXs3F5hfwkwsg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Maxime Jourdan <mjourdan@baylibre.com>

Tag all the coded formats where the s5p_mfc decoder supports dynamic
resolution switching or has a bitstream parser.

Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
[hverkuil-cisco@xs4all.nl: added HAS_BITSTREAM_PARSER]
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
index 61e144a35201..2d45a4d8d536 100644
--- a/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c
+++ b/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c
@@ -62,6 +62,8 @@ static struct s5p_mfc_fmt formats[] = {
 		.type		= MFC_FMT_DEC,
 		.num_planes	= 1,
 		.versions	= MFC_V5PLUS_BITS,
+		.flags		= V4L2_FMT_FLAG_DYN_RESOLUTION |
+				  V4L2_FMT_FLAG_HAS_BITSTREAM_PARSER,
 	},
 	{
 		.fourcc		= V4L2_PIX_FMT_H264_MVC,
@@ -69,6 +71,8 @@ static struct s5p_mfc_fmt formats[] = {
 		.type		= MFC_FMT_DEC,
 		.num_planes	= 1,
 		.versions	= MFC_V6PLUS_BITS,
+		.flags		= V4L2_FMT_FLAG_DYN_RESOLUTION |
+				  V4L2_FMT_FLAG_HAS_BITSTREAM_PARSER,
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
+				  V4L2_FMT_FLAG_HAS_BITSTREAM_PARSER,
 	},
 	{
 		.fourcc		= V4L2_PIX_FMT_MPEG2,
@@ -90,6 +97,8 @@ static struct s5p_mfc_fmt formats[] = {
 		.type		= MFC_FMT_DEC,
 		.num_planes	= 1,
 		.versions	= MFC_V5PLUS_BITS,
+		.flags		= V4L2_FMT_FLAG_DYN_RESOLUTION |
+				  V4L2_FMT_FLAG_HAS_BITSTREAM_PARSER,
 	},
 	{
 		.fourcc		= V4L2_PIX_FMT_MPEG4,
@@ -97,6 +106,8 @@ static struct s5p_mfc_fmt formats[] = {
 		.type		= MFC_FMT_DEC,
 		.num_planes	= 1,
 		.versions	= MFC_V5PLUS_BITS,
+		.flags		= V4L2_FMT_FLAG_DYN_RESOLUTION |
+				  V4L2_FMT_FLAG_HAS_BITSTREAM_PARSER,
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
+				  V4L2_FMT_FLAG_HAS_BITSTREAM_PARSER,
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

