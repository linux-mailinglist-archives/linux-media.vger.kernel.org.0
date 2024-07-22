Return-Path: <linux-media+bounces-15249-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE5093907B
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 16:19:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F1041F220FF
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 14:19:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A807B16D4F5;
	Mon, 22 Jul 2024 14:19:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE03BE5E;
	Mon, 22 Jul 2024 14:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721657974; cv=none; b=ddQEe9QfMRG6Aju1Tv7nfUTCXv15/Fzmb79INIFp4QUQ9mnER9K/MhbJJ2srdzlH/rGqwkT8r58MitafZjNgbe+dZcrVMIaKAu9qkRw5sJfMFah/dIIkr6cQeskWNAQs4rCkXkSqN1tiyBqYGKU53hIDS1oj2P7ltJeNBq/quJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721657974; c=relaxed/simple;
	bh=9fpukVFBoSrGWJZ8ym3bzs7UGegvKHi360U+irrCj5A=;
	h=From:In-Reply-To:Content-Type:References:Date:Cc:To:MIME-Version:
	 Message-ID:Subject; b=dTbWc9TX1n7eTKWWEsPGXQMHXw5JXfWBct64s2VDBHmHOkFL0saaAmlzeZOCWqFe2MFJEVySCr3fcmBcwjg+UjYpwaVXO2sxizKdMtaOWIQ9FIAI+LaJbSYdsxPcnHwbBHLV6InkMQs/oMKGry6UODCgS62IA8sBu8gkPerJqoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Received: from harlem.collaboradmins.com (harlem.collaboradmins.com [IPv6:2a01:4f8:1c0c:5936::1])
	by madrid.collaboradmins.com (Postfix) with ESMTP id 79E003780523;
	Mon, 22 Jul 2024 14:19:27 +0000 (UTC)
From: "Shreeya Patel" <shreeya.patel@collabora.com>
In-Reply-To: <2044f205-60d1-40b3-a7d7-4be7526669a3@yandex.com>
Content-Type: text/plain; charset="utf-8"
X-Forward: 127.0.0.1
References: <20240719124032.26852-1-shreeya.patel@collabora.com>
 <20240719124032.26852-5-shreeya.patel@collabora.com> <2044f205-60d1-40b3-a7d7-4be7526669a3@yandex.com>
Date: Mon, 22 Jul 2024 15:19:27 +0100
Cc: heiko@sntech.de, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de, jose.abreu@synopsys.com, nelson.costa@synopsys.com, shawn.wen@rock-chips.com, nicolas.dufresne@collabora.com, hverkuil@xs4all.nl, hverkuil-cisco@xs4all.nl, kernel@collabora.com, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, "Dmitry Osipenko" <dmitry.osipenko@collabora.com>
To: "Johan Jonker" <jbx6244@yandex.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <337fba-669e6a80-1-6e42ea80@161157687>
Subject: =?utf-8?q?Re=3A?= [PATCH v4 4/4] =?utf-8?q?media=3A?=
 =?utf-8?q?_platform=3A?==?utf-8?q?_synopsys=3A?= Add support for hdmi input 
 driver
User-Agent: SOGoMail 5.10.0
Content-Transfer-Encoding: quoted-printable

On Saturday, July 20, 2024 17:03 IST, Johan Jonker <jbx6244@yandex.com>=
 wrote:

Hi Johan,

Please see my response below.

