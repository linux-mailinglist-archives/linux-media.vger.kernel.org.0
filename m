Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F02BD1BBA
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2019 00:27:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731763AbfJIW1n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Oct 2019 18:27:43 -0400
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:61238 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731134AbfJIW1n (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Oct 2019 18:27:43 -0400
X-Halon-ID: d7d78308-eae3-11e9-837a-0050569116f7
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [84.172.88.101])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id d7d78308-eae3-11e9-837a-0050569116f7;
        Thu, 10 Oct 2019 00:26:35 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 0/2] rcar-vin: Support V4L2_FIELD_SEQ_{TB,BT}
Date:   Thu, 10 Oct 2019 00:27:32 +0200
Message-Id: <20191009222734.1911060-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

This series add support for sequential filed formats to rcar-vin. The
series is based on the media-tree and tested on both R-Car Gen2 and Gen3 
boards without regressions.

Patch 1/2 prepares for the new filed formats by reworking and renaming
an existing struct member while 2/2 adds support for the two new field
formats.

Niklas Söderlund (2):
  rcar-vin: Move hardware buffer tracking to own struct
  rcar-vin: Add support for V4L2_FIELD_SEQ_{TB,BT}

 drivers/media/platform/rcar-vin/rcar-dma.c  | 80 ++++++++++++++++-----
 drivers/media/platform/rcar-vin/rcar-v4l2.c |  7 +-
 drivers/media/platform/rcar-vin/rcar-vin.h  | 28 ++++++--
 3 files changed, 91 insertions(+), 24 deletions(-)

-- 
2.23.0

