Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D9117D6678
	for <lists+linux-media@lfdr.de>; Wed, 25 Oct 2023 11:15:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234006AbjJYJPm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Oct 2023 05:15:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233907AbjJYJPl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Oct 2023 05:15:41 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC529138
        for <linux-media@vger.kernel.org>; Wed, 25 Oct 2023 02:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698225338; x=1729761338;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wykcehr329CJ+WO6jECF08o0mpd856zxWyvPKio6N2M=;
  b=HW2iIrCpumCMGE0Afda6ZX3E7iUTRg1vV9W3bF6dGW9GUWfHoAC0PhHR
   kg243VsGvUZZvPmU7iqU34tEb2XMp+hD0ZfkQpqq8HUFWtco0L7bKro0p
   X/spRjqcBV50PPTqgfkKq48QX/nRcjPyzLNXOM6xCOqlZxsvAA70ODbRs
   VisL6AlwcJjnQzB56p79AaAN5fQlI7TZYIMxMdJVWTuZiuIBad57CHvdV
   v/7be45ZHRNThEdkAstKShFny382N3VDEhztAqYG2K7ciadgPHjZgI4/2
   /mrXWpErOkwT/EMIFS8RLDj48EQkIGy8Z51Dt3Iyvhna3NfEOq6XBQXiA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="384480072"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="384480072"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 02:15:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="788063655"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="788063655"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 02:15:36 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 2CDB311F89D;
        Wed, 25 Oct 2023 12:15:33 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        dave.stevenson@raspberrypi.com, kieran.bingham@ideasonboard.com
Subject: [PATCH v3 0/2] Parallel and BT.656 documentation fixes
Date:   Wed, 25 Oct 2023 12:15:29 +0300
Message-Id: <20231025091531.893366-1-sakari.ailus@linux.intel.com>
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

since v2:

- Better separate parallel and BT.656 buses in documentation.

- Drop the link-frequencies patch from this set.

- Don't call "high speed" mode a state.

since v1:

- Fix reference.

Sakari Ailus (2):
  media: Documentation: BT.601 is not a bus
  media: Documentation: LP-11 and LP-111 are states, not modes

 .../driver-api/media/camera-sensor.rst        |  4 ++--
 Documentation/driver-api/media/tx-rx.rst      | 21 ++++++++++---------
 2 files changed, 13 insertions(+), 12 deletions(-)

-- 
2.39.2

