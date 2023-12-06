Return-Path: <linux-media+bounces-1757-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E13368070CA
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 14:23:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 811CB1F21442
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 13:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90C6D381AF;
	Wed,  6 Dec 2023 13:23:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB47A28E15
	for <linux-media@vger.kernel.org>; Wed,  6 Dec 2023 13:23:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 845D3C433C8;
	Wed,  6 Dec 2023 13:23:34 +0000 (UTC)
Message-ID: <aa98490d-72b9-45fa-bb34-a7b91e661a5f@xs4all.nl>
Date: Wed, 6 Dec 2023 14:23:32 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Detlev Casanova <detlev.casanova@collabora.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.8] Various fixes and enhancements
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Various fixes and enhancements for v6.8.

I'll merge this tomorrow or Friday if there are no objections.

Regards,

	Hans

The following changes since commit bec3db03911bd85da29c1c8ee556162153002c9a:

  media: v4l: async: Drop useless list move operation (2023-12-04 11:21:47 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.8n

for you to fetch changes up to a513d091d2f2fe2b9a46a78c09bb3da912803b4a:

  media: qcom: camss: Add sm8250 named power-domain support (2023-12-06 14:01:54 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
AngeloGioacchino Del Regno (2):
      media: dt-bindings: mediatek: Add phandle to mediatek,scp on MDP3 RDMA
      media: platform: mtk-mdp3: Use devicetree phandle to retrieve SCP

Bryan O'Donoghue (6):
      media: qcom: camss: Flag which VFEs require a power-domain
      media: qcom: camss: Convert to per-VFE pointer for power-domain linkages
      media: qcom: camss: Use common VFE pm_domain_on/pm_domain_off where applicable
      media: qcom: camss: Move VFE power-domain specifics into vfe.c
      media: qcom: camss: Add support for named power-domains
      media: qcom: camss: Add sm8250 named power-domain support

Dan Carpenter (1):
      media: staging: starfive: camss: fix off by one in isp_enum_mbus_code()

Detlev Casanova (2):
      media: visl: Add AV1 support
      doc: media: visl: Add AV1 support

Geert Uytterhoeven (2):
      media: chips-media: wave5: VIDEO_WAVE_VPU should depend on ARCH_K3
      staging: media: VIDEO_STARFIVE_CAMSS should depend on ARCH_STARFIVE

Ghanshyam Agrawal (1):
      media: stk1160: Fixed high volume of stk1160_dbg messages

Lukas Bulwahn (1):
      media: exynos-gsc: remove unused improper CONFIG definition

Matti Lehtimäki (2):
      media: qcom: camss: Flag VFE-lites to support more VFEs
      media: qcom: camss: Flag CSID-lites to support more CSIDs

Michael Grzeschik (1):
      media: videobuf2-dma-sg: fix vmap callback

Zhipeng Lu (1):
      media: cx231xx: fix a memleak in cx231xx_init_isoc

 Documentation/admin-guide/media/visl.rst                        |   2 +
 Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml |   8 ++
 drivers/media/common/videobuf2/videobuf2-dma-sg.c               |  10 +-
 drivers/media/platform/chips-media/wave5/Kconfig                |   1 +
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c            |  16 ++-
 drivers/media/platform/qcom/camss/camss-csid-gen2.c             |  31 +++---
 drivers/media/platform/qcom/camss/camss-csid.c                  |   5 +
 drivers/media/platform/qcom/camss/camss-csid.h                  |   7 ++
 drivers/media/platform/qcom/camss/camss-vfe-170.c               |  36 ------
 drivers/media/platform/qcom/camss/camss-vfe-4-1.c               |   8 +-
 drivers/media/platform/qcom/camss/camss-vfe-4-7.c               |  36 ------
 drivers/media/platform/qcom/camss/camss-vfe-4-8.c               |  31 ------
 drivers/media/platform/qcom/camss/camss-vfe-480.c               |  69 +++---------
 drivers/media/platform/qcom/camss/camss-vfe.c                   |  81 ++++++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.h                   |  26 +++++
 drivers/media/platform/qcom/camss/camss.c                       | 124 +++++++++++++--------
 drivers/media/platform/qcom/camss/camss.h                       |  10 +-
 drivers/media/platform/samsung/exynos-gsc/gsc-core.h            |   1 -
 drivers/media/test-drivers/visl/visl-core.c                     |  21 ++++
 drivers/media/test-drivers/visl/visl-dec.c                      |  72 +++++++++++-
 drivers/media/test-drivers/visl/visl-dec.h                      |   8 ++
 drivers/media/test-drivers/visl/visl-trace-av1.h                | 314 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/media/test-drivers/visl/visl-trace-points.c             |   1 +
 drivers/media/test-drivers/visl/visl-video.c                    |  18 +++
 drivers/media/test-drivers/visl/visl-video.h                    |   1 +
 drivers/media/test-drivers/visl/visl.h                          |   1 +
 drivers/media/usb/cx231xx/cx231xx-core.c                        |   2 +
 drivers/media/usb/stk1160/stk1160-video.c                       |   5 +-
 drivers/staging/media/starfive/camss/Kconfig                    |   1 +
 drivers/staging/media/starfive/camss/stf-isp.c                  |   4 +-
 30 files changed, 711 insertions(+), 239 deletions(-)
 create mode 100644 drivers/media/test-drivers/visl/visl-trace-av1.h

