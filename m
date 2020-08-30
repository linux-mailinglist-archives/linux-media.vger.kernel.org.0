Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A01A1256CC0
	for <lists+linux-media@lfdr.de>; Sun, 30 Aug 2020 10:11:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728609AbgH3ILJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 30 Aug 2020 04:11:09 -0400
Received: from gofer.mess.org ([88.97.38.141]:49287 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727859AbgH3IKe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 30 Aug 2020 04:10:34 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id E4624C63F6; Sun, 30 Aug 2020 09:10:04 +0100 (BST)
Date:   Sun, 30 Aug 2020 09:10:04 +0100
From:   Sean Young <sean@mess.org>
To:     Vaibhav Gupta <vaibhavgupta40@gmail.com>
Cc:     Bjorn Helgaas <helgaas@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Helgaas <bjorn@helgaas.com>,
        Vaibhav Gupta <vaibhav.varodek@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Kozlov <serjk@netup.ru>, Abylay Ospan <aospan@netup.ru>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v1] [media] netup_unidvb: use generic power management
Message-ID: <20200830081004.GA17376@gofer.mess.org>
References: <20200728092717.937023-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200728092717.937023-1-vaibhavgupta40@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jul 28, 2020 at 02:57:17PM +0530, Vaibhav Gupta wrote:
> The .suspend() and .resume() callbacks are not defined for this driver.
> Still, their power management structure follows the legacy framework. To
> bring it under the generic framework, simply remove the binding of
> callbacks from "struct pci_driver".

Unlisted fields in a static struct initializer will get set to 0 (or NULL
for pointers) already. Removing the NULL initializers will not change
anything.

Possibly you want to remove the redundant initializers but your commit
message should say so.


Sean

> 
> Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> ---
>  drivers/media/pci/netup_unidvb/netup_unidvb_core.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/media/pci/netup_unidvb/netup_unidvb_core.c b/drivers/media/pci/netup_unidvb/netup_unidvb_core.c
> index 80a7c41baa90..6f3125c2d097 100644
> --- a/drivers/media/pci/netup_unidvb/netup_unidvb_core.c
> +++ b/drivers/media/pci/netup_unidvb/netup_unidvb_core.c
> @@ -1016,8 +1016,6 @@ static struct pci_driver netup_unidvb_pci_driver = {
>  	.id_table = netup_unidvb_pci_tbl,
>  	.probe    = netup_unidvb_initdev,
>  	.remove   = netup_unidvb_finidev,
> -	.suspend  = NULL,
> -	.resume   = NULL,
>  };
>  
>  module_pci_driver(netup_unidvb_pci_driver);
> -- 
> 2.27.0
