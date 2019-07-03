Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41E955E3E4
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2019 14:29:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726490AbfGCM24 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jul 2019 08:28:56 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:38588 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbfGCM2z (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Jul 2019 08:28:55 -0400
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id CC4A328A265;
        Wed,  3 Jul 2019 13:28:53 +0100 (BST)
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Alexandre Courbot <acourbot@chromium.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH v3 1/3] media: uapi: h264: Clarify our expectations regarding NAL header format
Date:   Wed,  3 Jul 2019 14:28:47 +0200
Message-Id: <20190703122849.6316-2-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190703122849.6316-1-boris.brezillon@collabora.com>
References: <20190703122849.6316-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Looks like some stateless decoders expect slices to be prefixed with
ANNEX B start codes (they most likely do some kind of bitstream parsing
and/or need that to delimit slices when doing per frame decoding).
Since skipping those start codes for dummy stateless decoders (those
expecting all params to be passed through controls) should be pretty
easy, let's mandate that all slices be prepended with ANNEX B start
codes.

If we ever need to support AVC headers, we can add a new menu control
to select the type of NAL header to use.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
Changes in v3:
* Add Paul's R-b

Changes in v2:
* None
---
 Documentation/media/uapi/v4l/ext-ctrls-codec.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
index 7a1947f5be96..3ae1367806cf 100644
--- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
+++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
@@ -1726,6 +1726,7 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
     :ref:`h264`, section 7.4.3 "Slice Header Semantics". For further
     documentation, refer to the above specification, unless there is
     an explicit comment stating otherwise.
+    All slices should be prepended with an ANNEX B start code.
 
     .. note::
 
-- 
2.21.0

