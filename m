Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98FF22A040C
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 12:23:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726519AbgJ3LWx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Oct 2020 07:22:53 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:58852 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726507AbgJ3LWs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Oct 2020 07:22:48 -0400
Received: from floko.floko.floko (unknown [IPv6:2804:14c:483:7e3e::1005])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 0C25A1F45EBC;
        Fri, 30 Oct 2020 11:22:43 +0000 (GMT)
From:   Helen Koike <helen.koike@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        heiko@sntech.de, kernel@collabora.com, hverkuil-cisco@xs4all.nl,
        dafna.hirschfeld@collabora.com, zhengsq@rock-chips.com,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se,
        mchehab@kernel.org, tfiga@chromium.org, ribalda@google.com
Subject: [PATCH v2 3/3] media: MAINTAINERS: Update rkisp1 files with new location
Date:   Fri, 30 Oct 2020 08:22:24 -0300
Message-Id: <20201030112225.2095909-4-helen.koike@collabora.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201030112225.2095909-1-helen.koike@collabora.com>
References: <20201030112225.2095909-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

rkisp1 was moved out of staging, update MAINTAINERS file accordingly.

Signed-off-by: Helen Koike <helen.koike@collabora.com>

---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9e23b20eb2a21..6691c5d3e974b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15037,7 +15037,8 @@ S:	Maintained
 F:	Documentation/admin-guide/media/rkisp1.rst
 F:	Documentation/devicetree/bindings/media/rockchip-isp1.yaml
 F:	Documentation/userspace-api/media/v4l/pixfmt-meta-rkisp1.rst
-F:	drivers/staging/media/rkisp1/
+F:	drivers/media/platform/rockchip/rkisp1
+F:	include/uapi/linux/rkisp1-config.h
 
 ROCKCHIP RASTER 2D GRAPHIC ACCELERATION UNIT DRIVER
 M:	Jacob Chen <jacob-chen@iotwrt.com>
-- 
2.28.0

