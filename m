Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3406B16CC8
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2019 23:05:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727376AbfEGVFe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 May 2019 17:05:34 -0400
Received: from retiisi.org.uk ([95.216.213.190]:40794 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726686AbfEGVFe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 7 May 2019 17:05:34 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 96178634C7B;
        Wed,  8 May 2019 00:04:54 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.89)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1hO7Gg-0001Uy-9b; Wed, 08 May 2019 00:04:54 +0300
Date:   Wed, 8 May 2019 00:04:54 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Nicholas Mc Guire <der.herr@hofr.at>
Cc:     Nicholas Mc Guire <hofrat@opentech.at>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] media: smiapp: core: add range to usleep_range
Message-ID: <20190507210454.633dxxdggfe27fud@valkosipuli.retiisi.org.uk>
References: <1554603364-10500-1-git-send-email-hofrat@opentech.at>
 <20190430134944.6sutxdztj6crgo6w@valkosipuli.retiisi.org.uk>
 <20190504094635.GA27029@osadl.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190504094635.GA27029@osadl.at>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, May 04, 2019 at 11:46:35AM +0200, Nicholas Mc Guire wrote:
> On Tue, Apr 30, 2019 at 04:49:44PM +0300, Sakari Ailus wrote:
> > Hi Nicholas,
> > 
> > On Sun, Apr 07, 2019 at 04:16:02AM +0200, Nicholas Mc Guire wrote:
> > > Allow the hrtimer subsystem to coalesce delay timers of lower accuracy
> > > by providing a suitable range
> > > 
> > > Signed-off-by: Nicholas Mc Guire <hofrat@opentech.at>
> > > ---
> > > 
> > > Problem located by an experimental coccinelle script
> > > 
> > > hrtimers in atomic context have limited accuracy due to possible
> > > context-switching and interruption so the accuracy is limited 
> > > anyway. Giving the hrtimer subsystem a reasonable range for merging
> > > hrtimers helps to reduce the load on the hrtimer subsystem. As this
> > > delays do not seem to mandate high accuracy the range of a factor
> > > two seems acceptable.
> > > 
> > > Patch was compile tested with: x86_64_defconfig + MEDIA_SUPPORT=m,
> > > MEDIA_CAMERA_SUPPORT=y, MEDIA_CONTROLLER=y, VIDEO_V4L2_SUBDEV_API=y,
> > > VIDEO_SMIAPP=m                                                                                               
> > > (with a number of sparse warnings on sizeof() usage)
> > > 
> > > Patch is against 5.1-rc3 (localversion-next is next-20190405)
> > 
> > The delays are exact for the reason that they are user-visible delays in
> > image capturing related use cases. Sometimes milliseconds matter, or at
> > least adding more does not help.
> >
> 
> Actually it can be better iwith respect to jitter to let the hrtimer 
> subsystem use an existing timer event than to have a close by second event 
> and the accuracy is determined by the non-atomic context anyway - 
> so while the proposed delay extension might be excessive in your case
> I would still suggest to try to get away from a range of 0 - even if
> you only end up with (1000,1050) that would be an advantage for the
> timer subsystem.

Sounds reasonable to me. Would you like to send v2?

Thanks.

-- 
Sakari Ailus
