Return-Path: <linux-media+bounces-31977-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFDBAAE26E
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 16:18:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3222C1895566
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 14:16:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC69628D8E4;
	Wed,  7 May 2025 14:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="uRXc1En5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ql2KYhKT"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4953289802;
	Wed,  7 May 2025 14:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746626993; cv=none; b=K9z8e21fnLadl6YJcwL2LuikeLi9ZQdtcLRtZB9RjWMh6jEcQrVB74mnK38m+frhm+PQDt0c7iCebH+yOB8m1nMJXHhecHVK+fJrmXixEXAsDmuWUIZKUvdTC4g17gu179RulNQ6WElbwuBmzi38/aYGZECsaqX05FRVWxCI7/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746626993; c=relaxed/simple;
	bh=old7/uME17Mkn3x1D2C+nAHExdQZPeB23poziY+F+Ks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qthhauAsYAJYymCRTrPkB8u64pS1iQY3k8eAl+mv+f37tQzq7xo3HdHgEry5tVKjzSUbXuZ96+Go3UrGdzo97ElFBnvY3AgLc1u9nRFpeFxFZwjF19E9zvJQ6jVzx1Asbf+BXkW06STa0OovYu1Jwr8N+lbtTcXnaPUrA5/G+ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=uRXc1En5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ql2KYhKT; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E7F1A11401AD;
	Wed,  7 May 2025 10:09:50 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Wed, 07 May 2025 10:09:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1746626990;
	 x=1746713390; bh=Bd5xYdjuLGNHMD+GIGsrJhPQrpMyu+1/xz71iZbb+Dw=; b=
	uRXc1En5Ph+xOfqNlybAZRa7XC0A7TiAxfh506fbobsbmTX5hDm93tXdp3k6XQtO
	O5Si5308qeWqh5Gt3j5HVIzKHwm+aiWvUKqyeNorbTdBQEaHLz08VmD4kFAaLFGg
	ekWqqE5ObA8/ee3IOkeN0GV4/B4hO0UAAYDhQ862wXHkdokDVLJGlpP3KJ7g8EAh
	4fVNPM72ir3GwfaTCaR8MAiGSL55hflGHvl6YH0OdqJXUVBAw8r9aiIONlrkEq6Y
	MfF0UPGanRvVI+O8iFJwWKrHlZpOyIFHCV/Uc9r96Z104BXbkopshRs/0S46Yx8i
	+PYkO+Xnra50D1Ra6fszzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746626990; x=
	1746713390; bh=Bd5xYdjuLGNHMD+GIGsrJhPQrpMyu+1/xz71iZbb+Dw=; b=q
	l2KYhKTBSRA+Cv81ReCTKzSVIBgvKQTPsRjIoFnSXv0nSTHtqVOeNJunmKV/4Fbk
	WdHjjm9F1zQKzezhs6cZt1hLGO4tw83Agg89wBaUifwBD0GyvP6vzPlUyJ2Hphqv
	tztLViPuVdnDz5r6Az6NWsIMi4erL8+kBvu1etxNhb1VwZJQRDvgB7wlh2RlR6lN
	+KVaXaoq9U68CLX6Dd99nzk9b+Ex4S/xl2z6MIyQu6UG0zl+uI9Qz02zs9ba6m1t
	BVXe7FFu34QZYnmMRVatz2oLdUUAPhM34oWW6L8bH5IcWRq9fPn7aklz/fvf50Oe
	d+RU2bX+D+pD1X8xWG00Q==
X-ME-Sender: <xms:rmkbaOX3ADpvOoKlubEB73fzOUAZuaG9mOtTa_TTc2XkwPuCG7y8Kg>
    <xme:rmkbaKlmM_aBSzBVDgnk2KLfzcFnKc95pauLeiS4EfmYhh7ISj0ana8moRJmz6Ip8
    qjRjAIuFrscdwMZQnQ>
X-ME-Received: <xmr:rmkbaCbkSiu4wSjrbpicKzHIJOk_a1XoGWrq79e4jf9RcrTepeQZHqqEFtnVXyCD89mxXBTvv0plJuvC1DzRrZJez1zKIdUn6w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeejtdeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddt
    tdejnecuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrsh
    houggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeev
    teegtddvvdfhtdekgefhfeefheetheekkeegfeejudeiudeuleegtdehkeekteenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdr
    shhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeekpd
    hmohguvgepshhmthhpohhuthdprhgtphhtthhopehjrggtohhpohdrmhhonhguihesihgu
    vggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepjhgrtghophhordhmohhnughiod
    hrvghnvghsrghssehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlrghu
    rhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpth
    htohepkhhivghrrghnrdgsihhnghhhrghmodhrvghnvghsrghssehiuggvrghsohhnsgho
    rghrugdrtghomhdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpd
    hrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgv
    lhdrohhrgh
