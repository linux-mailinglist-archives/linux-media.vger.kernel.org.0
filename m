Return-Path: <linux-media+bounces-66283-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AqaBKceaRWp5CwsAu9opvQ
	(envelope-from <linux-media+bounces-66283-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 00:55:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 410736F2310
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 00:55:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=LUg5l2oP;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66283-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66283-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AE5AD302BB84
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 22:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E574F3F0A94;
	Wed,  1 Jul 2026 22:54:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EB4394EB7;
	Wed,  1 Jul 2026 22:54:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782946496; cv=none; b=GtuoJHzXp3KM+3QWHg7PWQqDuaOD+Na2hm8xeiqfqF2D0YDX2g/u11IXS9az0kKT5y2jX4Xqdg3r17Na99H9NSrM0xR592j3eQ8xdHC7TMNRaCgqhpdSRm+3Sgf6vcJsHv4jLY2yr5bD6VSaP2rFI+G/6WxpBcthjZrjlK+2KCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782946496; c=relaxed/simple;
	bh=Hmhi7qmI0mpVAxORw9kd/1Iwks7PvSNMTfZfNZK3ueY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L+O8cho0oXxUTvKDs7xRmZJSFjISs62FflqLRVX4DypOydCA50dqoj6NEPSokc6KhXh3KycOrmr994TWB3hZeRhzr6VB1YgFJJNi8AUojqJqeP2Jovou+452/K/Pwx2JAJvOQwyhZ2YKoHq69ZRe8+nxbI/I8KzflzN7bKh2fcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LUg5l2oP; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 969221F000E9;
	Wed,  1 Jul 2026 22:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782946495;
	bh=MVGGFAevLvBp9L77WVpeD2HDmtuvw1sCo9+wekarTRc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=LUg5l2oPGoHK0R5ooHKHBGPlb3cgWORlAtAZAdsZEDVVYH5aj4rxRJkLCAgqVsxK/
	 1XBEz0D3RzZZQ/xbEouvFnc+mml0c8f7ca1ZcZDCHiksc+cY/hjwUaGQYiShAG5aTF
	 oOVflm3gwYbA1uSxxihGlqwh/UUuihrW3sELSjBLyAWTMsG9/Ll4pW+pzmzAJXNWpc
	 VEAdWhnY8AUZFtUiBAJQGDzuP7Dhn6O53yaNnPPRoF84XrBretBu/HAL4guOP/oM//
	 yG2nfa2nSN3osttnHgQjQo2kKw/T7JUoGpSzRbGq5AY1KdSFD/yLkFvpcgGZBQbjqg
	 /OsQ0hvHbtv7Q==
Message-ID: <7c564df8-5c5a-4b43-806e-5e017e5c51db@kernel.org>
Date: Wed, 1 Jul 2026 23:54:51 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org>
 <20260523-x1e-csi2-phy-v8-1-a85668459521@linaro.org>
 <rpnNMsR9GY8gbynzeBO8Zm61JAOq3ubt6sp0x3WDPPwkMAJzlcofECD1kabN-IUoK6sSwP5P6l28UIZLFCOpjQ==@protonmail.internalid>
 <dda32577-04e0-4507-acaf-a5694f4f31b3@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <dda32577-04e0-4507-acaf-a5694f4f31b3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:vladimir.zapolskiy@linaro.org,m:bryan.odonoghue@linaro.org,m:vkoul@kernel.org,m:kishon@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-66283-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 410736F2310

On 02/06/2026 22:59, Vladimir Zapolskiy wrote:
>> +
>> +  "#phy-cells":
>> +    const: 1
>> +    description:
>> +      The single cell specifies the PHY operating mode.
> #phy-cells should be 0, because the PHY operating mode is well defined
> by 'bus-type' property of an endpoint on the sensor side, the opposite
> side of CAMSS/CSID as a CSIPHY "consumer" should not dictate the PHY type.

So going through the list I don't believe this is correct.

Inserting bus-type into the PHY layer is borrowing from one domain 
linux-media and pushing the concept into PHYs.

phy-cells = 1 with CPHY/DPHY specified in the consumer, as was Rob's 
suggestion will specify the mode.

Then to understand if we are in regular or combo mode, we parse the 
ports/endspoints in the PHY node as we've agreed already.

---
bod

