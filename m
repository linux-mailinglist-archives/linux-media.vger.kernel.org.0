Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7D3327D426
	for <lists+linux-media@lfdr.de>; Tue, 29 Sep 2020 19:10:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728514AbgI2RJ7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Sep 2020 13:09:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:47692 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725554AbgI2RJ6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Sep 2020 13:09:58 -0400
Received: from coco.lan (ip5f5ad5bc.dynamic.kabel-deutschland.de [95.90.213.188])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CCFF4208B8;
        Tue, 29 Sep 2020 17:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601399398;
        bh=ZHM5fQUcs3Ofyh4Bqos2YQUudJmgsF5M4oKOEmYRqJE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=dQubT9C8mD0703do9azZagfnOelLHEKHsglnjAGKFf+ltrzWZS1Lfu5uVsUYFTxeU
         8CWQzZ6p1xtX12HmVqtXDEy9c/E2mH6pQhBzsDc4I7KRuNZz5ehj7sYD/vjg2MBtt8
         D3arV+JHh5F1jjACfEqeN1mImorydXizV1wmjLYo=
Date:   Tue, 29 Sep 2020 19:09:53 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Malcolm Priestley <tvboxspy@gmail.com>
Cc:     Joe Perches <joe@perches.com>, LKML <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        Julia Lawall <julia.lawall@lip6.fr>
Subject: Re: [likely PATCH] media: lmedm04: Fix misuse of comma
Message-ID: <20200929190953.2f621541@coco.lan>
In-Reply-To: <d4b13e5d-6c97-2594-0ca6-346bb2129b88@gmail.com>
References: <e6cd92faf09722fe729a7de03e7bde592f62499c.camel@perches.com>
        <d4b13e5d-6c97-2594-0ca6-346bb2129b88@gmail.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 24 Aug 2020 21:01:12 +0100
Malcolm Priestley <tvboxspy@gmail.com> escreveu:

> Good catch the interrupt URB is not running because usb_submit_urb is tangled with it.
> 
> It only really affects signal strength.

Yeah, that indeed sounds to be a real bug.

> 
> add
> 
> Fixes: 15e1ce33182d ("[media] lmedm04: Fix usb_submit_urb BOGUS urb xfer, pipe 1 != type 3 in interrupt urb")
> Cc: <stable@vger.kernel.org>
> 
> Regards
> 
> 
> Malcolm

That's said, while here, it sounds weird to use GFP_ATOMIC instead
of GFP_KERNEL for the URB submissions. 

Malcolm,

if you still have the hardware for testing, could you please
check if replacing them by GFP_KERNEL will work?

Thanks!
Mauro

Thanks,
Mauro
