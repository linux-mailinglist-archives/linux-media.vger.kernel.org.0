Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 366F06E2415
	for <lists+linux-media@lfdr.de>; Fri, 14 Apr 2023 15:15:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbjDNNPP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Apr 2023 09:15:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbjDNNPN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Apr 2023 09:15:13 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B7B23A9C
        for <linux-media@vger.kernel.org>; Fri, 14 Apr 2023 06:15:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1EF1C6342E
        for <linux-media@vger.kernel.org>; Fri, 14 Apr 2023 13:15:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 213D4C433D2;
        Fri, 14 Apr 2023 13:15:10 +0000 (UTC)
Message-ID: <42150ee3-2d20-ce71-2184-d859bb364656@xs4all.nl>
Date:   Fri, 14 Apr 2023 15:15:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Luca Ceresoli <luca.ceresoli@bootlin.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.4] tegra-video: add Tegra20 parallel video input
 capture
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit f100ce3bbd6aa0093075b20b9dbd006686f6aedf:

  media: verisilicon: Fix crash when probing encoder (2023-04-13 12:58:55 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.4p

for you to fetch changes up to a806bf593f08d04d1f17466380156fd894bb58a2:

  staging: media: tegra-video: add support for Tegra20 parallel input (2023-04-14 13:38:30 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Luca Ceresoli (20):
      dt-bindings: display: tegra: add Tegra20 VIP
      dt-bindings: display: tegra: vi: add 'vip' property and example
      staging: media: tegra-video: improve documentation of tegra_video_format fields
      staging: media: tegra-video: document tegra_channel_get_remote_source_subdev
      staging: media: tegra-video: fix typos in comment
      staging: media: tegra-video: improve error messages
      staging: media: tegra-video: slightly simplify cleanup on errors
      staging: media: tegra-video: move private struct declaration to C file
      staging: media: tegra-video: move tegra210_csi_soc to C file
      staging: media: tegra-video: remove unneeded include
      staging: media: tegra-video: Kconfig: allow TPG only on Tegra210
      staging: media: tegra-video: move tegra_channel_fmt_align to a per-soc op
      staging: media: tegra-video: move default format to soc-specific data
      staging: media: tegra-video: move MIPI calibration calls from VI to CSI
      staging: media: tegra-video: add a per-soc enable/disable op
      staging: media: tegra-video: move syncpt init/free to a per-soc op
      staging: media: tegra-video: add syncpts for Tegra20 to struct tegra_vi
      staging: media: tegra-video: add hooks for planar YUV and H/V flip
      staging: media: tegra-video: add H/V flip controls
      staging: media: tegra-video: add support for Tegra20 parallel input

 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml  |  59 ++++
 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml |  41 +++
 MAINTAINERS                                                             |   3 +
 drivers/staging/media/tegra-video/Kconfig                               |   1 +
 drivers/staging/media/tegra-video/Makefile                              |   2 +
 drivers/staging/media/tegra-video/csi.c                                 |  48 +++
 drivers/staging/media/tegra-video/csi.h                                 |   4 -
 drivers/staging/media/tegra-video/tegra20.c                             | 661 ++++++++++++++++++++++++++++++++++++
 drivers/staging/media/tegra-video/tegra210.c                            |  90 +++++
 drivers/staging/media/tegra-video/vi.c                                  | 222 ++++--------
 drivers/staging/media/tegra-video/vi.h                                  |  71 ++--
 drivers/staging/media/tegra-video/video.c                               |   5 +
 drivers/staging/media/tegra-video/video.h                               |   2 +-
 drivers/staging/media/tegra-video/vip.c                                 | 290 ++++++++++++++++
 drivers/staging/media/tegra-video/vip.h                                 |  68 ++++
 15 files changed, 1380 insertions(+), 187 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
 create mode 100644 drivers/staging/media/tegra-video/tegra20.c
 create mode 100644 drivers/staging/media/tegra-video/vip.c
 create mode 100644 drivers/staging/media/tegra-video/vip.h
