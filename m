Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A72F53B2015
	for <lists+linux-media@lfdr.de>; Wed, 23 Jun 2021 20:13:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229907AbhFWSP0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Jun 2021 14:15:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229774AbhFWSPZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Jun 2021 14:15:25 -0400
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.eu [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E4D4C061574
        for <linux-media@vger.kernel.org>; Wed, 23 Jun 2021 11:13:07 -0700 (PDT)
Received: from lanttu.localdomain (unknown [192.168.2.193])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id B07CE634C87;
        Wed, 23 Jun 2021 21:12:50 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Michael Tretter <m.tretter@pengutronix.de>,
        Marek Vasut <marex@denx.de>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        laurent.pinchart@ideasonboard.com
Subject: [PATCH 0/3] Explicit CSI-2 LP-11 / LP-111 support
Date:   Wed, 23 Jun 2021 21:12:59 +0300
Message-Id: <20210623181302.14660-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

Some receiver devices requires explicit support for transitioning
transmitters to LP-11 or LP-111 state before starting streaming. As
there's currently a single operation (s_stream()) callback to do that,
there's no way for the receiver driver to differentiate between the two
things.

This set adds two more callbacks, pre_streamon and post_streamon, to do
exactly that. The usage on CSI-2 is to set the transmitter state to LP-11
or LP-111 (depending on the PHY) and thus allow reliable receiver
initialisation.

The set also adds support for this in the CCS driver.

Sakari Ailus (3):
  Documentation: v4l: Rework LP-11 documentation, add callbacks
  v4l: subdev: Add pre_streamon and post_streamoff callbacks
  ccs: Implement support for manual LP control

 Documentation/driver-api/media/tx-rx.rst | 40 ++++++++++++++-------
 drivers/media/i2c/ccs/ccs-core.c         | 45 ++++++++++++++++++++++++
 include/media/v4l2-subdev.h              | 25 +++++++++++++
 3 files changed, 98 insertions(+), 12 deletions(-)

-- 
2.30.2