X-ME-Proxy: <xmx:rmkbaFW0yEME6M6IokghhC7w2oyejMpu1GmUcG6508WnIDWZC4PCpA>
    <xmx:rmkbaInqGF961LX7X4m8A-12UhpNcFBQoM8L2NvL3k3iJRg3OXH1Ig>
    <xmx:rmkbaKeOhWW8THAUURZbZZuDXxQukUJlmDrfo9i9JsxDlEVP9eyDqA>
    <xmx:rmkbaKFYmf52O37wVsv0cfhcOK70ZShdre6e0sbIslqy9QECyIeICA>
    <xmx:rmkbaLa2lK-cQovhL6mwk1HOR53SvzruQyTp8FcttnyH-jsCHVQ3uEp5>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 May 2025 10:09:50 -0400 (EDT)
Date: Wed, 7 May 2025 16:09:49 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v9] media: vsp1: Add VSPX support
Message-ID: <20250507140949.GB836326@ragnatech.se>
References: <20250506-b4-vspx-v9-1-d7d50a01f7b6@ideasonboard.com>
 <20250506173733.GA539397@ragnatech.se>
 <2wsx4pmkwmjgqlfywbsqim5irnh7lcfhbdreenevf2lnd2ofsb@u3epcobuxuij>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2wsx4pmkwmjgqlfywbsqim5irnh7lcfhbdreenevf2lnd2ofsb@u3epcobuxuij>

Hi Jacopo,

On 2025-05-07 14:28:50 +0200, Jacopo Mondi wrote:
> Hi Niklas,
> 
> On Tue, May 06, 2025 at 07:37:33PM +0200, Niklas Söderlund wrote:
> > Hi Jacopo,
> >
> > Thanks for this new version!
> >
> > I will give this a good testing as soon as I have finished some
> > refactoring of the user of this. I had a comment I wanted to send for
> > v8, but seems I never did. So for now I will just post this incase you
> > need to do a v10 before I had time.
> >
> > On 2025-05-06 18:32:23 +0200, Jacopo Mondi wrote:
> >
> > .. snip ..
> >
> > > +struct vsp1_dl_list;
> > > +struct vsp1_isp_job_desc {
> > > +	struct {
> > > +		unsigned int pairs;
> > > +		dma_addr_t mem;
> > > +	} config;
> > > +	struct {
> > > +		struct v4l2_format fmt;
> >
> > I'm very happy to see this is now the only location for the format, nice
> > work! I wonder if we shall take it one step further and just record the
> > fourcc, width, height and bytesperline here? Or at switch to a
> > v4l2_pix_format struct?
> >
> > The user of this field do not really support multi plane formats, nor do
> > it validate fmt.type field.
> >
> > I recently hit a snag in the ISP driver using this interface where I
> > *think* the solution is to only allow single plane buffers to be used as
> > input to the ISP (V4L2_CAP_VIDEO_OUTPUT_MPLANE vs
> > V4L2_CAP_VIDEO_OUTPUT). While fixing the plumbing for this I ran across
> > this, sorry for not noticing before.
> 
> True that.
> 
> However my understanding is that nowadays the multiplaner API should be used
> for single planar formats too.

Mine too, I'm just grasping for straws debugging things and this was one 
thing I tried to figure things out. It was unrelated to the VSPX, and 
did not solve my instal problem. But working on it was what lead me to 
this design decision in the VSPX driver.

> If you want to avoid passing in the
> whole 'struct v4l2_format' then I would pass in the
> v4l2_pix_format_mplane .pix_mp member (which the VSPX uses
> unconditionally at the moment).
> 
> However, assuming future developments where a different user uses
> V4L2_CAP_VIDEO_OUTPUT, the VSPX driver can be extended and use the
> .type field to select which member of the 'fmt' union to use if we
> pass the whole 'struct v4l2_format' in. This is all very theoretical I
> know. To be honest I would keep the interface as it is and eventually
> improve the VSPX driver to use the 'type' field to select which format
> to use.

I'm fine with that. Maybe add a check on .type field in the VSPX driver 
and fail if the .pix_mp 'variant' is not used to configure the VSPX?  
When playing with V4L2_CAP_VIDEO_OUTPUT the VSPX code still happy 
accepted the struct v4l2_format but it contained bad data when 
interpreted as .pix_mp instead of the .pix that was populated.

> 
> >
> > > +		dma_addr_t mem;
> > > +	} img;
> > > +	struct vsp1_dl_list *dl;
> > > +};
> >
> >
> > --
> > Kind Regards,
> > Niklas Söderlund

-- 
Kind Regards,
Niklas Söderlund

