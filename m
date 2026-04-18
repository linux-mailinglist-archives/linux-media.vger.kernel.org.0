Return-Path: <linux-media+bounces-59065-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id /PEYOfVD42k/EAEAu9opvQ
	(envelope-from <linux-media+bounces-59065-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2026 10:42:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8EE420702
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2026 10:42:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A8B35303A6EC
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2026 08:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 980F234B682;
	Sat, 18 Apr 2026 08:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="BpBHFubb"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FBF32FA2B;
	Sat, 18 Apr 2026 08:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776501735; cv=pass; b=kygm/BWk6NuUBqQSOOhhNr6C+zHnITc4U6PlwH4vXACsGTDSmoGO7BS8ISiYv2FMIy2smQgDbAXFwm1wOIMmCzxnYVoaBqQwH8g46rtagi9wgf/Kxa6IMkJK9cAdnpheOjAC6xsxAfNX2VIQ2bF+7AqRSgtYbZTFpgAXieBJu5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776501735; c=relaxed/simple;
	bh=XT4LHOodbEVdMNMf41pDFkp2yufOThRCTFSnqc2FW5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lz7s29A7x6DTJMlxet9TLscgMmUyraOcIMB262G1BblEWwTgvhIaFBQiRd6wO8vobY9lhRt0lDoHOTrMFPp+CaJJDFKNWwZnO3rCQPkjb0tIicdWu2K8tHRXqJ5BX263Fr2J5ICQxUrCxHGjyWJ+DpLMuHyieQAOLaPqUDVlLBQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=BpBHFubb; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4fyQGd5mxwz49Q40;
	Sat, 18 Apr 2026 11:42:01 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1776501722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WNITjOmmYfA4tIPDgTVTfe12CGPO69FIJV4XP81I2V4=;
	b=BpBHFubbgHO2k1JQHNYXt+BxvAjc0886CKgpgT/RfdRJlbKDDpXGbbWhSLcTG09I0UOKvp
	4PqJh9bujM4TeJxS+BMoei3OK6Gg/SQA+KxqV3tqOmqOumufgbJWNHb723/Hi2TOU419Pb
	1LSMyfBukAysi8Kt00eyURP5JrItnmoqz/mEKAXl/snjYTMxlxQ7rklemWgiFP8yfvIz/e
	C5USueIsfZc/4JitJxu3zpS00TF6Koij3cRcXyO1art/rEWiryKOsJ4oRrbCvYC5K03XCK
	EE6ZZT9xgrdv+AVAA/kXY8mu0Y+KM8+yYBD1gL748nJa6s1GbwSCOmb3/7XDrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1776501722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WNITjOmmYfA4tIPDgTVTfe12CGPO69FIJV4XP81I2V4=;
	b=QIMVuoeSb/YkmB7ita/BSPDL88fQbte0F3fxHLVli0fCvMyaQj3CnICJV3ZW/1nF95K+vi
	rIGzWzjhnGRfExBcf2OM8pYtllx6sTW9FibfKVgwifmnCS/PPzElilYW1Iyr3VO4bH0OlB
	FXywQEgGMVPiXq2UbtEJExfdojjWzkHiLdW/swWLM6YoISTIpd2DOBeAWoyqRLYIkCcpob
	ZbF+66cgtc1MRV2HGZAUDHQpjUQ3Gx14gr717oaUcnhTbN/4JA4c6pdhzHllV5sfaZC6Ml
	rSvH2Dp7xAmFindEYjhaa/zAL3kAvvwZqsaYbt+kLlHSY4TnKa7cFK5t/jBYHw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1776501722;
	b=OuD8kzO4LNpCDMX9x93e9g1VbbJtkrf1FDXdqBhcmpUC8XiHYDOVFVOW8AuIZPl0ktF8vJ
	ExlcsKhaL7KLijIo/ZDJrpgL3taUvj3I387fNvXkG9y6TeqGd9YIFOoC+hRU5ew1BVZBGq
	tGrrb8kziuF+f/IabCCdxWggcp6HxDbvM2vMy9K1h6IQStijl4UmnhZlSr8SoESpK3Xk3y
	azxOgP0SErFMqOWJinjM9hX2tAiim64Cp6q/bsccsvQumQJlhEvFrEgs3QJwaACuOKeet1
	V6WJmKCclzZCTbFYbCqPC9JKL7LQzuDBF13UWooCrGcqXvVwkcwLdZCGugldSg==
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id EC429634C4E;
	Sat, 18 Apr 2026 11:42:00 +0300 (EEST)
Date: Sat, 18 Apr 2026 11:42:00 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, hansg@kernel.org,
	mchehab@kernel.org, andy@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: media: atomisp: remove unnecessary braces in
 single statement blocks
Message-ID: <aeND2IjWTS-Qz5kh@valkosipuli.retiisi.eu>
References: <20260310203646.8869-1-rayfraytech@gmail.com>
 <20260311170423.13157-1-rayfraytech@gmail.com>
 <abkJ0TOrtMR4sTjd@kekkonen.localdomain>
 <CAJioSGd=7LoMA2gTNK_6vejtjfFJFwHvnh76Z7EYowq8MVQqQw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJioSGd=7LoMA2gTNK_6vejtjfFJFwHvnh76Z7EYowq8MVQqQw@mail.gmail.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[iki.fi:s=lahtoruutu];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59065-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[iki.fi:+];
	DMARC_NA(0.00)[iki.fi];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@iki.fi,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,iki.fi:dkim,valkosipuli.retiisi.eu:mid]
X-Rspamd-Queue-Id: 4C8EE420702
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 12:50:58PM +0100, Oskar Ray-Frayssinet wrote:
> Hi Sakari,
> 
> On Tue, Mar 17, 2026 at 8:59 AM Sakari Ailus wrote:
> > Did you write this manually or generate it with e.g. Coccinelle?
> 
> I made the changes manually, file by file, using Vim.

I'm afraid this no longer applies to my atomisp branch.

-- 
Sakari Ailus

