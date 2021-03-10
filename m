Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9590333BE2
	for <lists+linux-media@lfdr.de>; Wed, 10 Mar 2021 13:00:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230122AbhCJMAA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Mar 2021 07:00:00 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:47903 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229660AbhCJL7r (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Mar 2021 06:59:47 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id JxV8lFzNmOruFJxVBlWx7M; Wed, 10 Mar 2021 12:59:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615377585; bh=gwu69jGIX73d8Uetdw6p5XyWmdWYd1n+ELH+7lHx0rU=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=YF7ggZ+wMQZveFw/MJ+XlxjljMu1PvugiPuxUS8THY58u/ykRD3BN5mRUBx3eF0cD
         EbHZjumEbBTCTr6jq9XJRe1whaIDtq1NoiX7yJTJx53G9xrzvnNV+hB/Xj5fI1nK7b
         s7QbVED+BO4QXPv0ohoIPsvbyIG32T5gXPpdbf5oORj1K0iLesLyTw9/in7DaGYCBz
         StGdqBtZo5/BGM6JFLgUKCNFJy/CTTKTlOW9iLhlGyg+9ngPKKXten1Rp1iA80KyEZ
         eQt3dnDdoJCavdNqsPQILi6yRoH6D8Nv6L7qI6PDaPsly4by2DpvsXk33cphrXVs1f
         uX/pW5CtGHb/Q==
Subject: Re: saa7164 Driver Memory Leakage, Would like to write the fix myself
To:     =?UTF-8?B?15PXoNeZ15DXnCDXoNeZ15E=?= <danielniv3@gmail.com>,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        mortonm@chromium.org
Cc:     gilad.reti@gmail.com
References: <CAKT5RCDZSMRmcy-3Qyn3boKfh7LBvm_R_vhbZuVpRZJv-zGe5A@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <2a76ee9e-593e-c0a5-6fff-755449c3db24@xs4all.nl>
Date:   Wed, 10 Mar 2021 12:59:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAKT5RCDZSMRmcy-3Qyn3boKfh7LBvm_R_vhbZuVpRZJv-zGe5A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfKmrhhf7He+yK/t+YZ8sCWsC7EtpScZLIBNAGW4pyQscdJVC76e9fkxT6CI9BOAqjWmj1JzLPrDbm+SGE7zUc6wUhzcOlslWEQDlgE+0ofQX5uE0jTJj
 DS6Vmlssh4Yx3RrdRFsKh2rnY63Dwqx2xuetEu/wk6e2DkK51QKPo2NN9l7qWvK9ZcI1B9l8S/uNJgD7ERqefYi4BE8vBdfTOeaH1KE+RMbiSQKN+56k3fG1
 +r1ZvSc8K/63aMe1IUDz0h9zSYbD9j6x6X6xbPGvvMdmaj0HNsBdnqv2vy8pawbGNiGHfyRkLVzccQ1QXaZuRQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

On 10/03/2021 12:40, דניאל ניב wrote:
> Hello all,
> after looking on the linux kernel source code(version 5.11.15) of the saa7164 driver, it seems like I found a memory leak.
> I couldn't find a specific person that maintains the saa7164 driver in the kernel maintainers file, so I hope you can help me or forward me
> to the right person.
> 
> The leak is located at /drivers/media/pci/saa7164/saa7164-encoder.c file, in the next function:
> int saa7164_encoder_register(struct saa7164_port *port)
> 
> The bug is actually allocation of memory in the kernel heap, without explicitly freeing it.
> 
> The memory allocation is happening here
> (https://github.com/torvalds/linux/blob/v5.8/drivers/media/pci/saa7164/saa7164-vbi.c#L720
> <https://github.com/torvalds/linux/blob/v5.8/drivers/media/pci/saa7164/saa7164-vbi.c#L720>):
> /* Allocate and register the video device node */
> port->v4l_device = saa7164_vbi_alloc(port,dev->pci, &saa7164_vbi_template, "vbi"); 
> 
> and if we look deeper in the function saa7164_vbi_alloc(...), we can see it eventually uses kzalloc() in order to allocate the memory.
> Looking again at saa7164_encoder_register(...) function, we can see the next code block
> (https://github.com/torvalds/linux/blob/v5.8/drivers/media/pci/saa7164/saa7164-vbi.c#L734
> <https://github.com/torvalds/linux/blob/v5.8/drivers/media/pci/saa7164/saa7164-vbi.c#L734>):
> if (result < 0) {
> 	printk(KERN_INFO "%s: can't register vbi device\n",
> 	dev->name);
> 	/* TODO: We're going to leak here if we don't dealloc
> 	The buffers above. The unreg function can't deal wit it.
> 	*/
> 	goto failed;
> 	}
> 
> ````````failed:
> 	return result;
> 	
> 
> that actually exists from the function without freeing the memory it allocated earlier.
> This flow seems to happen when we can't register a vbi device.
> It seems like we can trigger this flow. 
> 
> I would like to add some code that will free the allocated memory and fix the bug,
> but I want to ask first if there is a point in doing that? will it be merged into the driver code?

Sure, we accept patches for fixes like that. Just post the patch to the linux-media mailinglist.

Make sure that you do post ascii only emails to the mailinglist, HTML emails (like the one
you sent) will be silently dropped.

This should be helpful:

https://www.kernel.org/doc/html/latest/process/submitting-patches.html

Regards,

	Hans

> 
> Thanks in advance,
> Danie Niv.
> 

