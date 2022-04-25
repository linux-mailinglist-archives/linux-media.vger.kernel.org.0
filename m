Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13A2650E063
	for <lists+linux-media@lfdr.de>; Mon, 25 Apr 2022 14:33:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241840AbiDYMfk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Apr 2022 08:35:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234368AbiDYMfh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Apr 2022 08:35:37 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95BC066AEB;
        Mon, 25 Apr 2022 05:32:33 -0700 (PDT)
Received: from obbardc-laptop.home (unknown [IPv6:2a00:23c7:6883:e501:cf51:f3a2:10b5:accf])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: obbardc)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 19F0C1F43534;
        Mon, 25 Apr 2022 13:32:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1650889952;
        bh=6dPC6V3Efid0jyddZB9luhvds1hVGmHlsOLFj8lBtIY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Hq9Ww1b9ymuOpIy6SMSdokQoqUUWPdVbTgXkuvcx+OjHvQUp3xWiI04H1bFlselRV
         zXLbCxo9S4vpiqN7dqxbrMDaBLC7Cyw3m0VV48e1NkyVG75LchfGRp9Hp0TzcOILlh
         STH5I9CWMCNFo0Xr5LFxqS6ztZx9L5R8QrYzGCIW6Nbj0lQa+aQ6FJPEzqainNm2O+
         MVXCb7A4KFceoBG/aVh9S0S1t7XxqKN5kYdSWXpcfuD+7tIahf5tCH4DWDldnLJJVv
         nMqLobUK1G7ZpAhQ0y0PRxtKlUAsGGBzAmQwp+NKl07CZhLmvKfcUhb7ROcaOv3lIW
         nR1hLOK6pUKAg==
From:   Christopher Obbard <chris.obbard@collabora.com>
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Johan Jonker <jbx6244@gmail.com>,
        Elaine Zhang <zhangqing@rock-chips.com>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com,
        Christopher Obbard <chris.obbard@collabora.com>
Subject: [PATCH v2 1/3] media: dt-bindings: media: rockchip-vdec: Add RK3328 compatible
Date:   Mon, 25 Apr 2022 13:32:13 +0100
Message-Id: <20220425123215.1055251-2-chris.obbard@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220425123215.1055251-1-chris.obbard@collabora.com>
References: <20220425123215.1055251-1-chris.obbard@collabora.com>
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

Document the RK3328 compatible for rockchip-vdec.

Signed-off-by: Christopher Obbard <chris.obbard@collabora.com>
---
 Documentation/devicetree/bindings/media/rockchip,vdec.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
index 089f11d21b25..ce06835e8d61 100644
--- a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
@@ -20,6 +20,9 @@ properties:
       - items:
           - const: rockchip,rk3228-vdec
           - const: rockchip,rk3399-vdec
+      - items:
+          - const: rockchip,rk3328-vdec
+          - const: rockchip,rk3399-vdec
 
   reg:
     maxItems: 1
-- 
2.34.1

