Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC54A294346
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 21:39:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409076AbgJTTjg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 15:39:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2409022AbgJTTjf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 15:39:35 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0BDAC0613CE;
        Tue, 20 Oct 2020 12:39:34 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id E230A1F44DC3
From:   Helen Koike <helen.koike@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        robh+dt@kernel.org, heiko@sntech.de, kernel@collabora.com,
        hverkuil-cisco@xs4all.nl, dafna.hirschfeld@collabora.com,
        mark.rutland@arm.com, karthik.poduval@gmail.com,
        eddie.cai.linux@gmail.com, jbx6244@gmail.com,
        zhengsq@rock-chips.com, robin.murphy@arm.com
Subject: [PATCH v6 7/9] media: MAINTAINERS: rkisp1: add path to dt-bindings
Date:   Tue, 20 Oct 2020 16:38:48 -0300
Message-Id: <20201020193850.1460644-8-helen.koike@collabora.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201020193850.1460644-1-helen.koike@collabora.com>
References: <20201020193850.1460644-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Rockchip ISP bindings was moved out of staging.
Update MAINTAINERS file with the new path.

Fields sorted according to output of
./scripts/parse-maintainers.pl --input=MAINTAINERS --output=MAINTAINERS
--order

Signed-off-by: Helen Koike <helen.koike@collabora.com>
Reviewed-by: Tomasz Figa <tfiga@chromium.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7a12633747c80..df679b3626b9a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14889,8 +14889,10 @@ ROCKCHIP ISP V1 DRIVER
 M:	Helen Koike <helen.koike@collabora.com>
 M:	Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
 L:	linux-media@vger.kernel.org
+L:	linux-rockchip@lists.infradead.org
 S:	Maintained
 F:	Documentation/admin-guide/media/rkisp1.rst
+F:	Documentation/devicetree/bindings/media/rockchip-isp1.yaml
 F:	Documentation/userspace-api/media/v4l/pixfmt-meta-rkisp1.rst
 F:	drivers/staging/media/rkisp1/
 
-- 
2.28.0

