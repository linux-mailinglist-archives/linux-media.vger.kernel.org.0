Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E4B434AA2
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 16:42:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727677AbfFDOmZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 10:42:25 -0400
Received: from casper.infradead.org ([85.118.1.10]:35300 "EHLO
        casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727182AbfFDOmY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 10:42:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=jGXSZoida99Zr828Wy+I4jTy8nOKQ6SIXYsko2Rk21Y=; b=im6NnmROYWaCWoheaTmjav6Z6P
        TWTfrKuvkPmYA3LEUgBsghxmirNugZc6IxGlVEOA+SPQlCj1RKSMnGBkIifpt22bUhb93T/+7wZl3
        CQgKzY1q+601T9vln1RgQB0rgDC9oo6MQUHMPoTJR3CRpI+t7yicJoKUCdUrrVdBkvOrRoFoH8lXJ
        ytxqc+Lbkp67ZcjuiUM8368BKeKANNbS8XHsIvTExpXw+1RI3+NX2ArnZ3IMrT6CrC5or5i5qC9S6
        ngnMflbKQLyw4ZB9p9FUwN/lCIwPwfMk/VnyX/iLqDcWrB4lIG7aZ9GGkehyCnI5aUMiwXTnctAz3
        0n/pvqSg==;
Received: from [179.182.172.34] (helo=coco.lan)
        by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hYAdo-0008Fz-26; Tue, 04 Jun 2019 14:42:20 +0000
Date:   Tue, 4 Jun 2019 11:42:15 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-media@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Greg KH <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Joe Perches <joe@perches.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: do not use C++ style comments in uapi headers
Message-ID: <20190604114215.2f8ee483@coco.lan>
In-Reply-To: <20190604111334.22182-1-yamada.masahiro@socionext.com>
References: <20190604111334.22182-1-yamada.masahiro@socionext.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue,  4 Jun 2019 20:13:34 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> escreveu:

> Linux kernel tolerates C++ style comments these days. Actually, the
> SPDX License tags for .c files start with //.
>=20
> On the other hand, uapi headers are written in more strict C, where
> the C++ comment style is forbidden.

I've seen that the current comments are more a discussion about
c++ style against "normal c" comments.

I don't have any strong opinion about using or not c++ style comments
on headers.

=46rom my side, though, I would prefer to use // for SPDX everywhere,
as using it on C, but avoiding on headers doesn't seem a good idea
to me, as people can easily mess with it, but that's just my two
cents.

-

Yet, with respect to those headers:

	include/uapi/linux/dvb/video.h
	include/uapi/linux/dvb/osd.h
	include/uapi/linux/dvb/audio.h

They belong to an old deprecated API, with just two drivers using it, with
was meant to control MPEG decoder hardware:

1) the av7110 DVB legacy driver - it is for a hardware developed on the
previous millennium and with is not manufactured anymore for a long time.
We didn't remove it yet just because we don't have any strong reason why
doing it;

2) by the V4L2 ivtv driver (with is also for a legacy driver) - with=20
doesn't support Digital TV. This was a first approach to control its
internal MPEG decoder and/or encoder. This was replaced several years
ago by another API designed to work with MPEG encoders/decoders,
using a more generic approach. The deprecated API is there just for
the sake of not breaking anything on userspace.

So, if you're working on it just to sanitize the headers, that's
fine, but please don't use them on any future project.

Regards,
Mauro

