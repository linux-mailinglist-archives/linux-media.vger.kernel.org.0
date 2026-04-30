Return-Path: <linux-media+bounces-60036-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCz4EXG38mnLtgEAu9opvQ
	(envelope-from <linux-media+bounces-60036-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 03:59:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BABE49C299
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 03:59:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 07E8D305A24B
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 01:57:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E78B284B37;
	Thu, 30 Apr 2026 01:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="S/fc83ng"
X-Original-To: linux-media@vger.kernel.org
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7DE81A681C
	for <linux-media@vger.kernel.org>; Thu, 30 Apr 2026 01:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777514242; cv=none; b=cuEoTtLFbXb62W/9TsTpNsUsjcSd8lT/ek5geXLYq1qHnb616DAJDTSukneA0pgzvpqsDW3ntuvBILgCXe2SsFeZ4QSVSe+24KzE6JOjRYYEjF73KwqLktvX4U9Ri7Z5aq9tdQ/zjJm6SCPQzBfcmdSIBeY9qC6ImMMO2c6XaME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777514242; c=relaxed/simple;
	bh=sDBuvvPNj/8lIs5qqYsxqXtlUBXF5eAmaCQLsztXsJ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tKE5VyRvTzytA5eK5S2ToSfMDeY7pPChVvyKj1iYe/3vyMXEOHAQGXokDx2PLKH/0ij78oXxTcBMstn6GVmtL/ldIh1KumnKYJDdIQFZw52w3+/eVkKoQY0n4U0q9CDWPLO/YIA0CLFw2K8NWnv4YWHQppc58UC7OSnmd+zX+Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com; spf=pass smtp.mailfrom=embeddedor.com; dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b=S/fc83ng; arc=none smtp.client-ip=35.89.44.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedor.com
Received: from eig-obgw-5007b.ext.cloudfilter.net ([10.0.29.167])
	by cmsmtp with ESMTPS
	id I5FgwuUZtrDqVIGeWwHRky; Thu, 30 Apr 2026 01:57:20 +0000
Received: from gator4166.hostgator.com ([108.167.190.91])
	by cmsmtp with ESMTPS
	id IGeVwCuJkxUZ2IGeVwkS6S; Thu, 30 Apr 2026 01:57:19 +0000
X-Authority-Analysis: v=2.4 cv=HJHDFptv c=1 sm=1 tr=0 ts=69f2b6ff
 a=vY9Mjuda9oMEc2E4Cx1x2A==:117 a=vY9Mjuda9oMEc2E4Cx1x2A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=7T7KSl7uo7wA:10 a=VwQbUJbxAAAA:8
 a=P1BnusSwAAAA:8 a=PHKDr0J8e_G5cKxf1GUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=D0XLA9XvdZm18NrgonBM:22 a=2aFnImwKRvkU0tJ3nQRT:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MHItyzqf7SwPLrpek6vQPMDnHHj4H3gOYNQHmNEoJMM=; b=S/fc83nguT3kykY9eT/ufEgNZX
	Am6tj5BlTiMqMFqZ4YSbGPsQVyZTFq6T/JQ0bp2cCk88sHpsCITuqUAsYjgTfFTuKRAvCcS3T/0LV
	XGkzBqi6fYcn5DC+iy7pAk0NofqRJ9dc85B/w5g3Mgg1KyQ8NWLL7DM0fQhNYpp5aDxuI9/KvdyLr
	5RspZm8/Fx5tDciifOChbsb8/qK28dnt/30JambDvDqVS6NAEn3d0q3aidvV5HjaSdjh7FtH+gCIL
	r44RdgJR5LDe9gTFB2dRywec2DUmCodao6k+hQRgiFfaWjOFaqcNPeoTQA9LOJdHvPf6+16k4BixO
	WVBfshAA==;
Received: from [177.238.19.10] (port=40062 helo=[192.168.0.37])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.99.1)
	(envelope-from <gustavo@embeddedor.com>)
	id 1wIGeU-00000003bqL-2hmO;
	Wed, 29 Apr 2026 20:57:18 -0500
