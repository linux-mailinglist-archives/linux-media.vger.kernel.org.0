Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D87E14595B1
	for <lists+linux-media@lfdr.de>; Mon, 22 Nov 2021 20:41:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240105AbhKVToS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Nov 2021 14:44:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239567AbhKVToR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Nov 2021 14:44:17 -0500
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09CEAC061574
        for <linux-media@vger.kernel.org>; Mon, 22 Nov 2021 11:41:11 -0800 (PST)
Received: by mail-io1-xd2f.google.com with SMTP id f9so24709773ioo.11
        for <linux-media@vger.kernel.org>; Mon, 22 Nov 2021 11:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snapchat.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=28fgHf7K4GVTe+/neT5CJ1csZ9XUK8hsiO0kBvefXZc=;
        b=cLOkbJuBVIZ1Wz7VB7QmKxZCwGgdMAITzLhhfHcCt9qOWoXQdtve04+QXIxsUbdV6N
         +7IvsiRwqFz8XnKa5fsYP3mo9dzB1mWCnfaxy03JAsAaKV7WlQFSM5CLH4+aJk0B20nN
         2+Ra/SkOAFkQmTlYFLJsewDfwj2WlWxx+9+NI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=28fgHf7K4GVTe+/neT5CJ1csZ9XUK8hsiO0kBvefXZc=;
        b=dLAturDoT8k+xGWuXzI61ATEg8gFGNVY79UJdCWcm63pnmwEE1t63CHy1SplQjY8MH
         r4taB2Ev7/x8bY4uyWqGgZui34F4fe9xAiYiumR63DHfNj5dXuKkCwXDFRiMvMpkljA+
         ff5dt9cKEcaC5nPwfaX8m3VuFC42PVodnJxKen5Isu3nTdBugyrYiWzmotQM4SfHlxzl
         kGRDO8uQ7lg5KAzUZk9ZIEEgcPjYnE/NTS/RCsCvSxyuctTv/YYw+BNgyc8rVBuPjrrg
         KOEg+1WREsfPSohCtcVfdgYWKSLTGVJTT310NjqExCbfrKPtB0K1QfD/pBiO1vmxz6ZN
         RPxg==
X-Gm-Message-State: AOAM532jl9gV4/5osSsQtAU3XqPqvypZxYHSq31zjm3lEywDlDVePFlg
        VC1UK53CGJJ/5lsF2iPmFiyr3pE88RnlB3Yxm/0RQw==
X-Google-Smtp-Source: ABdhPJyJSSBw4CV3NIUrjnVt0ETwyrFjwSPIwO6ty8Foa4OUHC0+y2JcGDNl7fbLPGw0QTn0ykNtA96wJalUE0DCACo=
X-Received: by 2002:a05:6602:1487:: with SMTP id a7mr24083063iow.57.1637610069331;
 Mon, 22 Nov 2021 11:41:09 -0800 (PST)
MIME-Version: 1.0
References: <20211111161542.3936425-1-bryan.odonoghue@linaro.org>
In-Reply-To: <20211111161542.3936425-1-bryan.odonoghue@linaro.org>
From:   Julian Grahsl <jgrahsl@snapchat.com>
Date:   Mon, 22 Nov 2021 20:40:58 +0100
Message-ID: <CAOAokmB7sdu5ErMwjZ7vpr2cBPoZ-sEOS6Rs4AFYXG+jCRc4=w@mail.gmail.com>
Subject: Re: [RESEND PATCH 00/18] CAMSS: Add SM8250 support
To:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca,
        andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        Julian Grahsl <jgrahsl@snap.com>,
        Heinrich Fink <hfink@snap.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Bryan,

I tested the patch series on the RB5 Vision Kit and verified that
capturing frames from the IMX577/IMX412 camera using yavta and
libcamera is working as expected. The captured data is padded to a
16-byte boundary for each line in the frame. I was using a simple
python/opencv script to verify that the frame is not corrupted and
that the reported image format (4056x3040-SRGGB10_CSI2P) makes sense
(keeping the 16-byte boundary in mind).

