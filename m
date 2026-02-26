Return-Path: <linux-media+bounces-53451-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIcJNX0ToGlAfgQAu9opvQ
	(envelope-from <linux-media+bounces-53451-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 10:33:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDD41A3735
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 10:33:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 670CC3190603
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 09:27:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E451F3ACF03;
	Thu, 26 Feb 2026 09:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KqG7Dblz"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DECF3A0B11;
	Thu, 26 Feb 2026 09:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772097882; cv=none; b=kDfUNCgbzUUiPZ5Jgw6lDmux9oyCAh/IC719aM/9k+dQXp7FWoP8fQQdXn3jobMd240ov+XhTfDHH+FtqyxU6G4cBGPTkzBUoDuEbYvWVFicAlJCgC8zEIj4qLXgu9yTnpRwu5KOQQYlsfmA85Gd2GnO8ol6YBUA8oMPUGtXtuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772097882; c=relaxed/simple;
	bh=+HlDIfQTFe7JijL+y8VhEYmtIk+2cPoizKDQH8OiFYE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t7D00xlDWgnfx9jKAAd5KSyUri6y/mK5g1CsrZ8HDEB1N8jH1POdES1bYlVV1AffAtmAkLD3IqWRaFLl7TnA2BxJIxV369q2tc+whaAVuFIc7x7Z0uT0s/niEATCJYKyvi4NqNkIRXZ5VJ1Ht8Q0r004sgsTgT+EqlLLnefE7h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KqG7Dblz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CCEBC2BC87;
	Thu, 26 Feb 2026 09:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772097882;
	bh=+HlDIfQTFe7JijL+y8VhEYmtIk+2cPoizKDQH8OiFYE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KqG7DblzGOe0N5tVI96EgLFanIh7ZNJk0mtkhSiIRTkfm3Y5JfVXWohQu6yeXs3Yj
	 qZ7aiH6ABrn1FUIgdyhRgJoOSxkMd5ItVrR1jVotOPjb8n2jdOEaRPazAUQ05aRD9o
	 ntzVKbZu8TTJYmSiI7Ba/q4dox9pBszZxSVLtAuXo5A1VoDEnCoRNCwTf4Hc+9m1GF
	 ekOQj3v8pyJ5wY7eSUwuTdh9TJdDLLQRQILZJDiouaUEfMw496BVSMU2/Q6SbHzD2T
	 vZZ87qIPugS+3XVpC1W1C+2b0pOz7bwpxfmXaSjLoDO+iYIpLJtk3Lq9O9OTNg1ngx
	 3MAfAjhRW+nvQ==
Message-ID: <2665866f-e967-40df-a25c-1492cb707291@kernel.org>
Date: Thu, 26 Feb 2026 09:24:34 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260225-x1e-csi2-phy-v2-0-7756edb67ea9@linaro.org>
 <20260225-x1e-csi2-phy-v2-1-7756edb67ea9@linaro.org>
 <COPUC-lLe0iAFFCqJTMGY3idnIh0jPeFqrYbv2L3rajjyS_x6XxJNzmzu3iXcaAGJI0aNgEho1qlYd-PHxU2jw==@protonmail.internalid>
 <20260226-carmine-cockle-of-prosperity-b6baf2@quoll>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20260226-carmine-cockle-of-prosperity-b6baf2@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53451-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8DDD41A3735
X-Rspamd-Action: no action

On 26/02/2026 07:37, Krzysztof Kozlowski wrote:
> On Wed, Feb 25, 2026 at 02:59:12PM +0000, Bryan O'Donoghue wrote:
>> Add a base schema initially compatible with x1e80100 to describe MIPI CSI2
>> PHY devices.
>>
>> The hardware can support both C-PHY and D-PHY modes. The CSIPHY devices
>> have their own pinouts on the SoC as well as their own individual voltage
>> rails.
>>
>> The need to model voltage rails on a per-PHY basis leads us to define
>> CSIPHY devices as individual nodes.
>>
>> Two nice outcomes in terms of schema and DT arise from this change.
>>
>> 1. The ability to define on a per-PHY basis voltage rails.
>> 2. The ability to require those voltage.
>>
>> We have had a complete bodge upstream for this where a single set of
>> voltage rail for all CSIPHYs has been buried inside of CAMSS.
>>
>> Much like the I2C bus which is dedicated to Camera sensors - the CCI bus in
>> CAMSS parlance, the CSIPHY devices should be individually modelled.
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> The entire point of separate CSI PHY was to change new devices. That's
> why I was postponing TWO new bindings. There is little point in change
> existing bindings, it's just a lot of work with little benefit.

Since the x1e dtsi isn't upstream yet though.

> And the beauty is that you did not even had to do the work yourself,
> because the contributors of new device would need to come with CSI PHY
> split.
I mean I'm happy to do that work myself, idle hands make the Devil's work.

?

---
bod

