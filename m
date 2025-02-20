Return-Path: <linux-media+bounces-26486-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6ECA3DE2F
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 16:20:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44CA6171C8F
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 15:18:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E28B1D61A3;
	Thu, 20 Feb 2025 15:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="3Mo7qbIj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7AB1FC7F5
	for <linux-media@vger.kernel.org>; Thu, 20 Feb 2025 15:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740064716; cv=none; b=CPMJEkXx3yLvtSVDHBkLCvnB5mI0CMLrU3MRIyOq6dvD7z0gAEj3IRA4chwYBOpGsI48uMotsLMqojTe/3+U1dCDvpkA4PQtAeCgmJItCPPG42JRZWeidxsE/8r7MTVY+thig+QcZlPfel8fuCUANcMG1INOIIoMMGmHcXG5XDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740064716; c=relaxed/simple;
	bh=1Z/T3lc3yBjMlzf8A1N8nmub5KJVx5PuBERyLa3v0Gk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HZt3Y61+Ix+e6fDgWq1sZSNo1VuJhE9AFMOWoEhh297W+rLbWaXNgsU47w89keIgI13WK+P9qIngf26Wl4WhxPo682kjY7Mb2eeypSfok3y0FMzcJCUKjTjmcG7GcQuuUFC8ndMuju8FevcNyTSxbJZchnOgFn/06dHFODCqUQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=3Mo7qbIj; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-46c8474d8daso9152481cf.3
        for <linux-media@vger.kernel.org>; Thu, 20 Feb 2025 07:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1740064711; x=1740669511; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3sKLkYaRQTurpqNj/WpfPRyW33uCSpBwEpvhiU82VZo=;
        b=3Mo7qbIjwb/9CXI99wdO5rzUFwzX6Nk5JnHHm9HrCKQIBo8IwHAkmEc7L+lPUCES9E
         z69ZZY9qP1b7EVvVmWMKISbWN/+9frmUaTvn3xbEIiEJ9gqQ2hZcFc4623Bg1rvNd/sC
         HemeURStcCxJGaw4L7J7S0ieizwDx+mCGQTf3RaKMhQ84UtRgAQBG7vBk3m9jPCLTLGI
         j1fO1hT8MIsAUwrVUeZXvzQ8/NqrilIUhSpulnGpBlPmPJZlpy/GBKURfDSw3xLEGpRN
         22POV9gjqIZj3IejmgEPkxnqUYyGvYGQFovan0EkM5XdACfPO06eT9HyzJ2WA2s3fktq
         WSyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740064711; x=1740669511;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3sKLkYaRQTurpqNj/WpfPRyW33uCSpBwEpvhiU82VZo=;
        b=C/z4XoEE+nMv67mX4TgWZNsnxwALV+BlKo9hHkHfHxMYDsF2hpjI31WhxWkaz6+44Z
         jhxfga1hMHS/pszlZwuxF+lStlBptP4jv0E7E4fFaM0hOStOJ0kskhyGlSeNbqngbpiN
         iiQgdVAlH2lB/pmmeyV7GXGfDgCIyllzPsyt5VHtiuaEqInHqnGHW4EhN1Y5u91ZIOuF
         L3532MFqe+gCNKbn2cT72Vdl2vxqDpPRI03oHTDh/la01TAr86EBxNubhxRdUkciNpIl
         ns09u416P3pSAQK7RnCXAdfUExXU28UQEKVDzTSjKSyZ6lTYE+UZIwRG7CW/5+lyDd8J
         fNzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNP1L5R7Tgs5I/+1mIQGl8nbFJ55E1/79Fy0AWIkegKijlOyAJN63L4528uP472SYCR9be191X8LtovA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwW0fyPFwVEbx3GfW7NhvDi2UWiSXzd/y5Nopfzf+FwQV1nWaai
	9BS4QUfbJie8QFqdGrLMZ5Uh/pwnASi954kVVqraoLxZU+NqEwuAMp1kXqgjOf8=
X-Gm-Gg: ASbGnctTLGquJwOf/2smVH6nftb4z9S8+slMb2cZxKKSuJy0+1ySi3G1VhK/XP8co3X
	xLCxrh5ezLqxUilgS67zINoAzmbiaw/qsolvwVg9DOtnK7ucDJbvgW6wm7rOIyXE/xmmtCG6aR4
	TMFtM1fKa4ldwowHmCK31IidjYD8gkH/iG3mI7WOGpDZ+wYHKpVHqqfTKOw1KEzaMZiYMYbIhq6
	qcw1w5XfWca4HJVXaSCf7IIShBCePyoT87Q3LVy9gOln3xjoxHX5lM5LWQXkChaFbz2lEV+BmCB
	XSj4OzxlrOPARH7glY4h
