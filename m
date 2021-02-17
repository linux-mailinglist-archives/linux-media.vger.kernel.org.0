Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F46F31D7E6
	for <lists+linux-media@lfdr.de>; Wed, 17 Feb 2021 12:08:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231320AbhBQLGK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Feb 2021 06:06:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231360AbhBQLFX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Feb 2021 06:05:23 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FC1DC061574
        for <linux-media@vger.kernel.org>; Wed, 17 Feb 2021 03:04:43 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id z68so8287139pgz.0
        for <linux-media@vger.kernel.org>; Wed, 17 Feb 2021 03:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BtOBKP8Jtor+YFs8+p9bqhmg075DZ0P/iwFiIwD9A2g=;
        b=Cxl9mh/nNdhHmXNmwVji5GwMLL9JBYVG+4D2OZfwY9ZeaL1hE7TR6qKf5K73J4boQ7
         cdoLkeETORFg7/mmDvC15V48vd03QROM3VjMeElcHYN/m/qU5OKi+vnKxxZkAarSU6kx
         SeW6addBNiGDnf0xOtPG5zNBg1FR8hcONUzPskboGhX5YDT45J4kdfvOsKp9tl6cZHmE
         6/DU12CsOb4MgzSIhYWt820L03/mGUdpJncV9LakcSD0qKnBCHuNQRa4icWBJwRqbAHu
         zKU/774378Cns+YNYxg20bGRyMLw40lj3Z6/u+Mde4GVw3wL5xWS8O9SoIFR+HegP6j7
         ztfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BtOBKP8Jtor+YFs8+p9bqhmg075DZ0P/iwFiIwD9A2g=;
        b=V2oF7Z0dvw5nJelkc/OodN2P6LRugrMfUUXUpfyYbUOn9xKbFQJr9TIwojCN6XNkJs
         NILy8M7JPTmQnb2xdlo2iXPi7P9TwBOGFAM3qLi/qsar3BcsIteSwJiCA7NsGGAeeet0
         NalrsNf4/64c3rmH+zwGhEU5ZlEIoLXsLuwQqpAWZ6LqJP+FeVOOJMs6yBnOEzR3zGpd
         W24tsQnabU9C55FuNq92ahGc8dtS0ad13D/t7bnG7gYy5x6JbI0lpb1y7AyrSB7ddbQW
         GzexfcYGsNa8zLkCPVKiKgjVVlkv+zJcbWHvfzq/SG0VlAmM1gNu4BoAm1xM5dKVxE4x
         +AcA==
X-Gm-Message-State: AOAM530OS8Zmr2mWadBe/9e+9uN2tHZDyIypPbIjOZIrkHm+z1YLJU/w
        BJz4p7LXCKPYvbFob5boUFrw/QdHC8bt8NcJRkFddQ==
X-Google-Smtp-Source: ABdhPJzpn6zQ++Oa7twNCZoZBN9ALCsJx2Sl4V5XqFDzuStU+9Sb9kYoOynwDY6X2yG33kXGQNhOba8xVA2ndH4maSs=
X-Received: by 2002:aa7:9281:0:b029:1ec:48b2:811c with SMTP id
 j1-20020aa792810000b02901ec48b2811cmr9331621pfa.18.1613559882353; Wed, 17 Feb
 2021 03:04:42 -0800 (PST)
MIME-Version: 1.0
References: <20210205104414.299732-1-robert.foss@linaro.org> <5fea18b2-307b-2b45-4bc7-d327022642b0@linaro.org>
In-Reply-To: <5fea18b2-307b-2b45-4bc7-d327022642b0@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Wed, 17 Feb 2021 12:04:31 +0100
Message-ID: <CAG3jFyve8jAzt5Zm9UidVSJtJWdDymk9wCAwBOZS36ap54SVrA@mail.gmail.com>
Subject: Re: [PATCH v4 00/22] Add support for the SDM845 Camera Subsystem
To:     Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Todor Tomov <todor.too@gmail.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        angelogioacchino.delregno@somainline.org,
        linux-media <linux-media@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 10 Feb 2021 at 21:14, Andrey Konovalov
