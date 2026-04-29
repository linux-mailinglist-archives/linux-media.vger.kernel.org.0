Return-Path: <linux-media+bounces-60030-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HtKGoOK8ml7sQEAu9opvQ
	(envelope-from <linux-media+bounces-60030-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 00:47:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1E049B25D
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 00:47:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 03042303B4DA
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 22:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BDBA33DEDD;
	Wed, 29 Apr 2026 22:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="lAUS+CFU"
X-Original-To: linux-media@vger.kernel.org
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846231E8320
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 22:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777502833; cv=none; b=N+Q/4J1w9ie0cwRb0TSjqWZmhEBjcJ1t+Urp4qxx3cGu2G2dEXlXMcZYGkIgPPhQO8ThRn3yObKUXhz9RPcOirJ+9YXmyDMn7F9Z7GF+DGAL/bH22QX3DU3ATztE6XeJl3Uwug6VgZtbtpNumfQt4fHA2lSFwRH3IV1kMjdBVJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777502833; c=relaxed/simple;
	bh=2FBRGE8ggBHksrdTMC3gDJiqej/4D4HMm4MVPXEITxs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JKyk5ECkPUfm1AWSO4EdHkdZKpUCdpmxoKg6MZ/J3R1rVOhDPgsas06seYwtED8Pe/etSmyP4aWBB5U9fASkr8sZE/zV/S9oj7wo+bl45UfBfjaHiUAQGYwnzdmc4l240gX2EPfxI+lTFEHXsPUQ6xCEpf3ySoGQ7tPZ7od1ox0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com; spf=pass smtp.mailfrom=embeddedor.com; dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b=lAUS+CFU; arc=none smtp.client-ip=35.89.44.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedor.com
Received: from eig-obgw-6007b.ext.cloudfilter.net ([10.0.30.166])
	by cmsmtp with ESMTPS
	id IAfyw21GAjw8YIDgOwH3GM; Wed, 29 Apr 2026 22:47:04 +0000
Received: from gator4166.hostgator.com ([108.167.190.91])
	by cmsmtp with ESMTPS
	id IDgNwlqIkYO6jIDgNw4FwL; Wed, 29 Apr 2026 22:47:03 +0000
X-Authority-Analysis: v=2.4 cv=ffyty1QF c=1 sm=1 tr=0 ts=69f28a67
 a=vY9Mjuda9oMEc2E4Cx1x2A==:117 a=vY9Mjuda9oMEc2E4Cx1x2A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=7T7KSl7uo7wA:10 a=VwQbUJbxAAAA:8
 a=P1BnusSwAAAA:8 a=PHKDr0J8e_G5cKxf1GUA:9 a=QEXdDO2ut3YA:10
 a=D0XLA9XvdZm18NrgonBM:22 a=2aFnImwKRvkU0tJ3nQRT:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wqNKCeyUYF9KWGCcnKzNyPUhOdM5wDMY1RTineHLakg=; b=lAUS+CFUPPdU60AN2e+W2W/R5/
	fD7XNhjoGBt+b3bub9TvdSDxZnCFkK624N6r8YeEj7MOgN1bcpP05iayQPbAqK18vLU7OT6uDMdIf
	8/Y/O9KjWDvcgEuDWD+7kNCe1yVTXLfypFiPFhnkI4I65fbgqW1VbVJ0IcfgvT9iE9zSDtiCVMy1x
	9QRKIB69ydD2kA6igr6f7eR2oxD1KRu7J042rdLTyQqrWgTlvdg9+2eoNaJ8WVqFRmhhJxBozdVNR
	b6lj5OpkEsY8w6fwBGdk7P4Trq5H4XzVZJNB0QAHhl/AwMF9RAZsd/0CcvJk6L+pQlt/PZPVQXHg/
	vOC/JyKQ==;
Received: from [177.238.19.10] (port=36338 helo=[192.168.0.36])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.99.1)
	(envelope-from <gustavo@embeddedor.com>)
	id 1wIDgL-00000000Vqp-3tbR;
	Wed, 29 Apr 2026 17:47:02 -0500
Message-ID: <fbc749e6-10ce-43c2-8985-020322ba4900@embeddedor.com>
Date: Wed, 29 Apr 2026 16:46:48 -0600
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
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 177.238.19.10
X-Source-L: No
X-Exim-ID: 1wIDgL-00000000Vqp-3tbR
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.0.36]) [177.238.19.10]:36338
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 5
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfO7qWywZghHYpRkDSYo/6XQeQz7xgZDQPZPPsqbyr3g2pBquRgaOmNr5e3RoiAgOnW4I2vqsj3ZgbJd6ZB+7eVvAfMTd0T/Ecf1W6Me9MLTOlBCzvtog
 DgTMR0k0B6Yf66Drco50cV3IdNENvXCWzAd5fPKFiGoCo6fY/XvpPbPk2lKSf40mOB7ns7TgSu6o4Q3RD7/r+U2NkGq0Mi94I6xG72E3o0/r6fe0JRBm6XSI
X-Rspamd-Queue-Id: BE1E049B25D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[embeddedor.com:s=default];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	HAS_X_SOURCE(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60030-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.854];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,embeddedor.com:mid,ideasonboard.com:email]



On 4/29/26 14:28, Laurent Pinchart wrote:
> I forgot to ask, how do you want to get this merged? Will you collect
> all similar patches and send a tree-wide pull request, or should they be
> merged by individual subsystems ? In the latter case, Tomi, could you
> please handle this with other Xilinx patches ?

You folks can take this in your tree. :)

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


