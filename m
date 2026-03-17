Return-Path: <linux-media+bounces-56083-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHmNC+VVuWnYAgIAu9opvQ
	(envelope-from <linux-media+bounces-56083-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 14:23:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E832AACA0
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 14:23:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 680FE30BA3DB
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 13:21:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52FE13CB2E0;
	Tue, 17 Mar 2026 13:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="e3Wo5w1g"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A3A3C1979;
	Tue, 17 Mar 2026 13:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773753690; cv=none; b=Mrl9MV1ibkGeIAYaxtdbe6UPJIrYJtBRb2Hi10qxkm4cIRD07fnflk65bDRvvtDY3te4k/UrlmFGAojlT1HrLTa02OIAuDu/fuXXy+LEJobHH45PElQoXT4sPoN19c9Q3xfNbTc+Xm4ll9UZbPpo2g6wfDSxAJGk72fYQcxCvxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773753690; c=relaxed/simple;
	bh=hTN1TNlOZL26JxiO/N2w3PZRC4OyzRSiRbthnRGcI0I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XqlAHIIPe6ntjjptBSZZZTmH4OjWa8a01iJ3aClT2xP8lMWC/gSLTWS9o097O0wGYYwMzDcMMaKsvzHTKVGuEO2oRiJNJO/yrq6Cyk6r1wj98Yv32TKyvMr1TJwIzQ/kWLT4+cHKgA1WNRVZa6fWnl/E30Hgel6z8xblykAfHPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=e3Wo5w1g; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773753682;
	bh=hTN1TNlOZL26JxiO/N2w3PZRC4OyzRSiRbthnRGcI0I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=e3Wo5w1g48wmRF4VftZVxkCP6WO42t2NEdAxgAgcbg73QSnJPPXkHZXTmPnrIEwGM
	 g4EfshV3wE3ZbE3QLdmmaTGH5N2hY/gpqcfiAAs9IbvJ6CUE+59IrqS6g3oO0YbC/A
	 FwdqhZBos8+ItXxhieyZ6z6IOlsXuftcfHXIR6rVYdklpDI0LrrhQFQiA259+QO9up
	 fzB5FZbYlOJV7PTs5YwhxwI1gFwoOvxAxI18eVV83ixh9Z/wA1/E58JupvozFswG9C
	 LXQazlhooyzrZ/DdRnNn+7CWEJr1uBIEzd/3qGEdHc1RfNPagIwLMS248CGhO4KoHY
	 6OMIzOpw/1D/A==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 68CC517E0E3F;
	Tue, 17 Mar 2026 14:21:21 +0100 (CET)
Message-ID: <e894fe10-3780-465a-984d-01f5e8f4c97e@collabora.com>
Date: Tue, 17 Mar 2026 14:21:20 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/9] media: rockchip: rkcif: add support for rk3588
 vicap mipi capture
To: Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 =?UTF-8?B?0JrRg9C30L3QtdGG0L7QsiDQnNC40YXQsNC40Ls=?=
 <mai.kuznetsov.misha@gmail.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250430-rk3588-vicap-v2-0-77de5ee9048e@collabora.com>
 <20250430-rk3588-vicap-v2-3-77de5ee9048e@collabora.com>
 <ablRBViDR996euua@mdjait-mobl>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <ablRBViDR996euua@mdjait-mobl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56083-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,sntech.de,rock-chips.com,amarulasolutions.com,gmail.com,collabora.com,linux.intel.com,vger.kernel.org,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.riesch@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:dkim,collabora.com:email,collabora.com:mid]
X-Rspamd-Queue-Id: A2E832AACA0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mehdi,

On 3/17/26 14:08, Mehdi Djait wrote:
> Hi Michael,
> 
> Thank you for this nice patch!
> 
> On Tue, Mar 17, 2026 at 10:32:21AM +0100, Michael Riesch via B4 Relay wrote:
>> From: Michael Riesch <michael.riesch@collabora.com>
>>
>> The RK3588 Video Capture (VICAP) unit features a Digital Video Port
>> (DVP) and six MIPI CSI-2 capture interfaces. Add initial support
>> for this variant to the rkcif driver and enable the MIPI CSI-2
>> capture interfaces.
>>
>> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> 
> [...]
> 
>>  static inline unsigned int rkcif_mipi_get_reg(struct rkcif_interface *interface,
>>  					      unsigned int index)
>>  {
>> @@ -631,6 +765,8 @@ static int rkcif_mipi_start_streaming(struct rkcif_stream *stream)
>>  	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CTRL1, ctrl1);
>>  	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CTRL0, ctrl0);
>>  
>> +	rkcif_mipi_write(interface, RKCIF_MIPI_CTRL, RKCIF_MIPI_CTRL_CAP_EN);
>> +
> 
> while this is the correct solution for rk3588, for the rk3568 vicap this
> will write 0x1 to the VICAP_MIPI_CTRL : 0x00A0 which will enable the water line.

nice catch ;-) However, the TRM (at least my version) claims that this
bit has a reset value of 0x1, so the bit in question should be already
set in the first place. Thus I decided to *not* make variant specific
code paths.

Do you see problems in your setup?

> 
> --
> Kind Regards
> Mehdi Djait

Best regards,
Michael



