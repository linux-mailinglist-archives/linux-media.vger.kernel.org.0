Return-Path: <linux-media+bounces-29170-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F06A7831E
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 22:08:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D11916B714
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 20:08:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E51B220FAB0;
	Tue,  1 Apr 2025 20:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="LBNJXKua";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="c+DYI407"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D84D199943;
	Tue,  1 Apr 2025 20:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743538095; cv=none; b=k3TmT3IMPPTY750x2wF711Q4c65oI0sZYFbZkmc6EeJB5arLHzP7lvwzodVbTg6QJ2vDJcFX+Oc0/y745b3DiaDgcqXZTGlJ6apGdZIoyjmgHc2r1jXXjsscMXR6Rp7PDSmicUT5AAjdobtx16iKZN8tZebSz+M5/CuCFKHzjBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743538095; c=relaxed/simple;
	bh=6yAPTyTOxkeWZlWnRGYP7SoNjoMpLU5gcEOBILNPoR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G/T6GJVYHw8f6D9f92PmuccmpjZedoCrZTWi+LTOI078kfWFW1EEohYFZDfuT2rDwroSqH8hHygsGVGWPopVppe06yt7m3PqI0yMO0sRAv63A7ijU17LCor5J6JAHql80ZQ6g3r/jwrbhmRuXE/7G2NsTIFp+Ybqw+IdqJrTwbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=LBNJXKua; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=c+DYI407; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 5369F114002D;
	Tue,  1 Apr 2025 16:08:12 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Tue, 01 Apr 2025 16:08:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1743538092;
	 x=1743624492; bh=IroLAZPglAM7pFgkrdkyxi2ngFBYvJjGp+Nu95cgJlA=; b=
	LBNJXKualZHiTwQFfuJKlAtEUY3hDluL1ToEN8npi3y7ly42ePfVGPGq9qg47jNe
	2MSuMwco38VgYM5aEIv7+Wg+IQr7bpN8yJClRthLX8mqWgkVXqAdyAnATvTBFrwM
	e6KRvjWqhW3MGoYzGU+9evO6IntHxQayzCnyDrb2EaboTkFG6KxrQcVkLxPMGOCe
	Ewfb+OnDj608fL1OI9X73WJxOSzs5wi8NSn3i1yCtDFczo2slEolwTtLO4sXvuSS
	ZAlFMTvWEJ3ZTDPh4OKvzIlLmTQGA495+jIsi1dbjwcU08uRQDqSF7sC7/rbdBP2
	F69H0xgyZCqh3amMAIiFNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1743538092; x=
	1743624492; bh=IroLAZPglAM7pFgkrdkyxi2ngFBYvJjGp+Nu95cgJlA=; b=c
	+DYI4074sU7Zywae4NYevjYiar1fyL4x0KxSlgB9P/Om7KZLVKwvljPUPPhrHTLW
	cfH5fnHupdcmLOI29btrms3qRRZOmnWIaq32ywWEoFxNmJklZCfJgwwgh+Jp4AoI
	EQ435NHFZV3owe66ey+1hD4tFMpkffqu+o+sl2ufERGm5ycDV0PvSW5miiDOVHSo
	cKIwP1NHWbkuDg/QK4GyWgDyXUd+EpciCwJLSw5iqwGig8j7SJVB45sz5uMoOwZZ
	9lUbk2/34bJSJbilVRJrfYiIoQN54lvuVJdYYi/z9hpfIpZF+C/lAeWnTpOtRlHc
	8574J/DNKAXWdQQEiR4Dw==
X-ME-Sender: <xms:rEfsZ-L5V-WJqceec1rxhwA_ZbcL2O77Pem1oj-vMrrRhYbkTO7Z6Q>
    <xme:rEfsZ2KNRFFZEx2-wrxKxpwBX8wC5ip3bgjHxxKsCSkdRPk2PX56kiXd7JPFYTAqZ
    6yJR1dcGreQhk6LNGI>
