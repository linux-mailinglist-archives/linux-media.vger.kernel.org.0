Return-Path: <linux-media+bounces-39625-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08213B23978
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 22:00:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ADD29585B42
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 19:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42AED25EF81;
	Tue, 12 Aug 2025 19:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="cfqo3+Ds"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FB72FFDC8;
	Tue, 12 Aug 2025 19:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755028697; cv=pass; b=KN4AzpRkyQmll9n2G1DAOCGpKjJdJaG2SDr2+urvwtUSEJtfx1JbBZZOhT/nLraVDokA0T26p55r5mB6r2KP8a5uLgz7jtNjAApQsITrjmTNxIS5wx4uE8iOv87l3q7hKpnFcIcpc+0aphH87QXfpSsFpExLWQzwYoiLG9rsdJw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755028697; c=relaxed/simple;
	bh=mXiUGYial42kWWwbV8rz6alWZGUMlUtoSKwrKSEbkaM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QiyVqOrU0zTYuyXTrwdsPdzaNkCMdyIe2sPsIWDtMEXxULVPwHsze7Ay/0gkD8eNDfwlsyYGGAE1ZkRFXjF0RQ0MCJQHZdTEtfO7LcgZfIbRE67YjnMaHZaZJP9bVvaw2kpu5ulN5Jpd4jj9+frKrfA9/mYqEbN+gvW0J67MjNw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=cfqo3+Ds; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1755028680; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hFHC9uxqieQOgquX0c8dsWLwLjqdX8lPVX4sLZfK9kNetz0SMzp4jx5aUkWefK/v8Sz4xWhrvewy0XUTLkTZThkPEhlit+5YHYSPmRNNA9p3ELAcLNt6g5EYZZXR8FAMDnDe9ctQPnsNI+TVQ0mvo4NjBrpbEPeQlqDubA54qfk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755028680; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=hpqx7RzpdxGOcvVbi01ogR9l9+Ld4we5bzmp/qnDVCw=; 
	b=aEs0UB9mJsmLcEAQKhwJL3dYc966oVhJ7rCAWEyWh6vptUck9RAqH5t5MZDsZ153HvkHNGJo1RRi+FNlrWrBzH4DYQwJzhCzUswfXe83+8GyiXViblwMwv5S+4ZqWsCoQ19N8vlOViVrAZnHGUWRiBOOojHOsSOMFRJNaqzoDjs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755028680;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=hpqx7RzpdxGOcvVbi01ogR9l9+Ld4we5bzmp/qnDVCw=;
	b=cfqo3+DswUcxEAKl6G10whoU6cDjGfQiw4omyCbHLOLLeviS1UuIBIhTL8Djvavr
	LshuvggdToTsKe722XI6Ceuw8Tq1/JD76EBRPRu7J2Uwr1yyuHkZBAcIJXaEcMqkYnx
	vmzLUxzVr/qF3rLUlas0vQNFQgDO/t9mZQh0x1Ls=
Received: by mx.zohomail.com with SMTPS id 1755028679034363.05175347219756;
	Tue, 12 Aug 2025 12:57:59 -0700 (PDT)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Jonas Karlman <jonas@kwiboo.se>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Alex Bee <knaerzche@gmail.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/7] media: rkvdec: Add HEVC backend
Date: Tue, 12 Aug 2025 15:57:57 -0400
Message-ID: <3547812.44csPzL39Z@earth>
In-Reply-To: <50162371fd54fc976a84fcf57c9b69112a892c46.camel@collabora.com>
References:
 <20250810212454.3237486-1-jonas@kwiboo.se>
 <50162371fd54fc976a84fcf57c9b69112a892c46.camel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External

