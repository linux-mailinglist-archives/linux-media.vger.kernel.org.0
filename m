Return-Path: <linux-media+bounces-1355-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E84FA7FD557
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 12:17:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 259EB1C210D3
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 11:17:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8812D1C69A;
	Wed, 29 Nov 2023 11:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FdYMWICo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85E8426AA;
	Wed, 29 Nov 2023 03:17:00 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40b472f98b1so24672975e9.3;
        Wed, 29 Nov 2023 03:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701256619; x=1701861419; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4dNTAnz6jh4sXjmmLHfYK8kr+0+L5yD69JSF7E1pcKo=;
        b=FdYMWICoWmsXEr1T1KeAFeYqKUV5zuYJIWpr9jb029lSPF/r+ouxlA9LNCUUxFeVe9
         bgBqypyFebDBJxMO1sviYVaoyBQkr5VA20KY3KjgDHRSKZuic3zhJynG/Bdp47hCJCGS
         nEi8FQ83cB+j+y5e45FeZ+PBn9V1ufCtk+pWk/00joULhItlT96Ee4GzghY+Mj2CwInZ
         HDns+LBiSFsXGlPD0K5qjELMHWTN//bRLH6rQftD3aO0blN5b+t6R9+oKJilJBivCKZo
         nyL/1vhzS79g2FLa149+/62MMpo2EbeQiXutdR2JV6OXBPZG3nmA6y7RuDaFhC23YMXi
         3yOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701256619; x=1701861419;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4dNTAnz6jh4sXjmmLHfYK8kr+0+L5yD69JSF7E1pcKo=;
        b=wmy75ut5SfTB8IN/rcWzgQOM0eHToQRAQouylDQPq7IEQDSmNYGDcgkFFQdLt3eXN6
         0UAWK5EAC178Z8T8d7piwYFsqDX4OdE503Tihyn3gq8EwmNtzPTtKFvOfV5GJLExk+Xf
         vThj0Ka0xLi8tcaOdhZw95nYG/0WUWTV30xjsUxfY9fYYztPHsYOXa1rYDOYhUmeb6Ux
         +RmjkZCiuS+cGLKpJ4Tb6es8CAoglXTceMtnyCS4jJSUoVyRpfo96wdrZ6ez3dWMFHiy
         2hwddJBGi19bI9F0lVIMR1FUWvKXR8UBf/gCnMWwG2sz/p7wvadFo4PxM0NKDA57px/e
         Ultw==
X-Gm-Message-State: AOJu0Yx+NhEpkQFdBffDh6Ad7IO7egdqCVZ3ZKgJHNdpvMiKBrn6sbCm
	qghK6W8HjmPnGJU/uhkvtelq1aJGpgs=
X-Google-Smtp-Source: AGHT+IExaw61p4uTe6IRWAm4G524xJwfV+OKqYesvC6i5iNIHxW9JODFq2G8bdu5TxyRMYDjxv5Brw==
X-Received: by 2002:a05:600c:5118:b0:3f6:9634:c8d6 with SMTP id o24-20020a05600c511800b003f69634c8d6mr13261469wms.18.1701256618588;
        Wed, 29 Nov 2023 03:16:58 -0800 (PST)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (net-2-39-143-167.cust.vodafonedsl.it. [2.39.143.167])
        by smtp.gmail.com with ESMTPSA id r5-20020a05600c35c500b0040b54335d57sm1439045wmq.17.2023.11.29.03.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 03:16:58 -0800 (PST)
Date: Wed, 29 Nov 2023 12:16:56 +0100
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: Paul Elder <paul.elder@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	kieran.bingham@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
	umang.jain@ideasonboard.com
Subject: Re: [PATCH 0/2] arm64: dts: imx8mp: Add support for the ISPs
Message-ID: <ZWcdqKHWOPevTNgd@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <20231129093113.255161-1-paul.elder@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231129093113.255161-1-paul.elder@ideasonboard.com>

Hi Paul, Laurent,

On Wed, Nov 29, 2023 at 06:31:11PM +0900, Paul Elder wrote:
> This patch series adds support to the i.MX8MP device tree for the ISPs.
> 
> Laurent Pinchart (1):
>   arm64: dts: imx8mp: Add overlays for ISP instances
> 
> Paul Elder (1):
>   arm64: dts: imx8mp: Add DT nodes for the two ISPs

