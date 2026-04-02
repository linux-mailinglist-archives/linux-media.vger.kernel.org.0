Return-Path: <linux-media+bounces-57905-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EO/iNkXBzWnwggYAu9opvQ
	(envelope-from <linux-media+bounces-57905-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 03:07:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 493A6382275
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 03:07:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9568B305B2AF
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 01:05:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37C9323A564;
	Thu,  2 Apr 2026 01:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E6siG1Eh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B3129B78F
	for <linux-media@vger.kernel.org>; Thu,  2 Apr 2026 01:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775091934; cv=none; b=mRAQgGEt0PRu9wiJfJM3fxXfcct5eOmAkiAMVVtPm0axyNaV2zYePjrFgqdjcbXjDhHVpusx5LDE9yddJbqySWmr0zvEfITmnDdUZ9cO8ZqlzEjDM+0scP2SjYP0mw3C95aibgUQiHIjlemNOcfM+KcMsuGQplWYVF8UwzXLnko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775091934; c=relaxed/simple;
	bh=am/OmExRMs6+4inYpMeuvlbO5iWLZZ1oD5RIyvgeXuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nWqyGy1vZwGrtYRgGIDqdBoDBr0yNkxKjWUlJbooKdOkSr6q+hk2phbMaAQGcRz+rPizvkeHVktlkEGbJ8bShVzcLsPqY8kJj/gDzVhwD9++76gO3eXGYfpV5+KOqUJvEvhuAKRdTGy3IfjgJ5XD9aLOOtWy7owjVXeoVK5A9y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E6siG1Eh; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-50b268fba9aso3112621cf.3
        for <linux-media@vger.kernel.org>; Wed, 01 Apr 2026 18:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775091932; x=1775696732; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l/gHu0FdfX6ZXbcJGvtqN+jQ/yvbzkeHZ4ajTT5rTrk=;
        b=E6siG1EhVTKGOfnj4xwH3D/Rw5dWilZ0kNDXadAQBVOQJzl0vx/FVmSwewipWFENKA
         xo+ztQgylWLADpS4vH9Sb8hs2mvQzuSgoIQtOLg/AeV5KTNrNMU+rU/FQrTuCd8ZDjQB
         E/YSSTSELWrLmk7pJdEebIIUA7v8Y0UYXgHR/YsLTN6kVqxJI1S4jXaAB77nvwWOh1IZ
         LFrMJJuYXZU/QqOITLSChuO3mUAzyGXkidhWBNNs2aa52sGILDCdSVMcOAffOMFgyBNY
         JFWcq3yG/mNyNgr8VYcsoFVS1cGo69MTJucRPgN3xo/CfYHa++nejqkjf0tLK/ZirJs1
         gt5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775091932; x=1775696732;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l/gHu0FdfX6ZXbcJGvtqN+jQ/yvbzkeHZ4ajTT5rTrk=;
        b=llLhk/e1A0rZ1M+EcjAFKYHBy0yK77y7I0mtakzaG/Qq1uyP1mlvwp9BWksWu3J5nW
         RIGg78qby1R41a3MwzVMjfApDO5loDLo1oTNURODojmkHtDhX+ZTTtrZgZhXmksmzCS9
         jJvi4u+xAPWj4JycH0JytkFAFcSNU0vgZwA5gOLuUEKvAS8Oi0AVzQXqPXJVhcEDUEW3
         yZHYqNdf98YjtAp3ESl9Ba94iQTXMGrbEIbekrXOgSEbAIyIfLcv1wbaDYAmdiULO/Zh
         Ctg85jWXFjdN0Uydysn3qUjMoPNkplij8tE4dTcC/3VMk8P/uOy5Wte6CeHkF8YcayxU
         JwUg==
X-Forwarded-Encrypted: i=1; AJvYcCWwS6Z30nQIIzmaPT1QTzfcHCEQrxzX8chfxiO+Fjcw16eqRkU0SSp8+JyQaIw97QuQhfUQvHaCBwIRdg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGLLXwQ5KvMgHdxdf8ow1BVk9+6MMmtG4HR6kmh0QKHtFaVysV
	OPOho4Ksna/j0U3FKHf2/Z847BdBqwGl8k2y9aiNwPU3m+twvMMNOFmp
X-Gm-Gg: ATEYQzxI8W8Cczl4Zo8btFnA3vuctb+bXxOFd0Y6nyIn95qYLfiSTZ1l4T0GNzA+kht
	WtWCq4EDFrX272EXTghpVUi1RZ6UmKHfFm0KtUFJ07G32IypcfT2Pc/cxnFDUDa5CBmzkXFWBX8
	bxh5Xash53BSmclLKC2X3NBoxQovaAelU1NuUqABmTT22OX/7aA7t9z9wxKZtrHuimv1hMv3Sbe
	GRivpa1Kk6Cqdueo3WKEg+ElndE2Dz1BUjee9exxo8q2GhrW33c/qRLJ4N0XrjE6EbYX4+GOS/R
	xfG1YSeXl9CDIn+LXUHJvf96ixRWo1VETABXrTU/B7t2AtLasZy7lawhnNXRJMvrFKw0rYl1c/L
	Nq+v8IjKwZrFnTg9U+lfDxUcf95p/dCJNCrWaBCfQsDjTo7BTnxltN5TPYBmYm9BQ2uLDAU9YM1
	0tAvF6Gmovov8RulDoTYc3au9y2Q==
X-Received: by 2002:a05:622a:d3:b0:509:2455:2b53 with SMTP id d75a77b69052e-50d3bdcc8cdmr85646001cf.49.1775091932321;
        Wed, 01 Apr 2026 18:05:32 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50d4b1a3fc7sm14217521cf.5.2026.04.01.18.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 18:05:30 -0700 (PDT)
Date: Wed, 1 Apr 2026 21:06:06 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Robert Mader <robert.mader@collabora.com>,
	David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org
Subject: Re: [PATCH v9 4/7] media: i2c: imx355: Restrict data lanes to 4
Message-ID: <ac3A_m4sKyJHa_hT@rdacayan>
References: <20260217002738.133534-1-mailingradian@gmail.com>
 <20260217002738.133534-5-mailingradian@gmail.com>
 <3c51f9fe-9c5f-47dd-a971-5b2a9e416230@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c51f9fe-9c5f-47dd-a971-5b2a9e416230@linaro.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57905-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,intel.com,linux.intel.com,vger.kernel.org,collabora.com,ixit.cz];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 493A6382275
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 12:37:14AM +0300, Vladimir Zapolskiy wrote:
> On 2/17/26 02:27, Richard Acayan wrote:
> > The IMX355 sensor driver currently supports having 4 data lanes. There
> > can't be more or less, so check if the firmware specifies 4 lanes.

This patch is superseded:

v10: https://lore.kernel.org/all/20260311020328.57976-1-mailingradian@gmail.com/
v11: https://lore.kernel.org/all/20260324020132.8683-5-mailingradian@gmail.com/

If my workflow somehow caused you not to receive the new versions,
please let me know.

> Does IMX355 sensor hardware support any other number of lanes?

Actually, I don't have hardware docs so I don't know. There can't be
more or less without driver support.

> 1) If no, then it makes no practical sense to check for data lanes number
> given by firmware, there can be any stored value, but it's known that the
> number of sensor data lanes is 4.
> 
> 2) If yes, then please return to the sensor dt bindings, and reflect any
> other options, right now it is set strictly to 4 lanes only.

I think more lane configurations in dt-bindings can be added as they are
discovered, either by reading hardware docs or by finding a board that
has a different number of lanes.

> In case if
> 'data-lanes' property is omitted, you can use 4 lanes as a default number
> of data lanes, and this information shall be documented in the dt bindings.

Later revisions of the patch require data-lanes.

