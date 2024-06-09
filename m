Return-Path: <linux-media+bounces-12786-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AD9901820
	for <lists+linux-media@lfdr.de>; Sun,  9 Jun 2024 22:21:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 19F931C20834
	for <lists+linux-media@lfdr.de>; Sun,  9 Jun 2024 20:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A9C94E1C8;
	Sun,  9 Jun 2024 20:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZHDE/UtO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FD74D9FE;
	Sun,  9 Jun 2024 20:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717964493; cv=none; b=CXiVCN1QfkjXx97sFtPSAf/QbtEt0qJByXLS+g4uJSJU67zGmUbQk96WLvOPTBwItfPXLZ1O3nCT+12AT3plNp+1i3Y4hBGyfZqtNuZrJBn59oQKdp2Naq1RQcjjOynO0H3B9a/1qCmCXNI+FH3UGEL203oSvfk7epf1DqeQRaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717964493; c=relaxed/simple;
	bh=4tehNRbbnCKpqarYHQ5EuMHK73mI971qQyoR6Dnl9U8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s4bUKV1HX7ko3ejFKJbGnBi3r0WN2L/ttB4OgbYzz2P5tp87TCT1EsBIL3j8+hTr1ZEfm4jjfieeJIJxBXBSiIvlIVrRa8cekMx9i0w+D52CwhNl7xeB/zey6zovvMH+ysCC2BsHSJc7RyaVqBRpO4SdWKWiwn9ygHBgNkuvh1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZHDE/UtO; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-70255d5ddc7so3102702b3a.3;
        Sun, 09 Jun 2024 13:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717964491; x=1718569291; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q1+EBDobohAf7xrKaFheIy46c0hkMGKmqzYkkpLnc0c=;
        b=ZHDE/UtOGVFqqLzNg0OsFIp9KJLLvCu6gSLXZ2TC9wHECOs2JFPl83JsqvSyCIOIny
         7Jq5v7rfwAaZfPCjQKrBVce1QBE1zq9NvK6PzPK9ZAwADLOGOhDPd/Z4O4Sa93tZcLkM
         razLwWLV+0DcQBOum4NJ14PegzziiMvfw+eOxDEmN/L4ZdHHqLicWAsSJrjMJxI2QXhJ
         VHjtlkIcP6fBDa5jyQD2c5ACL98LUCdznKwPyp/kxEcpgKBn/vyo+GMcKo/a58kJu4cf
         lEcTVspH4NLUMBsOzDObcpGjaWwrBgPQ2j8IEwvCFPzZRpVe1pAKHujvNZKhDR3DPcvU
         M2Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717964491; x=1718569291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q1+EBDobohAf7xrKaFheIy46c0hkMGKmqzYkkpLnc0c=;
        b=ss9j3D+ZjdHA42nHXUWhlaVTDHJX5VbKWSCOuEpfbyfZRAL+6mR8wV0RknOdR5Hb7g
         Ya/hayi5YpalbbxV0iX1OCe26hrQKYLqGdNwJTdLqPibQTK4PxiULT6xLGmc+XBq9VG0
         5+qOEHXLAV585uyiD+5l8N77GTHKXK6VRoPYon4/ZlvQ39Ef+45cR82JUF3wPZ+qve89
         3jvENUEmmpcUjyCNX/0W306FxTutXavO3RvJYs2Jm1Wr8qS38c7Xb65eO95BnO/ZDfm9
         IEKTpTjkEbpDmNqo5Utm7EABY/pCizgwQx7AQOIasYgEvFztcTZt0D0MCkds47S+sMN2
         caWA==
X-Forwarded-Encrypted: i=1; AJvYcCWZt6GVfX/Xu2SF9Ad5lVTTTtmS3V1aTppr5SU2TGJb2SsTXIHQX2XLUqZumHfJqMvTV4d5QVxYRuLmi7cYi9MR35LyfswjPhBzZ6pqDji5UQhbtSADdApNSFNumOIx+Z5ak8jq9RSl
X-Gm-Message-State: AOJu0Yw1z5L8dyX7BSgwwbInXqihFrYxGUDKIJhaaUK72DbbaHbHH/Cw
	dYFdDaarI208k+D0scLPYlPJFfgpb/IdBJo/4377FucEIlkpxgzQ8xiZjmVz0fXktSU34cRVNzt
	zVWXg454TJ+vjcCp2qgCrBgKnGHI=
