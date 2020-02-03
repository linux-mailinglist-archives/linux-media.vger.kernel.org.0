Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10F2C150594
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2020 12:43:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726561AbgBCLne (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Feb 2020 06:43:34 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:51297 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726258AbgBCLne (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 3 Feb 2020 06:43:34 -0500
Received: from tschai.fritz.box ([46.9.235.248])
        by smtp-cloud8.xs4all.net with ESMTPA
        id ya8XiS6uJn7E5ya8bi3V5i; Mon, 03 Feb 2020 12:43:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1580730213; bh=JhOZ68ljLIbktlNn9XtzAcXc7jR2zKMAdLJCOdrO+sQ=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=EnlxMP1rAXerxAq66Q20N0KlaOSXe2ubhU5bM9/iZG/D3spT5JkChj2EgyfAUWMMr
         j9Qi/imXYR8JlZVjpdZcRCQDp6z4jIeihvLo1G7H9fK5us+AJRyNz+4aQkRLIdyF2d
         VvOTo4BjScCNYrgxr4Mbg9jzIVzumwcMMq/+ZeqftRIeOqy7cFoejWp9dd4QJxlKgb
         y3yI9xdMl4/NbQJYm3I/XbBOCx31MdikUtwd6Nv0DRNoyTB7pR/bF4YErUK9qG/02B
         WvDorH9D4eT6il4oWg1Pnl9QalM9kurkWy9aaWk0ZC5Qxm6zC5Bs4l5LxXCaQymvVw
         1tCOfFQUZHXow==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 11/11] v4l2-dev.h: remove VFL_TYPE_GRABBER
Date:   Mon,  3 Feb 2020 12:41:19 +0100
Message-Id: <20200203114119.1177490-12-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200203114119.1177490-1-hverkuil-cisco@xs4all.nl>
References: <20200203114119.1177490-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfJ+7u+LFNDEYz2FrxBtEO9PAWHgEYAqh2orTG3bntn6oGxW8hex0sd7DQiFsuSucmLtTvY2NPCiRQmKg5DMm+xFz85+00rqcRwvQUyzIushNd/uoKuAN
 0iSP2eAUAlmdZhieNC+FNJ1arS9LrRIXx9w+KbR8jAoW9Oode0Yc6DYogs1bUKd4FIy9g3cgiehYMhi9mWG8syu8EPUZvSm7H/JL/fHZ0YOXrmUtf45bR0nP
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The last driver was converted to use VFL_TYPE_VIDEO, so the old
_GRABBER enum can now be removed.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 include/media/v4l2-dev.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
index 5e7c0f8acd05..4602c15ff878 100644
--- a/include/media/v4l2-dev.h
+++ b/include/media/v4l2-dev.h
@@ -25,7 +25,6 @@
  * enum vfl_devnode_type - type of V4L2 device node
  *
  * @VFL_TYPE_VIDEO:	for video input/output devices
- * @VFL_TYPE_GRABBER:	deprecated, same as VFL_TYPE_VIDEO
  * @VFL_TYPE_VBI:	for vertical blank data (i.e. closed captions, teletext)
  * @VFL_TYPE_RADIO:	for radio tuners
  * @VFL_TYPE_SUBDEV:	for V4L2 subdevices
@@ -35,7 +34,6 @@
  */
 enum vfl_devnode_type {
 	VFL_TYPE_VIDEO,
-	VFL_TYPE_GRABBER = VFL_TYPE_VIDEO,
 	VFL_TYPE_VBI,
 	VFL_TYPE_RADIO,
 	VFL_TYPE_SUBDEV,
-- 
2.24.0

