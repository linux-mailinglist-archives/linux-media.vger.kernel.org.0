Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A54F7666C0
	for <lists+linux-media@lfdr.de>; Fri, 28 Jul 2023 10:18:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234789AbjG1IS1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jul 2023 04:18:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234934AbjG1ISW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jul 2023 04:18:22 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CC23D9
        for <linux-media@vger.kernel.org>; Fri, 28 Jul 2023 01:18:21 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A7F2EA06;
        Fri, 28 Jul 2023 10:17:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1690532240;
        bh=9exBbDEV42lAkyCltuNd9ZFVlsUiLz43QzoHJHQEIKA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PXfMTtirrOTQUOVhh1eEN4WL4hrfZcYloBnHz7V5CeFUMbPq2jOD8h2AsnJ/0Viji
         rHLUmzv+JdAMjR3Ef0svVE7gq/4ybgdA2r3GEG6odikfGSMfHKaqyunkHnEzf2W9Jr
         TabrCCxsmwA0uHXVE+PC4q6PS0xY+32ZZsCd/T24=
Date:   Fri, 28 Jul 2023 11:18:24 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sergey Senozhatsky <senozhatsky@chromium.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Hsia-Jun Li <Randy.Li@synaptics.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        ayaka <ayaka@soulik.info>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, Brian.Starkey@arm.com,
        boris.brezillon@collabora.com, frkoenig@chromium.org,
        hans.verkuil@cisco.com, hiroh@chromium.org,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Helen Koike <helen.koike@collabora.com>
Subject: Re: [RFC]: m2m dec reports the graphics memory requirement
Message-ID: <20230728081824.GC28824@pendragon.ideasonboard.com>
References: <a2ffa1cb-42db-a78a-8bd7-b0e422aade13@synaptics.com>
 <CAAFQd5AFJwreERs2Hn_A+3g51OLF6F0eWjx2+rgiZV=FR_61fA@mail.gmail.com>
 <20230728043347.GM955071@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230728043347.GM955071@google.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jul 28, 2023 at 01:33:47PM +0900, Sergey Senozhatsky wrote:
> On (23/07/27 17:17), Tomasz Figa wrote:
> > On Fri, Jun 30, 2023 at 7:47 PM Hsia-Jun Li wrote:
> > >
> > > Hello All
> > >
> > > This RFC tries to address the following problems:
> > >
> > > 1. Application may request too many buffers, increasing pressure to
> > > system's memory allocator(Thinking about running Android with 8K UHD
> > > playback in a system with only 2 GiB memory available);
> > 
> > Yeah, I think that's something that has to be addressed. It was also
> > mentioned recently in the review of the DELETE_BUF series. I think we
> > need some kind of accounting of the allocations to the processes, so
> > that the per-process limits of memory usage could apply. Let me add
> > +Sergey Senozhatsky who often crosses his path with kernel memory
> > management.
> 
> That's an interesting topic. The usual approach would be memcg: we
> create a memory controller, set memory usage limit, then move tasks
> under that controller. The last part is problematic, as it implies
> a well-behaving user-space. I'm not aware of a simple way (or any
> way for that matter) to "automatically enforce" memcg on a process
> group.
> 
> From what I can tell networking code attempts to "enforce" memcg on its
> allocations, and hence has to manually charge memcg. For instance, take
> a look at sock_reserve_memory() and corresponding mem_cgroup_charge_skmem()
> call.
> 
> So I wonder if we can take a closer look at what networking does and
> do something similar in vb2.

It's a long-standing issue that would be nice to solve indeed. I however
wonder if we should do so in vb2, or instead invest our time and efforts
in transitioning to DMA heaps and solving the memory accounting issue
there.

-- 
Regards,

Laurent Pinchart