Please add my t-b.

Tested-by: Julian Grahsl <jgrahsl@snap.com>

root@qrb5165-rb5:~# cam -c 1 --capture=3D10 --file=3Dframe1.bin
Using camera /base/soc@0/cci@ac50000/i2c-bus@0/camera@1a as cam0
[0:38:31.392452919] [1404]  INFO Camera camera.cpp:945 configuring
streams: (0) 4056x3040-SRGGB10_CSI2P
cam0: Capture 10 frames
2311.682879 (0.00 fps) cam0-stream0 seq: 000000 bytesused: 15418880
2311.716190 (30.02 fps) cam0-stream0 seq: 000001 bytesused: 15418880
2311.749522 (30.00 fps) cam0-stream0 seq: 000002 bytesused: 15418880
2311.782852 (30.00 fps) cam0-stream0 seq: 000003 bytesused: 15418880
2311.816347 (29.86 fps) cam0-stream0 seq: 000004 bytesused: 15418880
2311.849604 (30.07 fps) cam0-stream0 seq: 000005 bytesused: 15418880
2311.882934 (30.00 fps) cam0-stream0 seq: 000006 bytesused: 15418880
2311.916272 (30.00 fps) cam0-stream0 seq: 000007 bytesused: 15418880
2311.949611 (29.99 fps) cam0-stream0 seq: 000008 bytesused: 15418880
2311.982931 (30.01 fps) cam0-stream0 seq: 000009 bytesused: 15418880

