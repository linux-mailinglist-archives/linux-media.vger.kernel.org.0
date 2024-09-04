Return-Path: <linux-media+bounces-17584-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3BD96BCC1
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 14:45:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BBC02872C0
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 12:45:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D47791D9345;
	Wed,  4 Sep 2024 12:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GW18c91n"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4CE1EBFE4;
	Wed,  4 Sep 2024 12:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725453945; cv=none; b=FDiu+gVHR/HqlMlar9WbKnk5gTEUeMwmXzjm6kbNN+s0wo7OKqg8NyqhLMWHiTU7IYPbeh8YMJBHHt5UPrsksVpKdTAdIlbEL49AdM2oWbixTPQI0rHwYrzkIzvfsAE9+4lT7R+Rm4vV9+qceq620Qn2f0xJogzGJuYL8jKhlm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725453945; c=relaxed/simple;
	bh=zecXoti5ozx8wrxHZvnlSmAH0XIKx082xDSFxKVV9Y4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iBHWBEyYadNBnf+0IE/ik2ZQVxEEdY1rJyEVeQzzoUtQqeA627yVMWKx1dSBLaKLCCddNjTaAAo+nhodpOI+aUjoyLQBHhfWh/r1jtUoIBLA4Q8z2+o+0kO3Dw1Q7AALQrlyqs6WEL1uF6FznRxrte0IEqtCWldG9rvAEms8ePk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GW18c91n; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2f3f25a1713so78336881fa.2;
        Wed, 04 Sep 2024 05:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725453942; x=1726058742; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Tawvlkn51YSgu6BWUSzYSB+wnnr576T+LPuEkCbb3D4=;
        b=GW18c91nM7A9S/V3etH/IxZ/sHOUvXaiZMakQaV/Bav2CU+dD6XnD24IP57EsUQpcP
         UaKbAZLOfh8KDheeSgklbkkqhOwMJkKY2QsF8sVn+lEYfcdscARSwdut0ks7lFi1pXnK
         bXffxXB8dqTD6EyVoyqAmBFa9U//bhNTWW1gk0oX49ADIjiwlcQq7USIKPZP+5fGgr0b
         /iLm9jlrBPv3QvI+pWA5l94eghi8Dr4p6Yf+jsBQpmujH9tmUSktOBNcjufplzcYnVk5
         WyEL0dRIR6XGymQtVn52ya88WlhmoNDm/MlEWWc4UDa9PioUu3S1vDuz8GwtFaR26ebd
         deTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725453942; x=1726058742;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tawvlkn51YSgu6BWUSzYSB+wnnr576T+LPuEkCbb3D4=;
        b=BQw0CFj6tf/tUAGs9LPxNMg8kEsDjR7HNjPZFPuVQ1fMgLzZseiWj4f9r/d6fDD7T3
         lAkw5kBzqPa3k7Q4yNjrP66uyQ1k2SVNYJb4am+3ny8xpxsiuh8lr1xUQJ29jsNEcKQt
         SnT4Bq1w/AVaFiKl3z2D/DdgsKOKdrC0zexAmBCRqGa7V95VpI21R+f4QZByN9dkoFCt
         OwCRSI7YKwjoYRuGJ8igmzHjHEJVWbK96GiQvJMBXQh6vz+IhTr8pbLyLx9jPuISKnzP
         LhhIM4piaf9u9jZ1kd69QtqRuX4zZgWAEIB06MFd0eLxh6p6yewF5UsRr341GGbhPsdZ
         ykTg==
X-Forwarded-Encrypted: i=1; AJvYcCU0GERHWa8r9OlO0Wo+xGKRY5DvsiI1xrUAOr1if/77l8adAKEjDy4MnmYZwGGD1fNjUaAdXArX76GnrXE=@vger.kernel.org, AJvYcCU4YHFB/PNldyWMI94iXISigd1WYqX2vejIEgW3Vr0GqXNMFW1M4Oyzt+sSDxTjmijXQGw8EeYtJWRl@vger.kernel.org, AJvYcCVs1lE1oxWt7yn8o0nv/w3JJKZz3OtKT+bT4ciOgTSxvzoUm2l/c49SvlvzeBk6xSL6bAq9bRxxDmitRaRC9iJUiDA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy76L0YuNGTlEj5sX+i/ODJ9gsQL0V+NaiwnDDJOJvrCKCA+nvd
	1lM99XGYCVYhwE+ge2kDdDiUY4mzUlWaRU8kIKti90wWBJ+ELgsWxdTjlQ==
X-Google-Smtp-Source: AGHT+IEChMDIBYtnYGb4yZMQbRj5JHN3uh54LgKNkdfJgX5I/rB1mv7tkjxlRjaLR4N8Q8l3EAXaMw==
X-Received: by 2002:a05:6512:1396:b0:52c:dbe7:cfd5 with SMTP id 2adb3069b0e04-53546b40f5emr10743790e87.32.1725453940762;
        Wed, 04 Sep 2024 05:45:40 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (net-188-217-48-58.cust.vodafonedsl.it. [188.217.48.58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8989215caasm802528366b.189.2024.09.04.05.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 05:45:40 -0700 (PDT)
Date: Wed, 4 Sep 2024 14:45:38 +0200
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: Julien Massot <julien.massot@collabora.com>
Cc: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: staging: max96712: Add support for MAX96724
Message-ID: <ZthWcqC+1KAMm3TR@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <20240827131841.629920-1-niklas.soderlund+renesas@ragnatech.se>
 <20240827131841.629920-3-niklas.soderlund+renesas@ragnatech.se>
 <Zs3az1G/e5y5lkf1@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <dd566af6-9632-4768-b945-ec25db93814b@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd566af6-9632-4768-b945-ec25db93814b@collabora.com>

On Wed, Aug 28, 2024 at 12:02:24PM +0200, Julien Massot wrote:

Hi Julien,

> Hi Tommaso,
> 
> On 8/27/24 3:55 PM, Tommaso Merciai wrote:
> > Hi Niklas,
> > Thanks for your work.
> > 
> > Hi Julien,
> > I think we can adopt a similar approach for the max96716 deserializer using your work
> > on max96714 driver. What do you think?
> > 
> > Thanks in advance.
> 
> 
> I don't think that supporting MAX96716 and MAX96714 in the same driver is
> the best option
> 
> MAX96714 is a very simple device with one input one output one video pipe.
> 
> While the MAX96716 is a two inputs/outputs with four different pipes.
> 
> IMHO we should have one driver for the 1 port GMSL2 devices, another driver
> for the dual deserializers which will introduce more complex routing, and
> another one for the quad deserializers since the register layout is too much
> different.
> 
> But that's only my opinion let's see when we will implement the dual
> deserializer support.
> 
> We can of course share some functions for those drivers like GPIO handling
> or pattern generation.

Understood. Thanks for sharing your idea. :)

Thanks & Regards,
Tommaso

> 
> Regards,
> Julien
> 
> 

