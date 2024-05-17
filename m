Return-Path: <linux-media+bounces-11602-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B938C87C7
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2024 16:16:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF8B11F24CDA
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2024 14:16:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F07455DF0D;
	Fri, 17 May 2024 14:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h8J6N8Rf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A315A116;
	Fri, 17 May 2024 14:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715955371; cv=none; b=LVhHk18hQNrqwr62nJEmN7exyd5UTLJSeuUqiiWssZpSNn20p1SuruB70nzyEYX7tsDFgFSmlHyGRM6qDH+8yGEUG7aZ38pfcTFXo32SCWdsSy3S3BQV1cbUZNNftK6h56ekq3wiYeo6pbKG9+l9CpH31pnBLjhQab1cvUjV9wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715955371; c=relaxed/simple;
	bh=bMMZzoVd4Ipe5JPppFNnb74C+DFtqmptuDqgu2Fjp0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=msoWpBIV6lvmDmQpHWoIzyDiaKRJ9UDV+7agNSjG8G408cfpP64TalqgfF2uurK8eVxnEqaxNf8MvMD4xHWS5TrY6dOOZB7OHuSeI7g4OQmfO0pRspphanqmz5pIbcPS6+j6OpCMLbdx3lkkDN7idaigbwEmAfnOJ4ShYewrP2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h8J6N8Rf; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-572baf393ddso6849608a12.1;
        Fri, 17 May 2024 07:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715955368; x=1716560168; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8i3kAfvn6FwtqlBHuCZB4J6sbvLuvm1jFi6wHTdb8c0=;
        b=h8J6N8RfWcJWBD1d37ZCWBugLXHgKqOANps4frUUw6u01UOkxqGrNqGunRxgreZHR8
         Gc/hoOqZj5zikdcUelQBQ2jmBE5xYbQn1e+zs6KBKzSK2c2wfHlVUIQoIdfXdTkQtS1h
         6AWyy+xVFt9j8Srnv1FDfyfsG21XUqB4PPiJq4klhMWzsG2cm1NvOtIWVd1LzP13CfB2
         CEPCDV6JblX2NDV4tr4OZs/QTQgTh65BgjQ7xK+xn0DSM4jsPolnh45eUjfsTbAv9rUw
         xhkJ/w+QIQI0tYH1FER5EP/rwQOe1fKa/MnlcO9x4nN3/5sJlYjd8urP1bbw/CjNxS/F
         MB7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715955368; x=1716560168;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8i3kAfvn6FwtqlBHuCZB4J6sbvLuvm1jFi6wHTdb8c0=;
        b=Rtag6MilaiYiFiPE2c2wN7lqer0FwZCFZ03MjOTaV2OE0h24oV+bp7ZcU/LkQFR5oy
         jgb10V3yERnmW+dOioFIWkqFqbE2WWilNwRikerMwBUACHSmM6/hWvB6sCeNOxWejDF9
         5n+Bu6VwkLfttkzlwq0y35AsIwIndBWcAkoKqSFxMJJDzBPU3Cad/wi3PiMLetntYZ/z
         zhMwKh2zm4b0kbgE2aG/1lGbbamZYIQ/NwqHEuCHZLJipaCerH39CbuDcBT7lc8NQgwh
         QfEh241xgr5muoisOmN+TMTpS6N82/1b4kgpqudCIk9KwzN2v3gqgc/naMGn2Ju2eIRK
         qg7A==
X-Forwarded-Encrypted: i=1; AJvYcCW5EYAFC2hLbEi5vWgTC7dNbfBzV5y+s2cCbwkAywbQgfZT9XiMJttK9Nej+xj5Qo1c/K2rZAw427NFM7eg997wyINamP5XuASncsXKFJ3G8GcVOefcoPIMSm42gymrohZ7YPU4+BGETQ==
X-Gm-Message-State: AOJu0YxJazenqIIjSzvp4pIZlKygHUlvArHeJnFHby9PH9hhGEsv6VSJ
	TgQF2GxcTxr4I2GpRRmNNjvR1VS82On5CLJgkSj/YDWYxPSg69gf
