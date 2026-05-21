Return-Path: <linux-media+bounces-62517-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENc1FU8UD2otFAYAu9opvQ
	(envelope-from <linux-media+bounces-62517-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 16:18:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 637B05A718B
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 16:18:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4DA4E31F4A38
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 13:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B74FE3EA96A;
	Thu, 21 May 2026 13:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fxklz89q"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FBB2D12F3;
	Thu, 21 May 2026 13:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779371373; cv=none; b=S6iMTS65Ymoaqqtqq7jRirrKGHnXmgW0ljSQksyNVIXlrGxTG3VUlAssk7ROH/MxmE3IgPTuG9bNb/x61ChRq4NYjgS8kTAqpGAM5/1+Hk+t7vEvjWvujlOghiHVABlESnuVW5nAQ3lxrjuKLt71wU6oVcWrnFbZ0jbGqIt6xxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779371373; c=relaxed/simple;
	bh=D8pkSP+mj73HtQFC6AT/3TJbMQ9vBvkfZa3GfEUn7WU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mv6NSfKkT8AFVd6TQNGBjcu9WwvGW/Jvh1FAEt36lX/XHk9jaTY2OjKJfndFfV6GjsfipFlZ5NQQru7K6y4JcwlVaCfFUtT7yXxV2hnwnlploFnje90jdsZu5NnHOCj8/QWftrpUSnVMFsqokiWACg9hJc8ZTNpMOF+solJBu4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fxklz89q; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E10041F000E9;
	Thu, 21 May 2026 13:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779371372;
	bh=9vGVawvws7fBAKL9Kh0WruRDCPy652JeJMlY3clL/0g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fxklz89qIKkCozgPurmI+CtnQXXe8UScPYtY3uUoVeIOBbEhDFXEgsNEI/TLIzFzT
	 PGYZdAlq7axfILQghdOVM5oX5RsQ6vrRk70r/yAaZt9nj2Kmf++p5llYTbgAuTQtgR
	 eyZbTl2QKo+fadwyZUDU5VcTVpgw9OMXH6iKGqfW2m28YPVwheEFKeSyRSxwel7NBH
	 2Ux/19YTYRgYsIzVQAcEHtUZ73C1fMgNlqcj0YiIdYs5laomkDzSzIFyaOqU1bYYY6
	 zvNp+5hzGkv5N1g/4TXybirprVBZzOi/GwH6223sH2wXZYmK/fvQ41mTBbIQiebMH+
	 G426WHRUkL4vQ==
Date: Thu, 21 May 2026 09:49:30 -0400
From: Sasha Levin <sashal@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "patches@lists.linux.dev" <patches@lists.linux.dev>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	"jacopo.mondi" <jacopo.mondi@ideasonboard.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	"laurent.pinchart" <laurent.pinchart@ideasonboard.com>,
	"kieran.bingham+renesas@ideasonboard.com" <kieran.bingham+renesas@ideasonboard.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH AUTOSEL 7.0-6.12] media: renesas: vsp1: brx: Fix format
 propagation
Message-ID: <ag8NauKvccv-O4Ec@laps>
References: <20260420132314.1023554-1-sashal@kernel.org>
 <20260420132314.1023554-285-sashal@kernel.org>
 <TY3PR01MB11346755439FD654CDA404744862F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <TY3PR01MB11346755439FD654CDA404744862F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62517-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas,cisco];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 637B05A718B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 04:12:43PM +0000, Biju Das wrote:
>Hi Sasha Levin,
>
>Thanks for the patch.
>
>This patch breaks on RZ/G2L based on LCDC. See[1]

I'll drop it, thanks.

-- 
Thanks,
Sasha

