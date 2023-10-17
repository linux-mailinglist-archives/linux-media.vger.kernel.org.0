Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABE097CC11E
	for <lists+linux-media@lfdr.de>; Tue, 17 Oct 2023 12:54:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343748AbjJQKy1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Oct 2023 06:54:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234909AbjJQKy0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Oct 2023 06:54:26 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC2F8A2
        for <linux-media@vger.kernel.org>; Tue, 17 Oct 2023 03:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697540064; x=1729076064;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JxaEjlcnMVDGM5UQWoJpG68wrM3vjBsnUga1Pxwd1OY=;
  b=kATsHhW5zKB/qapQgdJFOWI40TAUWN44n2LaxAoqJPRwOui9yEi0Q/om
   Nyvbo5gEncnCNnKKAPcEOD/+/M7Eb//O0EKVT3AbZ7U09nRKBVZeMd+NW
   CdgfeK/ZbJm8FvAa/P51uLWZjsiiVYFJwhTxnhWgnldKMHEmSsoQb3Xu7
   51/HiWEpWTAGAcCqsRUfMbQhOGFMbtOW5qetzWG1sg2Djg6QgUgB06LWt
   RA0g770SEmZ7jPa0TFXWZ2NQpceKbo9zSV4NrVOmPvy+70yv1Vodiu4gE
   yTa3FHyY9qCzwUSXLSCxXTraraN6K1N0VC3AYztTlUPcl9gBXkVkbGH5v
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="449973934"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="449973934"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 03:54:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="929749714"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="929749714"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 03:54:22 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id A7F2811F89D;
        Tue, 17 Oct 2023 13:54:19 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        dave.stevenson@raspberrypi.com, kieran.bingham@ideasonboard.com
Subject: [PATCH 0/3] Document link-frequencies better, small fixes
Date:   Tue, 17 Oct 2023 13:54:16 +0300
Message-Id: <20231017105419.557486-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi folks,

Here are a few small documentation improvements.

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

