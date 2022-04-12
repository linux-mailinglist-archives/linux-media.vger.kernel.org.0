Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94C664FE425
	for <lists+linux-media@lfdr.de>; Tue, 12 Apr 2022 16:48:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356745AbiDLOuX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Apr 2022 10:50:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232721AbiDLOuW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Apr 2022 10:50:22 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60AE15DE52
        for <linux-media@vger.kernel.org>; Tue, 12 Apr 2022 07:48:03 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id j6so13876834qkp.9
        for <linux-media@vger.kernel.org>; Tue, 12 Apr 2022 07:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=3MZkr+6AGGhh2wilkOJC36MlQuoGgugK+JrbjEbN57Y=;
        b=IQd+Pmi2ZNS9PVssEpKUMVlQPcNWnrUtmNOJW1/hUV9FB4rzUQU/yMmzCEulOcYAF+
         WXrfiCBX/kr7xSyIxkYguwbthBt8VNysL1LlN21BF48+DwHE/sA/7yIe2rzING14dFyn
         hGbro5hJWBQWhx8J9/yIdNGhEITNDBvXJndCuaeeV9RHI00QplS5KggM/DCtD1aQOEIC
         TD+8KbmadL39LeNLTbS3L/FIJlQQhTGV3TgTmfq3KboKPf37tr7UdQnPUoVSRNVdepIx
         jZCgoR7IxLKmxtn+WnF06R5JHiZBdVeMrpmfaLoudZs3ZUkKj2nIVMHFx92Kp/x5pXcm
         zl/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=3MZkr+6AGGhh2wilkOJC36MlQuoGgugK+JrbjEbN57Y=;
        b=N/jTRRS2iQlc3k73ohNBmbYES6FCqVQiJqg2mWM6UjxDG1WT1iFTOzjrv14eHoKnF2
         oqzrqe56cjQedXnuehUh4ve4vU3zyaNKLRCMNFt21xUWZTYbSwY5erXtkY4XImiSjRqu
         fKUIRzX1yxJTAnqWvgQ/OsGAtf+icKMjbiYnOgRdNtnIAUR4sJLwibOx6r4kKiNxF1Qn
         vZ2dMCtdhmkne1QgsMMgvvUo8dWf4GlJudUv1Qwu4S/mJjOjJqQM5O+hl2MmqYlLprUJ
         +jBTO0GwKiBh3dYPhfOkdZUzFCWVy89qKaZDubfF0kkDXQEbuNYDmPfr6tP1F2lrCM1u
         NNnQ==
X-Gm-Message-State: AOAM530dGF4fcTFbrk7eCNgY7XRVRmrqJQ1SnY2ZO9hiTHsjz9mhtW8V
        GkQchqDk9Q58GhZH0GeqDL4grQ==
X-Google-Smtp-Source: ABdhPJwS4ucfBcO2n57hQczTdCVsl7uQVZEt2vSvPcUheSl30xxBNh5ACGl33/S6Kt2SIWJWUeivfQ==
X-Received: by 2002:a05:620a:444a:b0:69c:3300:aaea with SMTP id w10-20020a05620a444a00b0069c3300aaeamr3337970qkp.38.1649774882384;
        Tue, 12 Apr 2022 07:48:02 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id 22-20020ac85756000000b002e1cabad999sm28179445qtx.89.2022.04.12.07.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 07:48:02 -0700 (PDT)
Message-ID: <c5dc9f759054418082849233639f727e39329550.camel@ndufresne.ca>
Subject: Re: [PATCH v8, 00/15] media: mtk-vcodec: support for M8192 decoder
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>
Cc:     George Sun <george.sun@mediatek.com>,
        Xiaoyong Lu <xiaoyong.lu@mediatek.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Irui Wang <irui.wang@mediatek.com>,
        Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com,
        linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Date:   Tue, 12 Apr 2022 10:48:00 -0400
