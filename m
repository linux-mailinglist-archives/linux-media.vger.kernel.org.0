Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFDF536D6DA
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 13:56:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231327AbhD1L4x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 07:56:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:54448 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229790AbhD1L4v (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 07:56:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2E04A613FB;
        Wed, 28 Apr 2021 11:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619610966;
        bh=MPbO7Ro5DqSGjMw1tQeHEY4DPlsgICBS9RIhgwkXLJE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YqWqoncwxC2+RzwVL5lys29C5dRQBinWO5AZPEi/c+524vWHDvbR3vQnMTa33xkwR
         U9Ymm0VAcopS6Jq3Jnkgtbxh3XfOeLV4BA7gtDb/najNNz7PVOaU5kjy7xKSv7TLhU
         5XVHqodws0DuThMQJUIl1hz+9fZexQK6vD0B179vrMpwWAbVO2BkInjF5AMDGqkdvs
         bFR9Ln+/KLQCyiSDoIN7yswW4nYKQjZR4QLWhUGrupQ6iorbK1J/Cj5DwUyH3B5FU7
         fANH1WFVGXilFVVDJyzscsMuAKsdKbEEOHEWxmu0VTt6etQMeZOPbHtJwIpBVOba5U
         mnpeBGITL6T7w==
Received: from johan by xi.lan with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1lbinj-0004DT-Ak; Wed, 28 Apr 2021 13:56:20 +0200
Date:   Wed, 28 Apr 2021 13:56:19 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, linuxarm@huawei.com,
        mauro.chehab@huawei.com, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 38/78] media: i2c: mt9m001: use
 pm_runtime_resume_and_get()
Message-ID: <YIlNY7xJYmqtxVOe@hovoldconsulting.com>
References: <cover.1619191723.git.mchehab+huawei@kernel.org>
 <beddb7295807f43a190f2add6c1665b7475cb154.1619191723.git.mchehab+huawei@kernel.org>
 <20210424082454.2ciold3j3h2jw47m@uno.localdomain>
 <YIPsTsEA/F+o7fhQ@hovoldconsulting.com>
 <20210426163840.67ea8af9@coco.lan>
 <YIgCOA1kSd/lzLFc@hovoldconsulting.com>
 <20210428103148.590191ac@coco.lan>
 <YIkzZs8t0lMWVjzt@hovoldconsulting.com>
 <20210428132853.65b162a0@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210428132853.65b162a0@coco.lan>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Apr 28, 2021 at 01:28:53PM +0200, Mauro Carvalho Chehab wrote:
> Em Wed, 28 Apr 2021 12:05:26 +0200
> Johan Hovold <johan@kernel.org> escreveu:

> > Right, a resume failure is a pretty big issue and it's not really clear
> > how to to even handle that generally. But at remove() time you don't
> > have much choice but to go on and release resource anyway. 
> > 
> > So unless actually implementing some error handling too, using
> > pm_runtime_sync_get() without checking for errors is still preferred
> > over pm_runtime_resume_and_get(). That is 
> > 
> > 	pm_runtime_get_sync();
> > 	/* cleanup */
> > 	pm_runtime_disable()
> > 	pm_runtime_put_noidle();
> > 
> > is better than:
> > 
> > 	ret = pm_runtime_resume_and_get();
> > 	/* cleanup */
> > 	pm_runtime_disable();
> > 	if (ret == 0)
> > 		pm_runtime_put_noidle();
> > 
> > unless you also start doing something ret.
> 
> Perhaps the best would be to use, instead:
> 
> 	pm_runtime_get_noresume();
>  	/* cleanup */
>  	pm_runtime_disable()
>  	pm_runtime_put_noidle();
> 	pm_runtime_set_suspended();
> 
> I mean, at least for my eyes, it doesn't make sense to do a PM
> resume during driver's removal/unbind time.

The cleanup bit above would depend on the device being resumed so using
pm_runtime_get_noresume() makes little sense.

Some drivers disable clocks etc explicitly at remove instead of relying
on pm runtime for that and then they'd use the above scheme (plus
explicit pm_runtime_set_suspended()).

Johan
