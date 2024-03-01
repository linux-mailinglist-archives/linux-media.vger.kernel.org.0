Return-Path: <linux-media+bounces-6229-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2554786E043
	for <lists+linux-media@lfdr.de>; Fri,  1 Mar 2024 12:29:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA14E1F22722
	for <lists+linux-media@lfdr.de>; Fri,  1 Mar 2024 11:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 518C26CDA5;
	Fri,  1 Mar 2024 11:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F9pGdZbc"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B0E6BFDD
	for <linux-media@vger.kernel.org>; Fri,  1 Mar 2024 11:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709292588; cv=none; b=m5Leu9J5se1Ln0fjoRN8pdb+xni19KeAhDz+BP8fZIBxoge6kZqHLS08AzbQh398RdJRjnOt4TQgiQCRsNxpUhb2h3FHFpvZbBitaJftVW1x3AzA7TGPG1XOj2BWfDC7MvQ6C9AgXukqCagbwRKyk0Z1EdCPTN1KOt6ZXj51Hm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709292588; c=relaxed/simple;
	bh=zog0qIVMaTlG1ASknli4b3SB8p1aLaDCqtbud0WxAu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fu4uXeZ0eexAOVYa9ccN7bwO0wqChHbbZPC88PpwSiNqeEBCAF1cw4MSwkqbdwi+AjP+z5O8i1yBT6aNLO7VSrEHycXqhkue0a44Mj06z31vuGXPLPfr/rlwljKOvyT0eQFkCNEhox0sA/crLHApwYT7bn47t2Y2et/zbk3st4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F9pGdZbc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709292586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qRUqDJ3Iv/k5nE0Cga6hqzTdj9gEhtnN2QTBMasCuKc=;
	b=F9pGdZbcEzpk40Ls1JSsenOgFOvaouCHNc/b1trORFyX7Dq7fonr2Nff8u9x0ZoFkeLj1d
	QoVVBc6/JRqybXGnpaBkYPJPvertPwv2lJ3iCnrWqfWxTncuTSCJa5I9ewxoqYVXxPRz2O
	ft3An8HMqP3zlsLD9b2v75Txn+IDUxU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-88-yYJ7itjcN5m73pQb6K9a8g-1; Fri, 01 Mar 2024 06:29:45 -0500
X-MC-Unique: yYJ7itjcN5m73pQb6K9a8g-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-412add7c18fso9528015e9.2
        for <linux-media@vger.kernel.org>; Fri, 01 Mar 2024 03:29:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709292584; x=1709897384;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qRUqDJ3Iv/k5nE0Cga6hqzTdj9gEhtnN2QTBMasCuKc=;
        b=USicpD7G9vDVgA7hGA9rN3xO6XMTFXFUoKFwi8H2lz4BzGyb6mpjfCykzTpUqSqiO2
         nOC1xZY4s8Nb97Qsa+ocN2skXUp/bXJiRlbUTzYNbF2jS+GInJPdc92L2jVUpQDBnHek
         PFhF6dXXUdp4MxxZmjUBPe1McgEVS+xiwqhj16ovR66064DnF2BAEmXCr6AcbNYILHM+
         c46+KE0zXplSZjdYn8noGHPklv/Y+Qvky4ougugZ+S+46MClv2TiykzRa+hghvrPxWXI
         nGemwxU8n+KX0roSfiE81NXH6Iygpt8Ui2DQd9B/LSAwR1RmdBG/ppgFEUlSpxyAehPV
         EQsw==
X-Forwarded-Encrypted: i=1; AJvYcCW/yQbDPBvNiFGn566nxPn0qO1cl0lal7fLdHOiteBLFcSJv2pFK4hvlxG2H0S0dM0pfSA3kTYneCA/FUUXl4V4UBm8uLanvUe/icM=
X-Gm-Message-State: AOJu0Yw5hvS0VxDPzmgrIK9S45q3PuhS8h/4vOFIVQ4xNSwshzx28ZFQ
	wzyUlbY2V+mmKzmRfzfd6Q9fw+cGKIoVUCembCqYzOwEodSxDfOKs4KeerKUp12XrjHODsS/Lcx
	V0u0G8E0FnB9nG3UNaZH+71I0AJqn/QnSvFQ7HB2uFEyA4tAKetNMhUKIDenZ
X-Received: by 2002:a05:600c:4fc4:b0:412:c8c9:c844 with SMTP id o4-20020a05600c4fc400b00412c8c9c844mr988468wmq.26.1709292583993;
        Fri, 01 Mar 2024 03:29:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEKqlwQ+JstuXu5h4wbg4ZOpZ/dkea6nQ1ibG6iOdPso+qOIY2FCKYMPY6GH4tsyMvb9w+yJg==
X-Received: by 2002:a05:600c:4fc4:b0:412:c8c9:c844 with SMTP id o4-20020a05600c4fc400b00412c8c9c844mr988453wmq.26.1709292583675;
        Fri, 01 Mar 2024 03:29:43 -0800 (PST)
Received: from toolbox ([2001:9e8:89a0:c500:c65:1f3a:8c08:2a1d])
        by smtp.gmail.com with ESMTPSA id bi19-20020a05600c3d9300b00412ca030252sm1036720wmb.30.2024.03.01.03.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 03:29:43 -0800 (PST)
Date: Fri, 1 Mar 2024 12:29:41 +0100
From: Sebastian Wick <sebastian.wick@redhat.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v7 21/36] drm/connector: hdmi: Add Broadcast RGB property
Message-ID: <20240301112941.GE166694@toolbox>
References: <20240222-kms-hdmi-connector-state-v7-0-8f4af575fce2@kernel.org>
 <20240222-kms-hdmi-connector-state-v7-21-8f4af575fce2@kernel.org>
 <20240229194726.GB166694@toolbox>
 <20240301-light-impressive-grasshopper-adabeb@houat>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240301-light-impressive-grasshopper-adabeb@houat>

On Fri, Mar 01, 2024 at 11:30:56AM +0100, Maxime Ripard wrote:
> On Thu, Feb 29, 2024 at 08:47:26PM +0100, Sebastian Wick wrote:
> > > @@ -1708,6 +1731,39 @@ EXPORT_SYMBOL(drm_connector_attach_dp_subconnector_property);
> > >  /**
> > >   * DOC: HDMI connector properties
> > >   *
> > > + * Broadcast RGB (HDMI specific)
> > > + *      Indicates the Quantization Range (Full vs Limited) used. The color
> > > + *      processing pipeline will be adjusted to match the value of the
> > > + *      property, and the Infoframes will be generated and sent accordingly.
> > > + *
> > > + *      This property is only relevant if the HDMI output format is RGB. If
> > > + *      it's one of the YCbCr variant, it will be ignored and the output will
> > > + *      use a limited quantization range.
> > 
> > Uh, maybe just say that the quantization range is selected automatically
> > in case a YCbCr output format is in use. I'm not sure every YCbCr
> > variant requires limited and even if it does, new formats could change
> > this.
> 
> I documented what i915 is doing:
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/i915/display/intel_hdmi.c#L2143

Sure, this is one valid strategy for the automatic behavior of YCbCr.
Drivers could also always send an InfoFrame to ensure full range where
possible. The point here is that this property shall not affect YCbCr
output formats!

Maybe it's even better to say "driver specific" instead of "automatic".

> Maxime
> 


