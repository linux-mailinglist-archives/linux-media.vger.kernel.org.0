Return-Path: <linux-media+bounces-58843-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNk+IS0M4GmzcAAAu9opvQ
	(envelope-from <linux-media+bounces-58843-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 00:07:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1804086E6
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 00:07:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E635F306B0A1
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 22:07:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB8AE33F5AC;
	Wed, 15 Apr 2026 22:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dTvNuVKv"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF3117A2EA;
	Wed, 15 Apr 2026 22:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776290833; cv=none; b=ZbrregYoWAN4I0ApJM647I6KXpH/k52AK2y6QMfh62v9en+qXtl6DZjkBiQRCw5OhTsml0aDQh+FrBnHZYMuDsSngdLSz1w10RvBBfHHFKxYy2wZxRbUnA7TsS0TYSH6G0YFFopK+g7HuK8d8x0DkLl6q4WqNa35bnEkbFiMMkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776290833; c=relaxed/simple;
	bh=BBBQ9gbHiCf9xaemK5ba58xuP5YK+2O+OVL7gV1vBkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EsPjy7eyZiF5zaMgmHCSXuBa/dow2R1lL7WUDb1ZpJzt5L+lJXGZsqn/O1xXTQb5oBorTmLisZvrZ+ICqvOnyY81ZeqKcdJMF9bvsH6mOi+lIrXHptJDLa9GaWpeM+pCZlI/wZtvRLccjT/xjSa7iHLJShdNYssFgflxhGosFgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dTvNuVKv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1364C19424;
	Wed, 15 Apr 2026 22:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776290833;
	bh=BBBQ9gbHiCf9xaemK5ba58xuP5YK+2O+OVL7gV1vBkU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dTvNuVKvICGgkyw3qzB5rHvvXx0bxMcuuxfo4X+/1XMEExI5grXgrZ54q7UNFPFzl
	 izrFP+9gXvH1HWDP5hHyiwx2I0FtBEXVhIZCHBWGo3lnWGSSodRghrglfCKaRAIOSf
	 kqzAGqmJr5LvSi7ut2OpnwTXMQqWAXmuui0jXPptwRFd1BJxV+SywqRJssg4qlYwaN
	 fOkrmnmz3PLImO92xPw41Lzg7gcGBruzzJ6Cb/fVi7nc1XhuK/RS9RBSL81exU5ufd
	 uAci/PRRfLT9dHnTgXVSnal8xCfoDOM3DdnbRxrVnKrG5isNz1/TjhLeaqUhB0ERu4
	 +2Thjh+jSHH+w==
Date: Wed, 15 Apr 2026 17:07:10 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH v1 1/1] dt-bindings: media: mt9m114: document common
 video device properties
Message-ID: <177629083018.750921.11968530700134617704.robh@kernel.org>
References: <20260406081330.30362-1-clamor95@gmail.com>
 <20260406081330.30362-2-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260406081330.30362-2-clamor95@gmail.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58843-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0F1804086E6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 06 Apr 2026 11:13:30 +0300, Svyatoslav Ryhel wrote:
> Document common video interface device properties, such as rotation and
> orientation.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../devicetree/bindings/media/i2c/onnn,mt9m114.yaml          | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


