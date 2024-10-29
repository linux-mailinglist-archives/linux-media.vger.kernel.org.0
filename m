Return-Path: <linux-media+bounces-20527-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E91D9B4A06
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 13:46:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B9C11F23258
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 12:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C568206045;
	Tue, 29 Oct 2024 12:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ucSnCxdD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4343F1E2301;
	Tue, 29 Oct 2024 12:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730205980; cv=none; b=pv7RVXHFu5rIjNoDSVpS5mYtisQz0CfsrWacb3u1fWF+iSNicPnAKLiQXUIFDPTKrXxbI3SKnw8r3zEubX3hENOyPblRvkOP5o7MM3d7VsKwHfa/Cl+ZM7oeFuq887iSFw3MHRhvJ6yibQJF44jcXAiiwkHFXWjBSPqM/cEv9y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730205980; c=relaxed/simple;
	bh=OLil04WAdDwUQiUnyBgo68CgowQVLkwEN+Pc80r2GOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MEwJsIm0SyahJPzRKrAvghnilgkKshOGSLHS+fK87iFwlObXwfHWeRhI8Pyz1be4AP04GpfV4NDEoUIOVneKXq2//hcqW93c4otx3jCrJUZwh2BwfqlKjIsxpatUVoRiuQTQvDdpDAIEGsWvvbI9WMp7m3pnC+woT+38kiQB7FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ucSnCxdD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 56CAE4D4;
	Tue, 29 Oct 2024 13:46:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730205973;
	bh=OLil04WAdDwUQiUnyBgo68CgowQVLkwEN+Pc80r2GOo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ucSnCxdDdpntMwXNJ28N3XAxZ/O5S44Eheqyt0429yfbjXnt22/Vw/J70MUfahUFs
	 hfqB0pC/Rnpl5UwEtPYILpB21BN0+8n0FI1AgZLnqlMzRNfSvvcwPpuu01TNyOcxh+
	 O9TjDRkyZ2f3k1FodWSvjsaLDMFi6Mi+81MatNK4=
Date: Tue, 29 Oct 2024 14:46:09 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mirela Rabulea <mirela.rabulea@nxp.com>, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
	laurentiu.palcu@nxp.com, robert.chiras@nxp.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	LnxRevLi@nxp.com, kieran.bingham@ideasonboard.com,
	hdegoede@redhat.com, dave.stevenson@raspberrypi.com,
	mike.rudenko@gmail.com, alain.volmat@foss.st.com,
	julien.vuillaumier@nxp.com, alice.yuan@nxp.com,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: media: i2c: Add bindings for OX05B1S
 sensor driver
Message-ID: <20241029124609.GP22600@pendragon.ideasonboard.com>
References: <20241028190628.257249-1-mirela.rabulea@nxp.com>
 <20241028190628.257249-2-mirela.rabulea@nxp.com>
 <216a2728-ab62-4b76-aca5-8d911687dfbe@kernel.org>
 <20241029121039.GM22600@pendragon.ideasonboard.com>
 <eeaa92c0-fed6-408b-8471-47acf0ca394d@kernel.org>
 <20241029122150.GN22600@pendragon.ideasonboard.com>
 <3ff55dc3-c6a9-40a8-8e21-2e3e43cfd614@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3ff55dc3-c6a9-40a8-8e21-2e3e43cfd614@kernel.org>

(CC'ing the devicetree mailing list)

On Tue, Oct 29, 2024 at 01:28:51PM +0100, Krzysztof Kozlowski wrote:
> On 29/10/2024 13:21, Laurent Pinchart wrote:
> > On Tue, Oct 29, 2024 at 01:15:46PM +0100, Krzysztof Kozlowski wrote:
> >> On 29/10/2024 13:10, Laurent Pinchart wrote:
> >>> On Tue, Oct 29, 2024 at 07:14:28AM +0100, Krzysztof Kozlowski wrote:
> >>>> On 28/10/2024 20:06, Mirela Rabulea wrote:
> >>>>> Add bindings for OX05B1S sensor driver
> >>>>>
> >>>>> Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> >>>>
> >>>> <form letter>
> >>>> Please use scripts/get_maintainers.pl to get a list of necessary people
> >>>> and lists to CC. It might happen, that command when run on an older
> >>>> kernel, gives you outdated entries. Therefore please be sure you base
> >>>> your patches on recent Linux kernel.
> >>>>
> >>>> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> >>>> people, so fix your workflow. Tools might also fail if you work on some
> >>>> ancient tree (don't, instead use mainline) or work on fork of kernel
> >>>> (don't, instead use mainline). Just use b4 and everything should be
> >>>> fine, although remember about `b4 prep --auto-to-cc` if you added new
> >>>> patches to the patchset.
> >>>>
> >>>> You missed at least devicetree list (maybe more), so this won't be
> >>>> tested by automated tooling. Performing review on untested code might be
> >>>> a waste of time.
> >>>>
> >>>> Please kindly resend and include all necessary To/Cc entries.
> >>>> </form letter>
> >>>>
> >>>> Binding also looks very different than all other devices, so re-write it
> >>>> starting from EXISTING GOOD bindings. Not some downstream stuff.
> >>>
> >>> Krzysztof, please point to a good example when making this kind of
> >>> comment.
> >>
> >> Anything recently added. Git log tells which files were recently added.
> > 
> > If the review comment is a copy&paste (given that you review lots of
> > bindings and constantly have to repeat the same things, that would make
> > sense), expanding it with that information for future reviews could help
> > patch authors. Thanks for considering it, it would be much appreciated.
> 
> Sorry, but that's not the point. You do not take 10 yo, unmaintained
> driver and use it as template for your new one. Instead you rather take
> something recent or something which you know is correct. Same with bindings.

I wouldn't know for sure which driver or binding was used as a starting
point. My point was unrelated to this particular patch series. I think
that including clear information in ready-made answers will help
everybody. It will tell the submitters what they need to know, it will
avoid this kind of conversation being repeated, and it could even in the
end increase the quality of submissions. Even better, it won't cost
anything to add it to answer templates.

> NXP is not a small company which does not know how to use Linux or how
> to upstream stuff. This is not individual's contribution, where one does
> not have colleagues or 3 billions USD of revenue behind, to be able to
> get some internal help prior sending something downstream.
> 
> They can spend something out of these 3 billions of revenue or 700
> millions of net income to hire you guys or any other open-source
> company, if basics of upstreaming are unknown.
>
> That's the comment I was giving about NXP since a year. Some things
> around SoC improved, some things from this unit of NXP here did not
> change at all.

If I were on the receiving end of this, as an individual developer, I
would consider it very patronizing and insulting. Treating the authors
of contributions you don't consider as good enough in such a harsh way
will not improve the situation, and will drive people away. You may be
frustrated by some companies, but this kind of comment will not help.
Please soften your tone towards individual developers, they're not
punching balls on which to dump frustration and anger. Firm and polite
will work better than lashing out.

> So again, it's not about me giving them more things. They will keep
> ignoring it over and over, because that's how big companies sometimes
> behave. You know, community people work for free, right?

-- 
Regards,

Laurent Pinchart

