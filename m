Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C3B1336FBD
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 11:21:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232149AbhCKKUr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 05:20:47 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:51799 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232241AbhCKKU2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 05:20:28 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id KIQYlPLX0C40pKIQdlKo4f; Thu, 11 Mar 2021 11:20:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615458027; bh=LX2C2WC+bbTWn/v3IqiX0NRmbxi6+FM+SS5jm88jNUY=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type:From:
         Subject;
        b=rJRkRbL0+1bSR4M31/6HTEKl8stfPtCKnQBx/E778uGa1MxU3zXkgEa2s7hGI0nEs
         r1PlfAyiEiuPlnkCqarAevq1nVXEWqsp8JoQ0ld6UyBBcZ0VZYJtEyLlvIh3pC1GfC
         yJUxLHvzOIr1BJsO9xdNvJF1KuSajbnoKtfcO8q9piB18ihUzaAF5u1sqbycpqFh8e
         cKFIgLoBUoxHTXF8T6TahJn7KlbE/FZ5QvlINt0onQQNKR1fNhGD7DVXCfiEgenFt0
         xxuWBqssAn6wBWapzaTQoCAtVA4cQl8BJ8DoMI06/a3zpZVUTLg0fKwRz8eRiR1OtN
         xgut3g3iIJyjg==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: [PATCH 00/13] media platform: fix kernel-doc formatting
Date:   Thu, 11 Mar 2021 11:20:09 +0100
Message-Id: <20210311102022.96954-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfDTmGPsJhipjxvesHlfikgzE26qRUsCsaxsoE2XF31EQIzoIJuK7mjBDXXwgR7YILUwwhPQIMpTrDCa8WUKstcv416eHTCvpf3q0L0mUXWrPGORyG2JN
 +51Zr18D/lbXaNQBJvg8kVW+KrVNqtVhKpNxAOEXti96ifPjNY5oCe0QiNjiVI5+8cQOxmhaz73mToZom3758jfkcfKXWzDpDN4=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series fixes clearly wrong kernel-doc formatting in
media platform drivers.

I did not add documentation for missing struct/enum members
(except in one or two trivial cases), this just fixes syntax
problems.

Regards,

	Hans

Hans Verkuil (13):
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

 drivers/media/platform/exynos-gsc/gsc-core.h  |  2 +-
 drivers/media/platform/exynos4-is/fimc-core.h |  2 +-
 .../media/platform/mtk-jpeg/mtk_jpeg_core.h   | 14 +++++++-------
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  1 -
 drivers/media/platform/mtk-mdp/mtk_mdp_core.h | 10 +++++-----
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      | 14 +++++++-------
 .../media/platform/mtk-vcodec/vdec_drv_if.h   |  8 ++++----
 .../media/platform/mtk-vcodec/venc_ipi_msg.h  | 14 +++++++-------
 drivers/media/platform/mtk-vpu/mtk_vpu.h      | 18 ++++++++++--------
 drivers/media/platform/rcar-vin/rcar-vin.h    | 19 ++++++++++---------
 drivers/media/platform/s5p-jpeg/jpeg-core.h   | 13 ++++++-------
 .../media/platform/sti/bdisp/bdisp-filter.h   |  4 ++--
 .../sti/c8sectpfe/c8sectpfe-debugfs.h         |  3 +--
 drivers/media/platform/sti/hva/hva.h          |  2 +-
 drivers/media/platform/ti-vpe/cal.h           | 19 +++++++++----------
 drivers/media/platform/vsp1/vsp1_drm.h        |  4 ++--
 drivers/staging/media/hantro/hantro.h         |  3 ++-
 drivers/staging/media/hantro/hantro_hw.h      |  2 +-
 drivers/staging/media/ipu3/ipu3-css-pool.h    |  4 ++--
 .../media/meson/vdec/codec_hevc_common.h      |  4 +---
 20 files changed, 79 insertions(+), 81 deletions(-)

-- 
2.30.1

