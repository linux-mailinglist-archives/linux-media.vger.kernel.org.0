Return-Path: <linux-media+bounces-13442-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7DE90B2F7
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 16:55:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADB071F226B6
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 14:55:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BBF116CD20;
	Mon, 17 Jun 2024 13:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="Ykg0IGWp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0E316CD0A
	for <linux-media@vger.kernel.org>; Mon, 17 Jun 2024 13:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718632791; cv=none; b=sMkLlbTzUnejjiBU6IJOEZSnZRxXHLzVymxwiXZgHxXaQUnoF93GlauHGOyDDAXJ3PAYXt7tMG0jN/rjSLYWLemKsmXX19EfJfE4GgugDXOuWrA/dU+cWUNlCw8dacNEmyhsMVDv746t5Gy98NA+pVd7sbJcP+8uvtqgmJJuQP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718632791; c=relaxed/simple;
	bh=rq++1Tz+VyCmz+qBL3n521WvMURhso2Ys5WKCq7Rpv4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Fohp1G/CwhCVeVnjyURNxS/osDzfVsX8qWrGOI1Z4ARjHKeZAbxCQVeGgR3XSDSW/GDaXq74bSH+otwa8oViOCHbU9Xq9qkjOrb/GNQSvI4oVBPF4UEfMCKV6UQTZrsp8itxKwKbWtqkiaSv8MqXnC/7wD8LLLCW851fjFy9oBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=Ykg0IGWp; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7955f3d4516so482654985a.1
        for <linux-media@vger.kernel.org>; Mon, 17 Jun 2024 06:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1718632785; x=1719237585; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2NDJRDCp/MvnXw87P7q1dSPh0cZOdVmlM+jXGS4rRv0=;
        b=Ykg0IGWpf7Xz3f+V14r+lanYjnmMAuyarcXUvVc8/+vB/M79z+J9zsU24JveJV4gNX
         Be8Wm5qT1M1vjtuA0tLWMisN8jsyvIh5N0D7Ep3tSZ2exWyLgos/uB5jAS4iOL7KaNF/
         VogpgTxAsS2XHKiZVEMiWyBNbGkLa/NRMmqndyCv+FObjyivZANJZOlLW8nnVt6TSdkw
         xE3gQbcjq95yYG3oY2ZoS2BRSwLMW3UabAf7vK9OqlcEnPrLwRPWeT5KGAXCVufsguF4
         5Hg5HpgvQutF0fzjk/6aamuaZhqs9QkDJmBKlKEi2uV/hcGzJD4KoUYJqAuCqBkpth/Q
         Zxrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632785; x=1719237585;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2NDJRDCp/MvnXw87P7q1dSPh0cZOdVmlM+jXGS4rRv0=;
        b=SGodirLYu0waa6+2GttSRwcb/i6jWCdJuBC9J2uXtNNB84Dlh3KZ9Z2W43fAhyqfkW
         3Kauk+6SpH9sk5ZAFPpOr1TlqtRDKSZcj9bgtHuayfyP4QqbMLlpWv+H/oXEAyVGdRXi
         UulPuXvhjuNnzIAQp57Ju26t847DwLnORZedcJcK6J+dWAEUi2GFYeqkQzejEXD/YwIf
         UDfMKon1sVr8oo0MY2B3xCMFHLTns/cpfrRecRQ0cWgPHXnIfbQOStlLnuJCJtsej4SE
         /dM+neFmgjkd10kDgTgWvJqrbpEzrhJCNSie3GHIp6taKm99hYOLkmCFrTNO+AWKbUhp
         RRFw==
X-Forwarded-Encrypted: i=1; AJvYcCWecoFp64gEhNtqKQrVX6BYdeOKYFWzlF7DCA2I+mo7cIitxV2A6XP6BYkZDkCfAoMjngjh+wpoMSspH4eoO21X+iCor6SayE0sRhM=
X-Gm-Message-State: AOJu0YysIJHXEHIYj/xmy6MTIyGPY6FtNuBhSs5Qbn6ROxqaXLSUOqjs
	HMf7xby2StIzueavkSsWK99ny76MC13F56PfqpwcGsYltaTcrECFDIoks2k2Pls=
X-Google-Smtp-Source: AGHT+IH2ZKlH7pVF+OoV7DZckgpW2FWjgHrpaPZUiwtuWY55bcqCcyQ1sdIfOCCAYBJ3/62wdi4u5A==
X-Received: by 2002:a05:620a:4508:b0:795:4f8d:10e2 with SMTP id af79cd13be357-798d01f7598mr1844782785a.6.1718632784041;
        Mon, 17 Jun 2024 06:59:44 -0700 (PDT)
Received: from nicolas-tpx395.lan ([2606:6d00:15:57da::7a9])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798ab5b6df9sm431543585a.67.2024.06.17.06.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:59:43 -0700 (PDT)
Message-ID: <c7723ebcc003cff3d022cb3592632de82db78eaf.camel@ndufresne.ca>
Subject: Re: [PATCH 1/3] media: rockchip: Introduce the rkvdec2 driver
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Andy Yan <andyshrk@163.com>, Detlev Casanova
 <detlev.casanova@collabora.com>
Cc: linux-kernel@vger.kernel.org, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Heiko Stuebner
 <heiko@sntech.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, Dragan Simic
 <dsimic@manjaro.org>, Alexey Charkov <alchark@gmail.com>, Cristian
 Ciocaltea <cristian.ciocaltea@collabora.com>,  Diederik de Haas
 <didi.debian@cknow.org>, Andy Yan <andy.yan@rock-chips.com>,
 linux-media@vger.kernel.org,  devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev
Date: Mon, 17 Jun 2024 09:59:42 -0400
In-Reply-To: <7868a575.14f8.1901fd6f81a.Coremail.andyshrk@163.com>
References: <20240615015734.1612108-1-detlev.casanova@collabora.com>
	 <20240615015734.1612108-2-detlev.casanova@collabora.com>
	 <7868a575.14f8.1901fd6f81a.Coremail.andyshrk@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

Le dimanche 16 juin 2024 =C3=A0 14:58 +0800, Andy Yan a =C3=A9crit=C2=A0:
> Hi Detlev=EF=BC=8C
>      Thanks for your great work=E3=80=82
>      How can I test these patches? Do they require any additional userspa=
ce patches?

current driver is being tested with GStreamer, 1.24.X (or even 1.22.X) shal=
l be
enough for this. This is commonly available in major distribution today.

Nicolas

>=20
> At 2024-06-15 09:56:27, "Detlev Casanova" <detlev.casanova@collabora.com>=
 wrote:
