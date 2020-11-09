Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 582832AB3EE
	for <lists+linux-media@lfdr.de>; Mon,  9 Nov 2020 10:47:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729138AbgKIJrO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Nov 2020 04:47:14 -0500
Received: from verein.lst.de ([213.95.11.211]:57799 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728016AbgKIJrO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 9 Nov 2020 04:47:14 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 1AC186736F; Mon,  9 Nov 2020 10:47:10 +0100 (CET)
Date:   Mon, 9 Nov 2020 10:47:09 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Christoph Hellwig <hch@lst.de>, Hans Verkuil <hverkuil@xs4all.nl>,
        wens@kernel.org, Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Yong Deng <yong.deng@magewell.com>,
        linux-arm-kernel@lists.infradead.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 0/7] sunxi: Remove the calls to dma_direct_set_offset
Message-ID: <20201109094709.GA31714@lst.de>
References: <20201106151411.321743-1-maxime@cerno.tech> <20201106160737.GA31913@lst.de> <20201109094303.llqsxqoxjagiqa55@gilmour.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201109094303.llqsxqoxjagiqa55@gilmour.lan>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 09, 2020 at 10:43:03AM +0100, Maxime Ripard wrote:
> Hi Christoph, Chen-Yu, Hans,
> 
> On Fri, Nov 06, 2020 at 05:07:37PM +0100, Christoph Hellwig wrote:
> > Thanks,
> > 
> > this looks good to me:
> > 
> > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > 
> > Can you include this patch at the end of your series to that it gets
> > picked up with the other patches?
> 
> I guess the easiest to avoid bisection issues would be to merge all this
> through drm-misc, would that work for you?

Fine with me!
