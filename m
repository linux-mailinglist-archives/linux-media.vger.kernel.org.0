Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32BAECFA13
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2019 14:39:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730923AbfJHMir (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Oct 2019 08:38:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:37518 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730694AbfJHMiq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 8 Oct 2019 08:38:46 -0400
Received: from localhost (unknown [89.205.136.155])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 374482070B;
        Tue,  8 Oct 2019 12:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570538325;
        bh=5jyR2aunmnx/KUpswmJ5Ko60ltn0ViqTwRLPlVma8YE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=R50pLwqIPWvn/qF5BWUABdDTrtC8oJK4Y3/3i+74pbAl8abTJ7FiHInm1Tq7J8RKv
         lz+gl/e96FARB8H+3KV7+h1BF6UXSaU2wXo/qNcWFc1shsyCjEEIWtbxSxMtZxH6wI
         6zYcWCAie+RkPzzRrlS8XvJ3FRv/OCx9ZDIg9gNQ=
Date:   Tue, 8 Oct 2019 14:38:41 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     hariprasad@osuosl.org, Kelam@osuosl.org, hariprasad.kelam@gmail.com
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: [PATCH] staging: media: sunxi: make use of
 devm_platform_ioremap_resource
Message-ID: <20191008123841.GC2763989@kroah.com>
References: <1570517975-32648-1-git-send-email-hariprasad.kelam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1570517975-32648-1-git-send-email-hariprasad.kelam@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 08, 2019 at 12:29:34PM +0530, hariprasad@osuosl.org wrote:
> From: Hariprasad Kelam <hariprasad.kelam@gmail.com>
> 
> fix below issue reported by coccicheck
> drivers/staging//media/sunxi/cedrus/cedrus_hw.c:229:1-10: WARNING: Use
> devm_platform_ioremap_resource for dev -> base
> 
> Signed-off-by: Hariprasad Kelam <hariprasad.kelam@gmail.com>
> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_hw.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

I've dropped all of your patches, please fix up your tool and resend
this as a patch series so we know what order to apply them in.

thanks,

greg k-h
