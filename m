Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DDCE337D61
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 20:13:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230094AbhCKTMv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 14:12:51 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:40475 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229468AbhCKTMZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 14:12:25 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id KQjKlQWuJ5C8yKQjNlfErW; Thu, 11 Mar 2021 20:12:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615489943; bh=jk3KFORsdoULFCQY1pt6PvEead1RbtI/irjhv68FkYM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=ko6gjTQLni7SxWABVUywqs4rFTQf7FHqQBgtiJMxdF8frbZnhwuDPiwD77C6qZR+1
         QQpWGRSd4CHYs4vZqQICxlJVihTk07cf0r49syhQ3vLdXlEtVnWa9+NhixU0lWNf8E
         HdrjZcGmTo5O5g92bYUniyZGXiswXzUL7IT3NRkAMfZD2sNZ3X0jQm/uYibQLXlSgm
         eIO86WxvzrgYVpMOJtfNlUj/5ty4YgcXtOh1trg+uzPalAHoqQrNS1aneYWEzfLLFw
         pzomxZWhxOe0FF8r92l3iQehufazAYx3MzYuHDt/angqVDipvlsX8Y2+Dfj8/NmfiH
         MlgqVCMZoNshQ==
Subject: Re: [PATCH v7 00/22] Add support for the SDM845 Camera Subsystem
To:     Robert Foss <robert.foss@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, todor.too@gmail.com,
        mchehab@kernel.org, robh+dt@kernel.org,
        angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
References: <20210311180948.268343-1-robert.foss@linaro.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <9e914313-d849-5a0b-32d5-40e033893f9d@xs4all.nl>
Date:   Thu, 11 Mar 2021 20:12:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210311180948.268343-1-robert.foss@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfAeCAfSirAa7RsGMWZR6ureGve87gDeIjw31FPYfPyCuCmTFa4f11Szx4DyP4xnD9tsfJqxmE93V/sEmmtNxn0/Pcl21tLv7reUt3lsXZueGlgmw5+VD
 Kf/qj19eJlF0adbJbxJXi2XZ6MyCEoH4tNdFD+dDvajQqIm1xfsj15FMc/nViTxl5HwheUzCCEM56BZDWhk6zCZ2Yyo+RSqUCzDYEkun3+4T7Ojit3PAqDNL
 8DTbdxqKk0USrCzkX4fGWGpEkU63nLv5jrbJI1ohkBJWjmQlPicCQR976XHj8k8HFaHdN2XbtnhPsQBCpYr/XJRTUB4iv9ps8CIGIIkcSr648jFiJazskcXP
 7xIDGVO8R//roCTyaWNBTd+oxRsLJwUW2J1S44q4Goxdrd+u7ocaW7kzd4zkCyaRnNZ4M1HXvaanbG0+SlSzr07876DcRRgMQQ+/P5JeQ3yMNdu7n83itKYz
 yOKmUX78TiYx43yhm/eGxD7f659jGZ3wEGHkYAch8oi2fyOQJKxHd9jp16RXv2FuFKEN+VpF2raMb9hV5AKVvgJJpH8IowgPpznPoHPxuPf8ubpiN4v/t4Yw
 BRA7yHJJYmZB+gBO+m7tUmJnJifrXM7Sz7JOM8b7/uGml94YXy8YYbd8Yl0klufsccW5a7dzA243AFgzxZFOhLA7vuXrLuZ92UByU/y9A4BsqpoCEnko9PcJ
 TKiLWywg1Cjla9Fr5+zA1O3GWBIPVKxSF0VaNAuJEJ2oquCDsF7YHRtyAf6aNCglTgHCVUGnbwLJ0iGye5DWaWkxs6Y3rUiY4wF9WMASe2Fn3prurBG29uGZ
 ROpdE1LAv0HD+70ruZ3tWCraI8NYL9grq78+PovDW65byTImsM+hwYpUAJIgeQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/03/2021 19:09, Robert Foss wrote:
