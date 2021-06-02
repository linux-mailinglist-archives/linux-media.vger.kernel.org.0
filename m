Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B2F239881E
	for <lists+linux-media@lfdr.de>; Wed,  2 Jun 2021 13:24:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232478AbhFBL0Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Jun 2021 07:26:24 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:59190 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232437AbhFBL0W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Jun 2021 07:26:22 -0400
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com [10.225.0.210])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 98777C0445;
        Wed,  2 Jun 2021 11:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1622633079; bh=tL58wM0CNHnAjNGaw3b8gFhjcr22ewg76YzUjuR3NOI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
         References:From;
        b=amVmR0DQirXO+/STiSUWvRIcUzMRGjSNcKwzpnUl6fhnIifQ9+bk/E4Hm3my7pSmu
         Ut58yjPbd52C3rlPm1Qt5se5rxqvrP77SublI7MAsuybpDw60Rt+kiut0uReVqArkn
         jKz8ZuxcCbEFnHvME8kNqtHr4c4l9dLKwoV+ygPvIneuEZnh4RLQfOc/VzGsIRef0W
         lLwjJjW4LrZa8UDBc6tqQWXnEWOXDRPu2qNPc70ZmgqnkAvpqhxSxAl28eTD1VKt/y
         /Da+j+nt/tKjvrlUWxuEmg/s50m8/3YBB93Ol4mBtCeT7ZHFMTISkTfDPPuUm8Ld33
         ldKMv8/5UzMRA==
Received: from de02dwvm009.internal.synopsys.com (de02dwvm009.internal.synopsys.com [10.225.17.73])
        by mailhost.synopsys.com (Postfix) with ESMTP id 2F33DA006B;
        Wed,  2 Jun 2021 11:24:37 +0000 (UTC)
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
Subject: [PATCH 3/9] MAINTAINERS: Add entry for Synopsys DesignWare HDMI drivers
Date:   Wed,  2 Jun 2021 13:24:21 +0200
Message-Id: <eba5055b26e6aa370f37bfdd80ae362681900463.1622631488.git.nelson.costa@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1622631488.git.nelson.costa@synopsys.com>
References: <cover.1622631488.git.nelson.costa@synopsys.com>
In-Reply-To: <cover.1622631488.git.nelson.costa@synopsys.com>
References: <cover.1622631488.git.nelson.costa@synopsys.com>
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

