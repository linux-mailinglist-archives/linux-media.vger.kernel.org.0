Return-Path: <linux-media+bounces-58072-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNVzCADD0mldagcAu9opvQ
	(envelope-from <linux-media+bounces-58072-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 05 Apr 2026 22:16:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0865A39FBA3
	for <lists+linux-media@lfdr.de>; Sun, 05 Apr 2026 22:15:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 74E61300335C
	for <lists+linux-media@lfdr.de>; Sun,  5 Apr 2026 20:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FF44382360;
	Sun,  5 Apr 2026 20:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MCsZmn74"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C7F175A6D;
	Sun,  5 Apr 2026 20:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775420152; cv=none; b=RutOlaYDxw4VhP+hHy4nMG7fTka4cpOCV2B47oxfnRCM7IFS9BMveyy0Zj8peHw6VmZzO7OBN/Jcz5X8blXPIV6cJG7I/2GW1fb1RyDjspIQOJ/wo+KiddeuYQELWV9H0BjJmObf0z6ZLRKx6XKcZo9NL2/Za3c4PC4YTR9VrdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775420152; c=relaxed/simple;
	bh=WPnZeRoYPMD7LQArMyMpA3mzTez1znm9JptH71Egp1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JiyFTxc1mKgClO0riVJpVc9At/5c/wdgL68W8ffBnpMgjX8QpT9qUNc2vFbN0LJ4V/+mGb5ubTxSeCYO2xVUS6vriTHPf0rYnhorxKuBR60YzzugPkUBNiH0RI/q3mslm8b1tlBPqgPmg2lv9DsauIlLCAw9V486h+MDnXy4tQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MCsZmn74; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62F46C116C6;
	Sun,  5 Apr 2026 20:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775420152;
	bh=WPnZeRoYPMD7LQArMyMpA3mzTez1znm9JptH71Egp1A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MCsZmn74CksgapuNoLZ4UnANnnD87QpD9QEfo2k4aGjnrDVtwhWrHxqk5sUWCM3Ej
	 uTnc5Ck1HEAChPIepf1mgKaD1Cr8d2DWhNePuIpJPcgO/PgnB6ZxjN8Yz7/QTs3mt6
	 nnyMNOrXZacS2Wfi7RYRbtnVZvm/RWq+QoSL4OdEzhV+VJdy4dQ1W0VZh0BAJ3gZn+
	 12TjizJQiZaRSyBc2i9f4j4BWgFW4+lENxVlROyYRHlLYumdj4zHudMsdbWZsnvqkG
	 VtH5Qb1fVS+F+lZofv7XAIPW53ebQ8KPK+rlYCUDn0t7iP6yVbRkbaEJnrWVQG6Uit
	 P3kI7/0EXK2Ag==
Message-ID: <3bcd8500-ff6c-4a1f-8b7e-3e7c474f6345@kernel.org>
Date: Sun, 5 Apr 2026 21:15:47 +0100
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
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <20260405201129.GB1213462@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58072-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0865A39FBA3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 05/04/2026 21:11, Laurent Pinchart wrote:
> The mali-c55 driver does this, it translates the ISP parameters buffers
> to a list of register values in userspace context, when the buffer is
> queued. In the IRQ handler, it then either copies those values to
> registers with MMIO writes, or use a DMA engine, depending on the
> platform. The rppx1 driver does something similar, with a different
> format for the buffer containing the register values.
> 
> I think this architecture could be replicated here. This translation in
> userspace context ensures that work at IRQ time is limited. The driver
> can use whatever DMA engine is available depending on the platform, and
> we can also force usage of MMIO for debugging or development purpose.
> That way, development of ISP features is decoupled from development of
> CDM support, enabling parallel development if desired, and faster
> plaform enablement that allows starting the userspace side of the work
> quicker.

I think that's a reasonable plan.

We make the buffer in user-space which could be used by CDM but stage 
the implementation.

That way if CDM proves too hard, we can do MMIO for a while, and then 
transition to CDM if/when.

For me though I really think translating between formats is storing up pain.

---
bod

