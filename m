Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 660956341A
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2019 12:18:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726241AbfGIKSV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Jul 2019 06:18:21 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:36228 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725989AbfGIKSU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Jul 2019 06:18:20 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B27A356A;
        Tue,  9 Jul 2019 12:18:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1562667499;
        bh=MdeSSN04nWT3RBeeVMJNe63i4/7XzdLMYS3PNR5i6Ow=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=RQjTsNmBX8Oc4sLsSugHRBi421RN/OH6U6Pe3zXKOtXSAv2+fJ2wlbMIQQ8aRyba8
         qeqZ8NdZHnYj8odUdfp+FY1xRvIpMwzlDDzByHEq7FDh0gfN6HM6YiE4P52pIUnaRj
         qTTImR3O1GfiqYzJOfF7hTCfgceWkQPmsGXVJmUQ=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH] media: fdp1: Reduce FCP not found message level to debug
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20190709095952.5666-1-geert+renesas@glider.be>
 <17f28f31-73e1-5170-a0d5-31ad9826defa@ideasonboard.com>
 <CAMuHMdU-iTH0AjCx9TxJn+aWUxF_7D5zqrKrwvC_FPybKFBYMA@mail.gmail.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <bee131c3-e07e-6d6f-9315-774f638da53f@ideasonboard.com>
Date:   Tue, 9 Jul 2019 11:18:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdU-iTH0AjCx9TxJn+aWUxF_7D5zqrKrwvC_FPybKFBYMA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Geert,

On 09/07/2019 11:13, Geert Uytterhoeven wrote:
> Hi Kieran,
> 
> On Tue, Jul 9, 2019 at 12:07 PM Kieran Bingham
> <kieran.bingham+renesas@ideasonboard.com> wrote:
>> On 09/07/2019 10:59, Geert Uytterhoeven wrote:
>>> When support for the IPMMU is not enabled, the FDP driver may be
>>> probe-deferred multiple times, causing several messages to be printed
>>> like:
>>>
>>>     rcar_fdp1 fe940000.fdp1: FCP not found (-517)
>>>     rcar_fdp1 fe944000.fdp1: FCP not found (-517)
>>>
>>> Fix this by reducing the message level to debug level, as is done in the
>>> VSP1 driver.
>>
>> Does the lack of IPMMU prevent the FDP1 being loaded entirely?
> 
> No it doesn't.
> If CONFIG_IPMMU_VMSA=n,
> 
>     rcar_fdp1 fe940000.fdp1: FCP not found (-517)
>     rcar_fdp1 fe944000.fdp1: FCP not found (-517)
>     rcar_fdp1 fe940000.fdp1: FCP not found (-517)
>     rcar_fdp1 fe944000.fdp1: FCP not found (-517)
>     rcar_fdp1 fe940000.fdp1: FCP not found (-517)
>     rcar_fdp1 fe944000.fdp1: FCP not found (-517)
>     rcar_fdp1 fe940000.fdp1: Device registered as /dev/video8
>     rcar_fdp1 fe944000.fdp1: Device registered as /dev/video9
> 
> So the driver succeeds, eventually.
> 
> If CONFIG_IPMMU_VMSA=y, it succeeds sooner:
> 
>     rcar_fdp1 fe940000.fdp1: Device registered as /dev/video0
>     rcar_fdp1 fe944000.fdp1: Device registered as /dev/video1
> 
> Always be prepared to handle -EPROBE_DEFER.
> 
> Gr{oetje,eeting}s,

On the basis that the driver is not prevented from loading, then the
message does indeed become more of a debug print.

I wonder if it's better to print something different in the event of
EPROBE_DEFER vs another actual error preventing the loading of the
driver, but in either case if someone hits an issue they're likely to
start adding/enabling debug.

So, with that and a precedent for this change in VSP1, I'm happy here.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>




> 
>                         Geert
> 

