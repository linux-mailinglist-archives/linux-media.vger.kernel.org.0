Return-Path: <linux-media+bounces-67704-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3wl4KJieV2oJYAAAu9opvQ
	(envelope-from <linux-media+bounces-67704-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 16:52:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C1F75F985
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 16:52:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=BXa8YwXL;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67704-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67704-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F7C030207FF
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 14:39:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69FA2396B9A;
	Wed, 15 Jul 2026 14:32:53 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28FE395ACF
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 14:32:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784125972; cv=none; b=Lb9iYZHsSFmMUClYZWuCdXUEWAbuevch+pB0Jm6Fe2jF0sUq65XAAM0cj3lUSzjYcPUdHX2+87GCYV0VD5RNRS8eWIdV2YWICkzy+2WOsefZEK1NgAdBQOaNRZpDpvx6BNq53zD1xhKzAT4nd1q+wzleYwUbYecfZoAwp3hKbiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784125972; c=relaxed/simple;
	bh=IsQDPxhkVVGb8strcjQSvHI2Ldh9XJp9MtvCTQ1DfVQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uVNJuTMBxSx5ZBK6PgRSVsGtxU/5ZS2DPemETAC+ti6Rmh2z+ab1d2O++0QPRQ9LXnN5/ZkwI4USl3ElaY5jkCTpvnhDN45Lno0NN5+NJyvOI2GO1ilz8ZLgQH1eYEjxBJnlz/zHcvlM+fxqENJQbB1HsdsTrPteDlgmnqNVr+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BXa8YwXL; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E33F1F000E9
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 14:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784125971;
	bh=UV+M33Dyarx/zMVxzM/yyyGSeCPkNh0N0c4OTwo8lhI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=BXa8YwXLalEW+/YsOM74inF5ZtiUaQRuuspeOoLwfSnPux9T99YthXgONclCODJeX
	 JDj28dfryVCmBSiMzXq0yqes8uJf1G5G+7Y2hQ7qD9+g9/yi1AXnriKVXlEue935/k
	 Lez6HGkofZqtlMDs4GnCn3DEpRvlDkFEvNrX1dMcLNjOLtGMmglFweURumWfujrQBy
	 4fl1wr7dfbkspnmNOpy7HFS6H39MrAoE9sdr7iYbJ0/jFbGg6W3Ded2lSZyhirXwK2
	 9X+DruaLeymCd1XbcmOugrmDgANSWlr4TOUtSsIBdfBYQVWHUByx0GBU8zhG8DxA+q
	 mBBsPPwgY1xig==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-69c7697d523so622223a12.2
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 07:32:51 -0700 (PDT)
X-Gm-Message-State: AOJu0Yx66SLp9PybvynSA+zrAzOfDVdzc04OSDd3FLrVnLMigyWqPbCU
	9RtHRLoI5nDA9bA3hUvWDROjNgtPgRQ1MmwtjEtBpLpImQBTOABYpbmo07GWaW25CYHK6FEM/Ah
	1JthojVOExggrd+uAE47D1Y4xneEOGg==
X-Received: by 2002:a05:6938:a08e:20b0:c16:8931:245c with SMTP id
 a640c23a62f3a-c16893125d4mr19153966b.21.1784125970173; Wed, 15 Jul 2026
 07:32:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715135711.605907-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20260715135711.605907-1-sakari.ailus@linux.intel.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 15 Jul 2026 09:32:38 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK4CJAuiqOo6qoRgQRkur2sAmaCFQdny0rX5j6jVDr2gQ@mail.gmail.com>
X-Gm-Features: AUfX_mxmhccaSPpaHhLPzBtndkIPaQ402NCXW0P8OR1HbKYXiSYB6ZWkwht-Upw
Message-ID: <CAL_JsqK4CJAuiqOo6qoRgQRkur2sAmaCFQdny0rX5j6jVDr2gQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] dt-bindings: media: i2c: Add Sony IMX678
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Jai Luthra <jai.luthra@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67704-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:jai.luthra@ideasonboard.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-media@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,intel.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E8C1F75F985
X-Rspamd-Action: no action

On Wed, Jul 15, 2026 at 8:57=E2=80=AFAM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Really add Sony IMX678 bindings this time. Those were accidentally missed
> from commit 447ea0c26e57 ("dt-bindings: media: i2c: Add Sony IMX678") eve=
n
> though the original patch included them.
>
> Fixes: 447ea0c26e57 ("dt-bindings: media: i2c: Add Sony IMX678")
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../bindings/media/i2c/sony,imx678.yaml       | 130 ++++++++++++++++++
>  1 file changed, 130 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx6=
78.yaml

Acked-by: Rob Herring (Arm) <robh@kernel.org>

