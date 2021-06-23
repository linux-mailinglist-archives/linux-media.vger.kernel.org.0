Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 469033B1AF3
	for <lists+linux-media@lfdr.de>; Wed, 23 Jun 2021 15:18:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230411AbhFWNUZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Jun 2021 09:20:25 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:38874 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230163AbhFWNUZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Jun 2021 09:20:25 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A53529AA;
        Wed, 23 Jun 2021 15:18:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624454286;
        bh=4hkUKdHT15rj2vnmOuvAjcb9HIg4wLdlU7nwjmRC69I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Kfxn7CGrXm6bhFXlcu2yEs0ZPR3gBBYmDz0rko913TX9FjaBt8AUuWoqrMqt4FJWI
         XAbDl4NpsGjkmvXVga7LaYxZb9kmVjnJnCML9Dkw8ZA2vtqADPTQbcZzCouGGGfdN/
         Me9GAPbJ81c8PFVKocYy9uow7S19MELfHrUr0jVk=
Date:   Wed, 23 Jun 2021 16:17:37 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC v2] MEDIA: Driver for ON Semi AR0521 camera sensor
Message-ID: <YNM0cZFV7/LKKFBn@pendragon.ideasonboard.com>
References: <m3wnqm5eqo.fsf@t19.piap.pl>
 <YNHQDNdpxcY8+IV2@pendragon.ideasonboard.com>
 <m3r1gt5hzm.fsf@t19.piap.pl>
 <YNK5FhAXSpI1oHJV@pendragon.ideasonboard.com>
 <m3mtrh5evo.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m3mtrh5evo.fsf@t19.piap.pl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 23, 2021 at 07:28:11AM +0200, Krzysztof Hałasa wrote:
> Laurent Pinchart writes:
> 
> > How does a lack of an SoB line prevent someone from doing exactly what
> > you've described above ?
> 
> The work is not published under GPL.

I only review kernel code covered by the GPL, sorry :-) (And stating
that a kernel driver isn't covered by the GPL is at the very least a
very grey area, as it's widely understoof that drivers developed
specifically for Linux are derivative work of the kernel)

> > Maintainers usually understand these issues. They may fail to notice,
> > but if you point out a patch that would steal your work, that would
> > prevent it from being merged.
> 
> I'd like to believe this as well. Unfortunately, it doesn't work like
> that. See the "tw686x" (an SD TV frame grabber) case.
> I didn't even request that the other driver wasn't merged. I only wanted
> it as a patch on top of the original one - so the history could be
> visible.

Mauro, any comment on that ?

-- 
Regards,

Laurent Pinchart
