Return-Path: <linux-media+bounces-5042-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AACFE851AE2
	for <lists+linux-media@lfdr.de>; Mon, 12 Feb 2024 18:11:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61C7B285E96
	for <lists+linux-media@lfdr.de>; Mon, 12 Feb 2024 17:11:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56DA43E477;
	Mon, 12 Feb 2024 17:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FX3o4Qax"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49203E46D
	for <linux-media@vger.kernel.org>; Mon, 12 Feb 2024 17:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707757591; cv=none; b=VDjNyFzXIuLJF55w8nWOVGKUvVlzYW77pOK3AmrUZrC6mXL1j2DO8k1Sk4agWCABpWKUX7ZoQZtGj/ZRnbkiHO3ZQK7uYChR6Z7JxQZ3QW+2NfQaCl/ZabzdRCNj/84Vbu421Xp9cvCp/VPzE0Ud6XFqbahAJ0WuMC281HVr0aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707757591; c=relaxed/simple;
	bh=mQCO8I7JEXItbf8exQBvxqbuUUK6aca/XiahInLWxqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eZNh2K28++I/659PVoR5mdMyfa+lqPqk9/q3nTAOLTyvQ3SGjTeEOq/vH8kWEoOtcOErshZqu7B16+X3AQnmF6kcdEZ+6nL1/7qiNgezJxGVVDA0j43XQ6WdFu3miwXHECVBtxYhdJe7HVxUjvBZunfvSdjCIUpRAAvxTItnGeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FX3o4Qax; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707757588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3eymUcFdUhoCcBYFo7gSsZUmQAqnxgL1YlUX2Z2tkFY=;
	b=FX3o4Qax0uVhIK6w+j/fGFVg/s6oj/xQaJ8r/+cGnCk2FQ9MxqJwPwev6flMAZexO81BMS
	E4P8WVwj+nRx0J6iN3mkOvkjOZLAM0R3RPmuplb3JSCU3cYetrYfsORKSTpzxquwalER+O
	RY2SaVtgS14QOCaL/vSN1zzGTxKW0gY=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-241-uLbS4ARbOr-3P4vGPmIfPQ-1; Mon, 12 Feb 2024 12:06:25 -0500
X-MC-Unique: uLbS4ARbOr-3P4vGPmIfPQ-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-51173037e87so2471355e87.3
        for <linux-media@vger.kernel.org>; Mon, 12 Feb 2024 09:06:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707757582; x=1708362382;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3eymUcFdUhoCcBYFo7gSsZUmQAqnxgL1YlUX2Z2tkFY=;
        b=jHf6VreyPClSNhnGr6VvjXooUBKIcyNX+8px54CK5Lq0CtjnhElgmeHsBT7XYqXcXo
         kD4lEj8NcLP18Z74yIkkkkD6FESxrYNh3LZ/UT5SxvOEJMp6oxe89nLLepitsJ0Z1IZD
         gA7HNeCV3h4HXGFSr8pCKSIy0n4afASq4MuCd3y7eXU7DuB5eQXmTDnza5Iu+rsUIJU+
         fi3CIbdoMt76AJGGkrYeuzhVpRBgBqybeU+s6FfXDX2b+ccalXOHPvW0vZIoJaYEAHc2
         ymII+u5rerZ9hc2/bLkpZG08deK3uXZzepBadMD8hCbrDpGD3JkCnTeack//swgqQ1R0
         IGhw==
X-Forwarded-Encrypted: i=1; AJvYcCVEG2mVHP9ZONtSDiaVY4osAUOgqeaKgDM8seTbz72s5R756luEjUMTO8Q/ByGbUAKFlYzCJ9/PqC4JDcPEtCc6k102lEzHzSEc4jg=
X-Gm-Message-State: AOJu0YxZHbBMzbQm/2E0jLFAStTx4Uo6qi2PqePZEKutrm10mJ1aXyQ9
	pkr9Q7KKHdjtwJqWRplhSy+Jx62GGg7vc/ogpuomvRsBGLt5+cBrbKOWvbAxYSkaRh/HWwiz722
	fD/avDwJvaKOd4xSNMOsKfhxM09HKb1hjWcSn4SilPe/fnQ3T3ajHgLXLOWPy
X-Received: by 2002:a05:6512:124a:b0:511:6ec8:9b30 with SMTP id fb10-20020a056512124a00b005116ec89b30mr6055842lfb.50.1707757582619;
        Mon, 12 Feb 2024 09:06:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGvDBjKALP1ZmqUpLt6l2lZIIDPssZ4zAUV94qq67shMDrA2wUIprRPNTJdwaMalC0xRGstzA==
