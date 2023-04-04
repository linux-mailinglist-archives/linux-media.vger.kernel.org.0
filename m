Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B67A6D6D3B
	for <lists+linux-media@lfdr.de>; Tue,  4 Apr 2023 21:33:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236087AbjDDTdU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Apr 2023 15:33:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236048AbjDDTdQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Apr 2023 15:33:16 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A45F468F
        for <linux-media@vger.kernel.org>; Tue,  4 Apr 2023 12:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680636795; x=1712172795;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tuh2U1V60gLfcIqfEnMvA+rLklUo7l0V/ArXG6BYHY8=;
  b=Iv0arGGSAUV8RtL7YvwaZoTdqy6aopT5Id61CErTachmZmxiS1ISgOPL
   r9aU9Rnd9DCCkJwLWQwg5iFcFCmPf/0jzryDdgW567jIVc8BPJZEWIwza
   SDKDPdpv6Ft8HaNVKHwKis7yxcfI5YYu/XOC28xvTwdhHSzQI6fzTI2l6
   om7R+gdCSvzwFJfFsWODyj6JDD3iOBG41z5aumM/l4gxlzBT54ckm4SP9
   WUGPK6ggg4yuJBwaoPoIq34/nBark6EPnateOsgkKkU+sAKIJYDKtvmg8
   Qz/1BkCekPMHkOD3sAyou+0cv3PhsD2Q0bDbRwerfhC5g6WLNO/lA9pJD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="370104300"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; 
   d="scan'208";a="370104300"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2023 12:33:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="689009508"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; 
   d="scan'208";a="689009508"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2023 12:33:12 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 1BA0B121399;
        Tue,  4 Apr 2023 22:23:47 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     jacopo.mondi@ideasonboard.com
Subject: [PATCH v2 0/2] Align CCS driver behaviour regarding flipping and rotation
Date:   Tue,  4 Apr 2023 22:23:45 +0300
Message-Id: <20230404192347.1798323-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
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

since v1:

- Default is always no flip. Rotation isn't enabled in current DTS, and
  this is a better option going forward.

Sakari Ailus (2):
  media: ccs: Align flipping behaviour with other drivers
  media: ccs: Add V4L2 controls from properties

 drivers/media/i2c/ccs/ccs-core.c | 52 +++++++-------------------------
 drivers/media/i2c/ccs/ccs.h      | 14 ---------
 2 files changed, 11 insertions(+), 55 deletions(-)

-- 
2.30.2