X-Google-Smtp-Source: AGHT+IEcfVF01FXS4Dmb/n9DTOSLA4G7zFbi9qvbHeOdMUMlAZ9MPA2GpxY8fFAOeZi4Y/8dIEc92w==
X-Received: by 2002:a17:906:5291:b0:a59:9f88:f1f1 with SMTP id a640c23a62f3a-a5a2d1de7b1mr2028947666b.19.1715955367589;
        Fri, 17 May 2024 07:16:07 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (net-188-217-50-118.cust.vodafonedsl.it. [188.217.50.118])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a1781cf91sm1123895766b.1.2024.05.17.07.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 07:16:07 -0700 (PDT)
Date: Fri, 17 May 2024 16:16:04 +0200
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: Julien Massot <julien.massot@collabora.com>
Cc: linux-media@vger.kernel.org, sakari.ailus@iki.fi,
	devicetree@vger.kernel.org, kernel@collabora.com,
	linux-kernel@vger.kernel.org, mchehab@kernel.org,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, mhecht73@gmail.com, martin.hecht@avnet.eu
Subject: Re: [PATCH v7 0/5] Add support for MAX96714/F and MAX96717/F GMSL2
 ser/des
Message-ID: <ZkdmpED/nXUQ4J3r@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <20240430131931.166012-1-julien.massot@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240430131931.166012-1-julien.massot@collabora.com>

Hi Julien,

On Tue, Apr 30, 2024 at 03:19:26PM +0200, Julien Massot wrote:
> Change since v6:
>   - Remove mention of C-PHY for MAX96717, this serializer is D-PHY only
>   - Remove bus-type requirement for MAX96717
>   - Minor changes requested by Sakari
>   - Workaround a MAX96717 issue, which occurs when stopping
>     the CSI source before stopping the MAX96717 CSI receiver.
> 
> Power management is not included in this patchset. The GMSL link is
> not always resuming when the deserializer is suspended without
> suspending the serializer.
> 
> Change since v5:
>  - Reverse fallback logic: max9671{4,7} can fallback to max9671{4,7}F
>  - use const instead of enum for max9671{4,7}f compatible as suggested
> 
> Change since v4:
>  - Add support for MAX96717 and MAX96714 and use them as a fallback for
>    MAX96717F and MAX96714F respectively
>  - The drivers are now compatible with MAX96717 and MAX96714 since no change in
>    the logic is needed
>  - Reference 'i2c-gate' instead of 'i2c-controller' in the bindings
> 
> Change since v3:
> - bindings
>   - Renamed bindings to drop the 'f' suffix
>   - Add bus type to MAX96717 and remove from MAX9674
>   - Add lane-polarities to both bindings
> 
> - drivers
>   - Address changes requested by Sakari in v3
>   - use v4l2_subdev_s_stream_helper for MAX96714
>   - do not init regmap twice in the MAX96714 driver
>   - Fix compilations on 32 bits platforms
> 
> Change since v2:
> - Convert drivers to use CCI helpers
> - Use generic node name
> - Use 'powerdown' as gpio name instead of 'enable'
> - Add pattern generator support for MAX96714
> 
> These patches add support for Maxim MAX96714F deserializer and
> MAX96717F serializer.
> 
> MAX96714F has one GMSL2 input port and one CSI2 4 lanes output port,
> MAX96717F has one CSI2 input port and one GMSL2 output port.
> 
> The drivers support the tunnel mode where all the
> CSI2 traffic coming from an imager is replicated through the deserializer
> output port.
> 
> Both MAX96714F and MAX96717F are limited to a 3Gbps forward link rate
> leaving a maximum of 2.6Gbps for the video payload.

Thanks for your great work! :)
I test your series with the following hw:

 alvium camera (GM2-319c) -> max96717 (non f variant) -> max96716a -> imx8mp-msc-sm2s-ep2 board

Note:
max96716a is pretty similar to max96714. I change only:

#define MAX96714_DEVICE_ID  0xb6
#define MAX96714F_DEVICE_ID 0xbe

And swapping lanes as you suggest:

	max96714_csi0_out: endpoint {
				data-lanes = <3 4 1 2>;
				link-frequencies = /bits/ 64 <750000000>;
				remote-endpoint = <&mipi_csi_0_in>;
	};

On my current setup csi2 to gmsl2 board is always powered on then, I have
ERRB pin that is triggered at uboot lvl because is not handled.
I think we can andle later this case I can suggest to clear/unclear the ERRB_EN bit of REG5(0x5)
in the very beginning of the probe.