Message-ID: <7259aa90-85a3-467f-afbb-f6794d181207@embeddedor.com>
Date: Wed, 29 Apr 2026 19:57:16 -0600
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] media: xilinx: Avoid -Wflex-array-member-not-at-end
 warning
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Michal Simek <michal.simek@amd.com>, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
References: <afJiL-iZ4QbJ5v12@kspp>
 <20260429202449.GA132396@killaraus.ideasonboard.com>
 <20260429202801.GB132396@killaraus.ideasonboard.com>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20260429202801.GB132396@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 177.238.19.10
X-Source-L: No
X-Exim-ID: 1wIGeU-00000003bqL-2hmO
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.0.37]) [177.238.19.10]:40062
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 14
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfLN1Hn23tF2NkoGpyIeun6seRNVoPGC5e2cSO374unN+qPScYddJJ/FOB+MliK7eEpTaylkHTwsojFmdnKAHSnAeTEAuadGLy1UKr8Bdl/MRpDHy1au/
 xruEX3KPGa0ZbCXuvj+dlmLCjpgzflfK0+S2aKeG15nsr7HCWFdT7qOWYAJkHsOH3duKDkzXeT2VW20WuBHJYCocK+Y4/mX7BzCb9ygs3xegwSSYqJOQqcBw
X-Rspamd-Queue-Id: 7BABE49C299
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[embeddedor.com:s=default];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	HAS_X_SOURCE(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60036-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[embeddedor.com];
	DKIM_TRACE(0.00)[embeddedor.com:-];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_X_ANTIABUSE(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[gustavo@embeddedor.com,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.869];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]



On 4/29/26 14:28, Laurent Pinchart wrote:
> I forgot to ask, how do you want to get this merged? Will you collect
> all similar patches and send a tree-wide pull request, or should they be
> merged by individual subsystems ? In the latter case, Tomi, could you
> please handle this with other Xilinx patches ?

You folks can take this in your tree. 🙂

Thanks!
-Gustavo

> 
> On Wed, Apr 29, 2026 at 11:24:50PM +0300, Laurent Pinchart wrote:
>> CC'ing Tomi Valkeinen.
>>
>> On a side note, Tomi, can I send a patch to add you to the "XILINX VIDEO
>> IP CORES" section of MAINTAINERS ?
>>
>> On Wed, Apr 29, 2026 at 01:55:27PM -0600, Gustavo A. R. Silva wrote:
>>> -Wflex-array-member-not-at-end was introduced in GCC-14, and we are
>>> getting ready to enable it, globally.
>>>
>>> Use the TRAILING_OVERLAP() helper to fix the following warning:
>>>
>>> drivers/media/platform/xilinx/xilinx-dma.h:99:41: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
>>>
>>> This helper creates a union between a flexible-array member (FAM)
>>> and a set of members that would otherwise follow it. This overlays
>>> the trailing members onto the FAM while preserving the original
>>> memory layout.
>>>
>>> Lastly, the static_assert() ensures the alignment between the FAM
>>> and struct data_chunk sgl; is not inadvertently changed, and it's
>>> intentionally placed inmediately after the related structure (that
>>> is, no blank line in between).
>>>
>>> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
>>
>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>
>>> ---
>>>   drivers/media/platform/xilinx/xilinx-dma.h | 9 +++++++--
>>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/xilinx/xilinx-dma.h b/drivers/media/platform/xilinx/xilinx-dma.h
>>> index 18f77e1a7b39..65f6147ff6c6 100644
>>> --- a/drivers/media/platform/xilinx/xilinx-dma.h
>>> +++ b/drivers/media/platform/xilinx/xilinx-dma.h
>>> @@ -96,9 +96,14 @@ struct xvip_dma {
>>>   
>>>   	struct dma_chan *dma;
>>>   	unsigned int align;
>>> -	struct dma_interleaved_template xt;
>>> -	struct data_chunk sgl;
>>> +
>>> +	/* Must be last as it ends in a flexible-array member. */
>>> +	TRAILING_OVERLAP(struct dma_interleaved_template, xt, sgl,
>>> +		struct data_chunk sgl;
>>> +	);
>>>   };
>>> +static_assert(offsetof(struct xvip_dma, xt.sgl) ==
>>> +	      offsetof(struct xvip_dma, sgl));
>>>   
>>>   #define to_xvip_dma(vdev)	container_of(vdev, struct xvip_dma, video)
>>>   
> 


