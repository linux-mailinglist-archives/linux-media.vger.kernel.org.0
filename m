Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4010E28D159
	for <lists+linux-media@lfdr.de>; Tue, 13 Oct 2020 17:36:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730623AbgJMPgh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Oct 2020 11:36:37 -0400
Received: from retiisi.eu ([95.216.213.190]:54594 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726749AbgJMPgg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Oct 2020 11:36:36 -0400
Received: from lanttu.localdomain (unknown [IPv6:2a01:4f9:c010:4572::e1:1002])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id DF7B9634C87;
        Tue, 13 Oct 2020 18:35:25 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com
Subject: [PATCH 0/2] Link frequency helper for receivers
Date:   Tue, 13 Oct 2020 18:36:31 +0300
Message-Id: <20201013153633.31022-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi folks,

Here's a small helper for getting the link frequency from the transmitter
drivers. Besides being easy to use, it allows receiver drivers to work
with old sensor drivers implementing just V4L2_CID_PIXEL_RATE control but
not V4L2_CID_LINK_FREQ control. Using V4L2_CID_PIXEL_RATE is supported on
parallel and CSI-2 D-PHY busses.

Sakari Ailus (2):
  v4l: Add a helper for obtaining the link frequency
  ipu3-cio2: Use v4l2_get_link_freq helper

 drivers/media/pci/intel/ipu3/ipu3-cio2.c | 33 +++++++++---------------
 drivers/media/v4l2-core/v4l2-common.c    | 33 ++++++++++++++++++++++++
 include/media/v4l2-common.h              | 21 +++++++++++++++
 3 files changed, 66 insertions(+), 21 deletions(-)

-- 
2.27.0

