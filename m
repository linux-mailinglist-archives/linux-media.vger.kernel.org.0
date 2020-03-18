Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EA80189C22
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 13:41:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726894AbgCRMlw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 08:41:52 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:44008 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726881AbgCRMlv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 08:41:51 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: aratiu)
        with ESMTPSA id EB4992965DF
From:   Adrian Ratiu <adrian.ratiu@collabora.com>
To:     Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Rick Chang <rick.chang@mediatek.com>,
        Bin Liu <bin.liu@mediatek.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Mirela Rabulea <mirela.rabulea@nxp.com>, kernel@pengutronix.de
Subject: Re: [PATCH 0/5] v4l2 JPEG helpers and CODA960 JPEG decoder
In-Reply-To: <a15c3694-021f-c6af-7d09-dfca14c0ea7b@gmail.com>
References: <20191113150538.9807-1-p.zabel@pengutronix.de>
 <87sgi6gd25.fsf@iwork.i-did-not-set--mail-host-address--so-tickle-me>
 <a15c3694-021f-c6af-7d09-dfca14c0ea7b@gmail.com>
Date:   Wed, 18 Mar 2020 14:42:51 +0200
Message-ID: <87pnd9hm0k.fsf@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andrzej,

On Wed, 18 Mar 2020, Andrzej Pietrasiewicz 
<andrzejtp2010@gmail.com> wrote:
> Hi Adrian, 
> 
> W dniu 18.03.2020 o 11:41, Adrian Ratiu pisze: 
>  > Hi Philipp, 
>  > 
>  > Further testing revealed the decoder rejects jpegs with 
>  > optimized huffman tables, but the following decoder patch 
>  > makes them work. 
>  > 
>  > Feel free to include these changes in your next version. 
>  >  
>  > Adrian 
>  >  
>  > drivers/media/platform/coda/coda-jpeg.c | 10 +++++----- 1 
>  > file changed, 5 insertions(+), 5 deletions(-)>> 
>  > 
>  > diff --git a/drivers/media/platform/coda/coda-jpeg.c 
>  > b/drivers/media/platform 
> <snip> 
> 
>  > 		} -		if (huffman_tables[i].length != 
>  > ((i & 2) ? 178 : 28)) { +		if 
>  > (huffman_tables[i].length < 17) { v4l2_err(&dev->v4l2_dev, 
>  > "invalid Huffman table %d length: %zu\n", i, 
>  > huffman_tables[i].length); 
> 
> Shouldn't you also be checking the upper bound on the table 
> length, to ensure that you won't exceed the memcpy() 
> destination's capacity below?

Good point, it's always good to have an upper bound sanity check 
test, even though in practice the optimized tables are smaller 
than the std ones by definition, there are never enough checks 
against bugs :)

Thanks,
Adrian

>
> <snip>
>
>  > -	memcpy(huff_tab->dc_values[0], huffman_tables[0].start + 16, 12);
>  > +	memcpy(huff_tab->dc_values[0], huffman_tables[0].start + 16, 
> huffman_tables[0].length - 16);
>
>
> Andrzej
