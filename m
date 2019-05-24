Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3945929853
	for <lists+linux-media@lfdr.de>; Fri, 24 May 2019 14:55:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391316AbfEXMzI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 May 2019 08:55:08 -0400
Received: from casper.infradead.org ([85.118.1.10]:52268 "EHLO
        casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390946AbfEXMzH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 May 2019 08:55:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=cyQ2oCePc4465xvjRRiSWu3xnwrETc8dIcA8pz3EwJ0=; b=E4iX4UX6mglLfAHRlj9/ZWx+Pu
        yjmQqjwNzpxIGvni7RskChjxO4ZkWz+4AxWjRGdL/6NO5FLorU4dYd5TmXiM8JGzpnn2J0v82gsPf
        oap2Y2VrPjk8iSXtkTbSk5vr3DIKak5KbRd3qKasC28pEf8aVn+a5aCiXaeImaL5VKHV5kxDl+8rL
        DsC2gwUE9Qy87vP6utPhnfZeTZP+gCCKcj8BxEuy+9oKbpuSf6UK8Pj+l8+B5TcI/BthdUA897BIi
        iaRO0las5/BQy59Sv+piPNCgL/9LhSMmy3jISAVESqnN2tFQ3Sbo91uVu5WwTB+7vmY0prvMP3Mvo
        cLGtF+rw==;
Received: from 177.97.63.247.dynamic.adsl.gvt.net.br ([177.97.63.247] helo=coco.lan)
        by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hU9io-0006hg-JZ; Fri, 24 May 2019 12:54:55 +0000
Date:   Fri, 24 May 2019 09:54:48 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Hans Verkuil <hansverk@cisco.com>, od@zcrc.me,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v3 2/3] media: uapi: Add RGB bus formats for the
 GiantPlus GPM940B0 panel
Message-ID: <20190524095448.5eeddc06@coco.lan>
In-Reply-To: <20190422093722.4344-2-paul@crapouillou.net>
References: <20190422093722.4344-1-paul@crapouillou.net>
        <20190422093722.4344-2-paul@crapouillou.net>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 22 Apr 2019 11:37:21 +0200
Paul Cercueil <paul@crapouillou.net> escreveu:

> The GiantPlus GPM940B0 is a 24-bit TFT panel where the RGB components
> are transferred sequentially on a 8-bit bus.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
> 
> Notes:
>     v2: New patch
>     
>     v3: No change
> 
>  include/uapi/linux/media-bus-format.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
> index d6a5a3bfe6c4..f31724d6cd40 100644
> --- a/include/uapi/linux/media-bus-format.h
> +++ b/include/uapi/linux/media-bus-format.h
> @@ -34,7 +34,7 @@
>  
>  #define MEDIA_BUS_FMT_FIXED			0x0001
>  
> -/* RGB - next is	0x101b */
> +/* RGB - next is	0x101d */
>  #define MEDIA_BUS_FMT_RGB444_1X12		0x1016
>  #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE	0x1001
>  #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE	0x1002
> @@ -54,6 +54,8 @@
>  #define MEDIA_BUS_FMT_RGB888_1X24		0x100a
>  #define MEDIA_BUS_FMT_RGB888_2X12_BE		0x100b
>  #define MEDIA_BUS_FMT_RGB888_2X12_LE		0x100c
> +#define MEDIA_BUS_FMT_RGB888_3X8_BE		0x101b
> +#define MEDIA_BUS_FMT_RGB888_3X8_LE		0x101c
>  #define MEDIA_BUS_FMT_RGB888_1X7X4_SPWG		0x1011
>  #define MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA	0x1012
>  #define MEDIA_BUS_FMT_ARGB8888_1X32		0x100d

You should also patch the documentation text at:

	Documentation/media/uapi/v4l/subdev-formats.rst

In order to describe the new formats that will be included.

(also patch needs to be rebased, as it conflicts to some other
new formats added there)

Thanks,
Mauro
