Return-Path: <linux-media+bounces-57379-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIJTOOcEx2nWRgUAu9opvQ
	(envelope-from <linux-media+bounces-57379-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 23:29:59 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F66934BF72
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 23:29:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D9C31305FC7B
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 22:29:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 037C337FF4D;
	Fri, 27 Mar 2026 22:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PjPYQUz6"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612282DCC1F;
	Fri, 27 Mar 2026 22:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774650575; cv=none; b=KbwsfyT0o9SZfj2AphUqwmDnAwc9mF7N3EG9qgmivFO3QfQNZj/l4ZevD/IzbMpY0bVKsPnDttmrfb8BTCUHnckc+JTpvHMKEz2Ya3L8/v+DzeVEzjXGSuxGiQ5/taLFAYo9Lva6gfooa2YxHzxjbWxAYHvVOnNCrX5VNGYfp5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774650575; c=relaxed/simple;
	bh=MWLSzIJe9AuKNoTo9mT6+5GhH3vrEtsD8Cd/U+3cTDs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R+M4Xblomf9vfYabpsrr6B8M4jqTby9Bad4w0z7aZCZo79iyJJQat3tuTDjstz6y1wrs4XCVgtiK2sarEQjNYdcBl6cEUMnCnXqr5Pdgn28wJTEIUJKxQ/c6B99iahlLgkfWc2M6Xh2s2o0KpCHD6kBj8kKABZC3kFh4IJIRdeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PjPYQUz6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1767C2BC86;
	Fri, 27 Mar 2026 22:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774650574;
	bh=MWLSzIJe9AuKNoTo9mT6+5GhH3vrEtsD8Cd/U+3cTDs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PjPYQUz6yI2+byIgjR4mCmN8sB4dNkkENbh7GYPimIFOMQaIdDN1P9IHf9oNV111a
	 7uE2uY8KAxwK1iGLV+sS+x7sIAUuk+8HT2gfkFhkjWGIETugCKa4N1/tk8ZR6Xngwm
	 gJZ+BnGQ/7Fux/PTune68NqBsWgNGz49+2LTt4ZcpCi5AVWI1c/V7fGTsPiU8vvxIr
	 4/lkMexAZch9uQOBGyjSibtIPsW5LuP38E3nkvbfOnw1GeCbEmULNI8q6Rn/kkaFiU
	 JpXTZs6lvEGUUM4B0r7Rr9RGCuCsXLKUe2znx4XOMVhtgs2n7YqZOA+H//LRnTy5xi
	 l/guDR+vq0O9w==
Message-ID: <556a6736-472d-4551-b5df-15e809e7e20e@kernel.org>
Date: Fri, 27 Mar 2026 22:29:29 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260326-x1e-csi2-phy-v5-0-0c0fc7f5c01b@linaro.org>
 <20260326-x1e-csi2-phy-v5-1-0c0fc7f5c01b@linaro.org>
 <72ef6c9e-feb6-4e57-b8cc-7801bd748698@linaro.org>
 <f1c8c412-1d27-4c83-8c5e-76b9369ea6e9@linaro.org>
 <VwCtoebjwHqLTucsrGruvBpedA4k-Melt7C0DA0aHSVld3PeotwZdtMUm3EFpvQyScrl6yejmLaK7bY1avT1zQ==@protonmail.internalid>
 <8ac55e5f-72ed-4331-bf42-92ccf97507dd@linaro.org>
 <5d7d5bf8-4420-4d75-b928-820bb9233e52@kernel.org>
 <CiKTMNVmEm3LXForJ4o-DjuXFxbKkiaLtqbFPYyA0rC-Ij0hJPmCw_LUixA-dZe2douOwy2Jxizna8qBRvUjPw==@protonmail.internalid>
 <2houacfdkozzk35ky5xtwe3utkvyx4lroyrhvibb5lg6lad2g6@56akvtqigaep>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <2houacfdkozzk35ky5xtwe3utkvyx4lroyrhvibb5lg6lad2g6@56akvtqigaep>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57379-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5F66934BF72
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 27/03/2026 20:51, Dmitry Baryshkov wrote:
>> That's just not true. If you read the camx source code you can see
>> split/combo mode 2+1 1+1 data/clock mode requires special programming of the
>> PHY to support.
> This needs to be identified from the data-lanes / clock-lanes topology.
> And once you do that, there would be (probably) no difference in the
> hardware definition.
> 
> 
> In other words, I'd also ask to drop this mode from the DT. This
> infromation can and should be deduced from other, already-defined
> properties.

It still needs to be communicated to the PHY from the controller, 
however that is not a problem I am trying to solve now.

If I can't get consensus for PHY_QCOM_CSI2_MODE_SPLIT_DPHY then so be it.

I'll aim for DPHY only and we can come back to this topic when someone 
actually tries to enable it.

---
bod