In-Reply-To: <0f385e6e2d0687c3e6de12a576d1617af9504cee.camel@mediatek.com>
References: <20220331024801.29229-1-yunfei.dong@mediatek.com>
         <fbfe4572296a133492310f13e3f41db56218fc17.camel@ndufresne.ca>
         <0f385e6e2d0687c3e6de12a576d1617af9504cee.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0 (3.44.0-1.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le lundi 11 avril 2022 =C3=A0 11:41 +0800, yunfei.dong@mediatek.com a =C3=
=A9crit=C2=A0:
> Hi Nicolas,
>=20
> On Thu, 2022-03-31 at 16:48 -0400, Nicolas Dufresne wrote:
> > Hi Yunfei,
> >=20
> > thanks for the update, I should be testing this really soon.
> >=20
> > Le jeudi 31 mars 2022 =C3=A0 10:47 +0800, Yunfei Dong a =C3=A9crit :
> > > This series adds support for mt8192 h264/vp8/vp9 decoder drivers.
> > > Firstly, refactor
> > > power/clock/interrupt interfaces for mt8192 is lat and core
> > > architecture.
> >=20
> > Similarly to MT8173 and MT8183, a shared* firmware is needed for this
> > CODEC to
> > work (scp.img). I looked into linux-firmware[1] it has not been added
> > for mt8192
> > yet. As your patches are getting close to be ready, it would be
> > important to
> > look into this so the patchset does not get blocked due to that.
> >=20
> > best regards,
> > Nicolas
> >=20
> > [1]=20
> > https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware=
.git/tree/mediatek
> > * Shared at least between MDP3 and MTK VCODEC from my knowledge
> >=20
>=20
> Thanks for your remind.
>=20
> I have already sent mt8192 scp.img to github.
>=20
> https://github.com/yunfeidongmediatek/linux_fw_scp_8192/commit/3ac2fc85bc=
7dfcebdb92b5b5808b0268cdfb772d
>=20
> Waiting for to be merged.

On boards I have, the firmware is loaded from /lib/firmware/scp.img, but wi=
th
this submission it will be in lib/firmware/mediatek/mt8192/scp.img . I have=
n't
found anything around:

 drivers/remoteproc/mtk_scp.c:812:       char *fw_name =3D "scp.img";

That would use the platform path. This seems like a problem to me, the
upstreaming of the firmware isn't being aligned with the were the firmware =
is
picked by the upstream driver. Correct me if I got this wrong, but I'd real=
ly
like to clarify this.

Nicolas

>=20
> Best Regards,
> Yunfei Dong
>=20
> > >=20
> > > Secondly, add new functions to get frame buffer size and resolution
> > > according
> > > to decoder capability from scp side. Then add callback function to
> > > get/put
> > > capture buffer in order to enable lat and core decoder in parallel,
> > > need to
> > > adjust GStreamer at the same time.=20
> > >=20
> > > Then add to support MT21C compressed mode and fix v4l2-compliance
> > > fail.
> > >=20
> > > Next, extract H264 request api driver to let mt8183 and mt8192 use
> > > the same
> > > code, and adds mt8192 frame based h264 driver for stateless
> > > decoder.
> > >=20
> > > Lastly, add vp8 and vp9 stateless decoder drivers.
> > >=20
> > > Patches 1 refactor power/clock/interrupt interface.
> > > Patches 2~4 get frame buffer size and resolution according to
> > > decoder capability.
> > > Patches 5 set capture queue bytesused.
> > > Patches 6 adjust GStreamer.
> > > Patch 7~11 add to support MT21C compressed mode and fix v4l2-
> > > compliance fail.
> > > patch 12 record capture queue format type.
> > > Patch 13~14 extract h264 driver and add mt8192 frame based driver
> > > for h264 decoder.
> > > Patch 15~16 add vp8 and vp9 stateless decoder drivers.
> > > Patch 17 prevent kernel crash when rmmod mtk-vcodec-dec.ko
> > > ---
> > > changes compared with v6:
> > > - adjust GStreamer, separate src buffer done with
> > > v4l2_ctrl_request_complete for patch 6.
> > > - remove v4l2_m2m_set_dst_buffered.
> > > - add new patch to set each plane bytesused in buf prepare for
> > > patch 5.
> > > - using upstream interface to update vp9 prob tables for patch 16.
> > > - fix maintainer comments.
> > > - test the driver with chrome VD and GStreamer(H264/VP9/VP8/AV1).
> > > changes compared with v6:
> > > - rebase to the latest media stage and fix conficts
> > > - fix memcpy to memcpy_fromio or memcpy_toio
> > > - fix h264 crash when test field bitstream
> > > changes compared with v5:
> > > - fix vp9 comments for patch 15
> > > - fix vp8 comments for patch 14.
> > > - fix comments for patch 12.
> > > - fix build errors.
> > > changes compared with v4:
> > > - fix checkpatch.pl fail.
> > > - fix kernel-doc fail.
> > > - rebase to the latest media codec driver.
> > > changes compared with v3:
> > > - remove enum mtk_chip for patch 2.
> > > - add vp8 stateless decoder drivers for patch 14.
> > > - add vp9 stateless decoder drivers for patch 15.
> > > changes compared with v2:
> > > - add new patch 11 to record capture queue format type.
> > > - separate patch 4 according to tzung-bi's suggestion.
> > > - re-write commit message for patch 5 according to tzung-bi's
> > > suggestion.
> > > changes compared with v1:
> > > - rewrite commit message for patch 12.
> > > - rewrite cover-letter message.
> > > ---
> > > Yunfei Dong (17):
> > >   media: mediatek: vcodec: Add vdec enable/disable hardware helpers
> > >   media: mediatek: vcodec: Using firmware type to separate
> > > different
> > >     firmware architecture
> > >   media: mediatek: vcodec: get capture queue buffer size from scp
> > >   media: mediatek: vcodec: Read max resolution from dec_capability
> > >   media: mediatek: vcodec: set each plane bytesused in buf prepare
> > >   media: mediatek: vcodec: Refactor get and put capture buffer flow
> > >   media: mediatek: vcodec: Refactor supported vdec formats and
> > >     framesizes
> > >   media: mediatek: vcodec: Getting supported decoder format types
> > >   media: mediatek: vcodec: Add format to support MT21C
> > >   media: mediatek: vcodec: disable vp8 4K capability
> > >   media: mediatek: vcodec: Fix v4l2-compliance fail
> > >   media: mediatek: vcodec: record capture queue format type
> > >   media: mediatek: vcodec: Extract H264 common code
> > >   media: mediatek: vcodec: support stateless H.264 decoding for
> > > mt8192
> > >   media: mediatek: vcodec: support stateless VP8 decoding
> > >   media: mediatek: vcodec: support stateless VP9 decoding
> > >   media: mediatek: vcodec: prevent kernel crash when rmmod
> > >     mtk-vcodec-dec.ko
> > >=20
> > >  .../media/platform/mediatek/vcodec/Makefile   |    4 +
> > >  .../platform/mediatek/vcodec/mtk_vcodec_dec.c |   62 +-
> > >  .../mediatek/vcodec/mtk_vcodec_dec_drv.c      |    8 +-
> > >  .../mediatek/vcodec/mtk_vcodec_dec_pm.c       |  166 +-
> > >  .../mediatek/vcodec/mtk_vcodec_dec_pm.h       |    6 +-
> > >  .../mediatek/vcodec/mtk_vcodec_dec_stateful.c |   19 +-
> > >  .../vcodec/mtk_vcodec_dec_stateless.c         |  257 +-
> > >  .../platform/mediatek/vcodec/mtk_vcodec_drv.h |   41 +-
> > >  .../mediatek/vcodec/mtk_vcodec_enc_drv.c      |    5 -
> > >  .../platform/mediatek/vcodec/mtk_vcodec_fw.c  |    6 +
> > >  .../platform/mediatek/vcodec/mtk_vcodec_fw.h  |    1 +
> > >  .../vcodec/vdec/vdec_h264_req_common.c        |  310 +++
> > >  .../vcodec/vdec/vdec_h264_req_common.h        |  272 +++
> > >  .../mediatek/vcodec/vdec/vdec_h264_req_if.c   |  438 +---
> > >  .../vcodec/vdec/vdec_h264_req_multi_if.c      |  619 +++++
> > >  .../mediatek/vcodec/vdec/vdec_vp8_req_if.c    |  437 ++++
> > >  .../vcodec/vdec/vdec_vp9_req_lat_if.c         | 2072
> > > +++++++++++++++++
> > >  .../platform/mediatek/vcodec/vdec_drv_if.c    |   37 +-
> > >  .../platform/mediatek/vcodec/vdec_drv_if.h    |    3 +
> > >  .../platform/mediatek/vcodec/vdec_ipi_msg.h   |   36 +
> > >  .../platform/mediatek/vcodec/vdec_msg_queue.c |    2 +
> > >  .../platform/mediatek/vcodec/vdec_msg_queue.h |    2 +
> > >  .../platform/mediatek/vcodec/vdec_vpu_if.c    |   53 +-
> > >  .../platform/mediatek/vcodec/vdec_vpu_if.h    |   15 +
> > >  .../platform/mediatek/vcodec/venc_vpu_if.c    |    2 +-
> > >  include/linux/remoteproc/mtk_scp.h            |    2 +
> > >  26 files changed, 4274 insertions(+), 601 deletions(-)
> > >  create mode 100644
> > > drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_common.c
> > >  create mode 100644
> > > drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_common.h
> > >  create mode 100644
> > > drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.
> > > c
> > >  create mode 100644
> > > drivers/media/platform/mediatek/vcodec/vdec/vdec_vp8_req_if.c
> > >  create mode 100644
> > > drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
> > >=20
> >=20
> >=20
>=20

