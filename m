Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B41684772E9
	for <lists+linux-media@lfdr.de>; Thu, 16 Dec 2021 14:15:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237418AbhLPNPW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Dec 2021 08:15:22 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:37502 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237400AbhLPNPV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Dec 2021 08:15:21 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 01AE93F6;
        Thu, 16 Dec 2021 14:15:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1639660520;
        bh=XPL6EcAkwbnT89SWuummKAmn3vt5ETtemGGca+1hwQU=;
        h=From:To:Cc:Subject:Date:From;
        b=lIGua1YoAXZhG6HU9rRsvtG2N6ljQ1OoWJskdAIQTU2HKRSZ2oBqD6pdgQU18pat8
         g2GBsPYkroclOiAXZplGTjRjKIEQRY6RFfAdfJM80dIT7Yj8XVC9+vmJtL9KevXbGT
         CE31bOlhivF2w5ZBTUq/s8gLBQxrDUNja0pi8m28=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 0/2] v4l: Proposed improvements for muxed streams v10
Date:   Thu, 16 Dec 2021 15:15:08 +0200
Message-Id: <20211216131510.12308-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This small patch series applies on top of Tomi's multiplexed streams v10
series ("[PATCH v10 00/38] v4l: subdev internal routing and streams",
available from [1]). It contains a small fix in 1/2 and a proposed
improvement in 2/2. Please see individual patches for details.

Jacopo, patch 2/2 may be helpful for your MAX9286 work. If it isn't, I
can try to improve it :-)

[1] https://lore.kernel.org/all/20211130141536.891878-1-tomi.valkeinen@ideasonboard.com/


Laurent Pinchart (2):
  media: subdev: Rename v4l2_state_get_stream_format() with subdev
    prefix
  media: subdev: Extend routing validation helper

 drivers/media/v4l2-core/v4l2-subdev.c | 111 ++++++++++++++++++++++----
 include/media/v4l2-subdev.h           |  47 ++++++++---
 2 files changed, 132 insertions(+), 26 deletions(-)

-- 
Regards,

Laurent Pinchart

