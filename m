Return-Path: <linux-media+bounces-53454-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UAT9K/AVoGlifgQAu9opvQ
	(envelope-from <linux-media+bounces-53454-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 10:44:16 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 736951A3A7B
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 10:44:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BBB1A3201B2A
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 09:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D665530E0F2;
	Thu, 26 Feb 2026 09:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rd3AndDq"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DD928726D;
	Thu, 26 Feb 2026 09:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772098262; cv=none; b=FiQyrZqd/xudDx3TYIFCQLa9p5cl1J7iER2tqHgTlZSLmfv+OB5QmANuMNnO7eloMdXHUVBkEZ4eqoghLoyN3wdj3uVENH18VOtLyGF/2DylibEaYwnVpzg2EbhLQ6Gy6OQxmTden0jKZZiAnM7XFC5GbQR6QKrlHvzQzNoNAZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772098262; c=relaxed/simple;
	bh=29VEOAf25ZnbF45QCN3iowfs6rIMIA+CeItgSipJ6I4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ca8gq5JEO3TW50z1/Jb1CFutMmlCwW8cIicmfHrlecpkqwfD4uXK3UQSWrVge19l62O2EHRcrNNSXljZkWKk8Nyik3hRrZvDgM/krVb4ka9nWgRMY3+i0YDjnIZwnqzGh7FtN/QLK8Yqh6/IeoIY7+omjdvy8n8xa7S8+dJAh4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rd3AndDq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61010C19422;
	Thu, 26 Feb 2026 09:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772098262;
	bh=29VEOAf25ZnbF45QCN3iowfs6rIMIA+CeItgSipJ6I4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Rd3AndDq9Ow7Ad5x//ewISraAgcAtQq+OJrHQNbFuCJrjOp4FNr5bP2rIzm/6QUXD
	 9vWWxbS1T/0QmM72gf569NXUAg5h9rcSyGznzenL+Lzw/1C1Wy7+0hINdNyNE/cuM/
	 RkrZHTGoeX3Mk0GShMXSX82r3nPhtAtwRH+IL/j5TKKmkOLjVevHQXwYb6592HwL4v
	 sGYTuvkoISdETBPYyTk+oPmFOFrHqLYyTcsa5ytK8SnI6Vl6b9kRY0Rn+yqXt872Ff
	 DrWKV69oQQBqtVvq2mzCWv9aqRLcvMFeBiF5zwJKE+otI9V6QKhdVp07SFMPJCINLr
	 EMyoSNAn3yJvQ==
Message-ID: <d28d9110-4b51-4732-8cc2-b389ba068e86@kernel.org>
Date: Thu, 26 Feb 2026 09:30:56 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 10/18] arm64: dts: qcom: x1e80100: Add MIPI CSI PHY
 nodes
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
 <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-10-95517393bcb2@linaro.org>
 <-aFhVZI_TELwIThx5MiGBdSa_SX57jDQwkx5Ok4Y7OFJnrTll6svcluFDaoV5oXCAAHCn70h4xEApf8mkvZzyQ==@protonmail.internalid>
 <20260226-shaggy-nyala-from-jupiter-7abe18@quoll>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20260226-shaggy-nyala-from-jupiter-7abe18@quoll>
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
	TAGGED_FROM(0.00)[bounces-53454-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ace4000:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.1:email]
X-Rspamd-Queue-Id: 736951A3A7B
X-Rspamd-Action: no action

On 26/02/2026 07:11, Krzysztof Kozlowski wrote:
> On Wed, Feb 25, 2026 at 03:11:27PM +0000, Bryan O'Donoghue wrote:
>> +
>>   	qup_opp_table_100mhz: opp-table-qup100mhz {
>>   		compatible = "operating-points-v2";
>>
>> @@ -5543,6 +5562,102 @@ cci1_i2c1: i2c-bus@1 {
>>   			};
>>   		};
>>
>> +		csiphy0: csiphy@ace4000 {
>> +			compatible = "qcom,x1e80100-csi2-phy";
> 
> There is no such compatible documented in the kernel, nor in this
> patchset. Either you combine DTS into driver patchset to solve this, or
> don't combine DTS at all. DTS cannot go via driver tree.

"b4 shazam <change-id>" should work since

Depends-on: 
https://lore.kernel.org/r/20260225-x1e-csi2-phy-v2-0-7756edb67ea9@linaro.org

appears in the series cover, I don't know of any good way to add that 
type of dependency link into a patch.

---
bod

