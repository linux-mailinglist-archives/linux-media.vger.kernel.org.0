Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0000A49204
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2019 23:09:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727974AbfFQVJy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jun 2019 17:09:54 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:41544 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725497AbfFQVJy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jun 2019 17:09:54 -0400
Received: from pendragon.bb.dnainternet.fi (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A2A582AF;
        Mon, 17 Jun 2019 23:09:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1560805791;
        bh=1+BVnWrtPGTLS4EM4DE3zdc1EvmF0Sx3rV2jUrvO0M4=;
        h=From:To:Cc:Subject:Date:From;
        b=l0jVk9jIauJCsEka5+5OgKGNSx5PAApQDOdqGmdxwkY2170dTaq95hoQWvReIT/++
         CEyXe9Pwm9RI7DQR0Q+Jax3x/L9NdLS5s1icnu+CYq5LBOyMOUZXSldFjVgotpROU7
         FQhx80OsYINrsPMmkphY1/+YJsuOTvyr9J9kkSxk=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v3 00/10] drm: rcar-du: Rework CRTC and groups for atomic commits
Date:   Tue, 18 Jun 2019 00:09:20 +0300
Message-Id: <20190617210930.6054-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello everybody,

This patch series refactors atomic commit tail handling in the R-Car DU
driver to simplify the code flow, and open the door to further
optimisations. It takes over Kieran's "[PATCH v2 0/6] drm: rcar-du:
Rework CRTC and groups for atomic commits" and "[RFC PATCH 0/3] VSP1/DU
atomic interface changes" series.

The R-Car DU is a bit of a strange beast, with support for up to four
CRTCs that share resources in groups of two CRTCs. Depending on the
generation, planes can be shared (on Gen 1 and Gen 2), and output
routing configuration is also handled at the group level to some extent.
Furthermore, many configuration parameters, especially those related to
routing or clock handling, require the whole group to be restarted to
take effect, even when the parameter itself affects a single CRTC only.

This hardware architecture is difficult to handle properly on the
software side, and has resulted in group usage being reference-counted
while CRTC usage only tracks the enabled state. Calls are then
unbalanced and difficult to trace, especially for the configuration of
output routing, and implementation of new shared resources is hindered.
This patch series aims at solving this problem.

The series starts with 4 patches that touch the API between the DU and
VSP drivers. It became apparent that we need to split the configuration
of the VSP to allow fine grain control of setting the mode configuration
and enabling/disabling of the pipeline. To support the cross-component
API, the new interface is added in patch 01/10, including an
implementation of vsp1_du_setup_lif() to support the transition. Patch
02/10 prepares for the new call flow that will call the atomic flush
handler before enabling the pipeline. The DRM usage is adapted in patch
03/10, before the call is removed entirely in patch 04/10.

The next two patches convert CRTC clock handling and initial setup,
potentially called from both the CRTC .atomic_begin() and
.atomic_enable() operations, to a simpler code flow controlled by the
commit tail handler. Patch 05/10 takes the CRTCs out of standby and put
them back in standby respectively at the beginning and end of the commit
tail handler, based on the CRTC atomic state instead of state
information stored in the custom rcar_du_crtc structure. Patch 06/10
then performs a similar change for the CRTC mode setting configuration.

Finally, the last four patches introduce a DRM private object for the
CRTC groups, along with an associated state. Patch 07/10 adds a helper
macro to easily iterate over CRTC groups, and patch 08/10 adds the group
private objects and empty states. Patches 09/10 and 10/10 respectively
move the group setup and routing configuration under control of the
commit tail handler, simplifying the configuration and moving state
information from driver structures to state structures.

More refactoring is expected, with plane assignment being moved to group
states, and group restart being optimised to avoid flickering. Better
configuration of pixel clocks could also be implemented on top of this
series.

The whole series has been tested on M3-N and D3 boards with the DU test
suite (http://git.ideasonboard.com/renesas/kms-tests.git). Additional
tests have been developed and bugs in existing tests fixed, with patches
being posted to the linux-renesas-soc@vger.kernel.org mailing list that
will be integrated in the near future. All individual commits have been
tested on M3-N, while only key points (after patch 04/10 and patch
10/10) have been tested on D3. No failure or change in behaviour has
been noticed.

Kieran Bingham (8):
  media: vsp1: drm: Split vsp1_du_setup_lif()
  drm: rcar-du: Convert to the new VSP atomic API
  media: vsp1: drm: Remove vsp1_du_setup_lif()
  drm: rcar-du: Handle CRTC standby from commit tail handler
  drm: rcar-du: Handle CRTC configuration from commit tail handler
  drm: rcar-du: Provide for_each_group helper
  drm: rcar-du: Create a group state object
  drm: rcar-du: Perform group setup from the atomic tail handler

Laurent Pinchart (2):
  media: vsp1: drm: Don't configure hardware when the pipeline is
    disabled
  drm: rcar-du: Centralise routing configuration in commit tail handler

 drivers/gpu/drm/rcar-du/rcar_du_crtc.c  | 168 ++++++-----
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h  |   9 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.h   |   6 +-
 drivers/gpu/drm/rcar-du/rcar_du_group.c | 377 +++++++++++++++++++-----
 drivers/gpu/drm/rcar-du/rcar_du_group.h |  44 ++-
 drivers/gpu/drm/rcar-du/rcar_du_kms.c   |  63 ++--
 drivers/gpu/drm/rcar-du/rcar_du_plane.c |  10 +-
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c   |  20 +-
 drivers/gpu/drm/rcar-du/rcar_du_vsp.h   |   2 +
 drivers/media/platform/vsp1/vsp1_drm.c  | 189 ++++++++----
 drivers/media/platform/vsp1/vsp1_drm.h  |   2 +
 include/media/vsp1.h                    |  26 +-
 12 files changed, 637 insertions(+), 279 deletions(-)

-- 
Regards,

Laurent Pinchart