On Monday, 11 August 2025 17:52:42 EDT Nicolas Dufresne wrote:
> Le dimanche 10 ao=C3=BBt 2025 =C3=A0 21:24 +0000, Jonas Karlman a =C3=A9c=
rit :
> > This series add a HEVC backend to the Rockchip Video Decoder driver.
> >=20
> > With the dependent H.264 High 10 and 4:2:2 profile support series
> > finally merged there is finally time to send a v2 with minor changes and
> > a suggested code style fix of this series. v1 of this series has been
> > fully functional up until recent unstaging of the rkvdec driver.
> >=20
> > A version of this HEVC backend has been in use by the LibreELEC distro
> > for the past 5+ years [1]. It was initially created based on a copy of
> > the H264 backend, unstable HEVC uAPI controls and a cabac table + scali=
ng
> > matrix functions shamelessly copied 1:1 from the Rockchip mpp library.
> >=20
> > It has since then been extended to use the stable HEVC uAPI controls and
> > improved opon e.g. to include support for rk3288 and fix decoding issues
> > by Alex Bee and Nicolas Dufresne.
> >=20
> > The version submitted in this series is based on the code currently used
> > by the LibreELEC distro, excluding hard/soft reset, and with cabac table
> > and scaling matrix functions picked from Sebastian Fricke prior series
> > to add a HEVC backend [2].
> >=20
> > Big thanks to Alex Bee, Nicolas Dufresne and Sebastian Fricke for making
> > this series possible!
> >=20
> > Patch 1 add the new HEVC backend.
> > Patch 2-3 add variants support to the driver.
> > Patch 4 add support for a rk3288 variant.
> > Patch 5 add a rk3328 variant to work around hw quirks.
> > Patch 6-7 add device tree node for rk3288.
> >=20
> > This was tested on a ROCK Pi 4 (RK3399) and Rock64 (RK3328):
> >=20
> >   v4l2-compliance 1.30.1, 64 bits, 64-bit time_t
> >   ...
> >   Total for rkvdec device /dev/video1: 49, Succeeded: 49, Failed: 0,
> > Warnings: 0
> >=20
> >   Running test suite JCT-VC-HEVC_V1 with decoder FFmpeg-H.265-v4l2reque=
st
> >   ...
> >   Ran 137/147 tests successfully
>=20
> I've also tested RK3399 using Renegade Elite from Libre Computer, though
> with GStreamer. My results for this suite is 134/147, with failing tests
> being:
>=20
> - DBLK_D_VIXS_2
> - DSLICE_A_HHI_5
> - DELTAQP_A_BRCM_4
> - EXT_A_ericsson_4
> - PICSIZE_A_Bossen_1 (expected)
> - PICSIZE_B_Bossen_1 (expected)
> - PICSIZE_C_Bossen_1 (expected)
> - PICSIZE_D_Bossen_1 (expected)
> - SAODBLK_A_MainConcept_4
> - SAODBLK_B_MainConcept_4
> - TSUNEQBD_A_MAIN10_Technicolor_2 (expected)
> - WPP_D_ericsson_MAIN10_2
> - WPP_D_ericsson_MAIN_2
>=20
> Please share your list, this seems big enough difference to be worth maki=
ng
> sure we did not diverge somewhere between both interpretation of the V4L2
> spec. GStreamer has been mostly tested with MTK driver so far. Can you al=
so
> share a link to the latest ffmpeg tree you are using (since its not
> upstream FFMPEG) ?
>=20
> Detlev reports 146/147 on newer hardware using GStreamer, failing
> TSUNEQBD_A_MAIN10_Technicolor_2 (9bit chroma) only. On Detlev side, it wi=
ll
> we important to check why 8K videos (PICSIZE*) passes with a single core,
> perhaps we accidently use both cores ?

1 core can do 8K. In theory, it can do up to close to 65535x65535... It is=
=20
only a speed issue, so you can do 8K but you won't be able to get to 8K@60=
=20
with only one core on rk3588.

