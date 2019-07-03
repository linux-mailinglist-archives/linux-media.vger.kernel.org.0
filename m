Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29B1C5ECB5
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2019 21:20:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726823AbfGCTUy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jul 2019 15:20:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:45686 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726581AbfGCTUy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 3 Jul 2019 15:20:54 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A989F218A4;
        Wed,  3 Jul 2019 19:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562181653;
        bh=MVMDN4XhcFLvLmPxXPdmheT8Fyttmv50Wohokop0BGs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eAgPd92vSwKyiHcRoLri86VtfD+vNXaulegJ1l00GuU3GvKuvWSWvmFXhRLOx0f/F
         VSe8sQL1g6ifls0rVtnVq+QG7u8xUyzrqqYfTqtxF4v6Y1cSqK5WEIa/Oxr6Dcnz6g
         CcdoPuMzzaKz8uBkLR0sPeYZp14dxW27QAmIG7Po=
Date:   Wed, 3 Jul 2019 21:20:50 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Masanari Iida <standby24x7@gmail.com>
Cc:     linux-kernel@vger.kernel.org, rafael@kernel.org, corbet@lwn.net,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] driver core: node: Fix warning while make xmldocs
Message-ID: <20190703192050.GA20873@kroah.com>
References: <20190624035807.20628-1-standby24x7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190624035807.20628-1-standby24x7@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jun 24, 2019 at 12:58:07PM +0900, Masanari Iida wrote:
> This patch fixes following warning while make xmldocs.
> ./drivers/base/node.c:690: warning: Excess function parameter
>  'mem_node' description in 'register_memory_node_under_compute_node'
> ./drivers/base/node.c:690: warning: Excess function parameter
>  'cpu_node' description in 'register_memory_node_under_compute_node'
> 
> Signed-off-by: Masanari Iida <standby24x7@gmail.com>
> Reviewed-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> ---
>  drivers/base/node.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Someone sent this patch before you did, sorry.

greg k-h
