Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 918487A3340
	for <lists+linux-media@lfdr.de>; Sun, 17 Sep 2023 00:38:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231622AbjIPWh4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 16 Sep 2023 18:37:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234602AbjIPWhd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 16 Sep 2023 18:37:33 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27F55CD5
        for <linux-media@vger.kernel.org>; Sat, 16 Sep 2023 15:37:26 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2DC3B83F;
        Sun, 17 Sep 2023 00:35:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694903749;
        bh=Zk3o4sEq697ZLhQs3MovJShbwALDU7Jp71SdfC8+l5A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ozrRhDmlQHl2uTMBgf2ANeukXlO4Yr6bqnYpjCveG4JZSYDdTcgKeDXNeZIShUPDL
         9ExwXai2YWHX0rvi2NZBpb4EGltsnKN+uUn3cpKzE2+9swGJo7IdZFTBL7yceDB6C5
         f/01xnng+Ubs3pubvwiV69ulAVKZMf8MMe9Q2+W4=
Date:   Sun, 17 Sep 2023 01:37:36 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Fritz Koenig <frkoenig@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: MEDIA_IOC_REQUEST_ALLOC performance question
Message-ID: <20230916223736.GA8524@pendragon.ideasonboard.com>
References: <CAMfZQbzh+o2hn6VgbMsAyjOuMG8PLwwk15neit0t1zC0b-YVKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMfZQbzh+o2hn6VgbMsAyjOuMG8PLwwk15neit0t1zC0b-YVKQ@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fritz,

On Fri, Sep 15, 2023 at 03:07:38PM -0700, Fritz Koenig wrote:
> Hi,
> 
> Looking at the documentation[1] it states that the fd returned from
> MEDIA_IOC_REQUEST_ALLOC can be close()ed and the kernel will take care
> of making sure it is ref counted correctly.
> 
> Because MEDIA_REQUEST_IOC_REINIT needs to be called on an fd before it
> can be reused, is there a performance penalty to allocating a new fd
> (with MEDIA_IOC_REQUEST_ALLOC) for every frame instead of having a
> pool of fd's that are reused, and then immediately after queuing the
> buffer, close the file descriptor?
> 
> I have a proof of concept that works, but I haven't tested it for
> performance yet.
> 
> It would seem that maybe there is a latency penalty because the
> MEDIA_REQUEST_IOC_REINIT is called at the end of a frame while
> MEDIA_IOC_REQUEST_ALLOC would be called at the start of a frame.

That's up to userspace to decide, you could also call
MEDIA_IOC_REQUEST_ALLOC at the end of a frame. That would likely defeit
the point though, as you would need to put that fd in a pool to be used
later.

Allocating a new fd isn't very expensive. The reason why the reinit
mechanism was implemented is to avoid fd allocation errors at runtime.
By pre-allocating a pool of requests and reusing them, you are
guaranteed that you will always have a request available, even if the
system runs out of fds.

> [1]: https://docs.kernel.org/userspace-api/media/mediactl/request-api.html#recycling-and-destruction

-- 
Regards,

Laurent Pinchart
