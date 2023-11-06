Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 178077E1BFF
	for <lists+linux-media@lfdr.de>; Mon,  6 Nov 2023 09:26:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231284AbjKFI0S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Nov 2023 03:26:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231261AbjKFI0P (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Nov 2023 03:26:15 -0500
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BFF51B2
        for <linux-media@vger.kernel.org>; Mon,  6 Nov 2023 00:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699259172; x=1730795172;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=y1sXv8FEpOEqKNoA1ktiG2wBA6XkiyrOh6DoNUZDSxo=;
  b=M13Cn1OgrBY6W7NBbM4Fvv7X1Zl3J/hpjMLKJsKxhtggAlpbBNf6Lt2k
   7tpKXFSW6J2WhKpPJ+Bu+gRfzr80LiKygOH0ErTECLem5fVbYAaGBjHDc
   4OXByADANSHvH3emlHUXFfwZbQEDHg8bY7jmbUZhmoAI9V7xlIvMCjIMw
   Db2tiKvRWBK7hXyxQn+SQOABjShKYaNgz2iOPMOLsvwZ1ymCrGLI9dOdJ
   y/+nNrrXvFcw3OkNWTrRkiPrktqwQBRshndGuB4yFp15IOGh7/PccYNkM
   vKRaHMXHwN7f13G/8Jn88bC8luD/i0zJI281FfidWmJckm4Sc7z4mcIaZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="2213871"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="2213871"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 00:26:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="762254757"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="762254757"
Received: from icg-kernel3.bj.intel.com ([172.16.126.174])
  by orsmga002.jf.intel.com with ESMTP; 06 Nov 2023 00:26:10 -0800
From:   bingbu.cao@intel.com
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com
Cc:     hdegoede@redhat.com, bingbu.cao@intel.com,
        bingbu.cao@linux.intel.com
Subject: [PATCH 0/4] Enable sensor's runtime PM before registering async sub-dev
Date:   Mon,  6 Nov 2023 16:35:12 +0800
Message-ID: <20231106083516.763184-1-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Bingbu Cao <bingbu.cao@intel.com>

Following Sakari's patch:
<URL:https://lore.kernel.org/linux-media/20231102090752.1418132-1-sakari.ailus@linux.intel.com/>

The sensor device maybe accessible right after its async sub-device is
registered, so runtime PM should be ready before its async sub-device
is registered.


Bingbu Cao (4):
  media: imx355: Enable runtime PM before registering async sub-device
  media: ov01a10: Enable runtime PM before registering async sub-device
  media: ov13b10: Enable runtime PM before registering async sub-device
  media: ov9734: Enable runtime PM before registering async sub-device

 drivers/media/i2c/imx355.c  | 13 ++++++++-----
 drivers/media/i2c/ov01a10.c |  7 +++++--
 drivers/media/i2c/ov13b10.c | 14 +++++++++-----
 drivers/media/i2c/ov9734.c  | 19 +++++++++++--------
 4 files changed, 33 insertions(+), 20 deletions(-)

-- 
2.42.0

