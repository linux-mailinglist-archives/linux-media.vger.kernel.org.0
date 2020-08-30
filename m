Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48CDF256D90
	for <lists+linux-media@lfdr.de>; Sun, 30 Aug 2020 14:12:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728817AbgH3MMU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 30 Aug 2020 08:12:20 -0400
Received: from www.linuxtv.org ([130.149.80.248]:37890 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728799AbgH3MMP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 30 Aug 2020 08:12:15 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kCM6E-007tIa-16; Sun, 30 Aug 2020 12:06:18 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kCMEV-0005lC-GI; Sun, 30 Aug 2020 12:14:51 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.10 (v2)] mtk-vcodec: venc: support for MT8183 (#66648)
Date:   Sun, 30 Aug 2020 12:14:51 +0000
Message-Id: <20200830121451.22101-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <22861790-3ae1-2009-a4db-c124067771b2@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/22861790-3ae1-2009-a4db-c124067771b2@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/66223/
Build time: 03:221:09
Link: https://lore.kernel.org/linux-media/22861790-3ae1-2009-a4db-c124067771b2@xs4all.nl

gpg: Signature made Sat 29 Aug 2020 08:41:16 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: got 17/17 patches with issues, being 15 at build time and one fatal error when buinding PDF document

Error/warnings:

patches/0001-media-mtk-vcodec-abstract-firmware-interface.patch:

   checkpatch.pl:
	$ cat patches/0001-media-mtk-vcodec-abstract-firmware-interface.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:371: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0003-media-mtk-vcodec-add-SCP-firmware-ops.patch:

    allyesconfig: error:
	scripts/kconfig/conf  --allyesconfig Kconfig
	#
	# configuration written to .config
	#

	WARNING: unmet direct dependencies detected for MTK_SCP
	  Depends on [n]: REMOTEPROC [=y] && ARCH_MEDIATEK
	  Selected by [y]:
	  - VIDEO_MEDIATEK_VCODEC [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && V4L_MEM2MEM_DRIVERS [=y] && (MTK_IOMMU [=y] || COMPILE_TEST [=y]) && VIDEO_DEV [=y] && VIDEO_V4L2 [=y] && (ARCH_MEDIATEK || COMPILE_TEST [=y])

    allmodconfig: error:
	scripts/kconfig/conf  --allmodconfig Kconfig
	#
	# configuration written to .config
	#

	WARNING: unmet direct dependencies detected for MTK_SCP
	  Depends on [n]: REMOTEPROC [=y] && ARCH_MEDIATEK
	  Selected by [m]:
	  - VIDEO_MEDIATEK_VCODEC [=m] && MEDIA_SUPPORT [=m] && MEDIA_PLATFORM_SUPPORT [=y] && V4L_MEM2MEM_DRIVERS [=y] && (MTK_IOMMU [=y] || COMPILE_TEST [=y]) && VIDEO_DEV [=m] && VIDEO_V4L2 [=m] && (ARCH_MEDIATEK || COMPILE_TEST [=y])

patches/0004-media-mtk-vcodec-venc-support-SCP-firmware.patch:

    allyesconfig: error:
	scripts/kconfig/conf  --allyesconfig Kconfig
	#
	# configuration written to .config
	#

	WARNING: unmet direct dependencies detected for MTK_SCP
	  Depends on [n]: REMOTEPROC [=y] && ARCH_MEDIATEK
	  Selected by [y]:
	  - VIDEO_MEDIATEK_VCODEC [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && V4L_MEM2MEM_DRIVERS [=y] && (MTK_IOMMU [=y] || COMPILE_TEST [=y]) && VIDEO_DEV [=y] && VIDEO_V4L2 [=y] && (ARCH_MEDIATEK || COMPILE_TEST [=y])

    allmodconfig: error:
	scripts/kconfig/conf  --allmodconfig Kconfig
	#
	# configuration written to .config
	#

	WARNING: unmet direct dependencies detected for MTK_SCP
	  Depends on [n]: REMOTEPROC [=y] && ARCH_MEDIATEK
	  Selected by [m]:
	  - VIDEO_MEDIATEK_VCODEC [=m] && MEDIA_SUPPORT [=m] && MEDIA_PLATFORM_SUPPORT [=y] && V4L_MEM2MEM_DRIVERS [=y] && (MTK_IOMMU [=y] || COMPILE_TEST [=y]) && VIDEO_DEV [=m] && VIDEO_V4L2 [=m] && (ARCH_MEDIATEK || COMPILE_TEST [=y])

   checkpatch.pl:
	$ cat patches/0004-media-mtk-vcodec-venc-support-SCP-firmware.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:337: CHECK: Prefer kernel type 'u32' over 'uint32_t'
	-:356: CHECK: Prefer kernel type 'u32' over 'uint32_t'
	-:357: CHECK: Prefer kernel type 'u32' over 'uint32_t'

patches/0005-media-mtk-vcodec-venc-handle-firmware-version-field.patch:

    allyesconfig: error:
	scripts/kconfig/conf  --allyesconfig Kconfig
	#
	# configuration written to .config
	#

	WARNING: unmet direct dependencies detected for MTK_SCP
	  Depends on [n]: REMOTEPROC [=y] && ARCH_MEDIATEK
	  Selected by [y]:
	  - VIDEO_MEDIATEK_VCODEC [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && V4L_MEM2MEM_DRIVERS [=y] && (MTK_IOMMU [=y] || COMPILE_TEST [=y]) && VIDEO_DEV [=y] && VIDEO_V4L2 [=y] && (ARCH_MEDIATEK || COMPILE_TEST [=y])

    allmodconfig: error:
	scripts/kconfig/conf  --allmodconfig Kconfig
	#
	# configuration written to .config
	#

	WARNING: unmet direct dependencies detected for MTK_SCP
	  Depends on [n]: REMOTEPROC [=y] && ARCH_MEDIATEK
	  Selected by [m]:
	  - VIDEO_MEDIATEK_VCODEC [=m] && MEDIA_SUPPORT [=m] && MEDIA_PLATFORM_SUPPORT [=y] && V4L_MEM2MEM_DRIVERS [=y] && (MTK_IOMMU [=y] || COMPILE_TEST [=y]) && VIDEO_DEV [=m] && VIDEO_V4L2 [=m] && (ARCH_MEDIATEK || COMPILE_TEST [=y])

   checkpatch.pl:
	$ cat patches/0005-media-mtk-vcodec-venc-handle-firmware-version-field.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:85: CHECK: Prefer kernel type 'u32' over 'uint32_t'

patches/0006-media-mtk-vcodec-venc-specify-bitrate-range-per-chip.patch:

    allyesconfig: error:
	scripts/kconfig/conf  --allyesconfig Kconfig
	#
	# configuration written to .config
	#

	WARNING: unmet direct dependencies detected for MTK_SCP
	  Depends on [n]: REMOTEPROC [=y] && ARCH_MEDIATEK
	  Selected by [y]:
	  - VIDEO_MEDIATEK_VCODEC [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && V4L_MEM2MEM_DRIVERS [=y] && (MTK_IOMMU [=y] || COMPILE_TEST [=y]) && VIDEO_DEV [=y] && VIDEO_V4L2 [=y] && (ARCH_MEDIATEK || COMPILE_TEST [=y])

    allmodconfig: error:
	scripts/kconfig/conf  --allmodconfig Kconfig
	#
	# configuration written to .config
	#

	WARNING: unmet direct dependencies detected for MTK_SCP
	  Depends on [n]: REMOTEPROC [=y] && ARCH_MEDIATEK
	  Selected by [m]:
	  - VIDEO_MEDIATEK_VCODEC [=m] && MEDIA_SUPPORT [=m] && MEDIA_PLATFORM_SUPPORT [=y] && V4L_MEM2MEM_DRIVERS [=y] && (MTK_IOMMU [=y] || COMPILE_TEST [=y]) && VIDEO_DEV [=m] && VIDEO_V4L2 [=m] && (ARCH_MEDIATEK || COMPILE_TEST [=y])

patches/0007-media-mtk-vcodec-venc-specify-supported-formats-per-.patch:

    allyesconfig: error:
	scripts/kconfig/conf  --allyesconfig Kconfig
	#
	# configuration written to .config
	#

	WARNING: unmet direct dependencies detected for MTK_SCP
	  Depends on [n]: REMOTEPROC [=y] && ARCH_MEDIATEK
	  Selected by [y]:
	  - VIDEO_MEDIATEK_VCODEC [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && V4L_MEM2MEM_DRIVERS [=y] && (MTK_IOMMU [=y] || COMPILE_TEST [=y]) && VIDEO_DEV [=y] && VIDEO_V4L2 [=y] && (ARCH_MEDIATEK || COMPILE_TEST [=y])

    allmodconfig: error:
	scripts/kconfig/conf  --allmodconfig Kconfig
	#
	# configuration written to .config
	#

	WARNING: unmet direct dependencies detected for MTK_SCP
	  Depends on [n]: REMOTEPROC [=y] && ARCH_MEDIATEK
	  Selected by [m]:
	  - VIDEO_MEDIATEK_VCODEC [=m] && MEDIA_SUPPORT [=m] && MEDIA_PLATFORM_SUPPORT [=y] && V4L_MEM2MEM_DRIVERS [=y] && (MTK_IOMMU [=y] || COMPILE_TEST [=y]) && VIDEO_DEV [=m] && VIDEO_V4L2 [=m] && (ARCH_MEDIATEK || COMPILE_TEST [=y])

patches/0008-dt-bindings-media-document-mediatek-mt8183-vcodec-en.patch:

    allyesconfig: error:
	scripts/kconfig/conf  --allyesconfig Kconfig
	#
	# configuration written to .config
	#

	WARNING: unmet direct dependencies detected for MTK_SCP
	  Depends on [n]: REMOTEPROC [=y] && ARCH_MEDIATEK
	  Selected by [y]:
	  - VIDEO_MEDIATEK_VCODEC [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && V4L_MEM2MEM_DRIVERS [=y] && (MTK_IOMMU [=y] || COMPILE_TEST [=y]) && VIDEO_DEV [=y] && VIDEO_V4L2 [=y] && (ARCH_MEDIATEK || COMPILE_TEST [=y])

    allmodconfig: error:
	scripts/kconfig/conf  --allmodconfig Kconfig
	#
	# configuration written to .config
	#

	WARNING: unmet direct dependencies detected for MTK_SCP
	  Depends on [n]: REMOTEPROC [=y] && ARCH_MEDIATEK
	  Selected by [m]:
	  - VIDEO_MEDIATEK_VCODEC [=m] && MEDIA_SUPPORT [=m] && MEDIA_PLATFORM_SUPPORT [=y] && V4L_MEM2MEM_DRIVERS [=y] && (MTK_IOMMU [=y] || COMPILE_TEST [=y]) && VIDEO_DEV [=m] && VIDEO_V4L2 [=m] && (ARCH_MEDIATEK || COMPILE_TEST [=y])

patches/0009-media-mtk-vcodec-add-support-for-MT8183-encoder.patch:

    allyesconfig: error:
	scripts/kconfig/conf  --allyesconfig Kconfig
	#
	# configuration written to .config
	#

	WARNING: unmet direct dependencies detected for MTK_SCP
	  Depends on [n]: REMOTEPROC [=y] && ARCH_MEDIATEK
	  Selected by [y]:
	  - VIDEO_MEDIATEK_VCODEC [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && V4L_MEM2MEM_DRIVERS [=y] && (MTK_IOMMU [=y] || COMPILE_TEST [=y]) && VIDEO_DEV [=y] && VIDEO_V4L2 [=y] && (ARCH_MEDIATEK || COMPILE_TEST [=y])

    allmodconfig: error:
	scripts/kconfig/conf  --allmodconfig Kconfig
	#
	# configuration written to .config
	#

	WARNING: unmet direct dependencies detected for MTK_SCP
	  Depends on [n]: REMOTEPROC [=y] && ARCH_MEDIATEK
	  Selected by [m]:
	  - VIDEO_MEDIATEK_VCODEC [=m] && MEDIA_SUPPORT [=m] && MEDIA_PLATFORM_SUPPORT [=y] && V4L_MEM2MEM_DRIVERS [=y] && (MTK_IOMMU [=y] || COMPILE_TEST [=y]) && VIDEO_DEV [=m] && VIDEO_V4L2 [=m] && (ARCH_MEDIATEK || COMPILE_TEST [=y])

patches/0010-Revert-media-mtk-vcodec-Remove-extra-area-allocation.patch:

    allyesconfig: error:
	scripts/kconfig/conf  --allyesconfig Kconfig
	#
	# configuration written to .config
	#

	WARNING: unmet direct dependencies detected for MTK_SCP
	  Depends on [n]: REMOTEPROC [=y] && ARCH_MEDIATEK
	  Selected by [y]:
	  - VIDEO_MEDIATEK_VCODEC [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && V4L_MEM2MEM_DRIVERS [=y] && (MTK_IOMMU [=y] || COMPILE_TEST [=y]) && VIDEO_DEV [=y] && VIDEO_V4L2 [=y] && (ARCH_MEDIATEK || COMPILE_TEST [=y])

    allmodconfig: error:
	scripts/kconfig/conf  --allmodconfig Kconfig
	#
	# configuration written to .config
	#

	WARNING: unmet direct dependencies detected for MTK_SCP
	  Depends on [n]: REMOTEPROC [=y] && ARCH_MEDIATEK
	  Selected by [m]:
	  - VIDEO_MEDIATEK_VCODEC [=m] && MEDIA_SUPPORT [=m] && MEDIA_PLATFORM_SUPPORT [=y] && V4L_MEM2MEM_DRIVERS [=y] && (MTK_IOMMU [=y] || COMPILE_TEST [=y]) && VIDEO_DEV [=m] && VIDEO_V4L2 [=m] && (ARCH_MEDIATEK || COMPILE_TEST [=y])

patches/0011-media-mtk-vcodec-venc-support-MIN_OUTPUT_BUFFERS-con.patch:

    allyesconfig: error:
	scripts/kconfig/conf  --allyesconfig Kconfig
	#
	# configuration written to .config
	#

	WARNING: unmet direct dependencies detected for MTK_SCP
	  Depends on [n]: REMOTEPROC [=y] && ARCH_MEDIATEK
	  Selected by [y]:
	  - VIDEO_MEDIATEK_VCODEC [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && V4L_MEM2MEM_DRIVERS [=y] && (MTK_IOMMU [=y] || COMPILE_TEST [=y]) && VIDEO_DEV [=y] && VIDEO_V4L2 [=y] && (ARCH_MEDIATEK || COMPILE_TEST [=y])

    allmodconfig: error:
	scripts/kconfig/conf  --allmodconfig Kconfig
	#
	# configuration written to .config
	#

	WARNING: unmet direct dependencies detected for MTK_SCP
	  Depends on [n]: REMOTEPROC [=y] && ARCH_MEDIATEK
	  Selected by [m]:
	  - VIDEO_MEDIATEK_VCODEC [=m] && MEDIA_SUPPORT [=m] && MEDIA_PLATFORM_SUPPORT [=y] && V4L_MEM2MEM_DRIVERS [=y] && (MTK_IOMMU [=y] || COMPILE_TEST [=y]) && VIDEO_DEV [=m] && VIDEO_V4L2 [=m] && (ARCH_MEDIATEK || COMPILE_TEST [=y])

patches/0012-media-mtk-vcodec-venc-set-OUTPUT-buffers-field-to-V4.patch:

    allyesconfig: error:
	scripts/kconfig/conf  --allyesconfig Kconfig
	#
	# configuration written to .config
	#

	WARNING: unmet direct dependencies detected for MTK_SCP
	  Depends on [n]: REMOTEPROC [=y] && ARCH_MEDIATEK
	  Selected by [y]:
	  - VIDEO_MEDIATEK_VCODEC [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && V4L_MEM2MEM_DRIVERS [=y] && (MTK_IOMMU [=y] || COMPILE_TEST [=y]) && VIDEO_DEV [=y] && VIDEO_V4L2 [=y] && (ARCH_MEDIATEK || COMPILE_TEST [=y])

    allmodconfig: error:
	scripts/kconfig/conf  --allmodconfig Kconfig
	#
	# configuration written to .config
	#

	WARNING: unmet direct dependencies detected for MTK_SCP
	  Depends on [n]: REMOTEPROC [=y] && ARCH_MEDIATEK
	  Selected by [m]:
	  - VIDEO_MEDIATEK_VCODEC [=m] && MEDIA_SUPPORT [=m] && MEDIA_PLATFORM_SUPPORT [=y] && V4L_MEM2MEM_DRIVERS [=y] && (MTK_IOMMU [=y] || COMPILE_TEST [=y]) && VIDEO_DEV [=m] && VIDEO_V4L2 [=m] && (ARCH_MEDIATEK || COMPILE_TEST [=y])

patches/0013-media-mtk-vcodec-venc-use-platform-data-for-ENUM_FRA.patch:

    allyesconfig: error:
	scripts/kconfig/conf  --allyesconfig Kconfig
	#
	# configuration written to .config
	#

	WARNING: unmet direct dependencies detected for MTK_SCP
	  Depends on [n]: REMOTEPROC [=y] && ARCH_MEDIATEK
	  Selected by [y]:
	  - VIDEO_MEDIATEK_VCODEC [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && V4L_MEM2MEM_DRIVERS [=y] && (MTK_IOMMU [=y] || COMPILE_TEST [=y]) && VIDEO_DEV [=y] && VIDEO_V4L2 [=y] && (ARCH_MEDIATEK || COMPILE_TEST [=y])

    allmodconfig: error:
	scripts/kconfig/conf  --allmodconfig Kconfig
	#
	# configuration written to .config
	#

	WARNING: unmet direct dependencies detected for MTK_SCP
	  Depends on [n]: REMOTEPROC [=y] && ARCH_MEDIATEK
	  Selected by [m]:
	  - VIDEO_MEDIATEK_VCODEC [=m] && MEDIA_SUPPORT [=m] && MEDIA_PLATFORM_SUPPORT [=y] && V4L_MEM2MEM_DRIVERS [=y] && (MTK_IOMMU [=y] || COMPILE_TEST [=y]) && VIDEO_DEV [=m] && VIDEO_V4L2 [=m] && (ARCH_MEDIATEK || COMPILE_TEST [=y])

patches/0014-media-mtk-vcodec-venc-support-ENUM_FRAMESIZES-on-OUT.patch:

    allyesconfig: error:
	scripts/kconfig/conf  --allyesconfig Kconfig
	#
	# configuration written to .config
	#

	WARNING: unmet direct dependencies detected for MTK_SCP
	  Depends on [n]: REMOTEPROC [=y] && ARCH_MEDIATEK
	  Selected by [y]:
	  - VIDEO_MEDIATEK_VCODEC [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && V4L_MEM2MEM_DRIVERS [=y] && (MTK_IOMMU [=y] || COMPILE_TEST [=y]) && VIDEO_DEV [=y] && VIDEO_V4L2 [=y] && (ARCH_MEDIATEK || COMPILE_TEST [=y])

    allmodconfig: error:
	scripts/kconfig/conf  --allmodconfig Kconfig
	#
	# configuration written to .config
	#

	WARNING: unmet direct dependencies detected for MTK_SCP
	  Depends on [n]: REMOTEPROC [=y] && ARCH_MEDIATEK
	  Selected by [m]:
	  - VIDEO_MEDIATEK_VCODEC [=m] && MEDIA_SUPPORT [=m] && MEDIA_PLATFORM_SUPPORT [=y] && V4L_MEM2MEM_DRIVERS [=y] && (MTK_IOMMU [=y] || COMPILE_TEST [=y]) && VIDEO_DEV [=m] && VIDEO_V4L2 [=m] && (ARCH_MEDIATEK || COMPILE_TEST [=y])

patches/0015-media-mtk-vcodec-venc-set-default-time-per-frame.patch:

    allyesconfig: error:
	scripts/kconfig/conf  --allyesconfig Kconfig
	#
	# configuration written to .config
	#

	WARNING: unmet direct dependencies detected for MTK_SCP
	  Depends on [n]: REMOTEPROC [=y] && ARCH_MEDIATEK
	  Selected by [y]:
	  - VIDEO_MEDIATEK_VCODEC [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && V4L_MEM2MEM_DRIVERS [=y] && (MTK_IOMMU [=y] || COMPILE_TEST [=y]) && VIDEO_DEV [=y] && VIDEO_V4L2 [=y] && (ARCH_MEDIATEK || COMPILE_TEST [=y])

    allmodconfig: error:
	scripts/kconfig/conf  --allmodconfig Kconfig
	#
	# configuration written to .config
	#

	WARNING: unmet direct dependencies detected for MTK_SCP
	  Depends on [n]: REMOTEPROC [=y] && ARCH_MEDIATEK
	  Selected by [m]:
	  - VIDEO_MEDIATEK_VCODEC [=m] && MEDIA_SUPPORT [=m] && MEDIA_PLATFORM_SUPPORT [=y] && V4L_MEM2MEM_DRIVERS [=y] && (MTK_IOMMU [=y] || COMPILE_TEST [=y]) && VIDEO_DEV [=m] && VIDEO_V4L2 [=m] && (ARCH_MEDIATEK || COMPILE_TEST [=y])

patches/0016-media-mtk-vcodec-venc-fix-invalid-time-per-frame-in-.patch:

    allyesconfig: error:
	scripts/kconfig/conf  --allyesconfig Kconfig
	#
	# configuration written to .config
	#

	WARNING: unmet direct dependencies detected for MTK_SCP
	  Depends on [n]: REMOTEPROC [=y] && ARCH_MEDIATEK
	  Selected by [y]:
	  - VIDEO_MEDIATEK_VCODEC [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && V4L_MEM2MEM_DRIVERS [=y] && (MTK_IOMMU [=y] || COMPILE_TEST [=y]) && VIDEO_DEV [=y] && VIDEO_V4L2 [=y] && (ARCH_MEDIATEK || COMPILE_TEST [=y])

    allmodconfig: error:
	scripts/kconfig/conf  --allmodconfig Kconfig
	#
	# configuration written to .config
	#

	WARNING: unmet direct dependencies detected for MTK_SCP
	  Depends on [n]: REMOTEPROC [=y] && ARCH_MEDIATEK
	  Selected by [m]:
	  - VIDEO_MEDIATEK_VCODEC [=m] && MEDIA_SUPPORT [=m] && MEDIA_PLATFORM_SUPPORT [=y] && V4L_MEM2MEM_DRIVERS [=y] && (MTK_IOMMU [=y] || COMPILE_TEST [=y]) && VIDEO_DEV [=m] && VIDEO_V4L2 [=m] && (ARCH_MEDIATEK || COMPILE_TEST [=y])

patches/0017-media-mtk-vcodec-make-IRQs-disabled-upon-request.patch:

    allyesconfig: error:
	scripts/kconfig/conf  --allyesconfig Kconfig
	#
	# configuration written to .config
	#

	WARNING: unmet direct dependencies detected for MTK_SCP
	  Depends on [n]: REMOTEPROC [=y] && ARCH_MEDIATEK
	  Selected by [y]:
	  - VIDEO_MEDIATEK_VCODEC [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && V4L_MEM2MEM_DRIVERS [=y] && (MTK_IOMMU [=y] || COMPILE_TEST [=y]) && VIDEO_DEV [=y] && VIDEO_V4L2 [=y] && (ARCH_MEDIATEK || COMPILE_TEST [=y])

    allmodconfig: error:
	scripts/kconfig/conf  --allmodconfig Kconfig
	#
	# configuration written to .config
	#

	WARNING: unmet direct dependencies detected for MTK_SCP
	  Depends on [n]: REMOTEPROC [=y] && ARCH_MEDIATEK
	  Selected by [m]:
	  - VIDEO_MEDIATEK_VCODEC [=m] && MEDIA_SUPPORT [=m] && MEDIA_PLATFORM_SUPPORT [=y] && V4L_MEM2MEM_DRIVERS [=y] && (MTK_IOMMU [=y] || COMPILE_TEST [=y]) && VIDEO_DEV [=m] && VIDEO_V4L2 [=m] && (ARCH_MEDIATEK || COMPILE_TEST [=y])


Error #512 when building PDF docs

