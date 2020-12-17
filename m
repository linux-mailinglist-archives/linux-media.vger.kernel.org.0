Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93E132DD5D6
	for <lists+linux-media@lfdr.de>; Thu, 17 Dec 2020 18:15:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728996AbgLQROo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Dec 2020 12:14:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728181AbgLQROo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Dec 2020 12:14:44 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25978C061794;
        Thu, 17 Dec 2020 09:14:04 -0800 (PST)
Received: from localhost.localdomain (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3FBBF2CF;
        Thu, 17 Dec 2020 18:14:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1608225240;
        bh=MrwRt4kfpi4TX9WZ7dHGkA3NpvNMf5xyN01jQsfWTvA=;
        h=From:To:Cc:Subject:Date:From;
        b=jZdkhsXAXsZ3ffEC5L+6EIjk6LYCWDr0L54Hlc7XL9r6ukhiL3TOT1FxvnQC59NJ3
         BhhFo06WQe7y0xGYNmm40s4ua/YT+cNcXEqU9Q1UuWWFEPPpyx5l9HjaOIYe/ahxu+
         9vv3jKxVMacAXtKEzRZbM1S/qhTUdyvzCZ0RhHvE=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH 0/2] media: vsp1: V3U VSP-X/VSP-D Support
Date:   Thu, 17 Dec 2020 17:13:47 +0000
Message-Id: <20201217171349.1030753-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A couple of patches to discuss the enablement of the VSP on the V3U
(r8a779a0) platform.

The VSPX patch is purely RFC, howeverc the VSPD patch may be enough to
support that component on the new platform.

As yet, these patches are untested while I await hardware to arrive -
but they're potentially worth discussing already.


Kieran Bingham (2):
  media: vsp1: Add support for the V3U VSPD
  [RFC]: media: vsp1: Add support for the V3U VSPX

 drivers/media/platform/vsp1/vsp1.h      |  2 ++
 drivers/media/platform/vsp1/vsp1_drv.c  | 18 ++++++++++++++++++
 drivers/media/platform/vsp1/vsp1_regs.h |  5 +++++
 3 files changed, 25 insertions(+)

-- 
2.25.1

