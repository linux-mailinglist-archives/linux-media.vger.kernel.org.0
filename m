Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 717023B764E
	for <lists+linux-media@lfdr.de>; Tue, 29 Jun 2021 18:13:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232333AbhF2QQV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Jun 2021 12:16:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232094AbhF2QQV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Jun 2021 12:16:21 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD452C061760;
        Tue, 29 Jun 2021 09:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
        Subject:Sender:Reply-To:Cc:Content-ID:Content-Description;
        bh=bsKC9hStNBxuu6z8fnR5NzqDvI7AeyhXRMRevJVYHrk=; b=qNVOXCTL20VkHlA4aF6HTQMYx1
        LwtsMk563uq2iLCQKeNz2vEbVi79OhH4rwWM+n/962CaICI2xp1ymzoT59n3Y1cZyx+1tmb234wbK
        4DZRThJQFFLj8PqPFDlvGq1HlAamikuMQWNVFs1tv74haCX4CjQzm3682WIOnLelMIzRXHV3P5sGO
        ts3RM77M/fnFZHkiVQRi7ge0Js3VNR+b8E6HpqdZcY3PtV/OlwpW0JvcppiTnEeb8gSkYpSScF0iL
        j/CGyQwNzgiHdPb3UHEa4kB7Yr1qeKJJyzAHNVD2YX+ENKnxdy6iWxPVtalm7v589CHO7qNN+ITaU
        PIAUkCbA==;
Received: from [2601:1c0:6280:3f0::aefb]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1lyGMy-00Baeg-De; Tue, 29 Jun 2021 16:13:52 +0000
Subject: Re: [PATCH -next] <linux/dma-resv.h>: correct a function name in
 kernel-doc
To:     linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
References: <20210628004012.6792-1-rdunlap@infradead.org>
 <YNtCYyHXOrObRUDK@phenom.ffwll.local> <YNtF6aiUSqngxXoq@phenom.ffwll.local>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <5a89fa0e-1d28-ba64-e5ea-fd577a1dc4ac@infradead.org>
Date:   Tue, 29 Jun 2021 09:13:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YNtF6aiUSqngxXoq@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/29/21 9:10 AM, Daniel Vetter wrote:
> On Tue, Jun 29, 2021 at 05:55:15PM +0200, Daniel Vetter wrote:
>> On Sun, Jun 27, 2021 at 05:40:12PM -0700, Randy Dunlap wrote:
>>> Fix kernel-doc function name warning:
>>>
>>> ../include/linux/dma-resv.h:227: warning: expecting prototype for dma_resv_exclusive(). Prototype was for dma_resv_excl_fence() instead
>>>
>>> Fixes: 6edbd6abb783d ("ma-buf: rename and cleanup dma_resv_get_excl v3")
> 
> Script caught a lost      'd' here, I fixed that up when applying.
> -Daniel

Oops. Thanks.

~Randy

