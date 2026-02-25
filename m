Return-Path: <linux-media+bounces-53342-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJ06A8QBn2lAYgQAu9opvQ
	(envelope-from <linux-media+bounces-53342-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 15:05:56 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A30198809
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 15:05:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC6B230D8629
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 14:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78C293D333B;
	Wed, 25 Feb 2026 14:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SBBCjwB7"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1253B8D43;
	Wed, 25 Feb 2026 14:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772028158; cv=none; b=cV7a3l01ntelq/lbumWahZ4xtKePlBgqCtZqaubuOyqsr4lX3EuOUYHcKfNy63xeIUHcaxZxKmlMiqKKyIvZJ9VqEMV8lCvFm7dnKOAt022sBSNq0Zmr0DXjqBRxKaf7shcTjDkTW2egeoH85mkpBFhv9aqPw92rfiRK7bO+SyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772028158; c=relaxed/simple;
	bh=cVA2ZB1hhEc1Ca+oFoNmHo1GyY9qK+vTY6cSvnAbShw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qyWPLJQ0UYWMrE+wgi4An2BEwJgKdwclfaHb344PCOwy4X+CDvF9X7+nZ4AS3JnB0v4DeHVBkqskVEi1EMtEX01ArJjTuuMdaAjktsZ1CHEEZY6qAe4UReDGvK3LwLfbUpuKgJGUyfayP5iTq3blTJQ9dk5kX3kfqBEM90fxJjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SBBCjwB7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED019C116D0;
	Wed, 25 Feb 2026 14:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772028158;
	bh=cVA2ZB1hhEc1Ca+oFoNmHo1GyY9qK+vTY6cSvnAbShw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SBBCjwB7CbAx6F/56V+WE4pYESWllG/pYXW/sRDaW47J7DFQpg3gRlP3rRDZtjlAJ
	 /rJR7G+l/CgyCf1JKh6urdL4IBb9fUdXt3YuciY3WIBsDnK0iokoDh2X3WUsimJIu8
	 c/dN3Hf+CDNS0zwmb9404bA/Khpx94Jsnf/hWtE5VubQY2cHU+u/Ndc0GnYr//3tan
	 VgRGf0dODGhnpRr4Pb8YBPEJFGdPrZDz6Z7PWC90f/cJXi00rIwQSAiX7QMi0+L3E9
	 iSCHlLut8gBEDDucAEBUxNWlQygj3drsE94tokbogszsFEilFIoOtIe+bmgWG7iq1k
	 kN8bhUHOUKl6g==
Message-ID: <f3943cc3-0dec-4636-bf7a-07c1785303eb@kernel.org>
Date: Wed, 25 Feb 2026 14:02:30 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260225-x1e-csi2-phy-v2-0-2f3770f660d1@linaro.org>
 <zqhLSyCfxxuX_pfkSbshBiz_4hzFu7Ew9ZQzavJd6eCyw_njvcPaMh8GkzQQ4GFYzMzSBjrXUyL-Sd6zIqwsog==@protonmail.internalid>
 <7c68d164-e2ef-4e2b-9ba3-9a8515128cc4@linaro.org>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <7c68d164-e2ef-4e2b-9ba3-9a8515128cc4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53342-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 94A30198809
X-Rspamd-Action: no action

On 25/02/2026 13:48, Bryan O'Donoghue wrote:
> On 25/02/2026 02:08, Bryan O'Donoghue wrote:
>> v2:
>>
>> In this updated version
>>
> Oops I typed "b4 send" @ 2 am instead of "b4 send --reflect" this series
> isn't quite ready yet.
> 
> Please ignore.
> 
> ---
> bod

Ah... I see I'm talking to my "b4 send --reflect" :)

Never mind

---
bod

