Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7ADEB3B2EA7
	for <lists+linux-media@lfdr.de>; Thu, 24 Jun 2021 14:11:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229878AbhFXMNZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Jun 2021 08:13:25 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:40696 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbhFXMNY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Jun 2021 08:13:24 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 59BB9532;
        Thu, 24 Jun 2021 14:11:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624536664;
        bh=ga5tn9+ve4Rfsq6XPWUZUxag7McM+mFPUJEaueRLLfA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=a/66g1Kay6NxbZC1Pmmtm7sURU3SXaYXhxTgjCkmRSZrQk769iNKu4Zrz0Wne3UWV
         w6xEuLV/RAJAWAgy6cQHP60VGRwIAXF6qMtcAxgFsuj3sLOqTttirKCbDwlaXU2vO7
         5wbmpbQDyvvWn4wa6nA9/c1M2i9/AL788AUBdFuw=
Date:   Thu, 24 Jun 2021 15:10:34 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [RFC v2] MEDIA: Driver for ON Semi AR0521 camera sensor
Message-ID: <YNR2OkXL+wUaKuy4@pendragon.ideasonboard.com>
References: <m3wnqm5eqo.fsf@t19.piap.pl>
 <YNHQDNdpxcY8+IV2@pendragon.ideasonboard.com>
 <m3r1gt5hzm.fsf@t19.piap.pl>
 <YNK5FhAXSpI1oHJV@pendragon.ideasonboard.com>
 <m3mtrh5evo.fsf@t19.piap.pl>
 <YNM0cZFV7/LKKFBn@pendragon.ideasonboard.com>
 <42958029-5625-5f4d-a075-2f59a74e0fb5@ideasonboard.com>
 <m3bl7v6er0.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m3bl7v6er0.fsf@t19.piap.pl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Krzysztof,

CC'ing Greg to get his expert opinion on the topic.

On Thu, Jun 24, 2021 at 06:57:55AM +0200, Krzysztof Hałasa wrote:
> Hi Kieran, and others,
> 
> Kieran Bingham <kieran.bingham@ideasonboard.com> writes:
> 
> >>> The work is not published under GPL.
> >
> > This seems like an odd thing to say when your patch explicitly contains:
> >
> >> +++ b/drivers/media/i2c/ar0521.c
> >> @@ -0,0 +1,1060 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> 
> Such tags have meaning only in the kernel context, when signed-off etc.
> Alone, they aren't legal statements, especially when I explicitly state
> that it's not signed-off-by me yet. Nevertheless...
> 
> Obviously, this code was always meant to be GPLed and it seems really
> crazy to me that we even have to have such conversations - about
> a non issue, at least from my POV.
> 
> The fact is that 6 years ago I wrote driver for a SDTV frame grabber -
> and another developer "took" the development from me, and published as
> his own. This wasn't probably illegal - after all my driver was covered
> by the GPL from the start. But was it really how we all want things to
> work in Linux? With such experience, is anybody surprised I want to
> avoid this history repeating itself?
> 
> For other patches I don't care about such formalities, but this driver
> is a work paid by an external entity and it would be unfortunate to
> end up the same way as the tw686x driver.
> 
> 
> I stated multiple times I will sign this code off when it's accepted.
> Is it really a problem? Really?
> 
> If so... perhaps there is some other way?
> 
> I'd hate to think that the next time I'm to keep my code unpublished.

-- 
Regards,

Laurent Pinchart
