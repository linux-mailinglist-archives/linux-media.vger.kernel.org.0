Return-Path: <linux-media+bounces-48139-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 733DFC9E7CE
	for <lists+linux-media@lfdr.de>; Wed, 03 Dec 2025 10:32:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CAE4F4E16E5
	for <lists+linux-media@lfdr.de>; Wed,  3 Dec 2025 09:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 241822D877B;
	Wed,  3 Dec 2025 09:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jToDHBsW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC2D27057D
	for <linux-media@vger.kernel.org>; Wed,  3 Dec 2025 09:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764754323; cv=none; b=Rc0mKb8VZapL/nvDhuTOyGaqxmk8gsEVCYHKFx59y+R/jH8lqv6at3ZE4939f9l+1UYIYIi/xaO8WL7sKq8pi76tClF0434OBgE1fy8LcIYHlFVhSEN77GFsteByto3+p/9i0QW5WqAd3DZrN0IWK6lHRnUr+NZ79gUE5cILpRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764754323; c=relaxed/simple;
	bh=5e7g4c0PjJAe9eCSqXfvz8HVMh8BhNBTz57IxFGzcP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N1RG6gZLkOxaEZGCVg/ZuHgwC4CVB+ij8yHMmd8zrXr8tCaMq2LgMxi0gmDeOhLtpPDib6yBzRNmqWY+3Jd+DTZ8DG5DarZQB5fSMdA5J1aYRJ0Ux8jvJX4YIbpIngYyeyCoTu1vSPGrf6RqgbCieDd7RBLktcmYCH6caZBZeRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jToDHBsW; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-477bf34f5f5so43122305e9.0
        for <linux-media@vger.kernel.org>; Wed, 03 Dec 2025 01:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764754320; x=1765359120; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s4zu1A1ULeKyAXumQsFZvx09+zqt+hUHwzuEBchriwQ=;
        b=jToDHBsWvj/qbLCUmJHQxbjK/UAt5aA/SGoormP1PR/wD9A5ZXbyrCLJ6CX+UlXwF6
         5d4hKvvWMpd12ClS/5Zoa8vZF2UuP5LoVqpM4nx1AdUrX20PlPm/S+zis0RTo1mAPui0
         SsVVnv/FzkMqoqqOpugYhmIsDLVqCvy5mUDdOZ36My0Ti/uOW7693SjUW0oDM/3lp5RQ
         GLYK6mqrcuZzeB9BzKL/km2HYy40xuxBnv61Czc/d7lFBb/Ma8rmuLoK383N2A3qhYax
         hd2rFsJOtNy7LN2BYWpy9fP4b2wmg6MeE2RQ89SDV7e5Qy5WCRhOsc9EZ4HBRFCU8fyD
         AEmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764754320; x=1765359120;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s4zu1A1ULeKyAXumQsFZvx09+zqt+hUHwzuEBchriwQ=;
        b=rOPvRgLD13ZKvi58tbgd+B/m+/QpPyW2Xyx3UCnkmtbtqYAOw36P/hLwvYMwaAlmOB
         LRK7kZh18vQeDjsjBtsDtHbXPNY2sin7JX9jQIIRrDdeMlhI5DKnLdNgCRdpX7tkmtmT
         LnPGf6R38JKfjQZvNtVjlNTKGLJmV65uE2ypTE+eMlQZk64yOg8Zjm5XK/pSNQ/B50zA
         lx6am7bE6RxwLfQxJ+0u+xrEhTNFLPgX3bzfDy1oDn9r0AzNnR+5yjo3/BU/WDPITYoV
         Z5sUp6jBoTlQvQaSRAKTWFOtPyUkofJJfnktFN+UNmNuzehPK8govVPpqFXm+bq8FEVc
         8+4w==
X-Forwarded-Encrypted: i=1; AJvYcCWJtjSA379h0yGSy1Pxj2naX2UHytwBovWpCBK1x6h+hGmcN25G5u7qUr0W3yrOf6BRROjpdNQT0L7RVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTdsX/ucjMx6PZCu2s4DFEQvrCmn7n70bs9Dzj/9tit+vYSay6
	BCHn7q4ZgWz5kpwEt+5NNDA6eYlhO459gIU8ygyH6d3B3BEL/+aB9tCsHOsxSjzKBqs=
