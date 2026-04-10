Return-Path: <linux-media+bounces-58526-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PgvBbDB2Gk4hwgAu9opvQ
	(envelope-from <linux-media+bounces-58526-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 11:24:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 803753D4AE4
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 11:23:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E0A453019178
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 09:23:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1E51346AD5;
	Fri, 10 Apr 2026 09:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GxUF/3HC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153B633F378
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 09:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775813031; cv=none; b=N3iJaq0hj72I+D9zeRs0dZ7XnHmvIyTToHJ3uVCPXMJ9j8di19gpT1e/6LXUrF8A0I5YC1LKhC1GlHN5MYVN2NZzBx04V1bcrTcF0MWbIAzGdrp1ljiKHnH3UO9BDYjt14iGT9491ctxsI284CqLEPNTkOp8Q9NLoLkpx8Tb35g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775813031; c=relaxed/simple;
	bh=/MvG26F6r8AdWZ/UPLzCsxRajfilKgPD/xEfQajPc14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MXJMxm6iANk124eleO/vaFPvyjQVIk1x0LcWQgPMCPiIcQTtJx/mLa1Hl5JfNASrCLB+N/l48xAmnSozk7TDCs2mq0iNUq05jkcRLZLI1OueD7yoSDgfXxZMapcTNFI0E1VBuECGlNmCoSIjRVEExYb24nHr5gjV3vTSKD/nZCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GxUF/3HC; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso20786205e9.2
        for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 02:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775813028; x=1776417828; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/MvG26F6r8AdWZ/UPLzCsxRajfilKgPD/xEfQajPc14=;
        b=GxUF/3HCwU0HMwlU05X6eEwhRY3OvJi/w8TOn/8Fqvey8drPmVLIyg0nn6bg5KF7ij
         pUL7utyvR6Z+5dpg/7V4fAaW+RF8p6VvLK4hgbRkkU8v+HQQPi0wmqbwPRCvZyVSszz6
         L/tNyOj/A926gnm2wBDgx92ZZJSwi8oncoPOGHBXkfddA4x0n5cGwIyJ9h8nJEDR/dtJ
         pu4Y8WFufQ9bJJvs1b9QSpKNaZHkbDxPUG6C3aQkhZdaGZiLE1uAZM2wJTNZD5U8YJD7
         dlC8TXbNasbbdHwCXsW8RSSwWUx9qQwEd6m36SgFdH94ZjizsjcEFqneSQVIqvYxmk8u
         BvUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775813028; x=1776417828;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/MvG26F6r8AdWZ/UPLzCsxRajfilKgPD/xEfQajPc14=;
        b=UznOCJ8eRO5W+D/1lNrUb2JIh2mQIwPIG2okltP4g7j7GK3nKF3YFpQ1YOWdJ2TY2c
         /4WNejwT4UIxUa7Tog6lrWnuv4WX+j7QVe3Xy4UJ7RU1Qqk1IsJcSQsLqTB0qq0jHcSB
         dN/DzRKVB9c8nqzodxkdq8okikFDjFDVsl12O2StO0dSMoGPViY1ByURe7Ct5j63ikCG
         MB5KlA8bBRa1YCdbKt32xZ6FVyEeES4ZbzRaipD6tC1FgC44Virh4pZwYpPhCR2yitmB
         V48R+GZRiqJiP3r753pP+qCvwfpvVEYGEGWndRVP6/xFW9lnosxFQRTyzPT8/5Q3F2XZ
         tJFg==
X-Forwarded-Encrypted: i=1; AJvYcCW9GTs+Bgx9hv8Lex1Zv2U1sJAUZMRl+PIQbtkTSjnP8jvbhp8vsGqJg5fUVMTJN54EIlqt64m0qzfXvg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+lSgBEC2URV1p/CCE0G7EaXB7hI3QJ+OnzU+tIsCCxwAxoFjF
	BK0DF38JWzj9mCuAmNi3k5tL6OVdaodEh55bLz66+WugM+qu86jxD6H8nMAVrBts
X-Gm-Gg: AeBDietC+pQS959/VTnk5/ZfyML7zLIC5UTGq3/J0q1t2TMni1h/+eQ9PWPgOfUV21B
	CKrT2263frcITjIMFFo/c5CsofghTiMjO1EDGLx8WNg4e43q36+zS6elXOA8hJ6h0hI297xtpfH
	aY4U4ACLT0yFSdGipG2rs+dBhlTK24SqYLPBmQrjO5e2fB0PFR64ctusFwLdoTt13Jl2z+VJgk5
	1/C9IyVAtrXMo5tKMlEwb7rxdcFIMewzUGW5dtOM1dyzhWxz/2AVBhxEYO4FERACkd5B8xhB8V9
	i0qPPmOpgFMlnghxbYSOJ/EGhXRttaUhWY+2XuhsVyVB/WIqycqbRoYRjGtTId6HF6DSoJLhoXd
	DDPP6kbKRF4+TT+o92YRrmvjYdcGULhMaNYZdmiKzIlmFeIWCM4f9ssFmPV0VB/DvaE/e+FuzL6
	kwz5WgnXs3p/RJMQZXXgD82ZteV0P3PA==
X-Received: by 2002:a05:600c:c088:b0:486:fa35:aef2 with SMTP id 5b1f17b1804b1-488d67bf744mr20047265e9.4.1775813028369;
        Fri, 10 Apr 2026 02:23:48 -0700 (PDT)
Received: from gmail.com ([2a00:f41:1c39:1fd5:2a0c:50ff:fe2f:36f4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d592db30sm52202595e9.10.2026.04.10.02.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 02:23:47 -0700 (PDT)
Date: Fri, 10 Apr 2026 11:23:45 +0200
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Mohamed El Harake <mohamedharake2006@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com, 
	andy@kernel.org, gregkh@linuxfoundation.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] media: atomisp: avoid ACPI package count underflow in
 gmin_cfg_get_dsm
Message-ID: <adjBdeW-VJq0gHdM@gmail.com>
References: <20260409214158.3248-1-mohamedharake2006@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409214158.3248-1-mohamedharake2006@gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58526-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 803753D4AE4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 12:41:58AM +0300, Mohamed El Harake wrote:
> From: Mohamad El Harake <mohamedharake2006@gmail.com>
>
> gmin_cfg_get_dsm() iterates over ACPI _DSM package elements as
> key/value pairs using obj->package.count - 1 as the loop bound.
>
> If package.count is 0, the subtraction underflows and may lead
> to out-of-bounds access.
>
> Use i + 1 < obj->package.count instead.

how was this bug tested? and is there any way to reproduce this?

--
regards,
jose a. p-a

