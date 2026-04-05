Return-Path: <linux-media+bounces-58068-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BCTEie+0ml7aQcAu9opvQ
	(envelope-from <linux-media+bounces-58068-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 05 Apr 2026 21:55:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2A439FA8C
	for <lists+linux-media@lfdr.de>; Sun, 05 Apr 2026 21:55:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 766DD300EAA9
	for <lists+linux-media@lfdr.de>; Sun,  5 Apr 2026 19:55:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 559B5381B0E;
	Sun,  5 Apr 2026 19:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lc4FY0rD"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FF5C8EB;
	Sun,  5 Apr 2026 19:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775418905; cv=none; b=EU7/cQN6mKiBAFf+Uw0mWewLoDa+jys1WRb5/3r38xA4fI24vkMIiq8LutsYZzSi6uFzdSURGJPpq8OZTDjS50tiD0oZhe5InqrKvesmaIcLtcnar73JO2kh9F1eZPSIoqfGLP2yRUmQ3Xbm0SmzzoZUlZKRTKPwc4V5P1TMVUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775418905; c=relaxed/simple;
	bh=RWPZ7Fe6Z5t921EK6rEWyDIuIyoKa8wllKpl66uGT9k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hqDe0u54xv+V3XRNuGrD/04U/2XLgGChVNkF8sdJlzXZDzY6liGMTFm0UvRr7gqQxFuj0U4sV4bk00qyVOGhqIfn+cEeF1oq9TyRTnTmPGN3qIwtXKcQLisBRzY6UJ5B2U4BwFsL1A57X47Vamdjy431R+QSb6+pOcTaLN/waAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lc4FY0rD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DBFBC116C6;
	Sun,  5 Apr 2026 19:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775418905;
	bh=RWPZ7Fe6Z5t921EK6rEWyDIuIyoKa8wllKpl66uGT9k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lc4FY0rD0MqNqIGc1N73g93cW+de8B9wr+nDO53EjsNqmyPvg4vc6pE54wU1abACx
	 23HtxLcBONRbOQ1dOrwHAziPeCCAzu3X25eXWn+o5OtnePakHgV8DyG/PulEUfgiTC
	 IsMjqQRL60jUQhjL1xID0pERrGof93nTBTX/HEzIQ3Xa9hsXIvUZeDrASlQ49xS3tc
	 zffVrIU63o49S0UyNIEQNYcA2M21QaiVZLgih9WHgVkkH9N+xAIXRqKxzhlmYQaqzA
	 1w8A3bHOxIMEQWBjqYItkUdaB2244eUyt2vy0zOtYMAhqV+s1gJj6vsflX80Xilegp
	 Hd6V5kYsqD8wg==
Message-ID: <d5bb1f75-f55f-43e6-8160-bacc4088b0a2@kernel.org>
Date: Sun, 5 Apr 2026 20:55:00 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] media: qcom: camss: CAMSS Offline Processing
 Engine support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: vladimir.zapolskiy@linaro.org, kieran.bingham@ideasonboard.com,
 robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, johannes.goede@oss.qualcomm.com,
 mchehab@kernel.org
References: <xy6TKmdveRx4cMshSHEUGZ7s3lbsurWcsc2vq05A7_N4bCialR7EelZitouugtZDkpFCAghjqY4NDdSQEIPprw==@protonmail.internalid>
 <20260323125824.211615-1-loic.poulain@oss.qualcomm.com>
 <055a7281-3e41-4e26-a8c8-5e28d69c0685@kernel.org>
 <CAFEp6-2NniQquVrw_V8P_cyUayMMY0SPC8hgczjB3ef5zx7e5A@mail.gmail.com>
 <j1jExQP2GCnHhjXkyuhDn_d0CP50oZDMyso3CFfkygb7Ww_9Z3L93P8Px0KjTQAqU5jzr2I41V1_2ZdQOQqfxA==@protonmail.internalid>
 <20260405194851.GA3972481@killaraus.ideasonboard.com>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <20260405194851.GA3972481@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58068-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
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
X-Rspamd-Queue-Id: DB2A439FA8C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 05/04/2026 20:48, Laurent Pinchart wrote:
> I don't necessarily agree with that. There are pros and cons for using
> HFI on platforms that have an ICP. If correctly written, a firmware can
> improve the throughput in multi-camera use cases by reprogramming the
> time-multiplexed OPE faster. On the other hand, in use cases that don't
> require pushing the platform to its limits, dealing with a closed-source
> firmware often causes lots of issues.
> 
> We should aim at supporting both direct ISP access and HFI with the same
> userspace API, even on a single platform. Which option to start with is
> an open question that we should discuss.

I think - for IPE and BPS ICP/HFI is the way to go.

However thinking about it - inline pixel processing IPP inside of the 
IFE is superior to BPS/IPE for virtually every scenario i.e. why deliver 
a frame to user-space and then submit it directly to BPS via CDM or via 
a firmware interface HFI, if you can do the same processing in the IFE - 
which on the majority of qcom platforms, you can.

Agatti is an outlier in that sense.

So actually I've shifted my focus on Hamoa to IFE/IPP.

You still BTW do want HFI for BPS/IPE - but to get 3a going on the vast 
majority of qcom platforms - you want the PIX/IPP path in the IFE.

OTOH if you want to do offline bayer processing - taking say a saved 
file from the filesystem - then BPS/IPE is the way to do it and IMO HFI 
is the way to do that.

But ICP/BPS/IPE is a nice to have.

I realise that's a word-soup of TLAs but yeah, TL;DR IFE/IPP is the way 
to go on !Agatti and once we get a nice 3a loop going there a fun 
side-project would be offline bayer processing via HFI.

---
bod

