Return-Path: <linux-media+bounces-57710-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDFCAMNky2kUHQYAu9opvQ
	(envelope-from <linux-media+bounces-57710-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 08:08:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 360D7364607
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 08:07:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6BB21300C010
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 06:07:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E88353815D1;
	Tue, 31 Mar 2026 06:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XTpbwjrP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F55837FF41
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 06:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774937270; cv=none; b=Jj+GzcA9d/Y7E7aQs55cJ21BthRp7GNbt45qz65KKKxC4kvMcK2pG4yUESfsY74TwBYdMfWG061o8FITavZ1vChfrl/yIk7n/TB9rNYEf1F8VxtH4unw/ixn90SwmafgaTYWv//H5/bIGsJlazAuhsurl/Em7AJCLFsH8+i+oXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774937270; c=relaxed/simple;
	bh=Hgx5rEYeNiY7pIGRFAxlP2yioN/2yAlf4o4kAGqeuC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jNLiifpk1Rcswe9FPlSVp8afHwXyJYuP6lAJdgqhfboCT7aHiaZ+rlVduF315GwzycA7WbEcOBkNNsm1b9nrFct/sDDVkjBuXFmrBNf6rO3T03WigK+veX6k03mtPFjo5n9MFWeVehatnnAJ1F43H1681QhtcROCCih0z0lV/MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XTpbwjrP; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4887f49ec5aso1111825e9.1
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 23:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774937266; x=1775542066; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FfZlPXiNzbz0xvep3ZCo3J42gvY8JrXf+H7DC+g2RZo=;
        b=XTpbwjrP1k9CAf2h2aY3U6HcY/vyzhMUlztEV9KVPxF6B7IV9Ybi6Gi9G+bSa4YBfJ
         A/Y10l+R9L6FINIjUp9gKYBsQUY/QT8U8OAucuiZsY2BGyuJeIWtiN6yibnxeVHelVXh
         LjftdWEcYnCEWuheQ/9zcrT2OjtYFq848nA6YmRRa2BwseS4c8LHyyUhOCL3xGTDaYGA
         sT4ugeY2/2zLXOa8OXK0zCTFbkeV4WxcrRw4Rbz+5ko5+rUAqE1hlansBi3QDFi50WAZ
         5NtPJwV9i1SwQNhc2ScvcfiRVjxUPQKkynwNfQOunW8v7VyNsRIzvd2Ue4TBq8t65urp
         pUhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774937266; x=1775542066;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FfZlPXiNzbz0xvep3ZCo3J42gvY8JrXf+H7DC+g2RZo=;
        b=FehHwNfqhmSWTbiSrX0acIC9QJlsNDukBL5WZLz5cLMx7zGtMB+NqppHugzKQL4eVx
         aCWtfRfFD5hCoqafWSmpIVNcCafv4ZTsXGAZR7g6St09EPm6aHqu4688Uc9ORrbbdZxJ
         MA72Bd4bRG7zGc8F5SGntbAFacmcjZmc/aHdH3yd5DGHdQU5D1vtB2BXfb3/AVYTvfhn
         HV8yYxGGEjced8xD87BM8SRPtu9uKCQiNYHF6aaI9YbVd8jjF2ia+iQjBTdPLOe/MrsB
         aHMePL9ZeC9fdqabI6fanQw7FWthNUJHuroIeluBOiWRLTN53CK+2ST8wsd0bcF5G5bt
         F8SQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0anHZKjGSQB7hSw7hr65Dn2VIdnvqLTTgrouTeCTMIfi74VvxDGcX4Ims4hBbq8h4uTxNYWcEMhJ5LA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ9DHQDN46Aq1fFIpOv1iVM9pNougklDbJCFrfdz4bP6vtMw4K
	F46ChB1nekTXKRHeI97C6/eqGEOcNPtDQp3JJHrCmC7KCw8Nq3FoBGzg
X-Gm-Gg: ATEYQzxHjFAT41ezE5ox63qo9Mi9JVOC/EoQEByCGPywW6uU3Sb4YDvTiMVBP2LaPlB
	LrKX8S2z21s1bOjSDKitgFAIe0RLDyd9eAG68iskMjN0uV1uWVaqoPIfTBojGqw5tzOdxg9TfxI
	/KJZ+YCbgOSHzz+wD7eOHdJVMG+zv6yB5aQcoZLwZ0v/HRobGpb/QPfFmTyNrQcKMsX7SnSFQoW
	22FJLs9Iyvc4Ogugb04AbobzHkIdT8eO5dfRC24NZ0xRwcks1GdyAW8DjpYL0djLBw28xgrMzPp
	B4W2/rSYSbCyLLrnQHf18qpMXQrZo8/Zsmu3zQshfNc7Irr7EYGamUNlP4jsSpL3e1zJqxXwNAw
	AZVVRFoev+SZu9Jysi0Z7ZqgdXeGua3yCIDeOfTQ7kKvM+zNYZY2H1KgllNmSOuNhrQYqJ6hTd2
	Za3bOK/R34OFuBsgS3A1e+vuKE8bSQ6A==
X-Received: by 2002:a05:600c:a408:b0:486:ff92:63d0 with SMTP id 5b1f17b1804b1-48727d73370mr197462825e9.8.1774937265940;
        Mon, 30 Mar 2026 23:07:45 -0700 (PDT)
Received: from gmail.com ([2a00:f41:1882:1f28:c460:96ff:fea3:6e21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e822227sm11197345e9.4.2026.03.30.23.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 23:07:45 -0700 (PDT)
Date: Tue, 31 Mar 2026 08:07:43 +0200
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: linux-staging@lists.linux.dev, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] media: atomisp: fix potential NULL pointer
 dereference in configure_isp_from_args()
Message-ID: <actj-9_YQqEMO58g@gmail.com>
References: <20260328192721.255493-1-azpijr@gmail.com>
 <20260328192721.255493-2-azpijr@gmail.com>
 <acopy6nyxSb16J8N@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acopy6nyxSb16J8N@stanley.mountain>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57710-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[azpijr@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 360D7364607
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 12:35:30PM +0300, Dan Carpenter wrote:
> On Sat, Mar 28, 2026 at 08:21:37PM +0100, Jose A. Perez de Azpillaga wrote:
> > The function configure_isp_from_args() incorrectly dereferences
> > args->delay_frames[0] to configure cropping without checking if the
> > pointer is valid. However, as noted in a FIXME comment later in the
> > same function, delay_frames can be NULL in certain pipeline
> > configurations.
>
> The comment comes later in the function and it says "FIXME:
> args->delay_frames can be NULL here".  "args->delay_frames" is
> different from "args->delay_frames[0]".  Obviously
> args->delay_frames can't actually be NULL there since we
> dereference it here so the comment is wrong.
>
> If the correct response to the FIXME were just to add a NULL
> check then the original author probably would have done that.
>

yes, I misunderstood the comment. my bad. I read more carefully.

...

regards,
jose a. p-a

