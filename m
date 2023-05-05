Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 504F56F8A6E
	for <lists+linux-media@lfdr.de>; Fri,  5 May 2023 22:54:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233406AbjEEUyY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 May 2023 16:54:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231536AbjEEUyW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 May 2023 16:54:22 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE3EF49E3
        for <linux-media@vger.kernel.org>; Fri,  5 May 2023 13:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683320061; x=1714856061;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=x5E1kmG9DUgsUhl2USxBgQBOV4MQCe+t0PHAm/6kpwc=;
  b=aFuKLMIUpVXCPisAkVAnycJ5NBk4ldSEvi/ojil+1q5P7e6t1rfCLsP3
   B5a2Jx4bdWS4nziEuKLRr2duH3Ilev+btdAmsvsZL8tW13KL0x9SN3wAh
   C6IIt5a8NX0BWcloEbWD+vd9J1GWyB9O93stBZ3yuYuLWtOwAN/kcNSIM
   QC+tB9meOsq+T65BxTy0TJqNtyENjNYpERShueiCM+wb6jrjbZbXdcADn
   ZbCwGAKfEYXmCDIySR+SEXlbL1ViafVHOs2210vUxTtachL+NMtaWhW5M
   R6HLL8o2qTTrkHjFzLWNepFBuRmPeTfQp5YiAot9qwk/Us6B0Iut5DGth
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="414842204"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="414842204"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 13:54:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="767265295"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="767265295"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 13:54:20 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id E2FFE1205F8;
        Fri,  5 May 2023 23:54:16 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     bingbu.cao@intel.com
Subject: [PATCH 0/2] Small MC + CIO2 cleanups
Date:   Fri,  5 May 2023 23:54:14 +0300
Message-Id: <20230505205416.55002-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

Here are two small cleanups for MC + IPU3 CIO2 driver.

Sakari Ailus (2):
  media: uapi: Make media_entity_get_fwnode_pad() fwnode argument const
  media: pci: ipu3-cio2: Obtain remote pad from endpoint

 drivers/media/mc/mc-entity.c                  |  2 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c | 30 +++++++++----------
 include/media/media-entity.h                  |  2 +-
 3 files changed, 17 insertions(+), 17 deletions(-)

-- 
2.30.2

