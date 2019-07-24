Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3796A72D78
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2019 13:27:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727573AbfGXL1Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jul 2019 07:27:24 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:49019 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727564AbfGXL1W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jul 2019 07:27:22 -0400
Received: from tschai.fritz.box ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id qFQSh3s6JLqASqFQWhNKzZ; Wed, 24 Jul 2019 13:27:20 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 04/14] videodev2.h.rst.exceptions: tymecode -> timecode
Date:   Wed, 24 Jul 2019 13:27:06 +0200
Message-Id: <20190724112716.30288-5-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190724112716.30288-1-hverkuil-cisco@xs4all.nl>
References: <20190724112716.30288-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfBjt76FtKGUO5uZBVzNSx6GHPXxJpZJiO5jFVmbhI66AAsd3bjuB3m7yyUSlyuNY3mWquAscXT8o65IPb9S8p9cYKRxN16rMvB5hbSu9bPgI7YAkcDWO
 iRRmo6OmXVTNBtKaM52Aif03/fH0YUWxcxl4WIVEjmHeB522/v3FYOlsdoErC+lGLq9qAMxF+DIF8v0+0DxrzMOPTrRExD7SSI0GyxL9tHg9l/2Kd82BtJ4I
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix typo.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 Documentation/media/videodev2.h.rst.exceptions | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/media/videodev2.h.rst.exceptions b/Documentation/media/videodev2.h.rst.exceptions
index 0a9a1b386443..b6cb9fa6c8a8 100644
--- a/Documentation/media/videodev2.h.rst.exceptions
+++ b/Documentation/media/videodev2.h.rst.exceptions
@@ -183,14 +183,14 @@ replace define V4L2_FMT_FLAG_EMULATED fmtdesc-flags
 replace define V4L2_FMT_FLAG_HAS_BITSTREAM_PARSER fmtdesc-flags
 replace define V4L2_FMT_FLAG_DYN_RESOLUTION fmtdesc-flags
 
-# V4L2 tymecode types
+# V4L2 timecode types
 replace define V4L2_TC_TYPE_24FPS timecode-type
 replace define V4L2_TC_TYPE_25FPS timecode-type
 replace define V4L2_TC_TYPE_30FPS timecode-type
 replace define V4L2_TC_TYPE_50FPS timecode-type
 replace define V4L2_TC_TYPE_60FPS timecode-type
 
-# V4L2 tymecode flags
+# V4L2 timecode flags
 replace define V4L2_TC_FLAG_DROPFRAME timecode-flags
 replace define V4L2_TC_FLAG_COLORFRAME timecode-flags
 replace define V4L2_TC_USERBITS_field timecode-flags
-- 
2.20.1

