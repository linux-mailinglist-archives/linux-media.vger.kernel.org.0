Return-Path: <linux-media+bounces-66106-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id io3hJ6/CQ2rBgwoAu9opvQ
	(envelope-from <linux-media+bounces-66106-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 15:20:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F02616E4C52
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 15:20:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=nxsw.ie (policy=quarantine);
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66106-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66106-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 19EB530876CE
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 13:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 996F241C312;
	Tue, 30 Jun 2026 13:20:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8CC3F5BC0;
	Tue, 30 Jun 2026 13:20:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782825602; cv=none; b=fIok0fWPCwy9ZhqNw3nKK5JqO8dn4VuPwRckdEa9iFxSs1TinfZVav/5vQCJALACUPOJqHsCx3EHK7nB/LL/Dw2KhbU2TNA4pzXjpWLul/yxdd6cQ6RSYZRMQJe3P5J2Oyxe/DxB/3iFso0InQKHG74mmaL8mXNqyUJ2tmUYszw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782825602; c=relaxed/simple;
	bh=MBw1UUsDY5u5KuY7BNpPUIEttfDRQjlxBKUSNdUGDnY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZgnzCZO5x55YOlzd79wpLUCkjYvCL4mZ+PJ4QxfJvzi06ukECTJqwIRvPa326lJyxxp1to08/UzCEf3TO1NsabHWgcVuKQ+7GSVqJkEBNn9pLDoLSDeGnvIP02HOajcnz7TNGJzEeSee4BbG0MSh05EOkmMfPGnNoB2WnYGYHig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 370681F000E9;
	Tue, 30 Jun 2026 13:19:58 +0000 (UTC)
Message-ID: <fbc018f5-c025-4747-85f2-53b45b0f0496@nxsw.ie>
Date: Tue, 30 Jun 2026 14:19:56 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] dt-bindings: media: qcom: Add JPEG encoder binding
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Atanas Filipov <atanas.filipov@oss.qualcomm.com>, linux-media@vger.kernel.org
Cc: mchehab@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, andersson@kernel.org, quic_vgarodia@quicinc.com,
 quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260629121750.3469292-1-atanas.filipov@oss.qualcomm.com>
 <20260629121750.3469292-3-atanas.filipov@oss.qualcomm.com>
 <_zZ7OLAmvphzTdIURTW71m_LKDwA-DEQ-a40gIiLYSqgDrdOOEf1bElz53zTbmSaDoqc8PDFyQXa7bycFaSTXw==@protonmail.internalid>
 <569539db-b079-439a-bd05-cb97c30141c1@linaro.org>
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Content-Language: en-US
In-Reply-To: <569539db-b079-439a-bd05-cb97c30141c1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.54 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[nxsw.ie : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-66106-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:vladimir.zapolskiy@linaro.org,m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzysztof.kozlowski+dt@linaro.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:quic_vgarodia@quicinc.com,m:quic_jesszhan@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@linaro.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[bod.linux@nxsw.ie,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod.linux@nxsw.ie,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F02616E4C52

On 29/06/2026 14:38, Vladimir Zapolskiy wrote:
>> +                interconnects =
>> +                    <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_CAMERA_CFG 0>,
>> +                    <&mmss_noc MASTER_CAMNOC_HF 0 &mc_virt SLAVE_EBI_CH0 0>,
>> +                    <&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI_CH0 0>,
>> +                    <&mmss_noc MASTER_CAMNOC_ICP 0 &mc_virt SLAVE_EBI_CH0 0>;
>> +                interconnect-names = "cpu-cfg",
>> +                                     "hf-mnoc",
>> +                                     "sf-mnoc",
>> +                                     "icp-mnoc";
> Since the proper option for describing this hardware is to have it as
> a child device tree node of CAMSS device tree node, which should serve
> or be percepted as a bus, it makes no sense to repeat and moreover rename
> bus/parent's resources, here is the list:
> 
> * "hf_axi", "sf_axi", "core_ahb", "cpas_ahb" and "cnoc_axi" clocks,
> * Titan GDSC power domain and all four interconnects.
> 
> Only "jpeg" clock and iommus are left specific to the hardware description
> of this IP under CAMSS, right? Thus, it should be reflected like this in
> the dt description as well, and the complexity of shared resource management
> has to be done in the driver, which might be tedious unfortunately, but
> certainly doable.

JPEG should be able to vote for its individual NoC / CamNoC dependencies 
/ requirements.

Both GDSCs and interconnects should be described in the sub-node.

There's no functional linkage between CAMSS/IFE and JPEG - they are 
peers within the CAMSS power-island. Over time we will migrate to 
individual nodes for IFE CSID and these too will appear inside of the 
CAMSS "bus" -> JPEG etc should describe their nocs and power-domains 
individually.

camss@X{
	camnoc@{}
	csid@{
		interconnects = <gem_noc>, <cam_noc>;
	};
	jpeg@ {
		interconnects = <gem_noc>, <cam_noc>;
	};
	ife@ {
		interconnects = <gem_noc>, <cam_noc>;
	};
};

That's not where we are but its where we should be going.

---
bod