X-Received: by 2002:a05:6512:124a:b0:511:6ec8:9b30 with SMTP id fb10-20020a056512124a00b005116ec89b30mr6055757lfb.50.1707757580610;
        Mon, 12 Feb 2024 09:06:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVDbpS/N9Btsj6liWrjb0yF4Ne0JTB7gb7oaub+EmpD+3bUF/+aHFfL3eeQSHDleOFtGcMAeedShtTblBVbTLi/Uzs8ehObiuNGcGbwIkqW6km3Ie29qRhA+zUURPsLIoGHoTWSg4hJRYbSVUsPFXzwjVp1B84hrtW4ZC9Jv8hudbAlqksOis3kEPid5AaB+nCE6Em/f/BtlmaI1D33wL7QtFNOoVSooPaFxOqD9+DrN1R72NrThYp7RPQPG9vgFaxmIC/rcynrvuJVZC0kQC5NTEPHKTi9Qn0l3RbIXl0/fCnCDdiXUJxw8nlUJro9mDFSCx+wDMVzsB+duddcMgdppppl5uL/DttHm7iUAuaz0qkvRK3C39vMGgFJ2pPhgKDTzg64xmT9+zSIIq2ZFkxpA9Tfc8HVn9B91LIk3ra8TNo071WjMAsu91/WNaR9L7sywPXJXIzF8A3y086BVmbaiXOCGhXyxY07obLAm8FZzfW0biMsLvV47IZuPgpNOPT85mDreg6UvKQaQZG4gDvu0Hnr4+BJRy84zQW6ds+BqUrNZ5bTTdRwNRvYi5uRnO/7nnB1NHvhtb2EgyO5oPjVjwmKjHzgKkXj7C6vqeNHozSUURoenVazPGqh87+vfENwn/kG40mogSAtYR9VZPedoT/rft62PYkLfTKNzRqyow==
Received: from toolbox ([2001:9e8:89a4:db00:6e8f:bfe4:6e0:1fe8])
        by smtp.gmail.com with ESMTPSA id w17-20020a05600c475100b00411062c123esm1846050wmo.26.2024.02.12.09.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 09:06:20 -0800 (PST)
Date: Mon, 12 Feb 2024 18:06:18 +0100
From: Sebastian Wick <sebastian.wick@redhat.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Emma Anholt <emma@anholt.net>, Jonathan Corbet <corbet@lwn.net>,
	Sandy Huang <hjc@rock-chips.com>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	Hans Verkuil <hverkuil@xs4all.nl>,
	linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: Re: Re: Re: Re: Re: [PATCH v5 08/44] drm/connector: hdmi: Add
 Broadcast RGB property
Message-ID: <20240212170618.GA1372043@toolbox>
References: <20240115143720.GA160656@toolbox>
 <73peztbeeikb3fg6coxu3punxllgtyrmgco34tnxkojtsjbr3s@26bud3sjbcez>
 <Zb0M_2093UwPXK8y@intel.com>
 <hez2m57ogqx3yyqk45tzdkvxvhrbdepgm244i4m2aty2xhf5b5@acqgvmxhmmvr>
 <Zb0aYAapkxQ2kopt@intel.com>
 <zml6j27skvjmbrfyz7agy5waxajv4p4asbemeexelm3wuv4o7j@xkd2wvnxhbuc>
 <20240209203435.GB996172@toolbox>
 <ahfl6f72lpgpsbnrbgvbsh4db4npr2hh36kua2c6krh544hv5r@dndw4hz2mu2g>
 <Zco-DQaXqae7B1jt@intel.com>
 <yx2t7xltxxgsngdsxamsfq6y7dze3wzegxcqwmsb5yrxen73x6@u3vilqhpci4w>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <yx2t7xltxxgsngdsxamsfq6y7dze3wzegxcqwmsb5yrxen73x6@u3vilqhpci4w>

