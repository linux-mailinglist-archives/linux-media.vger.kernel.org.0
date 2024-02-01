Return-Path: <linux-media+bounces-4561-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C2F8458C1
	for <lists+linux-media@lfdr.de>; Thu,  1 Feb 2024 14:21:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA4761F29CC1
	for <lists+linux-media@lfdr.de>; Thu,  1 Feb 2024 13:21:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF5265CDEE;
	Thu,  1 Feb 2024 13:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kMRl+nUj"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3629753385;
	Thu,  1 Feb 2024 13:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706793637; cv=none; b=SrhYtvQBr6RnEE+hKjGxKolYc7JX8+B7rzdHakx3O+7iSvAHWmDD8KYmhIzfND9M//fZxsX6fvnjoULdVB0t4X8XzyxnDkXlFu+k9IDiKnuLTPof3sPQSZ/pGjp49hAr4KHFYK1bIwMzkvrqsGOQFKnjGHBg0zG39m67Paxdsuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706793637; c=relaxed/simple;
	bh=91Gbfrxyx92uBpuq3YaFcew4t4G3yajBdrENfvWvljY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MCOVBcMbuiHQnn40RYvQQgyTkiyT4BcpfmIE5HrbqBS/LvzeRdjnl6/5bJQzcqrar+lIyD33TVxPxppOaXs5+uIWq+yh2Om5gR/y01CRD5DxFyweysomSsXwu/JEtnEO0bhHY+qbd7xP0bh1K109qDYThWOHvIpfFTN3RvI/cOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kMRl+nUj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54314C433F1;
	Thu,  1 Feb 2024 13:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706793636;
	bh=91Gbfrxyx92uBpuq3YaFcew4t4G3yajBdrENfvWvljY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kMRl+nUj++gMOkY2eiVPeG+iFpOMzK1NWZKLRPO4byjsGjRzyLsPCZE4sLYKbhbe9
	 a7FcyvH7smLtP40lWLUucwONfOXy6F3Mvw9dwL3QAm7dlvSBM6Uz6p6JXbuQwdUWrP
	 A2hEG7M+04A9QM+Kxpdbotu6rZZEoLJsFO5Vy1HW8MPY4DAffvTii5KtD5IL+sRVhK
	 jRK2haV/Okz4qJ9IMw7iVt8oQJJyMP3sc1IQtRIHdd4E/7qMRefZQKRLO4qQoFjj7i
	 uZ2KIUzf+xb7DiC/YdvN5hc/Ig9p2rZWsmKZsvH4K3A+/5WT2atD8nO2MpVn/eld/o
	 pxVpYyUEYu+RQ==
Date: Thu, 1 Feb 2024 14:20:31 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, linux-staging@lists.linux.dev, Kate
 Hsuan <hpa@redhat.com>
Subject: Re: [GIT PULL] media: atomisp: Changes for 6.8-1
Message-ID: <20240201142031.34b89978@coco.lan>
In-Reply-To: <3d0d2d3e-f991-4261-83f8-e4fd813e0804@redhat.com>
References: <d5059986-0329-4e6a-a7a5-30da8ebd58a9@redhat.com>
	<20240201071017.6032bba8@coco.lan>
	<508f2b4d-5fbd-4389-b98f-31b9525dd7cd@redhat.com>
	<20240201131826.7d8502ae@coco.lan>
	<3d0d2d3e-f991-4261-83f8-e4fd813e0804@redhat.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu, 1 Feb 2024 13:33:08 +0100
Hans de Goede <hdegoede@redhat.com> escreveu:

> Hi,
> 
> On 2/1/24 13:18, Mauro Carvalho Chehab wrote:
> > Em Thu, 1 Feb 2024 12:46:19 +0100
> > Hans de Goede <hdegoede@redhat.com> escreveu:
> >   
> >> Hi,
> >>
> >> On 2/1/24 07:10, Mauro Carvalho Chehab wrote:  
> >>> Em Sun, 31 Dec 2023 11:39:18 +0100
> >>> Hans de Goede <hdegoede@redhat.com> escreveu:
> >>>     
> >>>> Hi Mauro,
> >>>>
> >>>> Here are the atomisp changes for 6.8.
> >>>>
> >>>> My patches in this set been posted on the list, but only a couple of
> >>>> minutes ago, leaving pretty much zero time for review. Sorry about that,
> >>>> with the holidays the timing did not work out very well.
> >>>>
> >>>> If you don't want to take this pull-request because of this it
> >>>> would be good if you can at least take the patches up to
> >>>> the "media: atomisp: Fix spelling mistake in ia_css_acc_types.h"
> >>>> change. There are only 2 unreviewed patches from me in that
> >>>> set, which fix the atomisp driver not working at all with
> >>>> the latest media_stage/master code. And the rest of the patches
> >>>> in that set are from others and have been reviewed by me.    
> >>>
> >>> We typically close the media merge window at -rc6. As I was also
> >>> in vacations during those weeks, this PR was merged today for 6.9.    
> >>
> >> No problem, I know I was late with submitting this PR.
> >>  
> >>> Indeed the first two patches seem to be needed to fix an issue on 6.8. 
> >>> Could you please send them to stable after their arrival at linux-next?    
> >>
> >> I'm not sure what you mean with send them to stable ?
> >>
> >> 6.8 is not released yet, so these need to be send to Linus this
> >> cycle. What is the process for media bugfixes for the current
> >> kernel cycle ?  
> > 
> > Heh, sorry, somehow I was thinking on 6.7 :-)
> > 
> > If the bug only happens on 6.8, I can just cherry-pick the two patches
> > on my fixes branch.  
> 
> I believe you only need:
> 
> "media: atomisp: Adjust for v4l2_subdev_state handling changes in 6.8"
> 
> And as the subject says, that is a fix for 6.8, 6.7 is fine AFAIK.

Ok, patch cherry-picked to the fixes branch. I'll send it together
with the other pending patches after they arrive to linux-next
(so likely next week).

Thanks,
Mauro

