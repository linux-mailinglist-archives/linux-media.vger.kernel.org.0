Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF2F43431CC
	for <lists+linux-media@lfdr.de>; Sun, 21 Mar 2021 10:01:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230084AbhCUJBW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Mar 2021 05:01:22 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:58777 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229817AbhCUJA4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Mar 2021 05:00:56 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id Ntx5llvYqDUxpNtx8loG6R; Sun, 21 Mar 2021 10:00:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616317254; bh=wduHdp0bD6ScKEc2lNlHQltYk/1roRdZBDbhCtJDJ+8=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=k68tbYepR5eKg+wB1xOBOl358m2XLWaycZVEhFcfvaagjEIHlufZxdmGg8FOHj30n
         X0P5bAW2cb3g3rGPLt7O8aUBX/5WQ8xYstUOx88NRJaHO8aUR8zkYVrWZO3Yzt5cw7
         JWQhlXJvJ/TZQxARSgMlrci9EzQuBsqe0PWcqkxwUX22M9ibz9YhVxX57VMk8sSlNz
         +5drc0LnOMzSCCPYeX0WgkBaxRHl496EMZHt0fcsJB11g8oGz9e1gXwWLIxEq+3reZ
         LYi3QW/n6cEMoH+4rrwhIH9D5vUkToaWyFL0PteI+CvjpPrWTBikRPB6V8cVE4Hegb
         kHketjycAo5Zw==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.13] kernel-doc formatting fixes
Message-ID: <746f55eb-a07f-c5fc-79f2-537539a3c6fa@xs4all.nl>
Date:   Sun, 21 Mar 2021 10:00:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfFPEaOBVvnJLTwQF0T12A2LfRW9HGpii1fYpo4UgDQ6MSnKbTb59ht2Lh+qlU8KsW7n4ryx6C+q9NRQkNjnZDrguac64h/9srnVSCgvGlqciPfWyvU2L
 PgpqL3nhzhDngRBKagFbhgUmInmC5SfNeNE/aak60+cV3y98x9EpZr+NRfwRv14K7VFi5MP0ilQlzG4TMajV8xOZdd/kDVd9aY4=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Various kernel-doc formatting fixes. This just fixes syntax mistakes, it
does not add descriptions for missing enum values or fields (except if it
was very trivial).

But at least after this patch any remaining warnings about that are real
warnings and not due to syntax errors.

Regards,

	Hans

The following changes since commit 1c5ab1e2286f4ca6347744e9d4cace5fad5ffa39:

  Merge tag 'v5.12-rc2' into patchwork (2021-03-07 17:46:50 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.13k

for you to fetch changes up to a81aff8809573745e51e6f40e91262f894c6cb22:

  mtk-vpu/mtk_vpu.h: fix kernel-doc warnings (2021-03-21 09:41:02 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (15):
      media/usb: fix kernel-doc header issues
      tegra-video/csi.h: fix kernel-doc mistake
      exynos-gsc/exynos4-is: add missing 'struct' to kerneldoc
      s5p-jpeg: fix kernel-doc warnings
      ti-vpe/cal.h: fix kernel-doc formatting
      rcar-vin/rcar-vin.h: fix kernel-doc formatting
      media/platform/sti: fix kernel-doc formatting
      vsp1/vsp1_drm.h: add missing 'struct' kernel-doc keyword
      staging: media: hantro: fix kernel-doc formatting
      staging: media: ipu3: add missing kernel-doc 'struct' keywords
      staging: media: meson: vdec: fix kernel-doc warning
      mtk-jpeg/mtk_jpeg_core.h: fix kernel-doc warnings
      mtk-mdp: fix kernel-doc warnings
      mtk-vcodec: fix kernel-doc warnings
      mtk-vpu/mtk_vpu.h: fix kernel-doc warnings

 drivers/media/platform/exynos-gsc/gsc-core.h             |  2 +-
 drivers/media/platform/exynos4-is/fimc-core.h            |  2 +-
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h          | 14 ++++-----
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.h            |  1 -
 drivers/media/platform/mtk-mdp/mtk_mdp_core.h            | 10 +++----
 drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h       | 14 ++++-----
 drivers/media/platform/mtk-vcodec/vdec_drv_if.h          |  8 ++---
 drivers/media/platform/mtk-vcodec/venc_ipi_msg.h         | 14 ++++-----
 drivers/media/platform/mtk-vpu/mtk_vpu.h                 | 18 ++++++-----
 drivers/media/platform/rcar-vin/rcar-vin.h               | 19 ++++++------
 drivers/media/platform/s5p-jpeg/jpeg-core.h              | 13 ++++----
 drivers/media/platform/sti/bdisp/bdisp-filter.h          |  4 +--
 drivers/media/platform/sti/c8sectpfe/c8sectpfe-debugfs.h |  3 +-
 drivers/media/platform/sti/hva/hva.h                     |  2 +-
 drivers/media/platform/ti-vpe/cal.h                      | 19 ++++++------
 drivers/media/platform/vsp1/vsp1_drm.h                   |  4 +--
 drivers/media/usb/dvb-usb-v2/dvb_usb.h                   | 34 ++++++++++++++-------
 drivers/media/usb/dvb-usb/dvb-usb.h                      | 75 ++++++++++++++++++++++++++++++----------------
 drivers/media/usb/em28xx/em28xx.h                        |  2 +-
 drivers/staging/media/hantro/hantro.h                    |  3 +-
 drivers/staging/media/hantro/hantro_hw.h                 |  2 +-
 drivers/staging/media/ipu3/ipu3-css-pool.h               |  4 +--
 drivers/staging/media/meson/vdec/codec_hevc_common.h     |  4 +--
 drivers/staging/media/tegra-video/csi.h                  |  2 +-
 24 files changed, 153 insertions(+), 120 deletions(-)
