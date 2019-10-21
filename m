Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21EBADEA10
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2019 12:50:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728101AbfJUKuH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Oct 2019 06:50:07 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:55365 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726725AbfJUKuH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Oct 2019 06:50:07 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id MVGEiU67ko1ZhMVGHiLihs; Mon, 21 Oct 2019 12:50:05 +0200
Subject: Re: [Patch 00/19] media: ti-vpe: cal: maintenance
To:     Benoit Parrot <bparrot@ti.com>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20191018153437.20614-1-bparrot@ti.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <0f48c5a0-4c30-8c1c-928a-96af0321ed00@xs4all.nl>
Date:   Mon, 21 Oct 2019 12:50:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191018153437.20614-1-bparrot@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfF4dURUScBRaoErlB582OwWHV5kZXMlSv2G7pOZMykheTc55zjZTxV0c2dkLMObZ6RecSdrrlDJ22k8BUpXLg37s9UCCcupDwaUMRVF41c7yGXIgCdzQ
 RmwZXfUX2i1O/Q2cOqKqO4yRpixUOHgiH5T3zjJKWwEiye8t+WSBmVBZp4myProDlAkqcV1WDu64nkcb8jAewmvEsMpt0Qtv0NoX9PCiZy63uE33JEuhB9ck
 ZqfaIh/F+Gpu5fo0SL4bnRY213YXkIjO9vxeEQF7G54TI/tQuTQGwuyqq0oL3H2oImnqhyHGqoyXQBXM5EmzJg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benoit,

This series looks good to me. I had just one small comment on patch 7
and a comment on patch 19.

Just post a v2 for just patch 7/19 and post a patch 20/19 for the requested
MAINTAINERS change.

Once I have Rob's Acks I can merge this.

Regards,

	Hans

On 10/18/19 5:34 PM, Benoit Parrot wrote:
> This a collection of backlog patches I have been carrying for the CAL
> driver.
> 
> - Add support for SoC variants.
> 
> - Switches to syscon/regmap to access a system controller register for
> the DPHY configuration. This register has different bit layout depending
> on the SoC version.
> 
> - It adds supports for pre ES2.0 silicon errata.
> 
> - Reworked the DPHY initialization sequence to match the technical
> reference manual and provide a more robust restartability.
> 
> - Adds the missing ability to power subdevice.
> 
> - Update the devicetree binding and then converts it to dt-schema 
> 
> Benoit Parrot (18):
>   dt-bindings: media: cal: update binding to use syscon
>   dt-bindings: media: cal: update binding example
>   media: ti-vpe: cal: Add per platform data support
>   media: ti-vpe: cal: Enable DMABUF export
>   dt-bindings: media: cal: update binding to add PHY LDO errata support
>   media: ti-vpe: cal: add CSI2 PHY LDO errata support
>   media: ti-vpe: cal: Fix ths_term/ths_settle parameters
>   media: ti-vpe: cal: Fix pixel processing parameters
>   media: ti-vpe: cal: Align DPHY init sequence with docs
>   dt-bindings: media: cal: update binding to add DRA76x support
>   media: ti-vpe: cal: Add DRA76x support
>   dt-bindings: media: cal: update binding to add AM654 support
>   media: ti-vpe: cal: Add AM654 support
>   media: ti-vpe: cal: Add subdev s_power hooks
>   media: ti-vpe: cal: Properly calculate max resolution boundary
>   media: ti-vpe: cal: Fix a WARN issued when start streaming fails
>   media: ti-vpe: cal: fix enum_mbus_code/frame_size subdev arguments
>   dt-bindings: media: cal: convert binding to yaml
> 
> Nikhil Devshatwar (1):
>   media: ti-vpe: cal: Restrict DMA to avoid memory corruption
> 
>  .../devicetree/bindings/media/ti,cal.yaml     | 186 +++++
>  .../devicetree/bindings/media/ti-cal.txt      |  72 --
>  drivers/media/platform/Kconfig                |   2 +-
>  drivers/media/platform/ti-vpe/cal.c           | 775 ++++++++++++++----
>  drivers/media/platform/ti-vpe/cal_regs.h      |  27 +
>  5 files changed, 830 insertions(+), 232 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/ti,cal.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/ti-cal.txt
> 

