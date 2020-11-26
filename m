Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5739C2C5E44
	for <lists+linux-media@lfdr.de>; Fri, 27 Nov 2020 00:42:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731836AbgKZXlN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Nov 2020 18:41:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729293AbgKZXlN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Nov 2020 18:41:13 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40128C0613D4
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2020 15:41:13 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id B58BD1F460AC
Message-ID: <5b2e272c4df0023d66d02d0285b46b818f3f548d.camel@collabora.com>
Subject: Re: [PATCH v2 0/6] CODA timeout fix & assorted changes
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Benjamin Bara - SKIDATA <Benjamin.Bara@skidata.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Fabio Estevam <festevam@gmail.com>,
        Chris Healy <cphealy@gmail.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        "kernel@collabora.com" <kernel@collabora.com>,
        Richard Leitner - SKIDATA <Richard.Leitner@skidata.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Date:   Thu, 26 Nov 2020 20:41:03 -0300
In-Reply-To: <AM6PR01MB55745CB53F6BFA4ECF9B04C6E2EF0@AM6PR01MB5574.eurprd01.prod.exchangelabs.com>
References: <20201007103544.22807-1-ezequiel@collabora.com>
         <CAOMZO5DpGXoyXm0D63BL84qMAnPkNOiUcmYsmp9QdogePrLxZw@mail.gmail.com>
         <4521d217f456dbab1279cfba2d23b426435c6d9c.camel@collabora.com>
         <CAOMZO5B=3Y5C-5mStLFwdzmV+t7nqEgEOHoK6-6217UWdJWd3g@mail.gmail.com>
         <AM6PR01MB5574778C3ACD64DBC9DA4E86E2070@AM6PR01MB5574.eurprd01.prod.exchangelabs.com>
         <2144c41cd78ebed91989c4329dd4cd941be37f78.camel@collabora.com>
         <AM6PR01MB55745CB53F6BFA4ECF9B04C6E2EF0@AM6PR01MB5574.eurprd01.prod.exchangelabs.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin,

On Wed, 2020-11-04 at 17:49 +0000, Benjamin Bara - SKIDATA wrote:
> > -----Original Message-----
> > From: Ezequiel Garcia <ezequiel@collabora.com>
> > Sent: Mittwoch, 4. November 2020 18:01
> 
> Hi again!
>  
> > Many thanks for your report. Indeed you managed to create a video that is quite
> > problematic for CODA.
> 
> Thanks for looking at it!
> 
> > I must admit I can't fully wrap my head around your prefetch fix, and how the new
> > condition would fix this issue. Could you explain it in more detail?
> 
> I don't have access to the CODA960 documentation, so all my findings are based on tests
> or code documentation.
> 
> My starting point was the inline documentation [1]:
> "If we managed to fill in at least a full reorder window of buffers and the bitstream
>  prefetcher has at least 2 256 bytes periods beyond the first buffer to fetch (...)".
> 
> The current code checks if there are 512 bytes after the current meta.
> When I comment out the following break, my test videos are working.
> So for me, starvation is caused by this statement, because it hinders follow-up metas
> for performance reasons (the decoder might also start hiccuping with too much data enqueued,
> but not sure).
> 
> I did some tests, and basically I found out that the sum doesn't matter, so something like
> - Meta 2: 1024
> - Meta 3: 100
> - Meta 4: 100
> starves, even if it passes the current check.
> 
> Next, I thought about "2x 256" is actually not the same as "1x 512".
> With 2x 256, I could actually got a couple more test videos running, something like:
> - Meta 2: 650
> - Meta 3: 50
> - Meta 4: 650
> 
> The crafting of such video is quite easy by varying the Group-of-Picture and the resolution.
> 
> However, then I tried some smaller videos (with meta 2 & 4: 256 < meta < 512) 
> which lead to starvation again.
> I haven't done additional tests, instead I shared my findings and asked for further documentation
> hints about the actual starvation criteria.
> 
> So my solution is just a Proof-of-Concept, found by testing and is not backed by documentation - 
> therefore I am also not sure if it is sufficient or has any side effects.
> 

Please submit your patch on top of latest media master branch and let's
start discussing it.

BTW, Nicolas and I have started using https://github.com/fluendo/fluster/
conformance testing. Perhaps you can run the H264 test suite, with & without
your patch (assuming it affects H264 in any way) and include that information
in the cover letter.

Thanks!
Ezequiel