> Note, also expected, we failt JCT-VC-SCC, JCT-VC-MV-HEVC, and JCT-VC-RExt
> passes 2/49. This last suite is pretty new in fluster.
>=20
> regards,
> Nicolas
>=20
> >   Running test suite JCT-VC-MV-HEVC with decoder FFmpeg-H.265-v4l2reque=
st
> >   ...
> >   Ran 9/9 tests successfully
> >=20
> > And on a TinkerBoard (RK3288):
> >=20
> >   v4l2-compliance 1.30.1, 32 bits, 32-bit time_t
> >   ...
> >   Total for rkvdec device /dev/video3: 49, Succeeded: 49, Failed: 0,
> > Warnings: 0
> >=20
> >   Running test suite JCT-VC-HEVC_V1 with decoder FFmpeg-H.265-v4l2reque=
st
> >   ...
> >   Ran 137/147 tests successfully
> >=20
> >   Running test suite JCT-VC-MV-HEVC with decoder FFmpeg-H.265-v4l2reque=
st
> >   ...
> >   Ran 9/9 tests successfully
> >=20
> > The WPP_x_ericsson tests from test suite JCT-VC-HEVC_V1 has been showing
> > a mix of both Success and/or Fail result for FFmpeg-H.265-v4l2request.
> >=20
> > Full summary of fluster run can be found at [3].
> >=20
> > Please note that there is a known issue with concurrent decoding,
> > decoding errors in one decode session may affect a separate session.
> > The only known mitigation to this is to pause decoding for some time
> > and/or do a full HW reset, something to handle in future series.
> >=20
> > Changes in v2:
> > - Rabase after h264 high10/422 merge and unstaging of rkvdec driver
> > - Use new_value in transpose_and_flatten_matrices()
> > - Add NULL check for ctrl->new_elems in rkvdec_hevc_run_preamble()
> > - Set RKVDEC_WR_DDR_ALIGN_EN for RK3328
> > - Adjust code style in rkvdec_enum_coded_fmt_desc()
> > - Collect a-b tag
> > - Drop merged vdec node reg size patches
> > Link to v1:
> > https://lore.kernel.org/linux-media/20231105233630.3927502-1-jonas@kwib=
oo.
> > se
> >=20
> > [1]
> > https://github.com/LibreELEC/LibreELEC.tv/blob/master/projects/Rockchip=
/pa
> > tches/linux/default/linux-2000-v4l2-wip-rkvdec-hevc.patch [2]
> > https://lore.kernel.org/linux-media/20230101-patch-series-v2-6-2-rc1-v2=
=2D0-> > fa1897efac14@collabora.com/ [3]
> > https://gist.github.com/Kwiboo/bedf1f447b50921ffbe26cb99579582d
> >=20
> > Alex Bee (4):
> >   media: rkvdec: Add variants support
> >   media: rkvdec: Add RK3288 variant
> >   media: rkvdec: Disable QoS for HEVC and VP9 on RK3328
> >   ARM: dts: rockchip: Add vdec node for RK3288
> >=20
> > Jonas Karlman (3):
> >   media: rkvdec: Add HEVC backend
> >   media: rkvdec: Implement capability filtering
> >   media: dt-bindings: rockchip,vdec: Add RK3288 compatible
> >=20
> >  .../bindings/media/rockchip,vdec.yaml         |    1 +
> >  arch/arm/boot/dts/rockchip/rk3288.dtsi        |   17 +-
> >  .../media/platform/rockchip/rkvdec/Makefile   |    2 +-
> >  .../rockchip/rkvdec/rkvdec-hevc-data.c        | 1848 +++++++++++++++++
> >  .../platform/rockchip/rkvdec/rkvdec-hevc.c    |  826 ++++++++
> >  .../platform/rockchip/rkvdec/rkvdec-regs.h    |    4 +
> >  .../platform/rockchip/rkvdec/rkvdec-vp9.c     |   10 +
> >  .../media/platform/rockchip/rkvdec/rkvdec.c   |  184 +-
> >  .../media/platform/rockchip/rkvdec/rkvdec.h   |   15 +
> >  9 files changed, 2886 insertions(+), 21 deletions(-)
> >  create mode 100644
> > drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-data.c create mode
> > 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c





