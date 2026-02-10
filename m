Return-Path: <linux-media+bounces-52499-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cN1hAN/0imkNPAAAu9opvQ
	(envelope-from <linux-media+bounces-52499-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 10:05:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AAB11882D
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 10:05:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9C05D300C398
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 09:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46E1533F363;
	Tue, 10 Feb 2026 09:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="b4qtXdNs"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0065033EAE7
	for <linux-media@vger.kernel.org>; Tue, 10 Feb 2026 09:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770714320; cv=none; b=cmV4OLVcPZP+d/2XxfZ3HePl2GZACCnZqaRHkoXx1+u4wZ5xWLTQDXX3yNGR1bf/7QPch3CB12gTmnJMnTYMD1ZNw9fC8TaJJtqBnEyi+6p+B/F7WBHZGeZc2sY0Zc81WWRYoOm9IPD8a/zHWuH6LvYmzHzC0us/AV0NqXYop8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770714320; c=relaxed/simple;
	bh=QhkVDbBvh+igrt5Rbw45wDL4NFt0q7ZuczXEzataWDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sVgYAau6M0KfDKDBjr8wOMC9vyC2ozNd0UIt3SyzCjwikh/uF1YdpsR+Y2sMisHnfxvzJJUa5etEQmv1LNGpgRs8FXKJ2IaXsfUK8cT+x8oPd2sv6zhGkvzQDUHm/ruIKtuny5hjZ7/HSAMGyggIKCl1O/NscHsiHgtQhRQ3ywI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=b4qtXdNs; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-482f2599980so6659805e9.0
        for <linux-media@vger.kernel.org>; Tue, 10 Feb 2026 01:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1770714317; x=1771319117; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OP3VbNx68VcllvOx/t4H1bQXdiTg3vSueeogLKpAveY=;
        b=b4qtXdNsl033L/qea7WOLhaMAyAJIgUzqxkboID9Ha9geMuCLOgr4B1r8u2d75vjnN
         hfkzOWSGeQnR7Otpmj+NXVtbWtJYLymAl9JZPfqehnS6S5s7sOtttdMhPEIfaKXXeIOt
         0wbzDHhgGdEvv5bjvAHoovhenjOqR3BT4lXjDYPy1Dgve+ApqeFOdAxELHGpiU86Nkfe
         EyOXXSgRRSNJTzZMWt8h3G4bb9WFSX/mjfbo0r6ldTpwgQp/9eUnjbozMFY43QmmitDk
         dazkwsT+9F06DbyZdFQvo/AKN49q6c8vqnEqyxbKANoeZonCrE/qvzLb36oyrIB4kAAQ
         lBhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770714317; x=1771319117;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OP3VbNx68VcllvOx/t4H1bQXdiTg3vSueeogLKpAveY=;
        b=hVCKnB1NXxIH0tcj7Q7AKUU7i0PH9/EcPYNArSFZtRH63Kg5Ni4WLJwsjFCv8NdovY
         upfdwGBO4tXAy2RjWP733MMutVOKfEomz39U2njiMki3m4ZeSPK0m7GmZaKDoSFLe3nJ
         MvN3rnAjjF03yYmq7eJoKJWuX4hzi6KpXVHeLcN3xCQRmR4Yb6RkMt+FCPDFOW3OmFo9
         6tSpnwnyueAbQbqReqSt00oluicIkKlx1t8S6+h+x7yvUMXJbOzzq3Sv3yD536gb9Ubu
         1/2p2iqRkxmlTFsCO7mjY2M1reM/lr2tSCdxy1nVcSkFmk8c1B0R+5GtwJq/RU/7wmpT
         jhQw==
X-Forwarded-Encrypted: i=1; AJvYcCXxMwcklmJ+zd3ll8XJhCRPrFbUI3BJPryD6gP45c4En+g5i32Dj7dRxOiU3eYzZrjXcHEhzvrltFtOOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJNdum7cI4KcNB9kTAedjdPZqgkkysmn8Ti+rRkyDRnxTjVdtj
	b2OygeBJQa8ESsXf9BC7mmY0FXLRQ9uxEXjaIXawFwZes+owGLH3lLTbNvNsVxQjmgM=
X-Gm-Gg: AZuq6aLS3V4bgcFvr+N+gI5fm8Vw8yeac+ykj0BlAuCDajxriVtxK71IKpaK9nvvZbK
	EyhDDqeLqDh8aXyVq5vlaZpKJWtllFNYrdHaniBzGb/TVNFoQr0/VYC40PJZmFru38aLenYWCBo
	tHmXSJipyCbnIzAqJiL01cEIafW2NDlL0TRJLG5FgD96yFTPmmypAauqxhrMRr/FK/25MFoy0Fh
	CPaoVq8wQOqOOrX3DZYu+v07fmtkxYm8Vx095r9HWUhtqC6OsC6vsxyMHdUErjsVyMuwfTJDlEU
	X4KDuan8yaPNT1yDEBGsJh5dMUXfYZR04tTcK0kYKOVsy/et04u1xe3mH0HA/gXIvF8kBL9ZNo+
	VGD2pRWkHLHth2IfiolRT265qYCrT+/Ahu8nKH7bwYI8+iPsHazTejzmGjR+M+/ZUGLiZhybJDN
	bD54sBoaIZqqjCSCXBIWVDeaa89mCWGqnhw/U=
X-Received: by 2002:a05:600c:674f:b0:471:13dd:bae7 with SMTP id 5b1f17b1804b1-4832022aee5mr181770665e9.30.1770714317119;
        Tue, 10 Feb 2026 01:05:17 -0800 (PST)
Received: from FV6GYCPJ69 ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296bd4desm32761634f8f.18.2026.02.10.01.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 01:05:16 -0800 (PST)
Date: Tue, 10 Feb 2026 10:05:14 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: John Stultz <jstultz@google.com>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	iommu@lists.linux.dev, linux-media@vger.kernel.org, sumit.semwal@linaro.org, 
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, tjmercier@google.com, 
	christian.koenig@amd.com, m.szyprowski@samsung.com, robin.murphy@arm.com, jgg@ziepe.ca, 
	leon@kernel.org, sean.anderson@linux.dev, ptesarik@suse.com, 
	catalin.marinas@arm.com, aneesh.kumar@kernel.org, suzuki.poulose@arm.com, 
	steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com, 
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com, linux-coco@lists.linux.dev
Subject: Re: [PATCH 4/5] dma-buf: heaps: allow heap to specify valid heap
 flags
Message-ID: <hwdezwktndbm6hoko3rz5lffgfljodegcygzf6rbdf2ferokj6@ftk2uk3rqfdq>
References: <20260209153809.250835-1-jiri@resnulli.us>
 <20260209153809.250835-5-jiri@resnulli.us>
 <CANDhNCoHEZsNRmU+3z5AbeAy05H7PTtUdTq1apNd5k0f9hWW8A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANDhNCoHEZsNRmU+3z5AbeAy05H7PTtUdTq1apNd5k0f9hWW8A@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[resnulli-us.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[resnulli.us];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52499-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[resnulli-us.20230601.gappssmtp.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jiri@resnulli.us,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,resnulli-us.20230601.gappssmtp.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 22AAB11882D
X-Rspamd-Action: no action

Mon, Feb 09, 2026 at 09:08:03PM +0100, jstultz@google.com wrote:
>On Mon, Feb 9, 2026 at 7:38 AM Jiri Pirko <jiri@resnulli.us> wrote:
>>
>> From: Jiri Pirko <jiri@nvidia.com>
>>
>> Currently the flags, which are unused, are validated for all heaps.
>> Since the follow-up patch introduces a flag valid for only one of the
>> heaps, allow to specify the valid flags per-heap.
>
>I'm not really in this space anymore, so take my feedback with a grain of salt.
>
>While the heap allocate flags argument is unused, it was intended to
>be used for generic allocation flags that would apply to all or at
>least a wide majority of heaps.
>
>It was definitely not added to allow for per-heap or heap specific
>flags (as this patch tries to utilize it). That was the mess we had
>with ION driver that we were trying to avoid.
>
>The intent of dma-buf heaps is to try to abstract all the different
>device memory constraints so there only needs to be a [usage] ->
>[heap] mapping, and otherwise userland can be generalized so that it
>doesn't need to be re-written to work with different devices/memory
>types.  Adding heap-specific allocation flags prevents that
>generalization.
>
>So instead of adding heap specific flags, the general advice has been
>to add a separate heap name for the flag property.

Right, my original idea was to add a separate heap. Then I spotted the
flags and seemed like a great fit. Was not aware or the history or
original intention. Would be probably good to document it for
future generations.

So instead of flag, I will add heap named something
like "system_cc_decrypted" to implement this.

Thanks!

