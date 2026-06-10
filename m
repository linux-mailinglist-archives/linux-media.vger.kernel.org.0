Return-Path: <linux-media+bounces-64402-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BK7DJYU7KWrsSgMAu9opvQ
	(envelope-from <linux-media+bounces-64402-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 12:25:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CD46683C2
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 12:25:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=B5H8QNiZ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64402-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64402-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E399B30F7DA2
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 10:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFB2F3EFD05;
	Wed, 10 Jun 2026 10:22:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD013EEAFE
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 10:22:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781086940; cv=none; b=Nj0OgZnwWq6bsliGbi+t8tAFpWvwWRhtJYpm9q5YUkAWhf0dNLI86TbzLz5mDpceGXvdZ5/5+3jyyHSvq7rz3UWvKXQ8wFsaAde1JfzKrE8k/LwStLBUy/11iqsO0O3/J1fET37w3gi9tRrMD+fLDHajgyGhXmbXGtXC0ung9Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781086940; c=relaxed/simple;
	bh=rG4dRTjoDrL7Qas8vzDWb+OnyUEAvq8Ytsyy6PlZ7Zw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:MIME-Version; b=AADQ5Q9kVt3INoTWJPMsQ7GQ9MHPHCrY5Sg2mikwPyJUUk3OYPm7jMjpZdyNzGDfuDOuBg83w0OoLq7ZWOdnk0m0y1K25fiTVnkYX+5t4NgeWvkN39hrWQ9mR1+vDFmQ7csDuG73FB916Lt7bdxLF7ZnySL79B4d+7fhuT0F1ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B5H8QNiZ; arc=none smtp.client-ip=209.85.167.48
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5aa61503fdaso6612072e87.0
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 03:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781086936; x=1781691736; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rG4dRTjoDrL7Qas8vzDWb+OnyUEAvq8Ytsyy6PlZ7Zw=;
        b=B5H8QNiZ+E3BYED8QK6j17pLahDm67WdAarrZ1Gjrj3FrFUhwjfozGycT5YWWFZmO8
         z5+WNvERLd/LJf0OXUq0u4KTac9EMlK8v0QgNcsZDktn67Kd3xEOgyHiexM7DVqGmE31
         Ycd0NvHwopU9eOID1hdUwABCF1rplpkH1r+FD/U9gS2zjn8skx0JyijUFyc9u9H10Jbf
         GWVc7i+BkHQ1OTyZ38PVt4zI7wYcdGCj920pH0fM7VMiMjQQIEGhVxMZVmw7CcelUsKT
         BOFkQlRrCM8vGlftyLs2xT7LBAx2wqn3/PrSgjKUO7gS+g9Fy0ZHrWnltcwTm+nYX32S
         ymXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781086936; x=1781691736;
        h=mime-version:content-transfer-encoding:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rG4dRTjoDrL7Qas8vzDWb+OnyUEAvq8Ytsyy6PlZ7Zw=;
        b=LPIRmsXTM5iGfAPv3Ibt0M5pna3PmRbWown3Jne9tw/7JgyV6VjGfoGBR8GJCfrRFI
         VNcFBl9ay5rzJAQHi8R0dJiOOk/P1SEhI76KLApVQ+/LmzE2ovyeno9vrnbqdSbeAMK1
         G4Ag1U9CzhU3NH8lYmcanvCayuwJzLKjYmYE8HMHFNo8t3SGdrmZk9lJTPPMUYbES5pQ
         wXbXNdyXbuAWXG7lS9caRuKj1F7Neq8acA/xkInT5jwnTay0yZ36aK5foM3Zc2JgRhCS
         dEjAFqP0Ut3H4XoygryJ5gaQcp1MxYlVLMndZ6AK/9IvFNaiw3miqPAsN8Pp3AS9E50+
         r+dw==
X-Forwarded-Encrypted: i=1; AFNElJ+fObXtfNiXKpemzskqwGscEnTwbIOjBU/MhA33et6sK4uQ2wFpntX+bmUQI3iIA4TBHRakVW0Lu9SIlw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzv9udpOy/lQMVG1fyhrbTbP94qixFHtcZs67kzemvojneHrT7
	LL1TmuIgLpG0NsCxuvQ0VtgP4rqLz5lMXMZEh3unAVTpRCMkIWmYockE
X-Gm-Gg: Acq92OGQpbUBW3dtrOEkqWx5ZhP3GnWfGoNc1tzBoiUSJXFlx5JExoee8AlpRVvQviz
	7V09r68dsrBNThnyiZiFCe1IkfUqcQdEkdLZRYAzJGUAThNc5/BrZUxH9A10zY8fAoVecKndYE5
	hyUMpcXVD79sQHHFfXZtn93tYnkPn3XjVly67bWCAxdG3TPJ3jT5t5rCZ8TFolLSKhTMa7TGQk6
	r6g/89C5dov/djug88LXYCDFUpPLMwgruSWFVSNG+w58/hDDM7dsfdRhv1bNSSpcoRwFnjpGElL
	l54+x0BnenmXmCrdUCSNleaUm9ru1ijkaQKaG0GIkkhthauFSkFsCVYyhYWnyWDSiEzfI3fWQdy
	Lt6neLMECN17Fc2iiU/wE1HlUZJwc9BfmTBcnc9BBXRijh5XuTOag5UJqjqXCUeWOPkkAd3ai72
	sS/VQmWUNHntoZxvQZ3YpvvkbmMPpnX7VN2O019U9YzXTXTbS5GCaslpzgIt533N8i1Z0sb9Ue2
	V25Ija4f/oRbq+In1L6Og==
X-Received: by 2002:ac2:568d:0:b0:5aa:71e1:edab with SMTP id 2adb3069b0e04-5aa886fee66mr5875871e87.23.1781086936363;
        Wed, 10 Jun 2026 03:22:16 -0700 (PDT)
Received: from [127.0.1.1] ([79.106.123.139])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ed718sm5200547e87.14.2026.06.10.03.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 03:22:16 -0700 (PDT)
From: Jurison Murati <eng.juri@gmail.com>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] media: i2c: ov8865: Drop PM runtime reference if
 stream start fails
In-Reply-To: <6a599060-0e44-45d1-8387-30d355233ee3@ideasonboard.com>
References: <20260609232255.13559-2-eng.juri@gmail.com>
 <6a599060-0e44-45d1-8387-30d355233ee3@ideasonboard.com>
Date: Wed, 10 Jun 2026 12:22:15 +0200
Message-ID: <178108693532.7090.2464486265782818995@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64402-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dan.scally@ideasonboard.com,m:sakari.ailus@linux.intel.com,m:hansg@kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[engjuri@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[engjuri@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,ideasonboard.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 33CD46683C2

Hi Dan,

> Good spot, thanks:
>
> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

Thanks! Note that in v2 I restructured this per Sakari's suggestion
(the runtime PM reference is now also dropped if disabling the stream
fails), so I didn't carry your Reviewed-by over - please take another
look when you get a chance.

Regards,
Jurison

