Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25832189BC7
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 13:15:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726631AbgCRMPy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 08:15:54 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:36799 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726616AbgCRMPx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 08:15:53 -0400
Received: by mail-lj1-f193.google.com with SMTP id g12so26771216ljj.3
        for <linux-media@vger.kernel.org>; Wed, 18 Mar 2020 05:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=je3MGEVK2+zndHMvxr7pzBmphbhZhu4Gy8zHmNg5FBc=;
        b=spUpK9J/9mwBNbboirh0pjgkVOG5S2Ecqy+nakP/Phh+gXOGuqrXI8hP3WAbL7mueh
         kdnxt0exhJBNhIJsyLfekFYJDjoG55az709H8eILe+59p0hGAdb6q4hhWyCBn/BpPDE+
         l4tWyhlcZ8jSZR8lK+S/E0d7ZgjOFDie+IrKwDe462FTnw5CggvEeJkWeB/9+aapCM8t
         DmJbOQ54jXNN/iYFPfoDooYqfpFQ3+i+3PBuimdtBLZxKHLjyG8CTVQzZQ2iEFdz7xnz
         0hLN2Z2v9+NT2DOSDpiyK2af6VkQIeYoIS9nbHylXpieqsIo2qAwiNawtFPE9jS8msaX
         Q8vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=je3MGEVK2+zndHMvxr7pzBmphbhZhu4Gy8zHmNg5FBc=;
        b=V2C7CC9zdGuOYEXDr7w4hCcpjZZ8HgTi1v+aruYLMY1wQEla8b15G4C9bannJpFXQR
         Gvi1cpTqhkbUv1nuSnOa+ubyElwy6xddTjfc6Iqhvpb97rMov8bw3QevBjJWO7k4Iif8
         KymIjFt0nKCbKo9OUVkDV9QhFsVVWP5cXLx0f47R17RX5FeGsQ1+CcU7ArBUJ84bs9h0
         KFtkNh2bIltJbNlYwetqr4sl4EgK5CpJ659bzFdyIxta01pumMpZkmU3Xnoo3QUpKdU+
         XHmVu49lH5g0lZ+4xyBSR6ybPZ3X956RZe0abqXIBMqTPMVVK+msqTwl64/lVzYPF0cH
         67Rg==
X-Gm-Message-State: ANhLgQ0ri9eSEoC5lKm8DQKeWKc7MMYUmjgHxReP4jJAY1zB3I+YXQYq
        P2xO/b+bCdo5lP0EnsQkjP0=
X-Google-Smtp-Source: ADFU+vsMKjWzuqDZLBVavFMuklZXTZxUWxMAgLBNKKdhDbGhLLipvdxjBSKGjmvwJGHD6gcJfE2Fpg==
X-Received: by 2002:a2e:92d6:: with SMTP id k22mr2289977ljh.18.1584533751244;
        Wed, 18 Mar 2020 05:15:51 -0700 (PDT)
Received: from [192.168.15.110] ([194.152.46.21])
        by smtp.gmail.com with ESMTPSA id r18sm4512526lji.16.2020.03.18.05.15.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2020 05:15:50 -0700 (PDT)
Subject: Re: [PATCH 0/5] v4l2 JPEG helpers and CODA960 JPEG decoder
To:     Adrian Ratiu <adrian.ratiu@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Rick Chang <rick.chang@mediatek.com>,
        Bin Liu <bin.liu@mediatek.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Mirela Rabulea <mirela.rabulea@nxp.com>, kernel@pengutronix.de
References: <20191113150538.9807-1-p.zabel@pengutronix.de>
 <87sgi6gd25.fsf@iwork.i-did-not-set--mail-host-address--so-tickle-me>
From:   Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
Message-ID: <a15c3694-021f-c6af-7d09-dfca14c0ea7b@gmail.com>
Date:   Wed, 18 Mar 2020 13:15:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <87sgi6gd25.fsf@iwork.i-did-not-set--mail-host-address--so-tickle-me>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Adrian,

W dniu 18.03.2020 o 11:41, Adrian Ratiu pisze:
 > Hi Philipp,
 >
 > Further testing revealed the decoder rejects jpegs with optimized huffman
 > tables, but the following decoder patch makes them work.
 >
 > Feel free to include these changes in your next version.
 >
 >
 > Adrian
 >
 >
 > drivers/media/platform/coda/coda-jpeg.c | 10 +++++-----
 > 1 file changed, 5 insertions(+), 5 deletions(-)>>
 >
 > diff --git a/drivers/media/platform/coda/coda-jpeg.c b/drivers/media/platform
<snip>

 > 		}
 > -		if (huffman_tables[i].length != ((i & 2) ? 178 : 28)) {
 > +		if (huffman_tables[i].length < 17) {
 > 			v4l2_err(&dev->v4l2_dev,
 > 				 "invalid Huffman table %d length: %zu\n", i,
 > 				 huffman_tables[i].length);

Shouldn't you also be checking the upper bound on the table length,
to ensure that you won't exceed the memcpy() destination's capacity
below?

<snip>

 > -	memcpy(huff_tab->dc_values[0], huffman_tables[0].start + 16, 12);
 > +	memcpy(huff_tab->dc_values[0], huffman_tables[0].start + 16, 
huffman_tables[0].length - 16);


Andrzej