Apart of this
All is working properly on my side and also on Martin side (that is in CC) :)
I'm able to stream properly using:

# SETUP TOPOLOGY LINKS
media-ctl --links "'alvium-csi2 3-003c':0->'max96717 6-0040':0[1]"
media-ctl --links "'max96717 6-0040':1->'max96714 3-0028':0[1]"
media-ctl --links "'max96714 3-0028':1->'csis-32e40000.csi':0[1]"
media-ctl --links "'csis-32e40000.csi':1->'crossbar':0[1]"
media-ctl --links "'crossbar':3->'mxc_isi.0':0[1]"
media-ctl --links "'mxc_isi.0':1->'mxc_isi.0.capture':0[1]"

# SETUP TOPOLOGY ENTITIES
media-ctl -d /dev/media0 --set-v4l2 '"alvium-csi2 3-003c":0[fmt:UYVY8_1X16/1280x800@1/60 field:none]'
media-ctl -d /dev/media0 --set-v4l2 '"max96717 6-0040":0[fmt:UYVY8_1X16/1280x800 field:none]'
media-ctl -d /dev/media0 --set-v4l2 '"max96714 3-0028":0[fmt:UYVY8_1X16/1280x800 field:none]'
media-ctl -d /dev/media0 --set-v4l2 '"csis-32e40000.csi":0[fmt:UYVY8_1X16/1280x800 field:none]'
media-ctl -d /dev/media0 --set-v4l2 '"crossbar":0[fmt:UYVY8_1X16/1280x800 field:none]'
media-ctl -d /dev/media0 --set-v4l2 '"mxc_isi.0":0[fmt:UYVY8_1X16/1280x800 field:none]'


gst-launch-1.0 v4l2src  io-mode=dmabuf blocksize=76800 ! video/x-raw,format=YUY2,width=1280,height=800 ! videoconvert ! waylandsink sync=false


# TOPOLOGY

Media controller API version 6.9.0

Media device information
------------------------
driver          mxc-isi
model           FSL Capture Media Device
serial
bus info        platform:32e00000.isi
hw revision     0x0
driver version  6.9.0

Device topology
- entity 1: crossbar (5 pads, 4 links, 0 routes)
            type V4L2 subdev subtype Unknown flags 0
            device node name /dev/v4l-subdev0
        pad0: Sink
                [stream:0 fmt:UYVY8_1X16/1280x800 field:none]
                <- "csis-32e40000.csi":1 [ENABLED,IMMUTABLE]
        pad1: Sink
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range]
        pad2: Sink
                <- "mxc_isi.output":0 [ENABLED,IMMUTABLE]
        pad3: Source
                [stream:0 fmt:UYVY8_1X16/1280x800 field:none]
                -> "mxc_isi.0":0 [ENABLED,IMMUTABLE]
        pad4: Source
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range]
                -> "mxc_isi.1":0 [ENABLED,IMMUTABLE]

- entity 7: mxc_isi.0 (2 pads, 2 links, 0 routes)
            type V4L2 subdev subtype Unknown flags 0
            device node name /dev/v4l-subdev1
        pad0: Sink
                [stream:0 fmt:UYVY8_1X16/1280x800 field:none
                 compose.bounds:(0,0)/1280x800
                 compose:(0,0)/1280x800]
                <- "crossbar":3 [ENABLED,IMMUTABLE]
        pad1: Source
                [stream:0 fmt:YUV8_1X24/1280x800 field:none colorspace:jpeg xfer:srgb ycbcr:601 quantization:full-range
                 crop.bounds:(0,0)/1280x800
                 crop:(0,0)/1280x800]
                -> "mxc_isi.0.capture":0 [ENABLED,IMMUTABLE]

- entity 10: mxc_isi.0.capture (1 pad, 1 link)
             type Node subtype V4L flags 0
             device node name /dev/video0
        pad0: Sink
                <- "mxc_isi.0":1 [ENABLED,IMMUTABLE]

