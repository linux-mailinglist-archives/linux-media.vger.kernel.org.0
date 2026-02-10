Return-Path: <linux-media+bounces-52501-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOcCJGL3imkzPAAAu9opvQ
	(envelope-from <linux-media+bounces-52501-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 10:16:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF19118C34
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 10:16:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DCE8730495DC
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 09:16:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 986F333FE2A;
	Tue, 10 Feb 2026 09:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zgn3BGaH"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049D733DEF3;
	Tue, 10 Feb 2026 09:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770714966; cv=none; b=Bo3NVWLxR/X0SXwGGWpvRiyRxaIsMOe3ifjQV79TTQyrFhpcUmEWcjWzUbhS4HELd2b2nVCfFPtLv9YH30pSzjhSxp//IxP2jeN6JxKE20VyF63qUPg5uu5rVN3WJSmn5YrY3vEZ/lNQKOum63H/6DUNwIbmQ9ANZCV3fXlVS4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770714966; c=relaxed/simple;
	bh=+Gj0PuAu6x4gpCLNLJvYi3RsM71mImFjSjrkkfQ6Z+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dY+OlA40n4C5prtnkZwwY2/ut6LIKls8p4lnL9RrXcPCf68QnJ42cpk1zby5VLAaCnPX/8yCdGjvLX2vvn4aEH9AklU5NNYayEPJCkVdBQsMiazLhDX9HEOFrVXW0vt7/iy7V4sSJt+u60RrkUjGw7EbFGfDmLn7vJAguLPyrLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zgn3BGaH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5727CC116C6;
	Tue, 10 Feb 2026 09:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770714965;
	bh=+Gj0PuAu6x4gpCLNLJvYi3RsM71mImFjSjrkkfQ6Z+Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zgn3BGaH81TUIwJmyrVbee0N1HaM1zRXoy9MlDRrgJyyfBShipSJop533nWZXNPbM
	 pzrcz6x0tUXBbbgGrekqT9wnHDvqRiH4qrX663Xl6NRYUCdyQZKqMrT1IWbcusn8E2
	 N2rzKeygJhQ5SUgG1Sgq3HFF2jnsbRwtUBj1AjADJGGD5oxo5fJUrlnUbjRfIQO8gw
	 3sFdoLb6lat2oENmxat4i1db5iYy1ExAdD/fUzhH44Esqq0KZ4ddmWKVCgezRzhllp
	 1suYteW6GoiiG6EVgIUkaM0KlbeEdRU+yY0+Wz/On70dikBjVJDPgWDrJtqXSZalW8
	 LRazL1NfZHOoA==
Date: Tue, 10 Feb 2026 10:16:03 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
	Todor Tomov <todor.too@gmail.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Robert Mader <robert.mader@collabora.com>, 
	David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org
Subject: Re: [PATCH v8 1/7] dt-bindings: media: qcom,sdm670-camss: Remove
 clock-lanes property
Message-ID: <20260210-impressive-jerboa-of-contentment-edfd32@quoll>
References: <20260210020207.10246-1-mailingradian@gmail.com>
 <20260210020207.10246-2-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260210020207.10246-2-mailingradian@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52501-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,intel.com,linux.intel.com,vger.kernel.org,collabora.com,ixit.cz];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: EAF19118C34
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 09:02:00PM -0500, Richard Acayan wrote:
> The clock-lanes property has no effect on the hardware configuration, as
> of 336136e197e2 ("media: dt-bindings: media: camss: Remove clock-lane

Please run checkpatch.

> property"). Remove the clock-lanes property.
> 
> Suggested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Link: https://lore.kernel.org/r/bbf0dcd9-d0f2-49a6-a2f2-6ec9376f2f59@linaro.org
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>

Best regards,
Krzysztof