>=20
>=20
> On 7/19/24 14:40, Shreeya Patel wrote:
> > Add initial support for the Synopsys DesignWare HDMI RX
> > Controller Driver used by Rockchip RK3588. The driver
> > supports:
> >  - HDMI 1.4b and 2.0 modes (HDMI 4k@60Hz)
> >  - RGB888, YUV422, YUV444 and YCC420 pixel formats
> >  - CEC
> >  - EDID configuration
> >=20
> > The hardware also has Audio and HDCP capabilities, but these are
> > not yet supported by the driver.
> >=20
> > Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> > Tested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> > Co-developed-by: Dingxian Wen <shawn.wen@rock-chips.com>
> > Signed-off-by: Dingxian Wen <shawn.wen@rock-chips.com>
> > Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>
> > ---
> >=20
> > Changes in v4 :-
> >   - Create a separate config option for selecting the EDID
> >     and enable it by default
> >   - Improve the comment related to DV timings and move it
> >     to the side of hdmirx=5Fget=5Fdetected=5Ftimings
> >   - Add 100ms delay before pulling the HPD high
> >   - Do not return the detected timings from VIDIOC=5FG=5FDV=5FTIMIN=
GS
> >   - Drop the bus info from hdmirx=5Fquerycap
> >   - If *num=5Fplanes !=3D 0 then return 0 in hdmirx=5Fqueue=5Fsetup
> >   - Set queue->min=5Fqueued=5Fbuffers to 1
> >   - Drop q->allow=5Fcache=5Fhints =3D 0; as it's always 0 by defaul=
t
> >   - Add a comment for q->dma=5Fattrs =3D DMA=5FATTR=5FFORCE=5FCONTI=
GUOUS;
> >   - Drop .read =3D vb2=5Ffop=5Fread as it's not supported by driver
> >   - Remove redundant edid=5Finit=5Fdata=5F600M
> >   - Make HPD low when driver is loaded
> >   - Add support for reading AVI Infoframe
> >   - Remove msg=5Flen checks from hdmirx=5Fcec=5Ftransmit
> >   - Add info about the CEC compliance test in the cover letter
> >   - Add arbitration lost status
> >   - Validate the physical address inside the EDID
> >=20
> > Changes in v3 :-
> >   - Use v4l2-common helper functions
> >=20
> > Changes in v2 :-
> >   - Fix checkpatch --strict warnings
> >   - Rename resets, vo1-grf and HPD node names as per the DT changes
> >=20
> >  drivers/media/platform/Kconfig                |    1 +
> >  drivers/media/platform/Makefile               |    1 +
> >  drivers/media/platform/synopsys/Kconfig       |    3 +
> >  drivers/media/platform/synopsys/Makefile      |    2 +
> >  .../media/platform/synopsys/hdmirx/Kconfig    |   27 +
> >  .../media/platform/synopsys/hdmirx/Makefile   |    4 +
> >  .../platform/synopsys/hdmirx/snps=5Fhdmirx.c    | 2763 +++++++++++=
++++++
> >  .../platform/synopsys/hdmirx/snps=5Fhdmirx.h    |  394 +++
> >  .../synopsys/hdmirx/snps=5Fhdmirx=5Fcec.c         |  285 ++
> >  .../synopsys/hdmirx/snps=5Fhdmirx=5Fcec.h         |   44 +
> >  10 files changed, 3524 insertions(+)
> >  create mode 100644 drivers/media/platform/synopsys/Kconfig
> >  create mode 100644 drivers/media/platform/synopsys/Makefile
> >  create mode 100644 drivers/media/platform/synopsys/hdmirx/Kconfig
> >  create mode 100644 drivers/media/platform/synopsys/hdmirx/Makefile
> >  create mode 100644 drivers/media/platform/synopsys/hdmirx/snps=5Fh=
dmirx.c
> >  create mode 100644 drivers/media/platform/synopsys/hdmirx/snps=5Fh=
dmirx.h
> >  create mode 100644 drivers/media/platform/synopsys/hdmirx/snps=5Fh=
dmirx=5Fcec.c
> >  create mode 100644 drivers/media/platform/synopsys/hdmirx/snps=5Fh=
dmirx=5Fcec.h
> >=20
> > diff --git a/drivers/media/platform/Kconfig b/drivers/media/platfor=
m/Kconfig
> > index 85d2627776b6..9287faafdce5 100644
> > --- a/drivers/media/platform/Kconfig
> > +++ b/drivers/media/platform/Kconfig
> > @@ -85,6 +85,7 @@ source "drivers/media/platform/rockchip/Kconfig"
> >  source "drivers/media/platform/samsung/Kconfig"
> >  source "drivers/media/platform/st/Kconfig"
> >  source "drivers/media/platform/sunxi/Kconfig"
> > +source "drivers/media/platform/synopsys/Kconfig"
> >  source "drivers/media/platform/ti/Kconfig"
> >  source "drivers/media/platform/verisilicon/Kconfig"
> >  source "drivers/media/platform/via/Kconfig"
> > diff --git a/drivers/media/platform/Makefile b/drivers/media/platfo=
rm/Makefile
> > index ace4e34483dd..6fd7db0541c7 100644
> > --- a/drivers/media/platform/Makefile
> > +++ b/drivers/media/platform/Makefile
> > @@ -28,6 +28,7 @@ obj-y +=3D rockchip/
> >  obj-y +=3D samsung/
> >  obj-y +=3D st/
> >  obj-y +=3D sunxi/
> > +obj-y +=3D synopsys/
> >  obj-y +=3D ti/
> >  obj-y +=3D verisilicon/
> >  obj-y +=3D via/
> > diff --git a/drivers/media/platform/synopsys/Kconfig b/drivers/medi=
a/platform/synopsys/Kconfig
> > new file mode 100644
> > index 000000000000..4fd521f78425
> > --- /dev/null
> > +++ b/drivers/media/platform/synopsys/Kconfig
> > @@ -0,0 +1,3 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +
> > +source "drivers/media/platform/synopsys/hdmirx/Kconfig"
> > diff --git a/drivers/media/platform/synopsys/Makefile b/drivers/med=
ia/platform/synopsys/Makefile
> > new file mode 100644
> > index 000000000000..3b12c574dd67
> > --- /dev/null
> > +++ b/drivers/media/platform/synopsys/Makefile
> > @@ -0,0 +1,2 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +obj-y +=3D hdmirx/
> > diff --git a/drivers/media/platform/synopsys/hdmirx/Kconfig b/drive=
rs/media/platform/synopsys/hdmirx/Kconfig
> > new file mode 100644
> > index 000000000000..ab569e59300f
> > --- /dev/null
> > +++ b/drivers/media/platform/synopsys/hdmirx/Kconfig
> > @@ -0,0 +1,27 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +config VIDEO=5FSYNOPSYS=5FHDMIRX
> > +	tristate "Synopsys DesignWare HDMI Receiver driver"
> > +	depends on VIDEO=5FDEV
> > +	depends on ARCH=5FROCKCHIP
> > +	select MEDIA=5FCONTROLLER
> > +	select VIDEO=5FV4L2=5FSUBDEV=5FAPI
> > +	select VIDEOBUF2=5FDMA=5FCONTIG
> > +	select CEC=5FCORE
> > +	select CEC=5FNOTIFIER
> > +	select HDMI
> > +	help
> > +	  Support for Synopsys HDMI HDMI RX Controller.
> > +	  This driver supports HDMI 2.0 version.
> > +
> > +	  To compile this driver as a module, choose M here. The module
> > +	  will be called synopsys=5Fhdmirx.
> > +
> > +config HDMIRX=5FLOAD=5FDEFAULT=5FEDID
> > +	bool "Load default EDID"
> > +	depends on VIDEO=5FSYNOPSYS=5FHDMIRX
> > +	default "y"
> > +	help
> > +	  Preload the default EDID (Extended Display Identification Data)=
.
> > +	  EDID contains information about the capabilities of the display=
,
> > +	  such as supported resolutions, refresh rates, and audio formats=
.
> > diff --git a/drivers/media/platform/synopsys/hdmirx/Makefile b/driv=
ers/media/platform/synopsys/hdmirx/Makefile
> > new file mode 100644
> > index 000000000000..2fa2d9e25300
> > --- /dev/null
> > +++ b/drivers/media/platform/synopsys/hdmirx/Makefile
> > @@ -0,0 +1,4 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +synopsys-hdmirx-objs :=3D snps=5Fhdmirx.o snps=5Fhdmirx=5Fcec.o
> > +
> > +obj-$(CONFIG=5FVIDEO=5FSYNOPSYS=5FHDMIRX) +=3D synopsys-hdmirx.o
> > diff --git a/drivers/media/platform/synopsys/hdmirx/snps=5Fhdmirx.c=
 b/drivers/media/platform/synopsys/hdmirx/snps=5Fhdmirx.c
