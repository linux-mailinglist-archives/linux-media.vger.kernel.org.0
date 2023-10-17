Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF99F7CC145
	for <lists+linux-media@lfdr.de>; Tue, 17 Oct 2023 12:56:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233570AbjJQK4r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Oct 2023 06:56:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234952AbjJQK4h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Oct 2023 06:56:37 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1EC4102
        for <linux-media@vger.kernel.org>; Tue, 17 Oct 2023 03:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697540195; x=1729076195;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=drxQ/bAZav7vgUA58B9pPFoUZqZzOcHp8fzC9o/qQUw=;
  b=dMBVU7J6T7VPjFWjN6E6GtV2VqHMtOehlztU0uF5ulPygJ6leYVtNgV9
   aw/uQ2LxCgsVPcRT1O41qbelLuU3YzR83UXMD06Juir+sup1w7A8V6w1C
   J+uKNc5pEylOsszkiHOZQrZCba7zdgtq0gCdKrHUHT0/UtJxNRPEjLGY/
   uaib2XsyXsOBBJ1SA0lvXazUIDwNdmAFR294mwjF3BX62dRIGgrVDdl4A
   sAqdgJGb9Am43HioxlqxQaFToXYEWE/p67gORDwAeUjTymerf1fVCwZBE
   yw8RrnFXmbuqFbJIzYC/gOddFw1XjjYTPBpXFmViTaymI+t6ZAUzMNjrJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="452231791"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="452231791"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 03:56:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="821936555"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="821936555"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 03:56:33 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 7A9ED11F89D;
        Tue, 17 Oct 2023 13:56:30 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        dave.stevenson@raspberrypi.com, kieran.bingham@ideasonboard.com
Subject: [PATCH v2 0/3] Document link-frequencies better, small fixes
Date:   Tue, 17 Oct 2023 13:56:27 +0300
Message-Id: <20231017105630.558089-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi folks,

Here are a few small documentation improvements.

since v1:

- Fix reference.

Sakari Ailus (3):
  media: Documentation: Document how link frequencies can be chosen
  media: Documentation: BT.601 is not a bus
  media: Documentation: LP-11 and LP-111 are states, not modes

 .../driver-api/media/camera-sensor.rst        | 18 ++++++++++++++++--
 Documentation/driver-api/media/tx-rx.rst      | 19 +++++++++----------
 .../media/drivers/camera-sensor.rst           |  2 ++
 3 files changed, 27 insertions(+), 12 deletions(-)

-- 
2.39.2

