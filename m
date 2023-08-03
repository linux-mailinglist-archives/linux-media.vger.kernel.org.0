Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2D0476EE1A
	for <lists+linux-media@lfdr.de>; Thu,  3 Aug 2023 17:28:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235000AbjHCP2N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Aug 2023 11:28:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237134AbjHCP16 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Aug 2023 11:27:58 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3CE8E69
        for <linux-media@vger.kernel.org>; Thu,  3 Aug 2023 08:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691076477; x=1722612477;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ncxvzd3ro6XwEOYJyJ7eLCBTYtFifxjwo+/mJCcOoN0=;
  b=Kad/c2Q+FAuaNQpEWKffIFtz3RbPT7itOrmVSma2v+1cFoNcZ6ZitNDs
   8/9q7U4jQWJT2+YWJaSTaPwIaXQfZvSjy4bCEzPiZ/GFRgDSV3Qfl/59c
   fPhQ6FpKebPyCJuUVuvg2i9IkK0oexzR0zgM7RDeb98Vv5XnCUEervTVR
   Rgq9TM97KoYtCKih4UTDO05iInCHq59MbYuJvnJDGrFekdhc0QrjYTVSJ
   +wn6nwq8k9Mj65cCyTAKudk0u6vu0SKG8rw45VWzPT+bt1SjF9szS0s7T
   f87QElmYh/DMHMS6/H87BX0drOWXSfJv7u6NBexs2t39fV0bwQMwuZg/P
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="359961962"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; 
   d="scan'208";a="359961962"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 08:27:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="872973328"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 08:27:03 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 182B61204CF;
        Thu,  3 Aug 2023 18:26:58 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qRaE1-006rrF-2w;
        Thu, 03 Aug 2023 18:26:53 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl
Subject: [PATCH v2 1/1] media: i2c: ccs: Check rules is non-NULL
Date:   Thu,  3 Aug 2023 18:26:43 +0300
Message-Id: <20230803152643.1636981-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix the following smatch warning:

drivers/media/i2c/ccs/ccs-data.c:524 ccs_data_parse_rules() warn: address
of NULL pointer 'rules'

The CCS static data rule parser does not check an if rule has been
obtained before checking for other rule types (which depend on the if
rule). In practice this means parsing invalid CCS static data could lead
to dereferencing a NULL pointer.

Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
Fixes: a6b396f410b1 ("media: ccs: Add CCS static data parser library")
Cc: stable@vger.kernel.org # for 5.11 and up
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
I'm still running tests on this, but expect it to be good. The smatch
warning is gone now.

since v1:

- Explicitly check for non-NULL rules in referencing rules.

 drivers/media/i2c/ccs/ccs-data.c | 101 +++++++++++++++++--------------
 1 file changed, 56 insertions(+), 45 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-data.c b/drivers/media/i2c/ccs/ccs-data.c
index 45f2b2f55ec5..08400edf77ce 100644
--- a/drivers/media/i2c/ccs/ccs-data.c
+++ b/drivers/media/i2c/ccs/ccs-data.c
@@ -464,8 +464,7 @@ static int ccs_data_parse_rules(struct bin_container *bin,
 		rule_payload = __rule_type + 1;
 		rule_plen2 = rule_plen - sizeof(*__rule_type);
 
-		switch (*__rule_type) {
-		case CCS_DATA_BLOCK_RULE_ID_IF: {
+		if (*__rule_type == CCS_DATA_BLOCK_RULE_ID_IF) {
 			const struct __ccs_data_block_rule_if *__if_rules =
 				rule_payload;
 			const size_t __num_if_rules =
@@ -514,49 +513,61 @@ static int ccs_data_parse_rules(struct bin_container *bin,
 				rules->if_rules = if_rule;
 				rules->num_if_rules = __num_if_rules;
 			}
-			break;
-		}
-		case CCS_DATA_BLOCK_RULE_ID_READ_ONLY_REGS:
-			rval = ccs_data_parse_reg_rules(bin, &rules->read_only_regs,
-							&rules->num_read_only_regs,
-							rule_payload,
-							rule_payload + rule_plen2,
-							dev);
-			if (rval)
-				return rval;
-			break;
-		case CCS_DATA_BLOCK_RULE_ID_FFD:
-			rval = ccs_data_parse_ffd(bin, &rules->frame_format,
-						  rule_payload,
-						  rule_payload + rule_plen2,
-						  dev);
-			if (rval)
-				return rval;
-			break;
-		case CCS_DATA_BLOCK_RULE_ID_MSR:
-			rval = ccs_data_parse_reg_rules(bin,
-							&rules->manufacturer_regs,
-							&rules->num_manufacturer_regs,
-							rule_payload,
-							rule_payload + rule_plen2,
-							dev);
-			if (rval)
-				return rval;
-			break;
-		case CCS_DATA_BLOCK_RULE_ID_PDAF_READOUT:
-			rval = ccs_data_parse_pdaf_readout(bin,
-							   &rules->pdaf_readout,
-							   rule_payload,
-							   rule_payload + rule_plen2,
-							   dev);
-			if (rval)
-				return rval;
-			break;
-		default:
-			dev_dbg(dev,
-				"Don't know how to handle rule type %u!\n",
-				*__rule_type);
-			return -EINVAL;
+		} else {
+			/* Check there was an if rule before any other rules */
+			if (bin->base && !rules)
+				return -EINVAL;
+
+			switch (*__rule_type) {
+			case CCS_DATA_BLOCK_RULE_ID_READ_ONLY_REGS:
+				rval = ccs_data_parse_reg_rules(bin,
+								rules ?
+								&rules->read_only_regs : NULL,
+								rules ?
+								&rules->num_read_only_regs : NULL,
+								rule_payload,
+								rule_payload + rule_plen2,
+								dev);
+				if (rval)
+					return rval;
+				break;
+			case CCS_DATA_BLOCK_RULE_ID_FFD:
+				rval = ccs_data_parse_ffd(bin, rules ?
+							  &rules->frame_format : NULL,
+							  rule_payload,
+							  rule_payload + rule_plen2,
+							  dev);
+				if (rval)
+					return rval;
+				break;
+			case CCS_DATA_BLOCK_RULE_ID_MSR:
+				rval = ccs_data_parse_reg_rules(bin,
+								rules ?
+								&rules->manufacturer_regs : NULL,
+								rules ?
+								&rules->num_manufacturer_regs : NULL,
+								rule_payload,
+								rule_payload + rule_plen2,
+								dev);
+				if (rval)
+					return rval;
+				break;
+			case CCS_DATA_BLOCK_RULE_ID_PDAF_READOUT:
+				rval = ccs_data_parse_pdaf_readout(bin,
+								   rules ?
+								   &rules->pdaf_readout : NULL,
+								   rule_payload,
+								   rule_payload + rule_plen2,
+								   dev);
+				if (rval)
+					return rval;
+				break;
+			default:
+				dev_dbg(dev,
+					"Don't know how to handle rule type %u!\n",
+					*__rule_type);
+				return -EINVAL;
+			}
 		}
 		__next_rule = __next_rule + rule_hlen + rule_plen;
 	}
-- 
2.39.2

