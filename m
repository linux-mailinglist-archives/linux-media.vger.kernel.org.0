Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEAEC40169D
	for <lists+linux-media@lfdr.de>; Mon,  6 Sep 2021 08:52:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239599AbhIFGxF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Sep 2021 02:53:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:36354 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239400AbhIFGxE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 6 Sep 2021 02:53:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CF49860F21;
        Mon,  6 Sep 2021 06:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630911120;
        bh=h0WT/Jjj8wKQYQF+5gwJkPL2TfNqu98BCj64BgayA7M=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=FulvDIvLkR5PGRPFP547Bt52CBBwmIth2844DXgVb6XXg68tZk8keaPt6YHDBf2uA
         5zxS0C6YIL4AHINEw4PgNj30YY6cCH0PGM0slvrYtVxA7p1/hDdFwdcWSHl7R6AlmN
         t2NuD/XgYqZxt0/rLYaOz7EASBGRJLc3g3MPWDinA7qqn5phbB4HwwWoQTicUbyk4X
         aL1u4mXeT864zX6iAL5uRbCsZKtBWZrHL98MsHH0n6qom2SvF3NhzJ3srZB6W5tftW
         9An3xv6TfdIuRzklCZErXZIgjFBMkgSNqvS809r+bYOh46D34M76TzNx+CT9FfIW6q
         ONhzS+UWH2qIQ==
Date:   Mon, 6 Sep 2021 08:51:53 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
        linux-media@vger.kernel.org,
        Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] media: s5p-jpeg: change "RST" to "RSET" to fix build
 warnings
Message-ID: <20210906085153.58edc116@coco.lan>
In-Reply-To: <20210905235715.12154-1-rdunlap@infradead.org>
References: <20210905235715.12154-1-rdunlap@infradead.org>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sun,  5 Sep 2021 16:57:15 -0700
Randy Dunlap <rdunlap@infradead.org> escreveu:

> The use of a macro named 'RST' conflicts with one of the same name
> in arch/mips/include/asm/mach-rc32434/rb.h. This causes build
> warnings on some MIPS builds.
> 
> Change the use of RST to the name RSET.
> 
> Fixes these build warnings:
> 
> In file included from ../drivers/media/platform/s5p-jpeg/jpeg-hw-exynos3250.c:14:
> ../drivers/media/platform/s5p-jpeg/jpeg-core.h:43: warning: "RST" redefined
>    43 | #define RST                             0xd0
>       | 
> ../arch/mips/include/asm/mach-rc32434/rb.h:13: note: this is the location of the previous definition
>    13 | #define RST             (1 << 15)
> 
> In file included from ../drivers/media/platform/s5p-jpeg/jpeg-hw-s5p.c:13:
> ../drivers/media/platform/s5p-jpeg/jpeg-core.h:43: warning: "RST" redefined
>    43 | #define RST                             0xd0
> ../arch/mips/include/asm/mach-rc32434/rb.h:13: note: this is the location of the previous definition
>    13 | #define RST             (1 << 15)
> 
> In file included from ../drivers/media/platform/s5p-jpeg/jpeg-hw-exynos4.c:12:
> ../drivers/media/platform/s5p-jpeg/jpeg-core.h:43: warning: "RST" redefined
>    43 | #define RST                             0xd0
> ../arch/mips/include/asm/mach-rc32434/rb.h:13: note: this is the location of the previous definition
>    13 | #define RST             (1 << 15)
> 
> In file included from ../drivers/media/platform/s5p-jpeg/jpeg-core.c:31:
> ../drivers/media/platform/s5p-jpeg/jpeg-core.h:43: warning: "RST" redefined
>    43 | #define RST                             0xd0
> ../arch/mips/include/asm/mach-rc32434/rb.h:13: note: this is the location of the previous definition
>    13 | #define RST             (1 << 15)
> 
> Fixes: bb677f3ac434 ("[media] Exynos4 JPEG codec v4l2 driver")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: linux-media@vger.kernel.org
> Cc: Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  drivers/media/platform/s5p-jpeg/jpeg-core.c |    2 +-
>  drivers/media/platform/s5p-jpeg/jpeg-core.h |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> --- linux-next-20210903.orig/drivers/media/platform/s5p-jpeg/jpeg-core.c
> +++ linux-next-20210903/drivers/media/platform/s5p-jpeg/jpeg-core.c
> @@ -1203,7 +1203,7 @@ static bool s5p_jpeg_parse_hdr(struct s5
>  			break;
>  
>  		/* skip payload-less markers */
> -		case RST ... RST + 7:
> +		case RSET ... RSET + 7:
>  		case SOI:
>  		case EOI:
>  		case TEM:
> --- linux-next-20210903.orig/drivers/media/platform/s5p-jpeg/jpeg-core.h
> +++ linux-next-20210903/drivers/media/platform/s5p-jpeg/jpeg-core.h
> @@ -40,7 +40,7 @@
>  #define TEM				0x01
>  #define SOF0				0xc0
>  #define DHT				0xc4
> -#define RST				0xd0
> +#define RSET				0xd0
>  #define SOI				0xd8
>  #define EOI				0xd9
>  #define	SOS				0xda

I don't like this change, for a couple reasons:

1. the JPEG marker is "RST" (actually, "RST0") instead of "RSET" 
   (see pag. 36 https://www.w3.org/Graphics/JPEG/itu-t81.pdf). The
   close it sticks with the JPEG standard, the better;

2. better to add a namespace here, as other JPEG markers like SOS,
   SOI and EOI seems to have a high chance of happening somewhere
   else on other kernel headers in the future.

So, IMO, the best would be to rename all those markers as a hole, with
something similar to:

	$ for i in TEM SOF0 DHT RST SOI EOI SOS DQT DHP; do sed "s,\b$i\b,JPEG_MARKER_$i,g" -i drivers/media/platform/s5p-jpeg/*.[ch]; done

and manually adjust the patch, as at least this hunk could be
improved:

	@@ -187,11 +187,11 @@ struct s5p_jpeg_marker {
	  * @fmt:       driver-specific format of this queue
	  * @w:         image width
	  * @h:         image height
	- * @sos:       SOS marker's position relative to the buffer beginning
	- * @dht:       DHT markers' positions relative to the buffer beginning
	- * @dqt:       DQT markers' positions relative to the buffer beginning
	- * @sof:       SOF0 marker's position relative to the buffer beginning
	- * @sof_len:   SOF0 marker's payload length (without length field itself)
	+ * @sos:       JPEG_MARKER_SOS marker's position relative to the buffer beginning
	+ * @dht:       JPEG_MARKER_DHT markers' positions relative to the buffer beginning
	+ * @dqt:       JPEG_MARKER_DQT markers' positions relative to the buffer beginning
	+ * @sof:       JPEG_MARKER_SOF0 marker's position relative to the buffer beginning
	+ * @sof_len:   JPEG_MARKER_SOF0 marker's payload length (without length field itself)
	  * @size:      image buffer size in bytes
	  */

to avoid repeating the word marker.

Thanks,
Mauro
