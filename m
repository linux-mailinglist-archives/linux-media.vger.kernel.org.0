Return-Path: <linux-media+bounces-17934-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D29E970F6A
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 09:16:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16F38282B5B
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 07:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2A401AE861;
	Mon,  9 Sep 2024 07:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="hKclIISG";
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="Ml18fWZl"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DDF2AD00;
	Mon,  9 Sep 2024 07:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725866162; cv=pass; b=qmsDd+khYU+f216aWM5d88ffi+3UGayMlPujYhag460mWiGHVNipIVxgdUjO8YVm3c2iMmWvZVO7bGAi12asVkK2MhZy5hYQrhU8EUBd4OZc/Rvz7SpXKIYRIUIA573OoZWQIFhpNP09sLS0GAeDzedDNvfjTe1PlmUFKvA3bYo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725866162; c=relaxed/simple;
	bh=7G7zBJlExtmydqxCr9mVjW8xZMFrev0MPrda7pC3MxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DHF2vPp3TD/qUBBPhmdmofM4m9AZj3oxNNqZR3XPKFozeZ2aoiF66MephNdIaGe/hUNDzcn4ruUCPNTbuAG0RX3nEhD7SPhkgOoK0nmYkVY7cqtva4DMPla9ujeW2brJXySeTvnX8wwhbnIwCsCT2yFjlFujhFoZpb/AotnBFpA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=hKclIISG; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=Ml18fWZl; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lahtoruutu.iki.fi (Postfix) with ESMTPS id 4X2HvT4zx2z49Q4M;
	Mon,  9 Sep 2024 10:07:01 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1725865621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rB6CLnaMnuoydR8oaepO8QVaIy/l0GNypx3UN3JOWHI=;
	b=hKclIISGar2WyE0TfCCoCZAe7gmrkWrsjg7DHSh/5yhaMPZsXfkn7M4rmphEAjDF8+fzNW
	G5aEgIjpKE9226SHkGH/HFYvPdLCCwvPLzKpN6yJEakrNjgAbcg9e2oHcQgu3WUqEc1Fpm
	ibv40qPgSeReVjkPlozUHx9+6d+Irg9/Je/BLK9K57HqRd1MOdwPpM4XVyCbmFxdqxvgDX
	p2VDkVyVDeGrftyo4lTzbrmZgd73QLL0JuwHGL4axZ9lB6QjGhwaLinaA6dG3rBkw407Sg
	DP1L3tgoZM/MiuCwa3k4ypbX8xQvPf0PxLfBDW6rm3/5O1T027hJIr0vwfipEA==
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4X2HvJ1VfrzySG;
	Mon,  9 Sep 2024 10:06:52 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1725865612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rB6CLnaMnuoydR8oaepO8QVaIy/l0GNypx3UN3JOWHI=;
	b=Ml18fWZlQyQeyvEKf8D3uFwF5LqNDFshOuX4CUm8pxbaspmhnk7H+g4K+28mrlHzbV13je
	plI5X7Lb+Iko2anGDfPdVmTPr6HHaEFk+eqRL1wPXRFPsc1tBqkR7AYHghtVulW3Xh/L1P
	CAo8loImrDngBTmMpxBTAccTfCZgNHY=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1725865612; a=rsa-sha256; cv=none;
	b=PQ9uoecVT25SykmTHog7cP46063bfw3GZlZuq6xAZ0nAJzdiKNU0bfUlJ6YPZurPNahfBk
	yNYmyK1SBn0k/kGFOho+fIiS9VtYpipbazDKQnkVRxpiFDTBAvhndx8V3JeXosM0FpzbSe
	07y/DsAJGs9dgdssnqluljhQFvqRvRA=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1725865612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rB6CLnaMnuoydR8oaepO8QVaIy/l0GNypx3UN3JOWHI=;
	b=G/PpeGwnV6MWp+/48PODiIFYEsbpiDGjhPS12NU+Sp0XJnppj7SMF7Ezn0A/8KeezhVHdw
	nt8dYj0bCy9N09FFPhSkjKkIq/ORLQi6+O8Nh1GJa5EGre/6rZN28VbfFHdEMTy2ZxBE0Q
	jtiMEvAf8hQJGhizwyjYJEbgW9yojfM=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 847B5634C94;
	Mon,  9 Sep 2024 10:06:51 +0300 (EEST)
