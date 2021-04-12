Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC91335C191
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 11:31:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239310AbhDLJbd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 05:31:33 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:47543 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240912AbhDLJYy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 05:24:54 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id Vso1l4gxBMxedVso4lcYoj; Mon, 12 Apr 2021 11:24:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1618219472; bh=W/Yk02PXxiNZyc3AaRMo4JQHAupuYWmaOGcTXAMnZ0c=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=YM2yQWnx45yCeGLBnXyra3e67aqZ9vms81dnI6IBN0YpAD5fPmdZ/8exp1WBT6i/+
         x55vSoc4bqidt675yrd+F7Saop9Z7+2rPpLDOmlOf+/7AWgHQ9jnpHJOcvS5ROQ510
         GhqWtI+1QxDDbdr5lIAUSAMxPkKRjU3aza6qhOgqBW8XhiVqqqtG5xPaQpamuHqV57
         960gMAihbkPnr1StF/qHzL2vb4VknewxRJIT6QaZ5eYRbcLvMiX/nagtsqlDXcb3Tw
         fU5Z9QQweDH6fJeU3rqhVuhu3k+c/ayNK3aDO96yMlD7N/22goXPfc/d9FtwAJ6vQX
         gFztzYM29FoHQ==
Subject: Re: [PATCH v2] staging: media: zoran: remove and add '*' in
 long(multi-line) comments
To:     Mitali Borkar <mitaliborkar810@gmail.com>
Cc:     clabbe@baylibre.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
References: <YHAxQh9bfFeN337E@kali>
 <9f8b3018-2b5e-2471-f5d4-bac03e4ab259@xs4all.nl> <YHLh4vQvECHopNZX@kali>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <4569fa40-d62b-3867-2f87-6448c10a87c6@xs4all.nl>
Date:   Mon, 12 Apr 2021 11:24:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YHLh4vQvECHopNZX@kali>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfO0PawkIryNxXhEufJaYAlPjP/tHwSoVJxAuuxFoMdnXFR0G8PA5uyzoSK0z/w64a26bCWV/XRKmHF6Kws0dfMTG8D4HC4zD9yz4Ko/Y310UBXEwB+rW
 qK/E3upUfpxHAbMLd5hs6CIAVSn0b8nQJT2fj5664BGn3fGFYLhA24CSnuOdjbwUaNxVzvZwzqgEU0Qy1P9f/D2jEwD+n6IMSAHAFhBZWOOJ1RDvHk+bYTsr
 f8maTfpY29M4wUjutdkstPuDzHxNbdhlnJ7X+aNTK25wEhJJQg0IB53BMaH0k3S7WWn50KIwrV0WvQGazJVE0mKJ11c8ptwxtKK9SeiOzNYNSr+4cpqJ7gHm
 HoeBD0v8m9+OtU4HJSVTYJSCUzU59Gp+/vPYQnfSGOJy8k40hMCKxsBzndD9S4ka3jxkwGG8a9Oh6GmBlogqmmRIddZ3nM/By5hEkjWwS5GKk/DQ6ctMJy29
 qBWnYsYgMJPOY/6cloIp1cdSBQraNRhdNPNeVA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/04/2021 13:47, Mitali Borkar wrote:
> On Fri, Apr 09, 2021 at 12:53:35PM +0200, Hans Verkuil wrote:
>> On 09/04/2021 12:49, Mitali Borkar wrote:
>>> Added '*' before every line inside long(multi-line) comments. Removed
>>> '*/' from end of the comment line and added to next line as per linux
>>> kernel coding style. Aligned '*' accordingly to make code neater.
>>>
>>> Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
>>> ---
>>>
>>> Changes from v1:- Changes made in code according to linux kernel coding
>>> style for long(multi-line) comments.
>>>
>>> drivers/staging/media/zoran/zr36050.c | 138 +++++++++++++++-----------
>>>  1 file changed, 81 insertions(+), 57 deletions(-)
>>>
>>> diff --git a/drivers/staging/media/zoran/zr36050.c b/drivers/staging/media/zoran/zr36050.c
>>> index 663ac2b3434e..703064009c6b 100644
>>> --- a/drivers/staging/media/zoran/zr36050.c
>>> +++ b/drivers/staging/media/zoran/zr36050.c
>>> @@ -25,7 +25,8 @@
>>>  #include "videocodec.h"
>>>  
>>>  /* it doesn't make sense to have more than 20 or so,
>>
>> The coding style says that /* is on a line of its own. So change that too.
>>
> 
> Sir, I have sent v3 patch for this two days ago and didnt received reply
> til now, should I resend that patch?

It was weekend, you know :-)

If you don't hear from me for more than a week, and the patch state in
patchwork (https://patchwork.linuxtv.org/project/linux-media/list/) is still
'New', then ping me, i.e. just reply to your patch with a 'Gentle ping!'
message.

Regards,

	Hans

> 
>> Regards,
>>
>> 	Hans
>>
>>> - * just to prevent some unwanted loops */
>>> + * just to prevent some unwanted loops
>>> + */
>>>  #define MAX_CODECS 20
>>>  
>>>  /* amount of chips attached via this driver */
>>> @@ -44,9 +45,10 @@ MODULE_PARM_DESC(debug, "Debug level (0-4)");
>>>  
>>>  /* =========================================================================
>>>   *  Local hardware I/O functions:
>>> -
>>> -   read/write via codec layer (registers are located in the master device)
>>> -   ========================================================================= */
>>> + *
>>> + *  read/write via codec layer (registers are located in the master device)
>>> + * =========================================================================
>>> + */
>>>  
>>>  /* read and write functions */
>>>  static u8 zr36050_read(struct zr36050 *ptr, u16 reg)
>>> @@ -81,9 +83,10 @@ static void zr36050_write(struct zr36050 *ptr, u16 reg, u8 value)
>>>  
>>>  /* =========================================================================
>>>   *  Local helper function:
>>> -
>>> -   status read
>>> -   ========================================================================= */
>>> + *
>>> + *  status read
>>> + * =========================================================================
>>> + */
>>>  
>>>  /* status is kept in datastructure */
>>>  static u8 zr36050_read_status1(struct zr36050 *ptr)
>>> @@ -96,9 +99,10 @@ static u8 zr36050_read_status1(struct zr36050 *ptr)
>>>  
>>>  /* =========================================================================
>>>   *  Local helper function:
>>> -
>>> -   scale factor read
>>> -   ========================================================================= */
>>> + *
>>> + *  scale factor read
>>> + * =========================================================================
>>> + */
>>>  
>>>  /* scale factor is kept in datastructure */
>>>  static u16 zr36050_read_scalefactor(struct zr36050 *ptr)
>>> @@ -113,9 +117,10 @@ static u16 zr36050_read_scalefactor(struct zr36050 *ptr)
>>>  
>>>  /* =========================================================================
>>>   *  Local helper function:
>>> -
>>> -   wait if codec is ready to proceed (end of processing) or time is over
>>> -   ========================================================================= */
>>> + *
>>> + *  wait if codec is ready to proceed (end of processing) or time is over
>>> + * =========================================================================
>>> + */
>>>  
>>>  static void zr36050_wait_end(struct zr36050 *ptr)
>>>  {
>>> @@ -134,9 +139,10 @@ static void zr36050_wait_end(struct zr36050 *ptr)
>>>  
>>>  /* =========================================================================
>>>   *  Local helper function:
>>> -
>>> -   basic test of "connectivity", writes/reads to/from memory the SOF marker
>>> -   ========================================================================= */
>>> + *
>>> + *  basic test of "connectivity", writes/reads to/from memory the SOF marker
>>> + * =========================================================================
>>> + */
>>>  
>>>  static int zr36050_basic_test(struct zr36050 *ptr)
>>>  {
>>> @@ -175,9 +181,10 @@ static int zr36050_basic_test(struct zr36050 *ptr)
>>>  
>>>  /* =========================================================================
>>>   *  Local helper function:
>>> -
>>> -   simple loop for pushing the init datasets
>>> -   ========================================================================= */
>>> + *
>>> + *  simple loop for pushing the init datasets
>>> + * =========================================================================
>>> + */
>>>  
>>>  static int zr36050_pushit(struct zr36050 *ptr, u16 startreg, u16 len, const char *data)
>>>  {
>>> @@ -193,14 +200,15 @@ static int zr36050_pushit(struct zr36050 *ptr, u16 startreg, u16 len, const char
>>>  
>>>  /* =========================================================================
>>>   *  Basic datasets:
>>> -
>>> -   jpeg baseline setup data (you find it on lots places in internet, or just
>>> -   extract it from any regular .jpg image...)
>>> -
>>> -   Could be variable, but until it's not needed it they are just fixed to save
>>> -   memory. Otherwise expand zr36050 structure with arrays, push the values to
>>> -   it and initialize from there, as e.g. the linux zr36057/60 driver does it.
>>> -   ========================================================================= */
>>> + *
>>> + *  jpeg baseline setup data (you find it on lots places in internet, or just
>>> + *  extract it from any regular .jpg image...)
>>> + *
>>> + *  Could be variable, but until it's not needed it they are just fixed to save
>>> + *  memory. Otherwise expand zr36050 structure with arrays, push the values to
>>> + *  it and initialize from there, as e.g. the linux zr36057/60 driver does it.
>>> + *  =========================================================================
>>> + */
>>>  
>>>  static const char zr36050_dqt[0x86] = {
>>>  	0xff, 0xdb,		//Marker: DQT
>>> @@ -295,15 +303,17 @@ static const char zr36050_decimation_v[8] = { 1, 1, 1, 0, 0, 0, 0, 0 };
>>>  
>>>  /* =========================================================================
>>>   *  Local helper functions:
>>> -
>>> -   calculation and setup of parameter-dependent JPEG baseline segments
>>> -   (needed for compression only)
>>> -   ========================================================================= */
>>> + *
>>> + *  calculation and setup of parameter-dependent JPEG baseline segments
>>> + *  (needed for compression only)
>>> + * =========================================================================
>>> + */
>>>  
>>>  /* ------------------------------------------------------------------------- */
>>>  
>>>  /* SOF (start of frame) segment depends on width, height and sampling ratio
>>> - *			 of each color component */
>>> + *			 of each color component
>>> + */
>>>  
>>>  static int zr36050_set_sof(struct zr36050 *ptr)
>>>  {
>>> @@ -334,7 +344,8 @@ static int zr36050_set_sof(struct zr36050 *ptr)
>>>  /* ------------------------------------------------------------------------- */
>>>  
>>>  /* SOS (start of scan) segment depends on the used scan components
>>> - *			of each color component */
>>> + *			of each color component
>>> + */
>>>  
>>>  static int zr36050_set_sos(struct zr36050 *ptr)
>>>  {
>>> @@ -379,12 +390,14 @@ static int zr36050_set_dri(struct zr36050 *ptr)
>>>  
>>>  /* =========================================================================
>>>   *  Setup function:
>>> + *
>>> + *  Setup compression/decompression of Zoran's JPEG processor
>>> + *  ( see also zoran 36050 manual )
>>> + *
>>> + *  ... sorry for the spaghetti code ...
>>> + * =========================================================================
>>> + */
>>>  
>>> -   Setup compression/decompression of Zoran's JPEG processor
>>> -   ( see also zoran 36050 manual )
>>> -
>>> -   ... sorry for the spaghetti code ...
>>> -   ========================================================================= */
>>>  static void zr36050_init(struct zr36050 *ptr)
>>>  {
>>>  	int sum = 0;
>>> @@ -420,7 +433,8 @@ static void zr36050_init(struct zr36050 *ptr)
>>>  		sum += zr36050_set_dri(ptr);
>>>  
>>>  		/* setup the fixed jpeg tables - maybe variable, though -
>>> -		 * (see table init section above) */
>>> +		 * (see table init section above)
>>> +		 */
>>>  		dprintk(3, "%s: write DQT, DHT, APP\n", ptr->name);
>>>  		sum += zr36050_pushit(ptr, ZR050_DQT_IDX,
>>>  				      sizeof(zr36050_dqt), zr36050_dqt);
>>> @@ -532,12 +546,15 @@ static void zr36050_init(struct zr36050 *ptr)
>>>  
>>>  /* =========================================================================
>>>   *  CODEC API FUNCTIONS
>>> -
>>> -   this functions are accessed by the master via the API structure
>>> -   ========================================================================= */
>>> + *
>>> + *  this functions are accessed by the master via the API structure
>>> + * =========================================================================
>>> + */
>>>  
>>>  /* set compression/expansion mode and launches codec -
>>> - *  this should be the last call from the master before starting processing */
>>> + *  this should be the last call from the master before starting processing
>>> + */
>>> +
>>>  static int zr36050_set_mode(struct videocodec *codec, int mode)
>>>  {
>>>  	struct zr36050 *ptr = (struct zr36050 *)codec->data;
>>> @@ -566,7 +583,8 @@ static int zr36050_set_video(struct videocodec *codec, const struct tvnorm *norm
>>>  		cap->decimation, cap->quality);
>>>  	/* if () return -EINVAL;
>>>  	 * trust the master driver that it knows what it does - so
>>> -	 * we allow invalid startx/y and norm for now ... */
>>> +	 * we allow invalid startx/y and norm for now ...
>>> +	 */
>>>  	ptr->width = cap->width / (cap->decimation & 0xff);
>>>  	ptr->height = cap->height / ((cap->decimation >> 8) & 0xff);
>>>  
>>> @@ -586,7 +604,8 @@ static int zr36050_set_video(struct videocodec *codec, const struct tvnorm *norm
>>>  	ptr->real_code_vol = size >> 3; /* in bytes */
>>>  
>>>  	/* Set max_block_vol here (previously in zr36050_init, moved
>>> - * here for consistency with zr36060 code */
>>> +	 * here for consistency with zr36060 code
>>> +	 */
>>>  	zr36050_write(ptr, ZR050_MBCV, ptr->max_block_vol);
>>>  
>>>  	return 0;
>>> @@ -643,7 +662,8 @@ static int zr36050_control(struct videocodec *codec, int type, int size, void *d
>>>  			return -EFAULT;
>>>  		ptr->total_code_vol = *ival;
>>>  		/* (Kieran Morrissey)
>>> -		 * code copied from zr36060.c to ensure proper bitrate */
>>> +		 * code copied from zr36060.c to ensure proper bitrate
>>> +		 */
>>>  		ptr->real_code_vol = (ptr->total_code_vol * 6) >> 3;
>>>  		break;
>>>  
>>> @@ -708,9 +728,10 @@ static int zr36050_control(struct videocodec *codec, int type, int size, void *d
>>>  
>>>  /* =========================================================================
>>>   *  Exit and unregister function:
>>> -
>>> -   Deinitializes Zoran's JPEG processor
>>> -   ========================================================================= */
>>> + *
>>> + *  Deinitializes Zoran's JPEG processor
>>> + * =========================================================================
>>> + */
>>>  
>>>  static int zr36050_unset(struct videocodec *codec)
>>>  {
>>> @@ -733,12 +754,13 @@ static int zr36050_unset(struct videocodec *codec)
>>>  
>>>  /* =========================================================================
>>>   *  Setup and registry function:
>>> -
>>> -   Initializes Zoran's JPEG processor
>>> -
>>> -   Also sets pixel size, average code size, mode (compr./decompr.)
>>> -   (the given size is determined by the processor with the video interface)
>>> -   ========================================================================= */
>>> + *
>>> + *  Initializes Zoran's JPEG processor
>>> + *
>>> + *  Also sets pixel size, average code size, mode (compr./decompr.)
>>> + *  (the given size is determined by the processor with the video interface)
>>> + * =========================================================================
>>> + */
>>>  
>>>  static int zr36050_setup(struct videocodec *codec)
>>>  {
>>> @@ -774,7 +796,8 @@ static int zr36050_setup(struct videocodec *codec)
>>>  	memcpy(ptr->v_samp_ratio, zr36050_decimation_v, 8);
>>>  
>>>  	ptr->bitrate_ctrl = 0;	/* 0 or 1 - fixed file size flag
>>> -				 * (what is the difference?) */
>>> +				 * (what is the difference?)
>>> +				 */
>>>  	ptr->mode = CODEC_DO_COMPRESSION;
>>>  	ptr->width = 384;
>>>  	ptr->height = 288;
>>> @@ -814,7 +837,8 @@ static const struct videocodec zr36050_codec = {
>>>  
>>>  /* =========================================================================
>>>   *  HOOK IN DRIVER AS KERNEL MODULE
>>> -   ========================================================================= */
>>> + * =========================================================================
>>> + */
>>>  
>>>  static int __init zr36050_init_module(void)
>>>  {
>>>
>>

