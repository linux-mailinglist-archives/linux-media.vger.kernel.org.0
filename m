Return-Path: <linux-media+bounces-60582-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGYbOd0o+2lAXAMAu9opvQ
	(envelope-from <linux-media+bounces-60582-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 13:41:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4768D4D9C87
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 13:41:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C35DA30315D2
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 11:38:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 604E543D516;
	Wed,  6 May 2026 11:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="e1wsCWxA"
X-Original-To: linux-media@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2F143D50B
	for <linux-media@vger.kernel.org>; Wed,  6 May 2026 11:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778067489; cv=none; b=G0I7fivqrfQUyiZkky/3xOZd0Hp5j69gKRbhMxkil2ORdP1ZlbfWotfWztxRSJGbtGW46xYNjuI56czmdRjWH57arbTIqo6ASFdj1AeU6hqGaFh7vIj4nSjSbZlXDjqQ69fIyIyFEKjgD9S4rNC8AWdb3dqQWD16l57baoeUNiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778067489; c=relaxed/simple;
	bh=4sdC7kwKSXuS6KgRZzxsbtJl62bxQOYB9GQUjBKu4sQ=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=cxdijENTTJYpDbffnqM5g6N2lc6Q5VtZCkC8gI1WUhwEuDAYZEUVHCjA2Qx40bmv7p7vpMpiOKAh6DNSGmjj9NYP6RCBN/PBKS3PY2M5+hWfSvLLqck861ZqV7qk2okGuydoa37fa5jIs2cNrIGLbqpUCoRWla2GOlMAkmgzGYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=e1wsCWxA; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 04C581A352C;
	Wed,  6 May 2026 11:38:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CD7F66053C;
	Wed,  6 May 2026 11:38:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6A4E9102F1D29;
	Wed,  6 May 2026 13:38:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778067485; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LQcm/xArV6CJVfiI15lYMkR7QKqELsBqKy8G3M2hjoE=;
	b=e1wsCWxAaWftZoU4FBEJx+l2Spsa/qIv/l6/3EaHfxVCX2x045rfr7cK3mLyprm6BT7jHo
	yUpimppLOGLKHBoBavKT3QbpYFtbT09szsCPTfb8zE7vzOECcfOuXeWhg2YEy0uvoxZ4UP
	OekVuMP//mj9p+JPLSg7qP+kQ32ac95qjLcdw9gULZ9hft8PQRMyEJyBierUrVe68MCVU7
	Q27H01aTIWhoORW26FR/b8wguwoH2b3XFYRYZKy0g/kArjF2KhCX4soMIAsgRFZ+Tydiu9
	A2JJjHAWaV+ZBGm+IBMqxq/CZwXgreH9i0rkslRuMuxussKAoqncyjm0HiyIQQ==
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 1/1] media: tegra-video: vi: fix invalid u32 return
 value in format lookup
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: thierry.reding@kernel.org, jonathanh@nvidia.com, skomatineni@nvidia.com, 
 luca.ceresoli@bootlin.com, mchehab@kernel.org, gregkh@linuxfoundation.org, 
 hverkuil+cisco@kernel.org, dan.carpenter@linaro.org, 
 linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20260506075745.28574-2-dennylin0707@gmail.com>
References: <20260506075745.28574-1-dennylin0707@gmail.com>
 <20260506075745.28574-2-dennylin0707@gmail.com>
Date: Wed, 06 May 2026 13:37:56 +0200
Message-Id: <177806747690.1370967.12191518933369462727.b4-review@b4>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 4768D4D9C87
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60582-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,bootlin.com:dkim,bootlin.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Wed, 06 May 2026 07:57:45 +0000, Hungyu Lin <dennylin0707@gmail.com> wrote:
> tegra_get_format_fourcc_by_idx() returns a u32 but uses -EINVAL to
> signal an out-of-bounds index. This results in a large unsigned
> value being returned, which may be interpreted as a valid fourcc.
> 
> Returning 0 is not a valid fourcc either. This condition should
> never happen, so use WARN_ON_ONCE() to catch unexpected out-of-bounds
> access and return a valid fallback format instead.
> 
> Suggested-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>

Being a fix it should have a Fixes tag and Cc stable. I think the right
commit is 3d8a97eabef0, so:

+Cc: stable@vger.kernel.org
+Fixes: 3d8a97eabef0 ("media: tegra-video: Add Tegra210 Video input driver")

With that added:
+Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


