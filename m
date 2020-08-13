Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 077BE2440EA
	for <lists+linux-media@lfdr.de>; Thu, 13 Aug 2020 23:52:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726637AbgHMVwC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Aug 2020 17:52:02 -0400
Received: from retiisi.org.uk ([95.216.213.190]:45382 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726578AbgHMVwB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Aug 2020 17:52:01 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 4BEDF634C87;
        Fri, 14 Aug 2020 00:51:18 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1k6L82-0001jW-43; Fri, 14 Aug 2020 00:51:18 +0300
Date:   Fri, 14 Aug 2020 00:51:18 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH] media: ov5640: Correct Bit Div register in clock tree
 diagram
Message-ID: <20200813215117.GI840@valkosipuli.retiisi.org.uk>
References: <20200803090658.10073-1-paul.kocialkowski@bootlin.com>
 <20200805125113.rhrhy6j6uccv3jmz@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200805125113.rhrhy6j6uccv3jmz@uno.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Aug 05, 2020 at 02:51:13PM +0200, Jacopo Mondi wrote:
> Hi Paul,
> 
> On Mon, Aug 03, 2020 at 11:06:58AM +0200, Paul Kocialkowski wrote:
> > Although the code is correct and doing the right thing, the clock diagram
> > showed the wrong register for the bit divider, which had me doubting the
> > understanding of the tree. Fix this to avoid doubts in the future.
> 
> Thanks for spotting this! Correct indeed!
> 
> I'm not sure it's worth a fixes tag, but just in case:
> Fixes: aa2882481cada ("media: ov5640: Adjust the clock based on the expected rate")

Added that.

> 
> 
> Acked-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks, Paul and Jacopo!

-- 
Sakari Ailus