> This series implements support for the camera subsystem found in
> the SDM845 SOCs and the Titan 170 ISP. The support is partial
> in that it implements CSIPHY, CSID, and partial VFE support.
> 
> The Titan generation of the ISP diverges a fair amount from the
> design of the previous architecture generation, CAMSS. As a result
> some pretty invasive refactoring is done in this series. It also
> means that at this time we're unable to implement support for all
> of the IP blocks contained. This is due to a combination of legal
> considerations with respect to the IP and its owner Qualcomm and
> time & man hour constrains on the Linaro side.
> 
> The CSIPHY (CSI Physical Layer) & CSID (CSI Decoder) support is
> complete, but the VFE (Video Front End, which is referred to as IFE
> (Image Front End) in the Titan generation of ISPs) only has support
> for the RDI (Raw Dump Interface) which allows the raw output of
> the CSID to be written to memory.
> 
> The 2nd interface implemented in the VFE silicon is the PIX
> interface, and camss does not support it for this generation of ISPs.
> The reason for this is that the PIX interface is used for sending
> image data to the BPS (Bayer Processing Section) & IPE (Image
> Processing Engine), but both of these units are beyond the scope
> of enabling basic ISP functionality for the SDM845.
> 
> Since the Titan architecture generation diverges quite a bit from
> the CAMSS generation, a lot of pretty major refactoring is carried
> out in this series. Both the CSID & VFE core paths are made more
> general and hardware version specific parts are broken out.
> The CSIPHY didn't require quite as radical changes and therefore
> keeps its current form.
> 
> Tested on:
>  - Qcom RB3 / db845c + camera mezzanine, which is SDM845 based
>  - db410c + D3 Camera mezzanine, which is APQ8016 based
>  
> Branch:
>  - https://git.linaro.org/people/robert.foss/linux.git/log/?h=camss_sdm845_v1
>  - https://git.linaro.org/people/robert.foss/linux.git/log/?h=camss_sdm845_v2
>  - https://git.linaro.org/people/robert.foss/linux.git/log/?h=camss_sdm845_v3
>  - https://git.linaro.org/people/robert.foss/linux.git/log/?h=camss_sdm845_v4
>  - https://git.linaro.org/people/robert.foss/linux.git/log/?h=camss_sdm845_v5
>  - https://git.linaro.org/people/robert.foss/linux.git/log/?h=camss_sdm845_v6
>  - https://git.linaro.org/people/robert.foss/linux.git/log/?h=camss_sdm845_v7
> 

Please check the patches in this series with 'scripts/checkpatch.pl --strict'.
I got a bunch of warnings, most seemed trivial to fix.

When I compiled this series I also got these sparse warnings:

drivers/media/platform/qcom/camss/camss-csid.h:66:27: warning: 'csid_testgen_modes' defined but not used [-Wunused-const-variable=]
drivers/media/platform/qcom/camss/camss-csid.h:66:27: warning: 'csid_testgen_modes' defined but not used [-Wunused-const-variable=]
drivers/media/platform/qcom/camss/camss-csid.h:66:27: warning: 'csid_testgen_modes' defined but not used [-Wunused-const-variable=]
drivers/media/platform/qcom/camss/camss-csid.h:66:27: warning: 'csid_testgen_modes' defined but not used [-Wunused-const-variable=]
drivers/media/platform/qcom/camss/camss-csid.h:66:27: warning: 'csid_testgen_modes' defined but not used [-Wunused-const-variable=]
drivers/media/platform/qcom/camss/camss-csid.h:66:27: warning: 'csid_testgen_modes' defined but not used [-Wunused-const-variable=]
drivers/media/platform/qcom/camss/camss-csid.h:66:27: warning: 'csid_testgen_modes' defined but not used [-Wunused-const-variable=]
drivers/media/platform/qcom/camss/camss-csid.h:66:27: warning: 'csid_testgen_modes' defined but not used [-Wunused-const-variable=]
drivers/media/platform/qcom/camss/camss-csid.h:66:27: warning: 'csid_testgen_modes' defined but not used [-Wunused-const-variable=]
SPARSE:drivers/media/platform/qcom/camss/camss-vfe-4-1.c drivers/media/platform/qcom/camss/camss-vfe-4-1.c:959:30: warning: symbol
'vfe_ops_gen1_4_1' was not declared. Should it be static?
SPARSE:drivers/media/platform/qcom/camss/camss-vfe-4-1.c drivers/media/platform/qcom/camss/camss-vfe-gen1.h:69:31: error: marked inline, but
without a definition
SPARSE:drivers/media/platform/qcom/camss/camss-vfe-4-1.c drivers/media/platform/qcom/camss/camss-vfe-gen1.h:69:31: error: marked inline, but
without a definition
SPARSE:drivers/media/platform/qcom/camss/camss-vfe-4-1.c drivers/media/platform/qcom/camss/camss-vfe-gen1.h:69:31: error: marked inline, but
without a definition
SPARSE:drivers/media/platform/qcom/camss/camss-vfe-4-1.c drivers/media/platform/qcom/camss/camss-vfe-gen1.h:69:31: error: marked inline, but
without a definition
drivers/media/platform/qcom/camss/camss-csid.h:66:27: warning: 'csid_testgen_modes' defined but not used [-Wunused-const-variable=]
SPARSE:drivers/media/platform/qcom/camss/camss-vfe-4-1.c drivers/media/platform/qcom/camss/camss-vfe-4-1.c:959:30: warning: symbol
'vfe_ops_gen1_4_1' was not declared. Should it be static?
SPARSE:drivers/media/platform/qcom/camss/camss-vfe-4-1.c drivers/media/platform/qcom/camss/camss-vfe-gen1.h:69:31: error: marked inline, but
without a definition
SPARSE:drivers/media/platform/qcom/camss/camss-vfe-4-1.c drivers/media/platform/qcom/camss/camss-vfe-gen1.h:69:31: error: marked inline, but
without a definition
SPARSE:drivers/media/platform/qcom/camss/camss-vfe-4-1.c drivers/media/platform/qcom/camss/camss-vfe-gen1.h:69:31: error: marked inline, but
without a definition
SPARSE:drivers/media/platform/qcom/camss/camss-vfe-4-1.c drivers/media/platform/qcom/camss/camss-vfe-gen1.h:69:31: error: marked inline, but
without a definition
drivers/media/platform/qcom/camss/camss-csid.h:66:27: warning: 'csid_testgen_modes' defined but not used [-Wunused-const-variable=]
SPARSE:drivers/media/platform/qcom/camss/camss-vfe-4-7.c drivers/media/platform/qcom/camss/camss-vfe-4-7.c:1151:30: warning: symbol
'vfe_ops_gen1_4_7' was not declared. Should it be static?
SPARSE:drivers/media/platform/qcom/camss/camss-vfe-4-7.c drivers/media/platform/qcom/camss/camss-vfe-gen1.h:69:31: error: marked inline, but
without a definition
SPARSE:drivers/media/platform/qcom/camss/camss-vfe-4-7.c drivers/media/platform/qcom/camss/camss-vfe-gen1.h:69:31: error: marked inline, but
without a definition
SPARSE:drivers/media/platform/qcom/camss/camss-vfe-4-7.c drivers/media/platform/qcom/camss/camss-vfe-gen1.h:69:31: error: marked inline, but
without a definition
SPARSE:drivers/media/platform/qcom/camss/camss-vfe-4-7.c drivers/media/platform/qcom/camss/camss-vfe-gen1.h:69:31: error: marked inline, but
without a definition
SPARSE:drivers/media/platform/qcom/camss/camss-vfe-170.c drivers/media/platform/qcom/camss/camss-vfe-170.c:770:26: warning: symbol
'vfe_isr_ops_170' was not declared. Should it be static?
drivers/media/platform/qcom/camss/camss-csid.h:66:27: warning: 'csid_testgen_modes' defined but not used [-Wunused-const-variable=]
SPARSE:drivers/media/platform/qcom/camss/camss-vfe-4-8.c drivers/media/platform/qcom/camss/camss-vfe-4-8.c:1140:30: warning: symbol
'vfe_ops_gen1_4_8' was not declared. Should it be static?
SPARSE:drivers/media/platform/qcom/camss/camss-vfe-4-8.c drivers/media/platform/qcom/camss/camss-vfe-gen1.h:69:31: error: marked inline, but
without a definition
SPARSE:drivers/media/platform/qcom/camss/camss-vfe-4-8.c drivers/media/platform/qcom/camss/camss-vfe-gen1.h:69:31: error: marked inline, but
without a definition
SPARSE:drivers/media/platform/qcom/camss/camss-vfe-4-8.c drivers/media/platform/qcom/camss/camss-vfe-gen1.h:69:31: error: marked inline, but
without a definition
SPARSE:drivers/media/platform/qcom/camss/camss-vfe-4-8.c drivers/media/platform/qcom/camss/camss-vfe-gen1.h:69:31: error: marked inline, but
without a definition
drivers/media/platform/qcom/camss/camss-csid.h:66:27: warning: 'csid_testgen_modes' defined but not used [-Wunused-const-variable=]

