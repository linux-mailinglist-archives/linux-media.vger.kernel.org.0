Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D61B9360A91
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 15:35:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233149AbhDONfY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Apr 2021 09:35:24 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:34999 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232976AbhDONfX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Apr 2021 09:35:23 -0400
Received: from [192.168.2.10] ([84.202.3.209])
        by smtp.xs4all.nl with ESMTPA
        id X28vl3dYIsMyaX28zlUKlG; Thu, 15 Apr 2021 15:34:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1618493698; bh=FXifV65pE61uKnPlNuS9Op0IO7BsQpC2YhQnV9MPNgM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=c7KXrLnFCG02LlEYZlmqO5EXxnTjBGniCMLQlQXyOvdZD5Hi3ymU5L9YpEcG1kYXQ
         1vRmgqKi/M3aT2zW04jqJNJW7JKPAEx7RUllwQnage+WN6TMQpU6YR9+iupgBNT6Ij
         kZWPe/MSE5DPLbY9RgjhqeIqQpzfi7BKR65CvspG5unFZAEkjNBTvP+f+opegwB1FL
         +pTIWjrSBIi65mTd+ehzHJ5feujk/vruN6M/1VfdJkatnreAyayliz2O79ebHTPmSp
         qJ2Y519HPxIU4ILDaMsmFDtCukdOv+46crcF80pddugOiUSTqW/tutM6xNK1mR/ver
         ke5wPywtwoJ4Q==
Subject: Re: Subject: [PATCH v4] staging: media: zoran: add '*' in
 long(multi-line) comments
To:     Mitali Borkar <mitaliborkar810@gmail.com>, clabbe@baylibre.com,
        mchehab@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        mitali_s@me.iitr.ac.in
References: <YHXUQc+IgZ1y9TQu@kali>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <9b208f9f-dd12-50a7-514a-85344d533183@xs4all.nl>
Date:   Thu, 15 Apr 2021 15:34:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YHXUQc+IgZ1y9TQu@kali>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfKIJ5q7BfbvT8Ko1ksDnPvvdg7HGzjuxCJJNEPYvkbc1R6HgIed3i1W8HGfkye0DB+eoLVHlNbTr5S6QjtQMTbvn67lc4mUms3C2uJXUL1l8XDs/Q/Wc
 fAVqHvbquWd585fkIYqmTkjQrtcjiOlcDc302KechXOco+gok4B462fGzfkevv1IUHNZqPX9BTG5tgSMrgcwPwkVVHjliqcKDO/f8+SaoM3B2gwxnVY0Z93E
 yEVC5AcS+lDNlFLLbKfxOzoG+2p4a3d/ZFKEMmt3U2j5n0I8YpEzY52c/tUyIM0Z4ADSrk5zxCrcN09K9cpO770nCo43t6gkscl7GSc3tD6ccCGKHu5k7qx/
 YIdUyMzqWlm69t7g1HT47AXaEnFDuZigpagAlSFAxm9Zk8NMmipOQsqIBMbbLwBZNFBf6AxvfWtPvsRo0E4x/knFFxsZC3WokM6Asgcihm48MRvSUoI2tyKx
 3Wmt4DeB0gj4EQGYQs0MlBNXtkodT0MOkYtC4w==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mitali,

You have 'Subject' in the Subject line. That looks weird...

On 13/04/2021 19:26, Mitali Borkar wrote:
> Added '*' before every line inside long(multi-line) comments. Removed
> '*/' from end of the comment line and added to next line as per linux
> kernel coding style. Aligned '*' accordingly to make code neater.
> 
> Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> ---
> Changes from v3:- Rebased this patch and made changes against mainline
> code. 
> Changes from v2:- made style changes in code according to linux kernel
> coding style for long comments.
> Changes from v1:- Changes made in code according to linux kernel coding
> style for long(multi-line) comments.
> 
>  drivers/staging/media/zoran/zr36050.c | 192 +++++++++++++++-----------
>  1 file changed, 112 insertions(+), 80 deletions(-)
> 
> diff --git a/drivers/staging/media/zoran/zr36050.c b/drivers/staging/media/zoran/zr36050.c
> index 2826f4e5d37b..a1084aa142e7 100644
> --- a/drivers/staging/media/zoran/zr36050.c
> +++ b/drivers/staging/media/zoran/zr36050.c
> @@ -24,8 +24,11 @@
>  /* codec io API */
>  #include "videocodec.h"
>  
> -/* it doesn't make sense to have more than 20 or so,
> -  just to prevent some unwanted loops */
> +/*
> + * it doesn't make sense to have more than 20 or so,
> + * just to prevent some unwanted loops
> + */
> +