X-Google-Smtp-Source: AGHT+IFfd1C9+qR6Eea6myLi8llH1CEbiiHTiPDVwoB7SJis+t602EqW0t7bGOwBI1E12P2T9n+HOw==
X-Received: by 2002:ac8:5d46:0:b0:472:95f:d25e with SMTP id d75a77b69052e-472095fd5d9mr95424831cf.19.1740064710191;
        Thu, 20 Feb 2025 07:18:30 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:e976::5ac? ([2606:6d00:11:e976::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-471f3df2698sm43128221cf.23.2025.02.20.07.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 07:18:29 -0800 (PST)
Message-ID: <008038da5df46f040e3d6707d5f1344571a18480.camel@ndufresne.ca>
Subject: Re: [PATCH v4 4/4] media: mediatek: add MT8188 AIE driver
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 "bo.kong" <bo.kong@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring	 <robh@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, 	linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-mediatek@lists.infradead.org
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com, 
	zhaoyuan.chen@mediatek.com, teddy.chen@mediatek.com
Date: Thu, 20 Feb 2025 10:18:28 -0500
In-Reply-To: <fb16cf84-99f0-4cb8-bb7b-aad3ed37e4cb@collabora.com>
References: <20250220070114.15015-1-bo.kong@mediatek.com>
	 <20250220070114.15015-5-bo.kong@mediatek.com>
	 <fb16cf84-99f0-4cb8-bb7b-aad3ed37e4cb@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

Le jeudi 20 f=C3=A9vrier 2025 =C3=A0 10:49 +0100, AngeloGioacchino Del Regn=
o a
=C3=A9crit=C2=A0:
> Il 20/02/25 07:59, bo.kong ha scritto:
> > From: Bo Kong <Bo.Kong@mediatek.com>
> >=20
> > Add a V4L2 sub-device driver for MT8188 AIE.
> >=20
> > Signed-off-by: Bo Kong <Bo.Kong@mediatek.com>
> > ---
> > Changes in v4:
> > 1. Remove ccflags that are not used in Makefile
> > 2. Optimize the write register operation
> > 3. Remove excess config from Kconfig
> > 4. Remove the probe function related to hw_version
> > 5. Remove
> > mtk_aie_hw_connect,mtk_aie_hw_enable,mtk_aie_hw_disconnect etc
> > 6. Fix coding style in mtk_aie.h
> > 7. Replace signed short with s16
> > 8. Remove aie_reset_output_buf function, optimize this part of the
> > code
> > 9. Remove struct race_result and other structures, and use s16
> > instead
> > of structures
> > 10. Change multiple different types of width and height into the
> > same
> > structure
> > 11. Remove all unnecessary variable initialization
> > operations,retaining
> > some variables that need to be initialized
> > 12. Delete print physical address
> > 13. Remove aie_init_table and combine aie_init_table into the
> > aie_update_table function
> > 14. Optimize the readability of some codes, add aie_calculate_pa
> > function
> > 15. Optimize the aie_execute function and divide this function into
> > aie_execute_face_detection, aie_execute_attribute_detection,
> > aie_execute_fld_detection functions
> > 16. Modify arrays with all 5 into define ANCHOR_EN_NUM
> > 17. Remove mtk_aie_get_variant function
> > 18. The version in the code was deleted, but the variables in the
> > enque
> > info structure cannot be deleted. Once deleted, the AIE will not
> > work
> > because this structure needs to be aligned with User Space.
> >=20
> > Changes in v3:
> > 1. Remove not used include file, include only headers which AIE use
> > 2. Remove Makefile some private driver headers
> >=20
> > Changes in v2:
> > 1. Fix coding style
> > ---
> > =C2=A0 drivers/media/platform/mediatek/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 1 +
> > =C2=A0 drivers/media/platform/mediatek/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0=C2=A0 1 +
> > =C2=A0 drivers/media/platform/mediatek/aie/Kconfig=C2=A0=C2=A0 |=C2=A0=
=C2=A0 12 +
> > =C2=A0 drivers/media/platform/mediatek/aie/Makefile=C2=A0 |=C2=A0=C2=A0=
=C2=A0 5 +
> > =C2=A0 drivers/media/platform/mediatek/aie/mtk_aie.h | 1181 +++++++++
> > =C2=A0 .../media/platform/mediatek/aie/mtk_aie_53.c=C2=A0 | 1300 ++++++=
++++
> > =C2=A0 .../media/platform/mediatek/aie/mtk_aie_drv.c | 2309
> > +++++++++++++++++
> > =C2=A0 7 files changed, 4809 insertions(+)
> > =C2=A0 create mode 100644 drivers/media/platform/mediatek/aie/Kconfig
> > =C2=A0 create mode 100644 drivers/media/platform/mediatek/aie/Makefile
> > =C2=A0 create mode 100644 drivers/media/platform/mediatek/aie/mtk_aie.h
> > =C2=A0 create mode 100644
> > drivers/media/platform/mediatek/aie/mtk_aie_53.c
> > =C2=A0 create mode 100644
> > drivers/media/platform/mediatek/aie/mtk_aie_drv.c
> >=20
> > diff --git a/drivers/media/platform/mediatek/Kconfig
> > b/drivers/media/platform/mediatek/Kconfig
> > index 84104e2cd024..cd161272666b 100644
> > --- a/drivers/media/platform/mediatek/Kconfig
> > +++ b/drivers/media/platform/mediatek/Kconfig
> > @@ -2,6 +2,7 @@
> > =C2=A0=20
> > =C2=A0 comment "Mediatek media platform drivers"
> > =C2=A0=20
> > +source "drivers/media/platform/mediatek/aie/Kconfig"
> > =C2=A0 source "drivers/media/platform/mediatek/jpeg/Kconfig"
> > =C2=A0 source "drivers/media/platform/mediatek/mdp/Kconfig"
> > =C2=A0 source "drivers/media/platform/mediatek/vcodec/Kconfig"
> > diff --git a/drivers/media/platform/mediatek/Makefile
> > b/drivers/media/platform/mediatek/Makefile
> > index 38e6ba917fe5..23a096fdf21c 100644
> > --- a/drivers/media/platform/mediatek/Makefile
> > +++ b/drivers/media/platform/mediatek/Makefile
> > @@ -1,4 +1,5 @@
> > =C2=A0 # SPDX-License-Identifier: GPL-2.0-only
> > +obj-y +=3D aie/
> > =C2=A0 obj-y +=3D jpeg/
> > =C2=A0 obj-y +=3D mdp/
> > =C2=A0 obj-y +=3D vcodec/
> > diff --git a/drivers/media/platform/mediatek/aie/Kconfig
> > b/drivers/media/platform/mediatek/aie/Kconfig
> > new file mode 100644
> > index 000000000000..ffbe0a79a2ea
> > --- /dev/null
> > +++ b/drivers/media/platform/mediatek/aie/Kconfig
> > @@ -0,0 +1,12 @@
> > +config VIDEO_MTK_AIE
> > +	tristate "MediaTek AI engine function"
> > +	depends on OF
> > +	select V4L2_MEM2MEM_DEV
> > +	select VIDEOBUF2_DMA_CONTIG
> > +	select MEDIA_CONTROLLER_REQUEST_API
> > +	help
> > +	=C2=A0 Support the AI engine (AIE) feature
> > +
> > +	=C2=A0 AIE driver is a V4L2 memory-to-memory device driver
> > which
> > +	=C2=A0 provides hardware accelerated face detection function,
> > +	=C2=A0 it can detect different sizes of faces in a raw image.
> > diff --git a/drivers/media/platform/mediatek/aie/Makefile
> > b/drivers/media/platform/mediatek/aie/Makefile
> > new file mode 100644
> > index 000000000000..20265699e4d3
> > --- /dev/null
> > +++ b/drivers/media/platform/mediatek/aie/Makefile
> > @@ -0,0 +1,5 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +mtk-aie-$(CONFIG_VIDEO_MTK_AIE) +=3D mtk_aie_53.o
> > +mtk-aie-$(CONFIG_VIDEO_MTK_AIE) +=3D mtk_aie_drv.o
> > +
> > +obj-$(CONFIG_VIDEO_MTK_AIE) +=3D mtk-aie.o
> > \ No newline at end of file
> > diff --git a/drivers/media/platform/mediatek/aie/mtk_aie.h
> > b/drivers/media/platform/mediatek/aie/mtk_aie.h
> > new file mode 100644
> > index 000000000000..d2eec80a4dda
> > --- /dev/null
> > +++ b/drivers/media/platform/mediatek/aie/mtk_aie.h
> > @@ -0,0 +1,1181 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (c) 2020 MediaTek Inc.
> > + * Author: Fish Wu <fish.wu@mediatek.com>
> > + */
> > +
> > +#ifndef __MTK_AIE_H__
> > +#define __MTK_AIE_H__
> > +
> > +#include <media/v4l2-ctrls.h>
> > +#include <media/v4l2-device.h>
> > +
> > +#define Y2R_SRC_DST_FORMAT		0
> > +#define Y2R_IN_W_H			1
> > +#define Y2R_OUT_W_H			2
> > +#define Y2R_RA0_RA1_EN			3
> > +#define Y2R_IN_X_Y_SIZE0		4
> > +#define Y2R_IN_STRIDE0_BUS_SIZE0	5
> > +#define Y2R_IN_X_Y_SIZE1		6
> > +#define Y2R_IN_STRIDE1_BUS_SIZE1	7
> > +#define Y2R_OUT_X_Y_SIZE0		8
> > +#define Y2R_OUT_STRIDE0_BUS_SIZE0	9
> > +#define Y2R_OUT_X_Y_SIZE1		10
> > +#define Y2R_OUT_STRIDE1_BUS_SIZE1	11
> > +#define Y2R_OUT_X_Y_SIZE2		12
> > +#define Y2R_OUT_STRIDE2_BUS_SIZE2	13
> > +#define Y2R_IN_0			14
> > +#define Y2R_IN_1			15
> > +#define Y2R_OUT_0			16
> > +#define Y2R_OUT_1			17
> > +#define Y2R_OUT_2			18
> > +#define Y2R_RS_SEL_SRZ_EN		19
> > +#define Y2R_X_Y_MAG			20
> > +#define Y2R_SRZ_HORI_STEP		22
> > +#define Y2R_SRZ_VERT_STEP		23
> > +#define Y2R_PADDING_EN_UP_DOWN		26
> > +#define Y2R_PADDING_RIGHT_LEFT		27
> > +#define Y2R_CO2_FMT_MODE_EN		28
> > +#define Y2R_CO2_CROP_X			29
> > +#define Y2R_CO2_CROP_Y			30
> > +#define Y2R_CON_IN_BA_MSB		31
> > +#define Y2R_CON_OUT_BA_MSB		32
> > +
> > +#define RS_IN_0				22
> > +#define RS_IN_1				23
> > +#define RS_IN_2				24
> > +#define RS_OUT_0			25
> > +#define RS_OUT_1			26
> > +#define RS_OUT_2			27
> > +#define RS_X_Y_MAG			1
> > +#define RS_SRZ_HORI_STEP		3
> > +#define RS_SRZ_VERT_STEP		4
> > +#define RS_INPUT_W_H			7
> > +#define RS_OUTPUT_W_H			8
> > +#define RS_IN_X_Y_SIZE0			10
> > +#define RS_IN_STRIDE0			11
> > +#define RS_IN_X_Y_SIZE1			12
> > +#define RS_IN_STRIDE1			13
> > +#define RS_IN_X_Y_SIZE2			14
> > +#define RS_IN_STRIDE2			15
> > +#define RS_OUT_X_Y_SIZE0		16
> > +#define RS_OUT_STRIDE0			17
> > +#define RS_OUT_X_Y_SIZE1		18
> > +#define RS_OUT_STRIDE1			19
> > +#define RS_OUT_X_Y_SIZE2		20
> > +#define RS_OUT_STRIDE2			21
> > +#define RS_CON_IN_BA_MSB		28
> > +#define RS_CON_OUT_BA_MSB		29
> > +
> > +#define FD_INPUT_ROTATE			1
> > +#define FD_CONV_WIDTH_MOD6		2
> > +#define FD_CONV_IMG_W_H			4
> > +
> > +#define FD_IN_IMG_W_H			5
> > +#define FD_OUT_IMG_W_H			6
> > +
> > +#define FD_IN_X_Y_SIZE0			9
> > +#define FD_IN_X_Y_SIZE1			11
> > +#define FD_IN_X_Y_SIZE2			13
> > +#define FD_IN_X_Y_SIZE3			15
> > +
> > +#define FD_IN_STRIDE0_BUS_SIZE0		10
> > +#define FD_IN_STRIDE1_BUS_SIZE1		12
> > +#define FD_IN_STRIDE2_BUS_SIZE2		14
> > +#define FD_IN_STRIDE3_BUS_SIZE3		16
> > +
> > +#define FD_OUT_X_Y_SIZE0		17
> > +#define FD_OUT_X_Y_SIZE1		19
> > +#define FD_OUT_X_Y_SIZE2		21
> > +#define FD_OUT_X_Y_SIZE3		23
> > +
> > +#define FD_OUT_STRIDE0_BUS_SIZE0	18
> > +#define FD_OUT_STRIDE1_BUS_SIZE1	20
> > +#define FD_OUT_STRIDE2_BUS_SIZE2	22
> > +#define FD_OUT_STRIDE3_BUS_SIZE3	24
> > +
> > +#define FD_IN_0				27
> > +#define FD_IN_1				28
> > +#define FD_IN_2				29
> > +#define FD_IN_3				30
> > +
> > +#define FD_OUT_0			31
> > +#define FD_OUT_1			32
> > +#define FD_OUT_2			33
> > +#define FD_OUT_3			34
> > +
> > +#define FD_KERNEL_0			35
> > +#define FD_KERNEL_1			36
> > +
> > +#define FD_RPN_SET			37
> > +#define FD_IMAGE_COORD			38
> > +#define FD_IMAGE_COORD_XY_OFST		39
> > +#define FD_BIAS_ACCU			47
> > +#define FD_SRZ_FDRZ_RS			48
> > +#define FD_SRZ_HORI_STEP		49
> > +#define FD_SRZ_VERT_STEP		50
> > +#define FD_SRZ_HORI_SUB_INT_OFST	51
> > +#define FD_SRZ_VERT_SUB_INT_OFST	52
> > +
> > +#define FD_CON_IN_BA_MSB		53
> > +#define FD_CON_OUT_BA_MSB		54
> > +#define FD_CON_KERNEL_BA_MSB		55
> > +
> > +#define SRZ_BIT (BIT_MASK(16) | BIT_MASK(12) | BIT_MASK(8) |
> > BIT_MASK(0))
> > +#define RESET_BIT16 BIT(16)
> > +#define RESET_BIT17 BIT(17)
> > +#define RESET_BIT (RESET_BIT16 | RESET_BIT17)
> > +
> > +#define FD_LOOP_NUM			87
> > +#define RPN0_LOOP_NUM			86
> > +#define RPN1_LOOP_NUM			57
> > +#define RPN2_LOOP_NUM			28
> > +
> > +#define PYM0_START_LOOP			58
> > +#define PYM1_START_LOOP			29
> > +#define PYM2_START_LOOP			0
> > +
> > +#define ATTR_LOOP_NUM			26
> > +#define AGE_OUT_RGS			17
> > +#define GENDER_OUT_RGS			20
> > +#define INDIAN_OUT_RGS			22
> > +#define RACE_OUT_RGS			25
> > +
> > +#define INPUT_WDMA_WRA_NUM		4
> > +#define OUTPUT_WDMA_WRA_NUM		4
> > +#define KERNEL_RDMA_RA_NUM		2
> > +
> > +#define MAX_ENQUE_FRAME_NUM		10
> > +#define PYM_NUM				3
> > +#define COLOR_NUM			3
> > +
> > +#define ATTR_MODE_PYRAMID_WIDTH		128
> > +#define ATTR_OUT_SIZE			32
> > +
> > +/* AIE 2.0 3.X register offset */
> > +#define AIE_START_REG			0x000
> > +#define AIE_ENABLE_REG			0x004
> > +#define AIE_LOOP_REG			0x008
> > +#define AIE_YUV2RGB_CON_BASE_ADR_REG	0x00c
> > +#define AIE_RS_CON_BASE_ADR_REG		0x010
> > +#define AIE_FD_CON_BASE_ADR_REG		0x014
> > +#define AIE_INT_EN_REG			0x018
> > +#define AIE_INT_REG			0x01c
> > +#define AIE_RESULT_0_REG		0x08c
> > +#define AIE_RESULT_1_REG		0x090
> > +#define AIE_DMA_CTL_REG			0x094
> > +
> > +/* AIE 3.0 register offset */
> > +#define AIE_YUV2RGB_CON_BASE_ADR_MSB	0x14C
> > +#define AIE_RS_CON_BASE_ADR_MSB		0x150
> > +#define AIE_FD_CON_BASE_ADR_MSB		0x154
> > +
> > +/* AIE 3.0 FLD register offset */
> > +#define FLD_EN				0x400
> > +#define FLD_BASE_ADDR_FACE_0		0x404
> > +#define FLD_BASE_ADDR_FACE_1		0x408
> > +#define FLD_BASE_ADDR_FACE_2		0x40C
> > +#define FLD_BASE_ADDR_FACE_3		0x410
> > +#define FLD_BASE_ADDR_FACE_4		0x414
> > +#define FLD_BASE_ADDR_FACE_5		0x418
> > +#define FLD_BASE_ADDR_FACE_6		0x41C
> > +#define FLD_BASE_ADDR_FACE_7		0x420
> > +#define FLD_BASE_ADDR_FACE_8		0x424
> > +#define FLD_BASE_ADDR_FACE_9		0x428
> > +#define FLD_BASE_ADDR_FACE_10		0x42C
> > +#define FLD_BASE_ADDR_FACE_11		0x430
> > +#define FLD_BASE_ADDR_FACE_12		0x434
> > +#define FLD_BASE_ADDR_FACE_13		0x438
> > +#define FLD_BASE_ADDR_FACE_14		0x43C
> > +
> > +#define FLD_INFO_0_FACE_0		0x440
> > +#define FLD_INFO_1_FACE_0		0x444
> > +#define FLD_INFO_2_FACE_0		0x448
> > +#define FLD_INFO_0_FACE_1		0x44C
> > +#define FLD_INFO_1_FACE_1		0x450
> > +#define FLD_INFO_2_FACE_1		0x454
> > +#define FLD_INFO_0_FACE_2		0x458
> > +#define FLD_INFO_1_FACE_2		0x45C
> > +#define FLD_INFO_2_FACE_2		0x460
> > +#define FLD_INFO_0_FACE_3		0x464
> > +#define FLD_INFO_1_FACE_3		0x468
> > +#define FLD_INFO_2_FACE_3		0x46C
> > +#define FLD_INFO_0_FACE_4		0x470
> > +#define FLD_INFO_1_FACE_4		0x474
> > +#define FLD_INFO_2_FACE_4		0x478
> > +#define FLD_INFO_0_FACE_5		0x47C
> > +#define FLD_INFO_1_FACE_5		0x480
> > +#define FLD_INFO_2_FACE_5		0x484
> > +#define FLD_INFO_0_FACE_6		0x488
> > +#define FLD_INFO_1_FACE_6		0x48C
> > +#define FLD_INFO_2_FACE_6		0x490
> > +#define FLD_INFO_0_FACE_7		0x494
> > +#define FLD_INFO_1_FACE_7		0x498
> > +
> > +#define FLD_INFO_2_FACE_7		0x4A0
> > +#define FLD_INFO_0_FACE_8		0x4A4
> > +#define FLD_INFO_1_FACE_8		0x4A8
> > +#define FLD_INFO_2_FACE_8		0x4AC
> > +#define FLD_INFO_0_FACE_9		0x4B0
> > +#define FLD_INFO_1_FACE_9		0x4B4
> > +#define FLD_INFO_2_FACE_9		0x4B8
> > +#define FLD_INFO_0_FACE_10		0x4BC
> > +#define FLD_INFO_1_FACE_10		0x4C0
> > +#define FLD_INFO_2_FACE_10		0x4C4
> > +#define FLD_INFO_0_FACE_11		0x4C8
> > +#define FLD_INFO_1_FACE_11		0x4CC
> > +#define FLD_INFO_2_FACE_11		0x4D0
> > +#define FLD_INFO_0_FACE_12		0x4D4
> > +#define FLD_INFO_1_FACE_12		0x4D8
> > +#define FLD_INFO_2_FACE_12		0x4DC
> > +#define FLD_INFO_0_FACE_13		0x4E0
> > +#define FLD_INFO_1_FACE_13		0x4E4
> > +#define FLD_INFO_2_FACE_13		0x4E8
> > +#define FLD_INFO_0_FACE_14		0x4EC
> > +#define FLD_INFO_1_FACE_14		0x4F0
> > +#define FLD_INFO_2_FACE_14		0x4F4
> > +
> > +#define FLD_MODEL_PARA0			0x4F8
> > +#define FLD_MODEL_PARA1			0x4FC
> > +#define FLD_MODEL_PARA2			0x500
> > +#define FLD_MODEL_PARA3			0x504
> > +#define FLD_MODEL_PARA4			0x508
> > +#define FLD_MODEL_PARA5			0x50C
> > +#define FLD_MODEL_PARA6			0x510
> > +#define FLD_MODEL_PARA7			0x514
> > +#define FLD_MODEL_PARA8			0x518
> > +#define FLD_MODEL_PARA9			0x51C
> > +#define FLD_MODEL_PARA10		0x520
> > +#define FLD_MODEL_PARA11		0x524
> > +#define FLD_MODEL_PARA12		0x528
> > +#define FLD_MODEL_PARA13		0x52C
> > +#define FLD_MODEL_PARA14		0x530
> > +#define FLD_MODEL_PARA15		0x534
> > +#define FLD_MODEL_PARA16		0x538
> > +#define FLD_DEBUG_INFO0			0x53C
> > +#define FLD_DEBUG_INFO1			0x540
> > +
> > +#define FLD_BUSY			0x544
> > +#define FLD_DONE			0x548
> > +#define FLD_SRC_WD_HT			0x54C
> > +
> > +/* n: min 0, max 14 */
> > +#define FLD_PL_IN_BASE_ADDR_0_(n)	(0x550 + 4 * (n))
> > +#define FLD_PL_IN_BASE_ADDR_1_(n)	(0x5C8 + 4 * (n))
> > +#define FLD_PL_IN_BASE_ADDR_2_(n)	(0x640 + 4 * (n))
> > +#define FLD_PL_IN_BASE_ADDR_3_(n)	(0x6B8 + 4 * (n))
> > +#define FLD_SH_IN_BASE_ADDR_(n)		(0x85C + 4 * (n))
> > +
> > +#define FLD_PL_IN_SIZE_0		0x730
> > +#define FLD_PL_IN_STRIDE_0		0x734
> > +#define FLD_PL_IN_SIZE_1		0x738
> > +#define FLD_PL_IN_STRIDE_1		0x73C
> > +#define FLD_PL_IN_SIZE_2_0		0x740
> > +#define FLD_PL_IN_STRIDE_2_0		0x744
> > +#define FLD_PL_IN_SIZE_2_1		0x748
> > +#define FLD_PL_IN_STRIDE_2_1		0x74C
> > +#define FLD_PL_IN_SIZE_2_2		0x750
> > +#define FLD_PL_IN_STRIDE_2_2		0x754
> > +#define FLD_PL_IN_SIZE_3		0x758
> > +#define FLD_PL_IN_STRIDE_3		0x75C
> > +
> > +#define FLD_SH_IN_BASE_ADDR_0		0x760
> > +#define FLD_SH_IN_BASE_ADDR_1		0x764
> > +#define FLD_SH_IN_BASE_ADDR_2		0x768
> > +#define FLD_SH_IN_BASE_ADDR_3		0x76C
> > +#define FLD_SH_IN_BASE_ADDR_4		0x770
> > +#define FLD_SH_IN_BASE_ADDR_5		0x774
> > +#define FLD_SH_IN_BASE_ADDR_6		0x778
> > +#define FLD_SH_IN_BASE_ADDR_7		0x77C
> > +#define FLD_SH_IN_BASE_ADDR_8		0x780
> > +#define FLD_SH_IN_BASE_ADDR_9		0x784
> > +#define FLD_SH_IN_BASE_ADDR_10		0x788
> > +#define FLD_SH_IN_BASE_ADDR_11		0x78C
> > +#define FLD_SH_IN_BASE_ADDR_12		0x790
> > +#define FLD_SH_IN_BASE_ADDR_13		0x794
> > +#define FLD_SH_IN_BASE_ADDR_14		0x798
> > +#define FLD_SH_IN_BASE_ADDR_15		0x79C
> > +#define FLD_SH_IN_BASE_ADDR_16		0x7A0
> > +#define FLD_SH_IN_BASE_ADDR_17		0x7A4
> > +#define FLD_SH_IN_BASE_ADDR_18		0x7A8
> > +#define FLD_SH_IN_BASE_ADDR_19		0x7AC
> > +#define FLD_SH_IN_BASE_ADDR_20		0x7B0
> > +#define FLD_SH_IN_BASE_ADDR_21		0x7B4
> > +#define FLD_SH_IN_BASE_ADDR_22		0x7B8
> > +#define FLD_SH_IN_BASE_ADDR_23		0x7BC
> > +#define FLD_SH_IN_BASE_ADDR_24		0x7C0
> > +#define FLD_SH_IN_BASE_ADDR_25		0x7C4
> > +#define FLD_SH_IN_BASE_ADDR_26		0x7C8
> > +#define FLD_SH_IN_BASE_ADDR_27		0x7CC
> > +#define FLD_SH_IN_BASE_ADDR_28		0x7D0
> > +#define FLD_SH_IN_BASE_ADDR_29		0x7D4
> > +
> > +#define FLD_SH_IN_SIZE_0		0x7D8
> > +#define FLD_SH_IN_STRIDE_0		0x7DC
> > +#define FLD_TR_OUT_BASE_ADDR_0		0x7E0
> > +#define FLD_TR_OUT_SIZE_0		0x7E4
> > +#define FLD_TR_OUT_STRIDE_0		0x7E8
> > +#define FLD_PP_OUT_BASE_ADDR_0		0x7EC
> > +#define FLD_PP_OUT_SIZE_0		0x7F0
> > +#define FLD_PP_OUT_STRIDE_0		0x7F4
> > +#define FLD_SPARE			0x7F8
> > +
> > +#define FLD_BASE_ADDR_FACE_0_7_MSB	0x7FC
> > +#define FLD_BASE_ADDR_FACE_8_14_MSB	0x800
> > +
> > +#define FLD_PL_IN_BASE_ADDR_0_0_7_MSB	0x804
> > +#define FLD_PL_IN_BASE_ADDR_0_8_15_MSB	0x808
> > +#define FLD_PL_IN_BASE_ADDR_0_16_23_MSB	0x80C
> > +#define FLD_PL_IN_BASE_ADDR_0_24_29_MSB	0x810
> > +
> > +#define FLD_PL_IN_BASE_ADDR_1_0_7_MSB	0x814
> > +#define FLD_PL_IN_BASE_ADDR_1_8_15_MSB	0x818
> > +#define FLD_PL_IN_BASE_ADDR_1_16_23_MSB	0x81C
> > +#define FLD_PL_IN_BASE_ADDR_1_24_29_MSB	0x820
> > +
> > +#define FLD_PL_IN_BASE_ADDR_2_0_7_MSB	0x824
> > +#define FLD_PL_IN_BASE_ADDR_2_8_15_MSB	0x828
> > +#define FLD_PL_IN_BASE_ADDR_2_16_23_MSB	0x82C
> > +#define FLD_PL_IN_BASE_ADDR_2_24_29_MSB	0x830
> > +
> > +#define FLD_PL_IN_BASE_ADDR_3_0_7_MSB	0x834
> > +#define FLD_PL_IN_BASE_ADDR_3_8_15_MSB	0x838
> > +#define FLD_PL_IN_BASE_ADDR_3_16_23_MSB	0x83C
> > +#define FLD_PL_IN_BASE_ADDR_3_24_29_MSB	0x840
> > +
> > +#define FLD_SH_IN_BASE_ADDR_0_7_MSB	0x844
> > +#define FLD_SH_IN_BASE_ADDR_8_15_MSB	0x848
> > +#define FLD_SH_IN_BASE_ADDR_16_23_MSB	0x84C
> > +#define FLD_SH_IN_BASE_ADDR_24_29_MSB	0x850
> > +
> > +#define FLD_BS_IN_BASE_ADDR_0_7_MSB	0x8d4
> > +#define FLD_BS_IN_BASE_ADDR_8_15_MSB	0x8d8
> > +
> > +#define FLD_TR_OUT_BASE_ADDR_0_MSB	0x854
> > +#define FLD_PP_OUT_BASE_ADDR_0_MSB	0x858
> > +
> > +#define FLD_BS_IN_BASE_ADDR_14		0x894
> > +
> > +#define FLD_BS_BIAS			0x8E4
> > +#define FLD_CV_FM_RANGE_0		0x8E8
> > +#define FLD_CV_FM_RANGE_1		0x8EC
> > +#define FLD_CV_PM_RANGE_0		0x8F0
> > +#define FLD_CV_PM_RANGE_1		0x8F4
> > +#define FLD_BS_RANGE_0			0x8F8
> > +#define FLD_BS_RANGE_1			0x8FC
> > +
> > +#define MTK_FD_OUTPUT_MIN_WIDTH		16U
> > +#define MTK_FD_OUTPUT_MIN_HEIGHT	16U
> > +#define MTK_FD_OUTPUT_MAX_WIDTH		4096U
> > +#define MTK_FD_OUTPUT_MAX_HEIGHT	4096U
> > +
> > +#define MTK_FD_HW_TIMEOUT_IN_MSEC	2000
> > +#define MAX_FACE_NUM			1024
> > +#define RLT_NUM				48
> > +#define GENDER_OUT			32
> > +
> > +#define RACE_RST_X_NUM			4
> > +#define RACE_RST_Y_NUM			64
> > +#define GENDER_RST_X_NUM		2
> > +#define GENDER_RST_Y_NUM		64
> > +#define MRACE_RST_NUM			4
> > +#define MGENDER_RST_NUM			2
> > +#define MAGE_RST_NUM			2
> > +#define MINDIAN_RST_NUM			2
> > +
> > +#define FLD_FOREST			14
> > +#define FLD_POINT			500
> > +
> > +#define FLD_STEP_NUM			6
> > +#define FLD_MAX_FRAME			15
> > +
> > +#define FLD_STEP_BLINK			0
> > +#define FLD_STEP_CV			1
> > +#define FLD_STEP_FP			2
> > +#define FLD_STEP_LEAF			3
> > +#define FLD_STEP_KM02			4
> > +#define FLD_STEP_KM13			5
> > +
> > +#define FLD_BLINK_WEIGHT_FOREST14_SIZE	6416
> > +#define FLD_CV_SIZE			19392
> > +#define FLD_FP_SIZE			80160
> > +#define FLD_LEAFNODE_SIZE		4608000
> > +#define FLD_TREE_KM02_SIZE		120000
> > +#define FLD_TREE_KM13_SIZE		120000
> > +#define FLD_OUTPUT_SIZE			112
> > +
> > +/* FLD_OUTPUT_X_SIZE: min: 1, max: 15 */
> > +#define FLD_OUTPUT_X_SIZE		9
> > +
> > +#define FLD_CUR_LANDMARK		11
> > +
> > +#define RESULT_SIZE			(RLT_NUM * MAX_FACE_NUM)
> > +
> > +#define ANCHOR_EN_NUM			5
> > +
> > +static const unsigned int
> > fd_wdma_en[FD_LOOP_NUM][OUTPUT_WDMA_WRA_NUM] =3D {
> > +	{ 1, 0, 0, 0 }, { 1, 0, 1, 0 }, { 1, 0, 1, 0 }, { 1, 0, 0,
> > 0 },
> > +	{ 1, 1, 1, 1 }, { 1, 1, 1, 1 }, { 1, 0, 0, 0 }, { 1, 0, 1,
> > 0 },
> > +	{ 1, 1, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 1, 0 }, { 1, 1, 0,
> > 0 },
> > +	{ 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0,
> > 0 },
> > +	{ 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 1, 0, 0 }, { 1, 1, 0,
> > 0 },
> > +	{ 1, 1, 0, 0 }, { 1, 0, 0, 0 }, { 1, 1, 1, 1 }, { 1, 1, 1,
> > 1 },
> > +	{ 1, 1, 0, 0 }, { 1, 1, 0, 0 }, { 1, 1, 0, 0 }, { 1, 0, 0,
> > 0 },
> > +	{ 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 1, 0 }, { 1, 0, 1,
> > 0 },
> > +	{ 1, 0, 0, 0 }, { 1, 1, 1, 1 }, { 1, 1, 1, 1 }, { 1, 0, 0,
> > 0 },
> > +	{ 1, 0, 1, 0 }, { 1, 1, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 1,
> > 0 },
> > +	{ 1, 1, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0,
> > 0 },
> > +	{ 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 1, 0,
> > 0 },
> > +	{ 1, 1, 0, 0 }, { 1, 1, 0, 0 }, { 1, 0, 0, 0 }, { 1, 1, 1,
> > 1 },
> > +	{ 1, 1, 1, 1 }, { 1, 1, 0, 0 }, { 1, 1, 0, 0 }, { 1, 1, 0,
> > 0 },
> > +	{ 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 1,
> > 0 },
> > +	{ 1, 0, 1, 0 }, { 1, 0, 0, 0 }, { 1, 1, 1, 1 }, { 1, 1, 1,
> > 1 },
> > +	{ 1, 0, 0, 0 }, { 1, 0, 1, 0 }, { 1, 1, 0, 0 }, { 1, 0, 0,
> > 0 },
> > +	{ 1, 0, 1, 0 }, { 1, 1, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0,
> > 0 },
> > +	{ 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0,
> > 0 },
> > +	{ 1, 1, 0, 0 }, { 1, 1, 0, 0 }, { 1, 1, 0, 0 }, { 1, 0, 0,
> > 0 },
> > +	{ 1, 1, 1, 1 }, { 1, 1, 1, 1 }, { 1, 1, 0, 0 }, { 1, 1, 0,
> > 0 },
> > +	{ 1, 1, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 }
> > +};
> > +
> > +static const unsigned int
> > out_stride_size[FD_LOOP_NUM][OUTPUT_WDMA_WRA_NUM] =3D {
> > +	{ 1, 0, 0, 0 }, { 1, 0, 2, 0 }, { 1, 0, 2, 0 }, { 1, 0, 0,
> > 0 },
> > +	{ 1, 1, 2, 2 }, { 1, 1, 2, 2 }, { 1, 0, 0, 0 }, { 1, 0, 2,
> > 0 },
> > +	{ 1, 1, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 2, 0 }, { 1, 1, 0,
> > 0 },
> > +	{ 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0,
> > 0 },
> > +	{ 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 1, 0, 0 }, { 1, 1, 0,
> > 0 },
> > +	{ 1, 1, 0, 0 }, { 1, 0, 0, 0 }, { 1, 1, 1, 1 }, { 1, 1, 1,
> > 1 },
> > +	{ 1, 1, 0, 0 }, { 1, 1, 0, 0 }, { 1, 1, 0, 0 }, { 1, 0, 0,
> > 0 },
> > +	{ 3, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 2, 0 }, { 1, 0, 2,
> > 0 },
> > +	{ 1, 0, 0, 0 }, { 1, 1, 2, 2 }, { 1, 1, 2, 2 }, { 1, 0, 0,
> > 0 },
> > +	{ 1, 0, 2, 0 }, { 1, 1, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 2,
> > 0 },
> > +	{ 1, 1, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0,
> > 0 },
> > +	{ 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 1, 0,
> > 0 },
> > +	{ 1, 1, 0, 0 }, { 1, 1, 0, 0 }, { 1, 0, 0, 0 }, { 1, 1, 1,
> > 1 },
> > +	{ 1, 1, 1, 1 }, { 1, 1, 0, 0 }, { 1, 1, 0, 0 }, { 1, 1, 0,
> > 0 },
> > +	{ 1, 0, 0, 0 }, { 3, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 2,
> > 0 },
> > +	{ 1, 0, 2, 0 }, { 1, 0, 0, 0 }, { 1, 1, 2, 2 }, { 1, 1, 2,
> > 2 },
> > +	{ 1, 0, 0, 0 }, { 1, 0, 2, 0 }, { 1, 1, 0, 0 }, { 1, 0, 0,
> > 0 },
> > +	{ 1, 0, 2, 0 }, { 1, 1, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0,
> > 0 },
> > +	{ 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0,
> > 0 },
> > +	{ 1, 1, 0, 0 }, { 1, 1, 0, 0 }, { 1, 1, 0, 0 }, { 1, 0, 0,
> > 0 },
> > +	{ 1, 1, 1, 1 }, { 1, 1, 1, 1 }, { 1, 1, 0, 0 }, { 1, 1, 0,
> > 0 },
> > +	{ 1, 1, 0, 0 }, { 1, 0, 0, 0 }, { 3, 0, 0, 0 }
> > +};
> > +
> > +static const unsigned int
> > fd_ker_rdma_size[FD_LOOP_NUM][KERNEL_RDMA_RA_NUM] =3D {
> > +	{ 240, 240 }, { 1168, 1168 }, { 1168, 1168 }, { 272, 272
> > },
> > +	{ 2320, 2320 }, { 2080, 2080 }, { 1040, 1040 }, { 4624,
> > 4624 },
> > +	{ 3104, 3104 }, { 9232, 9232 }, { 4624, 4624 }, { 4128,
> > 4128 },
> > +	{ 1040, 1040 }, { 4624, 4624 }, { 4624, 4624 }, { 1552,
> > 1552 },
> > +	{ 4624, 4624 }, { 4624, 4624 }, { 4128, 4128 }, { 1040,
> > 1040 },
> > +	{ 1040, 1040 }, { 528, 528 },	{ 4160, 4160 }, { 4160,
> > 4160 },
> > +	{ 2080, 2080 }, { 2080, 2080 }, { 2080, 2080 }, { 1040,
> > 1040 },
> > +	{ 0, 0 }, { 240, 240 }, { 1168, 1168 }, { 1168, 1168 },
> > +	{ 272, 272 }, { 2320, 2320 }, { 2080, 2080 }, { 1040, 1040
> > },
> > +	{ 4624, 4624 }, { 3104, 3104 }, { 9232, 9232 }, { 4624,
> > 4624 },
> > +	{ 4128, 4128 }, { 1040, 1040 }, { 4624, 4624 }, { 4624,
> > 4624 },
> > +	{ 1552, 1552 }, { 4624, 4624 }, { 4624, 4624 }, { 4128,
> > 4128 },
> > +	{ 1040, 1040 }, { 1040, 1040 }, { 528, 528 }, { 4160, 4160
> > },
> > +	{ 4160, 4160 }, { 2080, 2080 }, { 2080, 2080 }, { 2080,
> > 2080 },
> > +	{ 1040, 1040 }, { 0, 0 }, { 240, 240 }, { 1168, 1168 },
> > +	{ 1168, 1168 }, { 272, 272 },	{ 2320, 2320 }, { 2080,
> > 2080 },
> > +	{ 1040, 1040 }, { 4624, 4624 }, { 3104, 3104 }, { 9232,
> > 9232 },
> > +	{ 4624, 4624 }, { 4128, 4128 }, { 1040, 1040 }, { 4624,
> > 4624 },
> > +	{ 4624, 4624 }, { 1552, 1552 }, { 4624, 4624 }, { 4624,
> > 4624 },
> > +	{ 4128, 4128 }, { 1040, 1040 }, { 1040, 1040 }, { 528, 528
> > },
> > +	{ 4160, 4160 }, { 4160, 4160 }, { 2080, 2080 }, { 2080,
> > 2080 },
> > +	{ 2080, 2080 }, { 1040, 1040 }, { 0, 0 }
> > +};
> > +
> > +static const unsigned int fd_out_stride2_in[FD_LOOP_NUM] =3D {
> > +	0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,
> > 0, 0, 0,
> > +	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1,
> > 0, 0, 0,
> > +	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
> > 1, 0, 0,
> > +	0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
> > 0, 0
> > +};
> > +
> > +static const unsigned int fd_stride[FD_LOOP_NUM] =3D {
> > +	2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
> > 1, 1, 1,
> > +	1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
> > 1, 1, 1,
> > +	1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1,
> > 1, 1, 1,
> > +	1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
> > 1, 1
> > +};
> > +
> > +static const unsigned int fd_maxpool[FD_LOOP_NUM] =3D {
> > +	0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
> > 0, 0, 0,
> > +	0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
> > 0, 0, 0,
> > +	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0,
> > 0, 0, 0,
> > +	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
> > 0, 0
> > +};
> > +
> > +static const unsigned int out_2size[FD_LOOP_NUM] =3D {
> > +	0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,
> > 0, 0, 0,
> > +	0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 1, 0,
> > 0, 0, 0,
> > +	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1,
> > 1, 0, 1,
> > +	0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
> > 0, 0
> > +};
> > +
> > +static const unsigned int in_ch_pack[FD_LOOP_NUM] =3D {
> > +	1,=C2=A0 16, 16, 16, 16, 16, 32, 32, 32, 32, 32, 32, 32, 32,
> > 32, 32, 32, 32,
> > +	32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 0, 1, 16, 16, 16,
> > 16, 16, 32,
> > +	32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,
> > 32, 32, 32, 32,
> > +	32, 32, 32, 0, 1, 16, 16, 16, 16, 16, 32, 32, 32, 32, 32,
> > 32, 32, 32,
> > +	32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 0
> > +};
> > +
> > +static const unsigned int outlayer[FD_LOOP_NUM] =3D {
> > +	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
> > 1, 1, 1,
> > +	1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
> > 0, 0, 0,
> > +	0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0,
> > 0, 0, 0,
> > +	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1,
> > 1, 0
> > +};
> > +
> > +static const unsigned int out_ch_pack[FD_LOOP_NUM] =3D {
> > +	16, 16, 16, 16, 16, 32, 32, 32, 32, 32, 32, 32, 32, 32,
> > 32, 32, 32, 32,
> > +	32, 16, 16, 16, 32, 32, 32, 32, 32, 32, 0, 16, 16, 16, 16,
> > 16, 32, 32,
> > +	32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 16, 16,
> > 16, 32, 32, 32,
> > +	32, 32, 32, 0, 16, 16, 16, 16, 16, 32, 32, 32, 32, 32, 32,
> > 32, 32, 32,
> > +	32, 32, 32, 32, 32, 16, 16, 16, 32, 32, 32, 32, 32, 32, 0
> > +};
> > +
> > +/* [loop][ch][output_index] */
> > +static const signed int
> > fd_rdma_en[FD_LOOP_NUM][INPUT_WDMA_WRA_NUM][2] =3D {
> > +	{ { 99, 99 }, { 99, 99 }, { 99, 99 }, { -1, -1 } },
> > +	{ { 0, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 1, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 1, 0 }, { 2, 0 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 3, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 1, 2 }, { 2, 2 }, { 4, 2 }, { 4, 3 } },
> > +	{ { 5, 0 }, { 5, 1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 6, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 5, 0 }, { 5, 1 }, { 7, 0 }, { -1, -1 } },
> > +	{ { 8, 0 }, { 8, 1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 9, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 5, 2 }, { 5, 3 }, { 7, 2 }, { 10, 2 } },
> > +	{ { 11, 0 }, { 11, 1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 12, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 13, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 11, 0 }, { 11, 1 }, { 14, 0 }, { -1, -1 } },
> > +	{ { 15, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 16, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 11, 0 }, { 11, 1 }, { 14, 0 }, { 17, 0 } },
> > +	{ { 18, 0 }, { 18, 1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 18, 0 }, { 18, 1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 18, 0 }, { 18, 1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 18, 0 }, { 18, 1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 18, 0 }, { 18, 1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 18, 0 }, { 18, 1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 18, 0 }, { 18, 1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 18, 0 }, { 18, 1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 18, 0 }, { 18, 1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 19, 0 }, { 22, 0 }, { 22, 1 }, { 25, 0 } },
> > +	{ { 99, 99 }, { 99, 99 }, { 99, 99 }, { -1, -1 } },
> > +	{ { 29, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 30, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 30, 0 }, { 31, 0 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 32, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 30, 2 }, { 31, 2 }, { 33, 2 }, { 33, 3 } },
> > +	{ { 34, 0 }, { 34, 1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 35, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 34, 0 }, { 34, 1 }, { 36, 0 }, { -1, -1 } },
> > +	{ { 37, 0 }, { 37, 1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 38, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 34, 2 }, { 34, 3 }, { 36, 2 }, { 39, 2 } },
> > +	{ { 40, 0 }, { 40, 1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 41, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 42, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 40, 0 }, { 40, 1 }, { 43, 0 }, { -1, -1 } },
> > +	{ { 44, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 45, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 40, 0 }, { 40, 1 }, { 43, 0 }, { 46, 0 } },
> > +	{ { 47, 0 }, { 47, 1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 47, 0 }, { 47, 1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 47, 0 }, { 47, 1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 47, 0 }, { 47, 1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 47, 0 }, { 47, 1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 47, 0 }, { 47, 1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 47, 0 }, { 47, 1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 47, 0 }, { 47, 1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 47, 0 }, { 47, 1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 48, 0 }, { 51, 0 }, { 51, 1 }, { 54, 0 } },
> > +	{ { 99, 99 }, { 99, 99 }, { 99, 99 }, { -1, -1 } },
> > +	{ { 58, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 59, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 59, 0 }, { 60, 0 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 61, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 59, 2 }, { 60, 2 }, { 62, 2 }, { 62, 3 } },
> > +	{ { 63, 0 }, { 63, 1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 64, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 63, 0 }, { 63, 1 }, { 65, 0 }, { -1, -1 } },
> > +	{ { 66, 0 }, { 66, 1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 67, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 63, 2 }, { 63, 3 }, { 65, 2 }, { 68, 2 } },
> > +	{ { 69, 0 }, { 69, 1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 70, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 71, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 69, 0 }, { 69, 1 }, { 72, 0 }, { -1, -1 } },
> > +	{ { 73, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 74, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 69, 0 }, { 69, 1 }, { 72, 0 }, { 75, 0 } },
> > +	{ { 76, 0 }, { 76, 1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 76, 0 }, { 76, 1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 76, 0 }, { 76, 1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 76, 0 }, { 76, 1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 76, 0 }, { 76, 1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 76, 0 }, { 76, 1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 76, 0 }, { 76, 1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 76, 0 }, { 76, 1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 76, 0 }, { 76, 1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 77, 0 }, { 80, 0 }, { 80, 1 }, { 83, 0 } }
> > +};
> > +
> > +static const unsigned int
> > attr_wdma_en[ATTR_LOOP_NUM][OUTPUT_WDMA_WRA_NUM] =3D {
> > +	{ 1, 0, 1, 0 }, { 1, 0, 1, 0 }, { 1, 0, 0, 0 }, { 1, 1, 1,
> > 1 },
> > +	{ 1, 1, 1, 1 }, { 1, 0, 1, 0 }, { 1, 1, 0, 0 }, { 1, 0, 1,
> > 0 },
> > +	{ 1, 1, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0,
> > 0 },
> > +	{ 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 1, 0,
> > 0 },
> > +	{ 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0,
> > 0 },
> > +	{ 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0,
> > 0 },
> > +	{ 1, 0, 0, 0 }, { 1, 0, 0, 0 }
> > +};
> > +
> > +static const unsigned int
> > +	attr_ker_rdma_size[ATTR_LOOP_NUM][KERNEL_RDMA_RA_NUM] =3D {
> > +		{ 240, 240 }, { 1168, 1168 }, { 272, 272 }, {
> > 2320, 2320 },
> > +		{ 2080, 2080 }, { 9232, 9232 }, { 3104, 3104 }, {
> > 9232, 9232 },
> > +		{ 4128, 4128 }, { 1040, 1040 }, { 4624, 4624 }, {
> > 4624, 4624 },
> > +		{ 1552, 1552 }, { 4624, 4624 }, { 4624, 4624 }, {
> > 4128, 4128 },
> > +		{ 9232, 9232 }, { 272, 272 },	{ 9232, 9232 }, {
> > 2320, 2320 },
> > +		{ 144, 144 }, { 9232, 9232 }, { 272, 272 }, {
> > 9232, 9232 },
> > +		{ 2320, 2320 }, { 144, 144 }
> > +	};
> > +
> > +static const unsigned int attr_out_stride2_as_in[ATTR_LOOP_NUM] =3D
> > {
> > +	0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0,
> > +	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
> > +};
> > +
> > +static const unsigned int attr_fd_stride[ATTR_LOOP_NUM] =3D { /* H
> > */
> > +	2, 1, 1, 1, 1, 1, 1,
> > +	1, 1, 1, 1, 1, 1, 1,
> > +	1, 1, 1, 1, 1, 1, 1,
> > +	1, 1, 1, 1, 1
> > +};
> > +
> > +static const unsigned int attr_fd_maxpool[ATTR_LOOP_NUM] =3D { /* L
> > */
> > +	1, 0, 0, 0, 0, 0,
> > +	0, 0, 0, 0, 0, 0,
> > +	0, 0, 0, 0, 0, 0,
> > +	0, 0, 0, 0, 0, 0,
> > +	0, 0
> > +};
> > +
> > +static const unsigned int attr_out_2size[ATTR_LOOP_NUM] =3D { /* O
> > */
> > +	1, 1, 0, 1, 1, 1, 0,
> > +	1, 0, 0, 0, 0, 0, 0,
> > +	0, 0, 0, 0, 0, 0, 0,
> > +	0, 0, 0, 0, 0
> > +};
> > +
> > +/* [loop][ch][output_index] */
> > +static const signed int
> > attr_rdma_en[ATTR_LOOP_NUM][INPUT_WDMA_WRA_NUM][2] =3D {
> > +	{ { 99, 99 }, { 99, 99 }, { 99, 99 }, { -1, -1 } },
> > +	{ { 0, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 0, 0 }, { 1, 0 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 2, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 0, 2 }, { 1, 2 }, { 3, 2 }, { 3, 3 } },
> > +	{ { 4, 0 }, { 4, 1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 4, 0 }, { 4, 1 }, { 5, 0 }, { -1, -1 } },
> > +	{ { 6, 0 }, { 6, 1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 4, 2 }, { 4, 3 }, { 5, 2 }, { 7, 2 } },
> > +	{ { 8, 0 }, { 8, 1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 9, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 10, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 8, 0 }, { 8, 1 }, { 11, 0 }, { -1, -1 } },
> > +	{ { 12, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 13, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 8, 0 }, { 8, 1 }, { 11, 0 }, { 14, 0 } },
> > +	{ { 15, 0 }, { 15, 1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 16, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 15, 0 }, { 15, 1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 18, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 19, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 15, 0 }, { 15, 1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 21, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 15, 0 }, { 15, 1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 23, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
> > +	{ { 24, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } }
> > +};
> > +
> > +static const unsigned int
> > attr_wdma_size[ATTR_LOOP_NUM][OUTPUT_WDMA_WRA_NUM] =3D {
> > +	{ 16384, 0, 4096, 0 },
> > +	{ 16384, 0, 4096, 0 },
> > +	{ 16384, 0, 0, 0 },
> > +	{ 16384, 16384, 4096, 4096 },
> > +	{ 8192, 8192, 2048, 2048 },
> > +	{ 8192, 0, 2048, 0 },
> > +	{ 8192, 8192, 0, 0 },
> > +	{ 8192, 0, 2048, 0 },
> > +	{ 2048, 2048, 0, 0 },
> > +	{ 2048, 0, 0, 0 },
> > +	{ 2048, 0, 0, 0 },
> > +	{ 2048, 0, 0, 0 },
> > +	{ 2048, 0, 0, 0 },
> > +	{ 2048, 0, 0, 0 },
> > +	{ 2048, 0, 0, 0 },
> > +	{ 2048, 2048, 0, 0 },
> > +	{ 2048, 0, 0, 0 },
> > +	{ 0, 0, 0, 0 },
> > +	{ 2048, 0, 0, 0 },
> > +	{ 1024, 0, 0, 0 },
> > +	{ 0, 0, 0, 0 },
> > +	{ 2048, 0, 0, 0 },
> > +	{ 0, 0, 0, 0 },
> > +	{ 2048, 0, 0, 0 },
> > +	{ 1024, 0, 0, 0 },
> > +	{ 0, 0, 0, 0 }
> > +};
> > +
> > +static const unsigned int
> > fld_step_align_size[FLD_STEP_NUM][FLD_MAX_FRAME] =3D {
> > +	{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6528 },
> > +	{ 1536, 1280, 1280, 1280, 1280, 1280, 1280, 1280, 1280,
> > 1280, 1280,
> > +	=C2=A0 1280, 1280, 1280, 1280 },
> > +	{ 5376, 5376, 5376, 5376, 5376, 5376, 5376, 5376, 5376,
> > 5376, 5376,
> > +	=C2=A0 5376, 5376, 5376, 5376 },
> > +	{ 307200, 307200, 307200, 307200, 307200, 307200, 307200,
> > 307200,
> > +	=C2=A0 307200, 307200, 307200, 307200, 307200, 307200, 307200
> > },
> > +	{ 8064, 8064, 8064, 8064, 8064, 8064, 8064, 8064, 8064,
> > 8064, 8064,
> > +	=C2=A0 8064, 8064, 8064, 8064 },
> > +	{ 8064, 8064, 8064, 8064, 8064, 8064, 8064, 8064, 8064,
> > 8064, 8064,
> > +	=C2=A0 8064, 8064, 8064, 8064 }
> > +};
> > +
> > +static const unsigned int fld_face_info_0[FLD_MAX_FRAME] =3D {
> > +	0x440, 0x44C, 0x458, 0x464, 0x470, 0x47C, 0x488, 0x494,
> > 0x4A4,
> > +	0x4B0, 0x4BC, 0x4C8, 0x4D4, 0x4E0, 0x4EC
> > +};
> > +
> > +static const unsigned int fld_face_info_1[FLD_MAX_FRAME] =3D {
> > +	0x444, 0x450, 0x45C, 0x468, 0x474, 0x480, 0x48C, 0x498,
> > 0x4A8,
> > +	0x4B4, 0x4C0, 0x4CC, 0x4D8, 0x4E4, 0x4F0
> > +};
> > +
> > +static const unsigned int fld_face_info_2[FLD_MAX_FRAME] =3D {
> > +	0x448, 0x454, 0x460, 0x46C, 0x478, 0x484, 0x490, 0x4A0,
> > 0x4AC,
> > +	0x4B8, 0x4C4, 0x4D0, 0x4DC, 0x4E8, 0x4F4
> > +};
> > +
> > +struct aie_static_info_element {
> > +	u32 fd_wdma_size[OUTPUT_WDMA_WRA_NUM];
> > +	u32 out_xsize_plus_1;
> > +	u32 out_height;
> > +	u32 out_ysize_plus_1_stride2;
> > +	u32 out_stride;
> > +	u32 out_stride_stride2;
> > +	u32 out_width;
> > +	u32 img_width;
> > +	u32 img_height;
> > +	u32 stride2_out_width;
> > +	u32 stride2_out_height;
> > +	u32 out_xsize_plus_1_stride2;
> > +	u32 input_xsize_plus_1;
> > +};
> > +
> > +struct aie_static_info {
> > +	struct aie_static_info_element inf_elm[FD_LOOP_NUM];
> > +};
> > +
> > +enum aie_state {
> > +	STATE_NA,
> > +	STATE_INIT,
> > +	STATE_OPEN
> > +};
> > +
> > +/* Different features of AIE 3.1 */
> > +/* FDMODE: Face Detection Mode */
> > +/* ATTRIBUTEMODE: Detect gender and race */
> > +/* FLDMODE: Detect the location of the facial features */
>=20
> Great description. Please use kerneldoc though.
>=20
> /**
> =C2=A0 * enum aie_mode - AIE Feature Mode
> =C2=A0 * @FDMODE: Face Detection
> =C2=A0 * @ATTRIBUTEMODE: Gender and ethnicity detection
> =C2=A0 * @FLDMODE: (reword that "facial features", please)
> =C2=A0 */
>=20
> > +enum aie_mode {
> > +	FDMODE,
> > +	ATTRIBUTEMODE,
> > +	FLDMODE
> > +};
> > +
> > +enum aie_format {
> > +	FMT_NA,
> > +	FMT_YUV_2P,
> > +	FMT_YVU_2P,
> > +	FMT_YUYV,
> > +	FMT_YVYU,
> > +	FMT_UYVY,
> > +	FMT_VYUY,
> > +	FMT_MONO,
> > +	/* AIE 3.X */
> > +	FMT_YUV420_2P,
> > +	FMT_YUV420_1P
> > +};
> > +
> > +enum aie_input_degree {
> > +	DEGREE_0,
> > +	DEGREE_90,
> > +	DEGREE_270,
> > +	DEGREE_180
> > +};
> > +
> > +/* align v4l2 user space interface */
> > +struct fd_ret {
> > +	u16 anchor_x0[MAX_FACE_NUM];
> > +	u16 anchor_x1[MAX_FACE_NUM];
> > +	u16 anchor_y0[MAX_FACE_NUM];
> > +	u16 anchor_y1[MAX_FACE_NUM];
> > +	s16 rop_landmark_score0[MAX_FACE_NUM];
> > +	s16 rop_landmark_score1[MAX_FACE_NUM];
> > +	s16 rop_landmark_score2[MAX_FACE_NUM];
> > +	s16 anchor_score[MAX_FACE_NUM];
> > +	s16 rip_landmark_score0[MAX_FACE_NUM];
> > +	s16 rip_landmark_score1[MAX_FACE_NUM];
> > +	s16 rip_landmark_score2[MAX_FACE_NUM];
> > +	s16 rip_landmark_score3[MAX_FACE_NUM];
> > +	s16 rip_landmark_score4[MAX_FACE_NUM];
> > +	s16 rip_landmark_score5[MAX_FACE_NUM];
> > +	s16 rip_landmark_score6[MAX_FACE_NUM];
> > +	u16 face_result_index[MAX_FACE_NUM];
> > +	u16 anchor_index[MAX_FACE_NUM];
> > +	u32 fd_partial_result;
> > +};
> > +
> > +struct fd_result {
> > +	u16 fd_pyramid0_num;
> > +	u16 fd_pyramid1_num;
> > +	u16 fd_pyramid2_num;
> > +	u16 fd_total_num;
> > +	struct fd_ret pyramid0_result;
> > +	struct fd_ret pyramid1_result;
> > +	struct fd_ret pyramid2_result;
> > +};
> > +
>=20
> Please rename that "race" with "ethnicity", it's simply more readable
> :-)
>=20
> > +struct race_result {
> > +	signed short result[4][64];
> > +};
> > +
> > +struct merged_race_result {
> > +	signed short result[4];
> > +};
> > +
> > +struct merged_gender_result {
> > +	signed short result[2];
> > +};
> > +
> > +struct merged_age_result {
> > +	signed short result[2];
> > +};
> > +
> > +struct merged_is_indian_result {
> > +	signed short result[2];
> > +};
> > +
> > +struct attr_result {
> > +	s16 gender_ret[2][64];
> > +	s16 race_ret[4][64];
>=20
> same here
>=20
> > +	s16 merged_age_ret[2];
> > +	s16 merged_gender_ret[2];
> > +	s16 merged_is_indian_ret[2];
> > +	s16 merged_race_ret[4];
> > +};
> > +
> > +/* AIE 3.X */
> > +struct fld_landmark {
> > +	u16 x;
> > +	u16 y;
> > +};
> > +
> > +struct fld_result {
> > +	struct fld_landmark fld_landmark[FLD_CUR_LANDMARK];
> > +	u16 fld_out_rip;
> > +	u16 fld_out_rop;
> > +	u16 confidence;
> > +	s16 blinkscore;
> > +};
> > +
> > +struct aie_roi {
> > +	u32 x1;
> > +	u32 y1;
> > +	u32 x2;
> > +	u32 y2;
> > +};
> > +
> > +struct aie_padding {
> > +	u32 left;
> > +	u32 right;
> > +	u32 down;
> > +	u32 up;
> > +};
> > +
> > +/* AIE 3.X */
> > +struct fld_crop_rip_rop {
> > +	u32 fld_in_crop_x1;
> > +	u32 fld_in_crop_y1;
> > +	u32 fld_in_crop_x2;
> > +	u32 fld_in_crop_y2;
> > +	u32 fld_in_rip;
> > +	u32 fld_in_rop;
> > +};
> > +
> > +/* Align v4l2 user space interface. */
> > +/* This cannot modify unless v4l2 user space is modified
> > synchronously */
>=20
> That uncovers an issue with this driver, then! Please add a layer of
> abstraction
> for the software dependant structures, so that userspace can change
> without
> breaking everything.
>=20
> Asking someone to *never upgrade or get breakages* is unreasonable.
>=20
> > +/* Otherwise AIE won't work */
> > +struct aie_enq_info {
> > +	unsigned int sel_mode;
> > +	unsigned int src_img_fmt;
> > +	unsigned int src_img_width;
> > +	unsigned int src_img_height;
> > +	unsigned int src_img_stride;
> > +	unsigned int pyramid_base_width;
> > +	unsigned int pyramid_base_height;
> > +	unsigned int number_of_pyramid;
> > +	unsigned int rotate_degree;
> > +	int en_roi;
> > +	struct aie_roi src_roi;
> > +	int en_padding;
> > +	struct aie_padding src_padding;
> > +	unsigned int freq_level;
> > +
> > +	/* AIE 3.X */
> > +	unsigned int fld_face_num;
> > +	struct fld_crop_rip_rop fld_input[FLD_MAX_FRAME];
> > +	u32 src_img_addr;
> > +	u32 src_img_addr_uv;
> > +	u32 fd_version;
> > +	u32 attr_version;
> > +	u32 pose_version;
> > +	struct fd_result fd_out;
> > +	struct attr_result attr_out;
> > +
> > +	/* AIE 3.X */
> > +	struct fld_result fld_out[FLD_MAX_FRAME];
> > +	u32 irq_status;
> > +};
> > +
>=20
> ..snip..
>=20
> > +
> > +struct mtk_aie_dev {
> > +	struct device *dev;
> > +	struct mtk_aie_ctx *ctx;
> > +	struct v4l2_m2m_dev *m2m_dev;
> > +	struct device *larb;
> > +	struct aie_para *base_para;
> > +	struct aie_attr_para *attr_para;
> > +	struct aie_fd_dma_para *dma_para;
> > +
> > +	/* AIE 3.X */
> > +	struct aie_fd_fld_para *fld_para;
> > +
> > +	struct aie_enq_info *aie_cfg;
> > +	struct workqueue_struct *frame_done_wq;
> > +	void __iomem *fd_base;
> > +	const struct mtk_aie_variant *variant;
> > +
> > +	/* Input Buffer Pointer */
> > +	struct imem_buf_info rs_cfg_data;
> > +	struct imem_buf_info fd_cfg_data;
> > +	struct imem_buf_info yuv2rgb_cfg_data;
> > +	/* HW Output Buffer Pointer */
> > +	struct imem_buf_info rs_output_hw;
> > +	struct imem_buf_info fd_dma_hw;
> > +	struct imem_buf_info fd_dma_result_hw;
> > +	struct imem_buf_info fd_kernel_hw;
> > +	struct imem_buf_info fd_attr_dma_hw;
> > +	struct aie_static_info st_info;
> > +
> > +	struct aie_reg_cfg reg_cfg;
> > +
> > +	/* AIE 3.X */
> > +	/* fld fw buffer */
> > +	struct media_device mdev;
> > +	struct video_device vfd;
> > +	struct aie_clocks aie_clk;
> > +	struct v4l2_device v4l2_dev;
> > +
> > +	/* Lock for V4L2 operations */
> > +	struct mutex vfd_lock;
> > +	/* Lock for device operations */
> > +	struct mutex dev_lock;
> > +	/* Lock for performance optimization */
> > +	struct mutex fd_lock;
> > +	struct imem_buf_info fd_fld_step_data;
> > +	struct imem_buf_info fd_fld_out_hw;
> > +
> > +	int irq;
> > +	struct completion fd_job_finished;
> > +	struct delayed_work job_timeout_work;
> > +
> > +	/* DRAM Buffer Size */
> > +	unsigned int fd_rs_cfg_size;
> > +	unsigned int fd_fd_cfg_size;
> > +	unsigned int fd_yuv2rgb_cfg_size;
> > +	unsigned int attr_fd_cfg_size;
> > +	unsigned int attr_yuv2rgb_cfg_size;
> > +
> > +	/* HW Output Buffer Size */
> > +	unsigned int rs_pym_out_size[PYM_NUM];
> > +	unsigned int fd_dma_max_size;
> > +	unsigned int fd_dma_rst_max_size;
> > +	unsigned int fd_fd_kernel_size;
> > +	unsigned int fd_attr_kernel_size;
> > +	unsigned int fd_attr_dma_max_size;
> > +	unsigned int fd_attr_dma_rst_max_size;
> > +	// AIE 3.X
>=20
> /* AIE 3.X */
>=20
> > +	/* fld size */
> > +	unsigned int fld_step_size;
> > +	unsigned int fld_out_size;
> > +
> > +	wait_queue_head_t flushing_waitq;
> > +	atomic_t num_composing;
> > +	struct mtk_aie_req_work req_work;
> > +	unsigned int fd_state;
> > +	unsigned int fd_mem_size;
> > +	u32 fd_stream_count;
> > +};
> > +
>=20
> ..snip..
>=20
> > +#endif /*__MTK_AIE_H__*/
> > diff --git a/drivers/media/platform/mediatek/aie/mtk_aie_53.c
> > b/drivers/media/platform/mediatek/aie/mtk_aie_53.c
> > new file mode 100644
> > index 000000000000..2a94b10e523d
> > --- /dev/null
> > +++ b/drivers/media/platform/mediatek/aie/mtk_aie_53.c
> > @@ -0,0 +1,1300 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2020 MediaTek Inc.
> > + * Author: Fish Wu <fish.wu@mediatek.com>
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/mtk_aie_v4l2_controls.h>
> > +#include <media/v4l2-event.h>
> > +#include <media/v4l2-ioctl.h>
> > +#include <media/v4l2-mem2mem.h>
> > +#include <media/videobuf2-dma-contig.h>
> > +#include "mtk_aie.h"
> > +
> > +#define V4L2_CID_MTK_AIE_MAX 2
> > +#define Y2R_CFG_SIZE 34
> > +#define RS_CFG_SIZE 30
> > +#define FD_CFG_SIZE 56
> > +
> > +static const struct mtk_aie_variant aie_31_drvdata =3D {
> > +	.y2r_cfg_size =3D Y2R_CFG_SIZE,
> > +	.rs_cfg_size =3D RS_CFG_SIZE,
> > +	.fd_cfg_size =3D FD_CFG_SIZE,
> > +};
> > +
> > +static const struct of_device_id mtk_aie_of_ids[] =3D {
> > +	{
> > +		.compatible =3D "mediatek,mt8188-aie",
> > +		.data =3D &aie_31_drvdata,
> > +	},
> > +	{ /* end of list */ },
>=20
> { .compatible =3D "mediatek,mt8188-aie", .data =3D &aie_31_drvdata },
> { /* sentinel */ }
>=20
> > +};
> > +MODULE_DEVICE_TABLE(of, mtk_aie_of_ids);
> > +
> > +static const struct v4l2_pix_format_mplane mtk_aie_img_fmts[] =3D {
> > +	{
> > +		.pixelformat =3D V4L2_PIX_FMT_NV16M,
> > +		.num_planes =3D 2,
> > +	},
> > +	{
> > +		.pixelformat =3D V4L2_PIX_FMT_NV61M,
> > +		.num_planes =3D 2,
> > +	},
> > +	{
> > +		.pixelformat =3D V4L2_PIX_FMT_YUYV,
> > +		.num_planes =3D 1,
> > +	},
> > +	{
> > +		.pixelformat =3D V4L2_PIX_FMT_YVYU,
> > +		.num_planes =3D 1,
> > +	},
> > +	{
> > +		.pixelformat =3D V4L2_PIX_FMT_UYVY,
> > +		.num_planes =3D 1,
> > +	},
> > +	{
> > +		.pixelformat =3D V4L2_PIX_FMT_VYUY,
> > +		.num_planes =3D 1,
> > +	},
> > +	{
> > +		.pixelformat =3D V4L2_PIX_FMT_GREY,
> > +		.num_planes =3D 1,
> > +	},
> > +	{
> > +		.pixelformat =3D V4L2_PIX_FMT_NV12M,
> > +		.num_planes =3D 2,
> > +	},
> > +	{
> > +		.pixelformat =3D V4L2_PIX_FMT_NV12,
> > +		.num_planes =3D 1,
> > +	},
> > +};
> > +
> > +#define NUM_FORMATS ARRAY_SIZE(mtk_aie_img_fmts)
>=20
> Just use ARRAY_SIZE(mtk_aie_img_fmts), you don't need that
> definition.
>=20
> > +
> > +static inline struct mtk_aie_ctx *fh_to_ctx(struct v4l2_fh *fh)
> > +{
> > +	return container_of(fh, struct mtk_aie_ctx, fh);
> > +}
> > +
> > +static inline struct mtk_aie_ctx *ctrl_to_ctx(const struct
> > v4l2_ctrl *ctrl)
> > +{
> > +	return container_of(ctrl->handler, struct mtk_aie_ctx,
> > hdl);
> > +}
> > +
>=20
> ..snip..
>=20
> > +
> > +static int mtk_aie_ctrl_type_op_validate(const struct v4l2_ctrl
> > *ctrl,
> > +					 union v4l2_ctrl_ptr ptr)
> > +{
> > +	struct mtk_aie_ctx *ctx =3D ctrl_to_ctx(ctrl);
> > +	struct v4l2_ctrl_aie_param *p_aie_param;
> > +	struct v4l2_ctrl_aie_init *p_aie_init;
> > +	struct mtk_aie_dev *fd;
> > +
> > +	if (!ctx)
> > +		return -EINVAL;
> > +
> > +	fd =3D ctx->fd_dev;
> > +
> > +	switch (ctrl->id) {
> > +	case V4L2_CID_MTK_AIE_PARAM:
> > +		p_aie_param =3D ptr.p;
> > +
> > +		switch (p_aie_param->fd_mode) {
> > +		case FDMODE:
> > +		case ATTRIBUTEMODE:
> > +		case FLDMODE:
> > +			break;
> > +		default:
> > +			dev_err(ctx->dev, "Requested invalied
> > mode: %d\n", p_aie_param->fd_mode);
>=20
> s/invalied/invalid/g=C2=A0 (multiple times!)
>=20
> > +			return -EINVAL;
> > +		}
> > +
> > +		switch (p_aie_param->src_img_fmt) {
> > +		case FMT_YUV_2P:
> > +		case FMT_YVU_2P:
> > +		case FMT_YUYV:
> > +		case FMT_YVYU:
> > +		case FMT_UYVY:
> > +		case FMT_VYUY:
> > +		case FMT_MONO:
> > +		case FMT_YUV420_2P:
> > +		case FMT_YUV420_1P:
> > +			break;
> > +		default:
> > +			dev_err(ctx->dev, "Requested invalied fmt:
> > %d\n", p_aie_param->src_img_fmt);
> > +			return -EINVAL;
> > +		}
> > +
> > +		if (p_aie_param->src_img_width > fd->base_para-
> > >max_img_rect.width ||
> > +		=C2=A0=C2=A0=C2=A0 p_aie_param->src_img_height > fd->base_para-
> > >max_img_rect.height ||
> > +		=C2=A0=C2=A0=C2=A0 p_aie_param->src_img_width =3D=3D 0 ||
> > p_aie_param->src_img_height =3D=3D 0) {
> > +			dev_err(fd->dev, "Requested invalied
> > Src_WD: %d Src_HT: %d\n",
> > +				p_aie_param->src_img_width,
> > +				p_aie_param->src_img_height);
> > +
> > +			dev_err(fd->dev, "Requested invalied
> > MAX_Src_WD: %d MAX_Src_HT: %d\n",
> > +				fd->base_para->max_img_rect.width,
> > +				fd->base_para-
> > >max_img_rect.height);
> > +
> > +			return -EINVAL;
> > +		}
> > +
> > +		if (p_aie_param->pyramid_base_width > fd-
> > >base_para->max_pyramid_rect.width ||
> > +		=C2=A0=C2=A0=C2=A0 p_aie_param->pyramid_base_height > fd-
> > >base_para->max_pyramid_rect.height ||
> > +		=C2=A0=C2=A0=C2=A0 p_aie_param->number_of_pyramid > 3 ||
> > p_aie_param->number_of_pyramid <=3D 0) {
> > +			dev_err(fd->dev, "Requested invalied base
> > w: %d h: %d num: %d\n",
> > +				p_aie_param->pyramid_base_width,
> > p_aie_param->pyramid_base_height,
> > +				p_aie_param->number_of_pyramid);
> > +
> > +			dev_err(fd->dev, "Requested invalied max
> > w: %d h: %d\n",
> > +				fd->base_para-
> > >max_pyramid_rect.width,
> > +				fd->base_para-
> > >max_pyramid_rect.height);
> > +
> > +			return -EINVAL;
> > +		}
> > +
> > +		break;
> > +
> > +	case V4L2_CID_MTK_AIE_INIT:
> > +		p_aie_init =3D ptr.p;
> > +		if (!p_aie_init->max_img_width || !p_aie_init-
> > >max_img_height ||
> > +		=C2=A0=C2=A0=C2=A0 !p_aie_init->pyramid_width || !p_aie_init-
> > >pyramid_height) {
> > +			dev_err(fd->dev,
> > +				"Requested invalied max_w: %d
> > max_h: %d, p_w: %d p_h: %d\n",
> > +				p_aie_init->max_img_width,
> > p_aie_init->max_img_height,
> > +				p_aie_init->pyramid_width,
> > p_aie_init->pyramid_height);
> > +
> > +			return -EINVAL;
> > +		}
> > +
> > +		break;
> > +
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> ..snip..
>=20
> > +
> > +static int mtk_aie_probe(struct platform_device *pdev)
> > +{
> > +	struct mtk_aie_dev *fd;
> > +	struct device *dev =3D &pdev->dev;
> > +	const struct mtk_aie_variant *driver_data =3D NULL;
> > +	const struct of_device_id *match =3D NULL;
> > +	int irq;
> > +	int ret;
> > +
> > +	static struct clk_bulk_data aie_clks[] =3D {
> > +		{ .id =3D "img_ipe" },
>=20
> Please don't use underscores: "img-ipe", "ipe-fdvt", "ipe-top", "ipe-
> larb"
>=20
> > +		{ .id =3D "ipe_fdvt" },
> > +		{ .id =3D "ipe_top" },
> > +		{ .id =3D "ipe_smi_larb12" },
> > +	};
> > +
> > +	fd =3D devm_kzalloc(&pdev->dev, sizeof(*fd), GFP_KERNEL);
> > +	if (!fd)
> > +		return -ENOMEM;
> > +
> > +	match =3D of_match_node(mtk_aie_of_ids, dev->of_node);
> > +	if (match)
> > +		driver_data =3D (const struct mtk_aie_variant
> > *)match->data;
> > +
> > +	fd->variant =3D driver_data;
> > +	if (!fd->variant)
> > +		return -ENODEV;
> > +
> > +	ret =3D dma_set_mask_and_coherent(dev, DMA_BIT_MASK(34));
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "Cannot set
> > Coherent DMA mask\n");
> > +
> > +	dev_set_drvdata(dev, fd);
> > +	fd->dev =3D dev;
> > +
> > +	irq =3D platform_get_irq(pdev, 0);
> > +	if (irq < 0)
> > +		return dev_err_probe(dev, irq, "Failed to get
> > IRQ\n");
> > +
> > +	ret =3D devm_request_irq(dev, irq, mtk_aie_irq, IRQF_SHARED,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_driver_string(dev), fd);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "Failed to request
> > irq\n");
> > +
> > +	fd->irq =3D irq;
> > +	fd->fd_base =3D devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(fd->fd_base))
> > +		return dev_err_probe(dev, -EINVAL, "Failed to get
> > fd reg base\n");
> > +
> > +	fd->aie_clk.clk_num =3D ARRAY_SIZE(aie_clks);
> > +	fd->aie_clk.clks =3D aie_clks;
> > +	ret =3D devm_clk_bulk_get(&pdev->dev, fd->aie_clk.clk_num,
> > fd->aie_clk.clks);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "Failed to get raw
> > clock\n");
> > +
> > +	ret =3D mtk_aie_resource_init(fd);
> > +	if (ret) {
> > +		mtk_aie_resource_free(pdev);
> > +		return ret;
> > +	}
> > +	pm_runtime_enable(dev);
> > +	ret =3D mtk_aie_dev_v4l2_init(fd);
> > +	if (ret) {
> > +		pm_runtime_disable(&pdev->dev);
> > +		return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> ..snip..
>=20
> > diff --git a/drivers/media/platform/mediatek/aie/mtk_aie_drv.c
> > b/drivers/media/platform/mediatek/aie/mtk_aie_drv.c
> > new file mode 100644
> > index 000000000000..d1221e442ea3
> > --- /dev/null
> > +++ b/drivers/media/platform/mediatek/aie/mtk_aie_drv.c
> > @@ -0,0 +1,2309 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2020 MediaTek Inc.
> > + * Author: Fish Wu <fish.wu@mediatek.com>
> > + */
> > +
> > +#include <linux/firmware.h>
> > +#include <linux/mtk_aie_v4l2_controls.h>
> > +#include "mtk_aie.h"
> > +
>=20
> ..snip..
>=20
> > +static int aie_imem_alloc(struct mtk_aie_dev *fd, u32 size,
> > +			=C2=A0 struct imem_buf_info *bufinfo)
> > +{
> > +	struct device *dev =3D fd->dev;
> > +	void *va;
> > +	dma_addr_t dma_handle;
>=20
>=20
> 	struct device *dev =3D fd->dev;
> 	dma_addr_t dma_handle;
> 	void *va;
>=20
>=20
> > +
> > +	if (size =3D=3D 0) {
> > +		dev_dbg(fd->dev, "%s: size(%d)\n", __func__,
> > size);
> > +		return -EINVAL;
> > +	}
> > +
> > +	fd->fd_mem_size +=3D size;
> > +
> > +	va =3D dma_alloc_coherent(dev, size, &dma_handle,
> > GFP_KERNEL);
> > +	if (!va || dma_handle =3D=3D 0)
> > +		return -ENOMEM;
> > +
> > +	bufinfo->va =3D va;
> > +	bufinfo->pa =3D dma_handle;
> > +	bufinfo->size =3D size;
> > +
> > +	dev_dbg(fd->dev, "%s: vAddr(0x%p) size(%d)\n", __func__,
> > va,=C2=A0 size);
> > +
> > +	return 0;
> > +}
> > +
> ..snip..
>=20
> > +
> > +static int aie_load_fw(struct mtk_aie_dev *fd)
> > +{
> > +	char name[128] =3D {};
> > +	u8 i, j;
> > +	int ret;
> > +
> > +	ret =3D sprintf(name,
> > "aie_mp_fw31/config/aie_fd_fd_config.bin");
>=20
> I have a hunch that this can be different on a per-SoC basis.
>=20
> You have to do something such that the firmware is retrieved from
>=20
> mediatek/mt(xxxx)/aie/
>=20
> as a base directory, and then you concat
>=20
> "config/"
>=20
> for config type firmware, or you concat
>=20
> "kernel/"
>=20
> for kernel type firmware.
>=20
> Also, the "_config" name is redundant in config type firmwares, as
> much as the
> "_kernel" is.
>=20
>=20
> You want something like:
>=20
> mediatek/mt8195/aie/config/fd_rs.bin
> mediatek/mt8195/aie/config/fd_yuv2rgb.bin
> mediatek/mt8195/aie/config/attr_fd.bin
> mediatek/mt8195/aie/config/attr_yuv2rgb.bin
>=20
> mediatek/mt8195/aie/kernel/fd_bias_loop.bin
> mediatek/mt8195/aie/kernel/attr_bias_loop.bin
>=20
> ...but also, you should find a way to concatenate all of the loops in
> one binary
> because otherwise the amount of firmwares gets literally out of
> control, and beware
> that performance also gets hurt by loading 100+ firmware files.
>=20
> Same goes for the xxx_forest and the others.
>=20
> It's really, really, really... really too many files.

I slightly sense an abuse of the firmware interface here. What are
these firmware doing ? It is just the result of software developpers
using an private AI SDK to pre-compile models and transforms ?  We
could have gigabytes of so called "firmware" with such an approach. I
don't really want to see linux-media + firmware to be a way to keep
private the AI hardware.

This also reflects in the uAPI, since you endup adding yet another ROI
implementation, with yet more rectangles looking structure that are all
aimed to a software implementation rather then reflecting what the HW
is. I of course lack the understanding of this design, but I think its
fair to ask why its not implemented like other generic NPU/TPU ?

Also, be aware that under linux-media, we ask firmwares to make it to
linux-firmware before we can merge.

Nicolas

