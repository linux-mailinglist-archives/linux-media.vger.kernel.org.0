Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACAEE19B948
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2020 02:03:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387413AbgDBACy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Apr 2020 20:02:54 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:35686 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733291AbgDBACy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Apr 2020 20:02:54 -0400
Received: from floko.floko.floko (unknown [IPv6:2804:431:e7cc:11ff:4f80:3de:e2b2:5c1d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9D9EC297690;
        Thu,  2 Apr 2020 01:02:48 +0100 (BST)
From:   Helen Koike <helen.koike@collabora.com>
To:     devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Cc:     linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        robh+dt@kernel.org, heiko@sntech.de, hverkuil-cisco@xs4all.nl,
        kernel@collabora.com, dafna.hirschfeld@collabora.com,
        ezequiel@collabora.com, mark.rutland@arm.com,
        karthik.poduval@gmail.com
Subject: [PATCH 1/4] dt-bindings: phy: phy-rockchip-dphy-rx0: move rockchip dphy rx0 bindings out of staging
Date:   Wed,  1 Apr 2020 21:02:31 -0300
Message-Id: <20200402000234.226466-2-helen.koike@collabora.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200402000234.226466-1-helen.koike@collabora.com>
References: <20200402000234.226466-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move phy-rockchip-dphy-rx0 bindings to Documentation/devicetree/bindings/phy

Signed-off-by: Helen Koike <helen.koike@collabora.com>
---
 .../devicetree/bindings/phy/rockchip-mipi-dphy-rx0.yaml           | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename {drivers/staging/media/phy-rockchip-dphy-rx0/Documentation => Documentation}/devicetree/bindings/phy/rockchip-mipi-dphy-rx0.yaml (100%)

diff --git a/drivers/staging/media/phy-rockchip-dphy-rx0/Documentation/devicetree/bindings/phy/rockchip-mipi-dphy-rx0.yaml b/Documentation/devicetree/bindings/phy/rockchip-mipi-dphy-rx0.yaml
similarity index 100%
rename from drivers/staging/media/phy-rockchip-dphy-rx0/Documentation/devicetree/bindings/phy/rockchip-mipi-dphy-rx0.yaml
rename to Documentation/devicetree/bindings/phy/rockchip-mipi-dphy-rx0.yaml
-- 
2.26.0

