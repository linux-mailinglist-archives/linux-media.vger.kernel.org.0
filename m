Return-Path: <linux-media+bounces-52656-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JjGFjLNjWn87AAAu9opvQ
	(envelope-from <linux-media+bounces-52656-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 13:53:06 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B531B12D973
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 13:53:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8FAA6306CC2A
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 12:52:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C50DA35B15D;
	Thu, 12 Feb 2026 12:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="OhvW/jm5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC833570D2
	for <linux-media@vger.kernel.org>; Thu, 12 Feb 2026 12:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770900773; cv=none; b=ZAROU13Y0dPbA0k9JDE6nqs+aKNThaT0Sm3JEBU9tIGVYdrkBZNsM/N4c2KQfvNVX+aatvHwYgIrK+07g282S9NsAr5xYWwQ2zYiDVqZ8ZtBvAZwBjRJjbT9rxcNffdOdx8ErSdgQGXQUzRZ7+YDTMxWk3zwxHCX6vYbLITHSJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770900773; c=relaxed/simple;
	bh=A6eR9jmubTwZTsglZ3EF+v1WhQDWA7ai1B1AUDDvFE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vEbaGyICptnfrFDU3RkSzYqxUzI6erUN4cTHRs4PtHxVCwPoOVh+b1FTgQpynfc9V60gxq+HjwyN385bMocrqnW5Gp8rWIpnzpg2gFjltLNiz3qWEVACmesonnvjW9G1RU05FNHLTJ7NjUah3C0DqWr73VzBOff7XNtVHC7zioE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=OhvW/jm5; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48327b8350dso58692605e9.1
        for <linux-media@vger.kernel.org>; Thu, 12 Feb 2026 04:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1770900768; x=1771505568; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4Kxk/oZj66kgQZma0vQzJuBIOHCjFotulhU3mIzhZds=;
        b=OhvW/jm5pxGnQscWTm9Rw4IKxYfO05uuuQjs3MF36Hao2DaHppuAn38tnMGxnRl5gM
         +oOtVlPgN2bdKnJMG/QZtkf3gT54WtAB8g4xgocPH1Cd9i59BHIkHVKoCCUD/Va1KdOn
         nkqXNh4pkjXVkCrljYvr/tKb8uzwPUA+cFFo0bziNWk/C14P4XUUuJpfqgp7BTQc3/fC
         /YzLbchkLRnLmY2m4A+Dm2u7muKWD6MqtMKvQpBnvdghyzZKivO6TTbFWupzBO9i+UUu
         Dk/gggtamAwCe185ZmqgfPNUT9oBNsukKPd8ahMXFHCnVk0cg6uDoG2g0xSs/RBWmV8x
         4Dsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770900768; x=1771505568;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Kxk/oZj66kgQZma0vQzJuBIOHCjFotulhU3mIzhZds=;
        b=A2rf+3WRQzShK3W9FUNrLwb35YOr4wd1VZWzgKU+xHDfhH2WmZJjl88etpBix2sG3w
         OmHEZ4SKz6Bsc0Nr8S/29AjPyLtHHyp2AGYYP+hI9ZFdxxrQOKupJ8yIuj28slZE/5Yp
         ke2COBEQawmVWP6PdaGrAPOm0UrsjxRvhwg5cpBGb+ybEiOuEOAxNPTs5DGKqqvVAfFt
         ObGViKUSZLU3XZlyhH7UR0wFnFKTa8SaJvmCdj5Tcjr6zYzWdqK3An+GSoJ/tajWSGyp
         8ZND3ujekwUadgtI0RhaHOh3UTPg5IdGUK52qr7HEMkid2KlITXatfoGieoRyvgRVkeJ
         SJvg==
X-Forwarded-Encrypted: i=1; AJvYcCUll458WhAbd6IYbFm4377igzng8fu6IKhCNLcb1st4/xOhxWFR8FL2H7JbQLwLXB+2KfFbV7ProdfBCA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7dF0jeMxQRPu5o0SbgBkxpAF8cjnqzX5EZQCLOZ6//9cr6cxl
	C+EeKHkOcHVDyosG5yOoxZxxAsM5vpcccUVCJz9Cg3/GMpUqxkaeHuVTLGS6Gz/MJlI=
X-Gm-Gg: AZuq6aJO1KfPsVU81BMcZqnWr/XWNMTTp2jq8XGUocUYSVbmUKDtuwrPOjL7p2hG6G1
	jvUdnCy86DmsEuWjC/dFFdOxsupgVZ1DEB97KT/mVJkhFukKPOHq9lXtFsVJlI2OoMsyMH26RGq
	ci+Lx1T/keNDJl8II8pR61AsZ21CoxJKQcVmyBQjKREZGTGqo+nxFBnG94KQyLs54UtnW+SgiSB
	2aeEnXfkb0s3l93jC7BkkNH+GFEk225TxcsD+pAcj66yZeeOnc5iA9U1C5brScVv9fWIuzUEf7s
	Kkqv/kiUWmVzz7sCG/KDjmJ6YacXZ8MD9kKjiAL7gx9zkYThrUBCjJJwrnfZagIyw3b/zggraog
	fuI6mLY+Ng1do2stoB5kvTQDmHppOT4Jky87jlMtyhuDBYfiIx58VDyEYaxDhvQPZ5Zt+P058HN
	fQH26zvHE+jynBLZinRxJHLuNNq4UxkCw=
X-Received: by 2002:a05:600c:348d:b0:475:dd9a:f791 with SMTP id 5b1f17b1804b1-48365716704mr34218785e9.28.1770900768396;
        Thu, 12 Feb 2026 04:52:48 -0800 (PST)
Received: from FV6GYCPJ69 ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835ba7b8d9sm40786535e9.15.2026.02.12.04.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 04:52:47 -0800 (PST)
Date: Thu, 12 Feb 2026 13:52:44 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	iommu@lists.linux.dev, linux-media@vger.kernel.org, sumit.semwal@linaro.org, 
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com, 
	christian.koenig@amd.com, robin.murphy@arm.com, jgg@ziepe.ca, leon@kernel.org, 
	sean.anderson@linux.dev, ptesarik@suse.com, catalin.marinas@arm.com, 
	aneesh.kumar@kernel.org, suzuki.poulose@arm.com, steven.price@arm.com, 
	thomas.lendacky@amd.com, john.allen@amd.com, ashish.kalra@amd.com, 
	suravee.suthikulpanit@amd.com, linux-coco@lists.linux.dev
Subject: Re: [PATCH 1/5] dma-mapping: avoid random addr value print out on
 error path
Message-ID: <magsa5bqxraftni5z7ixrwfojh3htpws7bhiebj4rdtqn4ewce@rnf2rzfelqim>
References: <20260209153809.250835-1-jiri@resnulli.us>
 <CGME20260209153816eucas1p22befaa2c5ef3c6d5e67956eea08424ed@eucas1p2.samsung.com>
 <20260209153809.250835-2-jiri@resnulli.us>
 <621783e8-d77d-4f29-bda0-ef487dd27b5b@samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <621783e8-d77d-4f29-bda0-ef487dd27b5b@samsung.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[resnulli-us.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[resnulli.us];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52656-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,samsung.com:email,resnulli-us.20230601.gappssmtp.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B531B12D973
X-Rspamd-Action: no action

Thu, Feb 12, 2026 at 12:03:49PM +0100, m.szyprowski@samsung.com wrote:
>On 09.02.2026 16:38, Jiri Pirko wrote:
>> From: Jiri Pirko <jiri@nvidia.com>
>>
>> dma_addr is unitialized in dma_direct_map_phys() when swiotlb is forced
>> and DMA_ATTR_MMIO is set which leads to random value print out in
>> warning. Fix that by just returning DMA_MAPPING_ERROR.
>>
>> Fixes: e53d29f957b3 ("dma-mapping: convert dma_direct_*map_page to be phys_addr_t based")
>> Signed-off-by: Jiri Pirko <jiri@nvidia.com>
>
>I will take this patch when v7.0-rc1 is out, as this fix definitely has 
>to be applied regardless of the discussion about the remaining patches.

Makes sense. Thanks!

