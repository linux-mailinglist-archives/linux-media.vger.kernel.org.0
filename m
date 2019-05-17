Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAFF02204C
	for <lists+linux-media@lfdr.de>; Sat, 18 May 2019 00:31:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729184AbfEQWbu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 May 2019 18:31:50 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54374 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727133AbfEQWbt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 May 2019 18:31:49 -0400
Received: from localhost.localdomain (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 93C662F3;
        Sat, 18 May 2019 00:31:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1558132307;
        bh=hrreR5uYRWGRqx1xcaMBEKSzGe5SPNniPH+7l05moZs=;
        h=From:To:Cc:Subject:Date:From;
        b=wLL0CDjSV5zlGtmCmdhx0gsq2nAtHTLeLiJ7TuMCBa5hajNudX6zKUHrI3NmPxzpM
         Emb/JIqvh/cX/b8S7wLsM27dLdwtUx5TikD5JE+JZiGY9nn8q/NCc9RsCQBZORwJpJ
         fj6F33WyiXOZF0/VqRxoPWhEmS6kk7svwleZOkl4=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [RFC PATCH 0/3] VSP1/DU atomic interface changes
Date:   Fri, 17 May 2019 23:31:40 +0100
Message-Id: <20190517223143.26251-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As part of the ongoing DU group refactoring it became apparent that we need to
split the configuration of the VSP to allow fine grain control of setting the
VSP1 mode configuration and enabling/disabling of the pipeline.

To split the mode configuration and the pipeline enablement, we add three new
calls:

 - vsp1_du_atomic_modeset()
 - vsp1_du_atomic_enable()
 - vsp1_du_atomic_disable()

To support the cross-component API, the new interface is added in [patch 1/3],
including an implementation of vsp1_du_setup_lif() to support the transition.

The DRM usage is adapted in [patch 2/3], before the call is removed entirely in
[patch 3/3]

Whilst these patches are independent and could be reviewed separately, they are
not expected to be integrated until the associated group rework is completed.

Kieran Bingham (3):
  media: vsp1: drm: Split vsp1_du_setup_lif()
  drm: rcar-du: Convert to the new VSP atomic API
  media: vsp1: drm: Remove vsp1_du_setup_lif()

 drivers/gpu/drm/rcar-du/rcar_du_crtc.c |   4 +-
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c  |  21 ++-
 drivers/gpu/drm/rcar-du/rcar_du_vsp.h  |   2 +
 drivers/media/platform/vsp1/vsp1_drm.c | 188 ++++++++++++++++---------
 include/media/vsp1.h                   |  26 ++--
 5 files changed, 159 insertions(+), 82 deletions(-)

-- 
2.20.1

