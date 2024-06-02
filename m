Return-Path: <linux-media+bounces-12389-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 398588D7685
	for <lists+linux-media@lfdr.de>; Sun,  2 Jun 2024 17:17:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7ABF71F22734
	for <lists+linux-media@lfdr.de>; Sun,  2 Jun 2024 15:17:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4A09433BE;
	Sun,  2 Jun 2024 15:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.bg header.i=@mail.bg header.b="Ca+PgNPW"
X-Original-To: linux-media@vger.kernel.org
Received: from mx5.mail.bg (mx5.mail.bg [193.201.172.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF91B66F
	for <linux-media@vger.kernel.org>; Sun,  2 Jun 2024 15:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.201.172.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717341439; cv=none; b=tW3ypm6GFGOf+gDoYPFbtMAUvr2VMDxuFDJEvxM0W4Cy+kMU3+2ux73BHUEol1ddW38XsbQVjK1H9hKLfxgtC4d5NV1XGjHw39gDFCHWpoqIu5oNXbkWhkukI5xdYNyoVhgzRSisgWjotrMlIevrKM1wUFt23j440n2lLAeYATc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717341439; c=relaxed/simple;
	bh=58hLkQt5Z6pDG2oXJ3MNYEtjr8YHua6WhYP+5Xg2h5k=;
	h=Message-ID:Date:Subject:From:To:Cc:MIME-Version:Content-Type; b=KRtJGah2OAouHxDLUCE3/XOzJ5ZnvG4g4ffUDBa2SuK9MK4HTAly27s+6h05Z3GY+JzsTbz0UEOZwIhSf8DIXRIPCBu/jRTdncvny2DyCEmKq0Yrju7lYc1ZTK7OoCLAPQ2OCxcPEjecTiJQ4dcp9Ay/z+Vi1vqMG1Ct6GvFLPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mail.bg; spf=pass smtp.mailfrom=mail.bg; dkim=pass (1024-bit key) header.d=mail.bg header.i=@mail.bg header.b=Ca+PgNPW; arc=none smtp.client-ip=193.201.172.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mail.bg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.bg
Received: from mail.bg (unknown [10.0.0.24])
	by mx5.mail.bg (Postfix) with ESMTPA id 744CC9391D8E;
	Sun,  2 Jun 2024 18:17:13 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mail.bg; s=default;
	t=1717341433; bh=58hLkQt5Z6pDG2oXJ3MNYEtjr8YHua6WhYP+5Xg2h5k=;
	h=Message-ID:Date:Subject:From:To:Cc:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=Ca+PgNPWUutkuV4i5g/1D08cTn7wQ1s2jhEjHrC93UzhQNv5bSVjGwMazwf6HbsqQ
	 mZ0CZrWxjxR5OpKRKx8f54yPQRSSNvqPdHkrED2sJM2DJBF+iwZNu64rJ42ZGztwcp
	 yxzTexqPwRd2cLB0m+qb+k52/YpIAk3Ku9dy2WPM=
Message-ID: <85bc1bd641de9ed2bca76258fdf13d7b.mailbg@mail.bg>
Date: Sun, 2 Jun 2024 18:17:13 +0300
Subject: [PATCH] media: cx23885: Add analog support for AVerMedia H789-C PCIe
 card
From: Plamen Atanasov <tigerment@mail.bg>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
 hverkuil@xs4all.nl,
 hdegoede@redhat.com,
 laurent.pinchart@ideasonboard.com
User-Agent: Mail.BG Webmail
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Priority: 3 (Normal)
Importance: Normal
X-Composed: 2024-06-02T18:17:13+03:00

This card has the following ICs: Hybrid tuner TDA18271, CX23888 PCIe bridge=
/demodulator/decoder (and DVB-T demodulator AF9013S, which is not within th=
e scope of this patch). It has the following inputs: Tuner, S-Video, Compos=
ite (shared with the luma input of S-Video) and Audio L/R RCA. VID:PID is 1=
461:e139. When the patch is applied and the cx23885 kernel module is built =
and loaded, the following dmesg can be seen:=0A=0A[  749.677298] cx23885: c=
x23885 driver version 0.0.4 loaded=0A[  749.677554] cx23885: CORE cx23885[0=
]: subsystem: 1461:e139, board: AVerMedia H789-C [card=3D63,autodetected]=
=0A[  749.831841] cx25840 8-0044: cx23888 A/V decoder found @ 0x88 (cx23885=
[0])=0A[  750.451676] cx25840 8-0044: loaded v4l-cx23885-avcore-01.fw firmw=
are (16382 bytes)=0A[  750.488064] tuner: 7-0063: Tuner -1 found with type(=
s) Radio TV.=0A[  750.488115] tda18271 7-0063: creating new instance=0A[  7=
50.490153] tda18271: TDA18271HD/C2 detected @ 7-0063=0A[  750.805043] cx238=
85: cx23885[0]: registered device video2 [v4l2]=0A[  750.805151] cx23885: c=
x23885[0]: registered device vbi2=0A[  750.808682] cx23885: cx23885[0]: als=
a: registered ALSA audio device=0A[  750.808693] cx23885: cx23885_dev_check=
revision() Hardware revision =3D 0xd0=0A[  750.808700] cx23885: cx23885[0]/=
0: found at 0000:02:00.0, rev: 4, irq: 18, latency: 0, mmio: 0xddc00000=0A=
=0AThe card has to be defined in cx23885-cards.c (firmware also has to be l=
oaded) and cx23885.h. Moreover, audio routing is configured in cx23885-vide=
o.c. Analog tuning, composite, s-video and stereo audio inputs have been su=
ccessfully tested with PAL B/G.=0A=0ASigned-off-by: Plamen Atanasov <tigerm=
ent@mail.bg>=0A---=0A drivers/media/pci/cx23885/cx23885-cards.c | 30 ++++++=
++++++++++++++++++++++++=0A drivers/media/pci/cx23885/cx23885-video.c |  3 =
++-=0A drivers/media/pci/cx23885/cx23885.h       |  1 +=0A 3 files changed,=
 33 insertions(+), 1 deletion(-)=0A=0Adiff --git a/drivers/media/pci/cx2388=
5/cx23885-cards.c b/drivers/media/pci/cx23885/cx23885-cards.c=0Aindex 9244b=
432055..b1a4cd631cf 100644=0A--- a/drivers/media/pci/cx23885/cx23885-cards.=
c=0A+++ b/drivers/media/pci/cx23885/cx23885-cards.c=0A@@ -860,6 +860,31 @@ =
struct cx23885_board cx23885_boards[] =3D {=0A                        .amux=
   =3D CX25840_AUDIO7,=0A                } },=0A        },=0A+       [CX238=
85_BOARD_AVERMEDIA_H789C] =3D {=0A+               .name           =3D "AVer=
Media H789-C",=0A+               .porta          =3D CX23885_ANALOG_VIDEO,=
=0A+               .tuner_type     =3D TUNER_NXP_TDA18271,=0A+             =
  .tuner_addr     =3D 0x63, /* 0xc0 >> 1 */=0A+               .tuner_bus   =
   =3D 1,=0A+               .input          =3D {{=0A+                     =
  .type   =3D CX23885_VMUX_TELEVISION,=0A+                       .vmux   =
=3D       CX25840_VIN7_CH3 |=0A+                                       CX25=
840_VIN5_CH2 |=0A+                                       CX25840_VIN2_CH1 |=
=0A+                                       CX25840_DIF_ON,=0A+             =
          .amux   =3D CX25840_AUDIO8,=0A+               }, {=0A+           =
            .type   =3D CX23885_VMUX_COMPOSITE1,=0A+                       =
.vmux   =3D CX25840_VIN8_CH1,=0A+                       .amux   =3D CX25840=
_AUDIO7,=0A+               }, {=0A+                       .type   =3D CX238=
85_VMUX_SVIDEO,=0A+                       .vmux   =3D CX25840_VIN8_CH1 |=0A=
+                                 CX25840_VIN7_CH3 |=0A+                   =
              CX25840_SVIDEO_ON,=0A+                       .amux   =3D CX25=
840_AUDIO7,=0A+               }, },=0A+       },=0A };=0A const unsigned in=
t cx23885_bcount =3D ARRAY_SIZE(cx23885_boards);=0A =0A@@ -1187,6 +1212,10 =
@@ struct cx23885_subid cx23885_subids[] =3D {=0A                .subvendor=
 =3D 0x1461,=0A                .subdevice =3D 0x3100,=0A                .ca=
rd      =3D CX23885_BOARD_AVERMEDIA_CE310B,=0A+       }, {=0A+             =
  .subvendor =3D 0x1461,=0A+               .subdevice =3D 0xe139,=0A+      =
         .card      =3D CX23885_BOARD_AVERMEDIA_H789C,=0A        },=0A };=
