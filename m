Return-Path: <linux-media+bounces-65225-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CS0FG0IaNGpXOgYAu9opvQ
	(envelope-from <linux-media+bounces-65225-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 18:18:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C41C86A18D2
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 18:18:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=HAayLFgE;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65225-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65225-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6D7A33022F70
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 16:13:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28770338593;
	Thu, 18 Jun 2026 16:13:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD043019A9;
	Thu, 18 Jun 2026 16:13:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781799225; cv=none; b=FKnIgQiuRNXi9bpSo6aac+94hC4DcvDCoWciNELRAs8HxZVto62IVxtkKtdMlimUvnWt0AooB+FuSWVoed6cNh5u9KhsWUwVutvV+aNgmf3BfpN0pwbW+z3JmYMEIchdq6C4IeWgtNgN4qk2UpDkeQuAPqu8U4dXjsmw4v2zUIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781799225; c=relaxed/simple;
	bh=lItjWW11zxqs1KGyqED566ZFOB6SK9KDPXkew/KKm7s=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=mpTwFuCIiWV/Bobh2jM+w1/5LELvEuD0TX8N94WxViHBTESBDgv5hHUtLN+q6960x9kBj4YBTcUp9o2QMbJYRbQ/l8vnYB0ckgOefK/5R6J/qkBWsMko+Dyn+tRYAbiTVnWWwik5pGeYaaxUCH1xzvuKYrvWAQIL13oJUfgtEyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HAayLFgE; arc=none smtp.client-ip=213.167.242.64
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8BF608E0;
	Thu, 18 Jun 2026 18:13:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781799186;
	bh=lItjWW11zxqs1KGyqED566ZFOB6SK9KDPXkew/KKm7s=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=HAayLFgEqJc94QMUxH61juKC7+uYjGLIxF8+9GG59ZgpNMswhIBigTcpF/p8dZkKb
	 ywFpqCVO/Gd0jzP5pR9eSsZnnNMxCHFP2tXQ4s8XSc/8ITvz9qwxCBdgosZ+dqyHbR
	 nOCJFPBHiSTRzMuMTJeMZuD5WHIaGC2BYgwkFHBM=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260618-ov08d10-fixes-v1-1-d090ce2abe8c@emfend.at>
References: <20260618-ov08d10-fixes-v1-0-d090ce2abe8c@emfend.at> <20260618-ov08d10-fixes-v1-1-d090ce2abe8c@emfend.at>
Subject: Re: [PATCH 1/2] media: i2c: ov08d10: unconditionally use the startup delay
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Matthias Fend <matthias.fend@emfend.at>
To: Jimmy Su <jimmy.su@intel.com>, Matthias Fend <matthias.fend@emfend.at>, Mauro Carvalho Chehab <mchehab@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Thu, 18 Jun 2026 17:13:38 +0100
Message-ID: <178179921887.861173.158444882721737204@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65225-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:matthias.fend@emfend.at,m:jimmy.su@intel.com,m:mchehab@kernel.org,m:p.zabel@pengutronix.de,m:sakari.ailus@linux.intel.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[kieran.bingham@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kieran.bingham@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ping.linuxembedded.co.uk:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,emfend.at:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C41C86A18D2

Quoting Matthias Fend (2026-06-18 10:31:12)
> Even though the datasheet does not describe the timings for operation
> without a dedicated hardware reset, it seems sensible to wait for the
> "XSHUTDN pull up to SCCB start" time even if no reset line is available.
>=20
> Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
> ---
>  drivers/media/i2c/ov08d10.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/i2c/ov08d10.c b/drivers/media/i2c/ov08d10.c
> index 9adef5446a61f3204fb809ca3f077c1afb5f7a47..cb7e55b168781dfeaae553734=
d24208a374fce9c 100644
> --- a/drivers/media/i2c/ov08d10.c
> +++ b/drivers/media/i2c/ov08d10.c
> @@ -1358,11 +1358,11 @@ static int ov08d10_power_on(struct device *dev)
>                 fsleep(5 * USEC_PER_MSEC);
> =20
>                 reset_control_deassert(ov08d10->reset);
> -
> -               /* Delay from XSHUTDN pull up to SCCB start: 8ms */
> -               fsleep(8 * USEC_PER_MSEC);
>         }
> =20
> +       /* Delay from XSHUTDN pull up to SCCB start: 8ms */

8 ms seems like a long delay at startup... but it was preceeding this
patch anyway.

If there's no hardware reset line, then I'd expect the module to have
tied that in - so I expect the delay is still required too.

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>


> +       fsleep(8 * USEC_PER_MSEC);
> +
>         return 0;
>  }
> =20
>=20
> --=20
> 2.34.1
>

