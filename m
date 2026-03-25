Return-Path: <linux-media+bounces-56972-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aG5iJme7w2kKtwQAu9opvQ
	(envelope-from <linux-media+bounces-56972-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 11:39:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DFC323251
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 11:39:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BCE543102654
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 10:26:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB12639C002;
	Wed, 25 Mar 2026 10:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oKQ4Bpno"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E79F3976A1;
	Wed, 25 Mar 2026 10:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774434414; cv=none; b=scy1rQAENJ3FGFRCOcMxuEfpaqDHR/6Gcrso9lKFCZbWqB4AdVSMAlp7Kxi5lW/XjZPvg/kQT6A4L8VSiyRKN6O3DOpQn7ZylU0AspgKD4lY8GlQDPqL6NjX+my3+rv/H5/SxzO6+6SG9YRiSBKFaLL/l25k6O6hWg3Xjkc3cgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774434414; c=relaxed/simple;
	bh=zJdXXwSg6ujoB/hGhBlCvyaoucbZBhl/ajrekdDwSSE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pTmeyPCWWLt/ZMl9BEf3JQpYVQVSdNKs0nsk7PuZIsXvVrTxdbAqgT/UzAHO/hNx2yTtxLBPHF+BKdcqFS9MFc22CzLE59vwprfGsjkHe3IlCrx2ZIquZRbV1oRKtoG6q1iJPVfuQyRwFyZPMoMwZv8KAqJZ1LXhhW57VbLf1CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oKQ4Bpno; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B4DA110BE;
	Wed, 25 Mar 2026 11:25:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774434333;
	bh=zJdXXwSg6ujoB/hGhBlCvyaoucbZBhl/ajrekdDwSSE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oKQ4BpnoQchgMNenpR6Hu2bpGIC+z7lUwV5ihxjn2Eh2+PWGrgVqumT1bABP8rmcr
	 EOJVNJDlLeuloHPYRTfdLuwoyqMLaK5P4OuXLeCWX42ycmKj3IdELji2RZvZFFCEmS
	 mIbJtzKlkUeYIhUZifdtinuG7u4WjABa+RV6tqMk=
Message-ID: <786cf901-db52-42f4-b892-728a64972505@ideasonboard.com>
Date: Wed, 25 Mar 2026 10:26:47 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] platform/x86: int3472: Match MSI laptop board name
To: Antti Laakso <antti.laakso@linux.intel.com>, linux-media@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org, sakari.ailus@linux.intel.com,
 hansg@kernel.org, ilpo.jarvinen@linux.intel.com
References: <20260319155031.1989179-1-antti.laakso@linux.intel.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260319155031.1989179-1-antti.laakso@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56972-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.scally@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: F3DFC323251
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Antti - thanks for the patches

On 19/03/2026 15:50, Antti Laakso wrote:
> Ensure MSI system is correct by checking board name too.
> 
> Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
> ---
>   drivers/platform/x86/intel/int3472/tps68470_board_data.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> index c1ddbf9a82c0..e65067358301 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> @@ -404,6 +404,7 @@ static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
>   		.matches = {
>   			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Micro-Star International Co., Ltd."),
>   			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Prestige 14 AI+ Evo C2VMG"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "MS-14N3"),

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

>   		},
>   		.driver_data = (void *)&msi_p14_ai_evo_tps68470_board_data,
>   	},
> 
> base-commit: d29c44f16beb1219825461efab46026deb1d4af5