X-Gm-Gg: ASbGncthyPbWYfFb/PosXgMQIyxsy2rPW47yM/dqgu+LcTYEEzKtZ2BEeDGeOTuAEMP
	JiLUG8AUPMJcRM2FzlWEd0t9e6SlZJcvj1xb/QGc9z4vhiPEtlx60t4Cj5Pom+4AfV0+PHin7B9
	nyl2aPb/RYE3uLcq0YduDqH8adWbeFvI8pY3bpt+jO3u77oNVrVx7tc9mMNF24pSdk0YcBira2K
	xNzar1hKkd4wnXk/fOwnaDOUtVXYeMF/PiMcLCi2Tp3arbxTeYHEtMxbaixaM9xNm/aKgErriz9
	+rruczNWLYdTBETi5IVKXmbS2j1fDSXmSxI3xZhrAafBXdF345jl09dzSZbcg7beVTFQJF5CoxW
	kiakzXMyR22eOM1KftP7+mbSkCrewGrT1J17BtyarwU7fIgq3n+a2Z7BjfVn5yFwNxACLcmwv5q
	SDEtwIw1fLxDvfrmgo
X-Google-Smtp-Source: AGHT+IEh/ACzRjySiHGMsxc8Cb1MX10KoPt/SdBCGw+RrGZT3rPN9oLM0P057DTi4DsPgYNGMahkCQ==
X-Received: by 2002:a05:600c:3586:b0:477:54cd:2029 with SMTP id 5b1f17b1804b1-4792aedfddfmr18110885e9.4.1764754319825;
        Wed, 03 Dec 2025 01:31:59 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42e1c5d607csm38704337f8f.15.2025.12.03.01.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 01:31:59 -0800 (PST)
Date: Wed, 3 Dec 2025 12:31:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Pavan Kumar Yalagada <pavankumaryalagada@gmail.com>,
	parthiban.veerasooran@microchip.com, christian.gromm@microchip.com,
	laurent.pinchart+renesas@ideasonboard.com,
	hverkuil+cisco@kernel.org, linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v5] staging: most: video: prevent probes during component
 exit
Message-ID: <aTADjJE99n2ju_kJ@stanley.mountain>
References: <20251203083411.7072-1-pavankumaryalagada@gmail.com>
 <2025120308-unlucky-chevron-0071@gregkh>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025120308-unlucky-chevron-0071@gregkh>

On Wed, Dec 03, 2025 at 10:05:17AM +0100, Greg KH wrote:
> On Wed, Dec 03, 2025 at 03:34:11AM -0500, Pavan Kumar Yalagada wrote:
> > When comp_exit() runs, comp_probe_channel() could still add new devices
> > to video_devices, creating a race and potentially leaving the list in
> > an inconsistent state.
> 
> Wait, please step back.  How can this happen?  I would argue that if it
> could happen, then this must be solved at the higher level.  The most
> core should not be allowing this, as you do not want to be forced to
> solve this for each individual driver (hint, the driver core does not
> allow this to happen for normal driver operations for this very reason.)
> 
> You are only solving this for one most driver, not all of them (well,
> there are only two with this codepath...)  Please move back up the stack
> a bit and prevent this from even being an issue at all.  Especially as I
> do not think this really solves the problem, see below:
> 

I had looked at this before and had assumed it's more complicated than
it actually is.  All this stuff comes from configfs so all we need to do
is move the most_deregister_configfs_subsys(&comp) earlier in the
function.

> > This patch prevents new devices from being added while exiting by:
> > 
> > - comp_probe_channel() checks comp_exiting before modifying video_devices.
> > 
> > 	if (comp_exiting) {
> > 		spin_unlock_irq(&list_lock);
> > 		ret = -BUSY;
> > 		goto err_unreg;
> > 	}
> 
> That's great, but what prevents comp_exiting from changing right after
> you check it?

That would have been okay.  In that case it would have been added and then
removed from the list.

But, you're  right.  It's not the right fix.

regards,
dan carpenter