On Thu, Nov 11, 2021 at 5:13 PM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> RESEND: git send-email --to=3Dinux-arm-msm@vger.kernel.org -> --to=3Dlinu=
x-arm-msm@vger.kernel.org
>
> This series is imported from excellent enabling work contributed by
> Jonathan Marek which we have picked up in Linaro for the RB5 project.
>
> Link: https://patchwork.kernel.org/project/linux-arm-msm/patch/2021051118=
0728.23781-2-jonathan@marek.ca/
> Link: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.qualcomm=
.com_products_robotics-2Drb5-2Dplatform&d=3DDwIDAg&c=3DncDTmphkJTvjIDPh0hpF=
_4vCHvabgGkICC2epckfdiw&r=3DWMvYsMZYRjlckS0DeCYqNiuOSbMJMG-a0iXUWTmfVNw&m=
=3DM_FfZyy6tanOleebHlyZCt13urClXtUo40bzp3DK5Lufj5aEBaA6pMaGR7QKm95Y&s=3DSCO=
C2iFYWetFrxGV5JvxaxnZAD77TbbP2aImnbzzgZI&e=3D
> Link: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.96boards=
.org_product_qualcomm-2Drobotics-2Drb5&d=3DDwIDAg&c=3DncDTmphkJTvjIDPh0hpF_=
4vCHvabgGkICC2epckfdiw&r=3DWMvYsMZYRjlckS0DeCYqNiuOSbMJMG-a0iXUWTmfVNw&m=3D=
M_FfZyy6tanOleebHlyZCt13urClXtUo40bzp3DK5Lufj5aEBaA6pMaGR7QKm95Y&s=3DmB63Be=
H3Hwdmzz8OXly-62OKS33Hk_aVqJJLN6xmD40&e=3D
> Link: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.thunderc=
omm.com_app-5Fen_product_1590131656070623-3Findex-3D1-26categoryId-3Dcatego=
ry0-26tabIndex-3D1&d=3DDwIDAg&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfd=
iw&r=3DWMvYsMZYRjlckS0DeCYqNiuOSbMJMG-a0iXUWTmfVNw&m=3DM_FfZyy6tanOleebHlyZ=
Ct13urClXtUo40bzp3DK5Lufj5aEBaA6pMaGR7QKm95Y&s=3DVltqdAczXJiZKDatFp-6UdrSya=
Z9hU4IOma3vCqp8Cw&e=3D
>
> The RB5 has a slightly different sku I think to Jonathan's platform -
> QRB5165 in our case with a different version of LK the relevant bootloade=
r
> for the board.
>
> As a result we needed to make some additional updates to the provided
> patcheset, included here.
>
> The most notable changes are:
>
> - Addition of clocks.
> - Addition of bandwidth settings.
> - Representing the dependency on a VFE for a given CSID so that V4L
>   subdevs will come out of reset right when poked.
>
> A full tree which is bootable and capable of producing pixel data from th=
e
> imx577 main sensor is availble here, with this series being a sub-set of
> the necessary patches on the SoC side only.
>
> Link: https://git.linaro.org/people/bryan.odonoghue/kernel.git/log/?h=3Dv=
5.16-rc1-sm8250-camss-imx577-only
>
> media-ctl --reset
> media-ctl -v -d /dev/media0 -V '"imx412 '20-001a'":0[fmt:SRGGB10/4056x304=
0 field:none]'
> media-ctl -V '"msm_csiphy2":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -l '"msm_csiphy2":1->"msm_csid0":0[1]'
> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
>
> yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video=
0
>
> Bryan O'Donoghue (2):
>   media: camss: Add SM8250 bandwdith configuration support
>   media: camss: Do vfe_get/vfe_put for csid on sm8250
>
> Jonathan Marek (16):
>   media: dt-bindings: media: camss: Add qcom,sm8250-camss binding
>   media: camss: csiphy-3ph: don't print HW version as an error
>   media: camss: csiphy-3ph: disable interrupts
>   media: camss: csiphy-3ph: add support for SM8250 CSI DPHY
>   media: camss: csid-170: fix non-10bit formats
>   media: camss: csid-170: don't enable unused irqs
>   media: camss: csid-170: remove stray comment
>   media: camss: csid-170: support more than one lite vfe
>   media: camss: csid-170: set the right HALT_CMD when disabled
>   media: camss: csid: allow csid to work without a regulator
>   media: camss: remove vdda-csiN from sdm845 resources
>   media: camss: fix VFE irq name
>   media: camss: vfe-170: fix "VFE halt timeout" error
>   media: camss: Add initial support for VFE hardware version Titan 480
>   media: camss: add support for V4L2_PIX_FMT_GREY for sdm845 HW
>   media: camss: add support for SM8250 camss
>
>  .../bindings/media/qcom,sm8250-camss.yaml     | 450 ++++++++++++++
>  drivers/media/platform/qcom/camss/Makefile    |   3 +-
>  .../{camss-csid-170.c =3D> camss-csid-gen2.c}   |  32 +-
>  .../media/platform/qcom/camss/camss-csid.c    |  55 +-
>  .../media/platform/qcom/camss/camss-csid.h    |   2 +-
>  .../qcom/camss/camss-csiphy-3ph-1-0.c         | 184 ++++--
>  .../media/platform/qcom/camss/camss-csiphy.c  |   9 +-
>  .../media/platform/qcom/camss/camss-vfe-170.c |  12 +-
>  .../media/platform/qcom/camss/camss-vfe-480.c | 548 ++++++++++++++++++
>  drivers/media/platform/qcom/camss/camss-vfe.c |  17 +-
>  drivers/media/platform/qcom/camss/camss-vfe.h |   4 +
>  .../media/platform/qcom/camss/camss-video.c   |   5 +-
>  drivers/media/platform/qcom/camss/camss.c     | 298 +++++++++-
>  drivers/media/platform/qcom/camss/camss.h     |  18 +
>  14 files changed, 1533 insertions(+), 104 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8250-c=
amss.yaml
>  rename drivers/media/platform/qcom/camss/{camss-csid-170.c =3D> camss-cs=
id-gen2.c} (95%)
>  create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-480.c
>
> --
> 2.33.0
>
