Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A90D279742
	for <lists+linux-media@lfdr.de>; Sat, 26 Sep 2020 08:30:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727201AbgIZGax (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 26 Sep 2020 02:30:53 -0400
Received: from verein.lst.de ([213.95.11.211]:58446 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726210AbgIZGax (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 26 Sep 2020 02:30:53 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 1AE7968AFE; Sat, 26 Sep 2020 08:30:51 +0200 (CEST)
Date:   Sat, 26 Sep 2020 08:30:50 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Christoph Hellwig <hch@lst.de>, linux-media@vger.kernel.org
Subject: Re: [git:media_tree/fixes] media: media/v4l2: remove
 V4L2_FLAG_MEMORY_NON_CONSISTENT flag
Message-ID: <20200926063050.GB3427@lst.de>
References: <E1kHoRT-009OMF-AW@www.linuxtv.org> <20200922134235.GA22620@lst.de> <20200926075702.6e1fbe2a@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200926075702.6e1fbe2a@coco.lan>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Sep 26, 2020 at 07:57:02AM +0200, Mauro Carvalho Chehab wrote:
> Hi Christoph,
> 
> Em Tue, 22 Sep 2020 15:42:35 +0200
> Christoph Hellwig <hch@lst.de> escreveu:
> 
> > On Mon, Sep 14, 2020 at 01:28:06PM +0000, Mauro Carvalho Chehab wrote:
> > > This is an automatic generated email to let you know that the following patch were queued:  
> > 
> > did you intend to get this into Linus tree before 5.9?  I just checked
> > and didn't see it in mainline yet.
> 
> It was merged upstream on Thursday:
> 
> 	https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8fa5960f575995bc8f3beb6b36c5aa6c61e7cdc0

Yes, I saw it yesterday, and now merged the sereis that depends on it
into my for-next tree.
