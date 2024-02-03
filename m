Return-Path: <linux-media+bounces-4632-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D498483FF
	for <lists+linux-media@lfdr.de>; Sat,  3 Feb 2024 06:28:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 929D61F28589
	for <lists+linux-media@lfdr.de>; Sat,  3 Feb 2024 05:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F92E11197;
	Sat,  3 Feb 2024 05:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OVk/Lks/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E72310A23
	for <linux-media@vger.kernel.org>; Sat,  3 Feb 2024 05:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706938123; cv=none; b=U2V4znkIz13I8vKih/jHM92LWgNcZEp0Gt0hhaj5w5caVYfZxHzu9ecgPcZwT8Y1AULrM+v6R1L+iTaK6lmqa1gH3qx5IOCH5czilYZ49NLcid6gXPbVT06+OCadLM8d8oP42jp5YTCYCnYxioJeBG4/KjPJ2IOBhm3mYp249wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706938123; c=relaxed/simple;
	bh=U5QN0vWRFf0kQ+DEOLbYnUFruUl967Y5DsmmsQ/ewNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LjJWRKZ1BuD+y44JI10436XSjzi++RdgMmqn8J73TxHlS3q2wVBS/MB+devY9u5fcZZC2HIUMyPY+C1gBEaTAN1kNB4Y3sUDwtBpkNYpufZ+KLxwLzg/uu1BImcqlk8WpjPtn9q5eGEBALFOA6eXHQPfikkoB6ry1p1zdHKayDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OVk/Lks/; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6e125818649so1514076a34.1
        for <linux-media@vger.kernel.org>; Fri, 02 Feb 2024 21:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706938120; x=1707542920; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3oOaIjIdBp2aZRrIb4AUCZQMAKcT8tWK9cLcXS1P3ik=;
        b=OVk/Lks/KwTp4WRCZbKPVqgTuqNfdwfq6OIxDUKZMkpyWSpLJwyq0ABOTbzeCSf9AO
         b4dGeOOPW82LWXNMn1Z6UpEB/itbftul+1RCtIBXOt4SIyCbARt9Cwdi/uU35SkNCkfm
         SmyWpMcQvbLb1Xg4ylgxIvm5WlTH2q7/ksVnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706938120; x=1707542920;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3oOaIjIdBp2aZRrIb4AUCZQMAKcT8tWK9cLcXS1P3ik=;
        b=vg8w1GZCIyzurkXqGnvvW/xhRm5GNOzZAe4EoIGrSTNsQfkW7vROmUxiwZT7xAcqrE
         WNavRlX4mejuIqBWDFKJ1kS1HIA66D2yuaaFPy9xb5AgVo0h9JV2RcShH7swsNmDSg1i
         KDdTzTxKAuKksi6Ohx5CCIg6mBNHMqn4OfwdPqvhrRpfExziMz6gdlGIYKVfd1ZPrE9x
         0cYO9jES+8i/rS7Pe8kHrMHNo1c/ujPAgt2IpHteTjdB7L4zkIMMdeWs4NTOolHHXZao
         rHmrNV5vA4SnRpSBqyc0vJCl1hVGTZZSb5U/BeFn+FA7eB7r/zxf4KGjMBkXI8e2Pk+i
         x3Tg==
X-Gm-Message-State: AOJu0YyzGSEjdY0CnTYnXBGA8WaPhhS7XMWaXSpGmcfsOeqkjcZc8KzO
	07i5gXI+PTNSx4I2zYBdG1WZ7AsrCYMgCTv8g8iTK3I+lcZ76UWa7GEkujw3Dw==
X-Google-Smtp-Source: AGHT+IF7YNx34lkhk7dfIolkQwt9+KH7vU4nJVrLwAHIuOyKNqzamiSJmlxkFlOH82ztV8/5bpQ+WA==
X-Received: by 2002:a05:6830:1410:b0:6e0:fd9d:69e9 with SMTP id v16-20020a056830141000b006e0fd9d69e9mr4449912otp.1.1706938120422;
        Fri, 02 Feb 2024 21:28:40 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWJxNyj7FJkEkuHq8/4HnrTxK4tVH7zefk6vZrnR39+JuNjverm4VSC3mgfPkSNQ8oUIEt7uoLIE104fQQXshnVAQ8xNjj/a5ffbaylZ/jRdnG3hH/JKik/aDMgMySqzf4W02v16y2jkTm7tnQiNaO0A4Vku0Db9zsKsxPyD1vd8FxtTW8tRTkMJWZXjT7GsE8beUBIwkpiHzZ4anT9fWT2v1O4++wWifDiWIjowXpZ9IhyRkR06k3Lxf+9eVP94IB55gorheGlYIvFZTtwp5gRPGhPEZnXUWK1dpudl0R4gmgxVJC7qfuTo7rKgmgveDHWmK8pwB8+d8te0EHps824X690sw0InctPWVxKvnp8UA83oKI=
Received: from google.com (KD124209171220.ppp-bb.dion.ne.jp. [124.209.171.220])
        by smtp.gmail.com with ESMTPSA id r18-20020aa78452000000b006ddc77dc4fasm2652301pfn.11.2024.02.02.21.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 21:28:39 -0800 (PST)
Date: Sat, 3 Feb 2024 14:28:34 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v7 17/19] media: mc: Check pad flag validity
Message-ID: <20240203052834.GC69174@google.com>
References: <20231002105557.28972-1-sakari.ailus@linux.intel.com>
 <20231002105557.28972-18-sakari.ailus@linux.intel.com>
 <20240201091713.GA69174@google.com>
 <Zbtiucur0Y_gSEQc@kekkonen.localdomain>
 <20240201093313.GB69174@google.com>
 <Zbt645NhD4Gv3t1c@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zbt645NhD4Gv3t1c@kekkonen.localdomain>

On (24/02/01 11:05), Sakari Ailus wrote:
[..]
> > > > >  	if (num_pads >= MEDIA_ENTITY_MAX_PADS)
> > > > >  		return -E2BIG;
> > > > > @@ -210,15 +211,27 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
> > > > >  	media_entity_for_each_pad(entity, iter) {
> > > > >  		iter->entity = entity;
> > > > >  		iter->index = i++;
> > > > > +
> > > > > +		if (hweight32(iter->flags & (MEDIA_PAD_FL_SINK |
> > > > > +					     MEDIA_PAD_FL_SOURCE)) != 1) {
> > > > > +			ret = -EINVAL;
> > > > 
> > > > Can we please have some sort of WARN_ON() or pr_err() here?
> > > > This is a pretty big change.
> > > 
> > > Doing proper input validation is hardly anything unusual, is it?
> > 
> > Well, function requirements change quite significantly, to the point
> > that drivers that worked before won't work after.
> > 
> > > I'm fine with a WARN_ON() though, I'll add that to v8.
> > 
> > Thanks!
> 
> Actually this was a patchset that was merged quite some time ago. I'll
> post separate patch on this.

Ack.

I just debugged a driver that miraculously stopped working, and it
turned out to be because of this media_entity_pads_init() change.
I think I would have benefited from WARN_ON() or pr_err() there.

