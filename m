Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D064A318BF6
	for <lists+linux-media@lfdr.de>; Thu, 11 Feb 2021 14:27:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231315AbhBKNXx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Feb 2021 08:23:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231907AbhBKNVZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Feb 2021 08:21:25 -0500
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0A1BC061574
        for <linux-media@vger.kernel.org>; Thu, 11 Feb 2021 05:20:42 -0800 (PST)
Received: by mail-io1-xd2b.google.com with SMTP id n201so5589212iod.12
        for <linux-media@vger.kernel.org>; Thu, 11 Feb 2021 05:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JCKRoPINZ+vg1pxHvLz7YyDZ6J4aOJvyJXVgjObIKG4=;
        b=mGtVpa0p8+nSp/876Rbyd65LQvkTFLdveKIyns6pGgv6mx2iRe0YWPRl3iis9qOqvg
         SWS5kLaKLirExWjuhlC2pM8F8OODaHEmGJjxA5or2xmJkXM8I9eOSsM2oHc7TLfOl25g
         PlNP7gQIMu8xOmSaw+laMsyYggSZn0rR09/To=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JCKRoPINZ+vg1pxHvLz7YyDZ6J4aOJvyJXVgjObIKG4=;
        b=oU7E6XPiB56HH+pPK2Yvx1G+8GGVrW5oucqWNDiM/DOMkikho4qkQsLCgfTGgnGwlt
         1sVz3rcBXR3l9JN/CzXe127PAZVByKIiVK5VN8YvY7lRidzPrOJf4bm8u72FykHr5WJM
         ya62pM3ryF7OJG8Y1oBtPCNb0wydGrv5zwgR+q0DwHyJkDPfAN8JxqbdlsdkUmfFW0Oq
         uUZJEM4I8YrfjzwL4GNmNDv18ihx2ZylwhwZFLVanXyQKfrPwghMUqeBWHtJCpzblljf
         m+jHyAFG1xqblogRBq4HRzb5Unb0Ka7XyKKhSJGoHO/aFkRQm4WldaikOvutIN0QFHHC
         zOQg==
X-Gm-Message-State: AOAM532A5eJ/gLBmAS0RsWJII1z27NCc0GZbLGNGDVcgXlJOh4pVeOqM
        97lmD9ZPWJkP+WT67Z1vmeDAayOn0wTr/w==
X-Google-Smtp-Source: ABdhPJxKEkEE3+ztF4vgj/GdTOkGG6D/2uQjFCI22v7rUfGUTtqY9VOwYBc59LQuJnH0XVK030RKXQ==
X-Received: by 2002:a6b:da03:: with SMTP id x3mr5231156iob.127.1613049642092;
        Thu, 11 Feb 2021 05:20:42 -0800 (PST)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com. [209.85.166.48])
        by smtp.gmail.com with ESMTPSA id v1sm2607952ilm.35.2021.02.11.05.20.41
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Feb 2021 05:20:41 -0800 (PST)
Received: by mail-io1-f48.google.com with SMTP id u8so5581885ior.13
        for <linux-media@vger.kernel.org>; Thu, 11 Feb 2021 05:20:41 -0800 (PST)
X-Received: by 2002:a02:8642:: with SMTP id e60mr8507360jai.13.1613049640964;
 Thu, 11 Feb 2021 05:20:40 -0800 (PST)
MIME-Version: 1.0
References: <20210202095110.1215346-1-hch@lst.de> <20210207184855.GA27553@lst.de>
 <CAAFQd5BzAvgiTLGFse+ZWUrFtZ1Ysf+p+e-4rW8gq_iP0xhWEA@mail.gmail.com>
 <20210209082213.GA31902@lst.de> <CANiDSCuzKczCnAdC9b0r-6WVBFYXYnvQHKbxSeYq2QW1uVsDLQ@mail.gmail.com>
 <CANiDSCvPodsmcOi1fMwvZsyMxWsRQWNT7VkbZs4=XePYXfiXow@mail.gmail.com>
 <20210209170217.GA10199@lst.de> <CANiDSCs8dXVoWuwkVs=v+=s770MpzH1xiDuj-080-98ynuz97g@mail.gmail.com>
 <20210211130625.GA20155@lst.de>
In-Reply-To: <20210211130625.GA20155@lst.de>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 11 Feb 2021 14:20:30 +0100
X-Gmail-Original-Message-ID: <CANiDSCupVLQMbJVKrrKBJvJxHgteeVFik7LAJy5zbUi2ESwsGA@mail.gmail.com>
Message-ID: <CANiDSCupVLQMbJVKrrKBJvJxHgteeVFik7LAJy5zbUi2ESwsGA@mail.gmail.com>
Subject: Re: add a new dma_alloc_noncontiguous API v2
To:     Christoph Hellwig <hch@lst.de>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sergey Senozhatsky <senozhatsky@google.com>,
        "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

HI Christoph

On Thu, Feb 11, 2021 at 2:06 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Thu, Feb 11, 2021 at 10:08:18AM +0100, Ricardo Ribalda wrote:
> > Hi Christoph
> >
> > What are your merge plans for the uvc change?
> > http://git.infradead.org/users/hch/dma-mapping.git/commit/3dc47131f8aacc2093f68a9971d24c754e435520
> >
> > Are you going to remove the patch on your Merge request and then send
> > it for review to Laurent? or merge it through your tree with a S-o-B
> > him?
>
> I though I had all the ACKs to queue it up.  Is that not what was
> intended?  Queueing up the API without a user is generally a bad idea.
>

I am pretty sure we need the ack from Laurent. He maintains uvc

@Laurent Pinchart what are your thoughts?

Thanks!


-- 
Ricardo Ribalda
