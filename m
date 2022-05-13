Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB388526396
	for <lists+linux-media@lfdr.de>; Fri, 13 May 2022 16:16:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245219AbiEMOQA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 May 2022 10:16:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343542AbiEMOP7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 May 2022 10:15:59 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAA9D87234
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 07:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652451357; x=1683987357;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=g+ult+zNx39H8c9qTbQbdmPczkMeinfKHv2MfKPjnzM=;
  b=DPf/im1v/+NHa9yXc1o65oxfBm8NaxN0uY2OsDmuEti93DG5WvZQZlxc
   fHi6fOfp0bVHInclWXOaq5T19OUkjjpyakPyXEY8BSWCLhY3DOidPEcZ2
   ra1Gizub/H3Lpn2I9wjiJn+FEzPBtRea1OwP1l2bZbPeKsCqZ0dGUBqCa
   OT/r4rXREAtqEbqHbym6POIpzJrwZBkHHeN/4FfxDlwDHe/de0LfZyOWP
   pXAvTS9y6PLpsvh/VQ2OpMsoZ08nH/NgtjMRi0mwMj89a091Rv8BHZZEs
   CJ6bqGFovo64ABPV6dcc1LZ+Idr355JGTpQnGBp+jq6ZouM/1Zc5mXW7w
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10345"; a="333348104"
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; 
   d="scan'208";a="333348104"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2022 07:15:56 -0700
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; 
   d="scan'208";a="740169526"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2022 07:15:51 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 6AECD20FA1;
        Fri, 13 May 2022 17:15:49 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1npW56-0001fZ-PE; Fri, 13 May 2022 17:15:48 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        laurent.pinchart@ideasonboard.com, hverkuil-cisco@xs4all.nl,
        mirela.rabulea@nxp.com, xavier.roumegue@oss.nxp.com,
        tomi.valkeinen@ideasonboard.com, hugues.fruchet@st.com,
        prabhakar.mahadev-lad.rj@bp.renesas.com, aford173@gmail.com,
        festevam@gmail.com, Eugen.Hristev@microchip.com,
        jbrunet@baylibre.com, paul.elder@ideasonboard.com,
        eddy.khan@vergesense.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v7 00/28] media: ov5640: Rework the clock tree programming for MIPI
Date:   Fri, 13 May 2022 17:15:20 +0300
Message-Id: <20220513141548.6344-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi folks,

Reworked the internals a little so that no compile warnings are produced
for intermediate patches. In the past we've allowed them but now with
warnings considered as errors, this is a problem.

The end result is unchanged. Still testing for compilation.

I'm still sending this all to list as several patches got changed:

	media: ov5640: Associate bpp with formats
	media: ov5640: Rework CSI-2 clock tree
	media: ov5640: Split DVP and CSI-2 formats

Hugues Fruchet (1):
  media: ov5640: Adjust vblank with s_frame_interval

Jacopo Mondi (27):
  media: ov5640: Add pixel rate to modes
  media: ov5640: Re-arrange modes definition
  media: ov5640: Add ov5640_is_csi2() function
  media: ov5640: Associate bpp with formats
  media: ov5640: Add LINK_FREQ control
  media: ov5640: Update pixel_rate and link_freq
  media: ov5640: Rework CSI-2 clock tree
  media: ov5640: Rework timings programming
  media: ov5640: Fix 720x480 in RGB888 mode
  media: ov5640: Split DVP and CSI-2 timings
  media: ov5640: Provide timings accessor
  media: ov5640: Re-sort per-mode register tables
  media: ov5640: Remove duplicated mode settings
  media: ov5640: Remove ov5640_mode_init_data
  media: ov5640: Add HBLANK control
  media: ov5640: Add VBLANK control
  media: ov5640: Remove frame rate check from find_mode()
  media: ov5640: Change CSI-2 timings to comply with FPS
  media: ov5640: Implement init_cfg
  media: ov5640: Implement get_selection
  media: ov5640: Register device properties
  media: ov5640: Add RGB565_1X16 format
  media: ov5640: Add BGR888 format
  media: ov5640: Restrict sizes to mbus code
  media: ov5640: Adjust format to bpp in s_fmt
  media: ov5640: Split DVP and CSI-2 formats
  media: ov5640: Move format mux config in format

 drivers/media/i2c/ov5640.c | 1650 ++++++++++++++++++++++++++----------
 1 file changed, 1188 insertions(+), 462 deletions(-)

-- 
2.30.2

