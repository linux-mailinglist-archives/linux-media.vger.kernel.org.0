Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4758410F1B4
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2019 21:48:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725847AbfLBUsH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Dec 2019 15:48:07 -0500
Received: from mail.andi.de1.cc ([85.214.55.253]:53606 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725781AbfLBUsG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 2 Dec 2019 15:48:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=36x8kOQD1A+EaV2wnpbyrxx04DG69+sUUw8lPbX6jwg=; b=b9opIgHRJj1JrgkU2C/XFZLRHV
        1tpe2oivJsRYn0SK63s60lOaUfttudXfPNyUZxw2LI9FJOKmX8lUy/Y6tfztTHumZyVev8lzaUkm4
        b2ZAdNLxUxouspoomCPnHeGG0ALc3/EpTxBfH8VU3PdfgrTvU5aaWGcHCq9T5elr2mkc=;
Received: from p200300ccff066f001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff06:6f00:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1ibsbu-0007pY-Dv; Mon, 02 Dec 2019 21:47:58 +0100
Received: from andi by aktux with local (Exim 4.92)
        (envelope-from <andreas@kemnade.info>)
        id 1ibsbu-0001lB-63; Mon, 02 Dec 2019 21:47:58 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, letux-kernel@openphoenux.org
Cc:     Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH 1/2] media: dt-bindings: media: fsl-pxp: add missing imx6sll
Date:   Mon,  2 Dec 2019 21:47:47 +0100
Message-Id: <20191202204748.6718-2-andreas@kemnade.info>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191202204748.6718-1-andreas@kemnade.info>
References: <20191202204748.6718-1-andreas@kemnade.info>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.0 (-)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

i.MX6SLL also has a pxp, so mention it among others in the bindings doc.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 Documentation/devicetree/bindings/media/fsl-pxp.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/fsl-pxp.txt b/Documentation/devicetree/bindings/media/fsl-pxp.txt
index 2477e7f87381..f8090e06530d 100644
--- a/Documentation/devicetree/bindings/media/fsl-pxp.txt
+++ b/Documentation/devicetree/bindings/media/fsl-pxp.txt
@@ -8,7 +8,7 @@ i.MX SoCs from i.MX23 to i.MX7.
 
 Required properties:
 - compatible: should be "fsl,<soc>-pxp", where SoC can be one of imx23, imx28,
-  imx6dl, imx6sl, imx6ul, imx6sx, imx6ull, or imx7d.
+  imx6dl, imx6sl, imx6sll, imx6ul, imx6sx, imx6ull, or imx7d.
 - reg: the register base and size for the device registers
 - interrupts: the PXP interrupt, two interrupts for imx6ull and imx7d.
 - clock-names: should be "axi"
-- 
2.20.1

