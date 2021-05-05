Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D70A03736EB
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 11:18:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232236AbhEEJTT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 05:19:19 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:55097 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231987AbhEEJTQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 5 May 2021 05:19:16 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id eDfalkaaVyEWweDfelumJB; Wed, 05 May 2021 11:18:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1620206299; bh=uFqvRwOLsMa7SIQMsQ5/JoCIwOaiv0b6VkBg1dtVN3c=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=EyiCUfh4g4r1oXOpTnrOc7cvDVCT4mizeUXhPkrLHVqd4HCUPXYnS/Csu4Ty4YjQL
         o83XyTq5H0kACQ2mruR5HAtwkXiaRlDkkd4QDmA4Ygx1mkUL0YSfi3MdxovTiVC2AY
         VwBQq575GZHxs/MGPdMkhxhCtRAPde8TC+87Sp8uQuaXcUwMUuWriWlJj7k3b/r3hZ
         lXIezVvUFELfHHiSQp0/lUg7r8SngbWshr8giYVATUKpTK2hI0OqJEjSto6BGeFV9o
         Iix2SRAqqBxvAa1FD/00Z6qVCo8TRneI5cPuqILXTFpzEvQQ5r3FDTPghDf7m31LNt
         rae268bThwPJw==
Subject: Re: [PATCH] media: cobalt: fix null-ptr-deref when there is no PCI
 bridge
To:     Tong Zhang <ztong0001@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210424005206.261622-1-ztong0001@gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <b84e0b87-4753-0513-9803-0cda4ceb4adc@xs4all.nl>
Date:   Wed, 5 May 2021 11:18:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210424005206.261622-1-ztong0001@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfEoTHaoLL+uzMYkeMiBfZMc9OFcCGcXwTwWbX1s2vdLVpxIYkt+xcS3wDYUm+2AX4ee9AHwZwSPFMKMXneINE/QyNY5p9O5ZQc17K5MuafpXlAiHg7UK
 kLiZsHESNKJfCzOoWWrvKZEAToXGqADzdeldVCMOj3GfnwPXL+0nOlfptMv7eges425RrR0YXrKwUjeX8TeAbKXiDZMkJuSBA4l1eXs9jPr9qWGv/4rQoJAZ
 9cXRYLyC/wpYYpfqzIUY8IADRMewg0wUSeEZ1bXuXdPmutKrFUx5QEKoOiWS63DF2RQOdAwl7PFZDklLwme1kA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 24/04/2021 02:52, Tong Zhang wrote:
> the PCI bridge might be NULL, so we'd better check before use it
> 
> [    1.870569] RIP: 0010:pcie_bus_link_get_lanes.isra.0+0x26/0x59 [cobalt]
> [    1.875880] Call Trace:
> [    1.876013]  cobalt_probe.cold+0x1be/0xc11 [cobalt]
> [    1.876683]  pci_device_probe+0x10f/0x1c0

How did you test this? With some virtualized PCI bus or something? I'm not sure
how this can happen.

Regards,

	Hans

> 
> Signed-off-by: Tong Zhang <ztong0001@gmail.com>
> ---
>  drivers/media/pci/cobalt/cobalt-driver.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/media/pci/cobalt/cobalt-driver.c b/drivers/media/pci/cobalt/cobalt-driver.c
> index 0695078ef812..5687ed4869ac 100644
> --- a/drivers/media/pci/cobalt/cobalt-driver.c
> +++ b/drivers/media/pci/cobalt/cobalt-driver.c
> @@ -189,6 +189,8 @@ void cobalt_pcie_status_show(struct cobalt *cobalt)
>  	u32 capa;
>  	u16 stat, ctrl;
>  
> +	if (!pci_bus_dev)
> +		return;
>  	if (!pci_is_pcie(pci_dev) || !pci_is_pcie(pci_bus_dev))
>  		return;
>  
> @@ -247,6 +249,8 @@ static unsigned pcie_bus_link_get_lanes(struct cobalt *cobalt)
>  	struct pci_dev *pci_dev = cobalt->pci_dev->bus->self;
>  	u32 link;
>  
> +	if (!pci_dev)
> +		return 0;
>  	if (!pci_is_pcie(pci_dev))
>  		return 0;
>  	pcie_capability_read_dword(pci_dev, PCI_EXP_LNKCAP, &link);
> 

