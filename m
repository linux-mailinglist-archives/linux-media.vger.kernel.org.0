Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65E8E2B1EE6
	for <lists+linux-media@lfdr.de>; Fri, 13 Nov 2020 16:36:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726606AbgKMPg0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Nov 2020 10:36:26 -0500
Received: from gofer.mess.org ([88.97.38.141]:54933 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726439AbgKMPg0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Nov 2020 10:36:26 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id D1BD1C6357; Fri, 13 Nov 2020 15:36:24 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1605281784; bh=lSyVjOKYdsYc38nmn7ZMKVOmsoQlnmoMNpAj+SsL/qI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DtR/ePnDvQdeGKhKi92b8H7KdeJYhFxngR7Zd7DaH1wlhulBzp+UBp8Lzim3QTclG
         dnKvtdr1zrhY5ArXLa0tOMrQJJd907fIPRlJ2dar6t3fojhu2svbAF8JkukYQiSugA
         eP6PWYzPD0rnhFSex4jfMr2ToK1DhyJG4r5dAgPWL4bcsL+C1nh/BWmCLSbBLYcUTI
         8WOAMtu6h+taEvqjzhsXA353EBiZh0UUMqQ/yPxI3mRw9ABjc0I9v6VmdihBveKMqR
         BsjPzNB7Svro+tZhyoHehia7waQHa7ARoCTMtFOHBaFmj1awl1NQeo+PbUdN0yZIne
         ugemlH2xa3+hw==
Date:   Fri, 13 Nov 2020 15:36:24 +0000
From:   Sean Young <sean@mess.org>
To:     maxime@cerno.tech
Cc:     linux-media@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] media: sunxi-cir: allow timeout to be set at runtime
Message-ID: <20201113153624.GA4735@gofer.mess.org>
References: <20201110091557.25680-1-sean@mess.org>
 <20201110091557.25680-2-sean@mess.org>
 <20201110121122.uulmlemsc562n4ot@gilmour.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201110121122.uulmlemsc562n4ot@gilmour.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 10, 2020 at 01:11:22PM +0100, maxime@cerno.tech wrote:
> On Tue, Nov 10, 2020 at 09:15:57AM +0000, Sean Young wrote:
> > This allows the timeout to be set with the LIRC_SET_REC_TIMEOUT ioctl.
> > 
> > The timeout was hardcoded at just over 20ms, but returned 120ms when
> > queried with the LIRC_GET_REC_TIMEOUT ioctl.
> > 
> > This also ensures the idle threshold is set correctly with a base clock
> > other than 8000000Mhz.
> 
> That's some pretty hardcore overclocking :)
> 
> I guess you meant 8MHz?

Yes, I did.

> Other than that, for both patches
> 
> Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!

Sean
