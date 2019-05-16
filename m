Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3155A1FD5A
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2019 03:49:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727357AbfEPBq1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 May 2019 21:46:27 -0400
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:44033 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726347AbfEPAs0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 May 2019 20:48:26 -0400
X-Halon-ID: 4ae1d50c-7774-11e9-8ab4-005056917a89
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [89.233.230.99])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id 4ae1d50c-7774-11e9-8ab4-005056917a89;
        Thu, 16 May 2019 02:48:24 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/3] rcar-vin: Add support for RGB formats with alpha component
Date:   Thu, 16 May 2019 02:47:43 +0200
Message-Id: <20190516004746.3794-1-niklas.soderlund+renesas@ragnatech.se>
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

