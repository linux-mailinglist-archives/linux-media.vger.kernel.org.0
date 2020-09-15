Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCCBA26AD8D
	for <lists+linux-media@lfdr.de>; Tue, 15 Sep 2020 21:26:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727838AbgIOT0g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 15:26:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727713AbgIOT0C (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 15:26:02 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D12ACC06178C;
        Tue, 15 Sep 2020 12:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=3UzI3IjsClMWUJX1nUX65h/Tlg3lK3F1wNRbBid3FZ4=; b=yG5g2Q6MTrlrhesPzS1nGJWY9Q
        k4fQu3tt1MQidVFriNjN9keacOE2CeL6VcSJBWtHkZsigxv3O8axfhGAuDzkFf2XxrYHGjaSR9VNy
        SuW+2s2zYERk7kQVDzwOEbXUmGXGq+l5VpONnphH7mN+3jXfWkDJFYgD67DmCWbj3qHJNXEN/HnaG
        9wFTbr7gFmJenxAcUXhW12BpUabQRdurgPiPpViID7GclV7oqBAY2HZzqWXm6YuG+9hROzgflVAp1
        PWrmwGFs36dWADf0N0Jo16HgoFXKIZtcOGVCvJNQjsoz1ykLaSKuiRx8zFzqIdF9LG+3h9O+joHJV
        pRJTE2zg==;
Received: from [2601:1c0:6280:3f0::19c2]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kIGaU-0007Wo-4m; Tue, 15 Sep 2020 19:25:58 +0000
Subject: Re: [PATCH] media: vidtv: fix build on 32bit architectures
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, mchehab@kernel.org
Cc:     geert@linux-m68k.org, r.verdejo@samsung.com,
        linux-media@vger.kernel.org, nicolas@ndufresne.ca,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
References: <20200915180509.2661572-1-dwlsalmeida@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <2280c5d7-7362-6760-fe70-54845c427bc5@infradead.org>
Date:   Tue, 15 Sep 2020 12:25:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200915180509.2661572-1-dwlsalmeida@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/15/20 11:05 AM, Daniel W. S. Almeida wrote:
> From: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> 
> Fix the following error for builds on 32bit architectures:
> 
> ERROR: modpost: "__udivdi3"
> [drivers/media/test-drivers/vidtv/dvb-vidtv-bridge.ko] undefined!
> 
> Which is due to 64bit divisions that did not go through the helpers
> in linux/math64.h
> 
> As vidtv_mux_check_mux_rate was not operational in its current form,
> drop the entire function  while it is not fixed properly.
> 
> For now, call vidtv_mux_pad_with_nulls with a constant number of packets
> to avoid warnings due to unused functions when building this driver.
> 
> Fixes: f90cf6079bf67988 ("media: vidtv: add a bridge driver")
> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> ---
>  drivers/media/test-drivers/vidtv/vidtv_mux.c  | 34 +------------------
>  .../media/test-drivers/vidtv/vidtv_s302m.c    |  4 +--
>  2 files changed, 3 insertions(+), 35 deletions(-)
> 

Works for me.  Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested


-- 
~Randy
