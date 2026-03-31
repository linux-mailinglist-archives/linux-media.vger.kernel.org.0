Return-Path: <linux-media+bounces-57747-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHVCKF6Ny2kuIwYAu9opvQ
	(envelope-from <linux-media+bounces-57747-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 11:01:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 429E93669C3
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 11:01:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1B5BF3038E17
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 08:54:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F10533EBF3A;
	Tue, 31 Mar 2026 08:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o98KCsge"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1E13E95BF;
	Tue, 31 Mar 2026 08:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774947263; cv=none; b=ebNTnFOu2DokUhqKH21DHAYUp5TO7JJFlc8kbWpJMJBIZF6v7c4aHIZ6leQzSdh4vxij+E2/gOM/Sn5YcS9YwLe9OZ6T+v76ihx1f6bihr8p7g+sFWBrrLY1tuZSPrrQDFHrviyowOwvVRlhZm0SBkA7EfWpUw8m7r+4tmm2c44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774947263; c=relaxed/simple;
	bh=4yxbnpdT4k4UP0bCfHs5KsqRuS2EEBa7W9Zg/dYv15Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XCzlzJTRlN3oZoFyjmXfo35N/HpgfgzU0PjsQ5wfDa7EamC8/ncI6CXFl6UJnSIS2qTImuFJfR8zkNK8a9R1xfF818KZahSQNlUEjSDV+cTVoiyx1cXp5Kb50TrkTo7ir1HtqVqH64tovhdgonqMb1Er5Xm8mjkLNzp8ubCAAWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o98KCsge; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35A1DC19423;
	Tue, 31 Mar 2026 08:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774947263;
	bh=4yxbnpdT4k4UP0bCfHs5KsqRuS2EEBa7W9Zg/dYv15Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=o98KCsgeUv/m4Ead0EPMvl8MU8Xopaoa5r+Em17KxlJO0NHqCAD7pR/1889wwAJte
	 1CJs15Jeed6lsAparq/1Dt/Pr5TSJ7xEyHmZCYMY1lFK2y1l+e+sJLEo/ikDbEWPra
	 iQ0+bZQtW6BWXUrPV/g0pmrmIxP0No2NOGg1MBdNDXQagwBkt3Mlm1ZuuMft4TogCL
	 YHO66F4wg9emud+SlcNOWm51yPtNHQ+JxqB8NEBWiC4jkjqea+W1781z596k4/sIAI
	 TFn1on9hAdptuHIWS8ah6nU13Gm8Q9qK0ZUVFmfujrHBVfsygi2JTBmjahG19XZHUH
	 jN0HWDOSGFd8g==
Message-ID: <df49abf9-39bc-4e2f-81f9-396a3be85928@kernel.org>
Date: Tue, 31 Mar 2026 09:54:16 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: media: camss: Add qcom,sm6350-camss
To: Luca Weiss <luca.weiss@fairphone.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260216-sm6350-camss-v4-0-b9df35f87edb@fairphone.com>
 <20260216-sm6350-camss-v4-1-b9df35f87edb@fairphone.com>
 <fe00906e-fb06-44e3-985b-3d0e95839e43@linaro.org>
 <0El9gr9FaXp_mP-0L6d1xxoH7NZE0u8uyDEj_cHQXFTBREUY1Tc9rgTHpIKCHUNEHrwDtEKYZXrPDgm7fj29AQ==@protonmail.internalid>
 <DHGREFP0IVZS.1HWJHNFTI50KZ@fairphone.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <DHGREFP0IVZS.1HWJHNFTI50KZ@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57747-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[fairphone.com,linaro.org,kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 429E93669C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 31/03/2026 07:38, Luca Weiss wrote:
> Would be nice if the camss maintainers were aligned so that contributors
> don't have to deal with mailing list conflicts over these fundamental
> things.
> 
> It doesn't really make it fun to contribute if you get conflicting
> opinions from two people that you should both value the opinion of
> because they're maintainer.

Yeah you're right and very much appreciate all the very awesome work you 
personally do all over Qcom and PostmarketOS, which I don't think you 
get called out enough for.

FWIW if we assume the proposed method of transitioning from legacy to 
new in Hamoa goes through, even bindings in the old format like this can 
benefit from new sub-nodes.

---
bod

