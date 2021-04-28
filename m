Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7249336DB7F
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 17:25:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239934AbhD1P0E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 11:26:04 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:56554 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231604AbhD1P0D (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 11:26:03 -0400
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com [10.225.0.210])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 13941404C6;
        Wed, 28 Apr 2021 15:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1619623518; bh=tL58wM0CNHnAjNGaw3b8gFhjcr22ewg76YzUjuR3NOI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
         References:From;
        b=TtiE8hkirCMw8JWvajkI09ON9aK2gfnXuIOxGbnvOAUANaT6AXiW7HxhJnwQeaEIm
         xmuZVm+GGBIbkvbazRTdPfLU3ihjqXIiDg0UciQR3NMo8zILnjtPO+6tAZRZEsZGPS
         c5+p81JPJWQ3VKNodOpdds102KaUAWnkkTFJoLq4cXPYKFPcZJ7FAxmN4MYYlip0fE
         +HeoVORFeWWklvsOchF+0PvZ87Kj9o56XgcObTS3btb5AF2aDLpxzuvunUs2/1Ke7Y
         +IlWncgRHWwC9eK6UU6b86IeismZ2+6c78yj/yXP0FRL+c0izX3zxTICWxi5RXavKL
         +qEVu6mX7Xw3A==
Received: from de02dwvm009.internal.synopsys.com (de02dwvm009.internal.synopsys.com [10.225.17.73])
        by mailhost.synopsys.com (Postfix) with ESMTP id 61836A005F;
        Wed, 28 Apr 2021 15:25:16 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From:   Nelson Costa <Nelson.Costa@synopsys.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jose Abreu <Jose.Abreu@synopsys.com>,
        Nelson Costa <Nelson.Costa@synopsys.com>,
        Jose Abreu <Jose.Abreu@synopsys.com>
Subject: [RFC 2/8] MAINTAINERS: Add entry for Synopsys DesignWare HDMI drivers
Date:   Wed, 28 Apr 2021 17:25:05 +0200
Message-Id: <badb02be8bc3b962bca578a505fe53d875c41d7e.1618937288.git.nelson.costa@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1618937288.git.nelson.costa@synopsys.com>
References: <cover.1618937288.git.nelson.costa@synopsys.com>
In-Reply-To: <cover.1618937288.git.nelson.costa@synopsys.com>
References: <cover.1618937288.git.nelson.costa@synopsys.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add an entry for Synopsys DesignWare HDMI Receivers drivers
and PHYs.

Signed-off-by: Jose Abreu <jose.abreu@synopsys.com>
Signed-off-by: Nelson Costa <nelson.costa@synopsys.com>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 04e6df9..e0e7b41 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17304,6 +17304,17 @@ S:	Supported
 F:	drivers/net/pcs/pcs-xpcs.c
 F:	include/linux/pcs/pcs-xpcs.h
 
+SYNOPSYS DESIGNWARE HDMI RECEIVERS AND PHY DRIVERS
+M:	Jose Abreu <jose.abreu@synopsys.com>
+M:	Nelson Costa <nelson.costa@synopsys.com>
+L:	linux-media@vger.kernel.org
+S:	Odd Fixes
+F:	Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
+F:	drivers/media/platform/dwc/*
+F:	drivers/phy/dwc/*
+F:	include/linux/phy/dwc/*
+F:	include/media/dwc/*
+
 SYNOPSYS DESIGNWARE I2C DRIVER
 M:	Jarkko Nikula <jarkko.nikula@linux.intel.com>
 R:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
-- 
2.7.4

