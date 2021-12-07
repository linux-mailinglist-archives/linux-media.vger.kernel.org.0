Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C7C846BB7D
	for <lists+linux-media@lfdr.de>; Tue,  7 Dec 2021 13:40:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236279AbhLGMnd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Dec 2021 07:43:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236398AbhLGMnc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Dec 2021 07:43:32 -0500
Received: from lb1-smtp-cloud9.xs4all.net (lb1-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E33B1C061574
        for <linux-media@vger.kernel.org>; Tue,  7 Dec 2021 04:40:01 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id uZlEm8KTvlcdAuZlImm7UV; Tue, 07 Dec 2021 13:40:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1638880800; bh=35HWSkSdluzUPYed8xL3TC2uc63K4kf/75SEn/NHM7A=;
        h=Subject:From:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=iXaOZM+bvLO7qjCxsk1Zn9B8Nc+gisnAkRm6wZsoAwIZeAidDCfgiPqL1racge9VT
         fxTTiW4KdxSyP+J8gG59sVxa3pdQFwl58paecNwjXX6GAgUpqD1jApqq0IupeJxe+R
         B9P0XgE4k4Hj6Vz5toYQXaB50eK4x63np1sImQE6znTe5f44shOZ5Fbr7hK95PsRtS
         rqjtGfKJg0zeVGJJhbNIYQ4BGPttR35PiyNyw4+q7Hn5J8GNQ/8qKQ9uM5ATZc+hst
         txTXn7Mk582Z7dv0dzN3yw4ZtyjbME0m9ybMqJUjJPDp50sgSTfbsYtUxfKPDir1dJ
         0yvEAa5tIl02g==
Subject: Re: [GIT PULL FOR v5.17] Mediatek improvements
From:   Hans Verkuil <hverkuil@xs4all.nl>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Joerg Roedel <joro@8bytes.org>, Yong Wu <yong.wu@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>
References: <e85c97e7-cdd1-db38-5c9a-5455cd83e6ad@xs4all.nl>
Message-ID: <5d6ff68b-ac1d-2047-d029-2865ca0035e2@xs4all.nl>
Date:   Tue, 7 Dec 2021 13:39:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <e85c97e7-cdd1-db38-5c9a-5455cd83e6ad@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfKzuoPWeAb6+/jNG/c1DCq83cgQJ+42BrSVgSO31zkPVQx2u9QZ9IgQhIqfDHYicpOUq5001JdGROKwPgMyvLexMjw5/5WTeEE8oDPUc/iTLXuZ1sMUH
 RshpKPQM4sfyA4x7SBk/ZkO40MB/s/lEgWx3JeD68nRkkuoZeygGglX537UoaizrhcaWSVD6a5uwW82Pyzsdg+Z+B2a8qC+vPpx9o5r02pjdWHimQlmPhhxZ
 /AkcbjKbp2XdXf1OHKUMixdXHF0BbtGVk0QfBQJ5mlrQF1p3pBMQwR0OL3KP2ZewNQESaiwikRWP/zl0pDaNZsJgeUOACKyViJ9vqcsDaGfJYp5Cq3TK+DYE
 dUOqCe8fvy+3t0CVl63dZDYmSKXTaiaYb9Utz1ccSXn6VhQtpGVB7XaO7I4KkqdQFyesEjohI/ew3EUIgTRmT0iDKSf6KUFMIG8Xww9KDKvwJma9P1wdEzH3
 xPSFeg55YApAZXAyiv/L1JILl7KmTy7M1yAz9Pq7dJS8aB9yCsVRJTYFUo0=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

I'm withdrawing this PR until this issue that I only stumbled on today is
clarified:

https://lore.kernel.org/linux-media/a0b3a10d-9313-7ac5-692c-822aeff50858@xs4all.nl/T/#u

Regards,

	Hans

On 12/6/21 3:52 PM, Hans Verkuil wrote:
> Hi Mauro,
> 
> This PR contains the patches from these two series (minus the dts patches):
> 
> https://patchwork.linuxtv.org/project/linux-media/list/?series=6887
> https://patchwork.linuxtv.org/project/linux-media/list/?series=6698
> 
> The second series depends on the first.
> 
> The second series contains patches for different subsystems, but since they
> all depend on the iommu changes, and since most of the patches are media
> related, this series goes in through the media subsystem. That made the most
> sense. I believe all the correct Acks are collected for this.
> 
> Regards,
> 
> 	Hans
> 
> The following changes since commit b0f7d9b6d81209f87cabd45c91458dd745d84924:
> 
>   media: docs: media: Fix imbalance of LaTeX group (2021-12-06 13:23:03 +0100)
> 
> are available in the Git repository at:
> 
>   git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.17f
> 
> for you to fetch changes up to 4a3482c6afb179e282353cdb343545b8ad985d95:
> 
>   memory: mtk-smi: Get rid of mtk_smi_larb_get/put (2021-12-06 15:41:56 +0100)
> 
> ----------------------------------------------------------------
> Tag branch
> 
> ----------------------------------------------------------------
> Hsin-Yi Wang (2):
>       dt-bindings: mediatek: convert mtk jpeg decoder/encoder to yaml
>       dt-bindings: mediatek: Add mediatek, mt8183-jpgenc compatible
> 
> Yong Wu (12):
>       dt-binding: mediatek: Get rid of mediatek,larb for multimedia HW
>       iommu/mediatek-v1: Free the existed fwspec if the master dev already has
>       iommu/mediatek: Return ENODEV if the device is NULL
>       iommu/mediatek: Add probe_defer for smi-larb
>       iommu/mediatek: Add device_link between the consumer and the larb devices
>       media: mtk-jpeg: Get rid of mtk_smi_larb_get/put
>       media: mtk-mdp: Get rid of mtk_smi_larb_get/put
>       drm/mediatek: Get rid of mtk_smi_larb_get/put
>       media: mtk-vcodec: Get rid of mtk_smi_larb_get/put
>       media: mtk-vcodec: dec: Remove mtk_vcodec_release_dec_pm
>       media: mtk-vcodec: enc: Remove mtk_vcodec_release_enc_pm
>       memory: mtk-smi: Get rid of mtk_smi_larb_get/put
> 
> Yongqiang Niu (1):
>       drm/mediatek: Add pm runtime support for ovl and rdma
> 
>  Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt |  9 -----
>  Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.txt    | 38 ---------------------
>  Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml   | 80 ++++++++++++++++++++++++++++++++++++++++++++
>  Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt    | 35 -------------------
>  Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml   | 72 +++++++++++++++++++++++++++++++++++++++
>  Documentation/devicetree/bindings/media/mediatek-mdp.txt             |  8 -----
>  Documentation/devicetree/bindings/media/mediatek-vcodec.txt          |  4 ---
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c                              |  8 ++++-
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c                             |  9 ++++-
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c                              | 15 +++++----
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c                          | 36 ++------------------
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h                          |  1 -
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c                               |  5 +--
>  drivers/iommu/mtk_iommu.c                                            | 34 +++++++++++++++++++
>  drivers/iommu/mtk_iommu_v1.c                                         | 42 ++++++++++++++++++++++-
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c                      | 45 ++-----------------------
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h                      |  2 --
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.c                        | 40 ----------------------
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.h                        |  2 --
>  drivers/media/platform/mtk-mdp/mtk_mdp_core.c                        |  1 -
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c               |  8 +++--
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c                | 46 ++++---------------------
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h                |  3 +-
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h                   |  3 --
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c                   |  1 -
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c               |  6 ++--
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c                | 52 ++++------------------------
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.h                |  3 +-
>  drivers/memory/mtk-smi.c                                             | 14 --------
>  include/soc/mediatek/smi.h                                           | 20 -----------
>  30 files changed, 277 insertions(+), 365 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.txt
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
> 

