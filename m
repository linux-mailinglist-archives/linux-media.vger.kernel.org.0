Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68BF26D1C68
	for <lists+linux-media@lfdr.de>; Fri, 31 Mar 2023 11:32:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232167AbjCaJcc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Mar 2023 05:32:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232190AbjCaJcP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Mar 2023 05:32:15 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D472C1EA23;
        Fri, 31 Mar 2023 02:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680255112; x=1711791112;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DXN6envxNm0z8Y/R/A2C4vo/itg3XnT3kZkWrelx338=;
  b=T/wWMN6fMCjnPobxUp8boiDk6+5Oqwk1Kq6AdXPDSdto88sN+waArIMZ
   z7unPV36npUVKN9HHN4YYoE1nAQF5idzVlS5VlZU4Ni3r53jmXNJ6wVOS
   dueRGkdlgw6hd8QDjiN7IO9kfmJ3F8zb4dzO1kICEs13ja5UwmFMNxS5D
   pQHTdrzdxfVQx7d/F3q2KT9UcE74UlW+wgbqbLw/rpTCUNKPSGz/RkUhy
   3w5E6CD2/wkSb1sK09KADImrdYBgdiyKPFahBq53gYeSElrIIHthzQCcz
   TcbgbVo4jjhzYK5447+5AddBMgrj4noxuECBwSFG9fgaLMPbSrKfork73
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="340132659"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="340132659"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2023 02:31:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="635228628"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="635228628"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2023 02:31:23 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id B93A11224B6;
        Fri, 31 Mar 2023 12:31:20 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1piB5D-00DjN7-H5; Fri, 31 Mar 2023 12:30:07 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     devicetree@vger.kernel.org
Subject: [PATCH 2/2] media: dt-bindings: ov8856: Assign maintainership to myself
Date:   Fri, 31 Mar 2023 12:29:57 +0300
Message-Id: <20230331092957.3272621-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230331092957.3272621-1-sakari.ailus@linux.intel.com>
References: <20230331092957.3272621-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dongchun's e-mail mailbox is no longer available, assign the
maintainership to myself.

	The following message to <dongchun.zhu@mediatek.com> was
	undeliverable. The reason for the problem: 5.1.0 - Unknown address
	error 550-'Relaying mail to dongchun.zhu@mediatek.com is not
	allowed'

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/devicetree/bindings/media/i2c/ov8856.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/ov8856.yaml b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
index e17288d579812..57f5e48fd8e03 100644
--- a/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
@@ -8,7 +8,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Omnivision OV8856 CMOS Sensor
 
 maintainers:
-  - Dongchun Zhu <dongchun.zhu@mediatek.com>
+  - Sakari Ailus <sakari.ailus@linux.intel.com>
 
 description: |-
   The Omnivision OV8856 is a high performance, 1/4-inch, 8 megapixel, CMOS
-- 
2.30.2

