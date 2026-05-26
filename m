Return-Path: <linux-media+bounces-62827-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8P8eGTgEFmrNgwcAu9opvQ
	(envelope-from <linux-media+bounces-62827-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 22:36:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C211F5DC5EB
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 22:36:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 16753303C2A2
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 20:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85A213BFAD5;
	Tue, 26 May 2026 20:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pinefeat.co.uk header.i=@pinefeat.co.uk header.b="EdJR0YkM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD2C332615
	for <linux-media@vger.kernel.org>; Tue, 26 May 2026 20:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779827758; cv=none; b=vCttYw398Vy4LlxFsceDdcCas7LCxJszxdSi5pp9APgUv6v97rCCBXIwhB8Akm5fUzrTipUIo/Wc+PMWmZMhufac5mneOajw8e12jVxz6xcecrJwnOJfDnL+Hk1bKIvYo/aiCRG41PPnJTgubbw8HIQ1CVICAQC52R48Zdr6o0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779827758; c=relaxed/simple;
	bh=C8DbFtwWr73bU897qlWowKdI+LzJPATt/h5/a2KEgZ4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mzYGYUWtD8EffBONYUoZPAKc2DMQRtI7RQRwyiPSx7kS5RmrdSIvMMqaf3fh3gCZTbj6tBxNSHaPLQCFikWfz5qv+QoWyHD5w6XEOgX4xy9V1gB+F4IRArbpEXb5M366RxOoeFZ7FQ7u93qUf/7kDvGwbo3J5yYU8Wkry82GoJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pinefeat.co.uk; spf=pass smtp.mailfrom=pinefeat.co.uk; dkim=pass (2048-bit key) header.d=pinefeat.co.uk header.i=@pinefeat.co.uk header.b=EdJR0YkM; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pinefeat.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pinefeat.co.uk
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490388fd0dbso54647995e9.0
        for <linux-media@vger.kernel.org>; Tue, 26 May 2026 13:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pinefeat.co.uk; s=google; t=1779827754; x=1780432554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iBYDos+g2gG8Yh/X4GriPM+bzzxtZiAUCWEAIa/mg9w=;
        b=EdJR0YkMwGNBkxbI733CqF++SVx1Hn2OKo4Mv5uTK0TR6SxzNLFViZ0+L3AYGjcNtC
         8B4WJy4ibhVVHAshkOWyeI83O3XeNV9nwbqhMmGwB1dGBvRvsudBFahhqCut/l0j7xYJ
         1lz2OKeo61rR6euaMxxWbniK66GS5/Xzj6rwRv32WETwX1qaFg1dOi2UtQ408vPxDcHB
         m9C0VQpQcfbwMIZFw6yo2iMkhrg+iJLTsc95TSuPR/Rj8k5dJF3kmXrhnnvknZcBdYGq
         2Ia/OXZGiLRF2xojQAg93lktI2Qm2zk8l3XGsxUTAgWjKjSLoicNOBuB9M4++gGyaueS
         Zd4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779827754; x=1780432554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iBYDos+g2gG8Yh/X4GriPM+bzzxtZiAUCWEAIa/mg9w=;
        b=bSUn/A+iblsXPWLyEeTigxzv93pnwXjea9h4WGzCwYfFEC1pE8YSoGTdcSYOxBwPgm
         MQ+/WSC+v/14Ia7ziUh/Eyu1KQglIJ8bq/ant9SHtPD2weiAOTTqlGmurkINnIfP4/jg
         LF0N7JpAiGgWdKlPCu3HONY31gXUHy/dsGQcyEZMO4kKp+qzqw1LHtAlpKoLlPcUUjJj
         ncJwAT+9q8Ws8PM8eYFLDcB9rVbXucUlMZ2WCzuzCm3YAD3tddZwKDi42l3QWjPi4JBb
         MZ82D6kl2bI1VcMn1blAn+C+WGOlnt379WtQAl+S6Gs01oBBuJsXj/tyvEPuA4w+j+gd
         sd6A==
X-Forwarded-Encrypted: i=1; AFNElJ/2lVWySybjX2nG7sYHjeiJkzlyuRqRQBrwLzJ7J+5dkn/boqqOQMwbbHIxR+8brXcPvgYk2M5WzjRkUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqZicFhzasnJLaj2eKFzaN4MHK4xDQ9T+rQiHdOFY3NaFNa57Y
	5+iknJU6ndxO5hSCPcJZCA0V0Rq1BHklQLJVYGCJ+0JbM7z1l4Ep434ROM5z0qMUi9M=
X-Gm-Gg: Acq92OFKvJPax70x0wXq0IbqjRSHlNUy4ssY6E6uXGGMuvv0HJTBjUHhK8CK3k2/GtW
	w2Sr5vmAxmy3B706DSLHRIPpPdZayCXP8fL3TSr9HN1IQQk2VjUAtZ3vG6C7mMJcNuZLdvNcA+F
	auYHsc0fnr+O+dalC9mM+6X6/igqgg8qgoeA5JaaeXeiXh6545xCPPEqkspJaCE37D9RE0dQrxX
	srCFA1INzSA4ez7WsbIh3jTbM8p1/oA3KSJ+QsJJt4uB+S+TXnEQKwbLtMOpAUK9QbsYS1jHNet
	JEMExzC02OnaPobOGOg2tEg/rfd6eGe/GI8CgZrSWoHQoh+HCoWudM9mIkuaICmqxQcCCT0Wyt2
	GUpPODFSLGDPOunZTznm700JABTE717rF/VhU6DrXnB+9EYpocVeUySJ9TSq0Y82P5oSWAity1n
	/Cit8h9WJhGSlNSd4yyebfXotswahqOaMA9yyD+DpuQORwt0wtzYs=
X-Received: by 2002:a05:600c:474a:b0:490:51e2:d992 with SMTP id 5b1f17b1804b1-49051e2daa6mr272126805e9.13.1779827753941;
        Tue, 26 May 2026 13:35:53 -0700 (PDT)
Received: from asmirnov-G751JM.Home ([2a02:c7c:b28c:1f00:4309:135:1dc2:4f93])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904526c926sm620908185e9.1.2026.05.26.13.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 13:35:53 -0700 (PDT)
From: Aliaksandr Smirnou <asmirnou@pinefeat.co.uk>
To: alen.karnil@ideasonboard.com
Cc: asmirnou@pinefeat.co.uk,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	hverkuil@xs4all.nl,
	jacopo.mondi@ideasonboard.com,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v6 0/2] Pinefeat cef168 lens control board driver
