Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF1286CBED1
	for <lists+linux-media@lfdr.de>; Tue, 28 Mar 2023 14:16:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230330AbjC1MQb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Mar 2023 08:16:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229848AbjC1MQa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Mar 2023 08:16:30 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0E971AC
        for <linux-media@vger.kernel.org>; Tue, 28 Mar 2023 05:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680005789; x=1711541789;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uDwjJrCvO+6Zjh99xbq/ggjfBo+IvRFhdNHNJuDdWFc=;
  b=LJHF3LSXlpmJmu7T7laUS9NKBMQQ8hYlHbX0XUTpgVIUqI3yDEl6iOTS
   eox0i9Y5mDpHCCZxO4vp6w2NQtmJwImTeR+oaFCy6if5eafy63/c6oy3U
   Ac5oSLpaJud7DWAcGu/YzsBIm1EraHw6uCnd99AA8u0FB8pxy8ecsa5P1
   1tBwAMNVrWvbSC/TJ/ORq5eAhV4Jhk9ro1y4Qq7Hc3/xyDJIoN2jrQaeW
   wP6M/MQKZYQHN864Oy4ItLVZLI1Qmw/VTrMPCztdKAf9MsiWT+kPYutfd
   navvzQ0K6O7IV4KQnnPe/rnb8QIrPVCPkEaE+696aKy18YYmNpHjgQFr9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="426812955"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="426812955"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 05:16:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="773133434"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="773133434"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 05:16:28 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id B861411F937;
        Tue, 28 Mar 2023 15:16:25 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     jacopo.mondi@ideasonboard.com
Subject: [PATCH 0/2] Align CCS driver behaviour regarding flipping and rotation
Date:   Tue, 28 Mar 2023 15:16:23 +0300
Message-Id: <20230328121625.1472037-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

This set aligns the behaviour of flipping controls with other drivers and
adds CAMERA_SENSOR_ROTATION and CAMERA_SENSOR_ORIENTATION controls to the
CCS driver.

The changes to flipping are that the flipping controls are no longer
inverted if the sensor is mounted upside down. The flipping control still
default enabled if the sensor is so mounted.

Sakari Ailus (2):
  media: ccs: Align flipping behaviour with other drivers
  media: ccs: Add V4L2 controls from properties

 drivers/media/i2c/ccs/ccs-core.c | 56 ++++++++------------------------
 drivers/media/i2c/ccs/ccs.h      | 14 --------
 2 files changed, 13 insertions(+), 57 deletions(-)

-- 
2.30.2

