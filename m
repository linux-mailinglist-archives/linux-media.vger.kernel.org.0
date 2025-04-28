Return-Path: <linux-media+bounces-31210-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 335E0A9F24D
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 15:28:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8260516839D
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 13:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFB0326AA8C;
	Mon, 28 Apr 2025 13:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="N+pgKZFs"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB1D1A072A
	for <linux-media@vger.kernel.org>; Mon, 28 Apr 2025 13:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745846878; cv=none; b=DzovFN2FHz1tcEkliCAZX+7KPWx8ouDkb6Q7+zK4mHekoYPDr9siJJL5ZPON+T039wqW0Jc305pXai5TkY6p9Mew5FotnNtQbCkCDvarfWC15G02yvzKLb9lTLwDRaH9uk7rNJNTgIkY3mTVK5oAdtRJaziH2hR+I3Qg9jZ1Scc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745846878; c=relaxed/simple;
	bh=rdWJV1eyaY0NXNHfZWPec3gwYw8bIZY6daxhVr/w3mY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k/drYXeGBRRLwgi2CrFoLC+n+rI4O2CfpbVY9Hcd2WU/GG8QkfnMWiV3NZd36/Hg88V0slyjGSn4v8BLdld3eJG5FrESumIiWSK26XRJL1bKGRIPm0C4uI88afCtCNJHMeOrKjj5gFkOyQeKyZCH3yvl9Q7+WsrxdYInnlKTNFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=N+pgKZFs; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-70576d2faa1so41535477b3.3
        for <linux-media@vger.kernel.org>; Mon, 28 Apr 2025 06:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1745846874; x=1746451674; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FrBVnWTLdp0Srjh062xEzUh3twmbleiY0F5ZxmdYagk=;
        b=N+pgKZFs1GMgaSU761HR6MSPPBPo1Qara673fMjh9DWYfNlRB3Zc4jgTDVBaKFyBpb
         Rf1SRfIJ6RW4uucBr1y2+5eo+dnWeo+H6oRofGE8S9Qi9a6YR4KcJCG+51d2l8Seu+ne
         VQFgC8pJQ23RNEu6c1MNTrg6O2OxOZfT+AiFBbHqq9d+V5SiGkzXmXpoa3/I/EGcW4kQ
         kEvVxKUiiCz6UV7PulBJLdOMgL4ni8hbCXwqxeJtcJ7lNAuF04ATkw7e6amYyZG8i8kH
         x1UREQCD3aDhHSnN513I5gtYMDsfEqJfZl3RqrCMc6FO/GN7q+AxEs7C2+ebJ7LCTZRQ
         EtXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745846874; x=1746451674;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FrBVnWTLdp0Srjh062xEzUh3twmbleiY0F5ZxmdYagk=;
        b=YAnlOnUuPS+ACYv8m5rTPdy07K7RTKvKzAfe37CPWGPBfUFOaMB3WXc+PM6pKAh5dw
         EfzRD9vZ6Dsxjv1k+K4kIm8JGC6lfe9znxQvM2rNOz3MfohrAKJwXK8VJwx5bLdLnfS7
         XrACc60sWq6l9r7D46Sb6Hv+mPlqwLr/nfiID581z4NJYvVTCdQFmr+X9w3pZnysyuid
         i8PU4KR8FLrnA0ZGUKKUy0XVvr11Sukf2HCUWJLvXkG6YFWkIpkgrzLOQxuzqqPPTvS+
         MklB+KdIgyUv8PvACxc83FhNHOfdsvVQySHBETyoe8ZuseoVmBzsf+BNvVTP9+WmiMbY
         E+LQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAmkxgx7uxasQzMmjU/LmwEO5Dzp2VOHyJ8emTkbaIJcThXAScvOky33no+G95gT3MMpQ44HRgIC+NYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzmPSYb4ORBAR50Suhf+IcxN/z6LloEzQLCsm3jlHMoGI7Rzvi
	huo1kbruJgQ0QUFEsCL1MVCxHV5DaxpQnzwQh52Mo1ueaGeOCdxUbkpYA2uPbk0qE/tVXUq7BE5
	FzebDjse36uzXjtpWEIqMDhmjhLJRqmo1sOLmJQ==
X-Gm-Gg: ASbGnctCj2I4cM5iHuD5ra0F1ZVu6kJDKMkJHkDzUi5BXLO7dM+5DYF29jfFCqXkKo5
	1wbl4MZdnS+JrRvgwGApKdqOxs3Epi3w7lufbmyN8sThU3SYK0F22uc9bVTuPHRZK9SK75mNswk
	vhBSOMKdikpZM2FkS9wBadWg==
