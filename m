Return-Path: <linux-media+bounces-58637-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WEqtDzel3GkEUgkAu9opvQ
	(envelope-from <linux-media+bounces-58637-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 10:11:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 903CA3E8E82
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 10:11:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 46408308E433
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 08:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B16B13A5441;
	Mon, 13 Apr 2026 08:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CMmWv0N2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D6F3A4532
	for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 08:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776067409; cv=none; b=H9WRmejRyY3lyzzF+jMhB1Yn1J8FNZ020ODGvdhgHJ69p17afGDpHc2C3SJTvM6/ymLyZzyS/x0FvjWvOCY2Ha+p2onn0cU/hh9Ea1oKtk4CWaPWA3k9YtteVWR0Yf9oQCZzUe/kO+Z46RJ8/5/jlfByT63b65fksZhv4CxHbDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776067409; c=relaxed/simple;
	bh=wAPCziRy3gqwNYDXtdaW7ysNJai/VXJp9vLcAm4gnsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qTT1RbH9iAdtU2cqBtMMZggXvIwkKDEjqiv3q/ASLcRSmSYeYp2zsJjjzvH3FF2NHaLh1BdB4jWISjtE9uzeMnfZVClmM7yWZDOjCRBFIUTLiIQ8rBOzTWKRVSnQcg3XhAaPFZjCSewoa+bvVZm4nXg/cZmFlouLPULt+oeQpSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CMmWv0N2; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488afb0427eso51801015e9.1
        for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 01:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776067406; x=1776672206; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FdslTYfHiFdLBysZXJi70hRjVM/Tx0Yks32sBf4zOMo=;
        b=CMmWv0N2LkqUZ+GdzdOIWJ9f4WUHdMtzWEXZmryjG5sI+1p8RCVHpJrP7Vk2u05CRz
         OR8eHq4KPb6+8apkdcYIXTVT9xul/iMQ0jjzLnfIbcvn+fAWTCLLENgpcBMbY+VB+wjB
         vghwXedtqYtDrEv83f2hZZz6y+TNKlbM1r9Ze+P527Wo/1t2Hyz4ndxPrSZjzQ45eFq/
         4EtsPR4vplEMLqqCxgfK/Ke2R24VcN4neDM16EpwhxL8Z/P7KcXDERnRpiSSzSNuYbMb
         WJLg2V3FMyI2qPDh1UABxr6cuZUc7dnD7Q9MsbGvWhDwo5Mhks17Qpu7bLXvR9lsU0D0
         EvKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776067406; x=1776672206;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FdslTYfHiFdLBysZXJi70hRjVM/Tx0Yks32sBf4zOMo=;
        b=GGDiEpT85llh6eSjmg18g19ShvKypKSwjmH7dar1YJycofu0tQ3hZnYCzGN4Brtsji
         FY8MuiQ4ytbA+8SPqBc73i798mDBF/rzBG/lUFBkJkBcwIRQzVRuoRTT5WaKg03nBDga
         uZ1oBQAjU6TvYwUOxFOq2mANIvg9Qg3mvn5EyF9qbrskscapMigjJ6yIHxIPbwRaQuP/
         MzcnoUONtMakVvs9LWpJsF8HnrcZ0pjIZN8UZEJ2adskXRKHdG3XajaLpssFkbRACPMK
         7oiq5+BmWCPyqoc6UmVadNFlaw4BVUGxRD0hgt7DdGSaZUgQYPwT9RU+09DqT3ARMDZY
         kehQ==
X-Forwarded-Encrypted: i=1; AFNElJ86AX68HKdWByFQxkd2qzHzVbA/H/G+B6BEZY1Vet+LGRA23Taty+OFLZxjBhwlqR7xHp2OB6DO96ZKcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwG5OEGt13AWBmrPH3nD5XPZoEKU3mkUcemE2PePEYG6Te9q/k
	r5u6+Te4neEYc6rRc24LcWy+hynvdKVDq4akZA1NepZzSTVY3H/KA0Jx
X-Gm-Gg: AeBDiesoWbjew6iDkNpaZOeD8jnGnK+ffuX5qDtvsp/Ig1G1ZwGjqsA9NrR2xYsS3ah
	D44CFOOjPM4bwBRUSo9I1bUD7adgMnhj2rIkT8oZ9WE76VedNISVbcDghONgwRYtw/SELa3naBv
	OrQyPz2f/2OidDUh5UEHpl1uT8L3SDrNbnXyEq9SVq4R6jl7VCV30EGTOAbyHbHRafQ6fGlfiSK
	IzOLkTXgQGsQ8u/QfIUuYvUquBCTkxGmM01SyhbnFJw3nFkLHibfLvjIgOXPB8TI2Hc9piW3yym
	cj1Cf+u/AArjifCho7NJlV4EZ14YDZOCgasyV7hdcAOW6H6YDuLcfaTMUKl4RYt2aUksuxoPmuc
	Z5ZfRMD195Rv9fsaeca8m8DyixagQrJHhbUEgKCRhfolWdwhqkjWacgoEB3qyXLeafdRQkX8Z8s
	3sMNXiIHXlFbHwmMSwj/w=
X-Received: by 2002:a05:600c:45ce:b0:488:a8f0:35bd with SMTP id 5b1f17b1804b1-488d67df745mr174646595e9.8.1776067404611;
        Mon, 13 Apr 2026 01:03:24 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5d703c1sm89816805e9.3.2026.04.13.01.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 01:03:23 -0700 (PDT)
Date: Mon, 13 Apr 2026 11:03:20 +0300
From: Dan Carpenter <error27@gmail.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, skomatineni@nvidia.com,
	luca.ceresoli@bootlin.com, mchehab@kernel.org,
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: tegra-video: tegra210: ensure PHY is disabled in
 pg_mode stop path
Message-ID: <adyjSM70HcX5cq9s@stanley.mountain>
References: <20260412163600.29925-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260412163600.29925-1-dennylin0707@gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58637-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,stanley.mountain:mid]
X-Rspamd-Queue-Id: 903CA3E8E82
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Apr 12, 2026 at 04:36:00PM +0000, Hungyu Lin wrote:
> tegra210_csi_port_start_streaming() enables the CSI PHY regardless
> of pg_mode, but tegra210_csi_port_stop_streaming() skips disabling
> the PHY when pg_mode is set due to an early return.
> 
> Remove the early return so that the PHY disable path is always
> executed, ensuring consistent teardown.
> 
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---

The obvious complaint is that this patch needs a Fixes tag.

The early return is suspicious but I don't believe you have tested this
patch.  It would be better to not send untested patches like this,
because there is a risk that the author wrote what they did deliberately.
This code is six years old now, so the original author has probably
moved on to a different project.  It's not necessarily that easy to
review and test the patch.

On the other hand, if someone from Nvidia wants to Ack this patch
then of course we'll merge the v2 of this which has a Fixes tag.
Just wait for someone from Nvidia to respond before resending.

regards,
dan carpenter


