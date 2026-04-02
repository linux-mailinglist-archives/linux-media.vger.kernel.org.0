Return-Path: <linux-media+bounces-57960-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMP+G3trzmnWngYAu9opvQ
	(envelope-from <linux-media+bounces-57960-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 15:13:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E02E83897C0
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 15:13:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99788315AA19
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 13:02:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D8673E275E;
	Thu,  2 Apr 2026 13:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="owh4RlT6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAACB28851C
	for <linux-media@vger.kernel.org>; Thu,  2 Apr 2026 13:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775134858; cv=none; b=BS96sPvIlF7AJix6gvu1TKRyjfQUiq7LlPqAetTXk0CTNAfOm9C+R9NoR4b5BR/NFsdaFRS91Me/aBNf/YTMS29exXajtU+HgRH4JBm5o19iFcNF7OAISEw49UY+Jt1fYRzAk6Mp15P9z12HTYX5LBKosr7gytrGVum4jTI0OHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775134858; c=relaxed/simple;
	bh=P4aQMbaBnnxQLePUnINQzLxACT0pK5SmCXI4vlruYo4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l47lFuQEbbXa2SwpPyLRatpZM1SxJu8Yb7xcQIwqktmufRwD0yf+MunTLMsTYpPl6sFXtDbXDUu+si2HqCjq6syU5VQJHe0sTEOiVeAfRDHVaI0Pcrv/j+8R/BWc0rm9bTKTvHlcM4+U/0xpJh2X8aK9xZ3D6J4N2W8POOJWpKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=owh4RlT6; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-486507134e4so11002665e9.0
        for <linux-media@vger.kernel.org>; Thu, 02 Apr 2026 06:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775134847; x=1775739647; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WBUUN37+QBAzPQbNHxZUZ/UPJ9R3fSHJHiwX6qvjBAA=;
        b=owh4RlT651N0dj+rzq30VAAY7uDxLaCs37qBXB0Tx9MQ2yu/+7AKWlJA1ojW3xvTty
         4S3dOoKcMdnYP07j7I/70tqDdnxNkWhVLQYSYGfZ6XizJYWIVd0L0QSeVUPwtRCjg7a6
         P4IFTwJwt1Vast/6b8XfkqgMyRV83/Z3U/WaPMhYK6AHWSnXlRLcEKq1RlckOwa02SM7
         p7HHPPDRt83oZ+8MHLixGiEkrOLmkqJc3vpOg3yG7XjctZM5HrIx4fqm5Q/6S40fJ41g
         7cjTTT0LcqnSuzemJnDNoXforqzgBslA4BJMw5A+ccZvBkgDjRnoW4HJqqdtvB29VoBM
         aMbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775134847; x=1775739647;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WBUUN37+QBAzPQbNHxZUZ/UPJ9R3fSHJHiwX6qvjBAA=;
        b=Uae7eID1jK74KQ6enOgwY6b1mK77cpccWgleSrofkbhcLnBqhdSZL8x9IY4+YEBwP5
         S0PoB4OQU83BMtj5B+tgrernqLQcpTJEELuzDpaf7aSTVZ57s3+riaOX+D13ho13JS7+
         nUsHUXmlMq/00hYplqKPER7Qw6joVx7CANzyYWnEZfyf/G+7lui3GpAdJs8rahLYnzdg
         l9wqTHcDdROvH0e8mxi64MrVIQ1ZDIEy3OSmBWFS42wIKeRKZrLjtSqVV4ROgdSz7jbK
         GwcTuMVzFlXQwsHdEL95lA310m2hbcP54+L4ZVn3IFGboyn8osnm2qDjZoH6lB7wMIr+
         k/sw==
X-Forwarded-Encrypted: i=1; AJvYcCXvEOkWJO95ejZZ0VpB2VsceMZhVb1OanbpzQdnL08NgjX+R7QOJIwhpD/5VtEeoxE/SAN++w68jBBT3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKPzN/VXsr8CTJUD5HORy8RbuTxWl99qOjRx7rebpXgA8B3l4T
	H+VTKmYaVZovESOp2xsPRgE5RHP5GJ93Ah8zekufdwJH3Cwxh2qtzqq5
X-Gm-Gg: ATEYQzw7AF5sz2L1Vvn/600S36xI+HNAg1202ch1wmFHT4T7MQ90hmUl/hbCkU2zf6b
	xfylNRJ94R8HOAo5XB+jbRC/MI77XtSOsgl8AEovKsNP69ftM7zjuDjbaXqMjI3CG5UwCsa81x1
	HhvxWg77TM4zgPT1r/fsyd35SFZx3jR9rVU7LigApftSvKpC2Me3MQWl6Z4laa9qJ4eF66lDreG
	nYYp/unoifx8Hs2+QnDfuMtiFsPKMTL6HCnVpyenK3dLjZIpw6HamQnxmtlAUxomsG8T0pItHCq
	8H5XzS88qCO2sB6slgsZrh4++OOOdnz+6IPNPZ9+a/hczbEVYUzrA9/+9m1foGDJn1R/JVT0Q8a
	WdNCKiiewgwMTbw9SPOaSVppv7FxK/MKo7vajG4f+527PMYYQkLqJ+WjwLUHKFgw9afqwSQLrBg
	9K1KPYv5wamngVt9qfQ0c=
X-Received: by 2002:a05:600c:8b83:b0:488:90ac:8f71 with SMTP id 5b1f17b1804b1-48890ac91bbmr39369785e9.5.1775134847181;
        Thu, 02 Apr 2026 06:00:47 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a626100sm121462725e9.1.2026.04.02.06.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 06:00:44 -0700 (PDT)
Date: Thu, 2 Apr 2026 16:00:41 +0300
From: Dan Carpenter <error27@gmail.com>
To: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: cedrus: Fix failure to clean up hardware on
 probe failure
Message-ID: <ac5oecJ05oZD25VF@stanley.mountain>
References: <20260401191441.1217646-1-andrej.skvortzov@gmail.com>
 <20260401191441.1217646-2-andrej.skvortzov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401191441.1217646-2-andrej.skvortzov@gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57960-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,sys-base.io,linuxfoundation.org,gmail.com,sholland.org,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,stanley.mountain:mid,sholland.org:email]
X-Rspamd-Queue-Id: E02E83897C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 10:14:41PM +0300, Andrey Skvortsov wrote:
> From: Samuel Holland <samuel@sholland.org>
> 
> From: Samuel Holland <samuel@sholland.org>
> 

git am isn't set up to deal with two From: headers.

> cedrus_hw_remove undoes, that was done by cedrus_hw_probe previously,
> like disabling runtime power management, releasing claimed sram.

The first part of this sentence is missing.

Otherwise, the patch itself looks okay.

regards,
dan carpenter


