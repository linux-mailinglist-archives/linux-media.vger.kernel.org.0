Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C571212CF3
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2020 21:14:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726357AbgGBTOJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Jul 2020 15:14:09 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:33966 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725878AbgGBTOI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Jul 2020 15:14:08 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id CE57F2A60B5
From:   Helen Koike <helen.koike@collabora.com>
To:     devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Cc:     linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        robh+dt@kernel.org, heiko@sntech.de, hverkuil-cisco@xs4all.nl,
        kernel@collabora.com, dafna.hirschfeld@collabora.com,
        ezequiel@collabora.com, mark.rutland@arm.com,
        karthik.poduval@gmail.com, jbx6244@gmail.com, tfiga@chromium.org,
        eddie.cai.linux@gmail.com, zhengsq@rock-chips.com,
        robin.murphy@arm.com
Subject: [PATCH v4 7/9] media: MAINTAINERS: rkisp1: add path to dt-bindings
Date:   Thu,  2 Jul 2020 16:13:20 -0300
Message-Id: <20200702191322.2639681-8-helen.koike@collabora.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200702191322.2639681-1-helen.koike@collabora.com>
References: <20200702191322.2639681-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Rockchip ISP bindings was moved out of staging.
Update MAINTAINERS file with the new path.

Fields sorted according to output of
./scripts/parse-maintainers.pl --input=MAINTAINERS --output=MAINTAINERS
--order

Signed-off-by: Helen Koike <helen.koike@collabora.com>

---

V3:
- Add line:
L:     linux-rockchip@lists.infradead.org
- Re-order:
F:     drivers/staging/media/rkisp1/

V2:
- This is a new patch in the series
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 634d2c3d621aa..d7141cf17072f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14679,7 +14679,9 @@ F:	include/linux/hid-roccat*
 ROCKCHIP ISP V1 DRIVER
 M:	Helen Koike <helen.koike@collabora.com>
 L:	linux-media@vger.kernel.org
+L:	linux-rockchip@lists.infradead.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/media/rockchip-isp1.yaml
 F:	drivers/staging/media/rkisp1/
 
 ROCKCHIP RASTER 2D GRAPHIC ACCELERATION UNIT DRIVER
-- 
2.26.0

