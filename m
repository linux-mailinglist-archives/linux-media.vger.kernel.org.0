Return-Path: <linux-media+bounces-54987-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CCrCXMJr2lzMQIAu9opvQ
	(envelope-from <linux-media+bounces-54987-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 18:54:59 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 788EF23E034
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 18:54:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7FD7230DAA12
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2026 17:51:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9164A3019BA;
	Mon,  9 Mar 2026 17:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="C3AsY85n"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1446301471
	for <linux-media@vger.kernel.org>; Mon,  9 Mar 2026 17:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773078690; cv=none; b=SmKpZpz4J05uaLR/o8vCT1NhDTrnYZyJFoE8NBXGp3R3ofDPXPBZEiqzZj8OWCZbta2f4yXdA85nMnXXsDQerI5W/Tj7DmxnfvOvURvNLdn6Soynyf8ILhM4ArjtqKgHaEBXNQt2wlsZi0UOkkBrSO1+JNtSc6CF4R1gIxLywYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773078690; c=relaxed/simple;
	bh=3aAI8WLDhwMQMlGaUhMuyZUWlilFZJY6aa0zFeBAhhw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nmG2azgj1V1SPE9XqA3rrnOeNLXNnYPwJnYz/U0mTIV2qx8WKmx9kNDNmeZYVz3NuoRK9dhc3g+Kvsg7qo+xGWE6bIxXpfCOq0w1YzBLGNTVTxCDxV/XErwLLq5tkX9q6rZH71Jux7MlRqJ5QG+QfO4mWRaF14lJ+T5Drub1x2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=C3AsY85n; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48541edecf9so740255e9.1
        for <linux-media@vger.kernel.org>; Mon, 09 Mar 2026 10:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1773078685; x=1773683485; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ix+vqdOy5SvfTABiwCl1s7T3mrppwl4vO9UcVMmB22w=;
        b=C3AsY85nf6S6UKc3OxwaoV4CeX97ixXUqDbANq12myOVSIMy7STUKEmas0GWL4FwG1
         o0djJ9QBVWYWui4Kf3wMpsCSMxpCl4PCnMpI9fUIhsV3sv52SfVeOrEQNT4BBdfLogph
         H+x0leHRwHdUIX9KZnpi9gsiWqqie+w0q57+y8c8tMuyAbCcqcTT91YVGNY/OL52mqUh
         dRBNMzu1r5cSASiLnmn8cK6W6vy9+n/Mdrokf75ZZSnWdEFB378zowi/ICPs6e6FA9Ns
         xfz8LU3V/bjhwvIjw8g2bqXpgh4Nc4VHJ0sCO0uhqrafrj60FkI1TGjR5uUFVk31HyQd
         SR/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773078685; x=1773683485;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ix+vqdOy5SvfTABiwCl1s7T3mrppwl4vO9UcVMmB22w=;
        b=QJw++Wn6HTk+S/xDBLH9YdHgfkz4ugATz5pCNn2tlpMV5HMZ9B4zsFOmbUgyu8zEoh
         PKu+xmuyRJnSr88PGbAz1sxMIc5G+50w/FmkklJFi7IFYElSsxCksHPoRmkCtgoRhgMZ
         tbpvNZarT7RNS83EkOg1WJwJcHY1+0ngEeBD4NiycqhWnxmlyUPWUOK+5dLrM1j/YLpM
         ZINnb/zZAxExtLmof7jqHUuPtURaL6Ydz23fpZxsF7EzwhAsfWPyzLlIV9V7rmkiEQyd
         CaQBd0ROBLMc29PcjvYnUJ0HMmg0vY3uLUIpGJ3P5bLQNEtrv/67Fr53zM9vnd2hsj0f
         g8gg==
X-Forwarded-Encrypted: i=1; AJvYcCWXe8iQZez4vhHWpKlRpUGOJPX84CVZIJFJhkhOFXacmGu3vRa/NYYWdKr1SDVZXa78Xxa0tt2eNJXxHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdCt2zkgAZu19tNdg99oXgpHBacDhZDzEV2flei3CZH+7WKYwc
	1YxHALF9LOOYJGyc3H0J9P9sc63D7L0bfL/Bi+lC5qBOVlg3tY/JcfQn8sldIy8Bg+E=
X-Gm-Gg: ATEYQzxOf97dv5nr40tmQ6UvFYHtVxg5IFnxIcbVY+AwGgOuA4T0TdWFxjwmKbqohjQ
	HkOCxx+l+RsxAwmF995o3+z3TOKaKl5gNM8sJZf8zU2qqvCRXEXFz4bboyLKkAT7Kpw1du57FkB
	ZVIiAfacVM7AgXjTdOkfu0QUlkko6lSmaqIyVsAY0C7yWhM8zrvbJ/0drZypsrIi1RklK1KHqwn
	a6CtkfcDNAGPriKZStXTcildPGuqqaoViWVlMKoG6AmCqp81FMB3O/kFslxsRfvxuiE9pdne1Cn
	abNfYoYUeIZyD4zOxdppBEF8QKvaIThly9ouXi6ID6jNAvnM1yRwi+I0kucoLqhkYS27y6i8vvF
	YZ/hzc+EinbLKCEVqLuVQh843PJAvpYjYAfcotIzbZA1oJEXeO11kDZnh5YNsD3wObg2We8tB8W
	TfaztYNjmcGkwjmUbHkygY5tbZO4EviNM=
X-Received: by 2002:a05:600c:5250:b0:485:2fe9:3375 with SMTP id 5b1f17b1804b1-4852fe93587mr147475155e9.15.1773078684896;
        Mon, 09 Mar 2026 10:51:24 -0700 (PDT)
Received: from FV6GYCPJ69 ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dadac2a7sm28642353f8f.15.2026.03.09.10.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 10:51:24 -0700 (PDT)
Date: Mon, 9 Mar 2026 18:51:21 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Leon Romanovsky <leon@kernel.org>, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev, linux-media@vger.kernel.org, 
	sumit.semwal@linaro.org, benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, 
	jstultz@google.com, tjmercier@google.com, christian.koenig@amd.com, 
	m.szyprowski@samsung.com, robin.murphy@arm.com, sean.anderson@linux.dev, ptesarik@suse.com, 
	catalin.marinas@arm.com, aneesh.kumar@kernel.org, suzuki.poulose@arm.com, 
	steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com, 
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com, linux-coco@lists.linux.dev
Subject: Re: [PATCH net-next v3 1/2] dma-mapping: introduce
 DMA_ATTR_CC_DECRYPTED for pre-decrypted memory
Message-ID: <phry3e2dtgxzxdqvrnqfuskangp4al64f2auithwme5kwkgepe@7qtftrhgv4l7>
References: <20260305123641.164164-1-jiri@resnulli.us>
 <20260305123641.164164-2-jiri@resnulli.us>
 <20260308101948.GO12611@unreal>
 <20260309131530.GJ1687929@ziepe.ca>
 <20260309140233.GW12611@unreal>
 <20260309151857.GO1687929@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309151857.GO1687929@ziepe.ca>
X-Rspamd-Queue-Id: 788EF23E034
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[resnulli-us.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[resnulli.us];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54987-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[resnulli-us.20230601.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jiri@resnulli.us,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ziepe.ca:email]
X-Rspamd-Action: no action

Mon, Mar 09, 2026 at 04:18:57PM +0100, jgg@ziepe.ca wrote:
>On Mon, Mar 09, 2026 at 04:02:33PM +0200, Leon Romanovsky wrote:
>> On Mon, Mar 09, 2026 at 10:15:30AM -0300, Jason Gunthorpe wrote:
>> > On Sun, Mar 08, 2026 at 12:19:48PM +0200, Leon Romanovsky wrote:
>> > 
>> > > > +/*
>> > > > + * DMA_ATTR_CC_DECRYPTED: Indicates memory that has been explicitly decrypted
>> > > > + * (shared) for confidential computing guests. The caller must have
>> > > > + * called set_memory_decrypted(). A struct page is required.
>> > > > + */
>> > > > +#define DMA_ATTR_CC_DECRYPTED	(1UL << 12)
>> > > 
>> > > While adding the new attribute is fine, I would expect additional checks in
>> > > dma_map_phys() to ensure the attribute cannot be misused. For example,
>> > > WARN_ON(attrs & (DMA_ATTR_CC_DECRYPTED | DMA_ATTR_MMIO)), along with a check
>> > > that we are taking the direct path only.
>> > 
>> > DECRYPYED and MMIO is something that needs to work, VFIO (inside a
>> > TVM) should be using that combination.
>> 
>> So this sentence "A struct page is required" from the comment above is
>> not accurate.
>
>It would be clearer to say "Unless DMA_ATTR_MMIO is provided a struct
>page is required"
>
>We need to audit if that works properly, IIRC it does, but I don't
>remember.. Jiri?

How can you do set_memory_decrypted if you don't have page/folio ?


