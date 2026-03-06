Return-Path: <linux-media+bounces-54771-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cH9BFZPQqmkKXgEAu9opvQ
	(envelope-from <linux-media+bounces-54771-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 14:03:15 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CA118221476
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 14:03:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9FDD2301AAAF
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 13:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59381392C37;
	Fri,  6 Mar 2026 13:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vYR02sgn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972712E9ED6
	for <linux-media@vger.kernel.org>; Fri,  6 Mar 2026 13:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772802175; cv=none; b=fVOFbMb/KFgIkuYOc0uOX2uxosQIutqqdA4jcuOzxSCNxGujMinsHEnjjTRYwx6WrKBWRUSCnjz7x2OgrZBb43cwPfKnP/SbbAWqL5ARHjyUGqLmKupX4rNnRXNwbfCd5Ml6d3JzKu6t09xbQvHmkUxaw+0CePd1TNzSVivXmuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772802175; c=relaxed/simple;
	bh=iVZ5wZb1aswb1Zi+n2j3lS0Ym4mLi0D4f00SVw5e36U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Owt1fTWV1M0jTCxIOZQ7TSCmD+hP4G0GYQoXBFjN2sOZSBJPmt6Md1y143d2qgN9o+/HOwjl0bHbcGc7GCI3qSeMsbmKJOGHv+u75KcYuNxwsu9nLuYSG8Ljwecq0U1aucJYPvSIL4j0i5ZvAHkcxO8igVPUunOJ0ihqSyxCWAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vYR02sgn; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-439b9b1900bso4118314f8f.1
        for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 05:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772802172; x=1773406972; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gct6C4Eht5wyc/ZmOWSkz/guh8IEwIRge1zzV0cuCzE=;
        b=vYR02sgnbspribaroZ/a4wAhiMWceqNuvTE9NZoiDCy8hM9LnBjtkwk0q65YXgt1k8
         hLwE4PPxbfzA4Nk+povcEMFcfc4up8VZwOJq+V/H26zO1rVWKFQwRe7gh8Hx4iWyfdpw
         RQc1hVxrkOj9L7Dm8gjMqvpifnFO0481hDkF3A0y9huhuw2svAW8Z4/WzIWZYzuWEItC
         7bzKt3Fw/I0RV1QHvINruQ0FuR2Xb3WGpnSfu7n4cUk3YOjGXfs264qokuz0mlHgXyZp
         eM2feOtagIOzUamOzPx0MSUgVQc9Mwu6RMB1MyyKLOPkxHNsDprqusT5ss02AK3ZPedD
         RzEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772802172; x=1773406972;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gct6C4Eht5wyc/ZmOWSkz/guh8IEwIRge1zzV0cuCzE=;
        b=urS2tkfIWSZEzitMmZ+zDUlC0vx8LQwUj+NVjkeqdCqZeipjTr3dERTK1WUTLlY8y0
         wEsc4RWAz3ZO1+0NXjL9bfqXWneLKCarsv+cZBlEX09Ikori/RTZDh4CwHLLbIzeiENO
         SVLR4ZKD0xFC6wMp5XrWNuFUCtH4xFYqjycDso8mCy2VSBU0HvO9sjfhUnL7AIrSKHpI
         yXjq8SRwQd5ccjI1SNX1dcdQIyJEuxbAd5OoFdFnYoksZQcws14BihWwHU75JAOFJV6S
         doqQCnRg5X0YG4J2SPjCM8Mb2aefvdNAMpwUb9ONyvKUiNK4PmtJABAXu/IYPMSjuyF/
         poaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUrvSNam+avVoE2U5OVL4y/BPh6kyPGWq+aDlqeWz+ZQP/2+pGAmXAgu/ao/UubzcsURsqdl3Swk5cZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq4pAgIcfU4QFOHPG9Ikx/UZNbuqXNQyth0Rjr5bZjgwYTKLsO
	YF/JNjyiVWSuDRNczyvocVIzNVvYCT7H5GO+EzljhRExW5cJHRP7oiSsgt5ZHLFZ9rLYJt4tZFP
	BSHf+
X-Gm-Gg: ATEYQzyYp9HtsAAgA7m1J6BVmQO+892/4lIBiqMTaO0+2OChsZwDTQZWErH5wfUkTs1
	evHeBQqEc0m6wpatS8143H43eVzZy8cGEfLiLmnlkmP6FItb7mpw5ah1pyPYeCXSt/ZI2558CLx
	RGLmWD4GhFNLTRPbbigfB8himwuJctTXmVfIEj47nYtWSQAf6jIejmJlJBTIz3gq9Grr0DMgyZa
	WIpghaz9zbZdXBoba1FrRYk9H8L1JEjlVM3JOZWlBqTcqh0XxXQvwTw3FOdMjKGDmOPJV9IfA3J
	RIk1Kz/fLjptTQdMbsRBBYtvYZeQhj/F9LDmQSUjH703gMMkbR7tcTLkx66THKbEN1qLWf65gBd
	dhhXC1BcxnPaC/HRN4qM1++Ke290ybHsa9UjtW5E5DovQJlp6p+1LhONmAR2UeFHbJEGNd2WL8J
	jYno72sy5JHpp2sUEOvbuf4po02b63zWaUPUS0MJA=
X-Received: by 2002:a5d:64e7:0:b0:439:af81:1b21 with SMTP id ffacd0b85a97d-439da118cbamr3302588f8f.0.1772802171875;
        Fri, 06 Mar 2026 05:02:51 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae2b9d8sm3776403f8f.21.2026.03.06.05.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 05:02:51 -0800 (PST)
Date: Fri, 6 Mar 2026 16:02:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Richard Lyu <richard.lyu@suse.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: staging: ipu3: img-mmu: fix sign-to-unsigned
 conversion
Message-ID: <aarQeHfQuq20gXH0@stanley.mountain>
References: <20260306104352.629177-1-richard.lyu@suse.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306104352.629177-1-richard.lyu@suse.com>
X-Rspamd-Queue-Id: CA118221476
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	TAGGED_FROM(0.00)[bounces-54771-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linaro.org:dkim,suse.com:email,stanley.mountain:mid]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 06:43:59PM +0800, Richard Lyu wrote:
> imgu_mmu_unmap() returns size_t (unsigned), representing the number of
> bytes successfully unmapped. However, when the alignment check fails,
> it currently returns -EINVAL.
> 
> On 64-bit systems, this negative error code is implicitly converted
> to a very large unsigned value (18446744073709551594),

That happens on a 32bit also, although of course, the number would be
smaller.

> incorrectly
> indicating that memory was unmapped and potentially breaking the
> caller's logic.
> 

All the callers ignore the return value so it doesn't actually affect
anything.  The commit message needs to say this.

> Return 0 when the alignment check fails to correctly indicate that
> no bytes were unmapped while resolving the following
> -Wsign-conversion warning:
> 
> drivers/staging/media/ipu3/ipu3-mmu.c:393:24: warning: unsigned
> conversion from 'int' to 'size_t' {aka 'long unsigned int'} changes
> value from '-22' to '18446744073709551594' [-Wsign-conversion]
>   393 |         return -EINVAL;
> 
> Signed-off-by: Richard Lyu <richard.lyu@suse.com>

Please add a Fixes tag.

Otherwise, the fix looks okay to me.

regards,
dan carpenter


