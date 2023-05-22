Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E395B70BB1D
	for <lists+linux-media@lfdr.de>; Mon, 22 May 2023 13:07:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233117AbjEVLHR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 May 2023 07:07:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230284AbjEVLGu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 May 2023 07:06:50 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3902119
        for <linux-media@vger.kernel.org>; Mon, 22 May 2023 04:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684753301; x=1716289301;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=RrQxbUgOMGPy68YiIMOxktzxB5O+Zb0VCT9gHKW9oyA=;
  b=G16yh99LKsLhoxjMuaU4vBqqgy8cePfz5Fwya6MUhB43KjMCRpw0ehRh
   sTDcsUC4n2BLXF/FIldNioGYWwPbmEWMxf3BfkYJJ2GEI32vB5t/LNvHl
   GEC7bQaEhg9Tdrkykm542vwob5ECohK35tQlyRD/csBrnCmj+2+ZNLS/b
   OIgjp2/QqqMxMKIQ8BjyuUr9StNPHJGtXXg1C6vyT9q2pmPfRsp4BlxvD
   g8kAtIKXywBq8JTroGjNCmHvNogxaEvXH6WsXnAoKWb4ObxZbiBrtrVyq
   EWpRkmO6h0JzRBiSnkSPhEeD0o5jM0yN3qG2WXpJJ5DmMJ7JjLzhSLlfJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="350399367"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; 
   d="scan'208";a="350399367"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2023 04:00:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="773294055"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; 
   d="scan'208";a="773294055"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2023 04:00:23 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 7F5C8120BF9;
        Mon, 22 May 2023 13:53:13 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1q139r-003Xmf-A5; Mon, 22 May 2023 13:52:55 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, tomi.valkeinen@ideasonboard.com
Subject: [PATCH v2 1/1] media: v4l2-subdev: Fix missing kerneldoc for client_caps
Date:   Mon, 22 May 2023 13:52:45 +0300
Message-Id: <20230522105245.844804-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
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

From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Add missing kernel doc for the new 'client_caps' field in struct
v4l2_subdev_fh.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Fixes: f57fa2959244 ("media: v4l2-subdev: Add new ioctl for client capabilities")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
since v1:

- Put the macro name in quotes. This should also fix the Sphinx warning
  about the asterisk (this construction exists elsewhere in the docs).

 include/media/v4l2-subdev.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index cfd19e72d0fc4..b325df0d54d61 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1119,6 +1119,7 @@ struct v4l2_subdev {
  * @vfh: pointer to &struct v4l2_fh
  * @state: pointer to &struct v4l2_subdev_state
  * @owner: module pointer to the owner of this file handle
+ * @client_caps: bitmask of ``V4L2_SUBDEV_CLIENT_CAP_*``
  */
 struct v4l2_subdev_fh {
 	struct v4l2_fh vfh;
-- 
2.30.2

