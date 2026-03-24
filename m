Return-Path: <linux-media+bounces-56836-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKGADilfwmmecAQAu9opvQ
	(envelope-from <linux-media+bounces-56836-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 10:53:45 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 98651305F7C
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 10:53:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7B449303B142
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 09:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5DCE37187C;
	Tue, 24 Mar 2026 09:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="E1EOoVFq"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463EE3DDDAA;
	Tue, 24 Mar 2026 09:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774345614; cv=none; b=WxhNarPjs7HFpLV2fFeBlqnWrjczRvxEnTRIQTLTya36R8EQjy6K2EbX8t/sTsJyWcbSIWnJSzA36NcobB2/xQnd+DgDwhS9YTV0hyhoaxuPnPOJGMSm8/4jEMKuZVAa+en+FIOHPQR1qQXwOtSZiCDBcum2Gxf/TQNJKVygmuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774345614; c=relaxed/simple;
	bh=BcODXoQlJ1DFAkNcgiG6uPX6+uutgiyM2xoSaFfQjCc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W/flzk0IvZx7kvWfhKU2efm+7y4UWVE2i4HmeFBba9GqLs6f114+N6i31ur5qPtpHswtLvDORs51cJT+syjegkltlWYz2JG/cisp0ENNUpqw/yCqgaLSaKJH1w5xb4SnLTZL1VYoG4NvpJ6Zuo+sJvRfx/vKqyMaH8pARDKWzuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=E1EOoVFq; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774345610;
	bh=BcODXoQlJ1DFAkNcgiG6uPX6+uutgiyM2xoSaFfQjCc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=E1EOoVFqk7hSh/rshO7Pa1QiIU0Du1HE7HQfvvtfsyQ6zzNEPkAy5l7bfcdo69RiD
	 YtRGgkWq1GMUSoT23DQKLNQzLdTcJC2tUsVkcCAP2XN7C14srnElu06hy/eHjqk2UP
	 AkECqguGwZUS+BxoPghVSrSg9wTX+M09VbOTF0SP9hiIB6+ykl1iQ8uYBTnkPAF6U3
	 lU+8Ohxe9KMmIcDs2NwfcsxnS8qd3iHZGExmhR2/PD7FdBITOAGQ1sK12tU7XvFbgV
	 zUjUHRU6KPTbCS47GA/eWBiw2IbPoLwkE2w+EVdYQKwY/N67rDnnewv4fTfSu33d8a
	 ilpRq+sMx/IOQ==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E8D1717E4BCD;
	Tue, 24 Mar 2026 10:46:49 +0100 (CET)
Message-ID: <08e6b649-61ac-4059-a914-c537b5c4da7e@collabora.com>
Date: Tue, 24 Mar 2026 10:46:49 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] media: synopsys: Add imx93 support
To: Sakari Ailus <sakari.ailus@iki.fi>, Frank Li <Frank.li@nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Guoniu Zhou <guoniu.zhou@oss.nxp.com>, imx@lists.linux.dev
References: <20260210-imx93-dw-csi2-v1-0-69667bb86bfa@nxp.com>
 <acGQNIUKqfh8eWNB@lizhi-Precision-Tower-5810>
 <acJI3wYnl8_g4WpO@valkosipuli.retiisi.eu>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <acJI3wYnl8_g4WpO@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56836-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.riesch@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,collabora.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 98651305F7C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi all,

On 3/24/26 09:18, Sakari Ailus wrote:
> On Mon, Mar 23, 2026 at 03:10:44PM -0400, Frank Li wrote:
>> On Tue, Feb 10, 2026 at 12:11:07PM -0500, Frank Li wrote:
>>> This 3rd time try to support DW CSI2RX support for imx93.
>>>
>>
>> Laurent Pinchart and Sakari Ailus:
>>
>> 	I am not who will take care this patch?
>> 	original drivers/media/platform/synopsys/dw-mipi-csi2rx.c picked
>> by Sakari Ailus
> 
> Michael seems to have questions on the last patch, too.

I.. don't.. think so. After digging a bit in my memory and lore, I found
a v3 of that series with my Reviewed-by [0]

[0]
https://lore.kernel.org/all/20260216-imx93-dw-csi2-v3-0-aabafee10923@nxp.com/

Best regards,
Michael


