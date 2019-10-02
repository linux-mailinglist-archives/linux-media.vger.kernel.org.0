Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 428F7C8B98
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 16:45:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726763AbfJBOoJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 10:44:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:50078 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725935AbfJBOoI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Oct 2019 10:44:08 -0400
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C4BE721920;
        Wed,  2 Oct 2019 14:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570027448;
        bh=FMs2/MEhu8DgOozDx+Vdpkqk8LCkfrJnkFksOVm862E=;
        h=From:To:Cc:Subject:Date:From;
        b=uAXRkZ2Nfyyqf8siZBuPOAau0yydlfizMPgySNFIfOJuRPZDJ8LzYd1XC1jxGsBu+
         TkukWYpagQCoB9xbAAGL0ajMIk3LnpS8rp6VpS4XRKBKisLRMM1tHoTnh0eFlT+z3B
         UtgxOF4HyLWEnRxqrParpGbv6J1oHM/8RUr16RJ8=
From:   Maxime Ripard <mripard@kernel.org>
To:     Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>, mchehab@kernel.org,
        sean@mess.org
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Maxime Ripard <mripard@kernel.org>
Subject: [PATCH] dt-bindings: media: rc: Fix redundant string
Date:   Wed,  2 Oct 2019 16:44:00 +0200
Message-Id: <20191002144400.114541-1-mripard@kernel.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The linux,rc-map-name property is described using an enum, yet a value has
been put in that enum twice, resulting in a warning. Let's fix that.

Fixes: 7c31b9d67342 ("media: dt-bindings: media: Add YAML schemas for the generic RC bindings")
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 Documentation/devicetree/bindings/media/rc.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/rc.yaml b/Documentation/devicetree/bindings/media/rc.yaml
index 3d5c154fd230..9054555e6608 100644
--- a/Documentation/devicetree/bindings/media/rc.yaml
+++ b/Documentation/devicetree/bindings/media/rc.yaml
@@ -73,7 +73,6 @@ properties:
           - rc-genius-tvgo-a11mce
           - rc-gotview7135
           - rc-hauppauge
-          - rc-hauppauge
           - rc-hisi-poplar
           - rc-hisi-tv-demo
           - rc-imon-mce
-- 
2.23.0

