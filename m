Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F07462A619B
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 11:30:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729228AbgKDKaK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 05:30:10 -0500
Received: from verein.lst.de ([213.95.11.211]:41968 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729250AbgKDK30 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 4 Nov 2020 05:29:26 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 69E9E68D04; Wed,  4 Nov 2020 11:29:23 +0100 (CET)
Date:   Wed, 4 Nov 2020 11:29:23 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Maxime Ripard <maxime@cerno.tech>, Christoph Hellwig <hch@lst.de>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>, iommu@lists.linux-foundation.org,
        Yong Deng <yong.deng@magewell.com>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: use of dma_direct_set_offset in (allwinner) drivers
Message-ID: <20201104102923.GA23981@lst.de>
References: <20201103095538.GA19136@lst.de> <20201104081411.bnt5kixgunaczbzj@gilmour.lan> <9623c346-c86c-e3ce-332b-95492576a859@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9623c346-c86c-e3ce-332b-95492576a859@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 04, 2020 at 10:15:49AM +0000, Robin Murphy wrote:
> How about having something in the platform code that keys off the top-level 
> SoC compatible and uses a bus notifier to create offsets for the relevant 
> devices if an MBUS description is missing? At least that way the workaround 
> could be confined to a single dedicated place and look somewhat similar to 
> other special cases like sta2x11, rather than being duplicated all over the 
> place.

Yes, that would be the right way to handle the issue.