X-Google-Smtp-Source: AGHT+IFSfAfZDbtQ1V1Y0Q3kuf3ufZrF7orXXLUWL4QURVMIj++rBRmm+GBK1Kkb46H4PuO82h5X3SpPQORc/VqC7lk=
X-Received: by 2002:a05:6a20:9f88:b0:1b6:ea39:4d97 with SMTP id
 adf61e73a8af0-1b6ea394e91mr1375237637.29.1717964491280; Sun, 09 Jun 2024
 13:21:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325151339.19041-1-laurent.pinchart@ideasonboard.com>
 <4879631.GXAFRqVoOG@steina-w> <20240325204924.GY18799@pendragon.ideasonboard.com>
 <2929432.e9J7NaK4W3@steina-w>
In-Reply-To: <2929432.e9J7NaK4W3@steina-w>
From: Adam Ford <aford173@gmail.com>
Date: Sun, 9 Jun 2024 15:21:19 -0500
Message-ID: <CAHCN7xLFjJUZQZwPbj5xyxnprwAV3TOvd_6A6sBwOPK+V6uQPA@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: imx8mp: Add DT nodes for the two ISPs
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, 
	Paul Elder <paul.elder@ideasonboard.com>, Conor Dooley <conor+dt@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Marek Vasut <marex@denx.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 26, 2024 at 2:14=E2=80=AFAM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Hi Laurent,