- entity 18: mxc_isi.1 (2 pads, 2 links, 0 routes)
             type V4L2 subdev subtype Unknown flags 0
             device node name /dev/v4l-subdev2
        pad0: Sink
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:jpeg xfer:srgb ycbcr:601 quantization:full-range
                 compose.bounds:(0,0)/1920x1080
                 compose:(0,0)/1920x1080]
                <- "crossbar":4 [ENABLED,IMMUTABLE]
        pad1: Source
                [stream:0 fmt:YUV8_1X24/1920x1080 field:none colorspace:jpeg xfer:srgb ycbcr:601 quantization:full-range
                 crop.bounds:(0,0)/1920x1080
                 crop:(0,0)/1920x1080]
                -> "mxc_isi.1.capture":0 [ENABLED,IMMUTABLE]

- entity 21: mxc_isi.1.capture (1 pad, 1 link)
             type Node subtype V4L flags 0
             device node name /dev/video1
        pad0: Sink
                <- "mxc_isi.1":1 [ENABLED,IMMUTABLE]

- entity 29: mxc_isi.output (1 pad, 1 link)
             type Node subtype V4L flags 0
        pad0: Source
                -> "crossbar":2 [ENABLED,IMMUTABLE]

- entity 36: csis-32e40000.csi (2 pads, 2 links, 0 routes)
             type V4L2 subdev subtype Unknown flags 0
             device node name /dev/v4l-subdev3
        pad0: Sink
                [stream:0 fmt:UYVY8_1X16/1280x800 field:none]
                <- "max96714 3-0028":1 [ENABLED]
        pad1: Source
                [stream:0 fmt:UYVY8_1X16/1280x800 field:none]
                -> "crossbar":0 [ENABLED,IMMUTABLE]

- entity 41: max96714 3-0028 (2 pads, 2 links, 0 routes)
             type V4L2 subdev subtype Unknown flags 0
             device node name /dev/v4l-subdev4
        pad0: Sink
                [stream:0 fmt:UYVY8_1X16/1280x800 field:none]
                <- "max96717 6-0040":1 [ENABLED,IMMUTABLE]
        pad1: Source
                [stream:0 fmt:UYVY8_1X16/1280x800 field:none]
                -> "csis-32e40000.csi":0 [ENABLED]

- entity 46: max96717 6-0040 (2 pads, 2 links, 0 routes)
             type V4L2 subdev subtype Unknown flags 0
             device node name /dev/v4l-subdev5
        pad0: Sink
                [stream:0 fmt:UYVY8_1X16/1280x800 field:none]
                <- "alvium-csi2 3-003c":0 [ENABLED,IMMUTABLE]
        pad1: Source
                [stream:0 fmt:UYVY8_1X16/1280x800 field:none]
                -> "max96714 3-0028":0 [ENABLED,IMMUTABLE]

- entity 51: alvium-csi2 3-003c (1 pad, 1 link, 0 routes)
             type V4L2 subdev subtype Sensor flags 0
             device node name /dev/v4l-subdev6
        pad0: Source
                [stream:0 fmt:UYVY8_1X16/1280x800@1/60 field:none
                 crop.bounds:(0,0)/2064x1544
                 crop:(0,0)/640x480]
                -> "max96717 6-0040":0 [ENABLED,IMMUTABLE]

All this test was done on top of linux-media tree 6.9.0-rc2.
Here my tags for all the series:

Reviewed-by: Tommaso Merciai <tomm.merciai@gmail.com>
Tested-by: Tommaso Merciai <tomm.merciai@gmail.com>

Thanks again for your great work.
Hope this series will be merged soon :)

Regards,
Tommaso

> 
> Julien Massot (9):
>   dt-bindings: media: add Maxim MAX96717 GMSL2 Serializer
>   dt-bindings: media: add Maxim MAX96714 GMSL2 Deserializer
>   media: i2c: add MAX96717 driver
>   media: i2c: add MAX96714 driver
>   drivers: media: max96717: stop the csi receiver before the source
> 
>  .../bindings/media/i2c/maxim,max96714.yaml    |  174 +++
>  .../bindings/media/i2c/maxim,max96717.yaml    |  157 +++
>  MAINTAINERS                                   |   14 +
>  drivers/media/i2c/Kconfig                     |   34 +
>  drivers/media/i2c/Makefile                    |    2 +
>  drivers/media/i2c/max96714.c                  | 1024 +++++++++++++++++
>  drivers/media/i2c/max96717.c                  |  927 +++++++++++++++
>  7 files changed, 2332 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
>  create mode 100644 drivers/media/i2c/max96714.c
>  create mode 100644 drivers/media/i2c/max96717.c
> 
> -- 
> 2.44.0
> 
> 

