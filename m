Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C624548A9F3
	for <lists+linux-media@lfdr.de>; Tue, 11 Jan 2022 09:55:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236410AbiAKIzx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jan 2022 03:55:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235125AbiAKIzw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jan 2022 03:55:52 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87C0EC06173F
        for <linux-media@vger.kernel.org>; Tue, 11 Jan 2022 00:55:52 -0800 (PST)
Received: from [IPv6:2a00:c281:14a3:8100:a909:23ff:b834:d3b1] (unknown [IPv6:2a00:c281:14a3:8100:a909:23ff:b834:d3b1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 0F5211F44335;
        Tue, 11 Jan 2022 08:55:49 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1641891350;
        bh=sQ3OH/239VSAr+iFBC6zhb3hV+XmuU0X8ar+oWvKy1Y=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=oSPlZ04nYaKjvA0VNUVKL+klYosnFNaPuOhkTdybWmk9yf8pDAmqYBkj9ZQhmo5pd
         AOLRskymfv6HkgsWNibrmKg0TjwsazGth/qDzJ/o4zJM89dHCBgBEqG9UQRgU1/eAV
         gJ/WAtR6ghzxmCmmmROiUjvKtSDYjdJxqlEgoykrEalsdyfyTXZUWeOoUPB1z85t+o
         H0dv9Fd3NnEAxXwdVCupeBvdcQn5Ofc1AVRAGXIdiAewDLCvFvWJljZ+CGrX2r8jRT
         GhTuNI695anfh09m0xw35Pj1GDz0yTTTutqS7PWCJFhbWnDdP6qvBcwkZktTrlwoNa
         WHzwrJOLEA8qA==
Subject: Re: [PATCH 3/3] media: stk1160: use dma_alloc_noncontiguous API
To:     Christoph Hellwig <hch@lst.de>
Cc:     ezequiel@vanguardiasur.com.ar, linux-media@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl,
        ribalda@chromium.org, tfiga@chromium.org, senozhatsky@google.com,
        kernel@collabora.com
References: <20220111065505.6323-1-dafna.hirschfeld@collabora.com>
 <20220111065505.6323-4-dafna.hirschfeld@collabora.com>
 <20220111081331.GB21713@lst.de>
 <65307131-533a-3de1-7877-ca3020743cbe@collabora.com>
 <20220111085230.GA22703@lst.de>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <6c40de5b-274d-1dc4-3aa5-498343bb3a43@collabora.com>
Date:   Tue, 11 Jan 2022 10:55:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220111085230.GA22703@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 11.01.22 10:52, Christoph Hellwig wrote:
> On Tue, Jan 11, 2022 at 10:50:50AM +0200, Dafna Hirschfeld wrote:
>> I'll send v2 with shorter lines. (the official limit is now 100 char which I still follow).
> 
> No.  It is 80 lines with an exception to go over it if it sigificantly
> improves readability.

Ok, didn't know that.

> 
>> You mean you would call "invalidate_kernel_vmap_range" before "dma_sync_sgtable_for_cpu" ?
> 
> Yes.

Could you explain why?

> 
