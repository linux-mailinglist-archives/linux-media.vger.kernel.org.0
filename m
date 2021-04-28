Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9D4F36D846
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 15:26:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239817AbhD1N0i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 09:26:38 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:57693 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239634AbhD1N0h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 09:26:37 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id bkCIlVh38k1MGbkCMlOQ2U; Wed, 28 Apr 2021 15:25:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1619616351; bh=KLcMtNu/PFd88iBei8ARghAUq5qJBNqCP6cfIKCdetU=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=GRr6xbBVTR6rrfZ6enGaYHDrmngDyvrjrrfsobfUBlMPeOMza/4XBYqmIsS/HfXqC
         VRWZuQrlk+x7nptnNer1Yop7+nXr4Dbsh2wdG7M+2yd8pbg0WZy9yMpKCGnVrMrJjt
         3KA4MP0Ug6On3XzpL2XLKbipzIwl5mntzvJ772zDSzzfFQO9rmAE87M0nJhiG0U6yn
         lVAJYsM2evzwBoo/sOEzyf2fgjgpCsOhfMt0AGebeC+qOiQ1eI35nLhnp9QmLUDrv4
         l5laTCvEasHljvYun/0OCu+hPyVshd0cWUlmwroMTY2/ZCmvRlmGdvpim5jtMB82fK
         +tGtL/KWjUYwg==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Tony Lindgren <tony@atomide.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dri-devel@lists.freedesktop.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rob Herring <robh@kernel.org>
Subject: [PATCHv3 4/6] dt-bindings: display: ti: ti,omap5-dss.txt: add cec clock
Date:   Wed, 28 Apr 2021 15:25:43 +0200
Message-Id: <20210428132545.1205162-5-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210428132545.1205162-1-hverkuil-cisco@xs4all.nl>
References: <20210428132545.1205162-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfNLevcGa/vJcvtKdvEIiHy92QMBtnAfp4gJ5oaF5BD04x2mRHL2FhkBxrDLGL/QF5SPbt8HI0K+xfQ1Qw3yCultLrCTAHCKvOnCJ77XntJwkqGsYDCER
 sMdKdN4TwFN5jWYmh59ASlv4AsdunMo/Tw/wcTMkv1VviAxbNdZRIVtizp5q+ii3T7AUEzGTXdU9LyWXPfQwTk7PwC78VhJvefNWXf96Cqh1H9ykgmGJIAMk
 UFKKwhowjHKq3M+V4NTGQ+/coSmdnDKFW6T3bwipMS5TOp/mXHgslRevRPpMEIKIsv3/vOKo/2kbnxNQhiaFT2/olOcfVL6jpmeti3N+siiZ0CD3IkUsLCO/
 mwL2SzB/3v6y1mNLbY+IPOUtPq9wbku7jKsmbgOUHCUhg3gUf2SgLZCUcE8D6C8VqsctMHXhVQwhcD9VdDZE8QKXsLbNRA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The cec clock is required as well in order to support HDMI CEC,
document this.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/display/ti/ti,omap5-dss.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/ti/ti,omap5-dss.txt b/Documentation/devicetree/bindings/display/ti/ti,omap5-dss.txt
index 20861218649f..c321c67472f0 100644
--- a/Documentation/devicetree/bindings/display/ti/ti,omap5-dss.txt
+++ b/Documentation/devicetree/bindings/display/ti/ti,omap5-dss.txt
@@ -89,8 +89,8 @@ Required properties:
 - interrupts: the HDMI interrupt line
 - ti,hwmods: "dss_hdmi"
 - vdda-supply: vdda power supply
-- clocks: handles to fclk and pll clock
-- clock-names: "fck", "sys_clk"
+- clocks: handles to fclk, pll and cec clock
+- clock-names: "fck", "sys_clk", "cec"
 
 Optional nodes:
 - Video port for HDMI output
-- 
2.30.2

