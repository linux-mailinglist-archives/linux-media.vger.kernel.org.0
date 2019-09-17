Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D14E5B4A42
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2019 11:20:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727089AbfIQJUi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Sep 2019 05:20:38 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:35825 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726091AbfIQJUh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Sep 2019 05:20:37 -0400
Received: from [IPv6:2001:983:e9a7:1:4561:5751:6822:aafd] ([IPv6:2001:983:e9a7:1:4561:5751:6822:aafd])
        by smtp-cloud9.xs4all.net with ESMTPA
        id A9f0iwEIHV17OA9f1iKEZ1; Tue, 17 Sep 2019 11:20:35 +0200
Subject: Re: [PATCH v2] cec-follower: create analog channel frequencies
To:     Jiunn Chang <c0d1n61at3@gmail.com>, linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <20190916183835.132777-1-c0d1n61at3@gmail.com>
 <20190917091323.48665-1-c0d1n61at3@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <bb049332-3dfd-a3af-c364-543cafc7beec@xs4all.nl>
Date:   Tue, 17 Sep 2019 11:20:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190917091323.48665-1-c0d1n61at3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfEgL+ogt2ea6RRsRuvM08c/J7f/RD7LF0HaRD2aLWiUwnZ/uAAo2eC8QfS2HKpodf5jxeiYftsiZF2TPVpjhZY5klFKBhviw81SfSctSOpTYhNpObSEs
 kHo3Px8RzUTTy4hfRob7JBNgsQtI5JYkRaUbXT/WWy05B8WhN0pFgvT3NqloGVJbRW9rxVvN9eWLq9zNJGg85IS0AkFaZ82aSPbows8FoSM/V79yadJRpz+a
 epagSxwC+t02a36mOCtlyFSjY/QprSe+/GfWHIrXu2bLMvDB4Hl9ywmTPBTlgKGvNZ7Bz5WoQBCGKErp4bwA01Z2kW8lBL8+I2BcdOgg3G5H6LnrDSwMJBgG
 SlpklgaMYpd1WWvyWkePO5UtENbVMw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/17/19 11:13 AM, Jiunn Chang wrote:
> This frequency table will allow proper testing of tuner control.  There
> are three frequencies per analog broadcast type and broadcast system, so
> tuner increment and decrement can be tested.
> 
> Signed-off-by: Jiunn Chang <c0d1n61at3@gmail.com>
> ---
> 
> Changes since v1:
>  - Add Wikipedia link for analog channel frequencies
>  - Add spaces between { and }
> 
>> 8---------------------------------------------------------------------------8<

For future reference: just use --- instead of this line.

The patch looks good, I'll wait for the next patch that will use this before
merging this patch (otherwise I'd be merging dead code!).

Regards,

	Hans

> 
>  utils/cec-follower/cec-tuner.cpp | 80 ++++++++++++++++++++++++++++++++
>  1 file changed, 80 insertions(+)
> 
> diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
> index 5e794d71..912adcb9 100644
> --- a/utils/cec-follower/cec-tuner.cpp
> +++ b/utils/cec-follower/cec-tuner.cpp
> @@ -7,6 +7,86 @@
>  
>  #include "cec-follower.h"
>  
> +/*
> + * This table contains analog television channel frequencies in KHz.  There are
> + * a total of three frequencies per analog broadcast type and broadcast system.
> + *
> + * CEC 17 and CEC Table 31 of the 1.4 specification lists the available analog
> + * broadcast types and broadcast systems.
> + *
> + * The table is indexed by [ana_bcast_type][bcast_system][i].
> + *
> + * Analog channel frequencies are from Wikipedia:
> + *
> + * https://en.wikipedia.org/wiki/Television_channel_frequencies
> + */
> +static unsigned int analog_freqs_khz[3][9][3] =
> +{
> +	// cable
> +	{
> +		// pal-bg
> +		{ 471250, 479250, 487250 },
> +		// secam-lq
> +		{ 615250, 623250, 631250 },
> +		// pal-m
> +		{ 501250, 507250, 513250 },
> +		// ntsc-m
> +		{ 519250, 525250, 531250 },
> +		// pal-i
> +		{ 45750, 53750, 61750 },
> +		// secam-dk
> +		{ 759250, 767250, 775250 },
> +		// secam-bg
> +		{ 495250, 503250, 511250 },
> +		// secam-l
> +		{ 639250, 647250, 655250 },
> +		// pal-dk
> +		{ 783250, 791250, 799250 }
> +	},
> +	// satellite
> +	{
> +		// pal-bg
> +		{ 519250, 527250, 535250 },
> +		// secam-lq
> +		{ 663250, 671250, 679250 },
> +		// pal-m
> +		{ 537250, 543250, 549250 },
> +		// ntsc-m
> +		{ 555250, 561250, 567250 },
> +		// pal-i
> +		{ 175250, 183250, 191250 },
> +		// secam-dk
> +		{ 807250, 815250, 823250 },
> +		// secam-bg
> +		{ 543250, 551250, 559250 },
> +		// secam-l
> +		{ 687250, 695250, 703250 },
> +		// pal-dk
> +		{ 831250, 839250, 847250 }
> +	},
> +	// terrestrial
> +	{
> +		// pal-bg
> +		{ 567250, 575250, 583250 },
> +		// secam-lq
> +		{ 711250, 719250, 727250 },
> +		// pal-m
> +		{ 573250, 579250, 585250 },
> +		// ntsc-m
> +		{ 591250, 597250, 603250 },
> +		// pal-i
> +		{ 199250, 207250, 215250 },
> +		// secam-dk
> +		{ 145250, 153250, 161250 },
> +		// secam-bg
> +		{ 591250, 599250, 607250 },
> +		// secam-l
> +		{ 735250, 743250, 751250 },
> +		// pal-dk
> +		{ 169250, 177250, 185250 }
> +	}
> +};
> +
>  void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, unsigned me)
>  {
>  	switch (msg.msg[1]) {
> 

