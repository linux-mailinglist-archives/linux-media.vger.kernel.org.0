Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F8086F8A66
	for <lists+linux-media@lfdr.de>; Fri,  5 May 2023 22:51:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233375AbjEEUvJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 May 2023 16:51:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233344AbjEEUvH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 May 2023 16:51:07 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1B292723
        for <linux-media@vger.kernel.org>; Fri,  5 May 2023 13:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683319866; x=1714855866;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4azhz/u+cVEA+10wj28LPwU3QoEIIyiJfTIgEQzwD9U=;
  b=Kj9iMv6UEANb7DeAH1fv/1wdH+ttGO525Xhjm0tLn1tMtswhA7zVt7U2
   UVk0dM5rNAS2tCVrdnaOBVqs43tFbA2EfrLZahMK91LqBZ5uBCaHSlpEg
   MgmZIIhA/Bk8wgBKnOJ4/nGFFdYhZ89WWuS77WHyM3bmYSH0Mj3aTILsu
   cqvom5k21tVLkk/HSLtGy33RWIdUEpnck6M4ayrAecKQLOS+wWrPFvbFE
   A+g48nXv7qhA2LSquJUAh1XGaKdANKdl0hUE+Rr2J5JqURuOjqfBRy487
   sipV9bhrL6CacWxjKsG+5lnGatH77eAzRa12LKKm30ygqKszafBOiq+pG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="352346063"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="352346063"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 13:51:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="762602654"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="762602654"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 13:51:04 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id BEE661205F8;
        Fri,  5 May 2023 23:51:01 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@intel.com
Subject: [PATCH 0/3] Random cleanups
Date:   Fri,  5 May 2023 23:50:58 +0300
Message-Id: <20230505205101.54569-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

These three patches are seemingly random cleanups but are a pre-requisite
for another set for supporting generic metadata formats. I'll post that
set separately. These three should be merged independently though..

Sakari Ailus (3):
  media: mc: Make media_get_pad_index() use pad type flag
  media: Documentation: Rename meta format files
  media: uapi: Use unsigned int values for assigning bits in u32 fields

 .../userspace-api/media/v4l/meta-formats.rst  | 14 +++----
 ...{pixfmt-meta-d4xx.rst => metafmt-d4xx.rst} |  0
 ...-intel-ipu3.rst => metafmt-intel-ipu3.rst} |  0
 ...fmt-meta-rkisp1.rst => metafmt-rkisp1.rst} |  0
 .../{pixfmt-meta-uvc.rst => metafmt-uvc.rst}  |  0
 ...ixfmt-meta-vivid.rst => metafmt-vivid.rst} |  0
 ...meta-vsp1-hgo.rst => metafmt-vsp1-hgo.rst} |  0
 ...meta-vsp1-hgt.rst => metafmt-vsp1-hgt.rst} |  0
 MAINTAINERS                                   |  4 +-
 drivers/media/dvb-core/dvbdev.c               |  4 +-
 drivers/media/mc/mc-entity.c                  | 16 +++-----
 drivers/media/usb/au0828/au0828-core.c        |  2 +-
 drivers/media/v4l2-core/v4l2-mc.c             | 38 ++++++++++++-------
 include/media/media-entity.h                  |  4 +-
 include/uapi/linux/media.h                    | 28 +++++++-------
 15 files changed, 58 insertions(+), 52 deletions(-)
 rename Documentation/userspace-api/media/v4l/{pixfmt-meta-d4xx.rst => metafmt-d4xx.rst} (100%)
 rename Documentation/userspace-api/media/v4l/{pixfmt-meta-intel-ipu3.rst => metafmt-intel-ipu3.rst} (100%)
 rename Documentation/userspace-api/media/v4l/{pixfmt-meta-rkisp1.rst => metafmt-rkisp1.rst} (100%)
 rename Documentation/userspace-api/media/v4l/{pixfmt-meta-uvc.rst => metafmt-uvc.rst} (100%)
 rename Documentation/userspace-api/media/v4l/{pixfmt-meta-vivid.rst => metafmt-vivid.rst} (100%)
 rename Documentation/userspace-api/media/v4l/{pixfmt-meta-vsp1-hgo.rst => metafmt-vsp1-hgo.rst} (100%)
 rename Documentation/userspace-api/media/v4l/{pixfmt-meta-vsp1-hgt.rst => metafmt-vsp1-hgt.rst} (100%)

-- 
2.30.2

