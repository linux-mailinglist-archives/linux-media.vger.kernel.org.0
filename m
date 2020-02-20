Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44F05165924
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2020 09:24:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727103AbgBTIYm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Feb 2020 03:24:42 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:37961 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726759AbgBTIYm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Feb 2020 03:24:42 -0500
Received: from [192.168.2.10] ([46.9.235.248])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 4h8Gj9V8XyIme4h8JjiULX; Thu, 20 Feb 2020 09:24:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1582187080; bh=zjCtsEIa08AGTyanHrsqF+rTfgRcOyOrIkiDIW9QfEQ=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=e5zQOyPw3QKs6KKOXVTapY7zvgPVaf4D1dmdNZhCpta6p9SVSXCqve5sn6z7mKif1
         pb1AKVPkcwb4fHktMChS912Q+f4Vc3HYjoSFOUvEi7LeMcO/tnyA62EH99DFJJ+8my
         bn3gTZk50O6lUT0Y6g6z0js3zzpDfERWGx4T2RJh/0v4AM01zd1Y7HR/ClEm4GKqqY
         480FGhbOQIqCvF7AracdWIDQdLIxuejwv+DUezEiY/Va4oVC3ozHV24sRgbpq/OZkN
         Eg4FJJoHNOsRzCDF6dTsFRm3WI4WGZpH+rZTsBEqSEtmuo2CCD+WybfrufQy1uK6sX
         weAIEC8bT8uPw==
Subject: Re: [PATCH v5 0/6] media: rockchip: Add the rkvdec driver
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Heiko Stuebner <heiko@sntech.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Sakari Ailus <sakari.ailus@iki.fi>
References: <20200219173750.26453-1-ezequiel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <de59d088-ec08-c851-77f2-545053ca0cbb@xs4all.nl>
Date:   Thu, 20 Feb 2020 09:24:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200219173750.26453-1-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfOyDD88T/3EMGCMjiQ/rzRGQ0jdIDCkWv1DdNKCpVI/4w5Cr6yo3Q06FVkJqXBj2A/AF8uNxU5N0ohwJP8ItCv7gMCAjZil9+L0i2TT/KIHkh6/LVTnF
 XuL4xyx0NyXmDJylYEagN76KqPIEX9fTqodrzPMm1aDY/cwtPw/ldGqJzhrN4AQywVZKOZS2h462t4NXwi8xtklkeZT8Au8Faeb+icbz88qGjHmppbgpegKM
 AekfK1/jSC+XrZiujG4aNcLxvSAWZqq29ysQT6UdV5bFz98We17THzekZ7D+VVPEf5mNt3rv5MU3D2YifcYsW1dTBEKEOxbRwPrv9zAr7RjCXbLl8+swBJy/
 YrCDEX81s+Ab26YRSSyoXXLq1X5rI2mRdS9J2L1djmkG7PX45PbCJOEPQmmezJ3FpB0xjoLhpYlPooEJVXrAz1G83arO8kyYPcLJ+M0llUrM1ceqpJZn7WKt
 Rwa8KWRZkl2MGivkPKkuX4nzA+M9DrmIvH2T8ylv8Q6AQkEHQa+yyY6W+4EpjKmA9SmGqptLhTuFftjjp4Upuc9N2YrkoXGJoarMjaEY4mvRlt/eDWlJp8FG
 gZTyHGPR3azbocsENwKFaMzbhdU/CpT2PDHW4UWLddsNyHAl5TBRTyvL7PvLvMql52RoFDH7JP0fRTsaMriakvN5mH4EqRLPTxK0RuEV3EZMlA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2/19/20 6:37 PM, Ezequiel Garcia wrote:
> Hello,
> 
> This is v5 of Boris' rkvdec driver.
> 
> This version corrects wrong copyright notices and then adds
> a TODO file for the staging driver. The only reason to keep the
> driver in staging are the staging uAPI controls.

Can you post a follow-up patch that updates the MAINTAINERS file?
That's missing in this series.

Thanks!

	Hans

> 
> Thanks,
> Ezequiel
> 
> Boris Brezillon (5):
>   media: v4l2-core: Add helpers to build the H264 P/B0/B1 reflists
>   media: hantro: h264: Use the generic H264 reflist builder
>   media: dt-bindings: rockchip: Document RK3399 Video Decoder bindings
>   media: rkvdec: Add the rkvdec driver
>   arm64: dts: rockchip: rk3399: Define the rockchip Video Decoder node
> 
> Jonas Karlman (1):
>   media: uapi: h264: Add DPB entry field reference flags
> 
>  .../bindings/media/rockchip,vdec.yaml         |   71 +
>  .../media/uapi/v4l/ext-ctrls-codec.rst        |   16 +
>  arch/arm64/boot/dts/rockchip/rk3399.dtsi      |   14 +-
>  drivers/media/v4l2-core/Kconfig               |    4 +
>  drivers/media/v4l2-core/Makefile              |    1 +
>  drivers/media/v4l2-core/v4l2-h264.c           |  258 ++++
>  drivers/staging/media/Kconfig                 |    2 +
>  drivers/staging/media/Makefile                |    1 +
>  drivers/staging/media/hantro/Kconfig          |    1 +
>  drivers/staging/media/hantro/hantro_h264.c    |  237 +---
>  drivers/staging/media/rkvdec/Kconfig          |   15 +
>  drivers/staging/media/rkvdec/Makefile         |    3 +
>  drivers/staging/media/rkvdec/TODO             |   11 +
>  drivers/staging/media/rkvdec/rkvdec-h264.c    | 1154 +++++++++++++++++
>  drivers/staging/media/rkvdec/rkvdec-regs.h    |  223 ++++
>  drivers/staging/media/rkvdec/rkvdec.c         | 1134 ++++++++++++++++
>  drivers/staging/media/rkvdec/rkvdec.h         |  123 ++
>  include/media/h264-ctrls.h                    |    2 +
>  include/media/v4l2-h264.h                     |   86 ++
>  19 files changed, 3126 insertions(+), 230 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/rockchip,vdec.yaml
>  create mode 100644 drivers/media/v4l2-core/v4l2-h264.c
>  create mode 100644 drivers/staging/media/rkvdec/Kconfig
>  create mode 100644 drivers/staging/media/rkvdec/Makefile
>  create mode 100644 drivers/staging/media/rkvdec/TODO
>  create mode 100644 drivers/staging/media/rkvdec/rkvdec-h264.c
>  create mode 100644 drivers/staging/media/rkvdec/rkvdec-regs.h
>  create mode 100644 drivers/staging/media/rkvdec/rkvdec.c
>  create mode 100644 drivers/staging/media/rkvdec/rkvdec.h
>  create mode 100644 include/media/v4l2-h264.h
> 

