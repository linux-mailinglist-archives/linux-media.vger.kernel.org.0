Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB1061E1F62
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2020 12:09:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731865AbgEZKJl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 May 2020 06:09:41 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:43133 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731815AbgEZKJk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 May 2020 06:09:40 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id dWWajU9GZDazBdWWgjeMAP; Tue, 26 May 2020 12:09:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1590487778; bh=zbBuzZfTTYRiDTqVVYRYvkiYf1YhHK5RjN+6SH69+3I=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=nZepC95Ti4EsI8WGDZdg/jvjqlxi/tObCubN0RNaRivVFahFsjkf8+h1L71Yyae1B
         HdOI28bJZrD4Iq3LukWnKUskhd2XGTY+T+yzBnX3Sc+aumuj8LxLAK842e61HEfV0f
         Vn7NbGB2mMqbwdJhI0Um/BLXAe9HKf1XQBrCdA2SyEgocJdnldQFV5CdS9UFY0oyWU
         CHutYL7oLhaxO/34MXt28B2BqmEBsH2MF7vRDIN9YYDWNEHucxR4m3l20vVAigk86K
         qmCodRZsQ0ruHDqy0bL6vxIq+xzvrTdaiQQazYPMoPyrFU3hfDE0ElnuvZFIFlz1NF
         7gP1qb9W5uS8Q==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Tomasz Figa <tfiga@chromium.org>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv3 5/5] dev-encoder.rst: add reference to V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL
Date:   Tue, 26 May 2020 12:09:32 +0200
Message-Id: <20200526100932.2626420-6-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200526100932.2626420-1-hverkuil-cisco@xs4all.nl>
References: <20200526100932.2626420-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfLU/x877oZ8J07T/dy4BRHLYUqkq116F8n0FpMovnMHpisdi1zJQ3oUvpdUQXTpaK7ddcNLpFrYtrjAUFsMq0XIZkCqh0qzkcplwvehL428KoeFtskqo
 R5YvVE3exlhdNlULZT8t44z27KwhjI8KYWuRSfOmW+csQzxJLKuFiQHAF/MweNbOsnwBRdZtqfXMfFmu3Ldc5zoDTq5zYHJENByfUfFwTHrVRKNGAQamEPOk
 dpC2B+661YmzlSvfGfOewE7u6hjMskLVLyFVbD69VAquu3QGc1Pz6UZ173ljWZxvwf/sFP8NUUEmULEVxVf/3dbPFtUFzdnjh3OgAc0vi1o=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Setting the stateful encoder capture frame interval is only supported
if this flag is set. Document this.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 Documentation/userspace-api/media/v4l/dev-encoder.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/dev-encoder.rst b/Documentation/userspace-api/media/v4l/dev-encoder.rst
index aace7b812a9c..c3a21bfe0052 100644
--- a/Documentation/userspace-api/media/v4l/dev-encoder.rst
+++ b/Documentation/userspace-api/media/v4l/dev-encoder.rst
@@ -281,7 +281,8 @@ Initialization
 5. **Optional** Set the coded frame interval on the ``CAPTURE`` queue via
    :c:func:`VIDIOC_S_PARM`. This is only necessary if the coded frame
    interval is different from the raw frame interval, which is typically
-   the case for off-line encoding.
+   the case for off-line encoding. Support for this feature is signalled
+   by the :ref:`V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL <fmtdesc-flags>` format flag.
 
    * ** Required fields:**
 
-- 
2.25.1