X-ME-Received: <xmr:rEfsZ-uW7nr7b-WUYCbzFmmK_eLpP5Z7Iliym8sRysdqLIJQ0ib1mT-zosaipB2vHlm4s4I1zWgTou93TCUSKth2laMs6LvaXg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeefjedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddt
    tdejnecuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrsh
    houggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeev
    teegtddvvdfhtdekgefhfeefheetheekkeegfeejudeiudeuleegtdehkeekteenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdr
    shhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeeipd
    hmohguvgepshhmthhpohhuthdprhgtphhtthhopehjrggtohhpohdrmhhonhguihdorhgv
    nhgvshgrshesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhgruhhrvg
    hnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthho
    pehkihgvrhgrnhdrsghinhhghhgrmhdorhgvnhgvshgrshesihguvggrshhonhgsohgrrh
    gurdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgv
    rhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:rEfsZzbQtOL9eawTMUeBONIZpQk-mVQFTgmo41YBadLdVx_JbmSOuw>
    <xmx:rEfsZ1bvGPzZUb9TjDXXoOE_h4Bjami4Po1UIfuIFyPYoK-CbL_1sQ>
    <xmx:rEfsZ_DH03V0CViQ3j30rFjwf5G_Qo8t0NHkd6Eamk4FxqoNdxOlrw>
    <xmx:rEfsZ7ZSq1RKM_DX3KiuQ_QAuGKMmI3AwNFFLur129gFqSJ1IHGcfQ>
    <xmx:rEfsZ6ObH5FEWM6Nvo9bBtpuYF6DkTxgbCmKbPy_yhnpgiwl5JWL96ct>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Apr 2025 16:08:11 -0400 (EDT)
Date: Tue, 1 Apr 2025 22:08:09 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v7 3/5] media: vsp1: wpf: Propagate vsp1_rwpf_init_ctrls()
Message-ID: <20250401200809.GH1240431@ragnatech.se>
References: <20250401-v4h-iif-v7-0-cc547c0bddd5@ideasonboard.com>
 <20250401-v4h-iif-v7-3-cc547c0bddd5@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250401-v4h-iif-v7-3-cc547c0bddd5@ideasonboard.com>

Hi Jacopo,

Thanks for your patch.

On 2025-04-01 16:22:03 +0200, Jacopo Mondi wrote:
> vsp1_wpf.c calls vsp1_rwpf_init_ctrls() to initialize controls that
> are common between RPF and WPF.
> 
> However, the vsp1_wpf.c implementation does not check for the function
> call return value. Fix this by propagating to the caller the return
> value.
> 
> While at it, drop a duplicated error message in wpf_init_controls() as
> the caller already report it.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> 
> ---
> v2->v3:
>   - New patch
> ---
>  drivers/media/platform/renesas/vsp1/vsp1_wpf.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
> index f176750ccd98..da651a882bbb 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
> @@ -133,6 +133,7 @@ static int wpf_init_controls(struct vsp1_rwpf *wpf)
>  {
>  	struct vsp1_device *vsp1 = wpf->entity.vsp1;
>  	unsigned int num_flip_ctrls;
> +	int ret;
>  
>  	spin_lock_init(&wpf->flip.lock);
>  
> @@ -156,7 +157,9 @@ static int wpf_init_controls(struct vsp1_rwpf *wpf)
>  		num_flip_ctrls = 0;
>  	}
>  
> -	vsp1_rwpf_init_ctrls(wpf, num_flip_ctrls);
> +	ret = vsp1_rwpf_init_ctrls(wpf, num_flip_ctrls);
> +	if (ret < 0)
> +		return ret;
>  
>  	if (num_flip_ctrls >= 1) {
>  		wpf->flip.ctrls.vflip =
> @@ -174,11 +177,8 @@ static int wpf_init_controls(struct vsp1_rwpf *wpf)
>  		v4l2_ctrl_cluster(3, &wpf->flip.ctrls.vflip);
>  	}
>  
> -	if (wpf->ctrls.error) {
> -		dev_err(vsp1->dev, "wpf%u: failed to initialize controls\n",
> -			wpf->entity.index);
> +	if (wpf->ctrls.error)
>  		return wpf->ctrls.error;
> -	}
>  
>  	return 0;
>  }
> 
> -- 
> 2.48.1
> 

-- 
Kind Regards,
Niklas Söderlund