<andrey.konovalov@linaro.org> wrote:
>
> Hi Robert,
>
> On 05.02.2021 13:43, Robert Foss wrote:
> > This series implements support for the camera subsystem found in
> > the SDM845 SOCs and the Titan 170 ISP. The support is partial
> > in that it implements CSIPHY, CSID, and partial VFE support.
> >
> > The Titan generation of the ISP diverges a fair amount from the
> > design of the previous architecture generation, CAMSS. As a result
> > some pretty invasive refactoring is done in this series. It also
> > means that at this time we're unable to implement support for all
> > of the IP blocks contained. This is due to a combination of legal
> > considerations with respect to the IP and its owner Qualcomm and
> > time & man hour constrains on the Linaro side.
> >
> > The CSIPHY (CSI Physical Layer) & CSID (CSI Decoder) support is
> > complete, but the VFE (Video Front End, which is referred to as IFE
> > (Image Front End) in the Titan generation of ISPs) only has support
> > for the RDI (Raw Dump Interface) which allows the raw output of
> > the CSID to be written to memory.
> >
> > The 2nd interface implemented in the VFE silicon is the PIX
> > interface, and camss does not support it for this generation of ISPs.
> > The reason for this is that the PIX interface is used for sending
> > image data to the BPS (Bayer Processing Section) & IPE (Image
> > Processing Engine), but both of these units are beyond the scope
> > of enabling basic ISP functionality for the SDM845.
>
> The problem is that for SDM845 the topology printed by media-ctl
> still has the PIX devices. That is even though the PIX interface is not
> supported for SDM845 in this driver, the msm_vfeN_pix subdevices
> and the corresponding msm_vfeN_video3 devices are still created.
> Your patchset is currently missing changes to the hardcoded:
>
> #define MSM_VFE_LINE_NUM 4
>
> struct vfe_device {
> ...
>          struct vfe_line line[MSM_VFE_LINE_NUM];
> ...
> };
>
> in drivers/media/platform/qcom/camss/camss-vfe.h.

I had a look through the driver and made the line number variable for
the different versions of hardware. This required touching most of the
vfe related compilation units, but was a pretty mechanical change.

Thanks for spotting this issue.

