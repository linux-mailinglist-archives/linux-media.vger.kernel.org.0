Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2F2C44783
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2019 19:00:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731725AbfFMRAK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jun 2019 13:00:10 -0400
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:43618 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729788AbfFMAEx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 20:04:53 -0400
X-Halon-ID: c29646bf-8d6e-11e9-8601-0050569116f7
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [89.233.230.99])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id c29646bf-8d6e-11e9-8601-0050569116f7;
        Thu, 13 Jun 2019 02:04:12 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 0/3] rcar-vin: Add support for RGB formats with alpha component
Date:   Thu, 13 Jun 2019 02:04:36 +0200
Message-Id: <20190613000439.28746-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

This small series adds support for two new pixel formats for the
rcar-vin driver; V4L2_PIX_FMT_ARGB555 and V4L2_PIX_FMT_ABGR32. Both
formats have an alpha component so a new standard control is also added
to control its value, V4L2_CID_ALPHA_COMPONENT.

The series is based on the latest media-tree and is tested on both
Renesas Gen2 and Gen3 hardware without any regressions found.

Patch 1/3 fixes a badly named register name, 2/3 adds the new control
and finally 3/3 adds the two new pixel formats.

Niklas Söderlund (3):
  rcar-vin: Rename VNDMR_DTMD_ARGB1555 to VNDMR_DTMD_ARGB
  rcar-vin: Add control for alpha component
  rcar-vin: Add support for RGB formats with alpha component

 drivers/media/platform/rcar-vin/rcar-core.c | 53 ++++++++++++++++++++-
 drivers/media/platform/rcar-vin/rcar-dma.c  | 39 ++++++++++++++-
 drivers/media/platform/rcar-vin/rcar-v4l2.c |  8 ++++
 drivers/media/platform/rcar-vin/rcar-vin.h  |  5 ++
 4 files changed, 101 insertions(+), 4 deletions(-)

-- 
2.21.0

