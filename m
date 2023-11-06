Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEC027E215A
	for <lists+linux-media@lfdr.de>; Mon,  6 Nov 2023 13:26:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231705AbjKFM0D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Nov 2023 07:26:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231701AbjKFM0A (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Nov 2023 07:26:00 -0500
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A225C136
        for <linux-media@vger.kernel.org>; Mon,  6 Nov 2023 04:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699273557; x=1730809557;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=U0kPXLUFWjINvab94UyZ/EQJc8/lRJANylD3wwexS+o=;
  b=ejo6AMRoTPRHRH39MKCEf6JLXbOvxLefmcc406JvnDlscevwfM/wCOMg
   l1Y+euSxQkczOwnI8mZwWMK4RQOtGcDzNBE/OW5zDSKFiY/OBkjg9JQ6H
   cIOCtYsM3bSZOa575ZDBcxfSmzQc5POWCLjp9nHjjeSoB0lhe2DAbabYl
   lMspCIdGk7HxTSY4L/xTt9SiGeCqKi2cSyaZfl72tKx9oX3b0a4YoI/ny
   qEUZij0+QXyLu2QkAKCKxmXLaA3LK489wuLgkOxTlYOICiS0J6IObtgaH
   Q8inWPcPIsKfD4UZsgxT1kPStAQZjDyT1Mh00/TpTv7GBpQX2LRCAMEMS
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="455747240"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="455747240"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 04:25:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="797291586"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="797291586"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 04:25:53 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 9C1CC11FBBC;
        Mon,  6 Nov 2023 14:25:50 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>,
        Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v7 07/31] media: Documentation: Additional streams generally don't harm capture
Date:   Mon,  6 Nov 2023 14:25:15 +0200
Message-Id: <20231106122539.1268265-8-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231106122539.1268265-1-sakari.ailus@linux.intel.com>
References: <20231106122539.1268265-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Having extra streams on the source end of the link that cannot be captured
by the sink sub-device generally are not an issue, at least not on CSI-2
bus. Still document that there may be hardware specific limitations. For
example on parallel bus this might not work on all cases.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 Documentation/userspace-api/media/v4l/dev-subdev.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
index f375b820ab68..a387e8a15b8d 100644
--- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
+++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
@@ -529,9 +529,9 @@ the its sink pad and allows to route them individually to one of its source
 pads.
 
 Subdevice drivers that support multiplexed streams are compatible with
-non-multiplexed subdev drivers, but, of course, require a routing configuration
-where the link between those two types of drivers contains only a single
-stream.
+non-multiplexed subdev drivers. However, if the driver at the sink end of a link
+does not support streams, then only the stream 0 on source end may be
+captured. There may be additional hardware specific limitations.
 
 Understanding streams
 ^^^^^^^^^^^^^^^^^^^^^
-- 
2.39.2

