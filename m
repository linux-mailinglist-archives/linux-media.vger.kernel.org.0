Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B393734668C
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 18:40:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230189AbhCWRkV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 13:40:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230107AbhCWRkM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 13:40:12 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE02BC061574;
        Tue, 23 Mar 2021 10:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=sxvcc6n+zZC/nKYBO0R7ql8qMgyWOPTuTiacyZX4jN4=; b=lcQ0Rs+gLRtuRTK/T3cqcmJ7Gq
        EbGh5DNF3EJ4b/roKNg6oCEYVOdKEH7gjYRKWkmh0QVCSXQTDQck98VZ0G7gocirzRv7ZejVnBNhM
        maIrL0+PH2wNL8AhnN0DiIyai+IK4yO28vwDopf8wj5m5Q4D+X54JuEgNb0kZMLBP9tJI7H0/7HF9
        hhQNS8OvjU9TajzS8h6lv58//RwyECuJurgqqFoI6HqyESg7+0X9HfOl+5tNg/vbDILEjkgXyEkpW
        jcgU9joqskwGvnu6QQ9m7Nb4KXipErg6utRRF3aXfQRWMuWesCtEC//BHkb80CyFgu5G0WlqVNg1+
        1++4TOEw==;
Received: from [2601:1c0:6280:3f0::3ba4]
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lOl0a-00ALv4-O9; Tue, 23 Mar 2021 17:40:02 +0000
Subject: Re: [PATCH] drivers/media/pci/bt8xx/bttv-cards: fix typos
To:     Xiaofeng Cao <cxfcosmos@gmail.com>, mchehab@kernel.org
Cc:     hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xiaofeng Cao <caoxiaofeng@yulong.com>
References: <20210323122546.16262-1-caoxiaofeng@yulong.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <b297b819-8837-cfa0-0a62-d40958697bb2@infradead.org>
Date:   Tue, 23 Mar 2021 10:39:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210323122546.16262-1-caoxiaofeng@yulong.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,
Please see a few comments below.

On 3/23/21 5:25 AM, Xiaofeng Cao wrote:
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
> ---
>  drivers/media/pci/bt8xx/bttv-cards.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/pci/bt8xx/bttv-cards.c b/drivers/media/pci/bt8xx/bttv-cards.c
> index ca20b806e82d..9a07e1094978 100644
> --- a/drivers/media/pci/bt8xx/bttv-cards.c
> +++ b/drivers/media/pci/bt8xx/bttv-cards.c

> @@ -2506,7 +2506,7 @@ struct tvcard bttv_tvcards[] = {
>  	     one external BNC composite input (mux 2)
>  	     three internal composite inputs (unknown muxes)
>  	     an 18-bit stereo A/D (CS5331A), which has:
> -	       one external stereo unblanced (RCA) audio connection
> +	       one external stereo unbalanced(RCA) audio connection

Please leave a space between unbalanced and (RCA).

>  	       one (or 3?) internal stereo balanced (XLR) audio connection
>  	       input is selected via gpio to a 14052B mux
>  		 (mask=0x300, unbal=0x000, bal=0x100, ??=0x200,0x300)

> @@ -4580,7 +4580,7 @@ static void xguard_muxsel(struct bttv *btv, unsigned int input)
>  }
>  static void picolo_tetra_init(struct bttv *btv)
>  {
> -	/*This is the video input redirection fonctionality : I DID NOT USED IT. */
> +	/*This is the video input redirection functionality : I DID NOT USED IT. */

	                                                      I DID NOT USE IT. *

>  	btwrite (0x08<<16,BT848_GPIO_DATA);/*GPIO[19] [==> 4053 B+C] set to 1 */
>  	btwrite (0x04<<16,BT848_GPIO_DATA);/*GPIO[18] [==> 4053 A]  set to 1*/
>  }


thanks.
-- 
~Randy

