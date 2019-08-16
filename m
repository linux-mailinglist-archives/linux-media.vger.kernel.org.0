Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0ED4F8FF20
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2019 11:37:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726989AbfHPJhd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Aug 2019 05:37:33 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:38194 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726981AbfHPJhc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Aug 2019 05:37:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=0F/giW7qzvWYTUL5sbz3szb+iJQC1jLSEQGo39WlHBU=; b=HZrr6j44x3ZUhqRGAU+Gt5m86
        ZMbvncD/9+v/l88nqEMvaa1G5dfA1IwFUh4AmiJ8+D/hVZwjlqP/CcZaljhCIwoIyobOScSOT+UmL
        /A/0yoeqxFiJaDQCHVd3LLYNgHYNk23+jRsQ+Y04FTYLXX2Z3GI65vQ7ckHTCKPNQ4vBZmCS/ZnP+
        IMm6cY3RnvM21zTc0Tusl9E7SfSweD8i3EGCmdbitywMsEHmVUWkREsZEzNIhcH1tmrEzuULEyquM
        qpWAwu8t8/YDL5j+NPrTtyTRUkLHoHlM1xfCM+s7pMxlmvGcl5iV3vc7oUjLjLqe1iwX9bR9ZponR
        eIwMAeLYg==;
Received: from [191.249.103.100] (helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hyYfr-0003f7-8D; Fri, 16 Aug 2019 09:37:31 +0000
Date:   Fri, 16 Aug 2019 06:37:27 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Tomasz Figa <tfiga@chromium.org>
Subject: Re: [ANN] Topics for a media summit in Lyon in October
Message-ID: <20190816063727.1d86cd29@coco.lan>
In-Reply-To: <010ba9ce-bac9-6f0c-f128-4f163a7d8ea7@xs4all.nl>
References: <010ba9ce-bac9-6f0c-f128-4f163a7d8ea7@xs4all.nl>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 16 Aug 2019 10:06:30 +0200
Hans Verkuil <hverkuil@xs4all.nl> escreveu:

> Rather then discussing topics for a meeting under the subject 'Lisbon'
> let's start a new thread referring to the right place :-)
> 
> I will try to organize a room, either during the ELCE or (if that doesn't
> work) perhaps on the Thursday afterwards. If that's going to be a problem
> for someone, please let me know.
> 
> I do need to know how many people I can expect. I have the following
> confirmed attendees (and please reply if you are not listed!):

I'm not planning to go to ELCE this year.

Regards,
Mauro

> 
> Alexandre Courbot <acourbot@chromium.org>
> Tomasz Figa <tfiga@chromium.org>
> Jacopo Mondi <jacopo@jmondi.org>
> Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Hans Verkuil <hverkuil@xs4all.nl>
> 
> I know there were more who mentioned on irc that they would attend,
> but it is easier to keep track if I have it in an email.
> 
> Topics posted under the previous thread:
> 
> Tomasz:
> 
> I would want to discuss various v4l2_buffer improvements, e.g.
> - DMA-buf import with plane offsets,
> - unifying the buffer structs for M and non-M formats,
> - ability to import different FDs with offsets for non-M formats if the
> layout matches driver expectations, etc.
> 
> Besides that, I would be interested in the general idea on handling
> complex cameras in the Linux kernel in spite of the remaining V4L2
> limitations, e.g.
> - combinatorial explosion of /dev/video nodes,
> - significant ioctl overhead,
> - huge amount of historical legacy making the driver and userspace
> implementations overly difficult and prone to repetitive mistakes,
> - the above also limiting the flexibility of the API - formats, frame
> rates, etc. set using distinct APIs, not covered by Request API, with
> non-failure "negotiation hell", etc.
> - lack of fences, etc.
> 
> Jacopo:
> 
> Apart from discussing libcamera and hope we could kickstart a review of
> its API, I would like to re-start discussing multiplexed stream support,
> but that would require Sakari to be there, something I'm not certain
> about. Sakari?
> 
> Alexandre:
> 
> If Collabora/Bootlin is there, I'd certainly want to discuss stateless
> codecs, in particular m2m codec helpers and finalize the specification
> in general.
> 
> Regards,
> 
> 	Hans



Thanks,
Mauro