=0A const unsigned int cx23885_idcount =3D ARRAY_SIZE(cx23885_subids);=0A@@=
 -2413,6 +2442,7 @@ void cx23885_card_setup(struct cx23885_dev *dev)=0A    =
    case CX23885_BOARD_VIEWCAST_260E:=0A        case CX23885_BOARD_VIEWCAST=
_460E:=0A        case CX23885_BOARD_AVERMEDIA_CE310B:=0A+       case CX2388=
5_BOARD_AVERMEDIA_H789C:=0A                dev->sd_cx25840 =3D v4l2_i2c_new=
_subdev(&dev->v4l2_dev,=0A                                &dev->i2c_bus[2].=
i2c_adap,=0A                                "cx25840", 0x88 >> 1, NULL);=0A=
diff --git a/drivers/media/pci/cx23885/cx23885-video.c b/drivers/media/pci/=
cx23885/cx23885-video.c=0Aindex 7d4a409c433..479c0253698 100644=0A--- a/dri=
vers/media/pci/cx23885/cx23885-video.c=0A+++ b/drivers/media/pci/cx23885/cx=
23885-video.c=0A@@ -261,7 +261,8 @@ static int cx23885_video_mux(struct cx2=
3885_dev *dev, unsigned int input)=0A                (dev->board =3D=3D CX2=
3885_BOARD_AVERMEDIA_HC81R) ||=0A                (dev->board =3D=3D CX23885=
_BOARD_VIEWCAST_260E) ||=0A                (dev->board =3D=3D CX23885_BOARD=
_VIEWCAST_460E) ||=0A-               (dev->board =3D=3D CX23885_BOARD_AVERM=
EDIA_CE310B)) {=0A+               (dev->board =3D=3D CX23885_BOARD_AVERMEDI=
A_CE310B) ||=0A+               (dev->board =3D=3D CX23885_BOARD_AVERMEDIA_H=
789C)) {=0A                /* Configure audio routing */=0A                =
v4l2_subdev_call(dev->sd_cx25840, audio, s_routing,=0A                     =
   INPUT(input)->amux, 0, 0);=0Adiff --git a/drivers/media/pci/cx23885/cx23=
885.h b/drivers/media/pci/cx23885/cx23885.h=0Aindex 349462ee2c4..8ba1f30623=
8 100644=0A--- a/drivers/media/pci/cx23885/cx23885.h=0A+++ b/drivers/media/=
pci/cx23885/cx23885.h=0A@@ -102,6 +102,7 @@=0A #define CX23885_BOARD_HAUPPA=
UGE_QUADHD_DVB_885 60=0A #define CX23885_BOARD_HAUPPAUGE_QUADHD_ATSC_885 61=
=0A #define CX23885_BOARD_AVERMEDIA_CE310B         62=0A+#define CX23885_BO=
ARD_AVERMEDIA_H789C          63=0A =0A #define GPIO_0 0x00000001=0A #define=
 GPIO_1 0x00000002


