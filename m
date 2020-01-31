Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C8CA14EC5D
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2020 13:19:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728542AbgAaMSv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Jan 2020 07:18:51 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:55936 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728511AbgAaMSv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Jan 2020 07:18:51 -0500
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C86692954FD;
        Fri, 31 Jan 2020 12:18:48 +0000 (GMT)
Date:   Fri, 31 Jan 2020 13:18:45 +0100
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Heiko Stuebner <heiko@sntech.de>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v4 5/6] media: rkvdec: Add the rkvdec driver
Message-ID: <20200131131845.65451a8c@collabora.com>
In-Reply-To: <739f60a89646cc92f26e34523cbe8aaab5697351.camel@collabora.com>
References: <20200129195501.8317-1-ezequiel@collabora.com>
        <20200129195501.8317-6-ezequiel@collabora.com>
        <20200130171249.3ae0444a@collabora.com>
        <739f60a89646cc92f26e34523cbe8aaab5697351.camel@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 31 Jan 2020 08:53:47 -0300
Ezequiel Garcia <ezequiel@collabora.com> wrote:

> On Thu, 2020-01-30 at 17:12 +0100, Boris Brezillon wrote:
> > On Wed, 29 Jan 2020 16:55:00 -0300
> > Ezequiel Garcia <ezequiel@collabora.com> wrote:
> >   
> > > From: Boris Brezillon <boris.brezillon@collabora.com>
> > > 
> > > The rockchip vdec block is a stateless decoder that's able to decode
> > > H264, HEVC and VP9 content. This commit adds the core infrastructure
> > > and the H264 backend. Support for VP9 and HEVS will be added later on.

						 ^HEVC

> > > 
> > > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > > ---
> > > v4:
> > > * Make poc tables const, as suggested by Hans
> > > * Move buffer extra space calculation TRY_FMT, as done on Hantro.
> > > * Get rid of vb2_request_get_buf and open-code
> > >   following Cedrus. We can move it to a helper as a follow-up patch.  
> > 
> > Well, we know what that means in practice :-).
> >   
> 
> Well, not necesarily. I think we can expect a helper soon,
> but it doesn't have to be part of this series :-)

I'd be happy to be proven wrong ;-).
