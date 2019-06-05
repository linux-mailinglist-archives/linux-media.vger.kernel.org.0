Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B57036836
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 01:42:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726734AbfFEXmK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jun 2019 19:42:10 -0400
Received: from casper.infradead.org ([85.118.1.10]:48604 "EHLO
        casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726532AbfFEXmJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jun 2019 19:42:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=IllZgL/Tvx6ZdOkE8cT0VBvSJHPyC9Kw4E2FxJB9wHw=; b=bm2K2e36Q7ozSQDpAX71FjdUg5
        t45M9rkJZI5xIcP2xoJLYpzZUzxXj5u12tnAWWX/54JMNifGsA3V/jP6Zrl1YcjUW2xd2uoS2797t
        rWjOKTkQkRR2q3GJokt0uftfimyVD9gZj99nAn+sKuqn/Lz+4J14aO/TTgBXbwebFpm1HG5ZbQc5r
        r+lJ//XEq817K3pBD3daHKUeJc6792qKmE1ORtKU5Pw6mhY47ZxiYcbQKWIuiC2FZ1ZTi/l3mQy7p
        JLKVZGXWt/OZJe8s1MBs5i/bBZYZEHgeKBqh22giDHB2znPppochw2XIRxntaEgnxgoiOUv181hH9
        ff7H7oiQ==;
Received: from [179.182.172.34] (helo=coco.lan)
        by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hYfXa-0004Gc-V0; Wed, 05 Jun 2019 23:41:59 +0000
Date:   Wed, 5 Jun 2019 20:41:52 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        od@zcrc.me
Subject: Re: [PATCH v5 2/3] media: uapi: Add MEDIA_BUS_FMT_RGB888_3X8 media
 bus format
Message-ID: <20190605204152.36f81ebd@coco.lan>
In-Reply-To: <20190605222247.25657-2-paul@crapouillou.net>
References: <20190605222247.25657-1-paul@crapouillou.net>
        <20190605222247.25657-2-paul@crapouillou.net>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu,  6 Jun 2019 00:22:46 +0200
Paul Cercueil <paul@crapouillou.net> escreveu:

> This patch adds MEDIA_BUS_FMT_RGB888_3X8, used for the GiantPlus
> GPM940B0 24-bit TFT panel, where the RGB components are transferred
> sequentially on a 8-bit bus.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Looks ok to me. Feel free to apply via DRM tree.

Acked-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

> ---
> 
> Notes:
>     v2: New patch
>     
>     v3: No change
>     
>     v4: Add only MEDIA_BUS_FMT_RGB888_3X8, as we don't have to care about
>         endianness
>     
>     v5: Also update Documentation/media/uapi/v4l/subdev-formats.rst
> 
>  .../media/uapi/v4l/subdev-formats.rst         | 107 ++++++++++++++++++
>  include/uapi/linux/media-bus-format.h         |   3 +-
>  2 files changed, 109 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/media/uapi/v4l/subdev-formats.rst b/Documentation/media/uapi/v4l/subdev-formats.rst
> index ab1a48a5ae80..f4f8de31ac63 100644
> --- a/Documentation/media/uapi/v4l/subdev-formats.rst
> +++ b/Documentation/media/uapi/v4l/subdev-formats.rst
> @@ -1305,6 +1305,113 @@ The following tables list existing packed RGB formats.
>        - g\ :sub:`6`
>        - g\ :sub:`5`
>        - g\ :sub:`4`
> +    * .. _MEDIA-BUS-FMT-RGB888-3X8:
> +
> +      - MEDIA_BUS_FMT_RGB888_3X8
> +      - 0x101c
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      - r\ :sub:`7`
> +      - r\ :sub:`6`
> +      - r\ :sub:`5`
> +      - r\ :sub:`4`
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
> +    * -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      - g\ :sub:`7`
> +      - g\ :sub:`6`
> +      - g\ :sub:`5`
> +      - g\ :sub:`4`
> +      - g\ :sub:`3`
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +    * -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      - b\ :sub:`7`
> +      - b\ :sub:`6`
> +      - b\ :sub:`5`
> +      - b\ :sub:`4`
> +      - b\ :sub:`3`
> +      - b\ :sub:`2`
> +      - b\ :sub:`1`
> +      - b\ :sub:`0`
>      * .. _MEDIA-BUS-FMT-ARGB888-1X32:
>  
>        - MEDIA_BUS_FMT_ARGB888_1X32
> diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
> index 2a6b253cfb05..16c1fa2d89a4 100644
> --- a/include/uapi/linux/media-bus-format.h
> +++ b/include/uapi/linux/media-bus-format.h
> @@ -34,7 +34,7 @@
>  
>  #define MEDIA_BUS_FMT_FIXED			0x0001
>  
> -/* RGB - next is	0x101c */
> +/* RGB - next is	0x101d */
>  #define MEDIA_BUS_FMT_RGB444_1X12		0x1016
>  #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE	0x1001
>  #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE	0x1002
> @@ -55,6 +55,7 @@
>  #define MEDIA_BUS_FMT_RGB888_1X24		0x100a
>  #define MEDIA_BUS_FMT_RGB888_2X12_BE		0x100b
>  #define MEDIA_BUS_FMT_RGB888_2X12_LE		0x100c
> +#define MEDIA_BUS_FMT_RGB888_3X8		0x101c
>  #define MEDIA_BUS_FMT_RGB888_1X7X4_SPWG		0x1011
>  #define MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA	0x1012
>  #define MEDIA_BUS_FMT_ARGB8888_1X32		0x100d



Thanks,
Mauro
