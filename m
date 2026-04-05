Return-Path: <linux-media+bounces-58075-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAalBAfG0mk0awcAu9opvQ
	(envelope-from <linux-media+bounces-58075-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 05 Apr 2026 22:28:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B187B39FC23
	for <lists+linux-media@lfdr.de>; Sun, 05 Apr 2026 22:28:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6069B300DDC0
	for <lists+linux-media@lfdr.de>; Sun,  5 Apr 2026 20:28:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6217E38236D;
	Sun,  5 Apr 2026 20:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R3pRAqS5"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1582BF002;
	Sun,  5 Apr 2026 20:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775420916; cv=none; b=V8Hu5bGGP8M7IXTNxXpj6caSF6bMHEAwKuX0VdMUi949gRjaGwTEqGUZZcrRqmCLGJ8qIIvwLL2fWdQHlbYzpBTZI/4xdojYiormAuxUucxqE4kMqhiGyTrAG73rVFPAOEqn6We+2KDcIgz8pB4c9OhHD3xvkMcZnuTZikPyskA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775420916; c=relaxed/simple;
	bh=NRxP5PSd979Phq/RLQbd7oy9HuowRWr6CYDv5RhgG6w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rhn2DP0r0GUJmWwAqef9apohNw02noHvNLqfS8eyMpv1g+9lVgoCqgKseAhGm00v0exzNdnZ76W5hJ9UfmzjsCAf9a5jS+d7XKFxukj7I5OHAnWp1GReBE2UuebHuJNzkmsS5ojVCPxid7zWbMc8wGPOEKWOv0eHc5KOb+8RSPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R3pRAqS5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48F8BC116C6;
	Sun,  5 Apr 2026 20:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775420916;
	bh=NRxP5PSd979Phq/RLQbd7oy9HuowRWr6CYDv5RhgG6w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R3pRAqS5zRskJ1LVRW3XAzv8kaqysJXo7n6XCxOgFz2Icwuiw0R8AsUTqFoUpU9FJ
	 98sLWteqgQnH4h2Y+zf+VeWu9UIRHwOz14s58Jo8yE8M4pObvqLOrZLCtXW+q0dh+k
	 H7DIZTiw/oenl+aHXF5ea0lXYVnzU54N3nUYLE1+RliG+4HXiukIDmQFkswbwm+O3m
	 3kc+pB/Lv5Mb80hGRr4hEbuWT5+jp7DF/IW9VTe9MMqj60zmSZWOJVCpAl8fnnHSf/
	 SXlpoEakdDdyk0al2S0fNI1Wy6gK3+OstmsBLh6H/LKIm0wNNwxpexqZhxmk8DInyt
	 0v8PqRWu6Xjvg==
Message-ID: <e85dec04-afc6-4942-bc06-d46c508d2584@kernel.org>
Date: Sun, 5 Apr 2026 21:28:31 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/3] media: qcom: camss: Add CAMSS Offline Processing
 Engine driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 vladimir.zapolskiy@linaro.org, kieran.bingham@ideasonboard.com,
 robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, johannes.goede@oss.qualcomm.com,
 mchehab@kernel.org
References: <20260323125824.211615-1-loic.poulain@oss.qualcomm.com>
 <m61yNNvSrw6AIq7_-g2h7VQLmGJ_5iCLg5JTlfQDcL5LlBq37ifAeXw-K3AlRBck5Mb4uVQq0pzeBNAybQNk4w==@protonmail.internalid>
 <20260323125824.211615-3-loic.poulain@oss.qualcomm.com>
 <1ba54ec0-be51-4694-a79b-f272e76303d2@kernel.org>
 <X-Lw_zi1o015-V1Cv4dY_ik6SfTB8TTcLmn1l-Ta7UviYTJ6gwMBn4B4ulYwjd_Aetul5xUt0T6ln9E-Hl5h4g==@protonmail.internalid>
 <CAFEp6-3ziXJTYADOFj--rZL5TumroXuW+=SnUQ9XakRxHT-ypg@mail.gmail.com>
 <12194cc0-0960-486c-be7e-1a22d95de340@kernel.org>
 <Coon32Ka9XbQ-1AzN_iIIH8paxBBuz2astLCFhzSxOoDSHFP_1HoJOl0XKC7urJtTl3r64nBEeZP8ng7iNa5Qg==@protonmail.internalid>
 <20260405201129.GB1213462@killaraus.ideasonboard.com>
 <3bcd8500-ff6c-4a1f-8b7e-3e7c474f6345@kernel.org>
 <vND_8PraFcz-qkPg7skcrfb3l6gsQ5qSvDvqEiaVCG1EYb5904gHHR-wapoZGYBiceyiehoEvPsDsX0Qhj8fXQ==@protonmail.internalid>
 <20260405202431.GE1213462@killaraus.ideasonboard.com>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <20260405202431.GE1213462@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58075-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B187B39FC23
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 05/04/2026 21:24, Laurent Pinchart wrote:
>> We make the buffer in user-space which could be used by CDM but stage
>> the implementation.
> My proposal is to use an abstraction for the ISP parameters buffer, with
> logical parameters, and translate that to the CDM buffer in kernelspace,
> but in userspace context instead of IRQ handler context.

As I understand it, the parameters buffers can top out at nearly 2.5 
megabytes.

However I haven't looked into the CDM format in detail so - it needs 
anaylsis.

TBH I'm happy enough to follow a precedent, let's discuss further with 
an analysis of CDM in hand.

---
bod

