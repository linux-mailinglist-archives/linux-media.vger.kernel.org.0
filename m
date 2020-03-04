Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48AFA178B19
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2020 08:09:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387398AbgCDHJE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Mar 2020 02:09:04 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:33390 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727130AbgCDHJE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Mar 2020 02:09:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=xcOQxS31WXqSI2NeANvP6zwq4SdJcjdQbsMqA4Er/KA=; b=my7jb0thoo0WpDZBtjYCAfUwbe
        c/LD6Qffyj2Z+dhqasDRg/WnjuvilNL5RUxXbz7H25Eg2Vy4TTZ2zc/2XhIdZPim7y5FL2a3tNGAD
        R2kHFtSyHjFahOHqp1vjzN8zFZpKf3FObsDeouX5Wj0vElooZys8cQ5Ku45Vog3DZFA9HCmSsDnZ6
        OozdM7Ke63t8JsT3Z6OG+f8M3f67O23CresE90wLxvu5NqVVHHK4UW3EjszaqrykfZiR1CqkKuaAF
        cIsdxW7+xPTTA8VjqXM5bB9xilz1my9w0VlMurngUa0CZCZ36PICaUvY8qp3PaMdlc9VwkFxrG1uj
        6/Gic00g==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1j9O9N-0007EG-5P; Wed, 04 Mar 2020 07:09:01 +0000
Subject: Re: linux-next: Tree for Mar 4 (staging/media/usbvision)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
References: <20200304155458.64c78dcd@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <40c0c50a-5db9-89b7-6620-4905fe343f08@infradead.org>
Date:   Tue, 3 Mar 2020 23:08:59 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200304155458.64c78dcd@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 3/3/20 8:54 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20200303:
> 

This ($subject) driver should depend on USB.  Otherwise there can be build errors:

ld: drivers/staging/media/usbvision/usbvision-core.o: in function `usbvision_write_reg_irq':
usbvision-core.c:(.text+0xdf7): undefined reference to `usb_submit_urb'
ld: drivers/staging/media/usbvision/usbvision-core.o: in function `usbvision_isoc_irq':
usbvision-core.c:(.text+0x1e9f): undefined reference to `usb_submit_urb'
ld: drivers/staging/media/usbvision/usbvision-core.o: in function `usbvision_read_reg':
usbvision-core.c:(.text+0x1fee): undefined reference to `usb_control_msg'
ld: drivers/staging/media/usbvision/usbvision-core.o: in function `usbvision_write_reg':
usbvision-core.c:(.text+0x206e): undefined reference to `usb_control_msg'
ld: drivers/staging/media/usbvision/usbvision-core.o: in function `usbvision_set_output':
usbvision-core.c:(.text+0x21c0): undefined reference to `usb_control_msg'
ld: drivers/staging/media/usbvision/usbvision-core.o: in function `usbvision_set_input':
usbvision-core.c:(.text+0x268c): undefined reference to `usb_control_msg'
ld: drivers/staging/media/usbvision/usbvision-core.o: in function `usbvision_setup':
usbvision-core.c:(.text+0x2950): undefined reference to `usb_control_msg'
ld: drivers/staging/media/usbvision/usbvision-core.o:usbvision-core.c:(.text+0x2a3d): more undefined references to `usb_control_msg' follow
ld: drivers/staging/media/usbvision/usbvision-core.o: in function `usbvision_set_alternate':
usbvision-core.c:(.text+0x2cfd): undefined reference to `usb_set_interface'
ld: drivers/staging/media/usbvision/usbvision-core.o: in function `usbvision_init_isoc':
usbvision-core.c:(.text+0x2dd9): undefined reference to `usb_alloc_urb'
ld: usbvision-core.c:(.text+0x2e0a): undefined reference to `usb_alloc_coherent'
ld: usbvision-core.c:(.text+0x2ec2): undefined reference to `usb_submit_urb'
ld: usbvision-core.c:(.text+0x2ed2): undefined reference to `usb_submit_urb'
ld: drivers/staging/media/usbvision/usbvision-core.o: in function `usbvision_stop_isoc':
usbvision-core.c:(.text+0x2f26): undefined reference to `usb_kill_urb'
ld: usbvision-core.c:(.text+0x2f4b): undefined reference to `usb_free_coherent'
ld: usbvision-core.c:(.text+0x2f59): undefined reference to `usb_free_urb'
ld: usbvision-core.c:(.text+0x2f9d): undefined reference to `usb_set_interface'
ld: drivers/staging/media/usbvision/usbvision-video.o: in function `usbvision_release':
usbvision-video.c:(.text+0xcd8): undefined reference to `usb_free_urb'
ld: drivers/staging/media/usbvision/usbvision-video.o: in function `usbvision_disconnect':
usbvision-video.c:(.text+0xd42): undefined reference to `usb_put_dev'
ld: drivers/staging/media/usbvision/usbvision-video.o: in function `usbvision_radio_close':
usbvision-video.c:(.text+0xdd6): undefined reference to `usb_set_interface'
ld: drivers/staging/media/usbvision/usbvision-video.o: in function `usbvision_probe':
usbvision-video.c:(.text+0x1375): undefined reference to `usb_get_dev'
ld: usbvision-video.c:(.text+0x1488): undefined reference to `usb_alloc_urb'
ld: usbvision-video.c:(.text+0x1843): undefined reference to `usb_put_dev'
ld: drivers/staging/media/usbvision/usbvision-video.o: in function `usbvision_exit':
usbvision-video.c:(.exit.text+0x9): undefined reference to `usb_deregister'
ld: drivers/staging/media/usbvision/usbvision-video.o: in function `usbvision_init':
usbvision-video.c:(.init.text+0x2d): undefined reference to `usb_register_driver'
ld: drivers/staging/media/usbvision/usbvision-i2c.o: in function `usbvision_i2c_write':
usbvision-i2c.c:(.text+0x20e): undefined reference to `usb_control_msg'



-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