And these smatch warnings (a lot of overlap with sparse):

drivers/media/platform/qcom/camss/camss-csid.h:66:27: warning: 'csid_testgen_modes' defined but not used [-Wunused-const-variable=]
drivers/media/platform/qcom/camss/camss-csid.h:66:27: warning: 'csid_testgen_modes' defined but not used [-Wunused-const-variable=]
drivers/media/platform/qcom/camss/camss-csid.h:66:27: warning: 'csid_testgen_modes' defined but not used [-Wunused-const-variable=]
drivers/media/platform/qcom/camss/camss-csid.h:66:27: warning: 'csid_testgen_modes' defined but not used [-Wunused-const-variable=]
drivers/media/platform/qcom/camss/camss-csid.h:66:27: warning: 'csid_testgen_modes' defined but not used [-Wunused-const-variable=]
drivers/media/platform/qcom/camss/camss-csid.h:66:27: warning: 'csid_testgen_modes' defined but not used [-Wunused-const-variable=]
drivers/media/platform/qcom/camss/camss-csid.h:66:27: warning: 'csid_testgen_modes' defined but not used [-Wunused-const-variable=]
drivers/media/platform/qcom/camss/camss-csid.h:66:27: warning: 'csid_testgen_modes' defined but not used [-Wunused-const-variable=]
drivers/media/platform/qcom/camss/camss-csid.h:66:27: warning: 'csid_testgen_modes' defined but not used [-Wunused-const-variable=]
drivers/media/platform/qcom/camss/camss-csid.h:66:27: warning: 'csid_testgen_modes' defined but not used [-Wunused-const-variable=]
drivers/media/platform/qcom/camss/camss-csid.h:66:27: warning: 'csid_testgen_modes' defined but not used [-Wunused-const-variable=]
drivers/media/platform/qcom/camss/camss-csid.h:66:27: warning: 'csid_testgen_modes' defined but not used [-Wunused-const-variable=]
drivers/media/platform/qcom/camss/camss-vfe-170.c:422 vfe_halt() warn: ignoring unreachable code.
drivers/media/platform/qcom/camss/camss-vfe-gen1.c:26 vfe_gen1_halt() warn: ignoring unreachable code.

Regards,

	Hans