>=20
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>=20
>  include/uapi/linux/dvb/audio.h |   2 +-
>  include/uapi/linux/dvb/osd.h   | 170 ++++++++++++++++++++-------------
>  2 files changed, 103 insertions(+), 69 deletions(-)
>=20
> diff --git a/include/uapi/linux/dvb/audio.h b/include/uapi/linux/dvb/audi=
o.h
> index afeae063e640..977bed135e22 100644
> --- a/include/uapi/linux/dvb/audio.h
> +++ b/include/uapi/linux/dvb/audio.h
> @@ -52,7 +52,7 @@ typedef enum {
>  typedef struct audio_mixer {
>  	unsigned int volume_left;
>  	unsigned int volume_right;
> -  // what else do we need? bass, pass-through, ...
> +  /* what else do we need? bass, pass-through, ... */
>  } audio_mixer_t;
> =20
> =20
> diff --git a/include/uapi/linux/dvb/osd.h b/include/uapi/linux/dvb/osd.h
> index e163508b9ae8..723824ce3622 100644
> --- a/include/uapi/linux/dvb/osd.h
> +++ b/include/uapi/linux/dvb/osd.h
> @@ -28,74 +28,108 @@
>  #include <linux/compiler.h>
> =20
>  typedef enum {
> -  // All functions return -2 on "not open"
> -  OSD_Close=3D1,    // ()
> -  // Disables OSD and releases the buffers
> -  // returns 0 on success
> -  OSD_Open,       // (x0,y0,x1,y1,BitPerPixel[2/4/8](color&0x0F),mix[0..=
15](color&0xF0))
> -  // Opens OSD with this size and bit depth
> -  // returns 0 on success, -1 on DRAM allocation error, -2 on "already o=
pen"
> -  OSD_Show,       // ()
> -  // enables OSD mode
> -  // returns 0 on success
> -  OSD_Hide,       // ()
> -  // disables OSD mode
> -  // returns 0 on success
> -  OSD_Clear,      // ()
> -  // Sets all pixel to color 0
> -  // returns 0 on success
> -  OSD_Fill,       // (color)
> -  // Sets all pixel to color <col>
> -  // returns 0 on success
> -  OSD_SetColor,   // (color,R{x0},G{y0},B{x1},opacity{y1})
> -  // set palette entry <num> to <r,g,b>, <mix> and <trans> apply
> -  // R,G,B: 0..255
> -  // R=3DRed, G=3DGreen, B=3DBlue
> -  // opacity=3D0:      pixel opacity 0% (only video pixel shows)
> -  // opacity=3D1..254: pixel opacity as specified in header
> -  // opacity=3D255:    pixel opacity 100% (only OSD pixel shows)
> -  // returns 0 on success, -1 on error
> -  OSD_SetPalette, // (firstcolor{color},lastcolor{x0},data)
> -  // Set a number of entries in the palette
> -  // sets the entries "firstcolor" through "lastcolor" from the array "d=
ata"
> -  // data has 4 byte for each color:
> -  // R,G,B, and a opacity value: 0->transparent, 1..254->mix, 255->pixel
> -  OSD_SetTrans,   // (transparency{color})
> -  // Sets transparency of mixed pixel (0..15)
> -  // returns 0 on success
> -  OSD_SetPixel,   // (x0,y0,color)
> -  // sets pixel <x>,<y> to color number <col>
> -  // returns 0 on success, -1 on error
> -  OSD_GetPixel,   // (x0,y0)
> -  // returns color number of pixel <x>,<y>,  or -1
> -  OSD_SetRow,     // (x0,y0,x1,data)
> -  // fills pixels x0,y through  x1,y with the content of data[]
> -  // returns 0 on success, -1 on clipping all pixel (no pixel drawn)
> -  OSD_SetBlock,   // (x0,y0,x1,y1,increment{color},data)
> -  // fills pixels x0,y0 through  x1,y1 with the content of data[]
> -  // inc contains the width of one line in the data block,
> -  // inc<=3D0 uses blockwidth as linewidth
> -  // returns 0 on success, -1 on clipping all pixel
> -  OSD_FillRow,    // (x0,y0,x1,color)
> -  // fills pixels x0,y through  x1,y with the color <col>
> -  // returns 0 on success, -1 on clipping all pixel
> -  OSD_FillBlock,  // (x0,y0,x1,y1,color)
> -  // fills pixels x0,y0 through  x1,y1 with the color <col>
> -  // returns 0 on success, -1 on clipping all pixel
> -  OSD_Line,       // (x0,y0,x1,y1,color)
> -  // draw a line from x0,y0 to x1,y1 with the color <col>
> -  // returns 0 on success
> -  OSD_Query,      // (x0,y0,x1,y1,xasp{color}}), yasp=3D11
> -  // fills parameters with the picture dimensions and the pixel aspect r=
atio
> -  // returns 0 on success
> -  OSD_Test,       // ()
> -  // draws a test picture. for debugging purposes only
> -  // returns 0 on success
> -// TODO: remove "test" in final version
> -  OSD_Text,       // (x0,y0,size,color,text)
> -  OSD_SetWindow, //  (x0) set window with number 0<x0<8 as current
> -  OSD_MoveWindow, //  move current window to (x0, y0)
> -  OSD_OpenRaw,	// Open other types of OSD windows
> +	/* All functions return -2 on "not open" */
> +	OSD_Close=3D1,	/* () */
> +	/*
> +	 * Disables OSD and releases the buffers
> +	 * returns 0 on success
> +	 */
> +	OSD_Open,	/* (x0,y0,x1,y1,BitPerPixel[2/4/8](color&0x0F),mix[0..15](col=
or&0xF0)) */
> +	/*
> +	 * Opens OSD with this size and bit depth
> +	 * returns 0 on success, -1 on DRAM allocation error, -2 on "already op=
en"
> +	 */
> +	OSD_Show,	/* () */
> +	/*
> +	 * enables OSD mode
> +	 * returns 0 on success
> +	 */
> +	OSD_Hide,	/* () */
> +	/*
> +	 * disables OSD mode
> +	 * returns 0 on success
> +	 */
> +	OSD_Clear,	/* () */
> +	/*
> +	 * Sets all pixel to color 0
> +	 * returns 0 on success
> +	 */
> +	OSD_Fill,	/* (color) */
> +	/*
> +	 * Sets all pixel to color <col>
> +	 * returns 0 on success
> +	 */
> +	OSD_SetColor,	/* (color,R{x0},G{y0},B{x1},opacity{y1}) */
> +	/*
> +	 * set palette entry <num> to <r,g,b>, <mix> and <trans> apply
> +	 * R,G,B: 0..255
> +	 * R=3DRed, G=3DGreen, B=3DBlue
> +	 * opacity=3D0:      pixel opacity 0% (only video pixel shows)
> +	 * opacity=3D1..254: pixel opacity as specified in header
> +	 * opacity=3D255:    pixel opacity 100% (only OSD pixel shows)
> +	 * returns 0 on success, -1 on error
> +	 */
> +	OSD_SetPalette,	/* (firstcolor{color},lastcolor{x0},data) */
> +	/*
> +	 * Set a number of entries in the palette
> +	 * sets the entries "firstcolor" through "lastcolor" from the array "da=
ta"
> +	 * data has 4 byte for each color:
> +	 * R,G,B, and a opacity value: 0->transparent, 1..254->mix, 255->pixel
> +	 */
> +	OSD_SetTrans,	/* (transparency{color}) */
> +	/*
> +	 * Sets transparency of mixed pixel (0..15)
> +	 * returns 0 on success
> +	 */
> +	OSD_SetPixel,	/* (x0,y0,color) */
> +	/*
> +	 * sets pixel <x>,<y> to color number <col>
> +	 * returns 0 on success, -1 on error
> +	 */
> +	OSD_GetPixel,	/* (x0,y0) */
> +	/* returns color number of pixel <x>,<y>,  or -1 */
> +	OSD_SetRow,	/* (x0,y0,x1,data) */
> +	/*
> +	 * fills pixels x0,y through  x1,y with the content of data[]
> +	 * returns 0 on success, -1 on clipping all pixel (no pixel drawn)
> +	 */
> +	OSD_SetBlock,	/* (x0,y0,x1,y1,increment{color},data) */
> +	/*
> +	 * fills pixels x0,y0 through  x1,y1 with the content of data[]
> +	 * inc contains the width of one line in the data block,
> +	 * inc<=3D0 uses blockwidth as linewidth
> +	 * returns 0 on success, -1 on clipping all pixel
> +	 */
> +	OSD_FillRow,	/* (x0,y0,x1,color) */
> +	/*
> +	 * fills pixels x0,y through  x1,y with the color <col>
> +	 * returns 0 on success, -1 on clipping all pixel
> +	 */
> +	OSD_FillBlock,	/* (x0,y0,x1,y1,color) */
> +	/*
> +	 * fills pixels x0,y0 through  x1,y1 with the color <col>
> +	 * returns 0 on success, -1 on clipping all pixel
> +	 */
> +	OSD_Line,	/* (x0,y0,x1,y1,color) */
> +	/*
> +	 * draw a line from x0,y0 to x1,y1 with the color <col>
> +	 * returns 0 on success
> +	 */
> +	OSD_Query,	/* (x0,y0,x1,y1,xasp{color}}), yasp=3D11 */
> +	/*
> +	 * fills parameters with the picture dimensions and the pixel aspect ra=
tio
> +	 * returns 0 on success
> +	 */
> +	OSD_Test,       /* () */
> +	/*
> +	 * draws a test picture. for debugging purposes only
> +	 * returns 0 on success
> +	 * TODO: remove "test" in final version
> +	 */
> +	OSD_Text,	/* (x0,y0,size,color,text) */
> +	OSD_SetWindow,	/* (x0) set window with number 0<x0<8 as current */
> +	OSD_MoveWindow,	/* move current window to (x0, y0) */
> +	OSD_OpenRaw,	/* Open other types of OSD windows */
>  } OSD_Command;
> =20
>  typedef struct osd_cmd_s {



Thanks,
Mauro