> > This driver supports the second generation of the Rockchip Video
> > decoder, also known as vdpu34x.
> > It is currently only used on the RK3588(s) SoC.
> >=20
> > There are 2 decoders on the RK3588 SoC that can work in pair to decode
> > 8K video at 30 FPS but currently, only using one core at a time is
> > supported.
> >=20
> > Scheduling requests between the two cores will be implemented later.
> >=20
> > The core supports H264, HEVC, VP9 and AVS2 decoding but this driver
> > currently only supports H264.
> >=20
> > The driver is based on rkvdec and they may share some code in the
> > future.
> > The decision to make a different driver is mainly because rkvdec2 has
> > more features and can work with multiple cores.
> >=20
> > The registers are mapped in a struct in RAM using bitfields. It is IO
> > copied to the HW when all values are configured.
> > The decision to use such a struct instead of writing buffers one by one
> > is based on the following reasons:
> > - Rockchip cores are known to misbehave when registers are not written
> >   in address order,
> > - Those cores also need the software to write all registers, even if
> >   they are written their default values or are not related to the task
> >   (this core will not start decoding some H264 frames if some VP9
> >   registers are not written to 0)
> > - In the future, to support multiple cores, the scheduler could be
> >   optimized by storing the precomputed registers values and copy them
> >   to the HW as soos as a core becomes available.
> >=20
> > This makes the code more readable and may bring performance improvement=
s
> > in future features.
> >=20
> > Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> > ---
> > drivers/staging/media/Kconfig                |    1 +
> > drivers/staging/media/Makefile               |    1 +
> > drivers/staging/media/rkvdec2/Kconfig        |   15 +
> > drivers/staging/media/rkvdec2/Makefile       |    3 +
> > drivers/staging/media/rkvdec2/TODO           |   13 +
> > drivers/staging/media/rkvdec2/rkvdec2-h264.c |  899 ++++++++++++++
> > drivers/staging/media/rkvdec2/rkvdec2-regs.h |  372 ++++++
> > drivers/staging/media/rkvdec2/rkvdec2.c      | 1160 ++++++++++++++++++
> > drivers/staging/media/rkvdec2/rkvdec2.h      |  123 ++
> > 9 files changed, 2587 insertions(+)
> > create mode 100644 drivers/staging/media/rkvdec2/Kconfig
> > create mode 100644 drivers/staging/media/rkvdec2/Makefile
> > create mode 100644 drivers/staging/media/rkvdec2/TODO
> > create mode 100644 drivers/staging/media/rkvdec2/rkvdec2-h264.c
> > create mode 100644 drivers/staging/media/rkvdec2/rkvdec2-regs.h
> > create mode 100644 drivers/staging/media/rkvdec2/rkvdec2.c
> > create mode 100644 drivers/staging/media/rkvdec2/rkvdec2.h
> >=20
> > diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kcon=
fig
> > index 554c2e475ce3..7f377d37e670 100644
> > --- a/drivers/staging/media/Kconfig
> > +++ b/drivers/staging/media/Kconfig
> > @@ -35,6 +35,7 @@ source "drivers/staging/media/meson/vdec/Kconfig"
> > source "drivers/staging/media/omap4iss/Kconfig"
> >=20
> > source "drivers/staging/media/rkvdec/Kconfig"
> > +source "drivers/staging/media/rkvdec2/Kconfig"
> >=20
> > source "drivers/staging/media/starfive/Kconfig"
> >=20
> > diff --git a/drivers/staging/media/Makefile b/drivers/staging/media/Mak=
efile
> > index dcaeeca0ee6d..0a2d89db32b2 100644
> > --- a/drivers/staging/media/Makefile
> > +++ b/drivers/staging/media/Makefile
> > @@ -6,6 +6,7 @@ obj-$(CONFIG_VIDEO_MAX96712)	+=3D max96712/
> > obj-$(CONFIG_VIDEO_MESON_VDEC)	+=3D meson/vdec/
> > obj-$(CONFIG_VIDEO_OMAP4)	+=3D omap4iss/
> > obj-$(CONFIG_VIDEO_ROCKCHIP_VDEC)	+=3D rkvdec/
> > +obj-$(CONFIG_VIDEO_ROCKCHIP_VDEC2)	+=3D rkvdec2/
> > obj-$(CONFIG_VIDEO_STARFIVE_CAMSS)	+=3D starfive/
> > obj-$(CONFIG_VIDEO_SUNXI)	+=3D sunxi/
> > obj-$(CONFIG_VIDEO_TEGRA)	+=3D tegra-video/
> > diff --git a/drivers/staging/media/rkvdec2/Kconfig b/drivers/staging/me=
dia/rkvdec2/Kconfig
> > new file mode 100644
> > index 000000000000..fd505cb7aff9
> > --- /dev/null
> > +++ b/drivers/staging/media/rkvdec2/Kconfig
> > @@ -0,0 +1,15 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +config VIDEO_ROCKCHIP_VDEC2
> > +	tristate "Rockchip Video Decoder driver 2"
> > +	depends on ARCH_ROCKCHIP || COMPILE_TEST
> > +	depends on VIDEO_DEV
> > +	select MEDIA_CONTROLLER
> > +	select VIDEOBUF2_DMA_CONTIG
> > +	select VIDEOBUF2_VMALLOC
> > +	select V4L2_MEM2MEM_DEV
> > +	select V4L2_H264
> > +	help
> > +	  Support for the Rockchip Video Decoder 2 IP present on Rockchip SoC=
s,
> > +	  which accelerates video decoding.
> > +	  To compile this driver as a module, choose M here: the module
> > +	  will be called rockchip-vdec2.
> > diff --git a/drivers/staging/media/rkvdec2/Makefile b/drivers/staging/m=
edia/rkvdec2/Makefile
> > new file mode 100644
> > index 000000000000..b5a6ac701970
> > --- /dev/null
> > +++ b/drivers/staging/media/rkvdec2/Makefile
> > @@ -0,0 +1,3 @@
> > +obj-$(CONFIG_VIDEO_ROCKCHIP_VDEC2) +=3D rockchip-vdec2.o
> > +
> > +rockchip-vdec2-y +=3D rkvdec2.o rkvdec2-h264.o
> > diff --git a/drivers/staging/media/rkvdec2/TODO b/drivers/staging/media=
/rkvdec2/TODO
> > new file mode 100644
> > index 000000000000..8448fb20185e
> > --- /dev/null
> > +++ b/drivers/staging/media/rkvdec2/TODO
> > @@ -0,0 +1,13 @@
> > +* H264 features
> > +
> > +  - Fluster score currently is 129/135 for JVT-AVC_V1.
> > +    This probably won't improve.
> > +  - RCB is not stored in sram yet.
> > +
> > +* Support for HEVC and VP9 are planned for this driver.
> > +
> > +  First, the h264 backend needs to be stabilized.
> > +
> > +* Evaluate sharing code with rkvdec
> > +
> > +  As rkvdec is still in staging, this driver stays there as well.
> > diff --git a/drivers/staging/media/rkvdec2/rkvdec2-h264.c b/drivers/sta=
ging/media/rkvdec2/rkvdec2-h264.c
> > new file mode 100644
> > index 000000000000..484d32f15a42
> > --- /dev/null
> > +++ b/drivers/staging/media/rkvdec2/rkvdec2-h264.c
> > @@ -0,0 +1,899 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Rockchip Video Decoder 2 H264 backend
> > + *
> > + * Copyright (C) 2024 Collabora, Ltd.
> > + *  Detlev Casanova <detlev.casanova@collabora.com>
> > + *
> > + * Based on rkvdec driver by Boris Brezillon <boris.brezillon@collabor=
a.com>
> > + */
> > +
> > +#include <media/v4l2-h264.h>
> > +#include <media/v4l2-mem2mem.h>
> > +
> > +#include "rkvdec2.h"
> > +#include "rkvdec2-regs.h"
> > +
> > +#define RKVDEC_NUM_REFLIST		3
> > +
> > +struct rkvdec2_h264_scaling_list {
> > +	u8 scaling_list_4x4[6][16];
> > +	u8 scaling_list_8x8[6][64];
> > +	u8 padding[128];
> > +};
> > +
> > +struct rkvdec2_sps {
> > +	u16 seq_parameter_set_id:			4;
> > +	u16 profile_idc:				8;
> > +	u16 constraint_set3_flag:			1;
> > +	u16 chroma_format_idc:				2;
> > +	u16 bit_depth_luma:				3;
> > +	u16 bit_depth_chroma:				3;
> > +	u16 qpprime_y_zero_transform_bypass_flag:	1;
> > +	u16 log2_max_frame_num_minus4:			4;
> > +	u16 max_num_ref_frames:				5;
> > +	u16 pic_order_cnt_type:				2;
> > +	u16 log2_max_pic_order_cnt_lsb_minus4:		4;
> > +	u16 delta_pic_order_always_zero_flag:		1;
> > +	u16 pic_width_in_mbs:				12;
> > +	u16 pic_height_in_mbs:				12;
> > +	u16 frame_mbs_only_flag:			1;
> > +	u16 mb_adaptive_frame_field_flag:		1;
> > +	u16 direct_8x8_inference_flag:			1;
> > +	u16 mvc_extension_enable:			1;
> > +	u16 num_views:					2;
> > +
> > +	u16 reserved_bits:				12;
> > +	u16 reserved[11];
> > +} __packed;
> > +
> > +struct rkvdec2_pps {
> > +	u16 pic_parameter_set_id:				8;
> > +	u16 pps_seq_parameter_set_id:				5;
> > +	u16 entropy_coding_mode_flag:				1;
> > +	u16 bottom_field_pic_order_in_frame_present_flag:	1;
> > +	u16 num_ref_idx_l0_default_active_minus1:		5;
> > +	u16 num_ref_idx_l1_default_active_minus1:		5;
> > +	u16 weighted_pred_flag:					1;
> > +	u16 weighted_bipred_idc:				2;
> > +	u16 pic_init_qp_minus26:				7;
> > +	u16 pic_init_qs_minus26:				6;
> > +	u16 chroma_qp_index_offset:				5;
> > +	u16 deblocking_filter_control_present_flag:		1;
> > +	u16 constrained_intra_pred_flag:			1;
> > +	u16 redundant_pic_cnt_present:				1;
> > +	u16 transform_8x8_mode_flag:				1;
> > +	u16 second_chroma_qp_index_offset:			5;
> > +	u16 scaling_list_enable_flag:				1;
> > +	u32 scaling_list_address;
> > +	u16 is_longterm;
> > +
> > +	u8 reserved[3];
> > +} __packed;
> > +
> > +struct rkvdec2_rps_entry {
> > +	u32 dpb_info0:		5;
> > +	u32 bottom_flag0:	1;
> > +	u32 view_index_off0:	1;
> > +	u32 dpb_info1:		5;
> > +	u32 bottom_flag1:	1;
> > +	u32 view_index_off1:	1;
> > +	u32 dpb_info2:		5;
> > +	u32 bottom_flag2:	1;
> > +	u32 view_index_off2:	1;
> > +	u32 dpb_info3:		5;
> > +	u32 bottom_flag3:	1;
> > +	u32 view_index_off3:	1;
> > +	u32 dpb_info4:		5;
> > +	u32 bottom_flag4:	1;
> > +	u32 view_index_off4:	1;
> > +	u32 dpb_info5:		5;
> > +	u32 bottom_flag5:	1;
> > +	u32 view_index_off5:	1;
> > +	u32 dpb_info6:		5;
> > +	u32 bottom_flag6:	1;
> > +	u32 view_index_off6:	1;
> > +	u32 dpb_info7:		5;
> > +	u32 bottom_flag7:	1;
> > +	u32 view_index_off7:	1;
> > +} __packed;
> > +
> > +struct rkvdec2_rps {
> > +	u16 frame_num[16];
> > +	u32 reserved0;
> > +	struct rkvdec2_rps_entry entries[12];
> > +	u32 reserved1[66];
> > +}  __packed;
> > +
> > +int a =3D sizeof(struct rkvdec2_rps);
> > +
> > +struct rkvdec2_sps_pps {
> > +	struct rkvdec2_sps sps;
> > +	struct rkvdec2_pps pps;
> > +}  __packed;
> > +
> > +/* Data structure describing auxiliary buffer format. */
> > +struct rkvdec2_h264_priv_tbl {
> > +	u32 cabac_table[928];
> > +	struct rkvdec2_h264_scaling_list scaling_list;
> > +	struct rkvdec2_sps_pps param_set[256];
> > +	struct rkvdec2_rps rps;
> > +};
> > +
> > +struct rkvdec2_h264_reflists {
> > +	struct v4l2_h264_reference p[V4L2_H264_REF_LIST_LEN];
> > +	struct v4l2_h264_reference b0[V4L2_H264_REF_LIST_LEN];
> > +	struct v4l2_h264_reference b1[V4L2_H264_REF_LIST_LEN];
> > +};
> > +
> > +struct rkvdec2_h264_run {
> > +	struct rkvdec2_run					base;
> > +	const struct v4l2_ctrl_h264_decode_params		*decode_params;
> > +	const struct v4l2_ctrl_h264_sps				*sps;
> > +	const struct v4l2_ctrl_h264_pps				*pps;
> > +	const struct v4l2_ctrl_h264_scaling_matrix		*scaling_matrix;
> > +	struct vb2_buffer *ref_buf[V4L2_H264_NUM_DPB_ENTRIES];
> > +};
> > +
> > +struct rkvdec2_h264_ctx {
> > +	struct rkvdec2_aux_buf		priv_tbl;
> > +	struct rkvdec2_h264_reflists	reflists;
> > +	struct rkvdec2_regs_h264	regs;
> > +};
> > +
> > +/*
> > + * Constant CABAC table.
> > + */
> > +static const u32 rkvdec2_h264_cabac_table[928] =3D {
> > +	0x3602f114, 0xf1144a03, 0x4a033602, 0x68e97fe4, 0x36ff35fa, 0x2117330=
7,
> > +	0x00150217, 0x31000901, 0x390576db, 0x41f54ef3, 0x310c3e01, 0x321149f=
c,
> > +	0x2b094012, 0x431a001d, 0x68095a10, 0x68ec7fd2, 0x4ef34301, 0x3e0141f=
5,
> > +	0x5fef56fa, 0x2d093dfa, 0x51fa45fd, 0x370660f5, 0x56fb4307, 0x3a00580=
2,
> > +	0x5ef64cfd, 0x45043605, 0x580051fd, 0x4afb43f9, 0x50fb4afc, 0x3a0148f=
9,
> > +	0x3f002900, 0x3f003f00, 0x560453f7, 0x48f96100, 0x3e03290d, 0x4efc2d0=
0,
> > +	0x7ee560fd, 0x65e762e4, 0x52e443e9, 0x53f05eec, 0x5beb6eea, 0x5df366e=
e,
> > +	0x5cf97fe3, 0x60f959fb, 0x2efd6cf3, 0x39ff41ff, 0x4afd5df7, 0x57f85cf=
7,
> > +	0x36057ee9, 0x3b063c06, 0x30ff4506, 0x45fc4400, 0x55fe58f8, 0x4bff4ef=
a,
> > +	0x36024df9, 0x44fd3205, 0x2a063201, 0x3f0151fc, 0x430046fc, 0x4cfe390=
2,
> > +	0x4004230b, 0x230b3d01, 0x180c1912, 0x240d1d0d, 0x49f95df6, 0x2e0d49f=
e,
> > +	0x64f93109, 0x35023509, 0x3dfe3505, 0x38003800, 0x3cfb3ff3, 0x39043ef=
f,
> > +	0x390445fa, 0x3304270e, 0x4003440d, 0x3f093d01, 0x27103207, 0x34042c0=
5,
> > +	0x3cfb300b, 0x3b003bff, 0x2c052116, 0x4eff2b0e, 0x45093c00, 0x28021c0=
b,
> > +	0x31002c03, 0x2c022e00, 0x2f003302, 0x3e022704, 0x36002e06, 0x3a02360=
3,
> > +	0x33063f04, 0x35073906, 0x37063406, 0x240e2d0b, 0x52ff3508, 0x4efd370=
7,
> > +	0x1f162e0f, 0x071954ff, 0x031cf91e, 0x0020041c, 0x061eff22, 0x0920061=
e,
> > +	0x1b1a131f, 0x14251e1a, 0x4611221c, 0x3b054301, 0x1e104309, 0x2312201=
2,
> > +	0x1f181d16, 0x2b122617, 0x3f0b2914, 0x40093b09, 0x59fe5eff, 0x4cfa6cf=
7,
> > +	0x2d002cfe, 0x40fd3400, 0x46fc3bfe, 0x52f84bfc, 0x4df766ef, 0x2a00180=
3,
> > +	0x37003000, 0x47f93bfa, 0x57f553f4, 0x3a0177e2, 0x24ff1dfd, 0x2b02260=
1,
> > +	0x3a0037fa, 0x4afd4000, 0x46005af6, 0x1f051dfc, 0x3b012a07, 0x48fd3af=
e,
> > +	0x61f551fd, 0x05083a00, 0x120e0e0a, 0x28021b0d, 0x46fd3a00, 0x55f84ff=
a,
> > +	0x6af30000, 0x57f66af0, 0x6eee72eb, 0x6eea62f2, 0x67ee6aeb, 0x6ce96be=
b,
> > +	0x60f670e6, 0x5bfb5ff4, 0x5eea5df7, 0x430956fb, 0x55f650fc, 0x3c0746f=
f,
> > +	0x3d053a09, 0x320f320c, 0x36113112, 0x2e07290a, 0x310733ff, 0x2909340=
8,
> > +	0x37022f06, 0x2c0a290d, 0x35053206, 0x3f04310d, 0x45fe4006, 0x46063bf=
e,
> > +	0x1f092c0a, 0x35032b0c, 0x260a220e, 0x280d34fd, 0x2c072011, 0x320d260=
7,
> > +	0x2b1a390a, 0x0e0b0b0e, 0x0b120b09, 0xfe170915, 0xf120f120, 0xe927eb2=
2,
> > +	0xe129df2a, 0xf426e42e, 0xe82d1d15, 0xe630d335, 0xed2bd541, 0x091ef62=
7,
> > +	0x1b141a12, 0x52f23900, 0x61ed4bfb, 0x001b7ddd, 0xfc1f001c, 0x0822061=
b,
> > +	0x16180a1e, 0x20161321, 0x29151f1a, 0x2f172c1a, 0x470e4110, 0x3f063c0=
8,
> > +	0x18154111, 0x171a1417, 0x171c201b, 0x2817181c, 0x1d1c2018, 0x39132a1=
7,
> > +	0x3d163516, 0x280c560b, 0x3b0e330b, 0x47f94ffc, 0x46f745fb, 0x44f642f=
8,
> > +	0x45f449ed, 0x43f146f0, 0x46ed3eec, 0x41ea42f0, 0xfe093fec, 0xf721f71=
a,
> > +	0xfe29f927, 0x0931032d, 0x3b241b2d, 0x23f942fa, 0x2df82af9, 0x38f430f=
b,
> > +	0x3efb3cfa, 0x4cf842f8, 0x51fa55fb, 0x51f94df6, 0x49ee50ef, 0x53f64af=
c,
> > +	0x43f747f7, 0x42f83dff, 0x3b0042f2, 0xf3153b02, 0xf927f221, 0x0233fe2=
e,
> > +	0x113d063c, 0x3e2a2237, 0x00000000, 0x00000000, 0x3602f114, 0xf1144a0=
3,
> > +	0x4a033602, 0x68e97fe4, 0x36ff35fa, 0x19163307, 0x00100022, 0x290409f=
e,
> > +	0x410276e3, 0x4ff347fa, 0x32093405, 0x360a46fd, 0x1613221a, 0x0239002=
8,
> > +	0x451a2429, 0x65f17fd3, 0x47fa4cfc, 0x34054ff3, 0x5af34506, 0x2b08340=
0,
> > +	0x52fb45fe, 0x3b0260f6, 0x57fd4b02, 0x380164fd, 0x55fa4afd, 0x51fd3b0=
0,
> > +	0x5ffb56f9, 0x4dff42ff, 0x56fe4601, 0x3d0048fb, 0x3f002900, 0x3f003f0=
0,
> > +	0x560453f7, 0x48f96100, 0x3e03290d, 0x33070f0d, 0x7fd95002, 0x60ef5be=
e,
> > +	0x62dd51e6, 0x61e966e8, 0x63e877e5, 0x66ee6eeb, 0x50007fdc, 0x5ef959f=
b,
> > +	0x27005cfc, 0x54f14100, 0x49fe7fdd, 0x5bf768f4, 0x37037fe1, 0x3707380=
7,
> > +	0x35fd3d08, 0x4af94400, 0x67f358f7, 0x59f75bf3, 0x4cf85cf2, 0x6ee957f=
4,
> > +	0x4ef669e8, 0x63ef70ec, 0x7fba7fb2, 0x7fd27fce, 0x4efb42fc, 0x48f847f=
c,
> > +	0x37ff3b02, 0x4bfa46f9, 0x77de59f8, 0x14204bfd, 0x7fd4161e, 0x3dfb360=
0,
> > +	0x3cff3a00, 0x43f83dfd, 0x4af254e7, 0x340541fb, 0x3d003902, 0x46f545f=
7,
> > +	0x47fc3712, 0x3d073a00, 0x19122909, 0x2b052009, 0x2c002f09, 0x2e02330=
0,
> > +	0x42fc2613, 0x2a0c260f, 0x59002209, 0x1c0a2d04, 0xf5211f0a, 0x0f12d53=
4,
> > +	0xea23001c, 0x0022e726, 0xf420ee27, 0x0000a266, 0xfc21f138, 0xfb250a1=
d,
> > +	0xf727e333, 0xc645de34, 0xfb2cc143, 0xe3370720, 0x00000120, 0xe721241=
b,
> > +	0xe424e222, 0xe526e426, 0xf023ee22, 0xf820f222, 0x0023fa25, 0x121c0a1=
e,
> > +	0x291d191a, 0x48024b00, 0x230e4d08, 0x23111f12, 0x2d111e15, 0x2d122a1=
4,
> > +	0x36101a1b, 0x38104207, 0x430a490b, 0x70e974f6, 0x3df947f1, 0x42fb350=
0,
> > +	0x50f74df5, 0x57f654f7, 0x65eb7fde, 0x35fb27fd, 0x4bf53df9, 0x5bef4df=
1,
> > +	0x6fe76be7, 0x4cf57ae4, 0x34f62cf6, 0x3af739f6, 0x45f948f0, 0x4afb45f=
c,
> > +	0x420256f7, 0x200122f7, 0x34051f0b, 0x43fe37fe, 0x59f84900, 0x0407340=
3,
> > +	0x0811080a, 0x25031310, 0x49fb3dff, 0x4efc46ff, 0x7eeb0000, 0x6eec7ce=
9,
> > +	0x7ce77ee6, 0x79e569ef, 0x66ef75e5, 0x74e575e6, 0x5ff67adf, 0x5ff864f=
2,
> > +	0x72e46fef, 0x50fe59fa, 0x55f752fc, 0x48ff51f8, 0x43014005, 0x4500380=
9,
> > +	0x45074501, 0x43fa45f9, 0x40fe4df0, 0x43fa3d02, 0x390240fd, 0x42fd41f=
d,
> > +	0x33093e00, 0x47fe42ff, 0x46ff4bfe, 0x3c0e48f7, 0x2f002510, 0x250b231=
2,
> > +	0x290a290c, 0x290c3002, 0x3b00290d, 0x28133203, 0x32124203, 0xfa12fa1=
3,
> > +	0xf41a000e, 0xe721f01f, 0xe425ea21, 0xe22ae227, 0xdc2dd62f, 0xef29de3=
1,
> > +	0xb9450920, 0xc042c13f, 0xd936b64d, 0xf629dd34, 0xff280024, 0x1a1c0e1=
e,
> > +	0x370c2517, 0xdf25410b, 0xdb28dc27, 0xdf2ee226, 0xe828e22a, 0xf426e33=
1,
> > +	0xfd26f628, 0x141ffb2e, 0x2c191e1d, 0x310b300c, 0x16162d1a, 0x151b161=
7,
> > +	0x1c1a1421, 0x221b181e, 0x27192a12, 0x460c3212, 0x470e3615, 0x2019530=
b,
> > +	0x36153115, 0x51fa55fb, 0x51f94df6, 0x49ee50ef, 0x53f64afc, 0x43f747f=
7,
> > +	0x42f83dff, 0x3b0042f2, 0xf6113b02, 0xf72af320, 0x0035fb31, 0x0a44034=
0,
> > +	0x392f1b42, 0x180047fb, 0x2afe24ff, 0x39f734fe, 0x41fc3ffa, 0x52f943f=
c,
> > +	0x4cfd51fd, 0x4efa48f9, 0x44f248f4, 0x4cfa46fd, 0x3efb42fb, 0x3dfc390=
0,
> > +	0x36013cf7, 0xf6113a02, 0xf72af320, 0x0035fb31, 0x0a440340, 0x392f1b4=
2,
> > +	0x00000000, 0x00000000, 0x3602f114, 0xf1144a03, 0x4a033602, 0x68e97fe=
4,
> > +	0x36ff35fa, 0x101d3307, 0x000e0019, 0x3efd33f6, 0x101a63e5, 0x66e855f=
c,
> > +	0x39063905, 0x390e49ef, 0x0a142814, 0x0036001d, 0x610c2a25, 0x75ea7fe=
0,
> > +	0x55fc4afe, 0x390566e8, 0x58f25dfa, 0x37042cfa, 0x67f159f5, 0x391374e=
b,
> > +	0x54043a14, 0x3f016006, 0x6af355fb, 0x4b063f05, 0x65ff5afd, 0x4ffc370=
3,
> > +	0x61f44bfe, 0x3c0132f9, 0x3f002900, 0x3f003f00, 0x560453f7, 0x48f9610=
0,
> > +	0x3e03290d, 0x58f72207, 0x7fdc7fec, 0x5ff25bef, 0x56e754e7, 0x5bef59f=
4,
> > +	0x4cf27fe1, 0x5af367ee, 0x500b7fdb, 0x54024c05, 0x37fa4e05, 0x53f23d0=
4,
> > +	0x4ffb7fdb, 0x5bf568f5, 0x41007fe2, 0x48004ffe, 0x38fa5cfc, 0x47f8440=
3,
> > +	0x56fc62f3, 0x52fb58f4, 0x43fc48fd, 0x59f048f8, 0x3bff45f7, 0x3904420=
5,
> > +	0x47fe47fc, 0x4aff3a02, 0x45ff2cfc, 0x33f93e00, 0x2afa2ffc, 0x35fa29f=
d,
> > +	0x4ef74c08, 0x340953f5, 0x5afb4300, 0x48f14301, 0x50f84bfb, 0x40eb53e=
b,
> > +	0x40e71ff3, 0x4b095ee3, 0x4af83f11, 0x1bfe23fb, 0x41035b0d, 0x4d0845f=
9,
> > +	0x3e0342f6, 0x51ec44fd, 0x07011e00, 0x4aeb17fd, 0x7ce94210, 0xee2c251=
1,
> > +	0x7feade32, 0x2a002704, 0x1d0b2207, 0x25061f08, 0x28032a07, 0x2b0d210=
8,
> > +	0x2f04240d, 0x3a023703, 0x2c083c06, 0x2a0e2c0b, 0x38043007, 0x250d340=
4,
> > +	0x3a133109, 0x2d0c300a, 0x21144500, 0xee233f08, 0xfd1ce721, 0x001b0a1=
8,
> > +	0xd434f222, 0x1113e827, 0x1d24191f, 0x0f222118, 0x4916141e, 0x1f13221=
4,
> > +	0x10132c1b, 0x240f240f, 0x15191c15, 0x0c1f141e, 0x2a18101b, 0x380e5d0=
0,
> > +	0x261a390f, 0x73e87fe8, 0x3ef752ea, 0x3b003500, 0x59f355f2, 0x5cf55ef=
3,
> > +	0x64eb7fe3, 0x43f439f2, 0x4df647f5, 0x58f055eb, 0x62f168e9, 0x52f67fd=
b,
> > +	0x3df830f8, 0x46f942f8, 0x4ff64bf2, 0x5cf453f7, 0x4ffc6cee, 0x4bf045e=
a,
> > +	0x3a013afe, 0x53f74ef3, 0x63f351fc, 0x26fa51f3, 0x3afa3ef3, 0x49f03bf=
e,
> > +	0x56f34cf6, 0x57f653f7, 0x7fea0000, 0x78e77fe7, 0x72ed7fe5, 0x76e775e=
9,
> > +	0x71e875e6, 0x78e176e4, 0x5ef67cdb, 0x63f666f1, 0x7fce6af3, 0x39115cf=
b,
> > +	0x5ef356fb, 0x4dfe5bf4, 0x49ff4700, 0x51f94004, 0x390f4005, 0x4400430=
1,
> > +	0x440143f6, 0x40024d00, 0x4efb4400, 0x3b053707, 0x360e4102, 0x3c052c0=
f,
> > +	0x4cfe4602, 0x460c56ee, 0x46f44005, 0x3805370b, 0x41024500, 0x36054af=
a,
> > +	0x4cfa3607, 0x4dfe52f5, 0x2a194dfe, 0xf710f311, 0xeb1bf411, 0xd829e22=
5,
> > +	0xd130d72a, 0xd82ee027, 0xd72ecd34, 0xed2bd934, 0xc93d0b20, 0xce3ed23=
8,
> > +	0xec2dbd51, 0x0f1cfe23, 0x01270122, 0x2614111e, 0x360f2d12, 0xf0244f0=
0,
> > +	0xef25f225, 0x0f220120, 0x19180f1d, 0x101f1622, 0x1c1f1223, 0x1c24292=
1,
> > +	0x3e152f1b, 0x1a131f12, 0x17181824, 0x1e18101b, 0x29161d1f, 0x3c102a1=
6,
> > +	0x3c0e340f, 0x7bf04e03, 0x38163515, 0x21153d19, 0x3d113213, 0x4af84ef=
d,
> > +	0x48f648f7, 0x47f44bee, 0x46fb3ff5, 0x48f24bef, 0x35f843f0, 0x34f73bf=
2,
> > +	0xfe0944f5, 0xfc1ff61e, 0x0721ff21, 0x17250c1f, 0x4014261f, 0x25f947f=
7,
> > +	0x31f52cf8, 0x3bf438f6, 0x43f73ff8, 0x4ff644fa, 0x4af84efd, 0x48f648f=
7,
> > +	0x47f44bee, 0x46fb3ff5, 0x48f24bef, 0x35f843f0, 0x34f73bf2, 0xfe0944f=
5,
> > +	0xfc1ff61e, 0x0721ff21, 0x17250c1f, 0x4014261f, 0x00000000, 0x0000000=
0,
> > +	0x3602f114, 0xf1144a03, 0x4a033602, 0x68e97fe4, 0x36ff35fa, 0x0000330=
7,
> > +	0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000000=
0,
> > +	0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000000=
0,
> > +	0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000000=
0,
> > +	0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000000=
0,
> > +	0x3f002900, 0x3f003f00, 0x560453f7, 0x48f96100, 0x3e03290d, 0x37010b0=
0,
> > +	0x7fef4500, 0x520066f3, 0x6beb4af9, 0x7fe17fe5, 0x5fee7fe8, 0x72eb7fe=
5,
> > +	0x7bef7fe2, 0x7af073f4, 0x3ff473f5, 0x54f144fe, 0x46fd68f3, 0x5af65df=
8,
> > +	0x4aff7fe2, 0x5bf961fa, 0x38fc7fec, 0x4cf952fb, 0x5df97dea, 0x4dfd57f=
5,
> > +	0x3ffc47fb, 0x54f444fc, 0x41f93ef9, 0x38053d08, 0x400142fe, 0x4efe3d0=
0,
> > +	0x34073201, 0x2c00230a, 0x2d01260b, 0x2c052e00, 0x3301111f, 0x131c320=
7,
> > +	0x3e0e2110, 0x64f16cf3, 0x5bf365f3, 0x58f65ef4, 0x56f654f0, 0x57f353f=
9,
> > +	0x46015eed, 0x4afb4800, 0x66f83b12, 0x5f0064f1, 0x48024bfc, 0x47fd4bf=
5,
> > +	0x45f32e0f, 0x41003e00, 0x48f12515, 0x36103909, 0x480c3e00, 0x090f001=
8,
> > +	0x120d1908, 0x130d090f, 0x120c250a, 0x21141d06, 0x2d041e0f, 0x3e003a0=
1,
> > +	0x260c3d07, 0x270f2d0b, 0x2c0d2a0b, 0x290c2d10, 0x221e310a, 0x370a2a1=
2,
> > +	0x2e113311, 0xed1a5900, 0xef1aef16, 0xec1ce71e, 0xe525e921, 0xe428e92=
1,
> > +	0xf521ef26, 0xfa29f128, 0x11290126, 0x031bfa1e, 0xf025161a, 0xf826fc2=
3,
> > +	0x0325fd26, 0x002a0526, 0x16271023, 0x251b300e, 0x440c3c15, 0x47fd610=
2,
> > +	0x32fb2afa, 0x3efe36fd, 0x3f013a00, 0x4aff48fe, 0x43fb5bf7, 0x27fd1bf=
b,
> > +	0x2e002cfe, 0x44f840f0, 0x4dfa4ef6, 0x5cf456f6, 0x3cf637f1, 0x41fc3ef=
a,
> > +	0x4cf849f4, 0x58f750f9, 0x61f56eef, 0x4ff554ec, 0x4afc49fa, 0x60f356f=
3,
> > +	0x75ed61f5, 0x21fb4ef8, 0x35fe30fc, 0x47f33efd, 0x56f44ff6, 0x61f25af=
3,
> > +	0x5dfa0000, 0x4ff854fa, 0x47ff4200, 0x3cfe3e00, 0x4bfb3bfe, 0x3afc3ef=
d,
> > +	0x4fff42f7, 0x44034700, 0x3ef92c0a, 0x280e240f, 0x1d0c1b10, 0x24142c0=
1,
> > +	0x2a052012, 0x3e0a3001, 0x40092e11, 0x61f568f4, 0x58f960f0, 0x55f955f=
8,
> > +	0x58f355f7, 0x4dfd4204, 0x4cfa4cfd, 0x4cff3a0a, 0x63f953ff, 0x5f025ff=
2,
> > +	0x4afb4c00, 0x4bf54600, 0x41004401, 0x3e0349f2, 0x44ff3e04, 0x370b4bf=
3,
> > +	0x460c4005, 0x1306060f, 0x0e0c1007, 0x0b0d0d12, 0x100f0f0d, 0x170d170=
c,
> > +	0x1a0e140f, 0x28112c0e, 0x11182f11, 0x16191515, 0x1d161b1f, 0x320e231=
3,
> > +	0x3f07390a, 0x52fc4dfe, 0x45095efd, 0xdd246df4, 0xe620de24, 0xe02ce22=
5,
> > +	0xf122ee22, 0xf921f128, 0x0021fb23, 0x0d210226, 0x3a0d2317, 0x001afd1=
d,
> > +	0xf91f1e16, 0xfd22f123, 0xff240322, 0x0b200522, 0x0c220523, 0x1d1e0b2=
7,
> > +	0x271d1a22, 0x151f4213, 0x32191f1f, 0x70ec78ef, 0x55f572ee, 0x59f25cf=
1,
> > +	0x51f147e6, 0x440050f2, 0x38e846f2, 0x32e844e9, 0xf3174af5, 0xf128f31=
a,
> > +	0x032cf231, 0x222c062d, 0x52133621, 0x17ff4bfd, 0x2b012201, 0x37fe360=
0,
> > +	0x40013d00, 0x5cf74400, 0x61f36af2, 0x5af45af1, 0x49f658ee, 0x56f24ff=
7,
> > +	0x46f649f6, 0x42fb45f6, 0x3afb40f7, 0xf6153b02, 0xf81cf518, 0x031dff1=
c,
> > +	0x1423091d, 0x430e241d, 0x00000000, 0x00000000
> > +};
> > +
> > +static void assemble_hw_pps(struct rkvdec2_ctx *ctx,
> > +			    struct rkvdec2_h264_run *run)
> > +{
> > +	struct rkvdec2_h264_ctx *h264_ctx =3D ctx->priv;
> > +	const struct v4l2_ctrl_h264_sps *sps =3D run->sps;
> > +	const struct v4l2_ctrl_h264_pps *pps =3D run->pps;
> > +	const struct v4l2_ctrl_h264_decode_params *dec_params =3D run->decode=
_params;
> > +	const struct v4l2_h264_dpb_entry *dpb =3D dec_params->dpb;
> > +	struct rkvdec2_h264_priv_tbl *priv_tbl =3D h264_ctx->priv_tbl.cpu;
> > +	struct rkvdec2_sps_pps *hw_ps;
> > +	dma_addr_t scaling_list_address;
> > +	u32 scaling_distance;
> > +	u32 i;
> > +
> > +	/*
> > +	 * HW read the SPS/PPS information from PPS packet index by PPS id.
> > +	 * offset from the base can be calculated by PPS_id * 32 (size per PP=
S
> > +	 * packet unit). so the driver copy SPS/PPS information to the exact =
PPS
> > +	 * packet unit for HW accessing.
> > +	 */
> > +	hw_ps =3D &priv_tbl->param_set[pps->pic_parameter_set_id];
> > +	memset(hw_ps, 0, sizeof(*hw_ps));
> > +
> > +	/* write sps */
> > +	hw_ps->sps.seq_parameter_set_id =3D 0xf;
> > +	hw_ps->sps.profile_idc =3D 0xff;
> > +	hw_ps->sps.constraint_set3_flag =3D 1;
> > +	hw_ps->sps.chroma_format_idc =3D sps->chroma_format_idc;
> > +	hw_ps->sps.bit_depth_luma =3D sps->bit_depth_luma_minus8;
> > +	hw_ps->sps.bit_depth_chroma =3D sps->bit_depth_chroma_minus8;
> > +	hw_ps->sps.qpprime_y_zero_transform_bypass_flag =3D 0;
> > +	hw_ps->sps.log2_max_frame_num_minus4 =3D sps->log2_max_frame_num_minu=
s4;
> > +	hw_ps->sps.max_num_ref_frames =3D sps->max_num_ref_frames;
> > +	hw_ps->sps.pic_order_cnt_type =3D sps->pic_order_cnt_type;
> > +	hw_ps->sps.log2_max_pic_order_cnt_lsb_minus4 =3D
> > +		sps->log2_max_pic_order_cnt_lsb_minus4;
> > +	hw_ps->sps.delta_pic_order_always_zero_flag =3D
> > +		!!(sps->flags & V4L2_H264_SPS_FLAG_DELTA_PIC_ORDER_ALWAYS_ZERO);
> > +	hw_ps->sps.mvc_extension_enable =3D 1;
> > +	hw_ps->sps.num_views =3D 1;
> > +
> > +	/*
> > +	 * Use the SPS values since they are already in macroblocks
> > +	 * dimensions, height can be field height (halved) if
> > +	 * V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY is not set and also it allows
> > +	 * decoding smaller images into larger allocation which can be used
> > +	 * to implementing SVC spatial layer support.
> > +	 */
> > +	hw_ps->sps.pic_width_in_mbs =3D sps->pic_width_in_mbs_minus1 + 1;
> > +	hw_ps->sps.pic_height_in_mbs =3D sps->pic_height_in_map_units_minus1 =
+ 1;
> > +	hw_ps->sps.frame_mbs_only_flag =3D
> > +		!!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY);
> > +	hw_ps->sps.mb_adaptive_frame_field_flag =3D
> > +		!!(sps->flags & V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD);
> > +	hw_ps->sps.direct_8x8_inference_flag =3D
> > +		!!(sps->flags & V4L2_H264_SPS_FLAG_DIRECT_8X8_INFERENCE);
> > +
> > +	/* write pps */
> > +	hw_ps->pps.pic_parameter_set_id =3D 0xff;
> > +	hw_ps->pps.pps_seq_parameter_set_id =3D 0x1f;
> > +	hw_ps->pps.entropy_coding_mode_flag =3D
> > +		!!(pps->flags & V4L2_H264_PPS_FLAG_ENTROPY_CODING_MODE);
> > +	hw_ps->pps.bottom_field_pic_order_in_frame_present_flag =3D
> > +		!!(pps->flags & V4L2_H264_PPS_FLAG_BOTTOM_FIELD_PIC_ORDER_IN_FRAME_P=
RESENT);
> > +	hw_ps->pps.num_ref_idx_l0_default_active_minus1 =3D
> > +		pps->num_ref_idx_l0_default_active_minus1;
> > +	hw_ps->pps.num_ref_idx_l1_default_active_minus1 =3D
> > +		pps->num_ref_idx_l1_default_active_minus1;
> > +	hw_ps->pps.weighted_pred_flag =3D
> > +		!!(pps->flags & V4L2_H264_PPS_FLAG_WEIGHTED_PRED);
> > +	hw_ps->pps.weighted_bipred_idc =3D pps->weighted_bipred_idc;
> > +	hw_ps->pps.pic_init_qp_minus26 =3D pps->pic_init_qp_minus26;
> > +	hw_ps->pps.pic_init_qs_minus26 =3D pps->pic_init_qs_minus26;
> > +	hw_ps->pps.chroma_qp_index_offset =3D pps->chroma_qp_index_offset;
> > +	hw_ps->pps.deblocking_filter_control_present_flag =3D
> > +		!!(pps->flags & V4L2_H264_PPS_FLAG_DEBLOCKING_FILTER_CONTROL_PRESENT=
);
> > +	hw_ps->pps.constrained_intra_pred_flag =3D
> > +		!!(pps->flags & V4L2_H264_PPS_FLAG_CONSTRAINED_INTRA_PRED);
> > +	hw_ps->pps.redundant_pic_cnt_present =3D
> > +		!!(pps->flags & V4L2_H264_PPS_FLAG_REDUNDANT_PIC_CNT_PRESENT);
> > +	hw_ps->pps.transform_8x8_mode_flag =3D
> > +		!!(pps->flags & V4L2_H264_PPS_FLAG_TRANSFORM_8X8_MODE);
> > +	hw_ps->pps.second_chroma_qp_index_offset =3D pps->second_chroma_qp_in=
dex_offset;
> > +	hw_ps->pps.scaling_list_enable_flag =3D
> > +		!!(pps->flags & V4L2_H264_PPS_FLAG_SCALING_MATRIX_PRESENT);
> > +
> > +	/*
> > +	 * To be on the safe side, program the scaling matrix address
> > +	 *
> > +	 * With this set here,
> > +	 *  RKVDEC_SWREG12_SENCODARY_EN:sw_scanlist_addr_valid_en
> > +	 * can stay at 0
> > +	 */
> > +	scaling_distance =3D offsetof(struct rkvdec2_h264_priv_tbl, scaling_l=
ist);
> > +	scaling_list_address =3D h264_ctx->priv_tbl.dma + scaling_distance;
> > +	hw_ps->pps.scaling_list_address =3D scaling_list_address;
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(dec_params->dpb); i++) {
> > +		if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)
> > +			hw_ps->pps.is_longterm |=3D (1 << i);
> > +	}
> > +}
> > +
> > +static void lookup_ref_buf_idx(struct rkvdec2_ctx *ctx,
> > +			       struct rkvdec2_h264_run *run)
> > +{
> > +	const struct v4l2_ctrl_h264_decode_params *dec_params =3D run->decode=
_params;
> > +	u32 i;
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(dec_params->dpb); i++) {
> > +		struct v4l2_m2m_ctx *m2m_ctx =3D ctx->fh.m2m_ctx;
> > +		const struct v4l2_h264_dpb_entry *dpb =3D run->decode_params->dpb;
> > +		struct vb2_queue *cap_q =3D &m2m_ctx->cap_q_ctx.q;
> > +		struct vb2_buffer *buf =3D NULL;
> > +
> > +		if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE) {
> > +			buf =3D vb2_find_buffer(cap_q, dpb[i].reference_ts);
> > +			if (!buf) {
> > +				dev_dbg(ctx->dev->dev, "No buffer for reference_ts %llu",
> > +					dpb[i].reference_ts);
> > +			}
> > +		}
> > +
> > +		run->ref_buf[i] =3D buf;
> > +	}
> > +}
> > +
> > +static void set_dpb_info(struct rkvdec2_rps_entry *entries,
> > +			 u8 reflist,
> > +			 u8 refnum,
> > +			 u8 info,
> > +			 bool bottom)
> > +{
> > +	struct rkvdec2_rps_entry *entry =3D &entries[(reflist * 4) + refnum /=
 8];
> > +	u8 idx =3D refnum % 8;
> > +
> > +	switch (idx) {
> > +	case 0:
> > +		entry->dpb_info0 =3D info;
> > +		entry->bottom_flag0 =3D bottom;
> > +		break;
> > +	case 1:
> > +		entry->dpb_info1 =3D info;
> > +		entry->bottom_flag1 =3D bottom;
> > +		break;
> > +	case 2:
> > +		entry->dpb_info2 =3D info;
> > +		entry->bottom_flag2 =3D bottom;
> > +		break;
> > +	case 3:
> > +		entry->dpb_info3 =3D info;
> > +		entry->bottom_flag3 =3D bottom;
> > +		break;
> > +	case 4:
> > +		entry->dpb_info4 =3D info;
> > +		entry->bottom_flag4 =3D bottom;
> > +		break;
> > +	case 5:
> > +		entry->dpb_info5 =3D info;
> > +		entry->bottom_flag5 =3D bottom;
> > +		break;
> > +	case 6:
> > +		entry->dpb_info6 =3D info;
> > +		entry->bottom_flag6 =3D bottom;
> > +		break;
> > +	case 7:
> > +		entry->dpb_info7 =3D info;
> > +		entry->bottom_flag7 =3D bottom;
> > +		break;
> > +	}
> > +}
> > +
> > +static void assemble_hw_rps(struct rkvdec2_ctx *ctx,
> > +			    struct v4l2_h264_reflist_builder *builder,
> > +			    struct rkvdec2_h264_run *run)
> > +{
> > +	const struct v4l2_ctrl_h264_decode_params *dec_params =3D run->decode=
_params;
> > +	const struct v4l2_h264_dpb_entry *dpb =3D dec_params->dpb;
> > +	struct rkvdec2_h264_ctx *h264_ctx =3D ctx->priv;
> > +	struct rkvdec2_h264_priv_tbl *priv_tbl =3D h264_ctx->priv_tbl.cpu;
> > +
> > +	struct rkvdec2_rps *hw_rps =3D &priv_tbl->rps;
> > +	u32 i, j;
> > +
> > +	memset(hw_rps, 0, sizeof(priv_tbl->rps));
> > +
> > +	/*
> > +	 * Assign an invalid pic_num if DPB entry at that position is inactiv=
e.
> > +	 * If we assign 0 in that position hardware will treat that as a real
> > +	 * reference picture with pic_num 0, triggering output picture
> > +	 * corruption.
> > +	 */
> > +	for (i =3D 0; i < ARRAY_SIZE(dec_params->dpb); i++) {
> > +		if (!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE))
> > +			continue;
> > +
> > +		hw_rps->frame_num[i] =3D builder->refs[i].frame_num;
> > +	}
> > +
> > +	for (j =3D 0; j < RKVDEC_NUM_REFLIST; j++) {
> > +		for (i =3D 0; i < builder->num_valid; i++) {
> > +			struct v4l2_h264_reference *ref;
> > +			bool dpb_valid;
> > +			bool bottom;
> > +
> > +			switch (j) {
> > +			case 0:
> > +				ref =3D &h264_ctx->reflists.p[i];
> > +				break;
> > +			case 1:
> > +				ref =3D &h264_ctx->reflists.b0[i];
> > +				break;
> > +			case 2:
> > +				ref =3D &h264_ctx->reflists.b1[i];
> > +				break;
> > +			}
> > +
> > +			if (WARN_ON(ref->index >=3D ARRAY_SIZE(dec_params->dpb)))
> > +				continue;
> > +
> > +			dpb_valid =3D !!(run->ref_buf[ref->index]);
> > +			bottom =3D ref->fields =3D=3D V4L2_H264_BOTTOM_FIELD_REF;
> > +
> > +			set_dpb_info(hw_rps->entries, j, i, ref->index | (dpb_valid << 4), =
bottom);
> > +		}
> > +	}
> > +}
> > +
> > +static void assemble_hw_scaling_list(struct rkvdec2_ctx *ctx,
> > +				     struct rkvdec2_h264_run *run)
> > +{
> > +	const struct v4l2_ctrl_h264_scaling_matrix *scaling =3D run->scaling_=
matrix;
> > +	const struct v4l2_ctrl_h264_pps *pps =3D run->pps;
> > +	struct rkvdec2_h264_ctx *h264_ctx =3D ctx->priv;
> > +	struct rkvdec2_h264_priv_tbl *tbl =3D h264_ctx->priv_tbl.cpu;
> > +
> > +	if (!(pps->flags & V4L2_H264_PPS_FLAG_SCALING_MATRIX_PRESENT))
> > +		return;
> > +
> > +	BUILD_BUG_ON(sizeof(tbl->scaling_list.scaling_list_4x4) !=3D
> > +		     sizeof(scaling->scaling_list_4x4));
> > +	BUILD_BUG_ON(sizeof(tbl->scaling_list.scaling_list_8x8) !=3D
> > +		     sizeof(scaling->scaling_list_8x8));
> > +
> > +	memcpy(tbl->scaling_list.scaling_list_4x4,
> > +	       scaling->scaling_list_4x4,
> > +	       sizeof(scaling->scaling_list_4x4));
> > +
> > +	memcpy(tbl->scaling_list.scaling_list_8x8,
> > +	       scaling->scaling_list_8x8,
> > +	       sizeof(scaling->scaling_list_8x8));
> > +}
> > +
> > +static void rkvdec2_write_regs(struct rkvdec2_ctx *ctx)
> > +{
> > +	struct rkvdec2_dev *rkvdec =3D ctx->dev;
> > +	struct rkvdec2_h264_ctx *h264_ctx =3D ctx->priv;
> > +
> > +	__iowrite32_copy_full(rkvdec->regs + OFFSET_COMMON_REGS,
> > +			      &h264_ctx->regs.common,
> > +			      sizeof(h264_ctx->regs.common));
> > +	__iowrite32_copy_full(rkvdec->regs + OFFSET_CODEC_PARAMS_REGS,
> > +			      &h264_ctx->regs.h264_param,
> > +			      sizeof(h264_ctx->regs.h264_param));
> > +	__iowrite32_copy_full(rkvdec->regs + OFFSET_COMMON_ADDR_REGS,
> > +			      &h264_ctx->regs.common_addr,
> > +			      sizeof(h264_ctx->regs.common_addr));
> > +	__iowrite32_copy_full(rkvdec->regs + OFFSET_CODEC_ADDR_REGS,
> > +			      &h264_ctx->regs.h264_addr,
> > +			      sizeof(h264_ctx->regs.h264_addr));
> > +	__iowrite32_copy_full(rkvdec->regs + OFFSET_POC_HIGHBIT_REGS,
> > +			      &h264_ctx->regs.h264_highpoc,
> > +			      sizeof(h264_ctx->regs.h264_highpoc));
> > +}
> > +
> > +static void config_registers(struct rkvdec2_ctx *ctx,
> > +			     struct rkvdec2_h264_run *run)
> > +{
> > +	const struct v4l2_ctrl_h264_decode_params *dec_params =3D run->decode=
_params;
> > +	const struct v4l2_ctrl_h264_sps *sps =3D run->sps;
> > +	const struct v4l2_h264_dpb_entry *dpb =3D dec_params->dpb;
> > +	struct rkvdec2_h264_ctx *h264_ctx =3D ctx->priv;
> > +	dma_addr_t priv_start_addr =3D h264_ctx->priv_tbl.dma;
> > +	const struct v4l2_pix_format_mplane *dst_fmt;
> > +	struct vb2_v4l2_buffer *src_buf =3D run->base.bufs.src;
> > +	struct vb2_v4l2_buffer *dst_buf =3D run->base.bufs.dst;
> > +	struct rkvdec2_regs_h264 *regs =3D &h264_ctx->regs;
> > +	const struct v4l2_format *f;
> > +	dma_addr_t rlc_addr;
> > +	dma_addr_t dst_addr;
> > +	u32 hor_virstride =3D 0;
> > +	u32 ver_virstride =3D 0;
> > +	u32 y_virstride =3D 0;
> > +	u32 yuv_virstride =3D 0;
> > +	u32 offset;
> > +	u32 pixels;
> > +	u32 i;
> > +
> > +	memset(regs, 0, sizeof(*regs));
> > +
> > +	/* Set H264 mode */
> > +	regs->common.reg009.dec_mode =3D RKVDEC2_MODE_H264;
> > +
> > +	/* Set config */
> > +	regs->common.reg011.buf_empty_en =3D 1;
> > +	regs->common.reg011.dec_clkgate_e =3D 1;
> > +	regs->common.reg011.dec_timeout_e =3D 1;
> > +	regs->common.reg011.pix_range_detection_e =3D 1;
> > +
> > +	/* Set IDR flag */
> > +	regs->common.reg013.cur_pic_is_idr =3D
> > +		!!(dec_params->flags & V4L2_H264_DECODE_PARAM_FLAG_IDR_PIC);
> > +
> > +	/* Set input stream length */
> > +	regs->common.reg016_str_len =3D vb2_get_plane_payload(&src_buf->vb2_b=
uf, 0);
> > +
> > +	/* Set max slice number */
> > +	regs->common.reg017.slice_num =3D MAX_SLICE_NUMBER;
> > +
> > +	/* Set strides */
> > +	f =3D &ctx->decoded_fmt;
> > +	dst_fmt =3D &f->fmt.pix_mp;
> > +	hor_virstride =3D (sps->bit_depth_luma_minus8 + 8) * dst_fmt->width /=
 8;
> > +	ver_virstride =3D round_up(dst_fmt->height, 16);
> > +	y_virstride =3D hor_virstride * ver_virstride;
> > +	pixels =3D dst_fmt->height * dst_fmt->width;
> > +
> > +	if (sps->chroma_format_idc =3D=3D 0)
> > +		yuv_virstride =3D y_virstride;
> > +	else if (sps->chroma_format_idc =3D=3D 1)
> > +		yuv_virstride +=3D y_virstride + y_virstride / 2;
> > +	else if (sps->chroma_format_idc =3D=3D 2)
> > +		yuv_virstride +=3D 2 * y_virstride;
> > +
> > +	regs->common.reg018.y_hor_virstride =3D hor_virstride / 16;
> > +	regs->common.reg019.uv_hor_virstride =3D hor_virstride / 16;
> > +	regs->common.reg020_y_virstride.y_virstride =3D y_virstride / 16;
> > +
> > +	/* Activate block gating */
> > +	regs->common.reg026.swreg_block_gating_e =3D 0xfffef;
> > +	regs->common.reg026.reg_cfg_gating_en =3D 1;
> > +
> > +	/* Set timeout threshold */
> > +	if (pixels < RKVDEC2_1080P_PIXELS)
> > +		regs->common.reg032_timeout_threshold =3D RKVDEC2_TIMEOUT_1080p;
> > +	else if (pixels < RKVDEC2_4K_PIXELS)
> > +		regs->common.reg032_timeout_threshold =3D RKVDEC2_TIMEOUT_4K;
> > +	else if (pixels < RKVDEC2_8K_PIXELS)
> > +		regs->common.reg032_timeout_threshold =3D RKVDEC2_TIMEOUT_8K;
> > +
> > +	/* Set TOP and BOTTOM POCs */
> > +	regs->h264_param.cur_top_poc =3D dec_params->top_field_order_cnt;
> > +	regs->h264_param.cur_bot_poc =3D dec_params->bottom_field_order_cnt;
> > +
> > +	/* Set ref pic address & poc */
> > +	for (i =3D 0; i < ARRAY_SIZE(dec_params->dpb); i++) {
> > +		struct vb2_buffer *vb_buf =3D run->ref_buf[i];
> > +		dma_addr_t buf_dma;
> > +
> > +		/*
> > +		 * If a DPB entry is unused or invalid, address of current destinati=
on
> > +		 * buffer is returned.
> > +		 */
> > +		if (!vb_buf)
> > +			vb_buf =3D &dst_buf->vb2_buf;
> > +
> > +		buf_dma =3D vb2_dma_contig_plane_dma_addr(vb_buf, 0);
> > +
> > +		/* Set reference addresses */
> > +		regs->h264_addr.ref_base[i] =3D buf_dma;
> > +
> > +		/* Set COLMV addresses */
> > +		regs->h264_addr.colmv_base[i] =3D buf_dma + ctx->colmv_offset;
> > +
> > +		struct rkvdec2_h264_ref_info *ref_info =3D
> > +			&regs->h264_param.reg99_102_ref_info[i / 4].ref_info[i % 4];
> > +
> > +		ref_info->ref_field =3D
> > +			!!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_FIELD);
> > +		ref_info->ref_colmv_use_flag =3D
> > +			!!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE);
> > +		ref_info->ref_topfield_used =3D
> > +			!!(dpb[i].fields & V4L2_H264_TOP_FIELD_REF);
> > +		ref_info->ref_botfield_used =3D
> > +			!!(dpb[i].fields & V4L2_H264_BOTTOM_FIELD_REF);
> > +
> > +		regs->h264_param.reg67_98_ref_poc[i * 2] =3D
> > +			dpb[i].top_field_order_cnt;
> > +		regs->h264_param.reg67_98_ref_poc[i * 2 + 1] =3D
> > +			dpb[i].bottom_field_order_cnt;
> > +	}
> > +
> > +	/* Set rlc base address (input stream) */
> > +	rlc_addr =3D vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
> > +	regs->common_addr.reg128_rlc_base =3D rlc_addr;
> > +	regs->common_addr.reg129_rlcwrite_base =3D rlc_addr;
> > +
> > +	/* Set output base address */
> > +	dst_addr =3D vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
> > +	regs->common_addr.reg130_decout_base =3D dst_addr;
> > +
> > +	/* Set colmv address */
> > +	regs->common_addr.reg131_colmv_cur_base =3D dst_addr + ctx->colmv_off=
set;
> > +
> > +	/* Set RCB addresses */
> > +	for (i =3D 0; i < RKVDEC2_RCB_COUNT; i++)
> > +		regs->common_addr.reg133_142_rcb_base[i] =3D ctx->rcb_bufs[i].dma;
> > +
> > +	/* Set hw pps address */
> > +	offset =3D offsetof(struct rkvdec2_h264_priv_tbl, param_set);
> > +	regs->h264_addr.pps_base =3D priv_start_addr + offset;
> > +
> > +	/* Set hw rps address */
> > +	offset =3D offsetof(struct rkvdec2_h264_priv_tbl, rps);
> > +	regs->h264_addr.rps_base =3D priv_start_addr + offset;
> > +
> > +	/* Set cabac table */
> > +	offset =3D offsetof(struct rkvdec2_h264_priv_tbl, cabac_table);
> > +	regs->h264_addr.cabactbl_base =3D priv_start_addr + offset;
> > +
> > +	rkvdec2_write_regs(ctx);
> > +}
> > +
> > +#define RKVDEC_H264_MAX_DEPTH_IN_BYTES		2
> > +
> > +static int rkvdec2_h264_adjust_fmt(struct rkvdec2_ctx *ctx,
> > +				   struct v4l2_format *f)
> > +{
> > +	struct v4l2_pix_format_mplane *fmt =3D &f->fmt.pix_mp;
> > +
> > +	fmt->num_planes =3D 1;
> > +	if (!fmt->plane_fmt[0].sizeimage)
> > +		fmt->plane_fmt[0].sizeimage =3D fmt->width * fmt->height *
> > +					      RKVDEC_H264_MAX_DEPTH_IN_BYTES;
> > +	return 0;
> > +}
> > +
> > +static int rkvdec2_h264_validate_sps(struct rkvdec2_ctx *ctx,
> > +				     const struct v4l2_ctrl_h264_sps *sps)
> > +{
> > +	unsigned int width, height;
> > +
> > +	/* FIXME: TBC
> > +	 * TODO: The hardware supports 10-bit and 4:2:2 profiles,
> > +	 * but it's currently broken in the driver.
> > +	 * Reject them for now, until it's fixed.
> > +	 */
> > +	if (sps->chroma_format_idc > 1)
> > +		/* Only 4:0:0 and 4:2:0 are supported */
> > +		return -EINVAL;
> > +	if (sps->bit_depth_luma_minus8 !=3D sps->bit_depth_chroma_minus8)
> > +		/* Luma and chroma bit depth mismatch */
> > +		return -EINVAL;
> > +	if (sps->bit_depth_luma_minus8 !=3D 0)
> > +		/* Only 8-bit is supported */
> > +		return -EINVAL;
> > +
> > +	width =3D (sps->pic_width_in_mbs_minus1 + 1) * 16;
> > +	height =3D (sps->pic_height_in_map_units_minus1 + 1) * 16;
> > +
> > +	/*
> > +	 * When frame_mbs_only_flag is not set, this is field height,
> > +	 * which is half the final height (see (7-18) in the
> > +	 * specification)
> > +	 */
> > +	if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY))
> > +		height *=3D 2;
> > +
> > +	if (width > ctx->coded_fmt.fmt.pix_mp.width ||
> > +	    height > ctx->coded_fmt.fmt.pix_mp.height)
> > +		return -EINVAL;
> > +
> > +	return 0;
> > +}
> > +
> > +static int rkvdec2_h264_start(struct rkvdec2_ctx *ctx)
> > +{
> > +	struct rkvdec2_dev *rkvdec =3D ctx->dev;
> > +	struct rkvdec2_h264_priv_tbl *priv_tbl;
> > +	struct rkvdec2_h264_ctx *h264_ctx;
> > +	struct v4l2_ctrl *ctrl;
> > +	int ret;
> > +
> > +	ctrl =3D v4l2_ctrl_find(&ctx->ctrl_hdl,
> > +			      V4L2_CID_STATELESS_H264_SPS);
> > +	if (!ctrl)
> > +		return -EINVAL;
> > +
> > +	ret =3D rkvdec2_h264_validate_sps(ctx, ctrl->p_new.p_h264_sps);
> > +	if (ret)
> > +		return ret;
> > +
> > +	h264_ctx =3D kzalloc(sizeof(*h264_ctx), GFP_KERNEL);
> > +	if (!h264_ctx)
> > +		return -ENOMEM;
> > +
> > +	priv_tbl =3D dma_alloc_coherent(rkvdec->dev, sizeof(*priv_tbl),
> > +				      &h264_ctx->priv_tbl.dma, GFP_KERNEL);
> > +	if (!priv_tbl) {
> > +		ret =3D -ENOMEM;
> > +		goto err_free_ctx;
> > +	}
> > +
> > +	h264_ctx->priv_tbl.size =3D sizeof(*priv_tbl);
> > +	h264_ctx->priv_tbl.cpu =3D priv_tbl;
> > +	memcpy(priv_tbl->cabac_table, rkvdec2_h264_cabac_table,
> > +	       sizeof(rkvdec2_h264_cabac_table));
> > +
> > +	ctx->priv =3D h264_ctx;
> > +	return 0;
> > +
> > +err_free_ctx:
> > +	kfree(h264_ctx);
> > +	return ret;
> > +}
> > +
> > +static void rkvdec2_h264_stop(struct rkvdec2_ctx *ctx)
> > +{
> > +	struct rkvdec2_h264_ctx *h264_ctx =3D ctx->priv;
> > +	struct rkvdec2_dev *rkvdec =3D ctx->dev;
> > +
> > +	dma_free_coherent(rkvdec->dev, h264_ctx->priv_tbl.size,
> > +			  h264_ctx->priv_tbl.cpu, h264_ctx->priv_tbl.dma);
> > +	kfree(h264_ctx);
> > +}
> > +
> > +static void rkvdec2_h264_run_preamble(struct rkvdec2_ctx *ctx,
> > +				      struct rkvdec2_h264_run *run)
> > +{
> > +	struct v4l2_ctrl *ctrl;
> > +
> > +	ctrl =3D v4l2_ctrl_find(&ctx->ctrl_hdl,
> > +			      V4L2_CID_STATELESS_H264_DECODE_PARAMS);
> > +	run->decode_params =3D ctrl ? ctrl->p_cur.p : NULL;
> > +	ctrl =3D v4l2_ctrl_find(&ctx->ctrl_hdl,
> > +			      V4L2_CID_STATELESS_H264_SPS);
> > +	run->sps =3D ctrl ? ctrl->p_cur.p : NULL;
> > +	ctrl =3D v4l2_ctrl_find(&ctx->ctrl_hdl,
> > +			      V4L2_CID_STATELESS_H264_PPS);
> > +	run->pps =3D ctrl ? ctrl->p_cur.p : NULL;
> > +	ctrl =3D v4l2_ctrl_find(&ctx->ctrl_hdl,
> > +			      V4L2_CID_STATELESS_H264_SCALING_MATRIX);
> > +	run->scaling_matrix =3D ctrl ? ctrl->p_cur.p : NULL;
> > +
> > +	rkvdec2_run_preamble(ctx, &run->base);
> > +}
> > +
> > +static int rkvdec2_h264_run(struct rkvdec2_ctx *ctx)
> > +{
> > +	struct v4l2_h264_reflist_builder reflist_builder;
> > +	struct rkvdec2_dev *rkvdec =3D ctx->dev;
> > +	struct rkvdec2_h264_ctx *h264_ctx =3D ctx->priv;
> > +	struct rkvdec2_h264_run run;
> > +
> > +	rkvdec2_h264_run_preamble(ctx, &run);
> > +
> > +	/* Build the P/B{0,1} ref lists. */
> > +	v4l2_h264_init_reflist_builder(&reflist_builder, run.decode_params,
> > +				       run.sps, run.decode_params->dpb);
> > +	v4l2_h264_build_p_ref_list(&reflist_builder, h264_ctx->reflists.p);
> > +	v4l2_h264_build_b_ref_lists(&reflist_builder, h264_ctx->reflists.b0,
> > +				    h264_ctx->reflists.b1);
> > +
> > +	assemble_hw_scaling_list(ctx, &run);
> > +	assemble_hw_pps(ctx, &run);
> > +	lookup_ref_buf_idx(ctx, &run);
> > +	assemble_hw_rps(ctx, &reflist_builder, &run);
> > +
> > +	config_registers(ctx, &run);
> > +
> > +	rkvdec2_run_postamble(ctx, &run.base);
> > +
> > +	schedule_delayed_work(&rkvdec->watchdog_work, msecs_to_jiffies(2000))=
;
> > +
> > +	/* Start decoding! */
> > +	writel(RKVDEC2_REG_DEC_E_BIT, rkvdec->regs + RKVDEC2_REG_DEC_E);
> > +
> > +	return 0;
> > +}
> > +
> > +static int rkvdec2_h264_try_ctrl(struct rkvdec2_ctx *ctx, struct v4l2_=
ctrl *ctrl)
> > +{
> > +	if (ctrl->id =3D=3D V4L2_CID_STATELESS_H264_SPS)
> > +		return rkvdec2_h264_validate_sps(ctx, ctrl->p_new.p_h264_sps);
> > +
> > +	return 0;
> > +}
> > +
> > +const struct rkvdec2_coded_fmt_ops rkvdec2_h264_fmt_ops =3D {
> > +	.adjust_fmt =3D rkvdec2_h264_adjust_fmt,
> > +	.start =3D rkvdec2_h264_start,
> > +	.stop =3D rkvdec2_h264_stop,
> > +	.run =3D rkvdec2_h264_run,
> > +	.try_ctrl =3D rkvdec2_h264_try_ctrl,
> > +};
> > diff --git a/drivers/staging/media/rkvdec2/rkvdec2-regs.h b/drivers/sta=
ging/media/rkvdec2/rkvdec2-regs.h
> > new file mode 100644
> > index 000000000000..a214597cdcdc
> > --- /dev/null
> > +++ b/drivers/staging/media/rkvdec2/rkvdec2-regs.h
> > @@ -0,0 +1,372 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Rockchip Video Decoder 2 driver registers description
> > + *
> > + * Copyright (C) 2024 Collabora, Ltd.
> > + *  Detlev Casanova <detlev.casanova@collabora.com>
> > + */
> > +
> > +#ifndef _RKVDEC_REGS_H_
> > +#define _RKVDEC_REGS_H_
> > +
> > +#define OFFSET_COMMON_REGS		(8 * sizeof(u32))
> > +#define OFFSET_CODEC_PARAMS_REGS	(64 * sizeof(u32))
> > +#define OFFSET_COMMON_ADDR_REGS		(128 * sizeof(u32))
> > +#define OFFSET_CODEC_ADDR_REGS		(160 * sizeof(u32))
> > +#define OFFSET_POC_HIGHBIT_REGS		(200 * sizeof(u32))
> > +
> > +#define RKVDEC2_MODE_HEVC	0
> > +#define RKVDEC2_MODE_H264	1
> > +#define RKVDEC2_MODE_VP9	2
> > +#define RKVDEC2_MODE_AVS2	3
> > +
> > +#define MAX_SLICE_NUMBER	0x3fff
> > +
> > +#define RKVDEC2_1080P_PIXELS		(1920 * 1080)
> > +#define RKVDEC2_4K_PIXELS		(4096 * 2304)
> > +#define RKVDEC2_8K_PIXELS		(7680 * 4320)
> > +#define RKVDEC2_TIMEOUT_1080p		(0xefffff)
> > +#define RKVDEC2_TIMEOUT_4K		(0x2cfffff)
> > +#define RKVDEC2_TIMEOUT_8K		(0x4ffffff)
> > +
> > +#define RKVDEC2_REG_DEC_E		0x028
> > +#define RKVDEC2_REG_DEC_E_BIT		1
> > +
> > +#define RKVDEC2_REG_IMPORTANT_EN	0x02c
> > +#define RKVDEC2_REG_DEC_IRQ_DISABLE	BIT(4)
> > +
> > +#define RKVDEC2_REG_STA_INT		0x380
> > +#define STA_INT_DEC_RDY_STA		BIT(2)
> > +
> > +/* base: OFFSET_COMMON_REGS */
> > +struct rkvdec2_regs_common {
> > +	struct rkvdec2_in_out {
> > +		u32 in_endian		: 1;
> > +		u32 in_swap32_e		: 1;
> > +		u32 in_swap64_e		: 1;
> > +		u32 str_endian		: 1;
> > +		u32 str_swap32_e	: 1;
> > +		u32 str_swap64_e	: 1;
> > +		u32 out_endian		: 1;
> > +		u32 out_swap32_e	: 1;
> > +		u32 out_cbcr_swap	: 1;
> > +		u32 out_swap64_e	: 1;
> > +		u32 reserved		: 22;
> > +	} reg008;
> > +
> > +	struct rkvdec2_dec_mode {
> > +		u32 dec_mode	: 10;
> > +		u32 reserved	: 22;
> > +	} reg009;
> > +
> > +	struct rkvdec2_dec_e {
> > +		u32 dec_e	: 1;
> > +		u32 reserved	: 31;
> > +	} reg010;
> > +
> > +	struct rkvdec2_important_en {
> > +		u32 reserved			: 1;
> > +		u32 dec_clkgate_e		: 1;
> > +		u32 dec_e_strmd_clkgate_dis	: 1;
> > +		u32 reserved0			: 1;
> > +
> > +		u32 dec_irq_dis			: 1;
> > +		u32 dec_timeout_e		: 1;
> > +		u32 buf_empty_en		: 1;
> > +		u32 reserved1			: 3;
> > +
> > +		u32 dec_e_rewrite_valid		: 1;
> > +		u32 reserved2			: 9;
> > +		u32 softrst_en_p		: 1;
> > +		u32 force_softreset_valid	: 1;
> > +		u32 reserved3			: 2;
> > +		u32 pix_range_detection_e	: 1;
> > +		u32 reserved4			: 7;
> > +	} reg011;
> > +
> > +	struct rkvdec2_sencodary_en {
> > +		u32 wr_ddr_align_en		: 1;
> > +		u32 colmv_compress_en		: 1;
> > +		u32 fbc_e			: 1;
> > +		u32 reserved0			: 1;
> > +
> > +		u32 buspr_slot_disable		: 1;
> > +		u32 error_info_en		: 1;
> > +		u32 info_collect_en		: 1;
> > +		u32 wait_reset_en		: 1;
> > +
> > +		u32 scanlist_addr_valid_en	: 1;
> > +		u32 scale_down_en		: 1;
> > +		u32 error_cfg_wr_disable	: 1;
> > +		u32 reserved1			: 21;
> > +	} reg012;
> > +
> > +	struct rkvdec2_en_mode_set {
> > +		u32 timeout_mode		: 1;
> > +		u32 req_timeout_rst_sel		: 1;
> > +		u32 reserved0			: 1;
> > +		u32 dec_commonirq_mode		: 1;
> > +		u32 reserved1			: 2;
> > +		u32 stmerror_waitdecfifo_empty	: 1;
> > +		u32 reserved2			: 2;
> > +		u32 h26x_streamd_error_mode	: 1;
> > +		u32 reserved3			: 2;
> > +		u32 allow_not_wr_unref_bframe	: 1;
> > +		u32 fbc_output_wr_disable	: 1;
> > +		u32 reserved4			: 1;
> > +		u32 colmv_error_mode		: 1;
> > +
> > +		u32 reserved5			: 2;
> > +		u32 h26x_error_mode		: 1;
> > +		u32 reserved6			: 2;
> > +		u32 ycacherd_prior		: 1;
> > +		u32 reserved7			: 2;
> > +		u32 cur_pic_is_idr		: 1;
> > +		u32 reserved8			: 1;
> > +		u32 right_auto_rst_disable	: 1;
> > +		u32 frame_end_err_rst_flag	: 1;
> > +		u32 rd_prior_mode		: 1;
> > +		u32 rd_ctrl_prior_mode		: 1;
> > +		u32 reserved9			: 1;
> > +		u32 filter_outbuf_mode		: 1;
> > +	} reg013;
> > +
> > +	struct rkvdec2_fbc_param_set {
> > +		u32 fbc_force_uncompress	: 1;
> > +
> > +		u32 reserved0			: 2;
> > +		u32 allow_16x8_cp_flag		: 1;
> > +		u32 reserved1			: 2;
> > +
> > +		u32 fbc_h264_exten_4or8_flag	: 1;
> > +		u32 reserved2			: 25;
> > +	} reg014;
> > +
> > +	struct rkvdec2_stream_param_set {
> > +		u32 rlc_mode_direct_write	: 1;
> > +		u32 rlc_mode			: 1;
> > +		u32 reserved0			: 3;
> > +
> > +		u32 strm_start_bit		: 7;
> > +		u32 reserved1			: 20;
> > +	} reg015;
> > +
> > +	u32  reg016_str_len;
> > +
> > +	struct rkvdec2_slice_number {
> > +		u32 slice_num	: 25;
> > +		u32 reserved	: 7;
> > +	} reg017;
> > +
> > +	struct rkvdec2_y_hor_stride {
> > +		u32 y_hor_virstride	: 16;
> > +		u32 reserved		: 16;
> > +	} reg018;
> > +
> > +	struct rkvdec2_uv_hor_stride {
> > +		u32 uv_hor_virstride	: 16;
> > +		u32 reserved		: 16;
> > +	} reg019;
> > +
> > +	union {
> > +		struct rkvdec2_y_stride {
> > +			u32 y_virstride		: 28;
> > +			u32 reserved		: 4;
> > +		} reg020_y_virstride;
> > +
> > +		struct rkvdec2_fbc_payload_offset {
> > +			u32 reserved		: 4;
> > +			u32 payload_st_offset	: 28;
> > +		} reg020_fbc_payload_off;
> > +	};
> > +
> > +	struct rkvdec2_error_ctrl_set {
> > +		u32 inter_error_prc_mode		: 1;
> > +		u32 error_intra_mode			: 1;
> > +		u32 error_deb_en			: 1;
> > +		u32 picidx_replace			: 5;
> > +		u32 error_spread_e			: 1;
> > +		u32 reserved0				: 3;
> > +		u32 error_inter_pred_cross_slice	: 1;
> > +		u32 reserved1				: 11;
> > +		u32 roi_error_ctu_cal_en		: 1;
> > +		u32 reserved2				: 7;
> > +	} reg021;
> > +
> > +	struct rkvdec2_err_roi_ctu_offset_start {
> > +		u32 roi_x_ctu_offset_st	: 12;
> > +		u32 reserved0		: 4;
> > +		u32 roi_y_ctu_offset_st	: 12;
> > +		u32 reserved1		: 4;
> > +	} reg022;
> > +
> > +	struct rkvdec2_err_roi_ctu_offset_end {
> > +		u32 roi_x_ctu_offset_end	: 12;
> > +		u32 reserved0			: 4;
> > +		u32 roi_y_ctu_offset_end	: 12;
> > +		u32 reserved1			: 4;
> > +	} reg023;
> > +
> > +	struct rkvdec2_cabac_error_en_lowbits {
> > +		u32 cabac_err_en_lowbits	: 32;
> > +	} reg024;
> > +
> > +	struct rkvdec2_cabac_error_en_highbits {
> > +		u32 cabac_err_en_highbits	: 30;
> > +		u32 reserved			: 2;
> > +	} reg025;
> > +
> > +	struct rkvdec2_block_gating_en {
> > +		u32 swreg_block_gating_e	: 20;
> > +		u32 reserved			: 11;
> > +		u32 reg_cfg_gating_en		: 1;
> > +	} reg026;
> > +
> > +	/* NOTE: reg027 ~ reg032 are added in vdpu38x at rk3588 */
> > +	struct SW027_CORE_SAFE_PIXELS {
> > +		// colmv and recon report coord x safe pixels
> > +		u32 core_safe_x_pixels	: 16;
> > +		// colmv and recon report coord y safe pixels
> > +		u32 core_safe_y_pixels	: 16;
> > +	} reg027;
> > +
> > +	struct rkvdec2_multiply_core_ctrl {
> > +		u32 swreg_vp9_wr_prob_idx	: 3;
> > +		u32 reserved0			: 1;
> > +		u32 swreg_vp9_rd_prob_idx	: 3;
> > +		u32 reserved1			: 1;
> > +
> > +		u32 swreg_ref_req_advance_flag	: 1;
> > +		u32 sw_colmv_req_advance_flag	: 1;
> > +		u32 sw_poc_only_highbit_flag	: 1;
> > +		u32 sw_poc_arb_flag		: 1;
> > +
> > +		u32 reserved2			: 4;
> > +		u32 sw_film_idx			: 10;
> > +		u32 reserved3			: 2;
> > +		u32 sw_pu_req_mismatch_dis	: 1;
> > +		u32 sw_colmv_req_mismatch_dis	: 1;
> > +		u32 reserved4			: 2;
> > +	} reg028;
> > +
> > +	struct SW029_SCALE_DOWN_CTRL {
> > +		u32 scale_down_hor_ratio	: 2;
> > +		u32 reserved0			: 6;
> > +		u32 scale_down_vrz_ratio	: 2;
> > +		u32 reserved1			: 22;
> > +	} reg029;
> > +
> > +	struct SW032_Y_SCALE_DOWN_TILE8x8_HOR_STRIDE {
> > +		u32 y_scale_down_hor_stride	: 20;
> > +		u32 reserved0			: 12;
> > +	} reg030;
> > +
> > +	struct SW031_UV_SCALE_DOWN_TILE8x8_HOR_STRIDE {
> > +		u32 uv_scale_down_hor_stride	: 20;
> > +		u32 reserved0			: 12;
> > +	} reg031;
> > +
> > +	u32  reg032_timeout_threshold;
> > +} __packed;
> > +
> > +/* base: OFFSET_COMMON_ADDR_REGS */
> > +struct rkvdec2_regs_common_addr {
> > +	u32 reg128_rlc_base;
> > +	u32 reg129_rlcwrite_base;
> > +	u32 reg130_decout_base;
> > +	u32 reg131_colmv_cur_base;
> > +	u32 reg132_error_ref_base;
> > +	u32 reg133_142_rcb_base[10];
> > +} __packed;
> > +
> > +/* base: OFFSET_CODEC_PARAMS_REGS */
> > +struct rkvdec2_regs_h264_params {
> > +	struct rkvdec2_h26x_set {
> > +		u32 h26x_frame_orslice		: 1;
> > +		u32 h26x_rps_mode		: 1;
> > +		u32 h26x_stream_mode		: 1;
> > +		u32 h26x_stream_lastpacket	: 1;
> > +		u32 h264_firstslice_flag	: 1;
> > +		u32 reserved			: 27;
> > +	} reg64;
> > +
> > +	u32  cur_top_poc;
> > +	u32  cur_bot_poc;
> > +	u32  reg67_98_ref_poc[32];
> > +
> > +	/* Regs 99 - 102 */
> > +	struct rkvdec2_h264_info {
> > +		struct rkvdec2_h264_ref_info {
> > +			u32 ref_field		: 1;
> > +			u32 ref_topfield_used	: 1;
> > +			u32 ref_botfield_used	: 1;
> > +			u32 ref_colmv_use_flag	: 1;
> > +			u32 ref_reserved	: 4;
> > +		} __packed ref_info[4];
> > +	} __packed reg99_102_ref_info[4];
> > +
> > +	u32  reserved_103_111[9];
> > +
> > +	struct rkvdec2_error_ref_info {
> > +		u32 avs2_ref_error_field	: 1;
> > +		u32 avs2_ref_error_topfield	: 1;
> > +		u32 ref_error_topfield_used	: 1;
> > +		u32 ref_error_botfield_used	: 1;
> > +		u32 reserved			: 28;
> > +	} reg112;
> > +} __packed;
> > +
> > +/* base: OFFSET_CODEC_ADDR_REGS */
> > +struct rkvdec2_regs_h264_addr {
> > +	/* SWREG160 */
> > +	u32  reg160_no_use;
> > +
> > +	/* SWREG161 */
> > +	u32  pps_base;
> > +
> > +	/* SWREG162 */
> > +	u32  reg162_no_use;
> > +
> > +	/* SWREG163 */
> > +	u32  rps_base;
> > +
> > +	/* SWREG164~179 */
> > +	u32  ref_base[16];
> > +
> > +	/* SWREG180 */
> > +	u32  scanlist_addr;
> > +
> > +	/* SWREG181~196 */
> > +	u32  colmv_base[16];
> > +
> > +	/* SWREG197 */
> > +	u32  cabactbl_base;
> > +} __packed;
> > +
> > +struct rkvdec2_regs_h264_highpoc {
> > +	/* SWREG200 */
> > +	struct rkvdec2_ref_poc_highbit {
> > +		u32 ref0_poc_highbit	: 4;
> > +		u32 ref1_poc_highbit	: 4;
> > +		u32 ref2_poc_highbit	: 4;
> > +		u32 ref3_poc_highbit	: 4;
> > +		u32 ref4_poc_highbit	: 4;
> > +		u32 ref5_poc_highbit	: 4;
> > +		u32 ref6_poc_highbit	: 4;
> > +		u32 ref7_poc_highbit	: 4;
> > +	} reg200[4];
> > +	struct rkvdec2_cur_poc_highbit {
> > +		u32 cur_poc_highbit	: 4;
> > +		u32 reserved		: 28;
> > +	} reg204;
> > +} __packed;
> > +
> > +struct rkvdec2_regs_h264 {
> > +	struct rkvdec2_regs_common		common;
> > +	struct rkvdec2_regs_h264_params		h264_param;
> > +	struct rkvdec2_regs_common_addr		common_addr;
> > +	struct rkvdec2_regs_h264_addr		h264_addr;
> > +	struct rkvdec2_regs_h264_highpoc	h264_highpoc;
> > +} __packed;
> > +
> > +#endif /* __RKVDEC_REGS_H__ */
> > diff --git a/drivers/staging/media/rkvdec2/rkvdec2.c b/drivers/staging/=
media/rkvdec2/rkvdec2.c
> > new file mode 100644
> > index 000000000000..db37fdbfc366
> > --- /dev/null
> > +++ b/drivers/staging/media/rkvdec2/rkvdec2.c
> > @@ -0,0 +1,1160 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Rockchip Video Decoder 2 driver
> > + *
> > + * Copyright (C) 2024 Collabora, Ltd.
> > + *  Detlev Casanova <detlev.casanova@collabora.com>
> > + *
> > + * Based on rkvdec driver by Boris Brezillon <boris.brezillon@collabor=
a.com>
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/pm.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/slab.h>
> > +#include <linux/videodev2.h>
> > +#include <linux/workqueue.h>
> > +#include <media/v4l2-event.h>
> > +#include <media/v4l2-mem2mem.h>
> > +#include <media/videobuf2-core.h>
> > +#include <media/videobuf2-vmalloc.h>
> > +
> > +#include "rkvdec2.h"
> > +
> > +static int rkvdec2_try_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +	struct rkvdec2_ctx *ctx =3D container_of(ctrl->handler, struct rkvdec=
2_ctx, ctrl_hdl);
> > +	const struct rkvdec2_coded_fmt_desc *desc =3D ctx->coded_fmt_desc;
> > +
> > +	if (desc->ops->try_ctrl)
> > +		return desc->ops->try_ctrl(ctx, ctrl);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct v4l2_ctrl_ops rkvdec2_ctrl_ops =3D {
> > +	.try_ctrl =3D rkvdec2_try_ctrl,
> > +};
> > +
> > +static const struct rkvdec2_ctrl_desc rkvdec2_h264_ctrl_descs[] =3D {
> > +	{
> > +		.cfg.id =3D V4L2_CID_STATELESS_H264_DECODE_PARAMS,
> > +	},
> > +	{
> > +		.cfg.id =3D V4L2_CID_STATELESS_H264_SPS,
> > +		.cfg.ops =3D &rkvdec2_ctrl_ops,
> > +	},
> > +	{
> > +		.cfg.id =3D V4L2_CID_STATELESS_H264_PPS,
> > +	},
> > +	{
> > +		.cfg.id =3D V4L2_CID_STATELESS_H264_SCALING_MATRIX,
> > +	},
> > +	{
> > +		.cfg.id =3D V4L2_CID_STATELESS_H264_DECODE_MODE,
> > +		.cfg.min =3D V4L2_STATELESS_H264_DECODE_MODE_FRAME_BASED,
> > +		.cfg.max =3D V4L2_STATELESS_H264_DECODE_MODE_FRAME_BASED,
> > +		.cfg.def =3D V4L2_STATELESS_H264_DECODE_MODE_FRAME_BASED,
> > +	},
> > +	{
> > +		.cfg.id =3D V4L2_CID_STATELESS_H264_START_CODE,
> > +		.cfg.min =3D V4L2_STATELESS_H264_START_CODE_ANNEX_B,
> > +		.cfg.def =3D V4L2_STATELESS_H264_START_CODE_ANNEX_B,
> > +		.cfg.max =3D V4L2_STATELESS_H264_START_CODE_ANNEX_B,
> > +	},
> > +	{
> > +		.cfg.id =3D V4L2_CID_MPEG_VIDEO_H264_PROFILE,
> > +		.cfg.min =3D V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
> > +		.cfg.max =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10,
> > +		.cfg.menu_skip_mask =3D
> > +			BIT(V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED),
> > +		.cfg.def =3D V4L2_MPEG_VIDEO_H264_PROFILE_MAIN,
> > +	},
> > +	{
> > +		.cfg.id =3D V4L2_CID_MPEG_VIDEO_H264_LEVEL,
> > +		.cfg.min =3D V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
> > +		.cfg.max =3D V4L2_MPEG_VIDEO_H264_LEVEL_6_0,
> > +	},
> > +};
> > +
> > +static const struct rkvdec2_ctrls rkvdec2_h264_ctrls =3D {
> > +	.ctrls =3D rkvdec2_h264_ctrl_descs,
> > +	.num_ctrls =3D ARRAY_SIZE(rkvdec2_h264_ctrl_descs),
> > +};
> > +
> > +static const u32 rkvdec2_h264_decoded_fmts[] =3D {
> > +	V4L2_PIX_FMT_NV12
> > +};
> > +
> > +static const struct rkvdec2_coded_fmt_desc rkvdec2_coded_fmts[] =3D {
> > +	{
> > +		.fourcc =3D V4L2_PIX_FMT_H264_SLICE,
> > +		.frmsize =3D {
> > +			.min_width =3D 16,
> > +			.max_width =3D  65520,
> > +			.step_width =3D 16,
> > +			.min_height =3D 16,
> > +			.max_height =3D  65520,
> > +			.step_height =3D 16,
> > +		},
> > +		.ctrls =3D &rkvdec2_h264_ctrls,
> > +		.ops =3D &rkvdec2_h264_fmt_ops,
> > +		.num_decoded_fmts =3D ARRAY_SIZE(rkvdec2_h264_decoded_fmts),
> > +		.decoded_fmts =3D rkvdec2_h264_decoded_fmts,
> > +		.subsystem_flags =3D VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
> > +	},
> > +};
> > +
> > +enum rcb_axis {
> > +	PIC_WIDTH =3D 0,
> > +	PIC_HEIGHT =3D 1
> > +};
> > +
> > +struct rcb_size_info {
> > +	u8 multiplier;
> > +	enum rcb_axis axis;
> > +};
> > +
> > +static struct rcb_size_info rcb_sizes[] =3D {
> > +	{6,	PIC_WIDTH},	// intrar
> > +	{1,	PIC_WIDTH},	// transdr (Is actually 0.4*pic_width)
> > +	{1,	PIC_HEIGHT},	// transdc (Is actually 0.1*pic_height)
> > +	{3,	PIC_WIDTH},	// streamdr
> > +	{6,	PIC_WIDTH},	// interr
> > +	{3,	PIC_HEIGHT},	// interc
> > +	{22,	PIC_WIDTH},	// dblkr
> > +	{6,	PIC_WIDTH},	// saor
> > +	{11,	PIC_WIDTH},	// fbcr
> > +	{67,	PIC_HEIGHT},	// filtc col
> > +};
> > +
> > +#define RCB_SIZE(n) (rcb_sizes[(n)].multiplier * (rcb_sizes[(n)].axis =
? height : width))
> > +
> > +static const struct rkvdec2_coded_fmt_desc *
> > +rkvdec2_find_coded_fmt_desc(u32 fourcc)
> > +{
> > +	unsigned int i;
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(rkvdec2_coded_fmts); i++) {
> > +		if (rkvdec2_coded_fmts[i].fourcc =3D=3D fourcc)
> > +			return &rkvdec2_coded_fmts[i];
> > +	}
> > +
> > +	return NULL;
> > +}
> > +
> > +static void rkvdec2_reset_fmt(struct rkvdec2_ctx *ctx, struct v4l2_for=
mat *f,
> > +			      u32 fourcc)
> > +{
> > +	memset(f, 0, sizeof(*f));
> > +	f->fmt.pix_mp.pixelformat =3D fourcc;
> > +	f->fmt.pix_mp.field =3D V4L2_FIELD_NONE;
> > +	f->fmt.pix_mp.colorspace =3D V4L2_COLORSPACE_REC709;
> > +	f->fmt.pix_mp.ycbcr_enc =3D V4L2_YCBCR_ENC_DEFAULT;
> > +	f->fmt.pix_mp.quantization =3D V4L2_QUANTIZATION_DEFAULT;
> > +	f->fmt.pix_mp.xfer_func =3D V4L2_XFER_FUNC_DEFAULT;
> > +}
> > +
> > +static void rkvdec2_reset_coded_fmt(struct rkvdec2_ctx *ctx)
> > +{
> > +	struct v4l2_format *f =3D &ctx->coded_fmt;
> > +
> > +	ctx->coded_fmt_desc =3D &rkvdec2_coded_fmts[0];
> > +	rkvdec2_reset_fmt(ctx, f, ctx->coded_fmt_desc->fourcc);
> > +
> > +	f->type =3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> > +	f->fmt.pix_mp.width =3D ctx->coded_fmt_desc->frmsize.min_width;
> > +	f->fmt.pix_mp.height =3D ctx->coded_fmt_desc->frmsize.min_height;
> > +
> > +	if (ctx->coded_fmt_desc->ops->adjust_fmt)
> > +		ctx->coded_fmt_desc->ops->adjust_fmt(ctx, f);
> > +}
> > +
> > +static void rkvdec2_reset_decoded_fmt(struct rkvdec2_ctx *ctx)
> > +{
> > +	struct v4l2_format *f =3D &ctx->decoded_fmt;
> > +
> > +	rkvdec2_reset_fmt(ctx, f, ctx->coded_fmt_desc->decoded_fmts[0]);
> > +	f->type =3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> > +	v4l2_fill_pixfmt_mp(&f->fmt.pix_mp,
> > +			    ctx->coded_fmt_desc->decoded_fmts[0],
> > +			    ctx->coded_fmt.fmt.pix_mp.width,
> > +			    ctx->coded_fmt.fmt.pix_mp.height);
> > +
> > +	ctx->colmv_offset =3D f->fmt.pix_mp.plane_fmt[0].sizeimage;
> > +
> > +	f->fmt.pix_mp.plane_fmt[0].sizeimage +=3D 128 *
> > +		DIV_ROUND_UP(f->fmt.pix_mp.width, 16) *
> > +		DIV_ROUND_UP(f->fmt.pix_mp.height, 16);
> > +}
> > +
> > +static int rkvdec2_enum_framesizes(struct file *file, void *priv,
> > +				   struct v4l2_frmsizeenum *fsize)
> > +{
> > +	const struct rkvdec2_coded_fmt_desc *fmt;
> > +
> > +	if (fsize->index !=3D 0)
> > +		return -EINVAL;
> > +
> > +	fmt =3D rkvdec2_find_coded_fmt_desc(fsize->pixel_format);
> > +	if (!fmt)
> > +		return -EINVAL;
> > +
> > +	fsize->type =3D V4L2_FRMSIZE_TYPE_STEPWISE;
> > +	fsize->stepwise =3D fmt->frmsize;
> > +	return 0;
> > +}
> > +
> > +static int rkvdec2_querycap(struct file *file, void *priv,
> > +			    struct v4l2_capability *cap)
> > +{
> > +	struct rkvdec2_dev *rkvdec =3D video_drvdata(file);
> > +	struct video_device *vdev =3D video_devdata(file);
> > +
> > +	strscpy(cap->driver, rkvdec->dev->driver->name,
> > +		sizeof(cap->driver));
> > +	strscpy(cap->card, vdev->name, sizeof(cap->card));
> > +	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
> > +		 rkvdec->dev->driver->name);
> > +	return 0;
> > +}
> > +
> > +static int rkvdec2_try_capture_fmt(struct file *file, void *priv,
> > +				   struct v4l2_format *f)
> > +{
> > +	struct v4l2_pix_format_mplane *pix_mp =3D &f->fmt.pix_mp;
> > +	struct rkvdec2_ctx *ctx =3D fh_to_rkvdec2_ctx(priv);
> > +	const struct rkvdec2_coded_fmt_desc *coded_desc;
> > +	unsigned int i;
> > +
> > +	/*
> > +	 * The codec context should point to a coded format desc, if the form=
at
> > +	 * on the coded end has not been set yet, it should point to the
> > +	 * default value.
> > +	 */
> > +	coded_desc =3D ctx->coded_fmt_desc;
> > +	if (WARN_ON(!coded_desc))
> > +		return -EINVAL;
> > +
> > +	for (i =3D 0; i < coded_desc->num_decoded_fmts; i++) {
> > +		if (coded_desc->decoded_fmts[i] =3D=3D pix_mp->pixelformat)
> > +			break;
> > +	}
> > +
> > +	if (i =3D=3D coded_desc->num_decoded_fmts)
> > +		pix_mp->pixelformat =3D coded_desc->decoded_fmts[0];
> > +
> > +	/* Always apply the frmsize constraint of the coded end. */
> > +	pix_mp->width =3D max(pix_mp->width, ctx->coded_fmt.fmt.pix_mp.width)=
;
> > +	pix_mp->height =3D max(pix_mp->height, ctx->coded_fmt.fmt.pix_mp.heig=
ht);
> > +	v4l2_apply_frmsize_constraints(&pix_mp->width,
> > +				       &pix_mp->height,
> > +				       &coded_desc->frmsize);
> > +
> > +	v4l2_fill_pixfmt_mp(pix_mp, pix_mp->pixelformat,
> > +			    pix_mp->width, pix_mp->height);
> > +
> > +	pix_mp->plane_fmt[0].sizeimage +=3D
> > +		128 *
> > +		DIV_ROUND_UP(pix_mp->width, 16) *
> > +		DIV_ROUND_UP(pix_mp->height, 16);
> > +
> > +	pix_mp->field =3D V4L2_FIELD_NONE;
> > +
> > +	return 0;
> > +}
> > +
> > +static int rkvdec2_try_output_fmt(struct file *file, void *priv,
> > +				  struct v4l2_format *f)
> > +{
> > +	struct v4l2_pix_format_mplane *pix_mp =3D &f->fmt.pix_mp;
> > +	struct rkvdec2_ctx *ctx =3D fh_to_rkvdec2_ctx(priv);
> > +	const struct rkvdec2_coded_fmt_desc *desc;
> > +
> > +	desc =3D rkvdec2_find_coded_fmt_desc(pix_mp->pixelformat);
> > +	if (!desc) {
> > +		pix_mp->pixelformat =3D rkvdec2_coded_fmts[0].fourcc;
> > +		desc =3D &rkvdec2_coded_fmts[0];
> > +	}
> > +
> > +	v4l2_apply_frmsize_constraints(&pix_mp->width,
> > +				       &pix_mp->height,
> > +				       &desc->frmsize);
> > +
> > +	pix_mp->field =3D V4L2_FIELD_NONE;
> > +	/* All coded formats are considered single planar for now. */
> > +	pix_mp->num_planes =3D 1;
> > +
> > +	if (desc->ops->adjust_fmt) {
> > +		int ret;
> > +
> > +		ret =3D desc->ops->adjust_fmt(ctx, f);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int rkvdec2_s_capture_fmt(struct file *file, void *priv,
> > +				 struct v4l2_format *f)
> > +{
> > +	struct rkvdec2_ctx *ctx =3D fh_to_rkvdec2_ctx(priv);
> > +	struct vb2_queue *vq;
> > +	int ret;
> > +
> > +	/* Change not allowed if queue is busy */
> > +	vq =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
> > +			     V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> > +	if (vb2_is_busy(vq))
> > +		return -EBUSY;
> > +
> > +	ret =3D rkvdec2_try_capture_fmt(file, priv, f);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ctx->decoded_fmt =3D *f;
> > +	return 0;
> > +}
> > +
> > +static int rkvdec2_s_output_fmt(struct file *file, void *priv,
> > +				struct v4l2_format *f)
> > +{
> > +	struct rkvdec2_ctx *ctx =3D fh_to_rkvdec2_ctx(priv);
> > +	struct v4l2_m2m_ctx *m2m_ctx =3D ctx->fh.m2m_ctx;
> > +	const struct rkvdec2_coded_fmt_desc *desc;
> > +	struct v4l2_format *cap_fmt;
> > +	struct vb2_queue *peer_vq, *vq;
> > +	int ret;
> > +
> > +	/*
> > +	 * In order to support dynamic resolution change, the decoder admits
> > +	 * a resolution change, as long as the pixelformat remains. Can't be
> > +	 * done if streaming.
> > +	 */
> > +	vq =3D v4l2_m2m_get_vq(m2m_ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> > +	if (vb2_is_streaming(vq) ||
> > +	    (vb2_is_busy(vq) &&
> > +	     f->fmt.pix_mp.pixelformat !=3D ctx->coded_fmt.fmt.pix_mp.pixelfo=
rmat))
> > +		return -EBUSY;
> > +
> > +	/*
> > +	 * Since format change on the OUTPUT queue will reset the CAPTURE
> > +	 * queue, we can't allow doing so when the CAPTURE queue has buffers
> > +	 * allocated.
> > +	 */
> > +	peer_vq =3D v4l2_m2m_get_vq(m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLA=
NE);
> > +	if (vb2_is_busy(peer_vq))
> > +		return -EBUSY;
> > +
> > +	ret =3D rkvdec2_try_output_fmt(file, priv, f);
> > +	if (ret)
> > +		return ret;
> > +
> > +	desc =3D rkvdec2_find_coded_fmt_desc(f->fmt.pix_mp.pixelformat);
> > +	if (!desc)
> > +		return -EINVAL;
> > +	ctx->coded_fmt_desc =3D desc;
> > +	ctx->coded_fmt =3D *f;
> > +
> > +	/*
> > +	 * Current decoded format might have become invalid with newly
> > +	 * selected codec, so reset it to default just to be safe and
> > +	 * keep internal driver state sane. User is mandated to set
> > +	 * the decoded format again after we return, so we don't need
> > +	 * anything smarter.
> > +	 *
> > +	 * Note that this will propagate any size changes to the decoded form=
at.
> > +	 */
> > +	rkvdec2_reset_decoded_fmt(ctx);
> > +
> > +	/* Propagate colorspace information to capture. */
> > +	cap_fmt =3D &ctx->decoded_fmt;
> > +	cap_fmt->fmt.pix_mp.colorspace =3D f->fmt.pix_mp.colorspace;
> > +	cap_fmt->fmt.pix_mp.xfer_func =3D f->fmt.pix_mp.xfer_func;
> > +	cap_fmt->fmt.pix_mp.ycbcr_enc =3D f->fmt.pix_mp.ycbcr_enc;
> > +	cap_fmt->fmt.pix_mp.quantization =3D f->fmt.pix_mp.quantization;
> > +
> > +	/* Enable format specific queue features */
> > +	vq->subsystem_flags |=3D desc->subsystem_flags;
> > +
> > +	return 0;
> > +}
> > +
> > +static int rkvdec2_g_output_fmt(struct file *file, void *priv,
> > +				struct v4l2_format *f)
> > +{
> > +	struct rkvdec2_ctx *ctx =3D fh_to_rkvdec2_ctx(priv);
> > +
> > +	*f =3D ctx->coded_fmt;
> > +	return 0;
> > +}
> > +
> > +static int rkvdec2_g_capture_fmt(struct file *file, void *priv,
> > +				 struct v4l2_format *f)
> > +{
> > +	struct rkvdec2_ctx *ctx =3D fh_to_rkvdec2_ctx(priv);
> > +
> > +	*f =3D ctx->decoded_fmt;
> > +	return 0;
> > +}
> > +
> > +static int rkvdec2_enum_output_fmt(struct file *file, void *priv,
> > +				   struct v4l2_fmtdesc *f)
> > +{
> > +	if (f->index >=3D ARRAY_SIZE(rkvdec2_coded_fmts))
> > +		return -EINVAL;
> > +
> > +	f->pixelformat =3D rkvdec2_coded_fmts[f->index].fourcc;
> > +	return 0;
> > +}
> > +
> > +static int rkvdec2_enum_capture_fmt(struct file *file, void *priv,
> > +				    struct v4l2_fmtdesc *f)
> > +{
> > +	struct rkvdec2_ctx *ctx =3D fh_to_rkvdec2_ctx(priv);
> > +
> > +	if (WARN_ON(!ctx->coded_fmt_desc))
> > +		return -EINVAL;
> > +
> > +	if (f->index >=3D ctx->coded_fmt_desc->num_decoded_fmts)
> > +		return -EINVAL;
> > +
> > +	f->pixelformat =3D ctx->coded_fmt_desc->decoded_fmts[f->index];
> > +	return 0;
> > +}
> > +
> > +static const struct v4l2_ioctl_ops rkvdec2_ioctl_ops =3D {
> > +	.vidioc_querycap =3D rkvdec2_querycap,
> > +	.vidioc_enum_framesizes =3D rkvdec2_enum_framesizes,
> > +
> > +	.vidioc_try_fmt_vid_cap_mplane =3D rkvdec2_try_capture_fmt,
> > +	.vidioc_try_fmt_vid_out_mplane =3D rkvdec2_try_output_fmt,
> > +	.vidioc_s_fmt_vid_out_mplane =3D rkvdec2_s_output_fmt,
> > +	.vidioc_s_fmt_vid_cap_mplane =3D rkvdec2_s_capture_fmt,
> > +	.vidioc_g_fmt_vid_out_mplane =3D rkvdec2_g_output_fmt,
> > +	.vidioc_g_fmt_vid_cap_mplane =3D rkvdec2_g_capture_fmt,
> > +	.vidioc_enum_fmt_vid_out =3D rkvdec2_enum_output_fmt,
> > +	.vidioc_enum_fmt_vid_cap =3D rkvdec2_enum_capture_fmt,
> > +
> > +	.vidioc_reqbufs =3D v4l2_m2m_ioctl_reqbufs,
> > +	.vidioc_querybuf =3D v4l2_m2m_ioctl_querybuf,
> > +	.vidioc_qbuf =3D v4l2_m2m_ioctl_qbuf,
> > +	.vidioc_dqbuf =3D v4l2_m2m_ioctl_dqbuf,
> > +	.vidioc_prepare_buf =3D v4l2_m2m_ioctl_prepare_buf,
> > +	.vidioc_create_bufs =3D v4l2_m2m_ioctl_create_bufs,
> > +	.vidioc_expbuf =3D v4l2_m2m_ioctl_expbuf,
> > +
> > +	.vidioc_subscribe_event =3D v4l2_ctrl_subscribe_event,
> > +	.vidioc_unsubscribe_event =3D v4l2_event_unsubscribe,
> > +
> > +	.vidioc_streamon =3D v4l2_m2m_ioctl_streamon,
> > +	.vidioc_streamoff =3D v4l2_m2m_ioctl_streamoff,
> > +
> > +	.vidioc_decoder_cmd =3D v4l2_m2m_ioctl_stateless_decoder_cmd,
> > +	.vidioc_try_decoder_cmd =3D v4l2_m2m_ioctl_stateless_try_decoder_cmd,
> > +};
> > +
> > +static int rkvdec2_queue_setup(struct vb2_queue *vq, unsigned int *num=
_buffers,
> > +			       unsigned int *num_planes, unsigned int sizes[],
> > +			      struct device *alloc_devs[])
> > +{
> > +	struct rkvdec2_ctx *ctx =3D vb2_get_drv_priv(vq);
> > +	struct v4l2_format *f;
> > +	unsigned int i;
> > +
> > +	if (V4L2_TYPE_IS_OUTPUT(vq->type))
> > +		f =3D &ctx->coded_fmt;
> > +	else
> > +		f =3D &ctx->decoded_fmt;
> > +
> > +	if (*num_planes) {
> > +		if (*num_planes !=3D f->fmt.pix_mp.num_planes)
> > +			return -EINVAL;
> > +
> > +		for (i =3D 0; i < f->fmt.pix_mp.num_planes; i++) {
> > +			if (sizes[i] < f->fmt.pix_mp.plane_fmt[i].sizeimage)
> > +				return -EINVAL;
> > +		}
> > +	} else {
> > +		*num_planes =3D f->fmt.pix_mp.num_planes;
> > +		for (i =3D 0; i < f->fmt.pix_mp.num_planes; i++)
> > +			sizes[i] =3D f->fmt.pix_mp.plane_fmt[i].sizeimage;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int rkvdec2_buf_prepare(struct vb2_buffer *vb)
> > +{
> > +	struct vb2_queue *vq =3D vb->vb2_queue;
> > +	struct rkvdec2_ctx *ctx =3D vb2_get_drv_priv(vq);
> > +	struct v4l2_format *f;
> > +	unsigned int i;
> > +
> > +	if (V4L2_TYPE_IS_OUTPUT(vq->type))
> > +		f =3D &ctx->coded_fmt;
> > +	else
> > +		f =3D &ctx->decoded_fmt;
> > +
> > +	for (i =3D 0; i < f->fmt.pix_mp.num_planes; ++i) {
> > +		u32 sizeimage =3D f->fmt.pix_mp.plane_fmt[i].sizeimage;
> > +
> > +		if (vb2_plane_size(vb, i) < sizeimage)
> > +			return -EINVAL;
> > +	}
> > +
> > +	/*
> > +	 * Buffer's bytesused must be written by driver for CAPTURE buffers.
> > +	 * (for OUTPUT buffers, if userspace passes 0 bytesused, v4l2-core se=
ts
> > +	 * it to buffer length).
> > +	 */
> > +	if (V4L2_TYPE_IS_CAPTURE(vq->type))
> > +		vb2_set_plane_payload(vb, 0, f->fmt.pix_mp.plane_fmt[0].sizeimage);
> > +
> > +	return 0;
> > +}
> > +
> > +static void rkvdec2_buf_queue(struct vb2_buffer *vb)
> > +{
> > +	struct rkvdec2_ctx *ctx =3D vb2_get_drv_priv(vb->vb2_queue);
> > +	struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
> > +
> > +	v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
> > +}
> > +
> > +static int rkvdec2_buf_out_validate(struct vb2_buffer *vb)
> > +{
> > +	struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
> > +
> > +	vbuf->field =3D V4L2_FIELD_NONE;
> > +	return 0;
> > +}
> > +
> > +static void rkvdec2_buf_request_complete(struct vb2_buffer *vb)
> > +{
> > +	struct rkvdec2_ctx *ctx =3D vb2_get_drv_priv(vb->vb2_queue);
> > +
> > +	v4l2_ctrl_request_complete(vb->req_obj.req, &ctx->ctrl_hdl);
> > +}
> > +
> > +static int rkvdec2_start_streaming(struct vb2_queue *q, unsigned int c=
ount)
> > +{
> > +	struct rkvdec2_ctx *ctx =3D vb2_get_drv_priv(q);
> > +	const struct rkvdec2_coded_fmt_desc *desc;
> > +	int ret, i;
> > +	u32 width, height;
> > +
> > +	if (V4L2_TYPE_IS_CAPTURE(q->type))
> > +		return 0;
> > +
> > +	desc =3D ctx->coded_fmt_desc;
> > +	if (WARN_ON(!desc))
> > +		return -EINVAL;
> > +
> > +	width =3D ctx->decoded_fmt.fmt.pix_mp.width;
> > +	height =3D ctx->decoded_fmt.fmt.pix_mp.height;
> > +	for (i =3D 0; i < RKVDEC2_RCB_COUNT; i++) {
> > +		ctx->rcb_bufs[i].cpu =3D
> > +			dma_alloc_coherent(ctx->dev->dev,
> > +					   RCB_SIZE(i),
> > +					   &ctx->rcb_bufs[i].dma,
> > +					   GFP_KERNEL);
> > +		if (!ctx->rcb_bufs[i].cpu) {
> > +			ret =3D -ENOMEM;
> > +			goto err_rcb;
> > +		}
> > +	}
> > +
> > +	if (desc->ops->start) {
> > +		ret =3D desc->ops->start(ctx);
> > +		if (ret)
> > +			goto err_ops_start;
> > +	}
> > +
> > +	return 0;
> > +
> > +err_ops_start:
> > +err_rcb:
> > +	i--;
> > +	while (i) {
> > +		dma_free_coherent(ctx->dev->dev,
> > +				  RCB_SIZE(i),
> > +				  ctx->rcb_bufs[i].cpu,
> > +				  ctx->rcb_bufs[i].dma);
> > +		i--;
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> > +static void rkvdec2_queue_cleanup(struct vb2_queue *vq, u32 state)
> > +{
> > +	struct rkvdec2_ctx *ctx =3D vb2_get_drv_priv(vq);
> > +
> > +	while (true) {
> > +		struct vb2_v4l2_buffer *vbuf;
> > +
> > +		if (V4L2_TYPE_IS_OUTPUT(vq->type))
> > +			vbuf =3D v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> > +		else
> > +			vbuf =3D v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> > +
> > +		if (!vbuf)
> > +			break;
> > +
> > +		v4l2_ctrl_request_complete(vbuf->vb2_buf.req_obj.req,
> > +					   &ctx->ctrl_hdl);
> > +		v4l2_m2m_buf_done(vbuf, state);
> > +	}
> > +}
> > +
> > +static void rkvdec2_stop_streaming(struct vb2_queue *q)
> > +{
> > +	struct rkvdec2_ctx *ctx =3D vb2_get_drv_priv(q);
> > +	int i;
> > +
> > +	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
> > +		const struct rkvdec2_coded_fmt_desc *desc =3D ctx->coded_fmt_desc;
> > +
> > +		if (WARN_ON(!desc))
> > +			return;
> > +
> > +		if (desc->ops->stop)
> > +			desc->ops->stop(ctx);
> > +	} else {
> > +		u32 width =3D ctx->decoded_fmt.fmt.pix_mp.width;
> > +		u32 height =3D ctx->decoded_fmt.fmt.pix_mp.height;
> > +
> > +		for (i =3D 0; i < RKVDEC2_RCB_COUNT; i++) {
> > +			dma_free_coherent(ctx->dev->dev,
> > +					  RCB_SIZE(i),
> > +					  ctx->rcb_bufs[i].cpu,
> > +					  ctx->rcb_bufs[i].dma);
> > +		}
> > +	}
> > +
> > +	rkvdec2_queue_cleanup(q, VB2_BUF_STATE_ERROR);
> > +}
> > +
> > +static const struct vb2_ops rkvdec2_queue_ops =3D {
> > +	.queue_setup =3D rkvdec2_queue_setup,
> > +	.buf_prepare =3D rkvdec2_buf_prepare,
> > +	.buf_queue =3D rkvdec2_buf_queue,
> > +	.buf_out_validate =3D rkvdec2_buf_out_validate,
> > +	.buf_request_complete =3D rkvdec2_buf_request_complete,
> > +	.start_streaming =3D rkvdec2_start_streaming,
> > +	.stop_streaming =3D rkvdec2_stop_streaming,
> > +	.wait_prepare =3D vb2_ops_wait_prepare,
> > +	.wait_finish =3D vb2_ops_wait_finish,
> > +};
> > +
> > +static int rkvdec2_request_validate(struct media_request *req)
> > +{
> > +	unsigned int count;
> > +
> > +	count =3D vb2_request_buffer_cnt(req);
> > +	if (!count)
> > +		return -ENOENT;
> > +	else if (count > 1)
> > +		return -EINVAL;
> > +
> > +	return vb2_request_validate(req);
> > +}
> > +
> > +static const struct media_device_ops rkvdec2_media_ops =3D {
> > +	.req_validate =3D rkvdec2_request_validate,
> > +	.req_queue =3D v4l2_m2m_request_queue,
> > +};
> > +
> > +static void rkvdec2_job_finish_no_pm(struct rkvdec2_ctx *ctx,
> > +				     enum vb2_buffer_state result)
> > +{
> > +	if (ctx->coded_fmt_desc->ops->done) {
> > +		struct vb2_v4l2_buffer *src_buf, *dst_buf;
> > +
> > +		src_buf =3D v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> > +		dst_buf =3D v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> > +		ctx->coded_fmt_desc->ops->done(ctx, src_buf, dst_buf, result);
> > +	}
> > +
> > +	v4l2_m2m_buf_done_and_job_finish(ctx->dev->m2m_dev, ctx->fh.m2m_ctx,
> > +					 result);
> > +}
> > +
> > +static void rkvdec2_job_finish(struct rkvdec2_ctx *ctx,
> > +			       enum vb2_buffer_state result)
> > +{
> > +	struct rkvdec2_dev *rkvdec =3D ctx->dev;
> > +
> > +	pm_runtime_mark_last_busy(rkvdec->dev);
> > +	pm_runtime_put_autosuspend(rkvdec->dev);
> > +	rkvdec2_job_finish_no_pm(ctx, result);
> > +}
> > +
> > +void rkvdec2_run_preamble(struct rkvdec2_ctx *ctx, struct rkvdec2_run =
*run)
> > +{
> > +	struct media_request *src_req;
> > +
> > +	memset(run, 0, sizeof(*run));
> > +
> > +	run->bufs.src =3D v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> > +	run->bufs.dst =3D v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> > +
> > +	/* Apply request(s) controls if needed. */
> > +	src_req =3D run->bufs.src->vb2_buf.req_obj.req;
> > +	if (src_req)
> > +		v4l2_ctrl_request_setup(src_req, &ctx->ctrl_hdl);
> > +
> > +	v4l2_m2m_buf_copy_metadata(run->bufs.src, run->bufs.dst, true);
> > +}
> > +
> > +void rkvdec2_run_postamble(struct rkvdec2_ctx *ctx, struct rkvdec2_run=
 *run)
> > +{
> > +	struct media_request *src_req =3D run->bufs.src->vb2_buf.req_obj.req;
> > +
> > +	if (src_req)
> > +		v4l2_ctrl_request_complete(src_req, &ctx->ctrl_hdl);
> > +}
> > +
> > +static void rkvdec2_device_run(void *priv)
> > +{
> > +	struct rkvdec2_ctx *ctx =3D priv;
> > +	struct rkvdec2_dev *rkvdec =3D ctx->dev;
> > +	const struct rkvdec2_coded_fmt_desc *desc =3D ctx->coded_fmt_desc;
> > +	int ret;
> > +
> > +	if (WARN_ON(!desc))
> > +		return;
> > +
> > +	ret =3D pm_runtime_resume_and_get(rkvdec->dev);
> > +	if (ret < 0) {
> > +		rkvdec2_job_finish_no_pm(ctx, VB2_BUF_STATE_ERROR);
> > +		return;
> > +	}
> > +
> > +	ret =3D desc->ops->run(ctx);
> > +	if (ret)
> > +		rkvdec2_job_finish(ctx, VB2_BUF_STATE_ERROR);
> > +}
> > +
> > +static const struct v4l2_m2m_ops rkvdec2_m2m_ops =3D {
> > +	.device_run =3D rkvdec2_device_run,
> > +};
> > +
> > +static int rkvdec2_queue_init(void *priv,
> > +			      struct vb2_queue *src_vq,
> > +			     struct vb2_queue *dst_vq)
> > +{
> > +	struct rkvdec2_ctx *ctx =3D priv;
> > +	struct rkvdec2_dev *rkvdec =3D ctx->dev;
> > +	int ret;
> > +
> > +	src_vq->type =3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> > +	src_vq->io_modes =3D VB2_MMAP | VB2_DMABUF;
> > +	src_vq->drv_priv =3D ctx;
> > +	src_vq->ops =3D &rkvdec2_queue_ops;
> > +	src_vq->mem_ops =3D &vb2_dma_contig_memops;
> > +
> > +	/*
> > +	 * Driver does mostly sequential access, so sacrifice TLB efficiency
> > +	 * for faster allocation. Also, no CPU access on the source queue,
> > +	 * so no kernel mapping needed.
> > +	 */
> > +	src_vq->dma_attrs =3D DMA_ATTR_ALLOC_SINGLE_PAGES |
> > +			    DMA_ATTR_NO_KERNEL_MAPPING;
> > +	src_vq->buf_struct_size =3D sizeof(struct v4l2_m2m_buffer);
> > +	src_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> > +	src_vq->lock =3D &rkvdec->vdev_lock;
> > +	src_vq->dev =3D rkvdec->v4l2_dev.dev;
> > +	src_vq->supports_requests =3D true;
> > +	src_vq->requires_requests =3D true;
> > +
> > +	ret =3D vb2_queue_init(src_vq);
> > +	if (ret)
> > +		return ret;
> > +
> > +	dst_vq->bidirectional =3D true;
> > +	dst_vq->mem_ops =3D &vb2_dma_contig_memops;
> > +	dst_vq->dma_attrs =3D DMA_ATTR_ALLOC_SINGLE_PAGES |
> > +			    DMA_ATTR_NO_KERNEL_MAPPING;
> > +	dst_vq->type =3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> > +	dst_vq->io_modes =3D VB2_MMAP | VB2_DMABUF;
> > +	dst_vq->drv_priv =3D ctx;
> > +	dst_vq->ops =3D &rkvdec2_queue_ops;
> > +	dst_vq->buf_struct_size =3D sizeof(struct rkvdec2_decoded_buffer);
> > +	dst_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> > +	dst_vq->lock =3D &rkvdec->vdev_lock;
> > +	dst_vq->dev =3D rkvdec->v4l2_dev.dev;
> > +
> > +	return vb2_queue_init(dst_vq);
> > +}
> > +
> > +static int rkvdec2_add_ctrls(struct rkvdec2_ctx *ctx,
> > +			     const struct rkvdec2_ctrls *ctrls)
> > +{
> > +	unsigned int i;
> > +
> > +	for (i =3D 0; i < ctrls->num_ctrls; i++) {
> > +		const struct v4l2_ctrl_config *cfg =3D &ctrls->ctrls[i].cfg;
> > +
> > +		v4l2_ctrl_new_custom(&ctx->ctrl_hdl, cfg, ctx);
> > +		if (ctx->ctrl_hdl.error)
> > +			return ctx->ctrl_hdl.error;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int rkvdec2_init_ctrls(struct rkvdec2_ctx *ctx)
> > +{
> > +	unsigned int i, nctrls =3D 0;
> > +	int ret;
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(rkvdec2_coded_fmts); i++)
> > +		nctrls +=3D rkvdec2_coded_fmts[i].ctrls->num_ctrls;
> > +
> > +	v4l2_ctrl_handler_init(&ctx->ctrl_hdl, nctrls);
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(rkvdec2_coded_fmts); i++) {
> > +		ret =3D rkvdec2_add_ctrls(ctx, rkvdec2_coded_fmts[i].ctrls);
> > +		if (ret)
> > +			goto err_free_handler;
> > +	}
> > +
> > +	ret =3D v4l2_ctrl_handler_setup(&ctx->ctrl_hdl);
> > +	if (ret)
> > +		goto err_free_handler;
> > +
> > +	ctx->fh.ctrl_handler =3D &ctx->ctrl_hdl;
> > +	return 0;
> > +
> > +err_free_handler:
> > +	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
> > +	return ret;
> > +}
> > +
> > +static int rkvdec2_open(struct file *filp)
> > +{
> > +	struct rkvdec2_dev *rkvdec =3D video_drvdata(filp);
> > +	struct rkvdec2_ctx *ctx;
> > +	int ret;
> > +
> > +	ctx =3D kzalloc(sizeof(*ctx), GFP_KERNEL);
> > +	if (!ctx)
> > +		return -ENOMEM;
> > +
> > +	ctx->dev =3D rkvdec;
> > +	rkvdec2_reset_coded_fmt(ctx);
> > +	rkvdec2_reset_decoded_fmt(ctx);
> > +	v4l2_fh_init(&ctx->fh, video_devdata(filp));
> > +
> > +	ret =3D rkvdec2_init_ctrls(ctx);
> > +	if (ret)
> > +		goto err_free_ctx;
> > +
> > +	ctx->fh.m2m_ctx =3D v4l2_m2m_ctx_init(rkvdec->m2m_dev, ctx,
> > +					    rkvdec2_queue_init);
> > +	if (IS_ERR(ctx->fh.m2m_ctx)) {
> > +		ret =3D PTR_ERR(ctx->fh.m2m_ctx);
> > +		goto err_cleanup_ctrls;
> > +	}
> > +
> > +	filp->private_data =3D &ctx->fh;
> > +	v4l2_fh_add(&ctx->fh);
> > +
> > +	return 0;
> > +
> > +err_cleanup_ctrls:
> > +	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
> > +
> > +err_free_ctx:
> > +	kfree(ctx);
> > +	return ret;
> > +}
> > +
> > +static int rkvdec2_release(struct file *filp)
> > +{
> > +	struct rkvdec2_ctx *ctx =3D fh_to_rkvdec2_ctx(filp->private_data);
> > +
> > +	v4l2_fh_del(&ctx->fh);
> > +	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
> > +	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
> > +	v4l2_fh_exit(&ctx->fh);
> > +	kfree(ctx);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct v4l2_file_operations rkvdec2_fops =3D {
> > +	.owner =3D THIS_MODULE,
> > +	.open =3D rkvdec2_open,
> > +	.release =3D rkvdec2_release,
> > +	.poll =3D v4l2_m2m_fop_poll,
> > +	.unlocked_ioctl =3D video_ioctl2,
> > +	.mmap =3D v4l2_m2m_fop_mmap,
> > +};
> > +
> > +static int rkvdec2_v4l2_init(struct rkvdec2_dev *rkvdec)
> > +{
> > +	int ret;
> > +
> > +	ret =3D v4l2_device_register(rkvdec->dev, &rkvdec->v4l2_dev);
> > +	if (ret) {
> > +		dev_err(rkvdec->dev, "Failed to register V4L2 device\n");
> > +		return ret;
> > +	}
> > +
> > +	rkvdec->m2m_dev =3D v4l2_m2m_init(&rkvdec2_m2m_ops);
> > +	if (IS_ERR(rkvdec->m2m_dev)) {
> > +		v4l2_err(&rkvdec->v4l2_dev, "Failed to init mem2mem device\n");
> > +		ret =3D PTR_ERR(rkvdec->m2m_dev);
> > +		goto err_unregister_v4l2;
> > +	}
> > +
> > +	rkvdec->mdev.dev =3D rkvdec->dev;
> > +	strscpy(rkvdec->mdev.model, "rkvdec2", sizeof(rkvdec->mdev.model));
> > +	strscpy(rkvdec->mdev.bus_info, "platform:rkvdec2",
> > +		sizeof(rkvdec->mdev.bus_info));
> > +	media_device_init(&rkvdec->mdev);
> > +	rkvdec->mdev.ops =3D &rkvdec2_media_ops;
> > +	rkvdec->v4l2_dev.mdev =3D &rkvdec->mdev;
> > +
> > +	rkvdec->vdev.lock =3D &rkvdec->vdev_lock;
> > +	rkvdec->vdev.v4l2_dev =3D &rkvdec->v4l2_dev;
> > +	rkvdec->vdev.fops =3D &rkvdec2_fops;
> > +	rkvdec->vdev.release =3D video_device_release_empty;
> > +	rkvdec->vdev.vfl_dir =3D VFL_DIR_M2M;
> > +	rkvdec->vdev.device_caps =3D V4L2_CAP_STREAMING |
> > +				   V4L2_CAP_VIDEO_M2M_MPLANE;
> > +	rkvdec->vdev.ioctl_ops =3D &rkvdec2_ioctl_ops;
> > +	video_set_drvdata(&rkvdec->vdev, rkvdec);
> > +	strscpy(rkvdec->vdev.name, "rkvdec2", sizeof(rkvdec->vdev.name));
> > +
> > +	ret =3D video_register_device(&rkvdec->vdev, VFL_TYPE_VIDEO, -1);
> > +	if (ret) {
> > +		v4l2_err(&rkvdec->v4l2_dev, "Failed to register video device\n");
> > +		goto err_cleanup_mc;
> > +	}
> > +
> > +	ret =3D v4l2_m2m_register_media_controller(rkvdec->m2m_dev, &rkvdec->=
vdev,
> > +						 MEDIA_ENT_F_PROC_VIDEO_DECODER);
> > +	if (ret) {
> > +		v4l2_err(&rkvdec->v4l2_dev,
> > +			 "Failed to initialize V4L2 M2M media controller\n");
> > +		goto err_unregister_vdev;
> > +	}
> > +
> > +	ret =3D media_device_register(&rkvdec->mdev);
> > +	if (ret) {
> > +		v4l2_err(&rkvdec->v4l2_dev, "Failed to register media device\n");
> > +		goto err_unregister_mc;
> > +	}
> > +
> > +	return 0;
> > +
> > +err_unregister_mc:
> > +	v4l2_m2m_unregister_media_controller(rkvdec->m2m_dev);
> > +
> > +err_unregister_vdev:
> > +	video_unregister_device(&rkvdec->vdev);
> > +
> > +err_cleanup_mc:
> > +	media_device_cleanup(&rkvdec->mdev);
> > +	v4l2_m2m_release(rkvdec->m2m_dev);
> > +
> > +err_unregister_v4l2:
> > +	v4l2_device_unregister(&rkvdec->v4l2_dev);
> > +	return ret;
> > +}
> > +
> > +static void rkvdec2_v4l2_cleanup(struct rkvdec2_dev *rkvdec)
> > +{
> > +	media_device_unregister(&rkvdec->mdev);
> > +	v4l2_m2m_unregister_media_controller(rkvdec->m2m_dev);
> > +	video_unregister_device(&rkvdec->vdev);
> > +	media_device_cleanup(&rkvdec->mdev);
> > +	v4l2_m2m_release(rkvdec->m2m_dev);
> > +	v4l2_device_unregister(&rkvdec->v4l2_dev);
> > +}
> > +
> > +static irqreturn_t rkvdec2_irq_handler(int irq, void *priv)
> > +{
> > +	struct rkvdec2_dev *rkvdec =3D priv;
> > +	enum vb2_buffer_state state;
> > +	u32 status;
> > +
> > +	status =3D readl(rkvdec->regs + RKVDEC2_REG_STA_INT);
> > +	state =3D (status & STA_INT_DEC_RDY_STA) ?
> > +		VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR;
> > +
> > +	/* Clear interrupt status */
> > +	writel(0, rkvdec->regs + RKVDEC2_REG_STA_INT);
> > +	if (cancel_delayed_work(&rkvdec->watchdog_work)) {
> > +		struct rkvdec2_ctx *ctx;
> > +
> > +		ctx =3D v4l2_m2m_get_curr_priv(rkvdec->m2m_dev);
> > +		rkvdec2_job_finish(ctx, state);
> > +	}
> > +
> > +	return IRQ_HANDLED;
> > +}
> > +
> > +static void rkvdec2_watchdog_func(struct work_struct *work)
> > +{
> > +	struct rkvdec2_dev *rkvdec =3D container_of(to_delayed_work(work), st=
ruct rkvdec2_dev,
> > +			      watchdog_work);
> > +	struct rkvdec2_ctx *ctx;
> > +
> > +	ctx =3D v4l2_m2m_get_curr_priv(rkvdec->m2m_dev);
> > +	if (ctx) {
> > +		dev_err(rkvdec->dev, "Frame processing timed out!\n");
> > +		writel(RKVDEC2_REG_DEC_IRQ_DISABLE, rkvdec->regs + RKVDEC2_REG_IMPOR=
TANT_EN);
> > +		writel(0, rkvdec->regs + RKVDEC2_REG_DEC_E);
> > +		rkvdec2_job_finish(ctx, VB2_BUF_STATE_ERROR);
> > +	}
> > +}
> > +
> > +static const struct of_device_id of_rkvdec2_match[] =3D {
> > +	{ .compatible =3D "rockchip,rk3588-vdec2" },
> > +	{ /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, of_rkvdec2_match);
> > +
> > +static const char * const rkvdec2_clk_names[] =3D {
> > +	"axi",
> > +	"ahb",
> > +	"core",
> > +	"cabac",
> > +	"hevc_cabac",
> > +};
> > +
> > +static int rkvdec2_probe(struct platform_device *pdev)
> > +{
> > +	struct rkvdec2_dev *rkvdec;
> > +	unsigned int i;
> > +	int ret, irq;
> > +
> > +	rkvdec =3D devm_kzalloc(&pdev->dev, sizeof(*rkvdec), GFP_KERNEL);
> > +	if (!rkvdec)
> > +		return -ENOMEM;
> > +
> > +	platform_set_drvdata(pdev, rkvdec);
> > +	rkvdec->dev =3D &pdev->dev;
> > +
> > +	mutex_init(&rkvdec->vdev_lock);
> > +	INIT_DELAYED_WORK(&rkvdec->watchdog_work, rkvdec2_watchdog_func);
> > +
> > +	rkvdec->clocks =3D devm_kcalloc(&pdev->dev, ARRAY_SIZE(rkvdec2_clk_na=
mes),
> > +				      sizeof(*rkvdec->clocks), GFP_KERNEL);
> > +	if (!rkvdec->clocks)
> > +		return -ENOMEM;
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(rkvdec2_clk_names); i++)
> > +		rkvdec->clocks[i].id =3D rkvdec2_clk_names[i];
> > +
> > +	ret =3D devm_clk_bulk_get(&pdev->dev, ARRAY_SIZE(rkvdec2_clk_names),
> > +				rkvdec->clocks);
> > +	if (ret)
> > +		return ret;
> > +
> > +	rkvdec->regs =3D devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(rkvdec->regs))
> > +		return PTR_ERR(rkvdec->regs);
> > +
> > +	ret =3D dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
> > +	if (ret) {
> > +		dev_err(&pdev->dev, "Could not set DMA coherent mask.\n");
> > +		return ret;
> > +	}
> > +
> > +	vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
> > +
> > +	irq =3D platform_get_irq(pdev, 0);
> > +	if (irq <=3D 0)
> > +		return -ENXIO;
> > +
> > +	ret =3D devm_request_threaded_irq(&pdev->dev, irq, NULL,
> > +					rkvdec2_irq_handler, IRQF_ONESHOT,
> > +					dev_name(&pdev->dev), rkvdec);
> > +	if (ret) {
> > +		dev_err(&pdev->dev, "Could not request vdec2 IRQ\n");
> > +		return ret;
> > +	}
> > +
> > +	pm_runtime_set_autosuspend_delay(&pdev->dev, 100);
> > +	pm_runtime_use_autosuspend(&pdev->dev);
> > +	pm_runtime_enable(&pdev->dev);
> > +
> > +	ret =3D clk_bulk_prepare_enable(ARRAY_SIZE(rkvdec2_clk_names), rkvdec=
->clocks);
> > +	if (ret) {
> > +		dev_err(&pdev->dev, "Could not start clocks\n");
> > +		return ret;
> > +	}
> > +
> > +	ret =3D rkvdec2_v4l2_init(rkvdec);
> > +	if (ret)
> > +		goto err_disable_runtime_pm;
> > +
> > +	return 0;
> > +
> > +err_disable_runtime_pm:
> > +	pm_runtime_dont_use_autosuspend(&pdev->dev);
> > +	pm_runtime_disable(&pdev->dev);
> > +	return ret;
> > +}
> > +
> > +static void rkvdec2_remove(struct platform_device *pdev)
> > +{
> > +	struct rkvdec2_dev *rkvdec =3D platform_get_drvdata(pdev);
> > +
> > +	cancel_delayed_work_sync(&rkvdec->watchdog_work);
> > +
> > +	rkvdec2_v4l2_cleanup(rkvdec);
> > +	pm_runtime_disable(&pdev->dev);
> > +	pm_runtime_dont_use_autosuspend(&pdev->dev);
> > +}
> > +
> > +#ifdef CONFIG_PM
> > +static int rkvdec2_runtime_resume(struct device *dev)
> > +{
> > +	struct rkvdec2_dev *rkvdec =3D dev_get_drvdata(dev);
> > +
> > +	return clk_bulk_prepare_enable(ARRAY_SIZE(rkvdec2_clk_names),
> > +				       rkvdec->clocks);
> > +}
> > +
> > +static int rkvdec2_runtime_suspend(struct device *dev)
> > +{
> > +	struct rkvdec2_dev *rkvdec =3D dev_get_drvdata(dev);
> > +
> > +	clk_bulk_disable_unprepare(ARRAY_SIZE(rkvdec2_clk_names),
> > +				   rkvdec->clocks);
> > +	return 0;
> > +}
> > +#endif
> > +
> > +static const struct dev_pm_ops rkvdec2_pm_ops =3D {
> > +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> > +				pm_runtime_force_resume)
> > +	SET_RUNTIME_PM_OPS(rkvdec2_runtime_suspend, rkvdec2_runtime_resume, N=
ULL)
> > +};
> > +
> > +static struct platform_driver rkvdec2_driver =3D {
> > +	.probe =3D rkvdec2_probe,
> > +	.remove_new =3D rkvdec2_remove,
> > +	.driver =3D {
> > +		   .name =3D "rkvdec2",
> > +		   .of_match_table =3D of_rkvdec2_match,
> > +		   .pm =3D &rkvdec2_pm_ops,
> > +	},
> > +};
> > +module_platform_driver(rkvdec2_driver);
> > +
> > +MODULE_AUTHOR("Detlev Casanova <detlev.casanova@collabora.com>");
> > +MODULE_DESCRIPTION("Rockchip Video Decoder 2 driver");
> > +MODULE_LICENSE("GPL");
> > diff --git a/drivers/staging/media/rkvdec2/rkvdec2.h b/drivers/staging/=
media/rkvdec2/rkvdec2.h
> > new file mode 100644
> > index 000000000000..3982c0387869
> > --- /dev/null
> > +++ b/drivers/staging/media/rkvdec2/rkvdec2.h
> > @@ -0,0 +1,123 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Rockchip Video Decoder 2 driver
> > + *
> > + * Copyright (C) 2024 Collabora, Ltd.
> > + *  Detlev Casanova <detlev.casanova@collabora.com>
> > + *
> > + * Based on rkvdec driver by Boris Brezillon <boris.brezillon@collabor=
a.com>
> > + */
> > +#ifndef RKVDEC_H_
> > +#define RKVDEC_H_
> > +
> > +#include <linux/platform_device.h>
> > +#include <linux/videodev2.h>
> > +#include <linux/wait.h>
> > +#include <linux/clk.h>
> > +#include <linux/dma-mapping.h>
> > +
> > +#include <media/v4l2-ctrls.h>
> > +#include <media/v4l2-device.h>
> > +#include <media/v4l2-ioctl.h>
> > +#include <media/videobuf2-core.h>
> > +#include <media/videobuf2-dma-contig.h>
> > +
> > +#include "rkvdec2-regs.h"
> > +
> > +#define RKVDEC2_RCB_COUNT	10
> > +
> > +struct rkvdec2_ctx;
> > +
> > +struct rkvdec2_aux_buf {
> > +	void *cpu;
> > +	dma_addr_t dma;
> > +	size_t size;
> > +};
> > +
> > +struct rkvdec2_ctrl_desc {
> > +	struct v4l2_ctrl_config cfg;
> > +};
> > +
> > +struct rkvdec2_ctrls {
> > +	const struct rkvdec2_ctrl_desc *ctrls;
> > +	unsigned int num_ctrls;
> > +};
> > +
> > +struct rkvdec2_run {
> > +	struct {
> > +		struct vb2_v4l2_buffer *src;
> > +		struct vb2_v4l2_buffer *dst;
> > +	} bufs;
> > +};
> > +
> > +struct rkvdec2_decoded_buffer {
> > +	/* Must be the first field in this struct. */
> > +	struct v4l2_m2m_buffer base;
> > +};
> > +
> > +static inline struct rkvdec2_decoded_buffer *
> > +vb2_to_rkvdec2_decoded_buf(struct vb2_buffer *buf)
> > +{
> > +	return container_of(buf, struct rkvdec2_decoded_buffer,
> > +			    base.vb.vb2_buf);
> > +}
> > +
> > +struct rkvdec2_coded_fmt_ops {
> > +	int (*adjust_fmt)(struct rkvdec2_ctx *ctx,
> > +			  struct v4l2_format *f);
> > +	int (*start)(struct rkvdec2_ctx *ctx);
> > +	void (*stop)(struct rkvdec2_ctx *ctx);
> > +	int (*run)(struct rkvdec2_ctx *ctx);
> > +	void (*done)(struct rkvdec2_ctx *ctx, struct vb2_v4l2_buffer *src_buf=
,
> > +		     struct vb2_v4l2_buffer *dst_buf,
> > +		     enum vb2_buffer_state result);
> > +	int (*try_ctrl)(struct rkvdec2_ctx *ctx, struct v4l2_ctrl *ctrl);
> > +};
> > +
> > +struct rkvdec2_coded_fmt_desc {
> > +	u32 fourcc;
> > +	struct v4l2_frmsize_stepwise frmsize;
> > +	const struct rkvdec2_ctrls *ctrls;
> > +	const struct rkvdec2_coded_fmt_ops *ops;
> > +	unsigned int num_decoded_fmts;
> > +	const u32 *decoded_fmts;
> > +	u32 subsystem_flags;
> > +};
> > +
> > +struct rkvdec2_dev {
> > +	struct v4l2_device v4l2_dev;
> > +	struct media_device mdev;
> > +	struct video_device vdev;
> > +	struct v4l2_m2m_dev *m2m_dev;
> > +	struct device *dev;
> > +	struct clk_bulk_data *clocks;
> > +	void __iomem *regs;
> > +	struct mutex vdev_lock; /* serializes ioctls */
> > +	struct delayed_work watchdog_work;
> > +};
> > +
> > +struct rkvdec2_ctx {
> > +	struct v4l2_fh fh;
> > +	struct v4l2_format coded_fmt;
> > +	struct v4l2_format decoded_fmt;
> > +	const struct rkvdec2_coded_fmt_desc *coded_fmt_desc;
> > +	struct v4l2_ctrl_handler ctrl_hdl;
> > +	struct rkvdec2_dev *dev;
> > +	struct rkvdec2_aux_buf rcb_bufs[RKVDEC2_RCB_COUNT];
> > +
> > +	u32 colmv_offset;
> > +
> > +	void *priv;
> > +};
> > +
> > +static inline struct rkvdec2_ctx *fh_to_rkvdec2_ctx(struct v4l2_fh *fh=
)
> > +{
> > +	return container_of(fh, struct rkvdec2_ctx, fh);
> > +}
> > +
> > +void rkvdec2_run_preamble(struct rkvdec2_ctx *ctx, struct rkvdec2_run =
*run);
> > +void rkvdec2_run_postamble(struct rkvdec2_ctx *ctx, struct rkvdec2_run=
 *run);
> > +
> > +extern const struct rkvdec2_coded_fmt_ops rkvdec2_h264_fmt_ops;
> > +
> > +#endif /* RKVDEC_H_ */
> > --=20
> > 2.44.2
> >=20
> >=20
> > _______________________________________________
> > Linux-rockchip mailing list
> > Linux-rockchip@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-rockchip


