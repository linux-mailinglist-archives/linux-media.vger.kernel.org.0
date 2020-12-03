Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1E5F2CCFF2
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 08:01:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729869AbgLCG7Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 01:59:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:47240 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728504AbgLCG7Q (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Dec 2020 01:59:16 -0500
Date:   Thu, 3 Dec 2020 07:58:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1606978715;
        bh=Fu9tz/sh/yOgpodhK2H4OqIRoG0GkJQokegzcl+1hz4=;
        h=From:To:Cc:Subject:In-Reply-To:References:From;
        b=dGcndHJZRoBW4MntP9X7J99aSn1Q+XuJ3nbw187QuT3cu5uifY9fXV2NVv+J4i7ls
         hO6sp44jmf7FA4/662xtrOoGRceIWLNMGBvuOwH10kjmT01YLYDfAS4Em/RB/K9zCh
         FGMl/YC/0p4oWNrFpBJDVqqkQXEKkVd+TW6XA1U+2bKTj6Vxjl/fTrsXvQKaF8FDRs
         aOq/iNFpaJFE0dUfEVrBZIC+mi3yW+Nj/Pcnra3cX8T6gsiQPeSQJpOGBXQKzZZp0Z
         bEEFtyVc4Smj9fvjFxURfjXH+YrSYCIm2cjtEba5g+VZgNruS+e/pfx6EJVthsGsPS
         IqaD3YRctLY7Q==
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     koji.matsuoka.xm@renesas.com,
        niklas.soderlund+renesas@ragnatech.se,
        laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 0/2] media: rcar-vin: Mask access to VNCSI_IFMD
 register
Message-ID: <20201203075830.2701c8b5@coco.lan>
In-Reply-To: <20201126074757.2768-1-jacopo+renesas@jmondi.org>
References: <20201126074757.2768-1-jacopo+renesas@jmondi.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 26 Nov 2020 08:47:55 +0100
Jacopo Mondi <jacopo+renesas@jmondi.org> escreveu:

> As reported in patch 2/2 commit message the the VNCSI_IFMD register
> has the following limitations according to chip manual revision 2.20
> 
> - V3M, V3H and E3 do not support the DES1 field has they do not feature
> a CSI20 receiver.
> - D3 only supports parallel input, and the whole register shall always
> be written as 0.
> 
> This patch upports the BSP change commit f54697394457
> ("media: rcar-vin: Fix VnCSI_IFMD register access for r8a77990") from
> Koji Matsuoka

As checkpatch warned:

	-:22: WARNING: Unknown commit id 'f54697394457', maybe rebased or not pulled?
	
There's no such commit upstream. Are you referring to an OOT patch?

If so, you should provide an URL from where the patch is stored,
as otherwise this comment won't make any sense upstream.

If you can't provide such URL, please adjust the comment to provide
a description that won't be dependent of such OOT commit.

> 
> Tested on r-car E3 Ebisu.
> 
> v2 -> v3:
> - Remove a few comments and add Niklas' tag to [2/2]
> 
> v1 -> v2:
> - Inspect the channel routing table to deduce the availability of DES1/DES0
>   bits as suggested by Niklas.
> 
> Jacopo Mondi (2):
>   media: rcar-vin: Remove unused macro
>   media: rcar-vin: Mask VNCSI_IFMD register
> 
>  drivers/media/platform/rcar-vin/rcar-dma.c | 26 ++++++++++++++++++----
>  1 file changed, 22 insertions(+), 4 deletions(-)
> 
> --
> 2.29.1
> 



Thanks,
Mauro