On Mon, Feb 12, 2024 at 05:53:48PM +0100, Maxime Ripard wrote:
> On Mon, Feb 12, 2024 at 05:49:33PM +0200, Ville Syrj�l� wrote:
> > On Mon, Feb 12, 2024 at 11:01:07AM +0100, Maxime Ripard wrote:
> > > On Fri, Feb 09, 2024 at 09:34:35PM +0100, Sebastian Wick wrote:
> > > > On Mon, Feb 05, 2024 at 10:39:38AM +0100, Maxime Ripard wrote:
> > > > > On Fri, Feb 02, 2024 at 06:37:52PM +0200, Ville Syrj�l� wrote:
> > > > > > On Fri, Feb 02, 2024 at 04:59:30PM +0100, Maxime Ripard wrote:
> > > > > > > On Fri, Feb 02, 2024 at 05:40:47PM +0200, Ville Syrj�l� wrote:
> > > > > > > > On Fri, Feb 02, 2024 at 02:01:39PM +0100, Maxime Ripard wrote:
> > > > > > > > > Hi,
> > > > > > > > > 
> > > > > > > > > On Mon, Jan 15, 2024 at 03:37:20PM +0100, Sebastian Wick wrote:
> > > > > > > > > > > >  /**
> > > > > > > > > > > >   * DOC: HDMI connector properties
> > > > > > > > > > > >   *
> > > > > > > > > > > > + * Broadcast RGB
> > > > > > > > > > > > + *      Indicates the RGB Quantization Range (Full vs Limited) used.
> > > > > > > > > > > > + *      Infoframes will be generated according to that value.
> > > > > > > > > > > > + *
> > > > > > > > > > > > + *      The value of this property can be one of the following:
> > > > > > > > > > > > + *
> > > > > > > > > > > > + *      Automatic:
> > > > > > > > > > > > + *              RGB Range is selected automatically based on the mode
> > > > > > > > > > > > + *              according to the HDMI specifications.
> > > > > > > > > > > > + *
> > > > > > > > > > > > + *      Full:
> > > > > > > > > > > > + *              Full RGB Range is forced.
> > > > > > > > > > > > + *
> > > > > > > > > > > > + *      Limited 16:235:
> > > > > > > > > > > > + *              Limited RGB Range is forced. Unlike the name suggests,
> > > > > > > > > > > > + *              this works for any number of bits-per-component.
> > > > > > > > > > > > + *
> > > > > > > > > > > > + *      Drivers can set up this property by calling
> > > > > > > > > > > > + *      drm_connector_attach_broadcast_rgb_property().
> > > > > > > > > > > > + *
> > > > > > > > > > > 
> > > > > > > > > > > This is a good time to document this in more detail. There might be two
> > > > > > > > > > > different things being affected:
> > > > > > > > > > > 
> > > > > > > > > > > 1. The signalling (InfoFrame/SDP/...)
> > > > > > > > > > > 2. The color pipeline processing
> > > > > > > > > > > 
> > > > > > > > > > > All values of Broadcast RGB always affect the color pipeline processing
> > > > > > > > > > > such that a full-range input to the CRTC is converted to either full- or
> > > > > > > > > > > limited-range, depending on what the monitor is supposed to accept.
> > > > > > > > > > > 
> > > > > > > > > > > When automatic is selected, does that mean that there is no signalling,
> > > > > > > > > > > or that the signalling matches what the monitor is supposed to accept
> > > > > > > > > > > according to the spec? Also, is this really HDMI specific?
> > > > > > > > > > > 
> > > > > > > > > > > When full or limited is selected and the monitor doesn't support the
> > > > > > > > > > > signalling, what happens?
> > > > > > > > > > 
> > > > > > > > > > Forgot to mention: user-space still has no control over RGB vs YCbCr on
> > > > > > > > > > the cable, so is this only affecting RGB? If not, how does it affect
> > > > > > > > > > YCbCr?
> > > > > > > > > 
> > > > > > > > > So I dug a bit into both the i915 and vc4 drivers, and it looks like if
> > > > > > > > > we're using a YCbCr format, i915 will always use a limited range while
> > > > > > > > > vc4 will follow the value of the property.
> > > > > > > > 
> > > > > > > > The property is literally called "Broadcast *RGB*".
> > > > > > > > That should explain why it's only affecting RGB.
> > > > > > > 
> > > > > > > Right. And the limited range option is called "Limited 16:235" despite
> > > > > > > being usable on bpc > 8 bits. Naming errors occurs, and history happens
> > > > > > > to make names inconsistent too, that's fine and not an argument in
> > > > > > > itself.
> > > > > > > 
> > > > > > > > Full range YCbCr is a much rarer beast so we've never bothered
> > > > > > > > to enable it.
> > > > > > > 
> > > > > > > vc4 supports it.
> > > > > > 
> > > > > > Someone implemented it incorrectly then.
> > > > > 
> > > > > Incorrectly according to what documentation / specification? I'm sorry,
> > > > > but I find it super ironic that i915 gets to do its own thing, not
> > > > > document any of it, and when people try to clean things up they get told
> > > > > that we got it all wrong.
> > > > 
> > > > FWIW, this was an i915 property and if another driver uses the same
> > > > property name it must have the same behavior. Yes, it isn't standardized
> > > > and yes, it's not documented (hence this effort here) but it's still on
> > > > vc4 to make the property compatible.
> > > 
> > > How is it not compatible? It's a superset of what i915 provides, but
> > > it's strictly compatible with it.
> > 
> > No it is not.
> 
> The property is compatible with i915 interpretation of it, whether you
> like it or not. And that's what Sebastian was referring to.
> 
> > Eg. what happens if you set the thing to full range for RGB (which you
> > must on many broken monitors), and then the kernel automagically
> > switches to YCbCr (for whatever reason) but the monitor doesn't
> > support full range YCbCr? Answer: you get crap output.
> 
> And that part is just moving goalposts.

But it's really not. The Broadcast RGB property kind of works from a
user space perspective because it's a workaround for broken sinks. If a
sink expects limited range we can force full range. If this however
affects YCbCr modes as well, then this isn't a workaround for broken RGB
range anymore because it now breaks YCbCr.

Sorry, but vc4 just has to change.

And again: let's please stop trying to improve the property.

> 
> Maxime



