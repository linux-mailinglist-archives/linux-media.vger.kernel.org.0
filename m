Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DE133B9EC6
	for <lists+linux-media@lfdr.de>; Fri,  2 Jul 2021 12:02:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231378AbhGBKEh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jul 2021 06:04:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:38034 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231340AbhGBKEe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 2 Jul 2021 06:04:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C6336613CD;
        Fri,  2 Jul 2021 10:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625220122;
        bh=M9shyW+u2hUlibuSUqsrhw0+G4/tOavULWXI/ipsb6g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZZNgNYl75+8YJ9gjg5GGL5Llm+arpc1rjvT+zV2Wo6+/ov2f/5mh7oqcP6Ote1tmU
         yaOOKTPMJHfZn1cwxlu2vJJoiYarqxek+j8b75UtY6Abmm8EcR6BF1tQrdCWxMo72m
         +9DjdqKB26bZbOIrqhtTKJvzA8JloqZyIgaRoFLrFhFHv5MngR1HtyUrx/NeT9VqT4
         hCUAd7onalQN8PcZjNmXjtFj3/1E3rAqTar3DD2kPMmd3gDBhHed1+Vkc/2gUjYYtY
         2X+aNcB8iW4eqw83yI4kcJfCkpvsWU7YAiQs+EYXASdEbCeeqpm0XL4HrA8B4i8ZX1
         nwZckTj3F3OZw==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1lzFzj-00031e-Kk; Fri, 02 Jul 2021 12:02:00 +0200
Date:   Fri, 2 Jul 2021 12:01:59 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Rhees <support@usbuirt.com>,
        Oliver Neukum <oneukum@suse.com>
Subject: Re: [PATCH v5 0/2] IR driver for USB-UIRT device
Message-ID: <YN7kF17pfhDr1ccy@hovoldconsulting.com>
References: <cover.1624006513.git.sean@mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1624006513.git.sean@mess.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jun 18, 2021 at 11:18:45AM +0100, Sean Young wrote:
> This is a new rc-core driver for the USB-UIRT which you can see here
> http://www.usbuirt.com/
> 
> This device is supported in lirc, via the usb serial kernel driver. This
> driver is both for rc-core, which means it can use kernel/BPF decoding
> ec. Also this implement is superior because it can:
>  - support learning mode
>  - setting transmit carrier
>  - larger transmits using streaming tx command
>  - Much better latency since it is a kernel driver

A ball-park number to back this claim up would be good here. Your driver
sets the ftdi latency timer to 50 ms which adds quite a bit of latency
for short packets (e.g. a single key press?) to begin with.

> Changes since v4:
>  - Fixed clang warning/uninitialized variable usage
>  - Some cosmetic changes
> 
> Changes since v3:
>  - Review comments from Johan Hovold

In the future, please include some details on what changed also when
addressing review feedback.

>  - Do not move the ftdi_sio.h file an copy FTDI_* definitions instead
> 
> Changes since v2:
>  - Fixed race condition is disconnect
>  - Removed superfluous kmalloc in short tx
> 
> Changes since v1:
>  - Review comments from Oliver Neukum
>  - Simplified wideband read function
> 
> Sean Young (2):
>   media: rc: new driver for USB-UIRT device
>   USB: serial: blacklist USB-UIRT when driver is selected
> 
>  drivers/media/rc/Kconfig      |  11 +
>  drivers/media/rc/Makefile     |   1 +
>  drivers/media/rc/uirt.c       | 744 ++++++++++++++++++++++++++++++++++
>  drivers/usb/serial/ftdi_sio.c |   6 +-
>  4 files changed, 760 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/media/rc/uirt.c

Johan
