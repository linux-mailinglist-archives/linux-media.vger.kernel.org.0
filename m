Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B22B76676E
	for <lists+linux-media@lfdr.de>; Fri, 28 Jul 2023 10:42:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbjG1ImH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jul 2023 04:42:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233433AbjG1ImE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jul 2023 04:42:04 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A41611D
        for <linux-media@vger.kernel.org>; Fri, 28 Jul 2023 01:42:02 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 16AD443;
        Fri, 28 Jul 2023 10:40:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1690533660;
        bh=guZyE/JAoaUqNnlcK1AG8iuqK6ziWNUuQDFsH21mfwU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KQnw1RKC6pKSCkWrg3w3cTHv5CvUNmBbob+jBt9Beuo1ISz0sA+vjiMB2mWexEawc
         ZwTdl4TIPmEsIZlMDTN+TM+3UvF850m4ut1ZDLcT3FLw31gwzE39ljvtGREBKylIW/
         s3u0Md7xV/fBC12zqd0+4lJagyIPhz3QZ8HRlmCs=
Date:   Fri, 28 Jul 2023 11:42:05 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
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
Message-ID: <20230728084205.GD28824@pendragon.ideasonboard.com>
References: <a2ffa1cb-42db-a78a-8bd7-b0e422aade13@synaptics.com>
 <CAAFQd5AFJwreERs2Hn_A+3g51OLF6F0eWjx2+rgiZV=FR_61fA@mail.gmail.com>
 <20230728043347.GM955071@google.com>
 <20230728081824.GC28824@pendragon.ideasonboard.com>
 <CAAFQd5BqDo41U05pmQ+eQvWa0YpJj2OTyKXDAFPwX2S5s5sqBg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAFQd5BqDo41U05pmQ+eQvWa0YpJj2OTyKXDAFPwX2S5s5sqBg@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jul 28, 2023 at 05:28:56PM +0900, Tomasz Figa wrote:
> On Fri, Jul 28, 2023 at 5:18 PM Laurent Pinchart wrote:
> > On Fri, Jul 28, 2023 at 01:33:47PM +0900, Sergey Senozhatsky wrote:
> > > On (23/07/27 17:17), Tomasz Figa wrote:
> > > > On Fri, Jun 30, 2023 at 7:47 PM Hsia-Jun Li wrote:
> > > > >
> > > > > Hello All
> > > > >
> > > > > This RFC tries to address the following problems:
> > > > >
> > > > > 1. Application may request too many buffers, increasing pressure to
> > > > > system's memory allocator(Thinking about running Android with 8K UHD
> > > > > playback in a system with only 2 GiB memory available);
> > > >
> > > > Yeah, I think that's something that has to be addressed. It was also
> > > > mentioned recently in the review of the DELETE_BUF series. I think we
> > > > need some kind of accounting of the allocations to the processes, so
> > > > that the per-process limits of memory usage could apply. Let me add
> > > > +Sergey Senozhatsky who often crosses his path with kernel memory
> > > > management.
> > >
> > > That's an interesting topic. The usual approach would be memcg: we
> > > create a memory controller, set memory usage limit, then move tasks
> > > under that controller. The last part is problematic, as it implies
> > > a well-behaving user-space. I'm not aware of a simple way (or any
> > > way for that matter) to "automatically enforce" memcg on a process
> > > group.
> > >
> > > From what I can tell networking code attempts to "enforce" memcg on its
> > > allocations, and hence has to manually charge memcg. For instance, take
> > > a look at sock_reserve_memory() and corresponding mem_cgroup_charge_skmem()
> > > call.
> > >
> > > So I wonder if we can take a closer look at what networking does and
> > > do something similar in vb2.
> >
> > It's a long-standing issue that would be nice to solve indeed. I however
> > wonder if we should do so in vb2, or instead invest our time and efforts
> > in transitioning to DMA heaps and solving the memory accounting issue
> > there.
> 
> Would we then provide some way to disable MMAP buffer support for
> applications? Or you're thinking more about backing MMAP allocations
> with DMA-buf heaps internally in the kernel?

Long term I'd like to see MMAP going away, replaced with DMA heaps.
That's veeeery long term though. In the meantime, maybe an option to
disable MMAP support (either a compilation option or a kernel command
line option) would be useful.

-- 
Regards,

Laurent Pinchart