>
>
> Thanks,
> Andrey
>
> > Since the Titan architecture generation diverges quite a bit from
> > the CAMSS generation, a lot of pretty major refactoring is carried
> > out in this series. Both the CSID & VFE core paths are made more
> > general and hardware version specific parts are broken out.
> > The CSIPHY didn't require quite as radical changes and therefore
> > keeps its current form.
> >
> > Tested on:
> >   - Qcom RB3 / db845c + camera mezzanine, which is SDM845 based
> >   - db410c + D3 Camera mezzanine, which is APQ8016 based
> >
> > Branch:
> >   - https://git.linaro.org/people/robert.foss/linux.git/log/?h=camss_sdm845_v1
> >   - https://git.linaro.org/people/robert.foss/linux.git/log/?h=camss_sdm845_v2
> >   - https://git.linaro.org/people/robert.foss/linux.git/log/?h=camss_sdm845_v3
> >
> >
> > Due to the dt-bindings supporting sdm660-camss, this series depends
> > the sdm660 clock driver being upstreamed. I've linked this series below.
> >
> > SDM630/660 Multimedia and GPU clock controllers
> > https://lkml.org/lkml/2020/9/26/166
> >
> >
> > Robert Foss (22):
> >    media: camss: Fix vfe_isr_comp_done() documentation
> >    media: camss: Fix vfe_isr comment typo
> >    media: camss: Replace trace_printk() with dev_dbg()
> >    media: camss: Add CAMSS_845 camss version
> >    media: camss: Make ISPIF subdevice optional
> >    media: camss: Refactor VFE HW version support
> >    media: camss: Add support for VFE hardware version Titan 170
> >    media: camss: Add missing format identifiers
> >    media: camss: Refactor CSID HW version support
> >    media: camss: Add support for CSID hardware version Titan 170
> >    media: camss: Add support for CSIPHY hardware version Titan 170
> >    media: camss: Remove per VFE power domain toggling
> >    media: camss: Enable SDM845
> >    dt-bindings: media: camss: Add qcom,msm8916-camss binding
> >    dt-bindings: media: camss: Add qcom,msm8996-camss binding
> >    dt-bindings: media: camss: Add qcom,sdm660-camss binding
> >    dt-bindings: media: camss: Add qcom,sdm845-camss binding
> >    MAINTAINERS: Change CAMSS documentation to use dtschema bindings
> >    media: dt-bindings: media: Remove qcom,camss documentation
> >    arm64: dts: sdm845: Add CAMSS ISP node
> >    arm64: dts: sdm845-db845c: Configure regulators for camss node
> >    arm64: dts: sdm845-db845c: Enable ov8856 sensor and connect to ISP
> >
> >   .../devicetree/bindings/media/qcom,camss.txt  |  236 ----
> >   .../bindings/media/qcom,msm8916-camss.yaml    |  256 ++++
> >   .../bindings/media/qcom,msm8996-camss.yaml    |  387 ++++++
> >   .../bindings/media/qcom,sdm660-camss.yaml     |  398 ++++++
> >   .../bindings/media/qcom,sdm845-camss.yaml     |  370 ++++++
> >   MAINTAINERS                                   |    2 +-
> >   arch/arm64/boot/dts/qcom/sdm845-db845c.dts    |   23 +-
> >   arch/arm64/boot/dts/qcom/sdm845.dtsi          |  135 ++
> >   drivers/media/platform/qcom/camss/Makefile    |    6 +
> >   .../platform/qcom/camss/camss-csid-170.c      |  602 +++++++++
> >   .../platform/qcom/camss/camss-csid-4-1.c      |  338 +++++
> >   .../platform/qcom/camss/camss-csid-4-7.c      |  406 ++++++
> >   .../media/platform/qcom/camss/camss-csid.c    |  620 +--------
> >   .../media/platform/qcom/camss/camss-csid.h    |  178 ++-
> >   .../qcom/camss/camss-csiphy-3ph-1-0.c         |  182 ++-
> >   .../media/platform/qcom/camss/camss-csiphy.c  |   66 +-
> >   .../media/platform/qcom/camss/camss-ispif.c   |  117 +-
> >   .../media/platform/qcom/camss/camss-ispif.h   |    3 +-
> >   .../media/platform/qcom/camss/camss-vfe-170.c |  804 ++++++++++++
> >   .../media/platform/qcom/camss/camss-vfe-4-1.c |  123 +-
> >   .../media/platform/qcom/camss/camss-vfe-4-7.c |  244 ++--
> >   .../media/platform/qcom/camss/camss-vfe-4-8.c | 1164 +++++++++++++++++
> >   .../platform/qcom/camss/camss-vfe-gen1.c      |  763 +++++++++++
> >   .../platform/qcom/camss/camss-vfe-gen1.h      |  110 ++
> >   drivers/media/platform/qcom/camss/camss-vfe.c |  840 +-----------
> >   drivers/media/platform/qcom/camss/camss-vfe.h |  118 +-
> >   .../media/platform/qcom/camss/camss-video.c   |  100 ++
> >   drivers/media/platform/qcom/camss/camss.c     |  419 ++++--
> >   drivers/media/platform/qcom/camss/camss.h     |   17 +-
> >   29 files changed, 6965 insertions(+), 2062 deletions(-)
> >   delete mode 100644 Documentation/devicetree/bindings/media/qcom,camss.txt
> >   create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
> >   create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
> >   create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml
> >   create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
> >   create mode 100644 drivers/media/platform/qcom/camss/camss-csid-170.c
> >   create mode 100644 drivers/media/platform/qcom/camss/camss-csid-4-1.c
> >   create mode 100644 drivers/media/platform/qcom/camss/camss-csid-4-7.c
> >   create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-170.c
> >   create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-4-8.c
> >   create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-gen1.c
> >   create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-gen1.h
> >