>=20
> [..]
>=20
> For FTRACE it is needed that all functions start with the same functi=
on prefix.
>=20
> > +static bool tx=5F5v=5Fpower=5Fpresent(struct snps=5Fhdmirx=5Fdev *=
hdmirx=5Fdev)
>=20
> > +static bool signal=5Fnot=5Flock(struct snps=5Fhdmirx=5Fdev *hdmirx=
=5Fdev)
>=20
> > +static bool port=5Fno=5Flink(struct snps=5Fhdmirx=5Fdev *hdmirx=5F=
dev)
>=20
> > +static int wait=5Freg=5Fbit=5Fstatus(struct snps=5Fhdmirx=5Fdev *h=
dmirx=5Fdev, u32 reg,
> > +			       u32 bit=5Fmask, u32 expect=5Fval, bool is=5Fgrf,
> > +			       u32 ms)
>=20
> > +static void return=5Fall=5Fbuffers(struct hdmirx=5Fstream *stream,
> > +			       enum vb2=5Fbuffer=5Fstate state)
>=20
> > +static void process=5Fsignal=5Fchange(struct snps=5Fhdmirx=5Fdev *=
hdmirx=5Fdev)
>=20
> > +static void avpunit=5F0=5Fint=5Fhandler(struct snps=5Fhdmirx=5Fdev=
 *hdmirx=5Fdev,
> > +				  int status, bool *handled)
>=20
> > +static void avpunit=5F1=5Fint=5Fhandler(struct snps=5Fhdmirx=5Fdev=
 *hdmirx=5Fdev,
> > +				  int status, bool *handled)
>=20
> > +static void mainunit=5F0=5Fint=5Fhandler(struct snps=5Fhdmirx=5Fde=
v *hdmirx=5Fdev,
> > +				   int status, bool *handled)
>=20
> > +static void mainunit=5F2=5Fint=5Fhandler(struct snps=5Fhdmirx=5Fde=
v *hdmirx=5Fdev,
> > +				   int status, bool *handled)
>=20
> > +static void pkt=5F2=5Fint=5Fhandler(struct snps=5Fhdmirx=5Fdev *hd=
mirx=5Fdev,
> > +			      int status, bool *handled)
>=20
> > +static void scdc=5Fint=5Fhandler(struct snps=5Fhdmirx=5Fdev *hdmir=
x=5Fdev,
> > +			     int status, bool *handled)
>=20
> > +static void dma=5Fidle=5Fint=5Fhandler(struct snps=5Fhdmirx=5Fdev =
*hdmirx=5Fdev,
> > +				 bool *handled)
>=20
> > +static void line=5Fflag=5Fint=5Fhandler(struct snps=5Fhdmirx=5Fdev=
 *hdmirx=5Fdev,
> > +				  bool *handled)
>=20
> [..]
>=20
> > +static int hdmirx=5Fsetup=5Firq(struct snps=5Fhdmirx=5Fdev *hdmirx=
=5Fdev,
> > +			    struct platform=5Fdevice *pdev)
> > +{
> > +	struct device *dev =3D hdmirx=5Fdev->dev;
> > +	int ret, irq;
> > +
> > +	irq =3D platform=5Fget=5Firq=5Fbyname(pdev, "hdmi");
> > +	if (irq < 0) {
> > +		dev=5Ferr=5Fprobe(dev, irq, "failed to get hdmi irq\n");
> > +		return irq;
> > +	}
> > +
> > +	irq=5Fset=5Fstatus=5Fflags(irq, IRQ=5FNOAUTOEN);
> > +
> > +	hdmirx=5Fdev->hdmi=5Firq =3D irq;
> > +	ret =3D devm=5Frequest=5Firq(dev, irq, hdmirx=5Fhdmi=5Firq=5Fhand=
ler, 0,
> > +			       "rk=5Fhdmirx-hdmi", hdmirx=5Fdev);
> > +	if (ret) {
> > +		dev=5Ferr=5Fprobe(dev, ret, "failed to request hdmi irq\n");
> > +		return ret;
> > +	}
> > +
> > +	irq =3D platform=5Fget=5Firq=5Fbyname(pdev, "dma");
> > +	if (irq < 0) {
> > +		dev=5Ferr=5Fprobe(dev, irq, "failed to get dma irq\n");
> > +		return irq;
> > +	}
> > +
> > +	irq=5Fset=5Fstatus=5Fflags(irq, IRQ=5FNOAUTOEN);
> > +
> > +	hdmirx=5Fdev->dma=5Firq =3D irq;
> > +	ret =3D devm=5Frequest=5Fthreaded=5Firq(dev, irq, NULL, hdmirx=5F=
dma=5Firq=5Fhandler,
> > +					IRQF=5FONESHOT, "rk=5Fhdmirx-dma",
> > +					hdmirx=5Fdev);
> > +	if (ret) {
> > +		dev=5Ferr=5Fprobe(dev, ret, "failed to request dma irq\n");
> > +		return ret;
> > +	}
> > +
> > +	irq =3D gpiod=5Fto=5Firq(hdmirx=5Fdev->detect=5F5v=5Fgpio);
> > +	if (irq < 0) {
> > +		dev=5Ferr=5Fprobe(dev, irq, "failed to get hdmirx-5v irq\n");
> > +		return irq;
> > +	}
> > +
> > +	irq=5Fset=5Fstatus=5Fflags(irq, IRQ=5FNOAUTOEN);
> > +
> > +	hdmirx=5Fdev->det=5Firq =3D irq;
> > +	ret =3D devm=5Frequest=5Firq(dev, irq, hdmirx=5F5v=5Fdet=5Firq=5F=
handler,
> > +			       IRQF=5FTRIGGER=5FFALLING | IRQF=5FTRIGGER=5FRISING,
> > +			       "rk=5Fhdmirx-5v", hdmirx=5Fdev);
> > +	if (ret) {
> > +		dev=5Ferr=5Fprobe(dev, ret, "failed to request hdmirx-5v irq\n")=
;
> > +		return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int hdmirx=5Fregister=5Fcec(struct snps=5Fhdmirx=5Fdev *hdm=
irx=5Fdev,
> > +			       struct platform=5Fdevice *pdev)
> > +{
> > +	struct device *dev =3D hdmirx=5Fdev->dev;
> > +	struct hdmirx=5Fcec=5Fdata cec=5Fdata;
> > +	int irq;
> > +
> > +	irq =3D platform=5Fget=5Firq=5Fbyname(pdev, "cec");
> > +	if (irq < 0) {
> > +		dev=5Ferr=5Fprobe(dev, irq, "failed to get cec irq\n");
> > +		return irq;
> > +	}
> > +
> > +	hdmirx=5Fdev->cec=5Fnotifier =3D cec=5Fnotifier=5Fconn=5Fregister=
(dev, NULL, NULL);
> > +	if (!hdmirx=5Fdev->cec=5Fnotifier)
> > +		return -EINVAL;
> > +
> > +	cec=5Fdata.hdmirx =3D hdmirx=5Fdev;
> > +	cec=5Fdata.dev =3D hdmirx=5Fdev->dev;
> > +	cec=5Fdata.ops =3D &hdmirx=5Fcec=5Fops;
> > +	cec=5Fdata.irq =3D irq;
> > +
> > +	hdmirx=5Fdev->cec =3D snps=5Fhdmirx=5Fcec=5Fregister(&cec=5Fdata)=
;
> > +	if (!hdmirx=5Fdev->cec) {
> > +		cec=5Fnotifier=5Fconn=5Funregister(hdmirx=5Fdev->cec=5Fnotifier)=
;
> > +		return -EINVAL;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int hdmirx=5Fprobe(struct platform=5Fdevice *pdev)
> > +{
> > +	struct snps=5Fhdmirx=5Fdev *hdmirx=5Fdev;
> > +	struct device *dev =3D &pdev->dev;
> > +	struct v4l2=5Fctrl=5Fhandler *hdl;
> > +	struct hdmirx=5Fstream *stream;
> > +	struct v4l2=5Fdevice *v4l2=5Fdev;
> > +	int ret;
> > +
> > +	hdmirx=5Fdev =3D devm=5Fkzalloc(dev, sizeof(*hdmirx=5Fdev), GFP=5F=
KERNEL);
> > +	if (!hdmirx=5Fdev)
> > +		return -ENOMEM;
> > +
> > +	ret =3D dma=5Fcoerce=5Fmask=5Fand=5Fcoherent(dev, DMA=5FBIT=5FMAS=
K(32));
> > +	if (ret)
> > +		return ret;
> > +
> > +	hdmirx=5Fdev->dev =3D dev;
> > +	dev=5Fset=5Fdrvdata(dev, hdmirx=5Fdev);
> > +
> > +	ret =3D hdmirx=5Fparse=5Fdt(hdmirx=5Fdev);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D hdmirx=5Fsetup=5Firq(hdmirx=5Fdev, pdev);
> > +	if (ret)
> > +		return ret;
> > +
> > +	hdmirx=5Fdev->regs =3D devm=5Fplatform=5Fioremap=5Fresource(pdev,=
 0);
> > +	if (IS=5FERR(hdmirx=5Fdev->regs))
> > +		return dev=5Ferr=5Fprobe(dev, PTR=5FERR(hdmirx=5Fdev->regs),
> > +				     "failed to remap regs resource\n");
> > +
> > +	mutex=5Finit(&hdmirx=5Fdev->stream=5Flock);
> > +	mutex=5Finit(&hdmirx=5Fdev->work=5Flock);
> > +	spin=5Flock=5Finit(&hdmirx=5Fdev->rst=5Flock);
> > +
> > +	init=5Fcompletion(&hdmirx=5Fdev->cr=5Fwrite=5Fdone);
> > +	init=5Fcompletion(&hdmirx=5Fdev->timer=5Fbase=5Flock);
> > +	init=5Fcompletion(&hdmirx=5Fdev->avi=5Fpkt=5Frcv);
> > +
> > +	INIT=5FWORK(&hdmirx=5Fdev->work=5Fwdt=5Fconfig, hdmirx=5Fwork=5Fw=
dt=5Fconfig);
> > +	INIT=5FDELAYED=5FWORK(&hdmirx=5Fdev->delayed=5Fwork=5Fhotplug,
> > +			  hdmirx=5Fdelayed=5Fwork=5Fhotplug);
> > +	INIT=5FDELAYED=5FWORK(&hdmirx=5Fdev->delayed=5Fwork=5Fres=5Fchang=
e,
> > +			  hdmirx=5Fdelayed=5Fwork=5Fres=5Fchange);
> > +	INIT=5FDELAYED=5FWORK(&hdmirx=5Fdev->delayed=5Fwork=5Fheartbeat,
> > +			  hdmirx=5Fdelayed=5Fwork=5Fheartbeat);
> > +
> > +	hdmirx=5Fdev->cur=5Ffmt=5Ffourcc =3D V4L2=5FPIX=5FFMT=5FBGR24;
> > +	hdmirx=5Fdev->timings =3D cea640x480;
> > +
> > +	hdmirx=5Fenable(dev);
> > +	hdmirx=5Finit(hdmirx=5Fdev);
> > +
> > +	v4l2=5Fdev =3D &hdmirx=5Fdev->v4l2=5Fdev;
> > +	strscpy(v4l2=5Fdev->name, dev=5Fname(dev), sizeof(v4l2=5Fdev->nam=
e));
> > +
> > +	hdl =3D &hdmirx=5Fdev->hdl;
> > +	v4l2=5Fctrl=5Fhandler=5Finit(hdl, 1);
> > +
> > +	hdmirx=5Fdev->detect=5Ftx=5F5v=5Fctrl =3D v4l2=5Fctrl=5Fnew=5Fstd=
(hdl, NULL,
> > +							  V4L2=5FCID=5FDV=5FRX=5FPOWER=5FPRESENT,
> > +							  0, 1, 0, 0);
> > +
> > +	hdmirx=5Fdev->rgb=5Frange =3D v4l2=5Fctrl=5Fnew=5Fstd=5Fmenu(hdl,=
 0,
> > +						       V4L2=5FCID=5FDV=5FRX=5FRGB=5FRANGE,
> > +						       V4L2=5FDV=5FRGB=5FRANGE=5FFULL, 0,
> > +						       V4L2=5FDV=5FRGB=5FRANGE=5FAUTO);
> > +
> > +	hdmirx=5Fdev->rgb=5Frange->flags |=3D V4L2=5FCTRL=5FFLAG=5FREAD=5F=
ONLY;
> > +
> > +	if (hdl->error) {
> > +		dev=5Ferr(dev, "v4l2 ctrl handler init failed\n");
> > +		ret =3D hdl->error;
> > +		goto err=5Fpm;
> > +	}
> > +	hdmirx=5Fdev->v4l2=5Fdev.ctrl=5Fhandler =3D hdl;
> > +
> > +	ret =3D v4l2=5Fdevice=5Fregister(dev, &hdmirx=5Fdev->v4l2=5Fdev);
> > +	if (ret < 0) {
> > +		dev=5Ferr(dev, "register v4l2 device failed\n");
> > +		goto err=5Fhdl;
> > +	}
> > +
> > +	stream =3D &hdmirx=5Fdev->stream;
> > +	stream->hdmirx=5Fdev =3D hdmirx=5Fdev;
> > +	ret =3D hdmirx=5Fregister=5Fstream=5Fvdev(stream);
> > +	if (ret < 0) {
> > +		dev=5Ferr(dev, "register video device failed\n");
> > +		goto err=5Funreg=5Fv4l2=5Fdev;
> > +	}
> > +
> > +	ret =3D hdmirx=5Fregister=5Fcec(hdmirx=5Fdev, pdev);
> > +	if (ret)
> > +		goto err=5Funreg=5Fvideo=5Fdev;
> > +
> > +	hdmirx=5Fload=5Fdefault=5Fedid(hdmirx=5Fdev);
> > +
> > +	hdmirx=5Fenable=5Firq(dev);
> > +
> > +	return 0;
> > +
> > +err=5Funreg=5Fvideo=5Fdev:
> > +	video=5Funregister=5Fdevice(&hdmirx=5Fdev->stream.vdev);
> > +err=5Funreg=5Fv4l2=5Fdev:
> > +	v4l2=5Fdevice=5Funregister(&hdmirx=5Fdev->v4l2=5Fdev);
> > +err=5Fhdl:
> > +	v4l2=5Fctrl=5Fhandler=5Ffree(&hdmirx=5Fdev->hdl);
> > +err=5Fpm:
> > +	hdmirx=5Fdisable(dev);
> > +
> > +	return ret;
> > +}
> > +
> > +static void hdmirx=5Fremove(struct platform=5Fdevice *pdev)
> > +{
> > +	struct device *dev =3D &pdev->dev;
> > +	struct snps=5Fhdmirx=5Fdev *hdmirx=5Fdev =3D dev=5Fget=5Fdrvdata(=
dev);
> > +
> > +	snps=5Fhdmirx=5Fcec=5Funregister(hdmirx=5Fdev->cec);
> > +	cec=5Fnotifier=5Fconn=5Funregister(hdmirx=5Fdev->cec=5Fnotifier);
> > +
> > +	hdmirx=5Fdisable=5Firq(dev);
> > +
> > +	video=5Funregister=5Fdevice(&hdmirx=5Fdev->stream.vdev);
> > +	v4l2=5Fctrl=5Fhandler=5Ffree(&hdmirx=5Fdev->hdl);
> > +	v4l2=5Fdevice=5Funregister(&hdmirx=5Fdev->v4l2=5Fdev);
> > +
> > +	hdmirx=5Fdisable(dev);
> > +
> > +	reset=5Fcontrol=5Fbulk=5Fassert(HDMIRX=5FNUM=5FRST, hdmirx=5Fdev-=
>resets);
> > +
> > +	of=5Freserved=5Fmem=5Fdevice=5Frelease(dev);
> > +}
> > +
> > +static const struct of=5Fdevice=5Fid hdmirx=5Fid[] =3D {
> > +	{ .compatible =3D "rockchip,rk3588-hdmirx-ctrler" },
> > +	{ },
> > +};
> > +MODULE=5FDEVICE=5FTABLE(of, hdmirx=5Fid);
> > +
> > +static struct platform=5Fdriver hdmirx=5Fdriver =3D {
> > +	.probe =3D hdmirx=5Fprobe,
> > +	.remove =3D hdmirx=5Fremove,
> > +	.driver =3D {
> > +		.name =3D "snps=5Fhdmirx",
> > +		.of=5Fmatch=5Ftable =3D hdmirx=5Fid,
> > +		.pm =3D &snps=5Fhdmirx=5Fpm=5Fops,
> > +	}
> > +};
> > +module=5Fplatform=5Fdriver(hdmirx=5Fdriver);
> > +
> > +MODULE=5FDESCRIPTION("Rockchip HDMI Receiver Driver");
>=20
> While the file is called snps=5Fhdmirx.c and the driver name is "snps=
=5Fhdmirx" the module description calls it a Rockchip driver.
> This patch serie somewhat hints at the use of multiple SoCs and possi=
ble multiple brands then a more clear separation between common snps an=
d Rockchip (rk3588) SoC specific is needed?
>=20

This driver was originally developed by Rockchip, and we fixed a few is=
sues
and cleaned it up. As I said, the driver has only been tested on the Ro=
ck5B so far,
but we believe it could also work with the Synopsys IP on other SoCs in=
 the future.
Hence, I renamed almost everything from rockchip to synopsys.

However, I missed changing the MODULE=5FDESCRIPTION here, and it should=
 be
"Synopsys HDMI RX Controller Driver." I'll make the change in v5.


Thanks,
Shreeya Patel

> Johan
>=20
> > +MODULE=5FAUTHOR("Dingxian Wen <shawn.wen@rock-chips.com>");
> > +MODULE=5FAUTHOR("Shreeya Patel <shreeya.patel@collabora.com>");
> > +MODULE=5FLICENSE("GPL");


