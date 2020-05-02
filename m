Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D26671C28B9
	for <lists+linux-media@lfdr.de>; Sun,  3 May 2020 00:56:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728617AbgEBWzy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 May 2020 18:55:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728611AbgEBWzy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 2 May 2020 18:55:54 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B42E7C061A0C;
        Sat,  2 May 2020 15:55:53 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 7A72E264D42
Message-ID: <db9fa91be8084fe9c87f263a4a97dc38d46f9bd1.camel@collabora.com>
Subject: Re: [PATCH v2 2/3] media: uapi: Add VP9 stateless decoder controls
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Boris Brezillon <boris.brezillon@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Heiko Stuebner <heiko@sntech.de>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>
Date:   Sat, 02 May 2020 19:55:39 -0300
In-Reply-To: <20200502203707.402ea3cd@collabora.com>
References: <20200410115113.31728-1-ezequiel@collabora.com>
         <20200410115113.31728-3-ezequiel@collabora.com>
         <9126475c-275d-71ab-0308-6ae85e22446b@xs4all.nl>
         <bf475e70cca6f9ebf645aed51276e57668eaf43b.camel@collabora.com>
         <20200502203707.402ea3cd@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

+Nicolas

On Sat, 2020-05-02 at 20:37 +0200, Boris Brezillon wrote:
> On Fri, 01 May 2020 13:57:49 -0300
> Ezequiel Garcia <ezequiel@collabora.com> wrote:
> 
> > > > +
> > > > +.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
> > > > +
> > > > +.. flat-table:: enum v4l2_vp9_reset_frame_context
> > > > +    :header-rows:  0
> > > > +    :stub-columns: 0
> > > > +    :widths:       1 2
> > > > +
> > > > +    * - ``V4L2_VP9_RESET_FRAME_CTX_NONE``
> > > > +      - Do not reset any frame context.
> > > > +    * - ``V4L2_VP9_RESET_FRAME_CTX_NONE_ALT``
> > > > +      - Do not reset any frame context. This is an alternative value for
> > > > +        V4L2_VP9_RESET_FRAME_CTX_NONE.  
> > > 
> > > Add `` around V4L2_VP9_RESET_FRAME_CTX_NONE.
> > >   
> > 
> > Hm, now that I look closer, what's the point
> > of having the NONE_ALT in our uAPI if it
> > has same meaning as NONE?
> > 
> > I think it can be removed.
> 
> The intent was to match the spec so that one can pass the value
> extracted from the bitstream directly.
> 
> > > I got several smatch warnings:
> > > 
> > > smatch: ERRORS
> > > drivers/media/v4l2-core/v4l2-ctrls.c:1880 validate_vp9_frame_decode_params() warn: was && intended here instead of ||?
> > > 
> > > (Commented on this ^^^ one above)
> > > 
> > > drivers/staging/media/rkvdec/rkvdec-vp9.c:426 init_intra_only_probs() error: buffer overflow 'ptr' 9 <= 69
> > > drivers/staging/media/rkvdec/rkvdec-vp9.c:1478 rkvdec_vp9_done() error: potentially dereferencing uninitialized 'ctrl'.
> > > drivers/staging/media/rkvdec/rkvdec-vp9.c:1483 rkvdec_vp9_done() error: uninitialized symbol 'dec_dst_buf'.
> > > drivers/staging/media/rkvdec/rkvdec-vp9.c:941:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
> > > drivers/staging/media/rkvdec/rkvdec-vp9.c:1466:40: warning: variable 'fctx' set but not used [-Wunused-but-set-variable]
> > >   
> > 
> > Oh, I'll run smatch and fix them all.
> 
> Oops!


