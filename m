Return-Path: <linux-media+bounces-58846-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPZuLqJE4GmveAAAu9opvQ
	(envelope-from <linux-media+bounces-58846-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 04:08:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FACF409A62
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 04:08:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56EE430CDD7E
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 02:07:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E0662356C6;
	Thu, 16 Apr 2026 02:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Un0F9wGj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2100118AE2
	for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 02:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776305277; cv=none; b=Iq0DQMb9F4lTmadTh+yRZIH2m5n8Cp6n2+zZ/1iG34mw1KN7vaQTj1Pwks26rmTJ1P3xlcjqPErLWfXvhVG9dCeL7dqWDOnQm1Wqy6Y2280Mspj47veatS27/dRvpF0cfj2wAKbHVPnG17uBaZ+jmlCySArqs6pn9e7QRoIjIPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776305277; c=relaxed/simple;
	bh=kLV2gmEqZTbzpg/+kgChtK1IvtfTklo7fcABvu5X1mM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o6FV+Di5T2CAg85szBlnJBwRyGu83rFxcQkdwFuloit5h9C4J42XiZsXDzsXLJV2SDai+6+N/NX8VhBiVqF0pPFUldl0+oRFblYwSLTBafkp2GrkJ1A2R6eBJJtKOid4R8iZKl0VIif/Jt7FIPgGK2uI/GKvDQIznD27oka05MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Un0F9wGj; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8d67a483d3eso807742085a.1
        for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 19:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776305275; x=1776910075; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4chQeqQ2PHe+PX11zkrN7TC+Z5lJzf/WQwlK8ZX4R80=;
        b=Un0F9wGjcnlPDmMZr1spggHsArtKec+N3JL8mn1ssQzV+pzPtC3PRH9GAMx4VEGBKo
         Fq3/Gs4E2xEEk3Xgvwa7BvKH9aR9OUSP/FWLfmYzKhP8vIkWwEnylg0xXw2vW9q6YkKg
         pmSlm3h2rwGnZO2b428RZv3XXjpD7Lg9qFIwkN1FdM0nWpqQpnAB6eSRHkceSD6wTfZZ
         eRNpO+cPQzliBGoVcqtwjeZQoSOz9Xa3GdJd/llmj/C7va5ci0ityke91t3fZg8mpI+Y
         brI99b4ypgeJCltm0Q+bpJmQ3mQftWkO40a7CqH8OSVC4BZw/o/nI+ERGAbkL1g0fM4n
         HsFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776305275; x=1776910075;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4chQeqQ2PHe+PX11zkrN7TC+Z5lJzf/WQwlK8ZX4R80=;
        b=Q0Tjt+bVUhpyeC/le8lTkEga6X8ZS/Mr5XsXTlIYeGzI6xPu+aO754I7nTPiXbMDeL
         g2aOemBYk/hjdM6pLtM3p0aQr/3a2/u7ZpPQ4Fiz0D7tdjMALnSPyuI7QydGROZbMMcF
         8MosrBiGMZTIkPldFjlhMYBsR4qTLBqXVkj632sIJfSTCJewBuf3wuMi158odoYf3pCb
         WeJZjrXGi1HKcv1X1k7dtVXrcR8kxsGnFoPD8J0Ck2eZy4xYDuuWcTOW6H4Ie0+wkrnt
         wrOHvbBheAAu1MaAhkYbW9TutR2EG9EOeBfFjk4n7BSDQ4SRTE9hyL00AJNEzRFsDTfA
         am2g==
X-Forwarded-Encrypted: i=1; AFNElJ+hCU3CD0xZvLygb6pJYztEyZ2tB2SUfC5aNx5K+z0TDz3zxbi1ZOCGg0ejcheBV1iNk3dWy3Td18w+UQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsdYFPwafK7nV5a4n6rFEmavnTZhqqVkEOdbOOMDmHfLU/P10C
	jq8Z0k+3WoyF+uNpSFppPyJpgIGN2VJ90wteL/NBMSvca5qDNusH+AMz
X-Gm-Gg: AeBDievdFYazjDwQQK42UcTDAJsXn88GOZBXqPa11wvUHDuQAQChae67ANdUX4E9UE7
	t9LWeSRVsS37ujcCpfdc60JbCMuMyM4xya0ZB8HsQCdY6dhdaYqIg5tRCxGMfEdfPS3QsSqT9E7
	DcveHYDGOVEYVqmn8H/91WPKzZU7Uj6VAFx66j0ZeBesMyMVKwFBx/4Rnh4ms7WjniXRjFm6Si4
	AXGWVS8lBjOnLWbW7wF2pYFmoTlvCDmP857NcPMm2SCmrIX7U2XxOnXmG5THCtWVmUJ+OguIr5F
	9J+M0deifTl6c10Ev7a7SLh2L/Na4/BsZ0/CbCdbFjfHPmG5JUL6nEUsKL2nV9xICzdYaGv4rN9
	CWHKCG7jBoO+jGLn6LLHAv7m1bGX+AYmpuzjCVJ1sgreN8A09gwVFimCbu0ClLguvwZ+sYTZzlq
	Adb/zrXtCu/Ak9TU2qAZdLUcN2gZOn5kT7Cwcw
X-Received: by 2002:a05:620a:2995:b0:8cf:d5f3:9a1a with SMTP id af79cd13be357-8ddcfca7aa9mr3612178885a.51.1776305275080;
        Wed, 15 Apr 2026 19:07:55 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8e4ef33af5dsm260449785a.16.2026.04.15.19.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 19:07:54 -0700 (PDT)
Date: Wed, 15 Apr 2026 22:08:35 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: imx355: Add support for 24 MHz external clock
Message-ID: <aeBEo3TCCquUCD9J@rdacayan>
References: <20260414-imx355-24mhz-v1-1-9ae77bc6e7ec@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414-imx355-24mhz-v1-1-9ae77bc6e7ec@ixit.cz>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58846-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN_FAIL(0.00)[10.253.234.172.asn.rspamd.com:server fail];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ixit.cz:email]
X-Rspamd-Queue-Id: 6FACF409A62
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 14, 2026 at 12:12:10PM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The IMX355 sensor supports multiple external clock frequencies,
> including 19.2 MHz and 24 MHz. The driver currently supports only
> fixed 19.2 MHz input clock.
> 
> Refactor the clock handling to make the PLL configuration dependent
> on the external clock frequency and add support for 24 MHz. Introduce
> a table of clock parameter sets and program the corresponding EXTCLK
> frequency and PLL multipliers to maintain consistent internal VCO
> frequencies across supported inputs.
> 
> The PLL settings are adjusted so that:
>   - VT VCO remains at 1152 MHz
>   - OP VCO remains at 720 MHz
> 
> This preserves existing timing characteristics while allowing systems
> using a 24 MHz clock to operate correctly.
> 
> No functional change for existing 19.2 MHz users.
> 
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

We are in an open merge window for v7.1-rc1 and there don't seem to be
reviews currently, but I tested this revision on v6.19.10.

Tested-by: Richard Acayan <mailingradian@gmail.com> # Pixel 3a

