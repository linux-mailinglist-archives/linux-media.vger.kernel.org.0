Return-Path: <linux-media+bounces-118-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAE97E8C6B
	for <lists+linux-media@lfdr.de>; Sat, 11 Nov 2023 20:58:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58848280E1F
	for <lists+linux-media@lfdr.de>; Sat, 11 Nov 2023 19:58:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69BA91D53A;
	Sat, 11 Nov 2023 19:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="XM33WYXg"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978371D524
	for <linux-media@vger.kernel.org>; Sat, 11 Nov 2023 19:57:56 +0000 (UTC)
Received: from mx.treblig.org (mx.treblig.org [IPv6:2a00:1098:5b::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 035F1385F;
	Sat, 11 Nov 2023 11:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
	:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
	:List-Post:List-Owner:List-Archive;
	bh=wQsACgiV+7bsdi8S72TNk8tfSZlInd33y8CNV6aXzCo=; b=XM33WYXghihHw9S+jrmsjx0Y2k
	6wDQJNfMimTGV2iK4DjP2X8plZ+cIiIMUmNuqj+OhZIKj/qsHBg+plA35rnFKnX3uOxQhqeE127+n
	UqmmZlstrn1F0IoflZxM1iUAISs6sbuBNDObRIOK3rfQ6HENIoCQMxaZCvGWMSDdeN4ERz2hut0Li
	npCFHOlkecXV6Q7SlupIZmXQWk1nS73lUYbI5reNmctc8Rb4xoPAs7XpJm6t6qxAe+oOTDwy/mCyy
	kQozb2wR5ikRaRbo/PrGr0rptYCrxj5tC1m6YTB2AmLaPPNABZBcy4yngw8JWN97BfNN7w7At8tOD
	0vXSWXdA==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1r1u6z-008m3N-0w;
	Sat, 11 Nov 2023 19:57:45 +0000
Date: Sat, 11 Nov 2023 19:57:45 +0000
From: "Dr. David Alan Gilbert" <dave@treblig.org>
To: Hans Verkuil <hverkuil@xs4all.nl>, a.j.buxton@gmail.com
Cc: iommu@lists.linux.dev, mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: Regression: v4l/bttv vbi vs iommu
Message-ID: <ZU_cuavAminaVhuw@gallifrey>
References: <Y9qSwkLxeMpffZK/@gallifrey>
 <d363902d-e465-8411-0c1e-58411b3a19b0@xs4all.nl>
 <20230203063500.GA23520@lst.de>
 <3a59ffba-a7fe-97b0-af76-7194f7b3896a@xs4all.nl>
 <ZNjXKjCx3lH0s1m3@gallifrey>
 <8a667bd9-6a2d-301c-ee11-23e9466b193a@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <8a667bd9-6a2d-301c-ee11-23e9466b193a@xs4all.nl>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-12-amd64 (x86_64)
X-Uptime: 19:48:58 up 56 days, 22:47,  1 user,  load average: 0.00, 0.00, 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

* Hans Verkuil (hverkuil@xs4all.nl) wrote:
> On 13/08/2023 15:14, Dr. David Alan Gilbert wrote:
> > * Hans Verkuil (hverkuil@xs4all.nl) wrote:
> >> On 03/02/2023 07:35, Christoph Hellwig wrote:
> >>> On Wed, Feb 01, 2023 at 09:48:46PM +0100, Hans Verkuil wrote:
> >>>> In fact, the plan is to replace the old and deprecated videobuf framework by the vb2
> >>>> framework in the bttv driver in the next 2-3 months or so. That will also automatically
> >>>> solve this problem.
> >>>
> >>> It would be great to expedite removal of the old videbuf code given
> >>> how many problems it has.
> >>
> >> We're working on it. A lot of old drivers in drivers/staging/media/deprecated will
> >> be removed in 6.3, and that leaves the cx18, bttv and saa7146 drivers that still use
> >> vb1.
> >>
> >> This week I posted patches converting cx18 to vb2 and someone else will work on the
> >> bttv conversion. We thought we could remove saa7146 as well, but it turns out that
> >> that is still very much in use (somewhat unexpectedly), so I plan to convert that
> >> one this month (I hope).
> >>
> >> I aim for removing vb1 in kernel 6.4 or 6.5.
> > 
> > Did this go in, I'm happy to give it a go if this is a world to test.
> 
> I just merged it for 6.6.

Hi Hans,
  Apologies in the delay, I've just got around to looking at 6.6
for this.
  I'd say it's looking pretty good, oops free so far.
There are a couple of oddities, which I'm not sure are an issue or not:

a) Loss of 'seq' field.
  The bttv used to include a sequence number in each vbi line;
That now seems to be 0; I don't think it's a big loss, but it was
used by some tools to see if they dropped frames, and it's confusing
it into moaning about it.

b) Frame vs fields

I tend to run xawtv at the same time as dumping vbi; with xawtv grabbing
frames, the vbi is showing it grabbing 50fps, if I drop xawtv to
no-capture, the vbi is showing it at 25fps; I've not figured out yet if
that's actually losing data or just reorganising it.
(The reason for running xawtv is that it was found that the AGC on the
bttv goes out if you've not got it running sometimes).

Anyway, thanks for fixing the rework that fixed the crash!

Dave


> 
> Regards,
> 
> 	Hans
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

