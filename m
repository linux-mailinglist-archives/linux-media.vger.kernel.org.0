Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9010698D8A
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2019 10:23:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731619AbfHVIXd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Aug 2019 04:23:33 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:41471 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbfHVIXc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Aug 2019 04:23:32 -0400
Received: by mail-wr1-f67.google.com with SMTP id j16so4517382wrr.8
        for <linux-media@vger.kernel.org>; Thu, 22 Aug 2019 01:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=mHJwv/dmEXrbQ0yLWkXi+BJ6R6ibM6vVujAbVHAGxf8=;
        b=oQmP8Nr0nPGEfRgu9DLXQMVLv7gXQdsBuM9zA2zLlZAmD0nkbID7M0rmA49HscEo4r
         jkIZkfiY0Ab6BTng3I8gW8DS/YtZe2GdcxQv8Rlod5YE169PIYiFLrjCZnPJ735npgEx
         NmvIT80AgAZjdAGgjv1lkvziK1XxAROXIsRx59hIMgzbNuYm919FLN+kZr/OURAdcQdA
         SJGQfFqOC6GwwJHjRLbjHGojdnm9Df2s4IoFBZMGKIJsLGQ4AW0EoiLTHwYAf04N4kbq
         2S7cl1/XDidDpnS72jkoiJUJ74vOMWaHMTQTGsw/Y4IfH9KoO6UV502OzYOUUOsDzRVw
         WQTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:subject:to:cc:references:from
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=mHJwv/dmEXrbQ0yLWkXi+BJ6R6ibM6vVujAbVHAGxf8=;
        b=nVgMtE5QG7umzNouMkIkdbeSUs2wcLx96pmDsD43A92FFiV0HcVykd1R9YpNNJVTxh
         nL6UBKYoOjxo6xABBS3084ShuZLkH0QuasRtoN/XrNb8Qms2y53sNunVAHTX11giTWja
         2w4BjS2DS5+yOAQoISoekimnkRV7rt3wqzca+DzgztGBRgTOB2w+m5OyZ7lRNJK7ivbP
         qNad1W/f3G+Uj6mBI4aIKWuwNS4PvhMd3oEwrNEnGVMnnsNrUYtO3qARLkobUq+w4AG/
         e8m2iBc+Tjjj2uqv4YBxBzJflRz6Z3iogbU65VwYCzfTeGyMusrapizrCGUSdc6NsTFj
         iWAQ==
X-Gm-Message-State: APjAAAVH8WwWRX9hudJ4AZ0t9WFoSnR//HFH3vdE6wZOsXNjMsjwemxa
        5NC3XLUq1LO6GAVcK5J7x8c=
X-Google-Smtp-Source: APXvYqxtA5/FlOVudUnT39p+G3xdnBUDJ3HdAqwO8tUek7poJGRDB0yTGr3f57tMjA0UXKHO+6FOUQ==
X-Received: by 2002:a05:6000:4d:: with SMTP id k13mr45696163wrx.196.1566462211182;
        Thu, 22 Aug 2019 01:23:31 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7? ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
        by smtp.gmail.com with ESMTPSA id s192sm2324408wme.17.2019.08.22.01.23.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Aug 2019 01:23:30 -0700 (PDT)
Reply-To: christian.koenig@amd.com
Subject: Re: [PATCH 07/10] dma-buf/resv: add new fences container
 implementation
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
        daniel.vetter@ffwll.ch, sumit.semwal@linaro.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20190821123147.110736-1-christian.koenig@amd.com>
 <20190821123147.110736-8-christian.koenig@amd.com>
 <20190821160454.GN11147@phenom.ffwll.local>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <c1ff88ef-0e49-fd7a-6317-de432a04ddf2@gmail.com>
Date:   Thu, 22 Aug 2019 10:23:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190821160454.GN11147@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 21.08.19 um 18:04 schrieb Daniel Vetter:
> On Wed, Aug 21, 2019 at 02:31:44PM +0200, Christian König wrote:
>> [SNIP]
>> +	/* Try to drop the last reference */
>> +	if (!dma_fence_array_recycle(staged))
> Without an rcu barrier here you're not syncing to new clients at all.
> I don't think this works, and I expect that once you've readded all the
> barriers and retry loops we're back to seqlocks.

The key difference is that RCU users now use dma_fence_get_rcu_safe() to 
grab a reference to the current set of fences.

In other words the whole array is reference counted and RCU protected 
instead of each individual entry in the array.

This way you don't need the sequence count any more because you grab a 
reference to all of them at once and then can be sure that they don't 
change.

Regards,
Christian.

> -Daniel

