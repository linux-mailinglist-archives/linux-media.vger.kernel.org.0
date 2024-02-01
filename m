Return-Path: <linux-media+bounces-4554-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DECE1845736
	for <lists+linux-media@lfdr.de>; Thu,  1 Feb 2024 13:18:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E7E91F22F1D
	for <lists+linux-media@lfdr.de>; Thu,  1 Feb 2024 12:18:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB45C15DBD6;
	Thu,  1 Feb 2024 12:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vQOkE/Fc"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B1815DBA3;
	Thu,  1 Feb 2024 12:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706789913; cv=none; b=F68wrnCYNrSA5Fqbz75HmmNwPxpLSDVrBc9rP+pCCfwt2H1f9F7TeErAypkgAd61Ax+LrOlcNFbQg+vhTMsx8szKtjWwFoF/bUXVIuV1p4j3jXEYEzaHs/i1maoaoPKMRztoBusN/n7eSN5UQK5HEuGSgWtpvDjVL6BZKJC4lYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706789913; c=relaxed/simple;
	bh=ONgJ9QwlUcDtqCge29kYWktJkuQ4YaSdD7YbMmyN07E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aFAmevyyTI+TspnzkTlxrIjhroeg3B4m7jOKn1ZJWy/aHEv3J5SKZG804SdaxdGlvz0WgbG2+x8jvPNNSp53c/QYZXDH7+vlj9e6bXD4Xd6fyliSf+82ZbXeu3zwFEphwynQWFItevdBhYCN63+JhOXv3w49Al9n2C9rxGodkus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vQOkE/Fc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65027C433C7;
	Thu,  1 Feb 2024 12:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706789910;
	bh=ONgJ9QwlUcDtqCge29kYWktJkuQ4YaSdD7YbMmyN07E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=vQOkE/FctNAD4bcXsZvdC8RZFa9iRbb98i8XVugw71vTgNLEkJVwq0sa+2w9HAr16
	 DJhaNzquhitN6RhkdEkhGELUMjexOiL4Wj8VKuQdgcdC6T0wgSgJlfX+LLFMnYKav0
	 QJV+440Sq3K4driqa1EVilzhqG4Y7vtL7CXgy1c6YLXjRExbfCm2Kjj2a6212SEzdl
	 9vxF3xgMYbJYeTuxZRL9WTHIaUZwULsUaQSzO0esdY+OvOuWqMhqMahGJ4Uo1NbZzD
	 DW72rGKvAMrBkfpf1COPi53JEAyNzjpANGf7RExfxOMxJFFA4vm76a3GH9m61C0Nk6
	 r38ZeHTachXhg==
Date: Thu, 1 Feb 2024 13:18:26 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, linux-staging@lists.linux.dev, Kate
 Hsuan <hpa@redhat.com>
Subject: Re: [GIT PULL] media: atomisp: Changes for 6.8-1
Message-ID: <20240201131826.7d8502ae@coco.lan>
In-Reply-To: <508f2b4d-5fbd-4389-b98f-31b9525dd7cd@redhat.com>
References: <d5059986-0329-4e6a-a7a5-30da8ebd58a9@redhat.com>
	<20240201071017.6032bba8@coco.lan>
	<508f2b4d-5fbd-4389-b98f-31b9525dd7cd@redhat.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu, 1 Feb 2024 12:46:19 +0100
Hans de Goede <hdegoede@redhat.com> escreveu:

> Hi,
> 
> On 2/1/24 07:10, Mauro Carvalho Chehab wrote:
> > Em Sun, 31 Dec 2023 11:39:18 +0100
> > Hans de Goede <hdegoede@redhat.com> escreveu:
> >   
> >> Hi Mauro,
> >>
> >> Here are the atomisp changes for 6.8.
> >>
> >> My patches in this set been posted on the list, but only a couple of
> >> minutes ago, leaving pretty much zero time for review. Sorry about that,
> >> with the holidays the timing did not work out very well.
> >>
> >> If you don't want to take this pull-request because of this it
> >> would be good if you can at least take the patches up to
> >> the "media: atomisp: Fix spelling mistake in ia_css_acc_types.h"
> >> change. There are only 2 unreviewed patches from me in that
> >> set, which fix the atomisp driver not working at all with
> >> the latest media_stage/master code. And the rest of the patches
> >> in that set are from others and have been reviewed by me.  
> > 
> > We typically close the media merge window at -rc6. As I was also
> > in vacations during those weeks, this PR was merged today for 6.9.  
> 
> No problem, I know I was late with submitting this PR.
> 
> > Indeed the first two patches seem to be needed to fix an issue on 6.8. 
> > Could you please send them to stable after their arrival at linux-next?  
> 
> I'm not sure what you mean with send them to stable ?
> 
> 6.8 is not released yet, so these need to be send to Linus this
> cycle. What is the process for media bugfixes for the current
> kernel cycle ?

Heh, sorry, somehow I was thinking on 6.7 :-)

If the bug only happens on 6.8, I can just cherry-pick the two patches
on my fixes branch.

Thanks,
Mauro

