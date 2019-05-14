Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15E951CCB1
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2019 18:14:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726084AbfENQOd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 May 2019 12:14:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:48244 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725916AbfENQOd (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 May 2019 12:14:33 -0400
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0263720879;
        Tue, 14 May 2019 16:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1557850472;
        bh=jeKRXr0M9XXFqWmVjnjpDyGUpNBVkxLC/ans2pFYR2w=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=vDxrSC2Lnyi8cE34RZ63IW6xbzA/RS3z0FIfxWTNzEOquRd9xmxMQfmff6u+vFaSa
         nq0KreWUXK8VjnyPNbRFmiEXf75uZbIGC/q8ZaWCZy8uIOjSdRb61J5u0YitZbyOlw
         B9UyjFaSfEEm5NegC/LI/2btCOASzv4Aioy6lQKA=
Received: by mail-qt1-f179.google.com with SMTP id m32so16615997qtf.0;
        Tue, 14 May 2019 09:14:31 -0700 (PDT)
X-Gm-Message-State: APjAAAXYm4ObKX9bFk+DQNKysSO1SphYUNaBMSBXi6MyaYd/NCeGkjbD
        mfS/nd4+WniB5KB8/+oPe5lARP8jTd1mOH46sA==
X-Google-Smtp-Source: APXvYqzkPStG3BhXhS/DE7x7FQdm19fjYXKqLaaVHeqaJH60sMGfCRR/KG+4+ERIuURoEhyV/MKK079WsfWsQlzxXXM=
X-Received: by 2002:ac8:641:: with SMTP id e1mr30147087qth.76.1557850471187;
 Tue, 14 May 2019 09:14:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190417104511.21514-1-frederic.chen@mediatek.com>
 <20190417104511.21514-4-frederic.chen@mediatek.com> <20190430011619.GA22170@bogus>
 <1557238579.11663.15.camel@mtksdccf07>
In-Reply-To: <1557238579.11663.15.camel@mtksdccf07>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 14 May 2019 11:14:19 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ7+qrBEi4fXx1qC-3g17UGDJQ-LmahU9YUHaqr7QZQtQ@mail.gmail.com>
Message-ID: <CAL_JsqJ7+qrBEi4fXx1qC-3g17UGDJQ-LmahU9YUHaqr7QZQtQ@mail.gmail.com>
Subject: Re: [RFC PATCH V1 3/6] dt-bindings: mt8183: Added DIP dt-bindings
To:     Frederic Chen <frederic.chen@mediatek.com>
Cc:     Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        yuzhao@chromium.org, zwisler@chromium.org,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>, Sean.Cheng@mediatek.com,
        sj.huang@mediatek.com, christie.yu@mediatek.com,
        holmes.chiou@mediatek.com,
        Jerry-ch Chen <Jerry-ch.Chen@mediatek.com>,
        jungo.lin@mediatek.com, Rynn.Wu@mediatek.com,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        devicetree@vger.kernel.org, shik@chromium.org,
        suleiman@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 7, 2019 at 9:16 AM Frederic Chen <frederic.chen@mediatek.com> w=
rote:
>
> Dear Rob,
>
> I appreciate your comments.
>
> On Mon, 2019-04-29 at 20:16 -0500, Rob Herring wrote:
> > On Wed, Apr 17, 2019 at 06:45:08PM +0800, Frederic Chen wrote:
> > > This patch adds DT binding documentation for the Digital Image
> > > Processing (DIP) unit of camera ISP system on Mediatek's SoCs.
> > >
> > > Signed-off-by: Frederic Chen <frederic.chen@mediatek.com>
> > > ---
> > >  .../bindings/media/mediatek,mt8183-dip.txt    | 35 +++++++++++++++++=
++
> > >  1 file changed, 35 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/media/mediatek,=
mt8183-dip.txt
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8183-=
dip.txt b/Documentation/devicetree/bindings/media/mediatek,mt8183-dip.txt
> > > new file mode 100644
> > > index 000000000000..0e1994bf82f0
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/mediatek,mt8183-dip.txt
> > > @@ -0,0 +1,35 @@
> > > +* Mediatek Digital Image Processor (DIP)
> > > +
> > > +Digital Image Processor (DIP) unit in Mediatek ISP system is respons=
ible for
> > > +image content adjustment according to the tuning parameters. DIP can=
 process
> > > +the image form memory buffer and output the processed image to multi=
ple output
> > > +buffers. Furthermore, it can support demosaicing and noise reduction=
 on the
> > > +images.
> > > +
> > > +Required properties:
> > > +- compatible: "mediatek,mt8183-dip"
> > > +- reg: Physical base address and length of the function block regist=
er space
> > > +- interrupts: interrupt number to the cpu
> > > +- iommus: should point to the respective IOMMU block with master por=
t as
> > > +  argument, see Documentation/devicetree/bindings/iommu/mediatek,iom=
mu.txt
> > > +  for details.
> > > +- mediatek,larb: must contain the local arbiters in the current Socs=
, see
> > > +  Documentation/devicetree/bindings/memory-controllers/mediatek,smi-=
larb.txt
> > > +  for details.
> > > +- clocks: must contain the local arbiters 5 (LARB5) and DIP clock
> > > +- clock-names: must contain DIP_CG_IMG_LARB5 and DIP_CG_IMG_DIP
> > > +
> > > +Example:
> > > +   dip: dip@15022000 {
> > > +           compatible =3D "mediatek,mt8183-dip";
> > > +           mediatek,larb =3D <&larb5>;
> >
> > > +           mediatek,mdp3 =3D <&mdp_rdma0>;
> > > +           mediatek,vpu =3D <&vpu>;
> >
> > Not documented.
> >
>
> =E2=80=9Cmediatek,vpu=E2=80=9D will be replaced by =E2=80=9Cmediatek,scp.=
=E2=80=9D I would like to
> add the following description in next version of the patch:
>
> - mediatek,scp: must point to the scp block of the co-processor used
>   with DIP. Please see
>   Documentation/devicetree/bindings/remoteproc/mtk,scp.txt for the
>   detail.
>
> - mediatek,mdp3: must point to the Media Data Path 3 (MDP3) block.
>   Please see
>   Documentation/devicetree/bindings/media/mediatek,mt8183-mdp3.txt
>   for the detail.

If there's only 1 of each of these blocks, there's no need to have
phandle. Just find the matching node using the compatible string(s).

Rob
