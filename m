Return-Path: <linux-media+bounces-32351-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E129BAB4ABE
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 07:06:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 57AC67ABEA1
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 05:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 406831E376C;
	Tue, 13 May 2025 05:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yL5kwpRI"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2AC1BEF9B;
	Tue, 13 May 2025 05:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747112780; cv=none; b=JWfxePc2EXCJchujeFtDxSFyAvg+Sjns3mTm7cD4+ZayYSmVqfnzUDF1da+EGqo10syVlEstptmCNwJuvvWi7BDswPXFgRQZnSasJ1XGwux+LTmNYt2GaiGra3sM/x4dI1VccBm9RF28EkiW785l7noKHvl4TgJvLD4YbZLfqaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747112780; c=relaxed/simple;
	bh=AtGssVZ4UuorJIl79EDb8G16nKDDcFc3lXLT7kRReyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EsT5A409ZWImCEIixMUcgprno2mHek7NCl62f2TemJi9gBtaEmykwIhZWJhymh+ixhqVyR6AHMdOqEitr1RnZYcjGGv/V063e8XFjqdcbsp/Zo2QvLZ/aWvRECqaHm68VAxJMwBwQUfj4eHNnmlP2YmLcfvN81lsitohYzWpS2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=yL5kwpRI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5907CC4CEE4;
	Tue, 13 May 2025 05:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747112777;
	bh=AtGssVZ4UuorJIl79EDb8G16nKDDcFc3lXLT7kRReyI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yL5kwpRI9VUVvIbAu4S9rUG2V/TOk1AqE2KxDpl7rq4F3qwJdmmfgopCB7GCIoHsb
	 afqBEwm/PY9vcLSYIHc20y74dbRsz0FmVfjmbC20xK4ztVH9f/DbwPO1v+tdVTzpp/
	 1VGPONndDy/XzeOY9FBZzVkhOtMlJ+sUyXZdKhr0=
Date: Tue, 13 May 2025 07:04:29 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Krzysztof Opasiak <krzysztof.opasiak@neat.no>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
	balbi@kernel.org, paul.elder@ideasonboard.com,
	kernel@pengutronix.de, nicolas@ndufresne.ca,
	kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 0/4] usb: gadget: uvc: parse configfs entries and
 implement v4l2 enum api calls
Message-ID: <2025051317-deflation-discuss-1201@gregkh>
References: <20220909221335.15033-1-m.grzeschik@pengutronix.de>
 <Y4u+9g/gIneGZrlZ@pendragon.ideasonboard.com>
 <Y4xaXHLoiPupWM6V@kroah.com>
 <b2e943a1-fc0e-4dd2-b38e-a1d77ed00109@neat.no>
 <2025051253-trimmer-displease-1dde@gregkh>
 <f07db888-8342-491b-86b1-43309a1d2456@neat.no>
 <696f471b-c2d9-4733-9795-0fc31a48e6f8@neat.no>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <696f471b-c2d9-4733-9795-0fc31a48e6f8@neat.no>

On Mon, May 12, 2025 at 11:03:41PM +0200, Krzysztof Opasiak wrote:
> On 12.05.2025 12:43, Krzysztof Opasiak wrote:
> > On 12.05.2025 12:38, Greg KH wrote:
> > > On Mon, May 12, 2025 at 12:19:07PM +0200, Krzysztof Opasiak wrote:
> > > > Hi Greg,
> > > > 
> > > > On 4.12.2022 09:29, Greg KH wrote:
> > > > > On Sat, Dec 03, 2022 at 11:26:14PM +0200, Laurent Pinchart wrote:
> > > > > > Hi Michael,
> > > > > > 
> > > > > > On Sat, Sep 10, 2022 at 12:13:31AM +0200, Michael Grzeschik wrote:
> [...]
> > > > 
> > > > Given that I'd like to suggest that it seems to actually make sense to
> > > > revert this unless there are some ideas how to fix it.
> > > 
> > > Sorry about this, can you submit a patch series that reverts the
> > > offending commits?  As it was years ago, I don't exactly know what you
> > > are referring to anymore.
> > > 
> > 
> > Sure! Will do.
> > 
> 
> Would you prefer to have a set of actual reverts related to this:
> 
> da692963df4e Revert "usb: gadget: uvc: add v4l2 enumeration api calls"
> bca75df69aaf Revert "usb: gadget: uvc: add v4l2 try_format api call"
> e56c767a6d3c Revert "usb: gadget: uvc: also use try_format in set_format"
> 20f275b86960 Revert "usb: gadget: uvc: fix try format returns on
> uncompressed formats"
> 059d98f60c21 Revert "usb: gadget: uvc: Fix ERR_PTR dereference in
> uvc_v4l2.c"
> e6fd9b67414c Revert "usb: gadget: webcam: Make g_webcam loadable again"
> 
> but have a negative consequence that the series isn't really bisectable from
> functional perspective. For example commit e6fd9b67414c breaks g_uvc until
> we apply da692963df4e so the series would have to go in as a whole.
> 
> Or you would prefer a single commit that technically isn't a revert but it
> just "undoes" the negative consequences of "usb: gadget: uvc: add v4l2
> enumeration api calls" (kind of a squash of all commits above)?

Ideally we can bisect at all places in the tree, so it's odd that
reverting patches would cause problems as when adding them all should
have been ok for every commit, right?

But if there are merge issues, or other problems, then yes, maybe just
one big one is needed, your choice.

thanks,

greg k-h

