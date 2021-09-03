Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D5BB3FFDC0
	for <lists+linux-media@lfdr.de>; Fri,  3 Sep 2021 12:02:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348960AbhICKDE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Sep 2021 06:03:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232273AbhICKDD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Sep 2021 06:03:03 -0400
Received: from lb1-smtp-cloud8.xs4all.net (lb1-smtp-cloud8.xs4all.net [IPv6:2001:888:0:108::1b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14895C061575;
        Fri,  3 Sep 2021 03:02:02 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id M61HmNBXEy7WyM61ImA25b; Fri, 03 Sep 2021 12:02:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1630663321; bh=SRflGCsppmO0173u0vbVLikNVn3Vp+4tX2mgI1k4N7E=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=id3YnJvIRyPcG6LArWNN7rTw+cZcnzGrS4gjeWgSGQGrf/7ziudlG98EP2SF5Lq7k
         e244DLqs3UmKlibv21OtTtBrRMVecVo85UADhJPB3ILeN71B1hZFfYBc0fo08WaCOs
         LS2xOk8dKeOK8RPYANf9/XNtGsQNfwVP8GhX5K9LAlEamRrTKddUSzwvOIlxDvLdiD
         pvmteuGp2jZkfqjf6pGZGhJzBuay6L2agr1DxTOvgLRAan+DP2DD3BCaXfKL+eHuWv
         CJcDLhjKuncvTkPvg9YA7icAQ/eCrxAEKyYnpxRRcWECS0yiz7zJMi9LB1DiDGLxVL
         0dVlzyAZl+qDQ==
Subject: Re: [PATCH v7 0/5] media: mediatek: support mdp3 on mt8183 platform
To:     Moudy Ho <moudy.ho@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     Maoguang Meng <maoguang.meng@mediatek.com>,
        daoyuan huang <daoyuan.huang@mediatek.com>,
        Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Landley <rob@landley.net>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org, drinkcat@chromium.org, acourbot@chromium.org,
        pihsun@chromium.org, menghui.lin@mediatek.com,
        sj.huang@mediatek.com, ben.lok@mediatek.com, randy.wu@mediatek.com,
        srv_heupstream@mediatek.com, hsinyi@google.com
References: <20210824100027.25989-1-moudy.ho@mediatek.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <0a50c059-bb13-0823-778c-b631ed07d76f@xs4all.nl>
Date:   Fri, 3 Sep 2021 12:01:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210824100027.25989-1-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfEH56PgjyKgFIXfYvz2MnFTScei25eHA6qQX3KIqn3Bb9tJST1TRAX568YGBCzK27zfZdzUt3kcs9W1dYMiLRqetgYDe1zqQALJuNnXX8IAYXavEEbfC
 IDBXrbb8vrJq4wRlmdr9ldDfD1ZuO2fTwP+wJX9fy81NZHYqVg6MoLD31RxsDcmsSOeuoNpS28O5hV3eByHbH3ao4zCiola8AptRPpzpll51bY6Ne3ckMSIi
 ChGrit0OoR4gtA1C0oD4svCziKukr0AIX5w+Lb8LFeclLS6Pz06pi90M/y5Q6+sh+sNRIEWYnWevymqz3zL2zUUVT6+Hja1+V+/ChcQ++z6wXgFKjoQpnS5V
 sRDKipBAYkLQL5edB0y2fNDKlsow4t4ginHthPg4fGXOKj3+2X5mh2+tZbf/c/OMcfXBulH+qykD0a0nUIHy4sdCyxIUjfabZZ7f+EQ0/biI6erxUyqvAcco
 M4V0AlQgYB0++0vzPXruOz+0iAwTz8a7JmSbGVeisoK5I4xmn3A5kAKy/GD9P5PgfY0EskSPtnR2Q4fivI8mgheaUQvJSX9WnAeSg0YVES6/F8eZ4sACEHw4
 PnuQmug2rbAt39u36RRlwy/MX8FdZksLdD7ZzufPX0ltNPcYH+f5FK6rTASq063+DTtZg3zM4cMxvBb9n1xeo1fnn+AdAeVcvMaAylDnl8VKoBYHpqbmxabv
 0CNL+1tlrIiBFAb40AOmQxV4EwH10lQgW5pAXSRKOjZv2pQCQhXDagQrt/Wh4vIYGc51q5PJfRl0JRsw/UQm/FPqV8cB4Nkg4rylEGeyOovi8J0PqCzRh8jj
 wJ4VcHvqCd0ujGtMbugNaBOu3ebFDgD+8vBGoVGpwqQZ19soQmK9Tzf5OB94ouG1Vio7e9DnpjT8M+v1ArXx0/CQBQXXq7AU9puZ2ob6GWWQzRLdYV5g2+nJ
 Crg82HPY/3a+sLEZ+TX1eMSFEGTdkKBjCy22cZc4c5io8ivH1EzFg3uaH0srOthd8lMF6xw8oQqC+DH/uGN51uFqsk1OZE8/PBHAUsYkWQRjaJq957HG/Hbt
 6SJ0yySEf2Tjgm9DajRYzBQXTya3D0qry0bPNLgs69hqGfxfa8nArMh+aYto7knDHymJITXwE6/3TXer56wruqX9zvi6QwjxQR+YWZyxqDXYWXfPQUZ/ONEQ
 e8x+fsY5wrcbzK6xW3Gw2g==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Moudy,

Can you provide the 'v4l2-compliance -s' output?

Make sure to compile v4l2-compliance from the latest code base:
https://git.linuxtv.org/v4l-utils.git/

Compiling on x86_64 (so using COMPILE_TEST) fails:

  LD      .tmp_vmlinux.kallsyms1
ld: drivers/media/platform/mtk-mdp3/mtk-mdp3-core.o: in function `mdp_probe':
mtk-mdp3-core.c:(.text+0x415): undefined reference to `mtk_mutex_mdp_get'
ld: drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.o: in function `config_camin_subfrm':
mtk-mdp3-comp.c:(.text+0x9b): undefined reference to `mtk_mmsys_mdp_camin_ctrl'
ld: mtk-mdp3-comp.c:(.text+0xbc): undefined reference to `mtk_mmsys_mdp_camin_ctrl'
ld: drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.o: in function `mdp_component_deinit':
mtk-mdp3-comp.c:(.text+0x2707): undefined reference to `mtk_mutex_put'
ld: drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.o: in function `init_isp.cold':
mtk-mdp3-comp.c:(.text.unlikely+0x4f): undefined reference to `mtk_mmsys_mdp_isp_ctrl'
ld: mtk-mdp3-comp.c:(.text.unlikely+0x7a): undefined reference to `mtk_mmsys_mdp_isp_ctrl'
ld: drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.o: in function `mdp_auto_release_work':
mtk-mdp3-cmdq.c:(.text+0x13): undefined reference to `mtk_mutex_unprepare'
ld: drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.o: in function `mdp_path_subfrm_require':
mtk-mdp3-cmdq.c:(.text+0x45e): undefined reference to `mtk_mutex_add_mdp_mod'
ld: drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.o: in function `mdp_path_subfrm_run.isra.0':
mtk-mdp3-cmdq.c:(.text+0x78b): undefined reference to `mtk_mutex_enable_by_cmdq'
ld: drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.o: in function `mdp_path_config_subfrm':
mtk-mdp3-cmdq.c:(.text+0xa0d): undefined reference to `mtk_mmsys_mdp_connect'
ld: mtk-mdp3-cmdq.c:(.text+0xd08): undefined reference to `mtk_mmsys_mdp_disconnect'
ld: drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.o: in function `mdp_cmdq_send':
(.text+0x1358): undefined reference to `mtk_mutex_prepare'
ld: drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.o: in function `mdp_handle_cmdq_callback.cold':
mtk-mdp3-cmdq.c:(.text.unlikely+0x34): undefined reference to `mtk_mutex_unprepare'
ld: drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.o: in function `mdp_cmdq_send.cold':
mtk-mdp3-cmdq.c:(.text.unlikely+0xe3): undefined reference to `mtk_mutex_unprepare'
make: *** [Makefile:1177: vmlinux] Error 1

I also get compile warnings:

drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c: In function ‘mdp_sub_comps_create’:
drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c:1151:29: warning: implicit conversion from ‘enum mtk_mdp_comp_id’ to ‘enum mdp_comp_type’ [-Wenum-conversion]
 1151 |   enum mdp_comp_type type = MDP_COMP_NONE;
      |                             ^~~~~~~~~~~~~
drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c: In function ‘mdp_component_init’:
drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c:1217:6: warning: unused variable ‘i’ [-Wunused-variable]
 1217 |  int i, ret;
      |      ^
drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c: In function ‘mdp_cmdq_send’:
drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c:489:1: warning: the frame size of 1312 bytes is larger than 1024 bytes [-Wframe-larger-than=]
  489 | }
      | ^

Regards,

	Hans

On 24/08/2021 12:00, Moudy Ho wrote:
> Changes since v6:
> - Refactor GCE event to corresponding node.
> - Fix dt_binding_check fail.
> - Fix compilation errors.
> 
> Changes since v5:
> - Rebase on v5.14-rc6.
> - Move MMSYS/Mutex settings to corresponding driver.
> - Revise the software license description and copyright.
> - Remove unnecessary enum. or definitions.
> - Optimize platform/chip definition conditions.
> - Use general printing functions instead of MDP3 private ones.
> - Fix compile warning.
> 
> Changes since v4:
> - Rebase on v5.13-rc1.
> - Remove the CMDQ flush flow to match the CMDQ API change.
> - Integrate four of MDP's direct-link subcomponents into MDP controller node
>   from syscon node to avoid illegal clock usage.
> - Rewrite dt-binding in a JSON compatible subset of YAML
> - Fix a bit of macro argument precedence.
> 
> Changes since v3:
> - Rebase on v5.9-rc1.
> - modify code for review comment from Rob Herring, cancel multiple nodes using
>   same register base situation.
> - control IOMMU port through pm runtime get/put to DMA components' device.
> - SCP(VPU) driver revision.
> - stop queuing jobs(remove flush_workqueue()) after mdp_m2m_release().
> - add computation of plane address with data_offset.
> - fix scale ratio check issue.
> - add default v4l2_format setting.
> 
> Changes since v2:
> - modify code for review comment from Tomasz Figa & Alexandre Courbot
> - review comment from Rob Herring will offer code revision in v4, due to
>   it's related to device node modification, will need to modify code
>   architecture
> 
> Changes since v1:
> - modify code for CMDQ v3 API support
> - EC ipi cmd migration
> - fix compliance test fail item (m2m cmd with -f) due to there is two problem in runing all format(-f) cmd:
> 1. out of memory before test complete
>         Due to capture buffer mmap (refcount + 1) after reqbuf but seems
>         no corresponding munmap called before device close.
>         There are total 12XX items(formats) in format test and each format
>         alloc 8 capture/output buffers.
> 2. unceasingly captureBufs() (randomly)
>         Seems the break statement didn't catch the count == 0 situation:
>         In v4l2-test-buffers.cpp, function: captureBufs()
>                         ...
>                         count--;
>                         if (!node->is_m2m && !count)
>                                 break;
>         Log is as attachment
> 
> I will paste the test result with problem part in another e-mail
> 
> Hi,
> 
> This is the first version of RFC patch for Media Data Path 3 (MDP3),
> MDP3 is used for scaling and color format conversion.
> support using GCE to write register in critical time limitation.
> support V4L2 m2m device control.
> 
> Moudy Ho (5):
>   soc: mediatek: mutex: add support for MDP
>   soc: mediatek: mmsys: Add support for MDP
>   dt-binding: mt8183: Add Mediatek MDP3 dt-bindings
>   dts: arm64: mt8183: Add Mediatek MDP3 nodes
>   media: platform: mtk-mdp3: Add Mediatek MDP3 driver
> 
>  .../bindings/media/mediatek,mdp3-ccorr.yaml   |   57 +
>  .../bindings/media/mediatek,mdp3-rdma.yaml    |  207 +++
>  .../bindings/media/mediatek,mdp3-rsz.yaml     |   65 +
>  .../bindings/media/mediatek,mdp3-wdma.yaml    |   71 +
>  .../bindings/media/mediatek,mdp3-wrot.yaml    |   71 +
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  110 ++
>  drivers/media/platform/Kconfig                |   19 +
>  drivers/media/platform/Makefile               |    2 +
>  drivers/media/platform/mtk-mdp3/Makefile      |    6 +
>  .../media/platform/mtk-mdp3/mdp_reg_ccorr.h   |   19 +
>  drivers/media/platform/mtk-mdp3/mdp_reg_isp.h |   27 +
>  .../media/platform/mtk-mdp3/mdp_reg_rdma.h    |   65 +
>  drivers/media/platform/mtk-mdp3/mdp_reg_rsz.h |   39 +
>  .../media/platform/mtk-mdp3/mdp_reg_wdma.h    |   47 +
>  .../media/platform/mtk-mdp3/mdp_reg_wrot.h    |   55 +
>  drivers/media/platform/mtk-mdp3/mtk-img-ipi.h |  280 ++++
>  .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.c   |  507 +++++++
>  .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.h   |   46 +
>  .../media/platform/mtk-mdp3/mtk-mdp3-comp.c   | 1307 +++++++++++++++++
>  .../media/platform/mtk-mdp3/mtk-mdp3-comp.h   |  147 ++
>  .../media/platform/mtk-mdp3/mtk-mdp3-core.c   |  329 +++++
>  .../media/platform/mtk-mdp3/mtk-mdp3-core.h   |   75 +
>  .../media/platform/mtk-mdp3/mtk-mdp3-m2m.c    |  801 ++++++++++
>  .../media/platform/mtk-mdp3/mtk-mdp3-m2m.h    |   41 +
>  .../media/platform/mtk-mdp3/mtk-mdp3-regs.c   |  746 ++++++++++
>  .../media/platform/mtk-mdp3/mtk-mdp3-regs.h   |  372 +++++
>  .../media/platform/mtk-mdp3/mtk-mdp3-vpu.c    |  312 ++++
>  .../media/platform/mtk-mdp3/mtk-mdp3-vpu.h    |   78 +
>  drivers/soc/mediatek/mt8183-mmsys.h           |  235 +++
>  drivers/soc/mediatek/mtk-mmsys.c              |  164 +++
>  drivers/soc/mediatek/mtk-mmsys.h              |    9 +-
>  drivers/soc/mediatek/mtk-mutex.c              |  106 +-
>  include/linux/soc/mediatek/mtk-mmsys.h        |   81 +
>  include/linux/soc/mediatek/mtk-mutex.h        |    8 +
>  34 files changed, 6495 insertions(+), 9 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-ccorr.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-wdma.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
>  create mode 100644 drivers/media/platform/mtk-mdp3/Makefile
>  create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_ccorr.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_isp.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_rdma.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_rsz.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_wdma.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_wrot.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-img-ipi.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.c
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.h
> 

