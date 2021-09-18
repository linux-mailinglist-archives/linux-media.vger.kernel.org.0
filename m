Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A559241073B
	for <lists+linux-media@lfdr.de>; Sat, 18 Sep 2021 17:04:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239149AbhIRPGJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Sep 2021 11:06:09 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:46401 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231336AbhIRPGI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Sep 2021 11:06:08 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 3B15D4000B;
        Sat, 18 Sep 2021 15:04:41 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     tomi.valkeinen@ideasonboard.com, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se,
        kieran.bingham@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Thomas NIZAN <tnizan@witekio.com>, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/5] media: Add multiplexed support to R-Car and GMSL
Date:   Sat, 18 Sep 2021 17:05:02 +0200
Message-Id: <20210918150507.987294-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,
  this series is based on Tomi's "v4l: subdev internal routing and streams":
https://patchwork.linuxtv.org/project/linux-media/list/?series=6197

With a few out-of-tree patches for GMSL support on top. The full tree for
testing is available at:
https://git.sr.ht/~jmondi_/linux/log/multistream/tomba-v8/gmsl

The series aims to
1) Plumb into Tomi's v4l2 subdev streams and routing to compare it with the
   previous implementations of multistream support
2) Add support for multiplexed streams to R-Car VIN, CSI-2 and MAX9286

First of all, I found the multistream support as implemented by Tomi very nice
to work with. I have expressed my views on the subdev state handling in the
review of his series, but routing handling is nice to work with! kudos!

The GMSL and R-Car implementation which results from this is -almost- working.
Capturing with 4 cameras works (at least no regressions) but capturing a single
VC on any instance of VIN results in the usual 'green frame of despair'. Clearly
there's something to fix in the capture chain, but the plumbing into the new API
should be sane. Before debugging in detail the capture chain I would like the
plumbing to be validated.

For testing, I have re-proposed Niklas' patches on top of v4l2-ctl to control
routing and ported them to this last version. Support for state-based format
handling has been added on top. Two simple scripts to be deployed in vin-test
have been used to set routing and capture frames. Both are available at:
https://git.sr.ht/~jmondi_/v4l2-utils
https://git.sr.ht/~jmondi_/vin-test-multi

Thanks
   j

Jacopo Mondi (5):
  media: max9286: Implement multiplexed support
  media: max9286: Apply routing configuration
  media: max9286: Implement routing validation
  media: rcar-csi2: Implement multiplexed support
  media: rcar-vin: Support multiplexed CSI-2 receiver

 drivers/media/i2c/max9286.c                 | 452 ++++++++++++++------
 drivers/media/platform/rcar-vin/rcar-csi2.c | 289 ++++++++++---
 drivers/media/platform/rcar-vin/rcar-dma.c  |   3 +-
 3 files changed, 551 insertions(+), 193 deletions(-)

--
2.32.0