Date: Mon, 9 Sep 2024 07:06:51 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Sylvain Petinot <sylvain.petinot@foss.st.com>
Cc: benjamin.mugnier@foss.st.com, mchehab@kernel.org, robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: i2c: Add driver for ST VD56G3 camera sensor
Message-ID: <Zt6ei2-orFC4Jq1g@valkosipuli.retiisi.eu>
References: <20240521162950.6987-1-sylvain.petinot@foss.st.com>
 <20240521162950.6987-3-sylvain.petinot@foss.st.com>
 <ZlXEvR3yKe0W8X_q@valkosipuli.retiisi.eu>
 <ecccf332-66e5-43c0-8a48-d49b0aa1e5a9@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ecccf332-66e5-43c0-8a48-d49b0aa1e5a9@foss.st.com>

Hi Sylwain,

Apologies for the delay...

On Mon, Jun 03, 2024 at 11:59:29AM +0200, Sylvain Petinot wrote:
> >> +/*
> >> + * The VD56G3 pixel array is organized as follows:
> >> + *
> >> + * +--------------------------------+
> >> + * |                                | \
> >> + * |   +------------------------+   |  |
> >> + * |   |                        |   |  |
> >> + * |   |                        |   |  |
> >> + * |   |                        |   |  |
> >> + * |   |                        |   |  |
> >> + * |   |                        |   |  |
> >> + * |   |   Default resolution   |   |  | Native height (1364)
> > 
> > What's outside the default resolution? It doesn't appear the driver would
> > allow capturing pixels out side this area.
> 
> Well both native and default resolutions are supported in the
> 'vd56g3_supported_modes' below.
> However this quite exotic resolution (1364 x 1124) isn't well supported
> by csi receivers, ISPs. That's why the default resolution of the driver
> is 1120 x 1360 (multiple of 16).

Ack.

I'd still keep the native resolution as the default and allow configuring
something else if the user space wants to.

The desired resolution really depends on the use case (as well as the ISP).

> >> +		break;
> >> +	case V4L2_CID_EXPOSURE_AUTO:
> >> +		is_auto = (ctrl->val == V4L2_EXPOSURE_AUTO);
> >> +		__v4l2_ctrl_grab(sensor->ae_lock_ctrl, !is_auto);
> >> +		__v4l2_ctrl_grab(sensor->ae_bias_ctrl, !is_auto);
> >> +		break;
> >> +	default:
> >> +		break;
> > 
> > You could omit default here.
> 
> I don't really like switch case without default. For sure I can omit,
> but I prefer making it explicit.

I'm ok with that.

...

> >> +static int vd56g3_power_off(struct vd56g3 *sensor)
> >> +{
> >> +	clk_disable_unprepare(sensor->xclk);
> >> +	gpiod_set_value_cansleep(sensor->reset_gpio, 1);
> >> +	regulator_bulk_disable(ARRAY_SIZE(sensor->supplies), sensor->supplies);
> >> +	return 0;
> > 
> > You can make the return type void.
> > 
> > Do you need two pairs of functions doing the same, or could you call
> > vd56g3_runtime_resume and vd56g3_runtime_suspend from driver's probe and
> > remove functions, too?
> 
> "Well, in fact, I tested both options before submitting V2 (I mean the
> unification of vd56g3_runtime_resume/suspend functions with
> vd56g3_power_on/off).
> 
> The unification option has the advantage of simplifying the code and
> removing two "useless" functions. The only drawback is that I had to
> call v4l2_i2c_subdev_init() earlier in the probe() function, whereas
> it's currently called in vd56g3_subdev_init() (currently at the end of
> the probe()). OK, it's not a big deal, but I find that the resulting
> code is not as well structured/divided (thus readable).
> 
> I'm interested to get your feedback to decide wich option to push for V3.

I'd prefer calling v4l2_i2c_subdev_init() earlier, in order to set the
device context. These are usually among those things that should be done as
early as possible, in order to avoid invalid pointers where much of the
driver code expects something else.

Btw. if you're not in too much hurry (I guess so?), we're just about to
rework the sensor API, to include internal pads and embedded data, for
better sensor configurability. It'll take a while before we're there
though, but when this driver is merged, the existing API must continue to
work.

-- 
Kind regards,

Sakari Ailus

