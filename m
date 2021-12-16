Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B133C477AE1
	for <lists+linux-media@lfdr.de>; Thu, 16 Dec 2021 18:47:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240403AbhLPRrF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Dec 2021 12:47:05 -0500
Received: from relay11.mail.gandi.net ([217.70.178.231]:39989 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240406AbhLPRrE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Dec 2021 12:47:04 -0500
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 8CC54100007;
        Thu, 16 Dec 2021 17:47:00 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     tomi.valkeinen@ideasonboard.com, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se,
        kieran.bingham@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 0/6] media: max9286: Add multiplexed streams support
Date:   Thu, 16 Dec 2021 18:47:40 +0100
Message-Id: <20211216174746.147233-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,
   this series breaks out from the larger
[PATCH v2 00/13] media: Add multiplexed support to R-Car CSI-2 and GMSL

and isolated changes to the max9286 driver to support multiplexed
streams.

Rebased on Tomi's v10 and tested on Eagle V3M with the following branch
https://git.sr.ht/~jmondi_/linux #multistream/tomba-v10/gmsl

Laurent has just sent me comments on the previous version which I didn't take
into account here as I wanted to first break the previous series down to
smaller chunks which can be easily digested.

I'll review Laurent's patches and possibly rebase on top of them, or if Tomi
beats me to that with a v11 I'll rebase on top of his work.

Thanks
   j

Jacopo Mondi (6):
  media: max9286: Add support for v4l2_subdev_state
  media: max9286: Implement set_routing
  media: max9286: Use enabled routes to calculate pixelrate
  media: max9286: Use routes to configure link order
  media: max9286: Move format to subdev state
  media: max9286: Implement get_frame_desc()

 drivers/media/i2c/max9286.c | 455 +++++++++++++++++++++++++-----------
 1 file changed, 324 insertions(+), 131 deletions(-)

--
2.33.1

