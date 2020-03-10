Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF274180308
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 17:18:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726721AbgCJQS4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 12:18:56 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:55434 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726395AbgCJQS4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 12:18:56 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3C7545F;
        Tue, 10 Mar 2020 17:18:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1583857135;
        bh=fePKGosU14KuA7REcsKemo15glDg+r20PTBBnNny/F0=;
        h=From:To:Cc:Subject:Date:From;
        b=IgVaYsF0lvLtul/fY+6sWjZG2S1J/UN0dW36a6u9tK/zTR7C/pTJRrShIWgghDqNe
         eJVXH7o8Npiau6yPQgLlFeSNip/U9s4YmgGV/l+vHHQumev75g1XqQNxVYTQQa0Agm
         zM4yNQ10agA+nbdp0pJft9TAS1LpdRHtL5xKhKBA=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH 0/8] media: imx: Miscalleanous format-related cleanups
Date:   Tue, 10 Mar 2020 18:18:37 +0200
Message-Id: <20200310161845.1588-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This patch series started as an attempt to fix the format get and set
subdev operations on the i.MX7 CSI-2 receiver subdev, which it does in
patch 1/8. Patch 2/8 further cleans up the format-related code in that
subdev.

Patches 3/8 to 8/8 pushes the cleanups further as I was attempting to
fix the format enumeration on the video node at the end of the pipeline.
I realized as part of that effort that there's more work than I
anticipated, and I'm currently evaluating the possible options.
Nonetheless, I think the cleanups make sense even without what I wanted
to build on top of them, so I'm sending them out already.

Laurent Pinchart (8):
  media: imx: imx7-mipi-csis: Cleanup and fix subdev pad format handling
  media: imx: imx7-mipi-csis: Centralize initialization of pad formats
  media: imx: utils: Inline init_mbus_colorimetry() in its caller
  media: imx: utils: Handle Bayer format lookup through a selection flag
  media: imx: utils: Simplify IPU format lookup and enumeration
  media: imx: utils: Make imx_media_pixfmt handle variable number of
    codes
  media: imx: utils: Remove unneeded argument to (find|enum)_format()
  media: imx: utils: Rename format lookup and enumeration functions

 drivers/staging/media/imx/imx-ic-prp.c        |   8 +-
 drivers/staging/media/imx/imx-ic-prpencvf.c   |   6 +-
 drivers/staging/media/imx/imx-media-capture.c |  22 +-
 .../staging/media/imx/imx-media-csc-scaler.c  |   2 +-
 drivers/staging/media/imx/imx-media-csi.c     |  26 +-
 drivers/staging/media/imx/imx-media-utils.c   | 313 ++++++++----------
 drivers/staging/media/imx/imx-media-vdic.c    |   6 +-
 drivers/staging/media/imx/imx-media.h         |  24 +-
 drivers/staging/media/imx/imx7-media-csi.c    |  15 +-
 drivers/staging/media/imx/imx7-mipi-csis.c    | 138 ++++----
 10 files changed, 271 insertions(+), 289 deletions(-)

-- 
Regards,

Laurent Pinchart

