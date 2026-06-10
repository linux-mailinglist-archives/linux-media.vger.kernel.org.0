Return-Path: <linux-media+bounces-64526-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vDsOMvTiKWoZfAMAu9opvQ
	(envelope-from <linux-media+bounces-64526-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 00:19:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9564366D2D7
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 00:19:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Z+uJaMX6;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64526-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64526-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 08D3E30F80B4
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 22:19:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53D563546D1;
	Wed, 10 Jun 2026 22:19:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73402E2DFB;
	Wed, 10 Jun 2026 22:19:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781129962; cv=none; b=KI3xo5h5BwwIXqsAWs41vlmsVjsWtbnpG7GM2Yc+9Ksph9ofLGxo+4L0VSGCYcISTIsCEs3ymHvRH7HB1FgwUzMzosZ7pjZFhbnGFg8PK/SUf6zIOgzrWoYJuBRRne5Nq+efeJs4uSJu6smaHSlCFAYhC3usCjMKDyvgR4op1Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781129962; c=relaxed/simple;
	bh=7sOXNZObj9IUkty4D2uhSgDz+9i+9axEpdnIFb4GJSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jyg7yz5fEJ+YCYJQfoRvklMgm1UIIzjR6GXisJuItQe42OLs9lYfPtT8d0Y+x6DMWPHqiZgRtmdm1FTIB4j5b5pb/ZT9CVprTk36zheV8hGdy1T5I3JSyXaZ2U8AObH69ENySqML3pv13012aR8nhw7WzH54zM3YR+QNBi1+F8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z+uJaMX6; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95C911F00893;
	Wed, 10 Jun 2026 22:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781129961;
	bh=g6tx6uH607t0QMVlmv6fEuJQLYuABn41Vu4ZVF6Ffk4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z+uJaMX6oG7AB1LTv5oZf8IiZ6sS1CYP8JGuDCgKxHiL38fGm6yXeMIjiD9adauN6
	 Zu7khftzggh6vRNwSVfOh65gIeJm4JzK4lfzx2HKOxgndooNIJh0VF0TjPm2ttKbuE
	 crNOjq12oVuMK+ChgRBlCChGLN49Q81z5JHOiVesx3rfL7Gog46e+L45Ls25vjFNGt
	 fYmL3f9s//wvrIDxiEZocqvVeWdqPVAPQ/0tdkyjzaij40ne7OktvSPhmYOmm1VBve
	 KC0lC1Up8Qugg3sI4+T6do5iDqNozIMd92ycE2npkkWB8TBpaLCwZCWqFPHZ9e9euw
	 FrQ3boCKXlJwg==
Date: Wed, 10 Jun 2026 15:19:21 -0700
From: Kees Cook <kees@kernel.org>
To: Mert Seftali <mertsftl@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: atomisp: gmin: Use str_on_off() helper
Message-ID: <202606101519.29D65E4068@keescook>
References: <20260610182348.217892-1-mertsftl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610182348.217892-1-mertsftl@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mertsftl@gmail.com,m:hansg@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-64526-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[kees@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kees@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9564366D2D7

On Wed, Jun 10, 2026 at 08:23:48PM +0200, Mert Seftali wrote:
> Replace the open-coded "on" : "off" ternary with the standard
> str_on_off() helper from <linux/string_choices.h>. This improves
> readability and reuses the kernel's existing string helper instead of
> duplicating the literals.
> 
> No functional change intended.
> 
> Signed-off-by: Mert Seftali <mertsftl@gmail.com>

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook

