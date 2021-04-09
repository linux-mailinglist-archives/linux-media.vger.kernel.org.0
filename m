Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D025D359C60
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 12:53:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233564AbhDIKyA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 06:54:00 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:47255 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232087AbhDIKx6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 9 Apr 2021 06:53:58 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id UolblMASE43ycUolelV09H; Fri, 09 Apr 2021 12:53:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1617965624; bh=GgnuQ2dH0TXnpRVX+UaltcVSavNA7i7VSZxCMTpv1KA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=KMQ84aydgW+9Bg5ApzQT2UJFfgtjERDS0qsb6VliMN/f6Fh8RLcC3K5VyPMUVpSkA
         FnK1d40FRlRKqaLGEuNhhtXE0Ucqg8i4Z3Bo3ZTTG9+BlcLkTskkfmYOQuKyasBdkH
         9Hz1f+OBkpxkWOlDg+MUXGTZShGDV2xemXnFLrTbxnM3q3zeQSpbXd00zXYU6Lwm9z
         ClB7ypuen7fA0N3MYWdurrY+0DmG1xIYPmcjA9JHyKurLrPHP1+qFk+4PN75696P5e
         EzCoP81iuQicHmyIgIml2zCTfwLW4W+WCSiCfLNdZUT550t2GMeo7zGWoFhAO1d3r5
         ydYtkPBdPbntw==
Subject: Re: [PATCH v2] staging: media: zoran: remove and add '*' in
 long(multi-line) comments
To:     Mitali Borkar <mitaliborkar810@gmail.com>, clabbe@baylibre.com,
        mchehab@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        mitali_s@me.iitr.ac.in
References: <YHAxQh9bfFeN337E@kali>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <9f8b3018-2b5e-2471-f5d4-bac03e4ab259@xs4all.nl>
Date:   Fri, 9 Apr 2021 12:53:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YHAxQh9bfFeN337E@kali>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfAtVkuMAklExdWZwMxaOrZuUdwBKxIQ0l8odhbzLSOHDyzyWtCZlQuY30upMmAZZUK0NiZ/5Z7Z1ybRbRjXeKzZGTg584w4czfytSkUAUJqvkhpv+FCY
 ZyQPsm45AlYNT/SBeILbI1/6JiLLtdmBwUiTs+D8z4Nh5H+X3VlGeXGAMN+Pg8dOA37hhPVcTM/d1jWSiF47jok9huyLJCBVlPR0vq90rv1Ql87tbEtoBK+r
 7RCE8qsU7+YEDIprFAxmBSv5gKeDMwDYs+QGxexqaAPuELOB9bh63LVu67WOYzRUGLVMxQlKVQK5D6Ufj/tViJ88D5hrLueHslFXlxP4QFskAJAVAY2wiq1W
 OWCpphHTNO9hV7ettl1Ng/aodyhzre5sOydR477tweYFixz7n+gBozhmy/aecnl8ks2At8Ca3fILZGlDsT60sj7sJ+jZuvsMP0O6xBmktmJ3o41LaHDbQ0ma
 +HtB1eBxFmkVEvZ+FG/dwvq2OHJk/kkyIP0nkg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 09/04/2021 12:49, Mitali Borkar wrote:
