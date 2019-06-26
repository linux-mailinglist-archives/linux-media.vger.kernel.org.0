Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC4CC567E3
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2019 13:48:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726347AbfFZLsq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jun 2019 07:48:46 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:36318 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726104AbfFZLsp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jun 2019 07:48:45 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 3B822260641;
        Wed, 26 Jun 2019 12:48:44 +0100 (BST)
Date:   Wed, 26 Jun 2019 13:48:39 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-media@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Alexandre Courbot <acourbot@chromium.org>,
        Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 3/3] media: uapi: h264: Get rid of the p0/b0/b1
 ref-lists
Message-ID: <20190626134839.709be189@collabora.com>
In-Reply-To: <4dec37e985d160d2fe5b3b5e28eff0e081a860fa.camel@bootlin.com>
References: <20190610085250.3255-1-boris.brezillon@collabora.com>
        <20190610085250.3255-4-boris.brezillon@collabora.com>
        <4dec37e985d160d2fe5b3b5e28eff0e081a860fa.camel@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 26 Jun 2019 13:33:41 +0200
Paul Kocialkowski <paul.kocialkowski@bootlin.com> wrote:

> Hi,
> 
> On Mon, 2019-06-10 at 10:52 +0200, Boris Brezillon wrote:
> > Those lists can be extracted from the dpb, let's simplify userspace
> > life and build that list kernel-side (generic helpers will be provided
> > for drivers that need this list).  
> 
> I don't really have any clear idea about that, but there was a
> discussion about DPB vs reference picture lists some weeks ago.

What we call DPB right now is actually a list of reference pictures
(each entry being flagged long or short term). When reading the spec,
you said DPB was referring to something that's more implementation
specific, and I think that's what motivated your initial suggestion to
rename this field into something more appropriate (ref_pics?). TBH, I'm
just guessing here, since you were the one initially proposing this
change, and I must say that having to explain what you had in mind at
that time is a bit weird :P.

> 
> Is there some mail thread with a rationale about it, some IRC logs I
> could look at or could the people involved in the discussion provide
> some additional background at this point?

Well, you were part of the discussion, and I think most of it happened
in the "Proposed updates and guidelines for MPEG-2, H.264 and H.265
stateless support" thread you started.

> 
> IIRC we also talked about removing the DPB or at least renaming it, but
> I don't have a clear idea of the outcome as well.

The list of long/short refs has to be passed, and that's actually what
we currently call "DPB", so we're just talking about a rename here,
nothing more. The ordered P/B0/B1 reflists can easily be built from the
un-ordered list of ref pics, so I'm just proposing to get rid of these
fields and have a generic implementation kernel-side so that drivers
that need it don't have to re-implement it.
