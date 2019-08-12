Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 079EB89C02
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2019 12:53:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728067AbfHLKxp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Aug 2019 06:53:45 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:55822 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727235AbfHLKxp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Aug 2019 06:53:45 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 6DF4E28BC11
Message-ID: <d71d504c2c73af04ce7a92c27f2d33f101c0cdf5.camel@collabora.com>
Subject: Re: [PATCH v4 05/11] media: uapi: h264: Get rid of the p0/b0/b1
 ref-lists
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        fbuergisser@chromium.org, linux-kernel@vger.kernel.org
Date:   Mon, 12 Aug 2019 07:53:32 -0300
In-Reply-To: <62750a74-f856-c927-72a3-17d1a2624550@xs4all.nl>
References: <20190808103432.12062-1-ezequiel@collabora.com>
         <20190808103432.12062-6-ezequiel@collabora.com>
         <62750a74-f856-c927-72a3-17d1a2624550@xs4all.nl>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 2019-08-12 at 12:20 +0200, Hans Verkuil wrote:
> On 8/8/19 12:34 PM, Ezequiel Garcia wrote:
> > From: Boris Brezillon <boris.brezillon@collabora.com>
> > 
> > Those lists can be extracted from the dpb, let's simplify userspace
> > life and build that list kernel-side (generic helpers will be provided
> > for drivers that need this list).
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
> > Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > ---
> > Changes in v4:
> > * Add R-b
> 
> ???
> 
> Nothing was added, left-over from some old version?
> 

Compared to v3, this version adds the Reviewed-by tags,
which is what the Add R-b means.

Sorry if that wasn't clear! :-)

