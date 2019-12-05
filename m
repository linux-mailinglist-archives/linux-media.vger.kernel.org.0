Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9564E11429A
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2019 15:25:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729731AbfLEOZX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Dec 2019 09:25:23 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49402 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729717AbfLEOZU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Dec 2019 09:25:20 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id B8D84292248
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     kernel@collabora.com, Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Chris Healy <cphealy@gmail.com>, linux-kernel@vger.kernel.org,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v4 1/4] media: vidioc-enum-fmt.rst: clarify format preference
Date:   Thu,  5 Dec 2019 11:24:40 -0300
Message-Id: <20191205142443.1298-2-ezequiel@collabora.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191205142443.1298-1-ezequiel@collabora.com>
References: <20191205142443.1298-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It has been decided to use the ENUM_FMT index value
as a hint for driver preference. This is defined purposedly
in a very liberal way, letting drivers define what "preference"
means.

For instance, the Hantro VPU driver indicates additional
processing to output a given format, and thus implicates
more CPU usage, which is enumerated after native (non-processed)
formats.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 Documentation/media/uapi/v4l/vidioc-enum-fmt.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst b/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
index 399ef1062bac..8ca6ab701e4a 100644
--- a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
+++ b/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
@@ -44,7 +44,9 @@ To enumerate image formats applications initialize the ``type`` and
 the :ref:`VIDIOC_ENUM_FMT` ioctl with a pointer to this structure. Drivers
 fill the rest of the structure or return an ``EINVAL`` error code. All
 formats are enumerable by beginning at index zero and incrementing by
-one until ``EINVAL`` is returned.
+one until ``EINVAL`` is returned. If applicable, drivers shall return
+formats in preference order, where preferred formats are returned before
+(that is, with lower ``index`` value) less-preferred formats.
 
 .. note::
 
-- 
2.22.0

