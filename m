Return-Path: <linux-media+bounces-51366-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAQDFHmtcmmAogAAu9opvQ
	(envelope-from <linux-media+bounces-51366-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 00:06:33 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 559556E657
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 00:06:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 18BB8300118B
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 23:06:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E47C3A730D;
	Thu, 22 Jan 2026 23:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="mvwSe7Bb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0445136681B
	for <linux-media@vger.kernel.org>; Thu, 22 Jan 2026 23:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769123177; cv=none; b=ac/yBgXKFfK/eoeX/RdB8LVFqQULzVQrDwA/47NGl54gow25tHhbfQBpS+5TgD1cJdiKl3950lkTS8aiSBHRJQDNt16PRHTVD8Kll1vbCCKV4MZ/HgXU7I/2c8cgwjMgNvrF12y0eY0GBIXQR3fzF8W3Eg9E1zbC9cvsLS933jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769123177; c=relaxed/simple;
	bh=mA5A6Mk+gz8WMRX9DYmZtQj8FDxDiSE/5B04IO9M8o0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=O6FQpfPiYsvXUvA7EviFJi0JjOKjAM9KHNo/BiuvchT0aNJXlL0tE954RKFsuz+v8OzJHt/ZJQtu6vLH0pZ2mxvdXf7OLHDI6OXbT/gY1QF68GjhPbClSOB/QZFK0ANYyXCPOKOwRHWEKffriE6VE84ixRBLWO7nC48JMJalnQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=mvwSe7Bb; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-81f5381d168so1631377b3a.2
        for <linux-media@vger.kernel.org>; Thu, 22 Jan 2026 15:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1769123168; x=1769727968; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=mA5A6Mk+gz8WMRX9DYmZtQj8FDxDiSE/5B04IO9M8o0=;
        b=mvwSe7Bbvm1DuhmrdFUiGI/y647SF8nJeO6dAH6WytubqNS9wMn5LDXQJV1bQiZw4y
         Opx5v4FGhfzByoyjvZS3RG/1gCbPiHHT9esohFv9eKb8eLowr0FwWsob5gLBdcoHDxaG
         HkkWCCRNy7D82y/C9Ng+D+cgOZySnRHltZwotsIxPqIvvE4l/S2B5u6ZdGbUUG77PQZJ
         dGtZE2nEsGL9ohsBrFKbuKrMTdINJ75rrDxaou57fsGRGRTn70p6vwSGureNgWw82HqA
         h/Bw0JhaCzZvQvfDGEqIeLGgoVg4o7okbMm4QGT/Ne6jshR5k5AYPD9yfk1rXNSyLpZO
         RiAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769123168; x=1769727968;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mA5A6Mk+gz8WMRX9DYmZtQj8FDxDiSE/5B04IO9M8o0=;
        b=Q4eajp1UUmgpOHDB+tkAxNr+L3gpIW+e6cT9Hv05bGZ+xCw+S+fhMRWLEjyE9ZZBbo
         a8Jr7/Mmep3B9T7ItGDlOpr0Fpj9KQ515TTIo9g7tmPhgsIkTdNASwsQ4DWw3qPUMJI/
         qbbMNfNW9R79IozbsUiGGaYtTVk1J/Ap7ccuNtPkytuBV0CXzeaUsKYY2HBlddJrxkds
         HEj8+oWZAvDKp7I1EZByo70fxeDGq8Mgv0T4mM4qPatRLt3jvqpDDnpyBSspRiTyWM5G
         p8Yxs+5TTsxeZN4vg/3vTt/OlRnSIrkDu2D9QZHWErEJpRQ2T9CuKJuxsjh13iZ4nctN
         sSLg==
X-Forwarded-Encrypted: i=1; AJvYcCX1WJxnPqkvzqiIg+WLFHLK3Vt6UQQvjmUzfzpn39EEVg3vqlA9sXNm9zvzgSNkRI5CkX+HyJzOAfvmKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6D2mwFxdypajSSEPCP9Ur+GAzQOc+qOQudpso1ZkXVvy5oHmw
	SlcxWJejnhTKMcbQcOGX7G8zqAgRCJGlmhZIhtlL272d7nxgsTpk0P7ixZXVM4aVHR8=
X-Gm-Gg: AZuq6aK1Ib79LAw6hek98kHcVeJTLRfReuYOURFexkx+FDo98mDpQ/waiBL/QZYJJIC
	RcctWng0XM4cX41fmlCj9a8o8yxIyYYQAfIvFV+5YYGPpNIkTrx3k7bD4/EuVp7aBBRGDOgvA3z
	NnWtWQ7Pd+pmMJiEiL2yLYWwgSWqXtBwYfN9yPXUyEAD0tgVMRgezVJsHB3pO5Kjcqb2FcuBbqS
	B0Bk4+dJXPDC6h8sArYNmF2omKSGfsZHW2h9jwOCwUGhlKSSCwBQ7hHu0DORx1H5WRoxpQSMk+Q
	RxHYPKz2XupmgpHF9395XYF4rtppAUoO/OhtD5P2W6rgQ0d5PwAearYsfi7cErOitkaf2YUokTz
	6Iw/ApFerG+XjKd7YAgzSb90x12m1w3SIFrvxP9cUBdD0Ef7u/qAKh2xtp/4FqI+cAlDE2TQCN4
	ctLLybhDKf
X-Received: by 2002:a05:6a00:894:b0:81c:4a92:25a2 with SMTP id d2e1a72fcca58-82317e5bb29mr764095b3a.46.1769123168092;
        Thu, 22 Jan 2026 15:06:08 -0800 (PST)
Received: from localhost ([71.212.200.220])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8231873e4bdsm367936b3a.50.2026.01.22.15.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 15:06:07 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>, Linux Media Mailing List
 <linux-media@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Sean Young <sean@mess.org>, Sakari
 Ailus <sakari.ailus@linux.intel.com>, Ricardo Ribalda
 <ribalda@chromium.org>, Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Niklas =?utf-8?Q?S=C3=B6der?=
 =?utf-8?Q?lund?=
 <niklas.soderlund@ragnatech.se>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Alain Volmat
 <alain.volmat@foss.st.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, Michael Tretter
 <m.tretter@pengutronix.de>, Tomasz Figa <tfiga@chromium.org>, "Hu, Jerry
 W" <jerry.w.hu@intel.com>, Steve Cho <stevecho@chromium.org>, Kieran
 Bingham <kieran.bingham@ideasonboard.com>, Paul Kocialkowski
 <paulk@sys-base.io>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Hans
 de Goede <hansg@kernel.org>, Maxime Ripard <mripard@kernel.org>
Subject: Re: [ANN] Media Summit on May 26th in Nice, France
In-Reply-To: <92e24f36-d189-4ba8-ad0b-43277bc1aabd@kernel.org>
References: <92e24f36-d189-4ba8-ad0b-43277bc1aabd@kernel.org>
Date: Thu, 22 Jan 2026 15:06:06 -0800
Message-ID: <7hqzrh5jtt.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51366-lists,linux-media=lfdr.de];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[24];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khilman@baylibre.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre-com.20230601.gappssmtp.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 559556E657
X-Rspamd-Action: no action

Hans Verkuil <hverkuil+cisco@kernel.org> writes:

> (Please pass this on to anyone you think might be interested in this!)
>
> Hi all,
>
> This year's Media Summit will be held on Tuesday May 26th the day before the
> Embedded Recipes Conference in Nice, France:
>
> https://embedded-recipes.org/2026/
>
> The Media Summit will be held at Hotel Campanile and in the same meeting room
> as last year (Nikaia):
>
> https://nice-aeroport.campanile.com/en-us/
>
> It is close to the Airport and to the Embedded Recipes venue.

And speaking of Embedded Recipes[1], if you want to submit a talk there,
the CFP is now open[2].

Kevin

[1] https://embedded-recipes.org/
[2] https://cfp.embedded-recipes.org/er2026/cfp

