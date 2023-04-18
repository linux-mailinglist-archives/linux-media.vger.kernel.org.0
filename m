Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1F2F6E5B2A
	for <lists+linux-media@lfdr.de>; Tue, 18 Apr 2023 10:01:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231344AbjDRIBK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Apr 2023 04:01:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbjDRIBH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Apr 2023 04:01:07 -0400
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7780DE44;
        Tue, 18 Apr 2023 01:01:03 -0700 (PDT)
Received: from booty.fritz.box (unknown [77.244.183.192])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPA id 85AB9240016;
        Tue, 18 Apr 2023 08:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1681804861;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=FPc004ho3DbyaVsoAMTPnWHcNE8iprzXyi2Ka/IlwGw=;
        b=DmUcfJUt7AMAnjEok9ujkF88igE1mt8VixuLyvX+M43xMVM5jgIsZK4PI5ntwA4xyQMotw
        2kZaZF6JGA1k8CdA18DkvuoZX5lCzM4v5cA3YamEz0UAIEXRas28R2NzetV9QYKmsKxn+Z
        704UBAXoaFtfKIQ9Lmdc3fv/hRDTxcmDrRGntc2QvAZAUMabkY6uC99CUz0u1pzLNdbNEh
        un3kBHKQEJ2aVsD7SRvvUCQOCzz9/ea+kgxeh0XmpIzusCqw+fAUzEAHOmvWvfL7yIhBh4
        H2fYuAiSiBU2NOmonCnu81F7iLAXeJfHG/alYyb89KCb5Fpf6l8oRMu3leNcKQ==
From:   Luca Ceresoli <luca.ceresoli@bootlin.com>
To:     linux-tegra@vger.kernel.org
Cc:     Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-staging@lists.linux.dev,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Richard Leitner <richard.leitner@skidata.com>
Subject: [PATCH v6 00/20] Add Tegra20 parallel video input capture
Date:   Tue, 18 Apr 2023 10:00:34 +0200
Message-Id: <20230418080054.452955-1-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

New in v6: a oneliner fix to patch 14 for an unlock imbalance in MIPI CSI
calibration (Tegra210 only). Many thanks to Hans for testing and spotting
this!

Full details follow.

Tegra20 and other Tegra SoCs have a video input (VI) peripheral that can
receive from either MIPI CSI-2 or parallel video (called respectively "CSI"
and "VIP" in the documentation). The kernel currently has a staging driver
for Tegra210 CSI capture. This patch set adds support for Tegra20 VIP
capture.

Unfortunately I had no real documentation available to base this work on.
I only had a working downstream 3.1 kernel, so I started with the driver
found there and heavily reworked it to fit into the mainline tegra-video
driver structure. The existing code appears written with the intent of
being modular and allow adding new input mechanisms and new SoCs while
keeping a unique VI core module. However its modularity and extensibility
was not enough to add Tegra20 VIP support, so I added some hooks to turn
hard-coded behaviour into per-SoC or per-bus customizable code. There are
also a fix, some generic cleanups and DT bindings.

Quick tour of the patches:

 * Device tree bindings

   01. dt-bindings: display: tegra: add Tegra20 VIP
   02. dt-bindings: display: tegra: vi: add 'vip' property and example

 * Minor improvements to logging, comments, cleanups

   03. staging: media: tegra-video: improve documentation of tegra_video_format fields
   04. staging: media: tegra-video: document tegra_channel_get_remote_source_subdev
   05. staging: media: tegra-video: fix typos in comment
   06. staging: media: tegra-video: improve error messages
   07. staging: media: tegra-video: slightly simplify cleanup on errors
   08. staging: media: tegra-video: move private struct declaration to C file
   09. staging: media: tegra-video: move tegra210_csi_soc to C file
   10. staging: media: tegra-video: remove unneeded include

 * Preparation to make the VI module generic enough to host Tegra20 and VIP

   11. staging: media: tegra-video: Kconfig: allow TPG only on Tegra210
   12. staging: media: tegra-video: move tegra_channel_fmt_align to a per-soc op
   13. staging: media: tegra-video: move default format to soc-specific data
   14. staging: media: tegra-video: move MIPI calibration calls from VI to CSI
   15. staging: media: tegra-video: add a per-soc enable/disable op
   16. staging: media: tegra-video: move syncpt init/free to a per-soc op
   17. staging: media: tegra-video: add syncpts for Tegra20 to struct tegra_vi
   18. staging: media: tegra-video: add hooks for planar YUV and H/V flip
   19. staging: media: tegra-video: add H/V flip controls

 * Implementation of VIP and Tegra20

   20. staging: media: tegra-video: add support for Tegra20 parallel input