Tested also on my side with the following setup:

imx8mp-evk + ov5640
imx8mp-evk + alvium-1500c-500

Below some logs:

imx8mp-evk + ov5640
----------------------------------------------------------------------------------------------------------------
Media device information
--------------------
driver          rkisp1
model           rkisp1
serial
bus info        platform:rkisp1
hw revision     0xe
driver version  6.7.0

Device topology
- entity 1: rkisp1_isp (4 pads, 4 links)
			type V4L2 subdev subtype Unknown flags 0
			device node name /dev/v4l-subdev0
		pad0: Sink
				[fmt:SRGGB10_1X10/800x600 field:none colorspace:raw xfer:none ycbcr:601 quantization:full-range
				 crop.bounds:(0,0)/800x600
				 crop:(0,0)/800x600]
				<- "csis-32e40000.csi":1 [ENABLED]
		pad1: Sink
				[fmt:unknown/0x0 field:none]
				<- "rkisp1_params":0 [ENABLED,IMMUTABLE]
		pad2: Source
				[fmt:YUYV8_2X8/800x600 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range
				 crop.bounds:(0,0)/800x600
				 crop:(0,0)/800x600]
				-> "rkisp1_resizer_mainpath":0 [ENABLED]
		pad3: Source
				[fmt:unknown/0x0 field:none]
				-> "rkisp1_stats":0 [ENABLED,IMMUTABLE]

- entity 6: rkisp1_resizer_mainpath (2 pads, 2 links)
			type V4L2 subdev subtype Unknown flags 0
			device node name /dev/v4l-subdev1
		pad0: Sink
				[fmt:YUYV8_2X8/800x600 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range
				 crop.bounds:(0,0)/800x600
				 crop:(0,0)/800x600]
				<- "rkisp1_isp":2 [ENABLED]
		pad1: Source
				[fmt:YUYV8_2X8/800x600 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range]
				-> "rkisp1_mainpath":0 [ENABLED,IMMUTABLE]

- entity 9: rkisp1_mainpath (1 pad, 1 link)
			type Node subtype V4L flags 0
			device node name /dev/video0
		pad0: Sink
				<- "rkisp1_resizer_mainpath":1 [ENABLED,IMMUTABLE]

- entity 13: rkisp1_stats (1 pad, 1 link)
			 type Node subtype V4L flags 0
			 device node name /dev/video1
		pad0: Sink
				<- "rkisp1_isp":3 [ENABLED,IMMUTABLE]

- entity 17: rkisp1_params (1 pad, 1 link)
			 type Node subtype V4L flags 0
			 device node name /dev/video2
		pad0: Source
				-> "rkisp1_isp":1 [ENABLED,IMMUTABLE]

- entity 29: csis-32e40000.csi (2 pads, 2 links)
			 type V4L2 subdev subtype Unknown flags 0
			 device node name /dev/v4l-subdev2
		pad0: Sink
				[fmt:UYVY8_1X16/640x480 field:none colorspace:smpte170m xfer:709 ycbcr:601 quantization:lim-range]
				<- "ov5640 1-003c":0 []
		pad1: Source
				[fmt:UYVY8_1X16/640x480 field:none colorspace:smpte170m xfer:709 ycbcr:601 quantization:lim-range]
				-> "rkisp1_isp":0 [ENABLED]

- entity 34: ov5640 1-003c (1 pad, 1 link)
			 type V4L2 subdev subtype Sensor flags 0
			 device node name /dev/v4l-subdev3
		pad0: Source
				[fmt:UYVY8_1X16/640x480@1/30 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:full-range
				 crop.bounds:(0,0)/2624x1964
				 crop:(16,14)/2592x1944]
				-> "csis-32e40000.csi":0 []

root@imx8mp-lpddr4-evk:~#
root@imx8mp-lpddr4-evk:~# uname -a
Linux imx8mp-lpddr4-evk 6.7.0-rc2-gff66adbac1c2 #277 SMP PREEMPT Wed Nov 29 11:40:48 CET 2023 aarch64 GNU/Linux
----------------------------------------------------------------------------------------------------------------

imx8mp-evk + alvium 1500c-500:
----------------------------------------------------------------------------------------------------------------

