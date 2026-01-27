Return-Path: <linux-media+bounces-51629-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPWXCo6deGm/rQEAu9opvQ
	(envelope-from <linux-media+bounces-51629-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 12:12:14 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50356936F0
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 12:12:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A5D393006803
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 11:11:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE1B930BBA5;
	Tue, 27 Jan 2026 11:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rWE4h7DP"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506FF32ABCF;
	Tue, 27 Jan 2026 11:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769512310; cv=none; b=W5yH0J/4o91x3rHhAWKTN5UBrpRy0PM74G1bfa2jWu8oIK76ZticU5jNP+i8C9JXdOE7bbrwVYM6emtQotO4CZdEYe5YDeZBpzcf3uutIqkMtckHf5NC7W8ZR11BdqNIzSx6ITp2oWCBtgEIf83R7RMuxZRvoGBdmVgfiQuISWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769512310; c=relaxed/simple;
	bh=NDYsZt5CfVcyvgvSjasOZPmyjud+vNg6Mk4ZZh9jMcY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QWVhzTM5t85VdzTgjEMKG5fsgG/Brk5bXnNN4xigGVXR5KEOIeABwMr8g7xV2ebrs8yRkMQUrs2Kn7W8oiCz50R0bZPU3h2Tt6HY8D4FwTRB0UMERuQr6Jcn41HFdB99/tvhfapu8SNDBxoWtnsfrV20achr4owIi2m0qCE1xiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rWE4h7DP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A92D4C116C6;
	Tue, 27 Jan 2026 11:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769512309;
	bh=NDYsZt5CfVcyvgvSjasOZPmyjud+vNg6Mk4ZZh9jMcY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rWE4h7DPQWl1lHNE+1wGQJUTAJ9sGYDjxkBK/K5VyimNdjMJsGVhjQF/eAfOVWuhy
	 i2zKe159J53m6rpaHjGJiKu5oIbmltJi2a87qL3VTg67trQHfZOuSG+Iuyq32jFLkr
	 1UlsTGVX+ri2LnRZt6KkwO091gEsU2bQLR1F15eKmsTTcMli9LqUI0ukSakQvGVeB0
	 60M77nc64RKYAv0d9G5iBQUzSQfRTcRWvcE13ixs7WNGpF6C42SuE5lmrcjvjQLslE
	 8W/4v4DPy6CtDk1MxipP2SWCmKP06DbxEjFlJKHAXuX1l9lGUiYI28NDZhYFm5K/+U
	 rpWMAxSQGVExQ==
Message-ID: <cb902c4e-f7b9-4d70-a997-1e84c90ea18b@kernel.org>
Date: Tue, 27 Jan 2026 11:11:45 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] media: i2c: ov02c10: Use runtime PM autosuspend to
 avoid brownouts
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Saikiran B <bjsaikiran@gmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 rfoss@kernel.org, todor.too@gmail.com, vladimir.zapolskiy@linaro.org,
 Hans de Goede <hansg@kernel.org>, sakari.ailus@linux.intel.com,
 mchehab@kernel.org, stable@vger.kernel.org
References: <20260126173444.10228-1-bjsaikiran@gmail.com>
 <20260126173444.10228-4-bjsaikiran@gmail.com>
 <900cc5dd-c39d-42f6-9531-016f62da81e8@linaro.org>
 <CAAFDt1tsyvtAa84bFK2Hq5yG_F15SUUseBd5Xi-DB8GnUj7+7A@mail.gmail.com>
 <aaab1d32-9375-47d2-8524-e80e076b864e@linaro.org>
 <CAAFDt1vKn5ssoTQZduGKb5eOeN74P=FVk9f01go1d-JS71Zt0A@mail.gmail.com>
 <clmeor0Z59Dd_ymBj-m2zE0orMOFgVsPFXUBpBx39ZehM4t_GrlZV8y8f-lZbH6p9N-W7FLs7PqYhfG6VzwmBw==@protonmail.internalid>
 <571cd869-847f-4697-ace3-503f123e8486@linaro.org>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <571cd869-847f-4697-ace3-503f123e8486@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51629-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linaro.org,linux.intel.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 50356936F0
X-Rspamd-Action: no action

On 27/01/2026 11:06, Bryan O'Donoghue wrote:
> So, SPMI is not exported in /sys/kernel/debug/regmap - however
> 
> drivers/regulator/qcom-rpmh-regulator.c
> 
> Lets add this to probe
> 
> unsigned int val, i;
>       u16 bases[] = {0x4000, 0x4300, 0x4600}; // LDO1, LDO4, LDO7
>       const char *names[] = {"LDO1(1.2V)", "LDO4(1.8V)", "LDO7(2.8V)"};
>       struct regmap *p_regmap = dev_get_regmap(dev->parent, NULL);
> 
>       if (p_regmap) {
>           pr_info("--- OV02C10 PMIC RAIL DUMP START ---\n");
>           for (i = 0; i < 3; i++) {
>               // Check Config (Active Discharge)
>               regmap_read(p_regmap, bases[i] + 0x41, &val);
>               pr_info("!!! %s SEC_CTRL (0x%04x) = 0x%02x (Bit7: Active
> Discharge)\n",
>                       names[i], bases[i] + 0x41, val);
> 
>               // Check Status (Is it actually on?)
>               regmap_read(p_regmap, bases[i] + 0x08, &val);
>               pr_info("!!! %s STATUS   (0x%04x) = 0x%02x (Bit7: VREG_OK,
> Bit0: VREG_ON)\n",
>                       names[i], bases[i] + 0x08, val);
> 
>               // Check Pull-down config (Secondary check)
>               regmap_read(p_regmap, bases[i] + 0x42, &val);
>               pr_info("!!! %s PD_CTRL   (0x%04x) = 0x%02x\n",
>                       names[i], bases[i] + 0x42, val);
>           }
>           pr_info("--- OV02C10 PMIC RAIL DUMP END ---\n");
>       }

Obviously only do this for PM8010 for the other RPMh which may not have 
this offset.

---
bod

