Return-Path: <linux-media+bounces-58629-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +HE2N+ua3GkxUAkAu9opvQ
	(envelope-from <linux-media+bounces-58629-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 09:27:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 838A53E8371
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 09:27:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A35B43002332
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 07:27:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 028493932FA;
	Mon, 13 Apr 2026 07:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="odHyLPlB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB053932D1
	for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 07:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776065234; cv=none; b=ORqDnNDogoHYaRA35L8EPyIuxHM5gRzEH18gvSsT+o5QbT6SXpt094MZ57hmFjizlNOYiu97vU2lVCak6A5vKL7i6xr5rmhiQppUeX69fTZ52sCfy/pFIcivRJXUcv94aYfJtzHLumg600Cbq6MtbRr8dCt8em3MyAGFTFVllVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776065234; c=relaxed/simple;
	bh=TMX0GVYUcC/4pa4IA0Xg1yJG8EYpQyDgj0o91746WJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LTlxUKP42mS9WBRtpMog9Dfn3lR4Cr+0oiE4mxFyFqgZ521NW2cVqEPO9L+entsr7KRyFIPD2xz730//mr0yEdO8jUX4c9NfQUAPutjEWOAia321JUU5LchKFQu3uXl+MZdVSCiH/Gy/nrYkXhzRIAr1RfZsGPVZKSZcZCzdm1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=odHyLPlB; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43cfd832155so2688884f8f.1
        for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 00:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776065231; x=1776670031; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vB8fTOutsfZIie2qCEI929IdjXgTwcdUZphinUXaVGs=;
        b=odHyLPlBEcIBHkOx3uUBySRtigfT6eq5C7VXwuAGaxfu78t173EIFl2Z3QocvwqGDA
         i+H3UFgRmGexfz6KhKj+r6Xf4N0Cx3oVnCtY1T0OqDk5foPObshX36kAwtdco/b35PiR
         BJYDgR7Zfz+rZRV6kQYpe/nH+RUa7fgVnUybgys3QOgz+3Q4WOo7mJKM19Kfoh1T2Dxt
         ohHux8bSWp6G+vgkuXE1P/+oqxJnfLsWOu4BcfKdxKKL06Du3t+mkc/+sfyXAOKOFQT/
         RRFImocuKQA4fEgqiVCviIV5rVR8EKNyQLDO8yMRoBLP6qT2UnbgwD4MTHLVYSQk6oL/
         +6tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776065231; x=1776670031;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vB8fTOutsfZIie2qCEI929IdjXgTwcdUZphinUXaVGs=;
        b=Zity5MYvXbT29+wONqaPxouTDT+YqeKmk6VUO+HVo5xO63Tqhr3bQor/zqjIyDek3/
         +xIymS2G7vUxW2z1oH7UbYWY+UQhD7kD/VEY6PiU5TLN85iJL6BHrPM18l3IaHfwoY1N
         tmy2he9F18WSUjCaE+naARiLwz7oo3//Lsn/Uojapq1/b/da8vy/cEUVzxv/fQ5+3Q4k
         O6TNdgwEQ26FjjwjTsKNEPM2CvxPsFR0Ur7/DOee9s11KHwU4jwwPf6JqjNy1M/VbpBB
         Eco11ZfvQqXt+GIetF+FsrGa4eSmGhEArdUYzU0Tg4UZVm7lE2rZbZmcEaGHw6CM6Adu
         ayvQ==
X-Forwarded-Encrypted: i=1; AFNElJ+5dbDitzrJQ8bKqapBnL0HxOG29aCCsdP1Z10Yw6khlS+n3xoZoD8a+bUi3ITd1zOjQYqbSnTEPG697Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyN7ChOY+Sxc7jGyTngixq5E2yAnAA//bk1yhvYnk/zS38at3BH
	6nq8SQxEZek2U2CeoL2/PNpvqjPxx4AYghcfZ1h58ko7S67GraV9Qb6e
X-Gm-Gg: AeBDietSEwoYcgtEIAAKsHVtsJ8uZcO62NjQqdKnEnD+BdOrylUhx0DLl8LYgEGAYy2
	lfhHY/x6/rJieXcfT3zRLEVOo7Y7xmee+eD+SdAsp6wlHPpVVrlSj4uES+pqWJGxQFit/RSXDE4
	+n0UTEynMlFLo4BdhYVEVTpGsn2MuzKpfnUdhCJmFhzo+d28cPQdje5d5RjolcTbav+z2bNi7GK
	6AVfs8mlg1z/SXW8XUTTdBv/7uvgQd9RKHXSOFMwUqmZgvAVaqGXKvz11x7uUdifsHmaEEhr/jM
	ZG8zokyfPm+xRmrowHDzqlSQIQjeE1GSSk485Bv1Gi2txkoHHdgrHi41PQpS12znxHohjVG3yH/
	xvcktbxYqHg2X97hlnhDC6Dw7PzMLjkrcxtCxd6QIyFjhNr0qms+nublLo72W2jxbAq4rVkt6J2
	3ofJoEGxGCwVQ3JXQj9F8=
X-Received: by 2002:a05:6000:1447:b0:43c:fdd9:1890 with SMTP id ffacd0b85a97d-43d642c999dmr16766155f8f.51.1776065231364;
        Mon, 13 Apr 2026 00:27:11 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d7400708dsm12208844f8f.25.2026.04.13.00.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:27:10 -0700 (PDT)
Date: Mon, 13 Apr 2026 10:27:06 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alexandru Hossu <hossu.alexandru@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: media: tegra-video: fix wrong return type
 in tegra_get_format_fourcc_by_idx()
Message-ID: <adyaymJVZV63WzQ3@stanley.mountain>
References: <20260411211006.150782-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260411211006.150782-1-hossu.alexandru@gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58629-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,stanley.mountain:mid]
X-Rspamd-Queue-Id: 838A53E8371
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 11, 2026 at 11:10:04PM +0200, Alexandru Hossu wrote:
> The function is declared to return u32, but returns -EINVAL on the error
> path. Due to implicit conversion, -EINVAL (-22) becomes 0xFFFFFFEA as u32,
> which is an invalid V4L2 pixel format value.
> 
> The caller tegra_channel_enum_format() assigns this garbage value directly
> to f->pixelformat and returns 0 (success) to userspace via VIDIOC_ENUM_FMT,
> giving applications a silently wrong format descriptor instead of an error.
> 
> Fix this by changing the return type to int and propagating the error
> correctly in the caller.
> 
> Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
> ---

Do you think you could analyse this to see if it's a real bug or not.
If it is then give it a Fixes tag.

regards,
dan carpenter


