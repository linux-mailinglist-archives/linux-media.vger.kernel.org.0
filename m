Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CD47347047
	for <lists+linux-media@lfdr.de>; Wed, 24 Mar 2021 04:58:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235176AbhCXD6M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 23:58:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235120AbhCXD6H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 23:58:07 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 022E6C061763;
        Tue, 23 Mar 2021 20:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=FkHspzZ4eIco0CCf9Vy8eC47ISGEcdGFSl/9SbDwvfM=; b=bgW5XiJrkiyCjCJ41/OrSEZ0Na
        pOd/febPxkGppUOKhyfu94L8yN/QtRXbWt5N5nGywesdNOS4iMQH8zTegchOx9W3yi37woW4D4Gnp
        6y4BRerobBHKrN8utW63jQ3/IUNa4EK9QG5EaUvGMCrfSPg929C4R1PBKAlOc/Iqr2MHm85nS5Zzx
        xAotg0U9YNx4wwcSDnJefs2l82qi06T5zXZ2ZarFoTlrhkJiDiAPcGxRVxj0fL1c54QSRNILqAx8w
        wGhTiwavbcQUqXTm+skIgUqZOvdSWHhLJNfFD+QObtCCV1h5U8kNLzfupdZuEtmqVjKBzC5MHURuW
        CLE9VMig==;
Received: from [2601:1c0:6280:3f0::3ba4]
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lOueF-00AtUm-Co; Wed, 24 Mar 2021 03:57:41 +0000
Subject: Re: [PATCH v2] drivers/media/pci/bt8xx/bttv-cards: fix typos
To:     Xiaofeng Cao <cxfcosmos@gmail.com>, mchehab@kernel.org
Cc:     Julia.Lawall@inria.fr, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xiaofeng Cao <caoxiaofeng@yulong.com>
References: <20210324032906.17094-1-caoxiaofeng@yulong.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <c8e7929e-17d7-fe38-a809-a057d383ad4c@infradead.org>
Date:   Tue, 23 Mar 2021 20:57:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210324032906.17094-1-caoxiaofeng@yulong.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 3/23/21 8:29 PM, Xiaofeng Cao wrote:
> change 'vodeo'     to 'video'
> change 'nevery'    to 'never'
> change 'is'        to 'it'
> change 'connevted' to 'connected'
> change 'swichers'  to 'switchers'
> change 'strucure'  to 'structure'
> change 'unblanced' to 'unbalanced'
> change 'fonctionality' to 'functionality'
> 
> Signed-off-by: Xiaofeng Cao <caoxiaofeng@yulong.com>