Enjoy!

Changed in v5:
 - patch 14: fixed unlock imbalance on Tegra210 in MIPI CSI calibration

Changed in v5:
- removed patch 3 as requested by Hans Verkuil; now the driver is kept
  video-node-centric and the enum_format logic is unchanged
- rebased on top of that
- trivial fixes (typos)

Changed in RESEND,v4:
- add Rob's review tag on patch 2

Changed in v4:
- fixed the leftovers after the removal of 'channel@0' in DT
- added review tags by Dimtry

Changed in v3:
- removed the 'channel@0' node from the device tree representation of vip
- squashed the last two patches (VIP + T20) into one
- small cleanups
- rebase on v6.2-rc1

Changed in v2:
- improved dt-bindings patches based on reviews
- removed patches 3 and 4 adding DT labels without a mainline user
- two small fixes to the last patch

[v5] https://lore.kernel.org/linux-tegra/20230407133852.2850145-1-luca.ceresoli@bootlin.com/
[v4,resend] https://lore.kernel.org/linux-tegra/20230309144320.2937553-1-luca.ceresoli@bootlin.com/
[v4] https://lore.kernel.org/linux-tegra/20230130141603.323221-1-luca.ceresoli@bootlin.com/
[v3] https://lore.kernel.org/linux-media/20221229133205.981397-1-luca.ceresoli@bootlin.com/
[v2] https://lore.kernel.org/linux-tegra/20221222100328.6e341874@booty/T/#t
[v1] https://lore.kernel.org/linux-tegra/20221124155634.5bc2a423@booty/T/#t

Luca

Luca Ceresoli (20):
  dt-bindings: display: tegra: add Tegra20 VIP
  dt-bindings: display: tegra: vi: add 'vip' property and example
  staging: media: tegra-video: improve documentation of
    tegra_video_format fields
  staging: media: tegra-video: document
    tegra_channel_get_remote_source_subdev
  staging: media: tegra-video: fix typos in comment
  staging: media: tegra-video: improve error messages
  staging: media: tegra-video: slightly simplify cleanup on errors
  staging: media: tegra-video: move private struct declaration to C file
  staging: media: tegra-video: move tegra210_csi_soc to C file
  staging: media: tegra-video: remove unneeded include
  staging: media: tegra-video: Kconfig: allow TPG only on Tegra210
  staging: media: tegra-video: move tegra_channel_fmt_align to a per-soc
    op
  staging: media: tegra-video: move default format to soc-specific data
  staging: media: tegra-video: move MIPI calibration calls from VI to
    CSI
  staging: media: tegra-video: add a per-soc enable/disable op
  staging: media: tegra-video: move syncpt init/free to a per-soc op
  staging: media: tegra-video: add syncpts for Tegra20 to struct
    tegra_vi
  staging: media: tegra-video: add hooks for planar YUV and H/V flip
  staging: media: tegra-video: add H/V flip controls
  staging: media: tegra-video: add support for Tegra20 parallel input

 .../display/tegra/nvidia,tegra20-vi.yaml      |  59 ++
 .../display/tegra/nvidia,tegra20-vip.yaml     |  41 ++
 MAINTAINERS                                   |   3 +
 drivers/staging/media/tegra-video/Kconfig     |   1 +
 drivers/staging/media/tegra-video/Makefile    |   2 +
 drivers/staging/media/tegra-video/csi.c       |  48 ++
 drivers/staging/media/tegra-video/csi.h       |   4 -
 drivers/staging/media/tegra-video/tegra20.c   | 661 ++++++++++++++++++
 drivers/staging/media/tegra-video/tegra210.c  |  90 +++
 drivers/staging/media/tegra-video/vi.c        | 222 ++----
 drivers/staging/media/tegra-video/vi.h        |  71 +-
 drivers/staging/media/tegra-video/video.c     |   5 +
 drivers/staging/media/tegra-video/video.h     |   2 +-
 drivers/staging/media/tegra-video/vip.c       | 290 ++++++++
 drivers/staging/media/tegra-video/vip.h       |  68 ++
 15 files changed, 1380 insertions(+), 187 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
 create mode 100644 drivers/staging/media/tegra-video/tegra20.c
 create mode 100644 drivers/staging/media/tegra-video/vip.c
 create mode 100644 drivers/staging/media/tegra-video/vip.h

-- 
2.34.1

