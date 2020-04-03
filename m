Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D342E19DB2E
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2020 18:16:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404279AbgDCQQk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Apr 2020 12:16:40 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:58086 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404035AbgDCQQk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Apr 2020 12:16:40 -0400
Received: from floko.floko.floko (unknown [IPv6:2804:431:e7cc:11ff:4f80:3de:e2b2:5c1d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 6CEEC29868A;
        Fri,  3 Apr 2020 17:16:33 +0100 (BST)
From:   Helen Koike <helen.koike@collabora.com>
To:     devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Cc:     linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        robh+dt@kernel.org, heiko@sntech.de, hverkuil-cisco@xs4all.nl,
        kernel@collabora.com, dafna.hirschfeld@collabora.com,
        ezequiel@collabora.com, mark.rutland@arm.com,
        karthik.poduval@gmail.com, jbx6244@gmail.com, kishon@ti.com
Subject: [PATCH v2 7/9] media: MAINTAINERS: rkisp1: add path to dt-bindings
Date:   Fri,  3 Apr 2020 13:15:36 -0300
Message-Id: <20200403161538.1375908-8-helen.koike@collabora.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200403161538.1375908-1-helen.koike@collabora.com>
References: <20200403161538.1375908-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Rockchip ISP bindings was moved out of staging.
Update MAINTAINERS file with the new path.

Suggested-by: Johan Jonker <jbx6244@gmail.com>
Signed-off-by: Helen Koike <helen.koike@collabora.com>
---

V2:
- This is a new patch in the series
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d66ac41ef5872..726044b84cf23 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14303,6 +14303,7 @@ M:	Helen Koike <helen.koike@collabora.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	drivers/staging/media/rkisp1/
+F:	Documentation/devicetree/bindings/media/rockchip-isp1.yaml
 
 ROCKCHIP RASTER 2D GRAPHIC ACCELERATION UNIT DRIVER
 M:	Jacob Chen <jacob-chen@iotwrt.com>
-- 
2.26.0

