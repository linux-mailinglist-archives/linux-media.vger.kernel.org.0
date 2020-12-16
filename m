Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBE992DC213
	for <lists+linux-media@lfdr.de>; Wed, 16 Dec 2020 15:23:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726398AbgLPOXU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Dec 2020 09:23:20 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:60411 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725550AbgLPOXT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Dec 2020 09:23:19 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id pXhIkQD1PynrEpXhLkqSy4; Wed, 16 Dec 2020 15:22:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1608128557; bh=mIw/AYzTN3j29S/4SW6HnI8dCmw/848t1XQxDX8EJ9Y=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=ePWkie79NMergdmej7uq8OgOAx29l/VMk6oY0GyaMTuf05TyYHjxTvgpYzqjdCsEf
         PpBTwCcOHKa9l9BsWoU9hYxjgx5CIuBMvR0s1ZFpQckOC6AjQqDC7HJ5KeqnlN49dp
         qX2tnycu0MPTwSKClYqTO7+TbaNPIEf7qaQpsC46Io/1lUMvss3h/SXdgIm4UOpifP
         4XHHPs3HeS4j/vlojYiSkTeDRMd+ahb4aL1eLzc2W7o7QnkKgP/O3F+7PWS2MINgNW
         /hsG8DycTy3m4U4JIoiS6HnILx0eTw71dImI1NO2JnjztCzY4E46B36O2o9/iDsFTe
         JNqfNKc04pcsw==
Subject: Re: [PATCH v3 0/2] dt-bindings: media: Convert video-interfaces.txt
 to schemas
To:     Rob Herring <robh@kernel.org>,
        Guennadi Liakhovetski <g.liakhovetski@gmx.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20201210211625.3070388-1-robh@kernel.org>
 <20201210211625.3070388-4-robh@kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <ce59e0df-4a7c-a958-2f11-dd3eeb924ffc@xs4all.nl>
Date:   Wed, 16 Dec 2020 15:22:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201210211625.3070388-4-robh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfBL/AbMQLVoZP7/TvSAfb2mR+KZYy1MrqivLJ4+pQSgNx/uRRBTSXNxNzB5sUMRNrOKOnlQFVXJGoQSzIWF5ILWfbEHb/xtsZA19v6SbWWfT2bUb/N7L
 zxuSffs7P2IPLBuh6pblH51YPLEnynHsEvHR1zEbkaAbgJPdurAT4xwoHnx42trmo1cP/fvvwXU9hQCTaqJBu+DZkFVk2gXyy8HHSjO8N//RJZTT0WJMhsDW
 Z4/MblZ+SDe1NPuqwyxHfewI3stZcP69noC/3H2QU1CQG9Mfbc46e4CsnIOy6KnujCY8xvfcE8AF70q3bL9tBpVR7d1OyCEVFZI6e7JU2mHPbqYBvLArHyke
 0t5OQOnvOUjW1RKw19PtwuN4FNPH9xs6iM7cdFLHR20WDmza0ycSFK+kYG9XElPjqBI5fgNXQx7DuI0z+gI3BF4s7kWR+YWDiNVCxyfQgXYNdKcGzadNJdRh
 OYc3RvrGPD+szq4wqQE+NlyQ/+wBq024vU13Iy7eOfRdJu/ZLnakn6YUMKHsChEzTfpjHaB3qAcYD6UVhRCZiNN6amtO0ddMhOOfcPcyc5lNmRAkpngOZ2xL
 DtU=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rob,

You can add my

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

to these two patches.

Regards,

	Hans

On 10/12/2020 22:16, Rob Herring wrote:
> This series converts video-interfaces.txt to DT schema which in turn is
> based on converting the graph binding to a schema. All the media users
> are converted to use the graph and video-interfaces schemas.
> 
> Based on media tree commit 7ea4d2329330. This is dependent on dt-schema
> changes not yet committed[1]. Please review those too.
> 
> Rob
> 
> [1] https://github.com/devicetree-org/dt-schema/tree/of-graph
> 
> 
> Rob Herring (2):
>   media: dt-bindings: Convert video-interfaces.txt properties to schemas
>   dt-bindings: media: Use graph and video-interfaces schemas
> 
>  .../media/allwinner,sun4i-a10-csi.yaml        |  11 +-
>  .../media/allwinner,sun6i-a31-csi.yaml        |  12 +-
>  .../bindings/media/i2c/adv7180.yaml           |  36 +-
>  .../bindings/media/i2c/adv7604.yaml           |  37 +-
>  .../bindings/media/i2c/aptina,mt9v111.yaml    |   4 +-
>  .../bindings/media/i2c/imi,rdacm2x-gmsl.yaml  |  30 +-
>  .../devicetree/bindings/media/i2c/imx219.yaml |  21 +-
>  .../bindings/media/i2c/maxim,max9286.yaml     | 101 +--
>  .../bindings/media/i2c/mipi-ccs.yaml          |  15 +-
>  .../devicetree/bindings/media/i2c/ov5647.yaml |  20 +-
>  .../devicetree/bindings/media/i2c/ov8856.yaml |  21 +-
>  .../bindings/media/i2c/ovti,ov02a10.yaml      |  30 +-
>  .../bindings/media/i2c/ovti,ov2680.yaml       |   6 +-
>  .../bindings/media/i2c/ovti,ov772x.yaml       |   9 +-
>  .../bindings/media/i2c/sony,imx214.yaml       |  25 +-
>  .../bindings/media/i2c/sony,imx274.yaml       |   3 +-
>  .../bindings/media/marvell,mmp2-ccic.yaml     |  15 +-
>  .../bindings/media/nxp,imx7-csi.yaml          |   5 +-
>  .../bindings/media/nxp,imx7-mipi-csi2.yaml    |  32 +-
>  .../bindings/media/renesas,ceu.yaml           |  17 +-
>  .../bindings/media/renesas,csi2.yaml          |  54 +-
>  .../bindings/media/renesas,vin.yaml           | 113 +---
>  .../bindings/media/rockchip-isp1.yaml         |  40 +-
>  .../bindings/media/st,stm32-dcmi.yaml         |  18 +-
>  .../devicetree/bindings/media/ti,cal.yaml     |  55 +-
>  .../media/video-interface-devices.yaml        | 406 +++++++++++
>  .../bindings/media/video-interfaces.txt       | 640 +-----------------
>  .../bindings/media/video-interfaces.yaml      | 346 ++++++++++
>  .../bindings/media/xilinx/xlnx,csi2rxss.yaml  |  39 +-
>  29 files changed, 922 insertions(+), 1239 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/video-interface-devices.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/video-interfaces.yaml
> 
> --
> 2.25.1
> 

