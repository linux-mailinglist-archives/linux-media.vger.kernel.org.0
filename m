Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67AA636E628
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 09:39:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239698AbhD2Hi4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Apr 2021 03:38:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:38582 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231701AbhD2Hiy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Apr 2021 03:38:54 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8702661440;
        Thu, 29 Apr 2021 07:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619681888;
        bh=Y5crhDIS0X94Stj4taWISifyBjWiDlyEREug0v7j/OI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=OJG3pGxq/gzp0qcJrK4Fp3ViY6gx1JeLW4gLq02MzOAna5k0LzekaFNduyW/6MpFZ
         YHYx3csBuKFHZJjC/szlyuF3hqyxcn3CxAN/CGNX+DOalvNJ8opf5pzLWng53xz5TE
         6JkilcpcSTSw8JKfB8cEwyhhdpdvGcOFq6svZDHUaqi/ukE5+Hk010w5flQET5Xxku
         1gVmS+IapfAj0A8ehu3xge59x/Hny23j0dVjkWVJLI1y3LssOgBbbKUdVs4fzm1M2J
         VtGHDACSlzatSWaFXsEpxaotb6LFQ4W4/CYm9bVK7ohLllaaDYmiaZEs0hQXoH78A3
         Y/e9p2bFdDoEw==
Date:   Thu, 29 Apr 2021 09:38:02 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     devel@driverdev.osuosl.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linuxarm@huawei.com, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v4 20/79] staging: media: rkvdec: fix
 pm_runtime_get_sync() usage count
Message-ID: <20210429093802.01ed6980@coco.lan>
In-Reply-To: <YIl6xZegj9o5m8EF@hovoldconsulting.com>
References: <cover.1619621413.git.mchehab+huawei@kernel.org>
        <4bc46252a7c7ae3612da6da8620ef7db775e27ca.1619621413.git.mchehab+huawei@kernel.org>
        <YIl6xZegj9o5m8EF@hovoldconsulting.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 28 Apr 2021 17:09:57 +0200
Johan Hovold <johan@kernel.org> escreveu:

> On Wed, Apr 28, 2021 at 04:51:41PM +0200, Mauro Carvalho Chehab wrote:
> > The pm_runtime_get_sync() internally increments the
> > dev->power.usage_count without decrementing it, even on errors.
> > Replace it by the new pm_runtime_resume_and_get(), introduced by:
> > commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> > in order to properly decrement the usage counter and avoid memory
> > leaks.  
> 
> Again, there is no memory leak here either. Just a potential PM usage
> counter leak.

True. Will fix it at the entire series with:

	FILTER_BRANCH_SQUELCH_WARNING=1 git filter-branch -f --msg-filter "cat|perl -0pe 's/ and avoid memory\n\s*leaks./, avoiding\na potential PM usage counter leak./igs'" BASE..

Regards,
Mauro
