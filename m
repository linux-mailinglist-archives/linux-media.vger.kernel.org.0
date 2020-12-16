Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D87582DBD70
	for <lists+linux-media@lfdr.de>; Wed, 16 Dec 2020 10:22:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726181AbgLPJVs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Dec 2020 04:21:48 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:38903 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725889AbgLPJVr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Dec 2020 04:21:47 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id pSzWkOdl7ynrEpSzZkpXGv; Wed, 16 Dec 2020 10:21:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1608110465; bh=HWfojDwHEqgKNZDwGw2tSV1QWtimo1CnLwU5zBT/3Q4=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=uqPVk4OCAvkxIRzGxEyfHyGKxB5226Rkmf8Xf2/7s6IfiNHNvEiFKACxIKHLzcloe
         ZvBMfMxxQRgNwvQgccloj1PpupKCU73iBazRPZiAiqecRy4wWveGE1I0AwBG/vGhp+
         01neJC9RDYGSkAT4WND5fAvXJ9bstlNGQkQyZEBmc/9BZSReH9Zr1OHnqu45y8TDdE
         G/gzIPmUzJ1pArwOyqwaSrWQRXDaudmTtA0bfbGavkfaj6/8LyZ9amUwuqvlaaVPJF
         Hz/NZC+HS8p2LsOuw4g4QbIgEn4pF7P+aWzy8hKa9iqwTen0+Ay1vp7EH3AdvTgT1x
         HSbVPHilAxQaw==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Sowjanya Komatineni <skomatineni@nvidia.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.12] tegra-video: Add support for capturing from
 HDMI-to-CSI bridge
Message-ID: <c05885cd-1c29-6dde-de3f-38c8a76a851e@xs4all.nl>
Date:   Wed, 16 Dec 2020 10:21:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfI3EpAoHSqQ+V8wqAgtBth6v3+IWWloXgWLm83jqlq4EKMMifLNlasRBdkMtL7zWUlsPSz/JA7MVpHno5yT7B/BSqzIP9AvLpOkrB9kqN4RDuBREdIr5
 SXdHL0quPoYZKRnEjLsCLQZkNJF+GiySOtBFKR3vSKNiHLBtWSvAjHgD3TaiJ3Ztm8CtVL4ExBI17mhaPXV3X2Xf7BFfzjMj++baxw8OsPS+iGHJystGEs+F
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tested with imx219, imx274 and tc358840.

Note that with my ZHAW-HDMI2CSI tc358840 board I still get syncpt timeouts,
but I suspect that might be related to device tree issues.

This series is in good shape and having this in staging it will simplify
further testing.

Regards,

	Hans

The following changes since commit fab0fca1da5cdc48be051715cd9787df04fdce3a:

  Merge tag 'media/v5.11-1' of git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media (2020-12-14 11:47:37 -0800)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.12b

for you to fetch changes up to 169d1e71723b1dc08b0abff79d8c77bec451cce2:

  media: tegra-video: Add custom V4L2 control V4L2_CID_TEGRA_SYNCPT_TIMEOUT_RETRY (2020-12-16 10:07:37 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Sowjanya Komatineni (13):
      media: tegra-video: Use zero crop settings if subdev has no get_selection
      media: tegra-video: Enable VI pixel transform for YUV and RGB formats
      media: tegra-video: Fix V4L2 pixel format RGB and YUV
      media: tegra-video: Add support for V4L2_PIX_FMT_NV16
      media: tegra-video: Add DV timing support
      media: tegra-video: Add support for EDID ioctl ops
      media: tegra-video: Add support for VIDIOC_LOG_STATUS ioctl
      media: tegra-video: Add support for V4L2_EVENT_SOURCE_CHANGE
      media: tegra-video: Implement V4L2 device notify callback
      media: v4l2-fwnode: Update V4L2_FWNODE_CSI2_MAX_DATA_LANES to 8
      dt-bindings: tegra: Update csi data-lanes to maximum 8 lanes
      media: tegra-video: Add support for x8 captures with gang ports
      media: tegra-video: Add custom V4L2 control V4L2_CID_TEGRA_SYNCPT_TIMEOUT_RETRY

 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt |   4 +-
 drivers/staging/media/tegra-video/csi.c                                   |  35 ++++-
 drivers/staging/media/tegra-video/csi.h                                   |  14 +-
 drivers/staging/media/tegra-video/tegra210.c                              | 340 +++++++++++++++++++++++++++++-------------
 drivers/staging/media/tegra-video/vi.c                                    | 338 ++++++++++++++++++++++++++++++++++++-----
 drivers/staging/media/tegra-video/vi.h                                    |  23 ++-
 drivers/staging/media/tegra-video/video.c                                 |  18 +++
 include/media/v4l2-fwnode.h                                               |   2 +-
 8 files changed, 614 insertions(+), 160 deletions(-)
