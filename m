Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8D714DDF61
	for <lists+linux-media@lfdr.de>; Fri, 18 Mar 2022 17:51:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239388AbiCRQwj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Mar 2022 12:52:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234838AbiCRQwi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Mar 2022 12:52:38 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 028F1E6167;
        Fri, 18 Mar 2022 09:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647622280; x=1679158280;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=o+SJbyKLlLX/Y1kw5kvIveeOwPufsJmkH4eyaHrnTWU=;
  b=bfFAUxJDGeth846OI8wwNnrfnVhg0ecHq2pKR0oBj9mU6/IQW76xasmw
   4ODfF7kQIVGzUY4oAcdS/ppK5qqScMIk5TZCqOe8xPEA3fn8wLIom1bz2
   ngFffZu7I+empNffsInhZ9Eedgy191p1FOQjS9K9+sUc8S0hM3h/0MGhe
   EijTavPtgnhZWIKrTv/t9d7XDSsRx1UZcSV3yOa8EPrYFIqNpcz3bgScU
   T4N0Z2YkHZjCqYhUmFC3uNnThmmqwRThSiE/EKggT63NM3NjA4pd39zLA
   i1V5fpYseKqKXocOi3jQg0EKg3Kr1qg8kC9URDBfMHtGafDKm9oAwjxwS
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10290"; a="256899842"
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; 
   d="scan'208";a="256899842"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2022 09:51:19 -0700
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; 
   d="scan'208";a="784299262"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2022 09:51:18 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 106D12007F;
        Fri, 18 Mar 2022 18:51:15 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1nVFou-0003BS-1g; Fri, 18 Mar 2022 18:51:20 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     devicetree@vger.kernel.org, robh@kernel.org
Subject: [PATCH 0/2] dw9807 binding and driver compatible changes
Date:   Fri, 18 Mar 2022 18:51:17 +0200
Message-Id: <20220318165119.12191-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello everyone,

These two patches convert dw9807 bindings to json-schema and add a new
compatible string to the dw9807-vcm driver in order to support existing
ACPI firmware.

Sakari Ailus (2):
  dt-bindings: Convert Dongwoon dw9807-vcm bindings to json-schema
  dw9807-vcm: Add "dongwoon,dw9807" compatible string

 .../media/i2c/dongwoon,dw9807-vcm.txt         |  9 ----
 .../media/i2c/dongwoon,dw9807-vcm.yaml        | 43 +++++++++++++++++++
 drivers/media/i2c/dw9807-vcm.c                |  2 +
 3 files changed, 45 insertions(+), 9 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9807-vcm.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9807-vcm.yaml

-- 
2.30.2

