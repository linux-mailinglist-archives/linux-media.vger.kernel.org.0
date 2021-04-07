Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35C0835653A
	for <lists+linux-media@lfdr.de>; Wed,  7 Apr 2021 09:30:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233768AbhDGHbG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Apr 2021 03:31:06 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:55041 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233299AbhDGHbG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 7 Apr 2021 03:31:06 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id U2eJlABJQ43ycU2eMlPXXc; Wed, 07 Apr 2021 09:30:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1617780655; bh=HiovhSw7IvJpTXadCmtti0e+cPIsSYCvJmRC1aHG4BU=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=fv84menCqp+5MkN5qAY4MYfN1Cv/4fe1ALAajMZnniVw+3dqp3hJl7U46wa8uW7C5
         vHEepJ4mlO8is1QzV7uZ9hIEXU1TMBOnYbxOaf21kRvkvYDw7cDA0Rn9GzdFM1CmVY
         qPr4FbYp3jN8mrkBtfq4iM506blk+exVJkq2Nkl8YObcjgfkFb5vgIDC2OnHIZiZWe
         rUSZBYIyS6PiRRLDqD+qAb+M0PpZAsjwmJW0HPUMqD1Mn/qgv+nQ9AT/tDPb6Qt091
         G2Ny6YMVgjIe5WyGYc4yAyuAs8TcdM8trclAxK9Hl/LpP88zF4NzgiNTG4JPMxxlqo
         Nsfb7gysvn+LQ==
Subject: Re: [PATCH v2 00/30] media: atmel: atmel-isc: add support for xisc
To:     Eugen Hristev <eugen.hristev@microchip.com>,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210405155105.162529-1-eugen.hristev@microchip.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <d12caa29-2ed9-e99a-43ac-a2eb3413f1c6@xs4all.nl>
Date:   Wed, 7 Apr 2021 09:30:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210405155105.162529-1-eugen.hristev@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfNsM/RAXgd5azz7ICrRqZGw+dEssfgliUD4LKscmZIFveWs8gE561/RwIHnDZfe3QhWzVjo8jd8WYnd8w6pwJdLSj/4DC3Ne7l1fZT2nwS8SA+t8wgbb
 nPOJinBongpzzjrn0bLo2FDH4XSP7GDDNELzMzM+oQmhR90CSxORv6zp7NKLmyys1pxKBiebufuIutTvCqlAxc4q3TWxG6DmnZoBP5jPn32nk+MmhO6uV48m
 nh4VLJfjoqn7E36ABmx5CiTvRg33q+EoTYybW21uprSvAiqby3VQnEHqWvrA5Re7Qh9IwAufls9x+AOEJ4w729PHAVjV0TW0hXGHiWuyfo8QbvB1F0vbCwE5
 3QryamxEiLYXGYwPcYVQJl0wQS+ikA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Eugen,

On 05/04/2021 17:50, Eugen Hristev wrote:
> Hello,
> 
> This series adds support for a variant of the ISC named XISC.
> This block is present in the product named sama7g5.
> 
> I started by moving code around, the code which was specialized for sama5d2
> type of ISC, to have it inside the dedicated sama5d2 file.
> 
> I added several new pipeline elements to the code base, which would be common
> to sama5d2 and the new sama7g5, but only used by the new style pipeline.
> 
> I separated the input and output formats on a per-product separate array.
> 
> I added the new sama7g5 compatible driver for the xisc, which is similar with
> the sama5d2, but with differences in terms of DT, clocks and callbacks to
> specific operations.
> 
> I added the binding for the xisc by copying and modifying the existing
> isc one. I know that it has to be converted to yaml, and I will do that if
> it looks good.

This series looks good to me.

One thing that can be improved in a v3 is a short explanation of the various
abbreviations: CBV, RLP, HIS, DPC, etc.

Regards,

	Hans

> 
> Feedback is appreciated.
> Thanks,
> Eugen
> 
> Changes in v2:
> - Fixed krobot warnings with W=1 regarding functions with no prototype
> - Fixed new sama7g5 driver to use the new subdev fwnode API in kernel 5.12. my driver was
> based on old 5.10 style API.
> 
> Eugen Hristev (30):
>   media: atmel: atmel-isc: specialize gamma table into product specific
>   media: atmel: atmel-isc: specialize driver name constant
>   media: atmel: atmel-isc: add checks for limiting frame sizes
>   media: atmel: atmel-isc: specialize max width and max height
>   media: atmel: atmel-isc: specialize dma cfg
>   media: atmel: atmel-isc: extract CSC submodule config into separate
>     function
>   media: atmel: atmel-isc-base: add id to clock debug message
>   media: atmel: atmel-isc: create register offsets struct
>   media: atmel: atmel-isc: extract CBC submodule config into separate
>     function
>   media: atmel: atmel-isc: add CBC to the reg offsets struct
>   media: atmel: atmel-isc: add SUB422 and SUB420 to register offsets
>   media: atmel: atmel-isc: add RLP to register offsets
>   media: atmel: atmel-isc: add HIS to register offsets
>   media: atmel: atmel-isc: add DMA to register offsets
>   media: atmel: atmel-isc: add support for version register
>   media: atmel: atmel-isc: add his_entry to register offsets
>   media: atmel: atmel-isc: add register description for additional
>     modules
>   media: atmel: atmel-isc: extend pipeline with extra modules
>   media: atmel: atmel-isc: add CC initialization function
>   media: atmel: atmel-isc: create product specific v4l2 controls config
>   media: atmel: atmel-isc: create callback for DPC submodule product
>     specific
>   media: atmel: atmel-isc: create callback for GAM submodule product
>     specific
>   media: atmel: atmel-isc: create callback for RLP submodule product
>     specific
>   media: atmel: atmel-isc: move the formats list into product specific
>     code
>   media: atmel: atmel-isc: create an adapt pipeline callback for product
>     specific
>   media: atmel: atmel-isc-regs: add additional fields for sama7g5 type
>     pipeline
>   media: atmel: atmel-isc-base: add support for more formats and
>     additional pipeline modules
>   dt-bindings: media: atmel: add microchip-xisc binding
>   media: atmel: atmel-isc-sama5d2: remove duplicate define
>   media: atmel: atmel-isc: add microchip-xisc driver
> 
>  .../bindings/media/microchip-xisc.txt         |  64 ++
>  drivers/media/platform/Makefile               |   1 +
>  drivers/media/platform/atmel/Kconfig          |  11 +
>  drivers/media/platform/atmel/Makefile         |   2 +
>  drivers/media/platform/atmel/atmel-isc-base.c | 381 ++++-------
>  drivers/media/platform/atmel/atmel-isc-regs.h | 133 +++-
>  drivers/media/platform/atmel/atmel-isc.h      | 122 +++-
>  .../media/platform/atmel/atmel-sama5d2-isc.c  | 311 ++++++++-
>  .../media/platform/atmel/atmel-sama7g5-isc.c  | 643 ++++++++++++++++++
>  9 files changed, 1391 insertions(+), 277 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/microchip-xisc.txt
>  create mode 100644 drivers/media/platform/atmel/atmel-sama7g5-isc.c
> 

