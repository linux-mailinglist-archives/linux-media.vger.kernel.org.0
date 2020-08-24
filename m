Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3E5C2509BB
	for <lists+linux-media@lfdr.de>; Mon, 24 Aug 2020 22:02:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726578AbgHXUCb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Aug 2020 16:02:31 -0400
Received: from smtprelay0247.hostedemail.com ([216.40.44.247]:53332 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726241AbgHXUCa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Aug 2020 16:02:30 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay04.hostedemail.com (Postfix) with ESMTP id 801F0180A9F52;
        Mon, 24 Aug 2020 20:02:28 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:960:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1538:1567:1593:1594:1711:1714:1730:1747:1777:1792:2393:2559:2562:2828:2904:3138:3139:3140:3141:3142:3622:3865:3870:3871:3872:3873:3874:4250:4321:5007:10004:10400:10450:10455:10848:11026:11232:11658:11914:12297:12555:12740:12760:12895:13069:13311:13357:13439:14181:14659:14721:19904:19999:21080:21451:21627:30054:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: front11_580342427055
X-Filterd-Recvd-Size: 1408
Received: from XPS-9350.home (unknown [47.151.133.149])
        (Authenticated sender: joe@perches.com)
        by omf09.hostedemail.com (Postfix) with ESMTPA;
        Mon, 24 Aug 2020 20:02:27 +0000 (UTC)
Message-ID: <e69a12f09a9550320ca9d9ae65a892722bde96fd.camel@perches.com>
Subject: Re: [likely PATCH] media: lmedm04: Fix misuse of comma
From:   Joe Perches <joe@perches.com>
To:     Malcolm Priestley <tvboxspy@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        Julia Lawall <julia.lawall@lip6.fr>
Date:   Mon, 24 Aug 2020 13:02:26 -0700
In-Reply-To: <d4b13e5d-6c97-2594-0ca6-346bb2129b88@gmail.com>
References: <e6cd92faf09722fe729a7de03e7bde592f62499c.camel@perches.com>
         <d4b13e5d-6c97-2594-0ca6-346bb2129b88@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 2020-08-24 at 21:01 +0100, Malcolm Priestley wrote:
> Good catch the interrupt URB is not running because usb_submit_urb is tangled with it.
> 
> It only really affects signal strength.
> 
> add
> 
> Fixes: 15e1ce33182d ("[media] lmedm04: Fix usb_submit_urb BOGUS urb xfer, pipe 1 != type 3 in interrupt urb")
> Cc: <stable@vger.kernel.org>

If that's a request for me, I won't as I can't test.

As the maintainer, you should do that.


