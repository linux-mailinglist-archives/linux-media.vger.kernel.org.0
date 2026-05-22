Return-Path: <linux-media+bounces-62560-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFhFNTH1D2qXRwYAu9opvQ
	(envelope-from <linux-media+bounces-62560-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 08:18:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8F35AF71D
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 08:18:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D3F4306CFF7
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 06:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 791892BEC2E;
	Fri, 22 May 2026 06:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IatL2z3n"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB17B3A5E8A;
	Fri, 22 May 2026 06:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779430397; cv=none; b=iMF0Q2VQqqOabFpqeOR96di90KqXW5pZm3XIoVKQ+Y4KyLK6IzumdX7yMT3NqCkO9/r/jbMwqPiior4ttxRbVvMYffmyWNvSkfVPVj4c/3Ht78Cs/TlphXyZGVuJkbuB0PycAI6+0eaIVkFXhdjpN4peJrFFlWbhgELgksdxmJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779430397; c=relaxed/simple;
	bh=Xuc9JAwe5zavQS+Zr9vGqPUOL7Ggwn317on76PRjpkY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R9Zr+ErBw+0EMCBsENjRFIXq5sZlEepGaAgg9cuIRNEMlqOW6czxDjpnGdcYjwjRLI9mkXsZ/VbSzjoJDg42Y3+qtSk9Zc1mAUaLXpJUfJr54JGeCRgYYiZG2BKi8cLO4G3AU4hFx1kgm9+LnryuZGJ1hyNAmXbwBK9kgwTOSUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IatL2z3n; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFB201F000E9;
	Fri, 22 May 2026 06:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779430396;
	bh=ITSHk214OGqLKsl8976grlM4AytvNGliHKf6vpExiMA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=IatL2z3n70UpTzYpyZyNhqV6hutkxeUMrzcXJEuIcNjrEWmnU6CngjDYWgRHS55Ue
	 v5w2PgeaGKaUmFPNhjOLZaLo2PG7E3X6+fJdzPTMVXHUKsuQr3ke7GqS9UIDK/n15w
	 hS82F0HOcrn2fo/7HCR89UeF0GiQVUgXoKMl9Zn2I8DPlezLtuHRTH+GZpO74rntdt
	 CotQtDb8+fFPel8tOUZEfQPKXmINUsoHUC8hFHpeGbtHxQvyvHsGHsWlXtiexXDKGf
	 7XeGVgLNGhAs3wJh8qB2zftPeOnxhIZukXrD9VplwJkkW6HGv/lvaW6qN3bjy2ZK91
	 aqlzpLb89D8Tg==
Message-ID: <ea8ade58-9489-48f9-9883-f934869dceaf@kernel.org>
Date: Fri, 22 May 2026 09:13:12 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/12] media: microchip-isc: fix PM runtime leak in AWB
 work handler
To: Balakrishnan Sambath <balakrishnan.s@microchip.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, stable@vger.kernel.org
References: <20260518-balki-isc-series1-v4-v4-0-97f189185b7e@microchip.com>
 <20260518-balki-isc-series1-v4-v4-4-97f189185b7e@microchip.com>
Content-Language: en-US
From: Eugen Hristev <ehristev@kernel.org>
In-Reply-To: <20260518-balki-isc-series1-v4-v4-4-97f189185b7e@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62560-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ehristev@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,microchip.com:email]
X-Rspamd-Queue-Id: 3F8F35AF71D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/18/26 14:29, Balakrishnan Sambath wrote:
> Early return when streaming stops skips pm_runtime_put_sync(),
> leaking the reference and preventing runtime suspend.
> 
> Fixes: 91b4e487b0c6 ("media: microchip: add ISC driver as Microchip ISC")
> Cc: stable@vger.kernel.org
> Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
> ---

Reviewed-by: Eugen Hristev <ehristev@kernel.org>

