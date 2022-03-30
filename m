Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDF2E4EBBD8
	for <lists+linux-media@lfdr.de>; Wed, 30 Mar 2022 09:35:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243573AbiC3HhL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Mar 2022 03:37:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243879AbiC3HhH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Mar 2022 03:37:07 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01FA1221BA8;
        Wed, 30 Mar 2022 00:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648625708; x=1680161708;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4Xf8o56SKS1NAMFom/1GaxiwtBhJ860/UwayaIk3hxE=;
  b=EyWEPEH4vJ+t+G3JpJS8233f2jmpm3lCEj5HjGzQnifQnKrc7agPQRHS
   k8QvHKE4NGlOI/0S9EdQC5a0OFSqSJB4epdxkWpIrqboeekM16Y2Wn/SE
   298X+wpA7PjJCz3EwcltkxQYVrnVVZXm35qYq9jmEbHBMqckK8LcJJmOX
   qZoKl+3WVjgaPAln8F4fc+6xpwBoM1UAEgUtKAyKQelz/wa5lhvs2lP4H
   YuCBHRAhuKjNdsfj2IxzcmHz+5JdrPMjR3rOp6158rRCVgsAg5l0p5ofS
   CYWRAiMUz7GMjczBuEHzbbFMXEw4tthFAmOKZ03pBjRJCfR8dT1Dx62mZ
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="240069444"
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; 
   d="scan'208";a="240069444"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2022 00:33:13 -0700
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; 
   d="scan'208";a="719876671"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2022 00:33:12 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id E8CB320365;
        Wed, 30 Mar 2022 10:33:09 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1nZSpp-002T7Z-BT; Wed, 30 Mar 2022 10:33:41 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     devicetree@vger.kernel.org, robh@kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v3 0/2] dw9807 binding and driver compatible changes
Date:   Wed, 30 Mar 2022 10:33:39 +0300
Message-Id: <20220330073341.588550-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello everyone,

These two patches convert dw9807 bindings to json-schema and add a new
compatible string to the dw9807-vcm driver in order to support existing
ACPI firmware.

since v2:

- Send the correct patches --- v2 patches were from an old branch before v1.

since v1:

- Use stronger language in a comment related to a compatible string for
  old firmware.

- Remove extra newlines and quotes from bindings.

Sakari Ailus (2):
  dt-bindings: Convert Dongwoon dw9807-vcm bindings to json-schema
  dw9807-vcm: Add "dongwoon,dw9807" compatible string

 .../media/i2c/dongwoon,dw9807-vcm.txt         |  9 ----
 .../media/i2c/dongwoon,dw9807-vcm.yaml        | 41 +++++++++++++++++++
 drivers/media/i2c/dw9807-vcm.c                |  2 +
 3 files changed, 43 insertions(+), 9 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9807-vcm.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9807-vcm.yaml

-- 
2.30.2

