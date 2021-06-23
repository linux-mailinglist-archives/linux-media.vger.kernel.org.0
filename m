Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 707533B1AFA
	for <lists+linux-media@lfdr.de>; Wed, 23 Jun 2021 15:21:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231128AbhFWNYL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Jun 2021 09:24:11 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:38922 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230234AbhFWNYJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Jun 2021 09:24:09 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7D977EE;
        Wed, 23 Jun 2021 15:21:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624454510;
        bh=tD3yAfBocRoh42iKv+1nU6GmJxJgj3qdpSr0sTecR8g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=J6PkKp5wWllwRTlRLAOdU1u0BsEBrC0wvoH4QXTTJaX/3lZ35HDadPXZoIdUpUv3O
         kkL0aHDUKZbaspama8on3DCH4QHoxN0L5R2est5e0t6Ef6A9j4jXRsAAaYuBPcCT2A
         Nldqf8ApmICAWBV5JPT6x5kbpbvNOKvZjSQ+WBLo=
Date:   Wed, 23 Jun 2021 16:21:21 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
Cc:     devicetree@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC v2] dt-binding: media: document ON Semi AR0521 sensor
 bindings
Message-ID: <YNM1UeZ7aw0hWUE2@pendragon.ideasonboard.com>
References: <m3y2b25er8.fsf@t19.piap.pl>
 <YNHVbFp2+Ow8CyCV@pendragon.ideasonboard.com>
 <m3im255e1a.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m3im255e1a.fsf@t19.piap.pl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 23, 2021 at 07:46:25AM +0200, Krzysztof Hałasa wrote:
> Laurent Pinchart <laurent.pinchart@ideasonboard.com> writes:
> 
> >> The question still stands: is there a way to reliably put national
> >> unicode characters into:
> >> - commit messages for patches submitted via email,
> >
> > This shouldn't be too much of a problem, as long as you MUA and MTA
> > don't mess up encoding.
> 
> Maybe it's better now. I had mixed results in the past, but maybe it was
> 10+ years ago. Then I stopped using non-ASCII as they weren't very
> essential.
> Apparently there was no such problems with drivers/net, at least from
> the time I started using non-ASCII characters.

I think it should be better, yes. As long as there's no MS Exchange
along the way of course ;-)

-- 
Regards,

Laurent Pinchart
