Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EB2923A9D1
	for <lists+linux-media@lfdr.de>; Mon,  3 Aug 2020 17:43:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727070AbgHCPmb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Aug 2020 11:42:31 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:5001 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725945AbgHCPma (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Aug 2020 11:42:30 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f2830360000>; Mon, 03 Aug 2020 08:41:42 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 03 Aug 2020 08:42:30 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 03 Aug 2020 08:42:30 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 3 Aug
 2020 15:42:30 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 3 Aug 2020 15:42:30 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.167.221]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f2830640002>; Mon, 03 Aug 2020 08:42:30 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <gregkh@linuxfoundation.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v8 00/10] Support for Tegra video capture from external sensor
Date:   Mon, 3 Aug 2020 08:42:16 -0700
Message-ID: <1596469346-937-1-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596469302; bh=jglfIh67PtDerQ6NqdFEm5b/PyUxY62VvKmJhWUJEoQ=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=JSRzDnFo1Y1u4eJgMFfGcvX201Ib7cqGkLtSKxRR5zWDKkXn+Y2MlASzMwMBtq/+T
         7Ko9+7YVAFpmqnZMov46/1nL1BggRrl43enqWgJWUVipo3dS8A7fvacJFIL+APTt6n
         oeaQXwL8cjytY8EzZWY2OwJgRKIcFrM7CT0STwnerfmJbZRNZaBJanKCfO21Ofnvgc
         qxW+zMDnDNG6zB+7bBGTSCa6yduT4PvItAqUsAPiLOyQp6tzFSmCgLlkbXtIVCK982
         zTFxovPLVvFTqlCE607e4K7idzoO+EsZWNUS/SkPsdlk56G9Cp8iS6Iy70C+8pURNJ
         m5wukodRIYw7A==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series adds support for video capture from external camera sensor to
Tegra video driver.

Jetson TX1 has camera expansion connector and supports custom camera module
designed as per TX1 design specification.

This series also enables camera capture support for Jetson Nano which has
Raspberry PI camera header.

This series is tested with IMX274 and IMX219 camera sensors.

This series include,

Tegra video driver updates
- TPG Vs Non-TPG based on Kconfig
- Support for external sensor video capture based on device graph from DT
- Support for selection ioctl operations
- Tegra MIPI CSI pads calibration
- CSI T-CLK and T-HS settle time computation based on clock rates
- dt-binding doc update

Host1x driver updates
- Keep MIPI clock enabled till calibration is done

Delta between patch versions:
[v8]:	Includes below minor changes
	- Fixed missing of_node_put and updated error message to be
	  more informative in tegra_csi_channels_alloc() and
	  tegra_vi_channels_alloc()

	Patch-0006 has compilation dependency on
	https://patchwork.kernel.org/patch/11659521/

[v7]:	Includes minor feedback from v6
	- Patch-0009 has minor update

	Note:
	Patch-0006 has compilation dependency on
	https://patchwork.kernel.org/patch/11659521/

[v6]:	Includes below changes based on v5 feedback
	- Patches are based on latest linux-next.
	- separated stream enable and disable implementations into
	  separate functions for tegra_channel_set_stream() and
	  tegra_csi_s_stream().
	- changed dev_err to dev_warn on MIPI calibration failure after
	  sensor streaming as its not critical error.

	Note:
	Patch-0006 has compilation dependency on
	https://patchwork.kernel.org/patch/11659521/

[v5]:	Includes below minor change based on v4 feedback
	Patch-0012: renames APIs to use calibration instead of calibrate.

	Note:
	Patch-0010 has compilation dependency on
	https://patchwork.kernel.org/patch/11659521/

[v4]:	Includes below fix based on v3 feedback
	- Patches are based on latest linux-next.
	- With split of tegra_mipi_calibrate() and tegra_mipi_wait(), mipi
	  clock is not left enabled till calibration done. This series adds
	  a patch to fix this by keeping clock enabled till calibration is
	  done.

	Note:
	Patch-0010 has compilation dependency on
	https://patchwork.kernel.org/patch/11659521/

[v3]:	Includes v2 feedback
	- Uses separate helper function for retrieving remote csi subdevice
	  and source subdevice.
	- Added check for presence of subdevice ops set/get_selection
	- dropped vb2_queue_release from driver and using
	  vb2_video_unregister_device instead of video_unregister_device.
	- video device register should happen in the last after all video
	  device related setup is done in the driver. This is being addressed
	  in below RFC patch. Once proper implementation of this is available
	  will update Tegra video driver to use split APIs and do all setup
	  prior to device register. Added this as TODO in the driver.
	  https://www.spinics.net/lists/linux-media/msg172761.html

	Note:
	Patch-0012 has compilation dependency on
	https://patchwork.kernel.org/patch/11659521/


[v2]:	Includes below changes based on v1 feedback
	- dt-binding document and the driver update for device graph to use
	  separate ports for sink endpoint and source endpoint for csi.
	- Use data-lanes endpoint property for csi.
	- Update tegra_mipi_request() to take device node pointer argument
	  rather than adding extra API.
	- Remove checking for clk pointer before clk_disable.


Sowjanya Komatineni (10):
  media: tegra-video: Fix channel format alignment
  media: tegra-video: Enable TPG based on kernel config
  media: tegra-video: Update format lookup to offset based
  dt-bindings: tegra: Update VI and CSI bindings with port info
  media: tegra-video: Separate CSI stream enable and disable
    implementations
  media: tegra-video: Add support for external sensor capture
  media: tegra-video: Add support for selection ioctl ops
  gpu: host1x: mipi: Keep MIPI clock enabled till calibration is done
  media: tegra-video: Add CSI MIPI pads calibration
  media: tegra-video: Compute settle times based on the clock rate

 .../display/tegra/nvidia,tegra20-host1x.txt        |  92 ++-
 drivers/gpu/drm/tegra/dsi.c                        |   4 +-
 drivers/gpu/host1x/mipi.c                          |  19 +-
 drivers/staging/media/tegra-video/Kconfig          |   7 +
 drivers/staging/media/tegra-video/TODO             |   6 -
 drivers/staging/media/tegra-video/csi.c            | 314 +++++++-
 drivers/staging/media/tegra-video/csi.h            |   8 +
 drivers/staging/media/tegra-video/tegra210.c       |  25 +-
 drivers/staging/media/tegra-video/vi.c             | 841 +++++++++++++++++++--
 drivers/staging/media/tegra-video/vi.h             |  25 +-
 drivers/staging/media/tegra-video/video.c          |  23 +-
 include/linux/host1x.h                             |   5 +-
 12 files changed, 1252 insertions(+), 117 deletions(-)

-- 
2.7.4