> 
> Robert Foss (22):
>   media: camss: Fix vfe_isr_comp_done() documentation
>   media: camss: Fix vfe_isr comment typo
>   media: camss: Replace trace_printk() with dev_dbg()
>   media: camss: Add CAMSS_845 camss version
>   media: camss: Make ISPIF subdevice optional
>   media: camss: Refactor VFE HW version support
>   media: camss: Add support for VFE hardware version Titan 170
>   media: camss: Add missing format identifiers
>   media: camss: Refactor CSID HW version support
>   media: camss: Add support for CSID hardware version Titan 170
>   media: camss: Add support for CSIPHY hardware version Titan 170
>   media: camss: Refactor VFE power domain toggling
>   media: camss: Enable SDM845
>   dt-bindings: media: camss: Add qcom,msm8916-camss binding
>   dt-bindings: media: camss: Add qcom,msm8996-camss binding
>   dt-bindings: media: camss: Add qcom,sdm660-camss binding
>   dt-bindings: media: camss: Add qcom,sdm845-camss binding
>   MAINTAINERS: Change CAMSS documentation to use dtschema bindings
>   media: dt-bindings: media: Remove qcom,camss documentation
>   arm64: dts: sdm845: Add CAMSS ISP node
>   arm64: dts: sdm845-db845c: Configure regulators for camss node
>   arm64: dts: sdm845-db845c: Enable ov8856 sensor and connect to ISP
> 
>  .../devicetree/bindings/media/qcom,camss.txt  |  236 ----
>  .../bindings/media/qcom,msm8916-camss.yaml    |  256 ++++
>  .../bindings/media/qcom,msm8996-camss.yaml    |  387 ++++++
>  .../bindings/media/qcom,sdm660-camss.yaml     |  398 ++++++
>  .../bindings/media/qcom,sdm845-camss.yaml     |  371 +++++
>  MAINTAINERS                                   |    2 +-
>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts    |   23 +-
>  arch/arm64/boot/dts/qcom/sdm845.dtsi          |  135 ++
>  drivers/media/platform/qcom/camss/Makefile    |    6 +
>  .../platform/qcom/camss/camss-csid-170.c      |  601 +++++++++
>  .../platform/qcom/camss/camss-csid-4-1.c      |  329 +++++
>  .../platform/qcom/camss/camss-csid-4-7.c      |  405 ++++++
>  .../platform/qcom/camss/camss-csid-gen1.h     |   27 +
>  .../platform/qcom/camss/camss-csid-gen2.h     |   39 +
>  .../media/platform/qcom/camss/camss-csid.c    |  621 +--------
>  .../media/platform/qcom/camss/camss-csid.h    |  164 ++-
>  .../qcom/camss/camss-csiphy-3ph-1-0.c         |  179 ++-
>  .../media/platform/qcom/camss/camss-csiphy.c  |   66 +-
>  .../media/platform/qcom/camss/camss-ispif.c   |  119 +-
>  .../media/platform/qcom/camss/camss-ispif.h   |    3 +-
>  .../media/platform/qcom/camss/camss-vfe-170.c |  806 +++++++++++
>  .../media/platform/qcom/camss/camss-vfe-4-1.c |  144 +-
>  .../media/platform/qcom/camss/camss-vfe-4-7.c |  277 ++--
>  .../media/platform/qcom/camss/camss-vfe-4-8.c | 1200 +++++++++++++++++
>  .../platform/qcom/camss/camss-vfe-gen1.c      |  763 +++++++++++
>  .../platform/qcom/camss/camss-vfe-gen1.h      |  110 ++
>  drivers/media/platform/qcom/camss/camss-vfe.c |  847 +-----------
>  drivers/media/platform/qcom/camss/camss-vfe.h |  129 +-
>  .../media/platform/qcom/camss/camss-video.c   |   52 +
>  drivers/media/platform/qcom/camss/camss.c     |  407 +++++-
>  drivers/media/platform/qcom/camss/camss.h     |   15 +-
>  31 files changed, 7069 insertions(+), 2048 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/qcom,camss.txt
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
>  create mode 100644 drivers/media/platform/qcom/camss/camss-csid-170.c
>  create mode 100644 drivers/media/platform/qcom/camss/camss-csid-4-1.c
>  create mode 100644 drivers/media/platform/qcom/camss/camss-csid-4-7.c
>  create mode 100644 drivers/media/platform/qcom/camss/camss-csid-gen1.h
>  create mode 100644 drivers/media/platform/qcom/camss/camss-csid-gen2.h
>  create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-170.c
>  create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-4-8.c
>  create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-gen1.c
>  create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-gen1.h
> 

