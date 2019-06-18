Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9576A49FBB
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 13:52:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729785AbfFRLwK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jun 2019 07:52:10 -0400
Received: from retiisi.org.uk ([95.216.213.190]:36766 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729660AbfFRLwK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jun 2019 07:52:10 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 512BF634C7B;
        Tue, 18 Jun 2019 14:51:45 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.89)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1hdCeP-0000rn-9j; Tue, 18 Jun 2019 14:51:45 +0300
Date:   Tue, 18 Jun 2019 14:51:45 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Robert Jarzmik <robert.jarzmik@free.fr>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Akinobu Mita <akinobu.mita@gmail.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Michael Grzeschik <m.grzeschik@pengutronix.de>,
        Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: Re: [PATCH v2] media: mt9m111: add regulator support
Message-ID: <20190618115145.npukbvnshp57hwo3@valkosipuli.retiisi.org.uk>
References: <67b53f91ede9e9ffdda913c818065095a726b92e.1559157595.git.mchehab+samsung@kernel.org>
 <20190531112723.ijhkpi354ussgvxq@kekkonen.localdomain>
 <20190531100240.6f9e5c12@coco.lan>
 <87blzi5sne.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87blzi5sne.fsf@belgarion.home>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, May 31, 2019 at 09:29:57PM +0200, Robert Jarzmik wrote:
> Mauro Carvalho Chehab <mchehab+samsung@kernel.org> writes:
> 
> > Hi Sakari,
> >
> > Em Fri, 31 May 2019 14:27:24 +0300
> > Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:
> >
> >> Hi Mauro,
> >> 
> >> On Wed, May 29, 2019 at 03:25:18PM -0400, Mauro Carvalho Chehab wrote:
> >> > From: Robert Jarzmik <robert.jarzmik@free.fr>
> >
> > As stated here, this patch is not really mine. It is a rebased version of a 
> > patch that was delegated to a sub-maintainer, being on his queue for more
> > than 2 years.
> Hi Mauro,
> 
> And if you need it, I can respin this patch for a v3, as I'm the original author
> AFAIR. And as soon as my brain recovers from my flu, I can also test it if need
> be.
> 
> You can ask whatever you need, I will help.

I wrote a few additional patches to address some of the issues. I'll post
them separately.

-- 
Sakari Ailus
