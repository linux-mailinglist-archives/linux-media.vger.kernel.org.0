Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63198429B36
	for <lists+linux-media@lfdr.de>; Tue, 12 Oct 2021 03:57:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230516AbhJLB7L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Oct 2021 21:59:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbhJLB7J (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Oct 2021 21:59:09 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2748BC06161C
        for <linux-media@vger.kernel.org>; Mon, 11 Oct 2021 18:57:09 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id x4so12505909pln.5
        for <linux-media@vger.kernel.org>; Mon, 11 Oct 2021 18:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8a2/JQmuX57q2aJcf/iLLoukKQpiybtglq5HXNGxygk=;
        b=PF5vNeMNX9icXXQWUjw/IfVkmeyvFN8puq/1IIkvkghg5Xvth78HKDEiB2/0abuRWD
         YgylLNMG+Krukn/+gt8Q+0JLMQl8kbW62p/YuHM/DDYZO00e4H9BLLcEojJMsdkbf1GW
         EnF8hdhlzzKwCB5FeYJsPHzJJxT0j/QJoCS24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8a2/JQmuX57q2aJcf/iLLoukKQpiybtglq5HXNGxygk=;
        b=dB2d6b2dB5d2LtQuGGywVsJ/hLd+aubtzgAJ7ZQsJQMSs7mCjiUBJhL80oQNlIJS4y
         PXMwUgtAqY70Z5oGXjjzveCDSwK370Aa+HBAdrZnDxs+v/+fwZFa9rzF7PuqnTOI7NQW
         L/VlTaoC2oS4xxLRVuDU1JW8Rh0xxCZ/kg4PnxSOF5mGxBHM2FLQ+qP4KVbEQRt1jg0Q
         MYhVx8Zs/9QYwfY36J8A8aJP4ZRwDP68/TNyBXrcICIZo+0GkJvLo/OmtgqMwGe0D1aH
         ob6kuZoJQ4qrZZP/XjM2Zhk7HlEkNme1ntK1GcDNqwIK1Cn2mdE2vJVi6CJ45+A1bnd8
         ZZgw==
X-Gm-Message-State: AOAM531osS6zfvfJwE5IAQkRNV4GEUVmheOEFljhx1QxLVFT2pdXxqE7
        4CCR+u/YUwIU42bbCCz/lK472g==
X-Google-Smtp-Source: ABdhPJzcFDpZfHc3nRVVa+/bAj0gmaEk7b2C9Ped1tQLsHMJultYAblQyLdBAYeCsoDxNIF9/iTxSw==
X-Received: by 2002:a17:90b:4011:: with SMTP id ie17mr2858973pjb.41.1634003828296;
        Mon, 11 Oct 2021 18:57:08 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:61aa:8522:1051:5bfe])
        by smtp.gmail.com with ESMTPSA id h23sm5850281pfn.109.2021.10.11.18.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 18:57:07 -0700 (PDT)
Date:   Tue, 12 Oct 2021 10:57:03 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: videobuf2: always set buffer vb2 pointer
Message-ID: <YWTrb0ZXv1HRmtfZ@google.com>
References: <20210928034634.333785-1-senozhatsky@chromium.org>
 <CAAFQd5DLiW23a0U_JjnpvoYmpcbiKbStq7=w=7KvbDP7zLvBaA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAFQd5DLiW23a0U_JjnpvoYmpcbiKbStq7=w=7KvbDP7zLvBaA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (21/10/05 18:57), Tomasz Figa wrote:
> 
> On Tue, Sep 28, 2021 at 12:46 PM Sergey Senozhatsky
> <senozhatsky@chromium.org> wrote:
> >
> > We need to always link allocated vb2_dc_buf back to vb2_buffer because
> > we dereference vb2 in prepare() and finish() callbacks.
> >
> > Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> > ---
> >  drivers/media/common/videobuf2/videobuf2-dma-contig.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> 
> Acked-by: Tomasz Figa <tfiga@chromium.org>

Hans, can you please pick up this patch?