Date: Tue, 26 May 2026 21:35:52 +0100
Message-Id: <20260526203552.16717-1-asmirnou@pinefeat.co.uk>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <93997447-2f03-4449-ac51-ee6a2e470d58@ideasonboard.com>
References: <93997447-2f03-4449-ac51-ee6a2e470d58@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[pinefeat.co.uk:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62827-lists,linux-media=lfdr.de];
	URIBL_MULTI_FAIL(0.00)[raspberrypi.com:server fail,pinefeat.co.uk:server fail,tor.lore.kernel.org:server fail];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FREEMAIL_CC(0.00)[pinefeat.co.uk,kernel.org,vger.kernel.org,xs4all.nl,ideasonboard.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[pinefeat.co.uk];
	FROM_NEQ_ENVFROM(0.00)[asmirnou@pinefeat.co.uk,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[pinefeat.co.uk:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pinefeat.co.uk:mid,pinefeat.co.uk:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: C211F5DC5EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 26 May 2026 16:54:37 +0100, Alen Karnil wrote:

> I've been asked by Kieran Bingham to review your patches, I've
> reproduced your work on setup with a Pi 5 with a 6.18 kernel and
> I got a few questions

Hi Alen,

Thank you for resuming the work on the patch.

> I built the calibration application but it would not work out the
> box, I can see that CEF168_V4L2_CID_CUSTOM is different between that
> is in the patch and in the application? Which is the correct one,
> does the  patch need updating?

The CEF168_V4L2_CID_CUSTOM value used in the patch is the correct one.

Although the repository currently defines it with a different value,
this does not cause any issues for users because the driver is built
and installed locally together with the calibration tool.

I can update the value in the cef168 repository at any time, so as long
as users pull the latest version of the repository, everything will work
correctly.

If the driver is eventually merged into the Linux kernel source tree,
the repository will need to be updated accordingly anyway, because there
will be no need to build the driver locally.

> The tool to modify the device tree also did not work with the
> IMX477, I needed to manually modify my device tree to get the dtbo
> to build,

I just double-checked the setup on a Raspberry Pi 5 running the latest
6.18 kernel from the stock Raspberry Pi OS, and everything works
correctly. Are you using a customized Linux distribution?

Could you provide the build error logs and the overlay files generated
by the tool before you modified them?

The modifications applied by the tool are shown in this diff:

https://gist.github.com/pinefeat/1b3a258a193754f073e171b1ed33a0cc

Were the generated files different in your setup?

> there needs to be some further discussions on how we could
> improve the user experience when it comes to enabling the vcm with
> camera sensors.

I agree. I started the discussion on the Raspberry Pi forum, but the
driver needs to be merged first before moving forward with that.

https://forums.raspberrypi.com/viewtopic.php?p=2318070#p2318070

