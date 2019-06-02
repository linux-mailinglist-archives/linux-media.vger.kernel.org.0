Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2ED40324C6
	for <lists+linux-media@lfdr.de>; Sun,  2 Jun 2019 22:37:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726807AbfFBUhM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 2 Jun 2019 16:37:12 -0400
Received: from retiisi.org.uk ([95.216.213.190]:59078 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726485AbfFBUhL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 2 Jun 2019 16:37:11 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 77750634C7B;
        Sun,  2 Jun 2019 23:36:57 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.89)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1hXXDt-0000bk-Jh; Sun, 02 Jun 2019 23:36:57 +0300
Date:   Sun, 2 Jun 2019 23:36:57 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 4/5] media: ov6650: Fix frame scaling not reset on
 crop
Message-ID: <20190602203657.jirbekewlh7tykmj@valkosipuli.retiisi.org.uk>
References: <20190526204758.1904-1-jmkrzyszt@gmail.com>
 <1933971.yMpNBnsSgY@z50>
 <20190601223754.65soglqayxrblgzl@mara.localdomain>
 <11387277.ecJxfdHps5@z50>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <11387277.ecJxfdHps5@z50>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Janusz,

On Sun, Jun 02, 2019 at 11:58:23AM +0200, Janusz Krzysztofik wrote:
> Hi Sakari,
> 
> On Sunday, June 2, 2019 12:37:55 AM CEST Sakari Ailus wrote:
> > 
> > ... I realised that the subtle effect of "media:
> > ov6650: Register with asynchronous subdevice framework" is that the driver
> > is now responsible for serialising the access to its own data structures
> > now. 
> 
> Indeed, I must have been not thinking much while preparing it, only following 
> patterns from other implementations blindly, sorry.

No worries. I missed it at the time, too...

> 
> > And it doesn't do that. Could you submit a fix, please? It'd be good to
> > get that to 5.2 through the fixes branch.
> 
> How about dropping that V4L2_SUBDEV_FL_HAS_DEVNODE flag for now?  I think that 
> will be the most safe approach for a quick fix.  I'd then re-add it together 
> with proper locking in a separate patch later.  What do yo think?

Sure. Then we just re-introduce the flag when the driver is ready for that.

-- 
Regards,

Sakari Ailus
