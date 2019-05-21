Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93A7A257C3
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2019 20:49:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728055AbfEUStA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 May 2019 14:49:00 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:38828 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728283AbfEUSs7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 May 2019 14:48:59 -0400
Received: by mail-qk1-f196.google.com with SMTP id a64so11737321qkg.5
        for <linux-media@vger.kernel.org>; Tue, 21 May 2019 11:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Brh6Wum1Zthj/uQ2mtyHFIq9uQlvrAXKSZbEsVapKL8=;
        b=JYscqSP1HPPRVqGuMd5owD3l/IDlGmL6FFL67m798Jm2AP4qGcOTqtawfRNo+5kAFu
         iEJ0vUz9qOZ+rvajt/fb76zKILX2m7sPHzCjQLxU/xpu8s+X3lkRy9CgqtNpDaf0XFJu
         m/SIilww4DfdKs62gi8wE4MGevsPrJgDS2TyvhL/7eUtavobHZ7DqCVwKBcDulDJUjVu
         MVt0CUr2fUDTtnd4Vvag66g4rnBT/cZ1xH3t4yZwYbfafoegD76V6HRafoLD0R1dZ62Z
         EbRvObIPEul9wb7eEhcBGsIGomq6YRkOd3NfdawsXW6Hn11cNpJ1sY5CjCpDM4tjfGZL
         aezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Brh6Wum1Zthj/uQ2mtyHFIq9uQlvrAXKSZbEsVapKL8=;
        b=IfBTF/pJ9H/GH1zTbcnA0pA1mn8NiAmBCM632N/C3W/H9U/clGEvcMYyP1UpQd9rBX
         EXqKRpzyqBbpXCGGDS/SMUhrDjvJL8WSeuINChUx4CnmQuWnBEC2pc1T6Aa4FcDj3jis
         Q8pISolWpc18/9WSMmQbgNKflmwHJVDDWBy8Rx+31lVpYuRePjGxrcfEk2QUchCzp8zT
         TJBdc/QGLd7zU0c8mJLwZtfRHfnGZmiDYvRuRclW4r/NKIdt+bPdCzQgyLntzCnupZ3N
         eBFjxuCB8vyHBaS8P8fyFxZrtXMEF5m6/e+/j1K7Jbavp+jRktM4OlTB0efOcrVh68if
         7d7A==
X-Gm-Message-State: APjAAAX+VCKI5/JPInGyY04GkO9VdN7JEkBbOw9o7Y+k4Webrf3y/KOn
        a77TSLvBUUsipK3JPZUHR7doKw==
X-Google-Smtp-Source: APXvYqwU77tWKnZY68/uvl8nI3fxF+k0K8AI67X6RVtQAbCKMK/pPRLs+1/gDbqNIuNCiuScF9EnOQ==
X-Received: by 2002:a37:358:: with SMTP id 85mr63206066qkd.174.1558464538599;
        Tue, 21 May 2019 11:48:58 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-49-251.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.49.251])
        by smtp.gmail.com with ESMTPSA id u2sm5545370qtq.45.2019.05.21.11.48.57
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 May 2019 11:48:57 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1hT9om-0004QR-Qs; Tue, 21 May 2019 15:48:56 -0300
Date:   Tue, 21 May 2019 15:48:56 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Catalin Marinas <catalin.marinas@arm.com>
Cc:     Andrey Konovalov <andreyknvl@google.com>,
        linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org,
        linux-media@vger.kernel.org, kvm@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kees Cook <keescook@chromium.org>,
        Yishai Hadas <yishaih@mellanox.com>,
        Felix Kuehling <Felix.Kuehling@amd.com>,
        Alexander Deucher <Alexander.Deucher@amd.com>,
        Christian Koenig <Christian.Koenig@amd.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Alex Williamson <alex.williamson@redhat.com>,
        Leon Romanovsky <leon@kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Dave Martin <Dave.Martin@arm.com>,
        Kevin Brodsky <kevin.brodsky@arm.com>,
        Szabolcs Nagy <Szabolcs.Nagy@arm.com>
Subject: Re: [PATCH v15 00/17] arm64: untag user pointers passed to the kernel
Message-ID: <20190521184856.GC2922@ziepe.ca>
References: <cover.1557160186.git.andreyknvl@google.com>
 <20190517144931.GA56186@arrakis.emea.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190517144931.GA56186@arrakis.emea.arm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, May 17, 2019 at 03:49:31PM +0100, Catalin Marinas wrote:

> The tagged pointers (whether hwasan or MTE) should ideally be a
> transparent feature for the application writer but I don't think we can
> solve it entirely and make it seamless for the multitude of ioctls().
> I'd say you only opt in to such feature if you know what you are doing
> and the user code takes care of specific cases like ioctl(), hence the
> prctl() proposal even for the hwasan.

I'm not sure such a dire view is warrented.. 

The ioctl situation is not so bad, other than a few special cases,
most drivers just take a 'void __user *' and pass it as an argument to
some function that accepts a 'void __user *'. sparse et al verify
this. 

As long as the core functions do the right thing the drivers will be
OK.

The only place things get dicy is if someone casts to unsigned long
(ie for vma work) but I think that reflects that our driver facing
APIs for VMAs are compatible with static analysis (ie I have no
earthly idea why get_user_pages() accepts an unsigned long), not that
this is too hard.

Jason
