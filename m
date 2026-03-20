Return-Path: <linux-media+bounces-56568-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oB9/G9WOvWnY+wIAu9opvQ
	(envelope-from <linux-media+bounces-56568-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 19:15:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CEE2DF415
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 19:15:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BB8BE300E6BE
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 18:15:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0C273DDDDE;
	Fri, 20 Mar 2026 18:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fvyWdItK"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9933DE43C;
	Fri, 20 Mar 2026 18:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774030533; cv=none; b=WpsBhoLFgJdF623SudWsPHo8CMYl6S3Mvi6RPd7AThQIk7pLpn1tvOjwUcwTJSqtQr1bpYvATFwr9ZzV6Kji6V4e1UsJk9T4YJRQA55P583/tpPmO7Xf5pTej/VPkpHUNfCWKHEp+evREJUAl1gGdEka8S5CAcaAIqdlTMunEFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774030533; c=relaxed/simple;
	bh=9kPe7L8w8yNoC/3rVWXw1UQUGy4KdxDRZFpsLFau+28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bx2mL7BwicH6PmdYKXiYzIjMQECvSBxclrouzwM6Pu5P9UeZxQkZNJZ5/CCm7U7XxjY0aZr4+i01UEyxidCqFssc2GTpwBs3cu9Ry8K9Phv5m/XXqSmsb598fsYAxE6KuGcoI7WupYy88iOFGHqIVMJ/3Zii3kpgp21aO1RN6oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fvyWdItK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE3D3C4CEF7;
	Fri, 20 Mar 2026 18:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774030532;
	bh=9kPe7L8w8yNoC/3rVWXw1UQUGy4KdxDRZFpsLFau+28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fvyWdItKAFGkXtbpu9IZCQfa3UQE3LpEHeKH7IpwLR69wZubEGnT4GPR/p8XJU5kI
	 YAtY+08BA6aAhwa6KUbgCA4ipo6n14fVc9YBpNL+yhnWhDxou+UGjBuFbFy8O4Ksi0
	 ZTG/mQ+ftMFrfE6M/XBAJhkWGj38pFy2+fTzjOmJdKTzScwQ7WhHluJkNjpFK9+5H8
	 3sfjl2QDIxhr8FJMzAd7IUUiiCSspiV/PjmsM3GEnIJesh+Ct0vVEufv1mn6f9zqV3
	 abKIm26LU3KRD0E8J4hZO9wMXAKcPAOE/S9dVkT9I3KmMkWM+mSuHKZaizLRlatgoA
	 Dlg9kjrerghcA==
Date: Fri, 20 Mar 2026 11:15:32 -0700
From: Kees Cook <kees@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-hardening@vger.kernel.org,
	gustavoars@kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: nxp: imx8-isi: remove kzalloc_objs
Message-ID: <202603201114.9A02FDA977@keescook>
References: <20260306044536.149204-1-rosenp@gmail.com>
 <20260319220901.GD950375@killaraus.ideasonboard.com>
 <CAKxU2N856yYXURRf3td-_RCpe9hyX=zAy3qtD3ki23RjgO+a4Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKxU2N856yYXURRf3td-_RCpe9hyX=zAy3qtD3ki23RjgO+a4Q@mail.gmail.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56568-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,vger.kernel.org,kernel.org,nxp.com,pengutronix.de,gmail.com,lists.linux.dev,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kees@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 71CEE2DF415
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 05:11:22PM -0700, Rosen Penev wrote:
> Technically kzalloc_flex is simpler but I assume a devm version of
> that will be handled in another treewide commit.

Yup, that's coming. I wanted to get the "first pass" of the base kmalloc
family converted first. There are a few classes of "kmalloc wrappers"
like devm_* that I'm hoping to convert to type-based allocations. devm
is next. :)

-- 
Kees Cook

