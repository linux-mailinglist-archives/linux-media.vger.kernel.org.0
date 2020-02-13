Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1A9215BC04
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2020 10:49:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729655AbgBMJtg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Feb 2020 04:49:36 -0500
Received: from retiisi.org.uk ([95.216.213.190]:59662 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726232AbgBMJtg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Feb 2020 04:49:36 -0500
Received: from lanttu.localdomain (unknown [IPv6:2a01:4f9:c010:4572::e1:1001])
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTP id 0E763634C89
        for <linux-media@vger.kernel.org>; Thu, 13 Feb 2020 11:49:18 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 0/7] smiapp, omap3isp: Cleanups and fixes
Date:   Thu, 13 Feb 2020 11:49:27 +0200
Message-Id: <20200213094934.18595-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

This set contains a small fix for the omap3isp crashing the system, as
well as cleanups for the smiapp driver.

Sakari Ailus (7):
  omap3isp: Prevent enabling CCDC when stopping streaming
  smiapp: Simplify condition for choosing 8-bit access
  smiapp: Use unaligned get and put functions
  smiapp: Turn limit lookup into a function
  smiapp: Move SMIA limit reading up
  smiapp: Refactor reading SMIA limits
  smiapp: Move definitions under driver directory

 drivers/media/i2c/smiapp/smiapp-core.c    | 259 +++++++++++-----------
 drivers/media/i2c/smiapp/smiapp-reg.h     |   4 +
 drivers/media/i2c/smiapp/smiapp-regs.c    |  71 ++----
 drivers/media/i2c/smiapp/smiapp.h         |  44 +++-
 drivers/media/platform/omap3isp/ispccdc.c |   4 +
 include/media/i2c/smiapp.h                |  63 ------
 6 files changed, 200 insertions(+), 245 deletions(-)
 delete mode 100644 include/media/i2c/smiapp.h

-- 
2.20.1

