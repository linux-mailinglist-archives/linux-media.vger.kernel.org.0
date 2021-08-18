Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 080C33F06D6
	for <lists+linux-media@lfdr.de>; Wed, 18 Aug 2021 16:37:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238652AbhHROh4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Aug 2021 10:37:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:41250 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237927AbhHROhz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Aug 2021 10:37:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 42E4B610CB;
        Wed, 18 Aug 2021 14:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1629297440;
        bh=sq3THO01fYmhpHJuXoAHw1MIoL0xlYlPOhjB/eQF+2c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Jk+AIBzhfhB9WC4Pk0esN1ayqon6I6ue7BZk4o0gJAc0M3kp/fkCm/r90zLYu+O+Y
         iNpbMra5xHKVzc5pg8ivqjm9zy8DPFCA7JGWZ2t6HKYkWSP49Xx1W/fwlCR8J0C0bj
         Xkl7YTct2H+p4m662kKbemb24XJi88ivpOYRyA6w=
Date:   Wed, 18 Aug 2021 16:37:18 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     sidraya.bj@pathpartnertech.com
Cc:     linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        prashanth.ka@pathpartnertech.com, praneeth@ti.com,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        praveen.ap@pathpartnertech.com
Subject: Re: [PATCH 02/30] v4l: vxd-dec: Create mmu programming helper library
Message-ID: <YR0bHiKzSa5hXhVj@kroah.com>
References: <20210818141037.19990-1-sidraya.bj@pathpartnertech.com>
 <20210818141037.19990-3-sidraya.bj@pathpartnertech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210818141037.19990-3-sidraya.bj@pathpartnertech.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Aug 18, 2021 at 07:40:09PM +0530, sidraya.bj@pathpartnertech.com wrote:
> From: Sidraya <sidraya.bj@pathpartnertech.com>
> 
> The IMG D5520 has an MMU which needs to be programmed with all
> memory which it needs access to. This includes input buffers,
> output buffers and parameter buffers for each decode instance,
> as well as common buffers for firmware, etc.
> 
> Functions are provided for creating MMU directories (each stream
> will have it's own MMU context), retrieving the directory page,
> and mapping/unmapping a buffer into the MMU for a specific MMU context.
> 
> Also helper(s) are provided for querying the capabilities of the MMU.
> 
> Signed-off-by: Buddy Liong <buddy.liong@ti.com>
> Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
> Signed-off-by: Sidraya <sidraya.bj@pathpartnertech.com>
> ---
>  MAINTAINERS                               |   2 +
>  drivers/staging/media/vxd/common/imgmmu.c | 782 ++++++++++++++++++++++
>  drivers/staging/media/vxd/common/imgmmu.h | 180 +++++

Why are you adding new stuff to staging?  Why can it not just go to the
"real" part of the kernel?

If it is to go into staging, we need a TODO file that lists what needs
to be done to get it out of staging.

thanks,

greg k-h