> Added '*' before every line inside long(multi-line) comments. Removed
> '*/' from end of the comment line and added to next line as per linux
> kernel coding style. Aligned '*' accordingly to make code neater.
> 
> Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> ---
> 
> Changes from v1:- Changes made in code according to linux kernel coding
> style for long(multi-line) comments.
> 
> drivers/staging/media/zoran/zr36050.c | 138 +++++++++++++++-----------
>  1 file changed, 81 insertions(+), 57 deletions(-)
> 
> diff --git a/drivers/staging/media/zoran/zr36050.c b/drivers/staging/media/zoran/zr36050.c
> index 663ac2b3434e..703064009c6b 100644
> --- a/drivers/staging/media/zoran/zr36050.c
> +++ b/drivers/staging/media/zoran/zr36050.c
> @@ -25,7 +25,8 @@
>  #include "videocodec.h"
>  
>  /* it doesn't make sense to have more than 20 or so,

The coding style says that /* is on a line of its own. So change that too.

Regards,

	Hans

> - * just to prevent some unwanted loops */
> + * just to prevent some unwanted loops
> + */
>  #define MAX_CODECS 20
>  
>  /* amount of chips attached via this driver */
> @@ -44,9 +45,10 @@ MODULE_PARM_DESC(debug, "Debug level (0-4)");
>  
>  /* =========================================================================
>   *  Local hardware I/O functions:
> -
> -   read/write via codec layer (registers are located in the master device)
> -   ========================================================================= */
> + *
> + *  read/write via codec layer (registers are located in the master device)
> + * =========================================================================
> + */
>  
>  /* read and write functions */
>  static u8 zr36050_read(struct zr36050 *ptr, u16 reg)
> @@ -81,9 +83,10 @@ static void zr36050_write(struct zr36050 *ptr, u16 reg, u8 value)
>  
>  /* =========================================================================
>   *  Local helper function:
> -
> -   status read
> -   ========================================================================= */
> + *
> + *  status read
> + * =========================================================================
> + */
>  
>  /* status is kept in datastructure */
>  static u8 zr36050_read_status1(struct zr36050 *ptr)
> @@ -96,9 +99,10 @@ static u8 zr36050_read_status1(struct zr36050 *ptr)
>  
>  /* =========================================================================
>   *  Local helper function:
> -
> -   scale factor read
> -   ========================================================================= */
> + *
> + *  scale factor read
> + * =========================================================================
> + */
>  
>  /* scale factor is kept in datastructure */
>  static u16 zr36050_read_scalefactor(struct zr36050 *ptr)
> @@ -113,9 +117,10 @@ static u16 zr36050_read_scalefactor(struct zr36050 *ptr)
>  
>  /* =========================================================================
>   *  Local helper function:
> -
> -   wait if codec is ready to proceed (end of processing) or time is over
> -   ========================================================================= */
> + *
> + *  wait if codec is ready to proceed (end of processing) or time is over
> + * =========================================================================
> + */
>  
>  static void zr36050_wait_end(struct zr36050 *ptr)
>  {
> @@ -134,9 +139,10 @@ static void zr36050_wait_end(struct zr36050 *ptr)
>  
>  /* =========================================================================
>   *  Local helper function:
> -
> -   basic test of "connectivity", writes/reads to/from memory the SOF marker
> -   ========================================================================= */
> + *
> + *  basic test of "connectivity", writes/reads to/from memory the SOF marker
> + * =========================================================================
> + */
>  
>  static int zr36050_basic_test(struct zr36050 *ptr)
>  {
> @@ -175,9 +181,10 @@ static int zr36050_basic_test(struct zr36050 *ptr)
>  
>  /* =========================================================================
>   *  Local helper function:
> -
> -   simple loop for pushing the init datasets
> -   ========================================================================= */
> + *
> + *  simple loop for pushing the init datasets
> + * =========================================================================
> + */
>  
>  static int zr36050_pushit(struct zr36050 *ptr, u16 startreg, u16 len, const char *data)
>  {
> @@ -193,14 +200,15 @@ static int zr36050_pushit(struct zr36050 *ptr, u16 startreg, u16 len, const char
>  
>  /* =========================================================================
>   *  Basic datasets:
> -
> -   jpeg baseline setup data (you find it on lots places in internet, or just
> -   extract it from any regular .jpg image...)
> -
> -   Could be variable, but until it's not needed it they are just fixed to save
> -   memory. Otherwise expand zr36050 structure with arrays, push the values to
> -   it and initialize from there, as e.g. the linux zr36057/60 driver does it.
> -   ========================================================================= */
> + *
> + *  jpeg baseline setup data (you find it on lots places in internet, or just
> + *  extract it from any regular .jpg image...)
> + *
> + *  Could be variable, but until it's not needed it they are just fixed to save
> + *  memory. Otherwise expand zr36050 structure with arrays, push the values to
> + *  it and initialize from there, as e.g. the linux zr36057/60 driver does it.
> + *  =========================================================================
> + */
>  
>  static const char zr36050_dqt[0x86] = {
>  	0xff, 0xdb,		//Marker: DQT
> @@ -295,15 +303,17 @@ static const char zr36050_decimation_v[8] = { 1, 1, 1, 0, 0, 0, 0, 0 };
>  
>  /* =========================================================================
>   *  Local helper functions:
> -
> -   calculation and setup of parameter-dependent JPEG baseline segments
> -   (needed for compression only)
> -   ========================================================================= */
> + *
> + *  calculation and setup of parameter-dependent JPEG baseline segments
> + *  (needed for compression only)
> + * =========================================================================
> + */
>  
>  /* ------------------------------------------------------------------------- */
>  
>  /* SOF (start of frame) segment depends on width, height and sampling ratio
> - *			 of each color component */
> + *			 of each color component
> + */
>  
>  static int zr36050_set_sof(struct zr36050 *ptr)
>  {
> @@ -334,7 +344,8 @@ static int zr36050_set_sof(struct zr36050 *ptr)
>  /* ------------------------------------------------------------------------- */
>  
>  /* SOS (start of scan) segment depends on the used scan components
> - *			of each color component */
> + *			of each color component
> + */
>  
>  static int zr36050_set_sos(struct zr36050 *ptr)
>  {
> @@ -379,12 +390,14 @@ static int zr36050_set_dri(struct zr36050 *ptr)
>  
>  /* =========================================================================
>   *  Setup function:
> + *
> + *  Setup compression/decompression of Zoran's JPEG processor
> + *  ( see also zoran 36050 manual )
> + *
> + *  ... sorry for the spaghetti code ...
> + * =========================================================================
> + */
>  
> -   Setup compression/decompression of Zoran's JPEG processor
> -   ( see also zoran 36050 manual )
> -
> -   ... sorry for the spaghetti code ...
> -   ========================================================================= */
>  static void zr36050_init(struct zr36050 *ptr)
>  {
>  	int sum = 0;
> @@ -420,7 +433,8 @@ static void zr36050_init(struct zr36050 *ptr)
>  		sum += zr36050_set_dri(ptr);
>  
>  		/* setup the fixed jpeg tables - maybe variable, though -
> -		 * (see table init section above) */
> +		 * (see table init section above)
> +		 */
>  		dprintk(3, "%s: write DQT, DHT, APP\n", ptr->name);
>  		sum += zr36050_pushit(ptr, ZR050_DQT_IDX,
>  				      sizeof(zr36050_dqt), zr36050_dqt);
> @@ -532,12 +546,15 @@ static void zr36050_init(struct zr36050 *ptr)
>  
>  /* =========================================================================
>   *  CODEC API FUNCTIONS
> -
> -   this functions are accessed by the master via the API structure
> -   ========================================================================= */
> + *
> + *  this functions are accessed by the master via the API structure
> + * =========================================================================
> + */
>  
>  /* set compression/expansion mode and launches codec -
> - *  this should be the last call from the master before starting processing */
> + *  this should be the last call from the master before starting processing
> + */
> +
>  static int zr36050_set_mode(struct videocodec *codec, int mode)
>  {
>  	struct zr36050 *ptr = (struct zr36050 *)codec->data;
> @@ -566,7 +583,8 @@ static int zr36050_set_video(struct videocodec *codec, const struct tvnorm *norm
>  		cap->decimation, cap->quality);
>  	/* if () return -EINVAL;
>  	 * trust the master driver that it knows what it does - so
> -	 * we allow invalid startx/y and norm for now ... */
> +	 * we allow invalid startx/y and norm for now ...
> +	 */
>  	ptr->width = cap->width / (cap->decimation & 0xff);
>  	ptr->height = cap->height / ((cap->decimation >> 8) & 0xff);
>  
> @@ -586,7 +604,8 @@ static int zr36050_set_video(struct videocodec *codec, const struct tvnorm *norm
>  	ptr->real_code_vol = size >> 3; /* in bytes */
>  
>  	/* Set max_block_vol here (previously in zr36050_init, moved
> - * here for consistency with zr36060 code */
> +	 * here for consistency with zr36060 code
> +	 */
>  	zr36050_write(ptr, ZR050_MBCV, ptr->max_block_vol);
>  
>  	return 0;
> @@ -643,7 +662,8 @@ static int zr36050_control(struct videocodec *codec, int type, int size, void *d
>  			return -EFAULT;
>  		ptr->total_code_vol = *ival;
>  		/* (Kieran Morrissey)
> -		 * code copied from zr36060.c to ensure proper bitrate */
> +		 * code copied from zr36060.c to ensure proper bitrate
> +		 */
>  		ptr->real_code_vol = (ptr->total_code_vol * 6) >> 3;
>  		break;
>  
> @@ -708,9 +728,10 @@ static int zr36050_control(struct videocodec *codec, int type, int size, void *d
>  
>  /* =========================================================================
>   *  Exit and unregister function:
> -
> -   Deinitializes Zoran's JPEG processor
> -   ========================================================================= */
> + *
> + *  Deinitializes Zoran's JPEG processor
> + * =========================================================================
> + */
>  
>  static int zr36050_unset(struct videocodec *codec)
>  {
> @@ -733,12 +754,13 @@ static int zr36050_unset(struct videocodec *codec)
>  
>  /* =========================================================================
>   *  Setup and registry function:
> -
> -   Initializes Zoran's JPEG processor
> -
> -   Also sets pixel size, average code size, mode (compr./decompr.)
> -   (the given size is determined by the processor with the video interface)
> -   ========================================================================= */
> + *
> + *  Initializes Zoran's JPEG processor
> + *
> + *  Also sets pixel size, average code size, mode (compr./decompr.)
> + *  (the given size is determined by the processor with the video interface)
> + * =========================================================================
> + */
>  
>  static int zr36050_setup(struct videocodec *codec)
>  {
> @@ -774,7 +796,8 @@ static int zr36050_setup(struct videocodec *codec)
>  	memcpy(ptr->v_samp_ratio, zr36050_decimation_v, 8);
>  
>  	ptr->bitrate_ctrl = 0;	/* 0 or 1 - fixed file size flag
> -				 * (what is the difference?) */
> +				 * (what is the difference?)
> +				 */
>  	ptr->mode = CODEC_DO_COMPRESSION;
>  	ptr->width = 384;
>  	ptr->height = 288;
> @@ -814,7 +837,8 @@ static const struct videocodec zr36050_codec = {
>  
>  /* =========================================================================
>   *  HOOK IN DRIVER AS KERNEL MODULE
> -   ========================================================================= */
> + * =========================================================================
> + */
>  
>  static int __init zr36050_init_module(void)
>  {
> 