LGTM. Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
> v2: resume space and change 'USED' to 'USE'
>  drivers/media/pci/bt8xx/bttv-cards.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/pci/bt8xx/bttv-cards.c b/drivers/media/pci/bt8xx/bttv-cards.c
> index ca20b806e82d..c2b5ab287dd7 100644
> --- a/drivers/media/pci/bt8xx/bttv-cards.c
> +++ b/drivers/media/pci/bt8xx/bttv-cards.c
> @@ -2011,7 +2011,7 @@ struct tvcard bttv_tvcards[] = {
>  		/* .audio_inputs= 0, */
>  		.svhs           = 9,
>  		.gpiomask       = 0x00,
> -		.gpiomask2      = 0x03, /* used for external vodeo mux */
> +		.gpiomask2      = 0x03, /* used for external video mux */
>  		.muxsel         = MUXSEL(2, 2, 2, 2, 3, 3, 3, 3, 1, 0),
>  		.muxsel_hook	= phytec_muxsel,
>  		.gpiomux        = { 0, 0, 0, 0 }, /* card has no audio */
> @@ -2025,7 +2025,7 @@ struct tvcard bttv_tvcards[] = {
>  		/* .audio_inputs= 0, */
>  		.svhs           = 9,
>  		.gpiomask       = 0x00,
> -		.gpiomask2      = 0x03, /* used for external vodeo mux */
> +		.gpiomask2      = 0x03, /* used for external video mux */
>  		.muxsel         = MUXSEL(2, 2, 2, 2, 3, 3, 3, 3, 1, 1),
>  		.muxsel_hook	= phytec_muxsel,
>  		.gpiomux        = { 0, 0, 0, 0 }, /* card has no audio */
> @@ -2180,8 +2180,8 @@ struct tvcard bttv_tvcards[] = {
>  	[BTTV_BOARD_PICOLO_TETRA_CHIP] = {
>  		/*Eric DEBIEF <debief@telemsa.com>*/
>  		/*EURESYS Picolo Tetra : 4 Conexant Fusion 878A, no audio, video input set with analog multiplexers GPIO controlled*/
> -		/* adds picolo_tetra_muxsel(), picolo_tetra_init(), the following declaration strucure, and #define BTTV_BOARD_PICOLO_TETRA_CHIP*/
> -		/*0x79 in bttv.h*/
> +		/*adds picolo_tetra_muxsel(), picolo_tetra_init(), the following declaration*/
> +		/*structure and #define BTTV_BOARD_PICOLO_TETRA_CHIP 0x79 in bttv.h*/
>  		.name           = "Euresys Picolo Tetra",
>  		.video_inputs   = 4,
>  		/* .audio_inputs= 0, */
> @@ -2506,7 +2506,7 @@ struct tvcard bttv_tvcards[] = {
>  	     one external BNC composite input (mux 2)
>  	     three internal composite inputs (unknown muxes)
>  	     an 18-bit stereo A/D (CS5331A), which has:
> -	       one external stereo unblanced (RCA) audio connection
> +	       one external stereo unbalanced (RCA) audio connection
>  	       one (or 3?) internal stereo balanced (XLR) audio connection
>  	       input is selected via gpio to a 14052B mux
>  		 (mask=0x300, unbal=0x000, bal=0x100, ??=0x200,0x300)
> @@ -3924,7 +3924,7 @@ static void osprey_eeprom(struct bttv *btv, const u8 ee[256])
>  	u32 serial = 0;
>  	int cardid = -1;
>  
> -	/* This code will nevery actually get called in this case.... */
> +	/* This code will never actually get called in this case.... */
>  	if (btv->c.type == BTTV_BOARD_UNKNOWN) {
>  		/* this might be an antique... check for MMAC label in eeprom */
>  		if (!strncmp(ee, "MMAC", 4)) {
> @@ -4086,7 +4086,7 @@ static void avermedia_eeprom(struct bttv *btv)
>  /*
>   * For Voodoo TV/FM and Voodoo 200.  These cards' tuners use a TDA9880
>   * analog demod, which is not I2C controlled like the newer and more common
> - * TDA9887 series.  Instead is has two tri-state input pins, S0 and S1,
> + * TDA9887 series.  Instead it has two tri-state input pins, S0 and S1,
>   * that control the IF for the video and audio.  Apparently, bttv GPIO
>   * 0x10000 is connected to S0.  S0 low selects a 38.9 MHz VIF for B/G/D/K/I
>   * (i.e., PAL) while high selects 45.75 MHz for M/N (i.e., NTSC).
> @@ -4144,7 +4144,7 @@ static void init_PXC200(struct bttv *btv)
>  	int tmp;
>  	u32 val;
>  
> -	/* Initialise GPIO-connevted stuff */
> +	/* Initialise GPIO-connected stuff */
>  	gpio_inout(0xffffff, (1<<13));
>  	gpio_write(0);
>  	udelay(3);
> @@ -4580,7 +4580,7 @@ static void xguard_muxsel(struct bttv *btv, unsigned int input)
>  }
>  static void picolo_tetra_init(struct bttv *btv)
>  {
> -	/*This is the video input redirection fonctionality : I DID NOT USED IT. */
> +	/*This is the video input redirection functionality : I DID NOT USE IT. */
>  	btwrite (0x08<<16,BT848_GPIO_DATA);/*GPIO[19] [==> 4053 B+C] set to 1 */
>  	btwrite (0x04<<16,BT848_GPIO_DATA);/*GPIO[18] [==> 4053 A]  set to 1*/
>  }
> @@ -4598,7 +4598,7 @@ static void picolo_tetra_muxsel (struct bttv* btv, unsigned int input)
>   * ivc120_muxsel [Added by Alan Garfield <alan@fromorbit.com>]
>   *
>   * The IVC120G security card has 4 i2c controlled TDA8540 matrix
> - * swichers to provide 16 channels to MUX0. The TDA8540's have
> + * switchers to provide 16 channels to MUX0. The TDA8540's have
>   * 4 independent outputs and as such the IVC120G also has the
>   * optional "Monitor Out" bus. This allows the card to be looking
>   * at one input while the monitor is looking at another.
> 


-- 
~Randy

