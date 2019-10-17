Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 303E0DAB17
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2019 13:22:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405868AbfJQLWR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Oct 2019 07:22:17 -0400
Received: from retiisi.org.uk ([95.216.213.190]:39722 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728143AbfJQLWR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Oct 2019 07:22:17 -0400
Received: from lanttu.localdomain (unknown [IPv6:2a01:4f9:c010:4572::e1:1002])
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTP id B8926634C87
        for <linux-media@vger.kernel.org>; Thu, 17 Oct 2019 14:21:46 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 0/7] smiapp binning limit cleanups, runtime PM fix and a omap3isp fix
Date:   Thu, 17 Oct 2019 14:18:49 +0300
Message-Id: <20191017111856.10270-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi folks,

This set cleans up binning limit handling and fixes runtime PM use by
enabling runtime PM *before* any functionality requiring runtime PM may be
used.

Also a small omap3isp fix is included.

Sakari Ailus (7):
  smiapp: Don't get binning limits dynamically
  smiapp: Move binning configuration to streaming start
  smiapp: Don't update sensor configuration during power-on init
  smiapp: Use non-binned and binned limits correctly
  smiapp: Register sensor after enabling runtime PM on the device
  smiapp: Rename update_mode as pll_blanking_update
  omap3isp: Ignore failure of stopping streaming on external subdev

 drivers/media/i2c/smiapp/smiapp-core.c | 157 +++++++++----------------
 drivers/media/platform/omap3isp/isp.c  |   8 +-
 2 files changed, 57 insertions(+), 108 deletions(-)

-- 
2.20.1

