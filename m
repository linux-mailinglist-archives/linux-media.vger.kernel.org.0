Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD9B31C46BC
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 21:06:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726338AbgEDTGg convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 4 May 2020 15:06:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725956AbgEDTGg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 May 2020 15:06:36 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04CF4C061A0E;
        Mon,  4 May 2020 12:06:36 -0700 (PDT)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E22D52A0C98;
        Mon,  4 May 2020 20:06:33 +0100 (BST)
Date:   Mon, 4 May 2020 21:06:30 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Heiko Stuebner <heiko@sntech.de>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>
Subject: Re: [PATCH v2 2/3] media: uapi: Add VP9 stateless decoder controls
Message-ID: <20200504210630.1489df6e@collabora.com>
In-Reply-To: <e53824aed3eeb27419e5399576cce028f0ba8203.camel@collabora.com>
References: <20200410115113.31728-1-ezequiel@collabora.com>
        <20200410115113.31728-3-ezequiel@collabora.com>
        <9126475c-275d-71ab-0308-6ae85e22446b@xs4all.nl>
        <bf475e70cca6f9ebf645aed51276e57668eaf43b.camel@collabora.com>
        <20200502203707.402ea3cd@collabora.com>
        <db9fa91be8084fe9c87f263a4a97dc38d46f9bd1.camel@collabora.com>
        <e53824aed3eeb27419e5399576cce028f0ba8203.camel@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 04 May 2020 14:01:32 -0400
Nicolas Dufresne <nicolas.dufresne@collabora.com> wrote:

> Le samedi 02 mai 2020 à 19:55 -0300, Ezequiel Garcia a écrit :
> > +Nicolas
> > 
> > On Sat, 2020-05-02 at 20:37 +0200, Boris Brezillon wrote:  
> > > On Fri, 01 May 2020 13:57:49 -0300
> > > Ezequiel Garcia <ezequiel@collabora.com> wrote:
> > >   
> > > > > > +
> > > > > > +.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
> > > > > > +
> > > > > > +.. flat-table:: enum v4l2_vp9_reset_frame_context
> > > > > > +    :header-rows:  0
> > > > > > +    :stub-columns: 0
> > > > > > +    :widths:       1 2
> > > > > > +
> > > > > > +    * - ``V4L2_VP9_RESET_FRAME_CTX_NONE``
> > > > > > +      - Do not reset any frame context.
> > > > > > +    * - ``V4L2_VP9_RESET_FRAME_CTX_NONE_ALT``
> > > > > > +      - Do not reset any frame context. This is an alternative value for
> > > > > > +        V4L2_VP9_RESET_FRAME_CTX_NONE.    
> > > > > 
> > > > > Add `` around V4L2_VP9_RESET_FRAME_CTX_NONE.
> > > > >     
> > > > 
> > > > Hm, now that I look closer, what's the point
> > > > of having the NONE_ALT in our uAPI if it
> > > > has same meaning as NONE?
> > > > 
> > > > I think it can be removed.  
> > > 
> > > The intent was to match the spec so that one can pass the value
> > > extracted from the bitstream directly.  
> 
> reset_frame_contextspecifies whether the frame context should be reset
> to default values:
>   − 0 or 1 means do not reset any frame context
>   − 2 resets just the context specified in the frame header
>   − 3 resets all cont
> 
> But aren't we going too far by making this an emum ?

I like to not have to constantly go back to the spec when I read code,
and having constant values defined through enums definitely helps in
this regard, but maybe it's just me.

> In Microsfot DXVA,
> we pass that value without interpreting it in userspace. For the
> following RKVDEC, it is (suspiciously ?) ignored.

IIRC, the prob context has to be kept in userspace anyway (and reset
when needed), and the rkvdec engine does not have any hardware context.
That's probably why this value is ignored here.

> Maybe just passing
> over the value would make more sense, less work ?

I don't see how adding an enum adds more work, given the enum values
match the ones defined VP 9 spec, but maybe I'm missing something.
