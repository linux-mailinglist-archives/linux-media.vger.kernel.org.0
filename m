Return-Path: <linux-media+bounces-58638-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMtkOZul3GmbUwkAu9opvQ
	(envelope-from <linux-media+bounces-58638-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 10:13:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8611D3E8F0E
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 10:13:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F41FF302412D
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 08:05:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DABF3389111;
	Mon, 13 Apr 2026 08:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ineHvU4g"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1676F39891D
	for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 08:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776067512; cv=none; b=kWUxMjIfqIIIBANz3ciKd06SbDPkyK/hCbgzA0Mq7DPmVxQYDCOY6t0k/2rrKYVtfveZyRpLF+Kfj6fg8yQEdZ8dx3JtI/km1aIHVqQM2/8GIR7ux9mdZrCRTIWcqPIo0jvBuivGg9D0EuCsDk8n1pXD8PKviVWoHe7JsQU76Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776067512; c=relaxed/simple;
	bh=cdFk9qYNkWRkyL4yx5fX1+zERqhUHhUkyMOAmjOBvQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CxLCMtvEJPhePYT7I+Igw4GVQ27iv+aFLip1LsCX6TBsJh2NJMtpQyJUZy49Xg5Vf21jfVw1rldNTjy7hrFcIGQMAZpC6Vn4ey62OS5nbRtnYbYSLmPYkk4ScfEin+9ZVz4fHU+ZjAiFLg6kntvZp1Cl1oM+iiOmdF3ayzvekok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ineHvU4g; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso64582275e9.3
        for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 01:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776067509; x=1776672309; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bgVAXUp4ABfEYNGLPdeyADY9E6Zgs1iS/q+7Ud1//rk=;
        b=ineHvU4gXhmxQQ3gBc+nmcpIO6+QMOO4XU64M+LNB2aoviynyOjs4X9qGwxodvu3SJ
         ZWpMb+ff4fA9PvHalRoBsufpQ9wn6gCEGxD+tTcH9Uf5ukkkI0XX0OkH0AN+SS7NDZsy
         SvKvK+Dt5P3FO1XdkXsQSj+k93d/nywDwQOS3GJ/gT9seHkMZsVpRP84z2Y7sgq6evMr
         tktJOwXR9Keutsb0+F8TiFYkVt5GhU4Eq9eD4Xzx2c1x1xrnjtz258yPlpSCwWrLPwQG
         c0Dao5QOMQzccyLg6NsBeQ8FBIpH2R6rVZTXpvQISomxK4wZSyADkNVTy8oIAIQ0o1Ql
         7V6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776067509; x=1776672309;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bgVAXUp4ABfEYNGLPdeyADY9E6Zgs1iS/q+7Ud1//rk=;
        b=a9b9jTUSDfgZdMQL5AEJR6Cl6HtvVxOYfhZCm+OR2DMgBVINGI9tHjPJPby3vKsqI2
         UjleMtv4RlRKlKJA35UCASuTUakAxJdAP/Nq7eBtxDJFKPoGxBTVMNi6p0UXsJn9/H8d
         huUtSm+CXw34rAdnRxZX8cmPdFpbNOkHXB9bKKbDRO3GlvUtoG2xeXYxryKJj+vKdbqh
         CIn30b7W28Dn48c20oylTulxfFGaNtU+MqnqToccLkg/ix3yod5wFc6C7wRBvaJ4t61D
         QTwHZHyxPflwsxbEdMdGkWYZeHXeNvnXQ3GCJG6d6OIdgJJfUF5N3uSWEinEwKpdF8wa
         q8/g==
X-Forwarded-Encrypted: i=1; AFNElJ8Nf0tN91KwgiNz8PjCFCXiEiXJ1cLjPb9AHxr76rRqXs27YCFoFOIVbRlpiO2wQmY+0lGbSruTw3DgJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsC7yaHfGhSZ5m1PornLthW/UcSFMtxxu3Imf5o9DI/bNpXG1y
	gkYlKNHpa78tezzCysQVM1HjY4zWeydTiPt6h0J6lj7Pe21EfgUDnrR1
X-Gm-Gg: AeBDietqUUj0AOUqALNNP0NJLpp5NwJmp8CX+huZoS7AkKkH+NIKnO4ZZdfy0folRJC
	rlpU7Kstox0zhuI8/xo4qIRN8R709nYGCeaOlI3KIV3P4Zxgql/AcL97T6/nMgdFUgNsPVaJtat
	FAI0ZxCQDRuiyDblC4TJAPRGZeJ50HQtSnGgwTjS+B/F5A+1AWJNmIEsm5Sqhp+zTEvEsquEQXj
	NpTA0SqKemsQWTf0L5DcEOW68LUFuHW11hGhHBq3urQC4bJ6yvaGe+gNSZy4ggV0TMpHZBtgjwN
	0UfojEmR7llJzPGuwcUUMOCSHfmldEiPCJZK2qfck/2XeBaI2eo5Dql/IZ1Ia3FFBgJbPTda+UQ
	406f25PL0CFoRh3vHS9WBblG5S9TRIrh3mgga7fU7mfT08+dWB+hkvGL0avBdTwZs7TWoVylSHZ
	eVyXnbZ9wqgJ2RriPW9zIjxCXbZJybsg==
X-Received: by 2002:a05:600c:4f83:b0:488:7ff5:2c67 with SMTP id 5b1f17b1804b1-488d67f0aa2mr148620055e9.12.1776067508380;
        Mon, 13 Apr 2026 01:05:08 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e46713sm31856761f8f.21.2026.04.13.01.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 01:05:07 -0700 (PDT)
Date: Mon, 13 Apr 2026 11:05:04 +0300
From: Dan Carpenter <error27@gmail.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, skomatineni@nvidia.com,
	luca.ceresoli@bootlin.com, mchehab@kernel.org,
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: tegra-video: tegra210: remove redundant NULL
 check in dequeue_buf_done
Message-ID: <adyjsMVQ0QMr5DUe@stanley.mountain>
References: <20260412172416.33052-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260412172416.33052-1-dennylin0707@gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58638-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,nvidia.com,bootlin.com,kernel.org,linuxfoundation.org,vger.kernel.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stanley.mountain:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8611D3E8F0E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Apr 12, 2026 at 05:24:16PM +0000, Hungyu Lin wrote:
> list_first_entry() does not returns NULL when the list is known to be
> non-empty. The NULL check before list_del_init() is therefore
> redundant.
> 
> Remove the unnecessary check.
> 
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---

Thanks!

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter


