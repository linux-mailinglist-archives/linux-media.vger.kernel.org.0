Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 420F968E9E4
	for <lists+linux-media@lfdr.de>; Wed,  8 Feb 2023 09:29:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbjBHI3l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Feb 2023 03:29:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229590AbjBHI3k (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Feb 2023 03:29:40 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28812B746
        for <linux-media@vger.kernel.org>; Wed,  8 Feb 2023 00:29:38 -0800 (PST)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E872C496;
        Wed,  8 Feb 2023 09:29:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675844976;
        bh=MDS5IDtdqwsw5d5ooAax7OknMyhhBsxtxqY9Ap06hzg=;
        h=From:To:Cc:Subject:Date:From;
        b=N4J+27nKew8Rc7HhnA6J+LxYQ1riAT1tm1+tkN9lX/aMbX7uREzt6Wh6VB6KVgrNr
         eU+QG0wLMDnCjBhev6IeSxFmXfOuyDm09oPYsxJRcKqDea2FKaOg6/2GzJD1GV5hyz
         mGL+Rj2a3X0/xqz71gXjQbCwLeDsDlxwKrQoBGQ4=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dave Airlie <airlied@redhat.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] media: Fix building pdfdocs
Date:   Wed,  8 Feb 2023 10:29:16 +0200
Message-Id: <20230208082916.68377-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit 8d0e3fc61abd ("media: Add 2-10-10-10 RGB formats") added
documatation for a few new RGB formats. For some reason these break the
pdfdocs build, even if the same style seems to work elsewhere in the
file.

Remove the trailing empty dash lines, which seems to fix the issue.

Fixes: 8d0e3fc61abd ("media: Add 2-10-10-10 RGB formats")
Reported-by: Akira Yokosawa <akiyks@gmail.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---

Note: the offending patch was merged via drm tree, so we may want to
apply the fix to the drm tree also.

 Documentation/userspace-api/media/v4l/pixfmt-rgb.rst | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
index d330aeb4d3eb..ea545ed1aeaa 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
@@ -868,7 +868,6 @@ number of bits for each component.
       - r\ :sub:`4`
       - r\ :sub:`3`
       - r\ :sub:`2`
-      -
     * .. _V4L2-PIX-FMT-RGBA1010102:
 
       - ``V4L2_PIX_FMT_RGBA1010102``
@@ -909,7 +908,6 @@ number of bits for each component.
       - r\ :sub:`4`
       - r\ :sub:`3`
       - r\ :sub:`2`
-      -
     * .. _V4L2-PIX-FMT-ARGB2101010:
 
       - ``V4L2_PIX_FMT_ARGB2101010``
@@ -950,7 +948,6 @@ number of bits for each component.
       - r\ :sub:`6`
       - r\ :sub:`5`
       - r\ :sub:`4`
-      -
 
 .. raw:: latex
 
-- 
2.34.1