Media device information
--------------------
driver          rkisp1
model           rkisp1
serial
bus info        platform:rkisp1
hw revision     0xe
driver version  6.7.0

Device topology
- entity 1: rkisp1_isp (4 pads, 4 links)
			type V4L2 subdev subtype Unknown flags 0
			device node name /dev/v4l-subdev0
		pad0: Sink
				[fmt:SRGGB10_1X10/800x600 field:none colorspace:raw xfer:none ycbcr:601 quantization:full-range
				 crop.bounds:(0,0)/800x600
				 crop:(0,0)/800x600]
				<- "csis-32e40000.csi":1 [ENABLED]
		pad1: Sink
				[fmt:unknown/0x0 field:none]
				<- "rkisp1_params":0 [ENABLED,IMMUTABLE]
		pad2: Source
				[fmt:YUYV8_2X8/800x600 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range
				 crop.bounds:(0,0)/800x600
				 crop:(0,0)/800x600]
				-> "rkisp1_resizer_mainpath":0 [ENABLED]
		pad3: Source
				[fmt:unknown/0x0 field:none]
				-> "rkisp1_stats":0 [ENABLED,IMMUTABLE]

- entity 6: rkisp1_resizer_mainpath (2 pads, 2 links)
			type V4L2 subdev subtype Unknown flags 0
			device node name /dev/v4l-subdev1
		pad0: Sink
				[fmt:YUYV8_2X8/800x600 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range
				 crop.bounds:(0,0)/800x600
				 crop:(0,0)/800x600]
				<- "rkisp1_isp":2 [ENABLED]
		pad1: Source
				[fmt:YUYV8_2X8/800x600 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range]
				-> "rkisp1_mainpath":0 [ENABLED,IMMUTABLE]

- entity 9: rkisp1_mainpath (1 pad, 1 link)
			type Node subtype V4L flags 0
			device node name /dev/video0
		pad0: Sink
				<- "rkisp1_resizer_mainpath":1 [ENABLED,IMMUTABLE]

- entity 13: rkisp1_stats (1 pad, 1 link)
			 type Node subtype V4L flags 0
			 device node name /dev/video1
		pad0: Sink
				<- "rkisp1_isp":3 [ENABLED,IMMUTABLE]

- entity 17: rkisp1_params (1 pad, 1 link)
			 type Node subtype V4L flags 0
			 device node name /dev/video2
		pad0: Source
				-> "rkisp1_isp":1 [ENABLED,IMMUTABLE]

- entity 29: csis-32e40000.csi (2 pads, 2 links)
			 type V4L2 subdev subtype Unknown flags 0
			 device node name /dev/v4l-subdev2
		pad0: Sink
				[fmt:UYVY8_1X16/640x480 field:none colorspace:smpte170m xfer:709 ycbcr:601 quantization:lim-range]
				<- "alvium-csi2 1-003c":0 []
		pad1: Source
				[fmt:UYVY8_1X16/640x480 field:none colorspace:smpte170m xfer:709 ycbcr:601 quantization:lim-range]
				-> "rkisp1_isp":0 [ENABLED]

- entity 34: alvium-csi2 1-003c (1 pad, 1 link)
			 type V4L2 subdev subtype Sensor flags 0
			 device node name /dev/v4l-subdev3
		pad0: Source
				[fmt:UYVY8_1X16/640x480@1/10 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:full-range
				 crop.bounds:(0,0)/2592x1944
				 crop:(0,0)/640x480]
				-> "csis-32e40000.csi":0 []

root@imx8mp-lpddr4-evk:~# uname -a
Linux imx8mp-lpddr4-evk 6.7.0-rc2-gff66adbac1c2 #277 SMP PREEMPT Wed Nov 29 11:40:48 CET 2023 aarch64 GNU/Linux


Hope this help.

Thanks & Regards,
Tommaso

> 
>  arch/arm64/boot/dts/freescale/Makefile        |  2 +
>  .../arm64/boot/dts/freescale/imx8mp-isp1.dtso | 36 +++++++++++++
>  .../arm64/boot/dts/freescale/imx8mp-isp2.dtso | 36 +++++++++++++
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi     | 50 +++++++++++++++++++
>  4 files changed, 124 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-isp1.dtso
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-isp2.dtso
> 
> -- 
> 2.39.2
> 
> 

