Return-Path: <linux-media+bounces-57631-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJ1zCouGymnd9gUAu9opvQ
	(envelope-from <linux-media+bounces-57631-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 16:19:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C54A335CB53
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 16:19:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E415308FE7B
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 14:12:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CD433D812E;
	Mon, 30 Mar 2026 14:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aZRjqt/C"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB64C3A3819;
	Mon, 30 Mar 2026 14:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774879923; cv=none; b=s1Wt+K/SOrhv+YU+cgrZkDPSZxDZbO4qxm4kj7ublZuaj/jWLvU5jvs9i1wRCCk8DjqJpgstX62OPd16JpmKpEVj9B6upiZ23x+PNHSxcxgFZnLdcRPnlZNZxTCFDt8/1Ki/t+qyy85kJcbrQhptralkZCtYTOo/q9/BB00jV3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774879923; c=relaxed/simple;
	bh=fv7u2PJPLBHp3kxSG+S/aLopXh7onyeyM+OxnvrlMPo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SAIn9KbyqUGAbWqD1j1odX0EX3GM4e8I08u7FFmRulOqQBTUXjWIY0kGJqP9gqGxzyvTSRMbd8Qy0JFDV0Yjf0TjxxrmwD492vPer0lttusLVbxd0YxzwS+OS5YsCy7ZbNU5bkja6iVSmVKQk53yqEdlRfpFhAto3N9pNiTjOzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aZRjqt/C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C685C4CEF7;
	Mon, 30 Mar 2026 14:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774879923;
	bh=fv7u2PJPLBHp3kxSG+S/aLopXh7onyeyM+OxnvrlMPo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aZRjqt/Ch214ay3BxdslOxCzad2Y3vxAEBkiPeN9TZr0EIqjzx/EE5y+1FP1Q0oO+
	 Sb0c7B8hx7foRfu/lehZyeKH2mCbuUkW4v3eblWtCMYX2p3OZQ4ddr229wzNjXjkBT
	 ZSLn18qhOtBDu5l8TKV9I9dGFI1udtbtVkBqIm3eK4lBlGxVcXSAHO3y74UbFmAynl
	 dYm9FY33TV2EA1sKJSYepXEIkY7hp308LHDu9q0T/Lcv9yevzIM+OTb8tlBc1mxMpR
	 B351kRNLzgSGIdzTSeoB5v//cAW1ACxrpN2s1il3cQVbigmfg0PyJkEhs5DZcg6HF2
	 autR+TW3FV0LQ==
Message-ID: <0879e4c1-5381-4a70-9fb3-4af9b3bf6e48@kernel.org>
Date: Mon, 30 Mar 2026 15:11:58 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/3] media: qcom: camss: Add CAMSS Offline Processing
 Engine driver
To: johannes.goede@oss.qualcomm.com,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 vladimir.zapolskiy@linaro.org, laurent.pinchart@ideasonboard.com,
 kieran.bingham@ideasonboard.com, robh@kernel.org, krzk+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, mchehab@kernel.org
References: <20260323125824.211615-1-loic.poulain@oss.qualcomm.com>
 <m61yNNvSrw6AIq7_-g2h7VQLmGJ_5iCLg5JTlfQDcL5LlBq37ifAeXw-K3AlRBck5Mb4uVQq0pzeBNAybQNk4w==@protonmail.internalid>
 <20260323125824.211615-3-loic.poulain@oss.qualcomm.com>
 <1ba54ec0-be51-4694-a79b-f272e76303d2@kernel.org>
 <X-Lw_zi1o015-V1Cv4dY_ik6SfTB8TTcLmn1l-Ta7UviYTJ6gwMBn4B4ulYwjd_Aetul5xUt0T6ln9E-Hl5h4g==@protonmail.internalid>
 <CAFEp6-3ziXJTYADOFj--rZL5TumroXuW+=SnUQ9XakRxHT-ypg@mail.gmail.com>
 <12194cc0-0960-486c-be7e-1a22d95de340@kernel.org>
 <rj2vb725he4yzfvjifzyxqpbqk5oztfaafp7sg2qes4qz3mlaz@z5dyoqod56d7>
 <7fc31426-3157-49c7-a30d-dcd7b181fcc6@oss.qualcomm.com>
 <qq43xl3lsv2nq4ngn2hojleddxjmkgwclb2ajek5gvdtgyjltl@3tqg5ydhsxia>
 <8DTHyPLaUjGKd83PvBsisjn_SnpUnvkateTtwz9P6CChP9VGfDyQmJa4Rfd5KwOBOLhtGFJPDzfHrXC4zvV-Fg==@protonmail.internalid>
 <0330f63f-7137-4484-954a-fc0776a9b052@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <0330f63f-7137-4484-954a-fc0776a9b052@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-57631-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C54A335CB53
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 30/03/2026 14:46, johannes.goede@oss.qualcomm.com wrote:
>>> And then your CCMv1 or CCMv2 helper will get called with
>>> the matching parameter-data.
>> This leads to userspace having to know exact format for each hardware
>> version, which is not nice. At the very least it should be possible to
>> accept CCMv1 buffers and covert them to CCMv2 when required.
> Yes, but a new ISP may also have a different pipeline altogether
> with e.g. more then one preview/viewfinder output vs one viewfinder
> output for current hw, etc.

My scoping on HFI shows that the IQ structures between Kona and later 
versions have pretty stable data-structures.

It might be worthwhile for the non-HFI version to implement those 
structures.

I keep mentioning CDM. Its also possible to construct the buffer in the 
format the CDM would require and hand that from user-space into the kernel.

That would save alot of overhead translating from one format to another.

That's another reason I bring up CDM again and again. We probably don't 
want to fix to the wrong format for OPE, introduce the CDM and then find 
we have to map from one format to another for large and complex data 
over and over again for each frame or every N frames.

TBH I think the CDM should happen for this system and in that vein is 
there any reason not to pack the data in the order the CDM will want ?

So probably in fact IQ structs are not the right thing for OPE+IFE.

---
bod

