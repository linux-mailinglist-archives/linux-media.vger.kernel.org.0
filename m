Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1E764CD09
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2019 13:39:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730917AbfFTLjj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jun 2019 07:39:39 -0400
Received: from retiisi.org.uk ([95.216.213.190]:37700 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726404AbfFTLjj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jun 2019 07:39:39 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id BDC5C634C7B;
        Thu, 20 Jun 2019 14:39:05 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.89)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1hdvPF-0002Ba-Oj; Thu, 20 Jun 2019 14:39:05 +0300
Date:   Thu, 20 Jun 2019 14:39:05 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Lubomir Rintel <lkundrak@v3.sk>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v6 5/7] [media] marvell-ccic/mmp: add devicetree support
Message-ID: <20190620113905.jtn754quua5sporb@valkosipuli.retiisi.org.uk>
References: <20190528090731.10341-1-lkundrak@v3.sk>
 <20190528090731.10341-6-lkundrak@v3.sk>
 <20190614103940.4dg43fo7dmbwnpfs@uno.localdomain>
 <20190620113511.rxoybnxm2exv2ibl@valkosipuli.retiisi.org.uk>
 <26d8ac51ff8c454a357028f267efd0d4cdd0ea84.camel@v3.sk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26d8ac51ff8c454a357028f267efd0d4cdd0ea84.camel@v3.sk>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 20, 2019 at 01:37:53PM +0200, Lubomir Rintel wrote:
> On Thu, 2019-06-20 at 14:35 +0300, Sakari Ailus wrote:
> > Ping?
> > 
> > Lubomir: I'm applying the set now, but please addres Jacopo's comment.
> > Thanks.
> 
> Hi, I'm wondering if you could wait a couple of minutes?
> 
> I've tested the patch set on my machine last night and I was about to
> submit the updated set just now.
> 
> Alternatively, I can just address Jacopo's comment with a patch that
> applies on top of the set, but it would make slightly more sense if it
> came earlier.

I applied the patches but I can always replace them with new versions ---
Mauro will cherry-pick them anyway.

-- 
Sakari Ailus