>
> Am Montag, 25. M=C3=A4rz 2024, 21:49:24 CET schrieb Laurent Pinchart:
> > Hi Alexander,
> >
> > On Mon, Mar 25, 2024 at 04:52:21PM +0100, Alexander Stein wrote:
> > > Am Montag, 25. M=C3=A4rz 2024, 16:13:39 CET schrieb Laurent Pinchart:
> > > > From: Paul Elder <paul.elder@ideasonboard.com>
> > > >
> > > > The ISP supports both CSI and parallel interfaces, where port 0
> > > > corresponds to the former and port 1 corresponds to the latter. Sin=
ce
> > > > the i.MX8MP's ISPs are connected by the parallel interface to the C=
SI
> > > > receiver, set them both to port 1.
> > > >
> > > > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > ---
> > > > Changes since v1:
> > > >
> > > > - Fix clock ordering
> > > > - Add #address-cells and #size-cells to ports nodes
> > > > ---
> > > >  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 50 +++++++++++++++++++=
++++
> > > >  1 file changed, 50 insertions(+)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64=
/boot/dts/freescale/imx8mp.dtsi
> > > > index bfc5c81a5bd4..1d2670b91b53 100644
> > > > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > > @@ -1616,6 +1616,56 @@ isi_in_1: endpoint {
> > > >                           };
> > > >                   };
> > > >
> > > > +                 isp_0: isp@32e10000 {
> > > > +                         compatible =3D "fsl,imx8mp-isp";
> > > > +                         reg =3D <0x32e10000 0x10000>;
> > > > +                         interrupts =3D <GIC_SPI 74 IRQ_TYPE_LEVEL=
_HIGH>;
> > > > +                         clocks =3D <&clk IMX8MP_CLK_MEDIA_ISP_ROO=
T>,
> > > > +                                  <&clk IMX8MP_CLK_MEDIA_AXI_ROOT>=
,
> > > > +                                  <&clk IMX8MP_CLK_MEDIA_APB_ROOT>=
;
> > > > +                         clock-names =3D "isp", "aclk", "hclk";
> > > > +                         assigned-clocks =3D <&clk IMX8MP_CLK_MEDI=
A_ISP>;
> > > > +                         assigned-clock-parents =3D <&clk IMX8MP_S=
YS_PLL2_500M>;
> > > > +                         assigned-clock-rates =3D <500000000>;
> > > > +                         power-domains =3D <&media_blk_ctrl IMX8MP=
_MEDIABLK_PD_ISP>;
> > > > +                         fsl,blk-ctrl =3D <&media_blk_ctrl 0>;
> > > > +                         status =3D "disabled";
> > > > +
> > > > +                         ports {
> > > > +                                 #address-cells =3D <1>;
> > > > +                                 #size-cells =3D <0>;
> > > > +
> > > > +                                 port@1 {
> > > > +                                         reg =3D <1>;
> > > > +                                 };
> > > > +                         };
> > > > +                 };
> > > > +
> > > > +                 isp_1: isp@32e20000 {
> > > > +                         compatible =3D "fsl,imx8mp-isp";
> > > > +                         reg =3D <0x32e20000 0x10000>;
> > > > +                         interrupts =3D <GIC_SPI 75 IRQ_TYPE_LEVEL=
_HIGH>;
> > > > +                         clocks =3D <&clk IMX8MP_CLK_MEDIA_ISP_ROO=
T>,
> > > > +                                  <&clk IMX8MP_CLK_MEDIA_AXI_ROOT>=
,
> > > > +                                  <&clk IMX8MP_CLK_MEDIA_APB_ROOT>=
;
> > > > +                         clock-names =3D "isp", "aclk", "hclk";
> > > > +                         assigned-clocks =3D <&clk IMX8MP_CLK_MEDI=
A_ISP>;
> > > > +                         assigned-clock-parents =3D <&clk IMX8MP_S=
YS_PLL2_500M>;
> > > > +                         assigned-clock-rates =3D <500000000>;
> > > > +                         power-domains =3D <&media_blk_ctrl IMX8MP=
_MEDIABLK_PD_ISP>;
> > > > +                         fsl,blk-ctrl =3D <&media_blk_ctrl 1>;
> > > > +                         status =3D "disabled";
> > > > +
> > > > +                         ports {
> > > > +                                 #address-cells =3D <1>;
> > > > +                                 #size-cells =3D <0>;
> > > > +
> > > > +                                 port@1 {
> > > > +                                         reg =3D <1>;
> > > > +                                 };
> > > > +                         };
> > > > +                 };
> > > > +
> > >
> > > The patch itself is okay. But you might not be able to
> > > configure the parent of IMX8MP_CLK_MEDIA_ISP if dewarp is enabled bef=
ore.
> > > This is due to IMX8MP_CLK_MEDIA_ISP_ROOT being enabled in 'pgc_ispdwp=
'
> > > power domain. Reparenting is not possible anymore in this case.
> >
> > Good point.
> >
> > > Something like
> > > ---8<---
> > > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > @@ -1837,11 +1837,13 @@ media_blk_ctrl: blk-ctrl@32ec0000 {
> > >                                                   <&clk IMX8MP_CLK_ME=
DIA_APB>,
> > >                                                   <&clk IMX8MP_CLK_ME=
DIA_DISP1_PIX>,
> > >                                                   <&clk IMX8MP_CLK_ME=
DIA_DISP2_PIX>,
> > > +                                                 <&clk IMX8MP_CLK_ME=
DIA_ISP>,
> > >                                                   <&clk IMX8MP_VIDEO_=
PLL1>;
> > >                                 assigned-clock-parents =3D <&clk IMX8=
MP_SYS_PLL2_1000M>,
> > >                                                          <&clk IMX8MP=
_SYS_PLL1_800M>,
> > >                                                          <&clk IMX8MP=
_VIDEO_PLL1_OUT>,
> > > -                                                        <&clk IMX8MP=
_VIDEO_PLL1_OUT>;
> > > +                                                        <&clk IMX8MP=
_VIDEO_PLL1_OUT>,
> > > +                                                        <&clk IMX8MP=
_SYS_PLL2_500M>;
> > >                                 assigned-clock-rates =3D <500000000>,=
 <200000000>,
> > >                                                        <0>, <0>, <103=
9500000>;
> >

According to the i.MX8MP Data sheet, the nominal speed for
MEDIA_ISP_CLOCL_ROOT is 400MHZ with 500MHz being allowed in overdrive
mode.

I think this clock rate should drop to  the nominal value of 400MHz
and those boards who support overdrive can increase it to 500MHz to
avoid stiability issues and/or running out of spec.  I created an
imx8mm and imx8mn-overdrive.dtsi file.  If there is interest, I can do
the same for the 8MP as well.

I haven't gone through all the clocks to determine if/what clocks are
being overdriven.

> > With an assigned clock rate here too then ?
>
> You are right. This posted diff is what I was using for a while now thoug=
h.
> Apparently the clock frequency was still correct.
>
> Best regards,
> Alexander
>
> > >                                 #power-domain-cells =3D <1>;
> > > ---8<---
> > > is needed.
> >
> > Sascha, are you OK with this approach ?

This patch appears to have gone stale.  Is there any way we can push
this forward?

Thanks,

adam

> >
> > > >                   dewarp: dwe@32e30000 {
> > > >                           compatible =3D "nxp,imx8mp-dw100";
> > > >                           reg =3D <0x32e30000 0x10000>;
> > > >
> > > > base-commit: 4cece764965020c22cff7665b18a012006359095
> >
> >
>
>
> --
> TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Ge=
rmany
> Amtsgericht M=C3=BCnchen, HRB 105018
> Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan S=
chneider
> http://www.tq-group.com/
>
>

