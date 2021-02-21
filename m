Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 803DD320DF4
	for <lists+linux-media@lfdr.de>; Sun, 21 Feb 2021 22:35:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230377AbhBUVe3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Feb 2021 16:34:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230177AbhBUVeV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Feb 2021 16:34:21 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15911C061574;
        Sun, 21 Feb 2021 13:33:38 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 55E0FE9;
        Sun, 21 Feb 2021 22:33:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613943215;
        bh=YWTHIZoxgpR8Ou0HcqMarxiDNYz+5jx52AA0RzNdiVE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mIY8fVoDs14eAj6GmpKVOQflWCt6OkzKOdVLl20gCjT8yquXiIAeN61pgzs1dFliG
         gK9NbsB5ckWNe1BI9vqdJoca1kEyU6mCSZqu0mu2c0XHW+2tR8sL7qd0t12AZaFtPG
         QkzXMmJcPX0UNRJOcS1Kz0AVb4CJmdwLcYYU8o2w=
Date:   Sun, 21 Feb 2021 23:33:05 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     "Nikolay K." <knv418@gmail.com>
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH] staging: media: omap4iss: code style - avoid macro
 argument precedence issues
Message-ID: <YDLRkUKPo3nCzwPY@pendragon.ideasonboard.com>
References: <YDLO4CZlZH+sxFNV@msi.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YDLO4CZlZH+sxFNV@msi.localdomain>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nikolay,

On Mon, Feb 22, 2021 at 12:21:36AM +0300, Nikolay K. wrote:
> Hi Laurent,
> 
> Thank you for the review.
> I think that if we drop the unneeded parentheses here, we need to drop
> them everywhere in the file for consistency, even in places checkpatch.pl

That's a good point.

> doesn't warn about. It'll increase patch size without actual usefullness 
> gain, as for me. I am very (very) novice to the kernel,
> but who wants slightly more readable one-line simple macros?

Let's keep your patch as-is, we can drop the unneeded parentheses in a
subsequent patch if desired.

-- 
Regards,

Laurent Pinchart
