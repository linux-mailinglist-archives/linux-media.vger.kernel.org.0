Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91BE6322EA0
	for <lists+linux-media@lfdr.de>; Tue, 23 Feb 2021 17:21:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233560AbhBWQUv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Feb 2021 11:20:51 -0500
Received: from mail.horus.com ([78.46.148.228]:59085 "EHLO mail.horus.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233500AbhBWQUu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Feb 2021 11:20:50 -0500
X-Greylist: delayed 418 seconds by postgrey-1.27 at vger.kernel.org; Tue, 23 Feb 2021 11:20:50 EST
Received: from [192.168.1.20] (62-116-60-6.adsl.highway.telekom.at [62.116.60.6])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256
         client-signature RSA-PSS (2048 bits) client-digest SHA256)
        (Client CN "E-Mail Matthias Reichl", Issuer "HiassofT CA 2014" (not verified))
        by mail.horus.com (Postfix) with ESMTPSA id 769536409C;
        Tue, 23 Feb 2021 17:13:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=horus.com;
        s=20180324; t=1614096788;
        bh=LieZ7rDJJu7OX0Dn4iUwPkpYPwVNTCrqMHmVP/c2Bz0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=O6BLLBY9gMyFUizaclPLlNUm9r067co3IuLrRWQsDEhZpPYmyMY5HOLYQJ41898Tk
         HXvyoHyWkwCgGuK4A8PfN98Q62DvH9stJ6tIjSMhn+Kurc0wpCPu4odxRd9/bCyNfn
         U5+e2pwpMRE/jyDwYclUwEQganDLVGBYb0Skr15o=
Received: by camel2.lan (Postfix, from userid 1000)
        id B87C91C781A; Tue, 23 Feb 2021 17:13:07 +0100 (CET)
Date:   Tue, 23 Feb 2021 17:13:07 +0100
From:   Matthias Reichl <hias@horus.com>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org,
        Juan =?iso-8859-1?Q?Jes=FAs_Garc=EDa?= de Soria 
        <skandalfo@gmail.com>
Subject: Re: [PATCH 0/6] media: ite-cir driver cleanups
Message-ID: <20210223161307.GB10715@camel2.lan>
References: <cover.1613989288.git.sean@mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1613989288.git.sean@mess.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sean,

On Mon, Feb 22, 2021 at 10:43:23AM +0000, Sean Young wrote:
> This should not be any functional changes, just various cleanups.
> 
> Sean Young (6):
>   media: ite-cir: remove unused fields
>   media: ite-cir: set parent device
>   media: ite-cir: use standard logging and reduce noise
>   media: ite-cir: carrier and duty cycle can be set via ioctl
>   media: ite-cir: move runtime information into driver data
>   media: ite-cir: check for receive overflow
> 
>  drivers/media/rc/ite-cir.c | 341 +++++++++----------------------------
>  drivers/media/rc/ite-cir.h |  49 ++----
>  2 files changed, 91 insertions(+), 299 deletions(-)

I did a few tests with this series on top of 5.10.17 and so far
everything looks fine with ITE8713 CIR.

I could only test receiving (don't have a transmitter on that PC)
and also couldn't test the carrier options (I'm using a demodulating
TSOP receiver here), but your changes look sane to me.

so long,

Hias
