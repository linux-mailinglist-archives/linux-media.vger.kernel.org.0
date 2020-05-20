Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28DD91DAC88
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2020 09:48:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726452AbgETHsl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 May 2020 03:48:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:34492 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726224AbgETHsl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 May 2020 03:48:41 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 370D1207D3;
        Wed, 20 May 2020 07:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589960920;
        bh=dE62lfUPQJJOEo7Uj+Gti0PkcS/qeTWaULz5hYO6V3I=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=YDKdeb3Iweh4qJCGTQgpf9ccv/piyi1BsZ4v5l33CodSgy7x/XDAiHZVs0/DhMNSw
         8P8LzVLriDtsb6zwo3y8w2Cb0UpkDwqJabnsKbcIRt/ZULK8BYswjJuQXv0Dg/olDY
         8B1dbN6dTwH6f9vgC5k/7C54AX3ic7jzZ3BcrKQQ=
Date:   Wed, 20 May 2020 09:48:36 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-media@vger.kernel.org, Alan Cox <alan@linux.intel.com>,
        Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
        linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] Ressurect the atomisp staging driver
Message-ID: <20200520094836.51480c7b@coco.lan>
In-Reply-To: <20200502060355.GA2524474@kroah.com>
References: <20200501215741.3be05695@coco.lan>
        <20200502060355.GA2524474@kroah.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sat, 2 May 2020 08:03:55 +0200
Greg KH <gregkh@linuxfoundation.org> escreveu:

> On Fri, May 01, 2020 at 09:57:41PM +0200, Mauro Carvalho Chehab wrote:
> > This driver is simply too big for it to be sent to the ML via e-mails. Those
> > will very likely be rejected due to the e-mail sizes.
> > 
> > So, instead, I'm sending a "GIT PULL" to myself, at the ML.
> > 
> > This series basically "resurrect" this driver from the death, giving it a
> > second chance to survive.  
> 
> Hah, good luck!  Without the hardware I think you are going to be
> fighting a loosing battle, best of luck...

I got one hardware, based on ISP 2401 (PCI ID 8086:22b8). 

I did lots of progress at the driver. Well, there are a lot more to be
done, but I'm confident we'll be able to make it run.

Getting it out of staging will require *lots* of time and efforts,
but I guess it would be doable (long term).

Thanks,
Mauro