X-Google-Smtp-Source: AGHT+IEUt5k1HGSqM206w7ULfLh+nqjcqtfodWmMlOSg1zowQAV7TBNqlEi5g2Mk76sqyL+l2O0yMp7RVZOey99FNkg=
X-Received: by 2002:a05:690c:9c03:b0:6f9:7920:e813 with SMTP id
 00721157ae682-708540d8f44mr143245487b3.4.1745846874495; Mon, 28 Apr 2025
 06:27:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410161249.3455729-1-dongcheng.yan@intel.com>
 <aAClUxNhOhcPl9zX@kekkonen.localdomain> <c47c775b-ec57-4190-92e6-8f60283dcdc9@intel.com>
In-Reply-To: <c47c775b-ec57-4190-92e6-8f60283dcdc9@intel.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 28 Apr 2025 14:27:33 +0100
X-Gm-Features: ATxdqUFxWtujRel32aJ0YcvIUdVuNY5LSJCOT2txwJ5kNdssVSCCol8ty0CZt1g
Message-ID: <CAPY8ntD77YudoE79TgiS3+d0M8add-U65POQjnaqw_Czi3g9Ow@mail.gmail.com>
Subject: Re: [PATCH v5] media: i2c: Add ar0234 camera sensor driver
To: "Yan, Dongcheng" <dongcheng.yan@intel.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, "Yao, Hao" <hao.yao@intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Bingbu Cao <bingbu.cao@linux.intel.com>, 
	"Yu, Ong Hock" <ong.hock.yu@intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi Dongcheng

On Mon, 28 Apr 2025 at 09:05, Yan, Dongcheng <dongcheng.yan@intel.com> wrote:
>
> Hi Sakari,
>
> On 4/17/2025 2:53 PM, Sakari Ailus wrote:
> > Hi Dongcheng,
> >
> > On Fri, Apr 11, 2025 at 12:12:49AM +0800, Dongcheng Yan wrote:
> >> The driver is implemented with V4L2 framework,
> >> and supports following features:
> >>
> >>     - manual exposure and analog/digital gain control
> >>     - vblank/hblank control
> >>     - vflip/hflip control
> >>     - runtime PM support
> >>     - 1280x960@30fps and 1920x1200@60fps support
> >>     - dynamical pll_params set
> >>
> >> Signed-off-by: Dongcheng Yan <dongcheng.yan@intel.com>
> >
> > I reviewed Laurent's ar0144 driver and it turns out that the ar0144 and
> > ar0234 sensors are nearly identical in their register interface. Thus they
> > could be controlled using the same driver, with relatively small changes.
> > Laurent's driver programmatically sets the register values in general and
> > does not rely on register lists, which is why I prefer that driver.
> >
> > Would you be able to add ar0234 support to the ar0144 driver, please?
> > Sensor configuration independent MSRs are totally fine, I presume there are
> > some the ar0234 benefits from.
> >
> > My apologies for telling you this now, after 5 versions of this driver, but
> > I only learned of this very recently.
> >
> > I expect Laurent to send v3 of his driver by early next week.
> >
>
> This is the first time I have come across such a suggestion to merge one
> sensor driver into another sensor driver.
> Why should ar0234 be merged into the ar0144? If it is because of "nearly
> identical in their register interface", then most sensor drivers can be
> merged into one driver according to vendor, such as AR/OV/IMX. So I
> don't quite understand the meaning of doing this.

Close families are already supported by one driver, eg Sony IMX327,
290, and 462 all being handled by the imx290 driver.
IMX662 follows a very similar scheme, and it's on my list to
investigate merging into that driver even though hblanking is handled
differently.

SMIA and now CCS have tried to standardise sensor register sets, and
with onsemi almost having done this I can see the appeal of making use
of it.

> And AR0234 is the first patch, why should it be merged into the later patch?
> Considering that ar0144 is fully implemented using ccs-pll, do you want
> me to use the parameter constraints on pll in AR0144? The lack of
> information in the AR0234 spec makes it impossible to implement dynamic
> calculations in ccs-pll. This can also be seen from Dave's comments. The
> pll parameters we use are very different. The parameter value
> constraints found only from the existing spec cannot meet a
> multi-platform compatible ccs-pll implementation.

AR0144 is pretty much ready for merging, and addresses my comment on
the AR0234 patchset for implementing the selection API for cropping.
I've tested the basic driver (without embedded data or companding) on
a module I have, and it works well.

I note that onsemi now have both an AR0145 and AR0235 as successors
for AR0144 and AR0145. I've only skimmed the datasheets, but I'd
expect it to be possible to merge those into the one driver too. The
AR0235 developer guide also contains the PLL constraints that are
likely to apply to AR0234 (both do 1920x1200 @ 120fps).

FWIW I have a module with an onsemi AR1820 18MPix rolling shutter
sensor, and the register set there almost matches too. I was going to
try a quick hack to see if I can get that running using the AR0144
driver just by changing constants and the main init sequence.
If it does work then there is a very strong argument for merging as
many onsemi modules into the one driver as possible, although the list
of constants that end up having to be parameterised is quite
considerable. I would probably warrant a rename as well, as it would
no longer be just the ar0144 driver.
I'll try to find a few moments in the next week to see if it is feasible.

Cheers
  Dave

