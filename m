Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95539369F0C
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 08:34:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229850AbhDXGfc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 02:35:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbhDXGfb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 02:35:31 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4B95C061574;
        Fri, 23 Apr 2021 23:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
        :In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=u+7u5YAxSddNuwZ0iuXyACMe11u6Ld/9nAcCfy7chps=; b=gp9oV5hZDj6kTzqn/Thq7VwT8j
        D+Hkq8sp+XV5nw79gt3NT9ZK4yO/a6DwQBzqSHeQE5IE8of33UZEArZZcaxjF5f2b69PHmcS9e7Gu
        ykP0FI2l/po5qieSCj4ojbaZe7shsyQxUtW826u9UD88a6nx6cpT5evqBVPAe8Pxq5RgzFp9ytfiN
        0YPWTJafNv/yKhMCVNYjQJf/Aghvd3FsplhNKT9qFaX7qKbhrs2tOnZsY/DmMDsjMXKdYNOBdq3dX
        YBsEPGI/RKDjP6JMQ7pg0vBsOVuc1p+rGt2CRmUkcxPgHSCs/VNPbgT4t0HESO2vlaT6dzn6VA1b3
        0Chc8tjg==;
Received: from [2601:1c0:6280:3f0::df68]
        by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1laBsN-003AJB-7c; Sat, 24 Apr 2021 06:34:50 +0000
Subject: Re: [PATCH 2/2] media: rc: clean up Kconfig dependencies
To:     Arnd Bergmann <arnd@kernel.org>, Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210421135935.3653827-1-arnd@kernel.org>
 <20210421135935.3653827-2-arnd@kernel.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <ecc20ef0-e12e-884b-38c1-681fb02a59b6@infradead.org>
Date:   Fri, 23 Apr 2021 23:34:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210421135935.3653827-2-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 4/21/21 6:58 AM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> I came across a randconfig build failure from one driver
> that only depends on CONFIG_USB_ARCH_HAS_HCD but fails when
> built without CONFIG_USB:
> 
> ld: drivers/media/rc/ir_toy.o: in function `irtoy_disconnect':
> ir_toy.c:(.text+0x24): undefined reference to `usb_kill_urb'
> ld: ir_toy.c:(.text+0x2c): undefined reference to `usb_free_urb'
> ld: ir_toy.c:(.text+0x34): undefined reference to `usb_kill_urb'
> ld: ir_toy.c:(.text+0x3c): undefined reference to `usb_free_urb'
> 
> Upon a closer look, I find that a lot of the other drivers
> 'select USB' rather than stating 'depends on USB' as is common
> for most subsystems. I also find that all except one driver
> have an extra 'depends on RC_CORE' that is already implied by
> the top-level 'if RC_CORE' check.
> 
> Clean up both by reducing the dependencies to the required set.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  drivers/media/rc/Kconfig | 73 ++++++----------------------------------
>  1 file changed, 11 insertions(+), 62 deletions(-)
> 

-- 
~Randy