Why add an empty line here? Since the comment describes the define, you expect
that the define follows directly after the comment.

>  #define MAX_CODECS 20
>  
>  /* amount of chips attached via this driver */
> @@ -43,10 +46,11 @@ MODULE_PARM_DESC(debug, "Debug level (0-4)");
>  	} while (0)
>  
>  /* =========================================================================

/* should be on a line by itself:

/*
 * =========================================================================

That said, I would just delete those '===============' lines: they don't really
add anything.

Regards,

	Hans

> -   Local hardware I/O functions:
> -
> -   read/write via codec layer (registers are located in the master device)
> -   ========================================================================= */
> + * Local hardware I/O functions:
> + *
> + * read/write via codec layer (registers are located in the master device)
> + * =========================================================================
> + */
>  
>  /* read and write functions */
>  static u8 zr36050_read(struct zr36050 *ptr, u16 reg)
> @@ -80,10 +84,11 @@ static void zr36050_write(struct zr36050 *ptr, u16 reg, u8 value)
>  }
>  
>  /* =========================================================================
> -   Local helper function:
> -
> -   status read
> -   ========================================================================= */
> + * Local helper function:
> + *
> + * status read
> + * =========================================================================
> + */
>  
>  /* status is kept in datastructure */
>  static u8 zr36050_read_status1(struct zr36050 *ptr)
> @@ -95,10 +100,11 @@ static u8 zr36050_read_status1(struct zr36050 *ptr)
>  }
>  
>  /* =========================================================================
> -   Local helper function:
> -
> -   scale factor read
> -   ========================================================================= */
> + * Local helper function:
> + *
> + * scale factor read
> + * =========================================================================
> + */
>  
>  /* scale factor is kept in datastructure */
>  static u16 zr36050_read_scalefactor(struct zr36050 *ptr)
> @@ -112,10 +118,11 @@ static u16 zr36050_read_scalefactor(struct zr36050 *ptr)
>  }
>  
>  /* =========================================================================
> -   Local helper function:
> -
> -   wait if codec is ready to proceed (end of processing) or time is over
> -   ========================================================================= */
> + * Local helper function:
> + *
> + * wait if codec is ready to proceed (end of processing) or time is over
> + * =========================================================================
> + */
>  
>  static void zr36050_wait_end(struct zr36050 *ptr)
>  {
> @@ -133,10 +140,11 @@ static void zr36050_wait_end(struct zr36050 *ptr)
>  }
>  
>  /* =========================================================================
> -   Local helper function:
> -
> -   basic test of "connectivity", writes/reads to/from memory the SOF marker
> -   ========================================================================= */
> + * Local helper function:
> + *
> + * basic test of "connectivity", writes/reads to/from memory the SOF marker
> + * =========================================================================
> + */
>  
>  static int zr36050_basic_test(struct zr36050 *ptr)
>  {
> @@ -174,10 +182,11 @@ static int zr36050_basic_test(struct zr36050 *ptr)
>  }
>  
>  /* =========================================================================
> -   Local helper function:
> -
> -   simple loop for pushing the init datasets
> -   ========================================================================= */
> + * Local helper function:
> + *
> + * simple loop for pushing the init datasets
> + * =========================================================================
> + */
>  
>  static int zr36050_pushit(struct zr36050 *ptr, u16 startreg, u16 len, const char *data)
>  {
> @@ -192,15 +201,16 @@ static int zr36050_pushit(struct zr36050 *ptr, u16 startreg, u16 len, const char
>  }
>  
>  /* =========================================================================
> -   Basic datasets:
> -
> -   jpeg baseline setup data (you find it on lots places in internet, or just
> -   extract it from any regular .jpg image...)
> -
> -   Could be variable, but until it's not needed it they are just fixed to save
> -   memory. Otherwise expand zr36050 structure with arrays, push the values to
> -   it and initialize from there, as e.g. the linux zr36057/60 driver does it.
> -   ========================================================================= */
> + * Basic datasets:
> + *
> + * jpeg baseline setup data (you find it on lots places in internet, or just
> + * extract it from any regular .jpg image...)
> + *
> + * Could be variable, but until it's not needed it they are just fixed to save
> + * memory. Otherwise expand zr36050 structure with arrays, push the values to
> + * it and initialize from there, as e.g. the linux zr36057/60 driver does it.
> + * =========================================================================
> + */
>  
>  static const char zr36050_dqt[0x86] = {
>  	0xff, 0xdb,		//Marker: DQT
> @@ -294,16 +304,19 @@ static const char zr36050_decimation_h[8] = { 2, 1, 1, 0, 0, 0, 0, 0 };
>  static const char zr36050_decimation_v[8] = { 1, 1, 1, 0, 0, 0, 0, 0 };
>  
>  /* =========================================================================
> -   Local helper functions:
> -
> -   calculation and setup of parameter-dependent JPEG baseline segments
> -   (needed for compression only)
> -   ========================================================================= */
> + * Local helper functions:
> + *
> + * calculation and setup of parameter-dependent JPEG baseline segments
> + * (needed for compression only)
> + * =========================================================================
> + */
>  
>  /* ------------------------------------------------------------------------- */
>  
> -/* SOF (start of frame) segment depends on width, height and sampling ratio
> -			 of each color component */
> +/*
> + * SOF (start of frame) segment depends on width, height and sampling ratio
> + * of each color component
> + */
>  
>  static int zr36050_set_sof(struct zr36050 *ptr)
>  {
> @@ -333,8 +346,10 @@ static int zr36050_set_sof(struct zr36050 *ptr)
>  
>  /* ------------------------------------------------------------------------- */
>  
> -/* SOS (start of scan) segment depends on the used scan components
> -			of each color component */
> +/*
> + * SOS (start of scan) segment depends on the used scan components
> + * of each color component
> + */
>  
>  static int zr36050_set_sos(struct zr36050 *ptr)
>  {
> @@ -378,13 +393,14 @@ static int zr36050_set_dri(struct zr36050 *ptr)
>  }
>  
>  /* =========================================================================
> -   Setup function:
> -
> -   Setup compression/decompression of Zoran's JPEG processor
> -   ( see also zoran 36050 manual )
> -
> -   ... sorry for the spaghetti code ...
> -   ========================================================================= */
> + * Setup function:
> + *
> + * Setup compression/decompression of Zoran's JPEG processor
> + * ( see also zoran 36050 manual )
> + *
> + * ... sorry for the spaghetti code ...
> + * =========================================================================
> + */
>  static void zr36050_init(struct zr36050 *ptr)
>  {
>  	int sum = 0;
> @@ -419,8 +435,10 @@ static void zr36050_init(struct zr36050 *ptr)
>  		sum += zr36050_set_sos(ptr);
>  		sum += zr36050_set_dri(ptr);
>  
> -		/* setup the fixed jpeg tables - maybe variable, though -
> -		 * (see table init section above) */
> +		/*
> +		 * setup the fixed jpeg tables - maybe variable, though -
> +		 * (see table init section above)
> +		 */
>  		dprintk(3, "%s: write DQT, DHT, APP\n", ptr->name);
>  		sum += zr36050_pushit(ptr, ZR050_DQT_IDX,
>  				      sizeof(zr36050_dqt), zr36050_dqt);
> @@ -531,13 +549,16 @@ static void zr36050_init(struct zr36050 *ptr)
>  }
>  
>  /* =========================================================================
> -   CODEC API FUNCTIONS
> -
> -   this functions are accessed by the master via the API structure
> -   ========================================================================= */
> + * CODEC API FUNCTIONS
> + *
> + * this functions are accessed by the master via the API structure
> + * =========================================================================
> + */
>  
> -/* set compression/expansion mode and launches codec -
> -   this should be the last call from the master before starting processing */
> +/*
> + * set compression/expansion mode and launches codec -
> + * this should be the last call from the master before starting processing
> + */
>  static int zr36050_set_mode(struct videocodec *codec, int mode)
>  {
>  	struct zr36050 *ptr = (struct zr36050 *)codec->data;
> @@ -564,9 +585,11 @@ static int zr36050_set_video(struct videocodec *codec, const struct tvnorm *norm
>  		ptr->name, norm->h_start, norm->v_start,
>  		cap->x, cap->y, cap->width, cap->height,
>  		cap->decimation, cap->quality);
> -	/* if () return -EINVAL;
> +	/*
> +	 * if () return -EINVAL;
>  	 * trust the master driver that it knows what it does - so
> -	 * we allow invalid startx/y and norm for now ... */
> +	 * we allow invalid startx/y and norm for now ...
> +	 */
>  	ptr->width = cap->width / (cap->decimation & 0xff);
>  	ptr->height = cap->height / ((cap->decimation >> 8) & 0xff);
>  
> @@ -585,8 +608,10 @@ static int zr36050_set_video(struct videocodec *codec, const struct tvnorm *norm
>  
>  	ptr->real_code_vol = size >> 3; /* in bytes */
>  
> -	/* Set max_block_vol here (previously in zr36050_init, moved
> - * here for consistency with zr36060 code */
> +	/*
> +	 * Set max_block_vol here (previously in zr36050_init, moved
> +	 * here for consistency with zr36060 code
> +	 */
>  	zr36050_write(ptr, ZR050_MBCV, ptr->max_block_vol);
>  
>  	return 0;
> @@ -642,8 +667,10 @@ static int zr36050_control(struct videocodec *codec, int type, int size, void *d
>  		if (size != sizeof(int))
>  			return -EFAULT;
>  		ptr->total_code_vol = *ival;
> -		/* (Kieran Morrissey)
> -		 * code copied from zr36060.c to ensure proper bitrate */
> +		/*
> +		 * (Kieran Morrissey)
> +		 * code copied from zr36060.c to ensure proper bitrate
> +		 */
>  		ptr->real_code_vol = (ptr->total_code_vol * 6) >> 3;
>  		break;
>  
> @@ -707,10 +734,11 @@ static int zr36050_control(struct videocodec *codec, int type, int size, void *d
>  }
>  
>  /* =========================================================================
> -   Exit and unregister function:
> -
> -   Deinitializes Zoran's JPEG processor
> -   ========================================================================= */
> + * Exit and unregister function:
> + *
> + * Deinitializes Zoran's JPEG processor
> + * =========================================================================
> + */
>  
>  static int zr36050_unset(struct videocodec *codec)
>  {
> @@ -732,13 +760,14 @@ static int zr36050_unset(struct videocodec *codec)
>  }
>  
>  /* =========================================================================
> -   Setup and registry function:
> -
> -   Initializes Zoran's JPEG processor
> -
> -   Also sets pixel size, average code size, mode (compr./decompr.)
> -   (the given size is determined by the processor with the video interface)
> -   ========================================================================= */
> + * Setup and registry function:
> + *
> + * Initializes Zoran's JPEG processor
> + *
> + * Also sets pixel size, average code size, mode (compr./decompr.)
> + * (the given size is determined by the processor with the video interface)
> + * =========================================================================
> + */
>  
>  static int zr36050_setup(struct videocodec *codec)
>  {
> @@ -773,8 +802,10 @@ static int zr36050_setup(struct videocodec *codec)
>  	memcpy(ptr->h_samp_ratio, zr36050_decimation_h, 8);
>  	memcpy(ptr->v_samp_ratio, zr36050_decimation_v, 8);
>  
> -	ptr->bitrate_ctrl = 0;	/* 0 or 1 - fixed file size flag
> -				 * (what is the difference?) */
> +	ptr->bitrate_ctrl = 0;	/*
> +				 * 0 or 1 - fixed file size flag
> +				 * (what is the difference?)
> +				 */
>  	ptr->mode = CODEC_DO_COMPRESSION;
>  	ptr->width = 384;
>  	ptr->height = 288;
> @@ -813,8 +844,9 @@ static const struct videocodec zr36050_codec = {
>  };
>  
>  /* =========================================================================
> -   HOOK IN DRIVER AS KERNEL MODULE
> -   ========================================================================= */
> + * HOOK IN DRIVER AS KERNEL MODULE
> + * =========================================================================
> + */
>  
>  static int __init zr36050_init_module(void)
>  {
> 

