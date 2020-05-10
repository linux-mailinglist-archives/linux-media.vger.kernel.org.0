Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA6F21CCE8D
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 00:31:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729106AbgEJWbN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 May 2020 18:31:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729022AbgEJWbN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 May 2020 18:31:13 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B87D9C061A0C
        for <linux-media@vger.kernel.org>; Sun, 10 May 2020 15:31:12 -0700 (PDT)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E9BF7304;
        Mon, 11 May 2020 00:31:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1589149869;
        bh=j/ePAMygMzKHjH+X1o5blZwL3i7ve1s6LKl8RRRF0mY=;
        h=From:To:Cc:Subject:Date:From;
        b=j77ITH4YL2HVrb1nt7ilCYp4g3qG9VIJOHhuSNvvvd327/1iGRRr4iN7hQeF0rDPd
         M1eonQOiPK4bzY7DmFRbVrSoHvj2nFS5yriTvOc9dV549vBsV1BWXyZHUY3gw8zGgo
         V52BAdNoF91C3UoVTf9PXsfHkh+50eWt8fdiUP0Q=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-imx@nxp.com, kernel@pengutronix.de,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 0/2] media: imx-pxp: Fix operation on i.MX7
Date:   Mon, 11 May 2020 01:30:58 +0300
Message-Id: <20200510223100.11641-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The i.MX7 includes a PXP that is an evolution from the i.MX6 version. It
offers more processing block in its pipeline, and by default operates in
legacy mode for i.MX6 compatibility.

To enable the extra processing blocks, the i.MX7 PXP has two extra
registers to configure routing in the internal pipeline. The values
currently programmed in these registers don't match the blocks enabled
by the driver, which makes the PXP hang without producing any frame.

This patch series fixes the issue. Patch 1/2 fixes the routing
configuration, and patch 2/2 disables unused blocks and configures
routing accordingly. The first patch is enough to use the PXP on i.MX7,
but the second patch may offer additional power saving.

The patches have been tested on an i.MX7D. Philipp, would you be able to
give them a try on i.MX6 ?

Laurent Pinchart (2):
  media: imx-pxp: Fix routing configuration for i.MX7
  media: imx-pxp: Disable LUT and Rotation 0 blocks

 drivers/media/platform/imx-pxp.c | 37 ++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 16 deletions(-)

-- 
Regards,

Laurent Pinchart

