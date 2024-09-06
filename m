Return-Path: <linux-media+bounces-17750-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0486096F031
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 11:51:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 883741F29B55
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 09:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 307B11C8716;
	Fri,  6 Sep 2024 09:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gqbT+Lke";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QZtuf0/q";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gqbT+Lke";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QZtuf0/q"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0056415749A;
	Fri,  6 Sep 2024 09:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725616289; cv=none; b=DY283Wb1eTlZ/EtYbY/BCVQq2n2biy8a5ZObhfTj/882yjS5i7y54v8O3yy6vNOghJUnwBFNlUX6DPIhD10zSXIC0LfArTsnam8iIjE9alO9spu1lLt2GjWWmYaHB2Zcw6s+MGVF7qIKMe5XM36XNLe7EPtUsWAoBiezkuEAeYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725616289; c=relaxed/simple;
	bh=r9CQiv9e/H0QQPL0VCa/kPrvaWEFJIp6VitNELBRy98=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cc8vZfOdPST6jk/+vrdhNhOoI0L5+ZIj9ICJUgsW4loz8SEYBMoQqV6t4Ik4vqVrSXjGvCQMx+GvB3zlclk8K+PFJbLVx7Owq02/VDYKfIZeuWyYddAaogafj/cNZk3zn2fFNNDK4IVMF/xfk6pR1EeBxvPyDLEXaSCRRGPl2dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gqbT+Lke; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QZtuf0/q; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gqbT+Lke; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QZtuf0/q; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 081D71F8AE;
	Fri,  6 Sep 2024 09:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725616285; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rx7d4m2HIkXffxsAPOa/6tFUzQ3aGNt1wI/K/bs5f34=;
	b=gqbT+LkeHNlV6ckPNOCGOuyBlOEEi5I+xpmrXWSb8FiUOySh/fJKRl+BFTZjXCGHAdMtRB
	VsKudgVNLAa/p7i9OC0OEUzxlKNFhnT2E6DE04TDzUeN+/DYOnelJprmdMrQPQpiABp48i
	TAB9sbxUUUWxzKYSSMgJb380r+vSDc4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725616285;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rx7d4m2HIkXffxsAPOa/6tFUzQ3aGNt1wI/K/bs5f34=;
	b=QZtuf0/qw/2OVRuGbMOExaH2QJboUnseDWwUIbjB2vl8jrv/7elLUaTN1CNgyyeeNRWPuL
	KpMPKg8+jgwEQGDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=gqbT+Lke;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="QZtuf0/q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725616285; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rx7d4m2HIkXffxsAPOa/6tFUzQ3aGNt1wI/K/bs5f34=;
	b=gqbT+LkeHNlV6ckPNOCGOuyBlOEEi5I+xpmrXWSb8FiUOySh/fJKRl+BFTZjXCGHAdMtRB
	VsKudgVNLAa/p7i9OC0OEUzxlKNFhnT2E6DE04TDzUeN+/DYOnelJprmdMrQPQpiABp48i
	TAB9sbxUUUWxzKYSSMgJb380r+vSDc4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725616285;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rx7d4m2HIkXffxsAPOa/6tFUzQ3aGNt1wI/K/bs5f34=;
	b=QZtuf0/qw/2OVRuGbMOExaH2QJboUnseDWwUIbjB2vl8jrv/7elLUaTN1CNgyyeeNRWPuL
	KpMPKg8+jgwEQGDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 197871395F;
	Fri,  6 Sep 2024 09:51:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OEtAAZzQ2maDYAAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Fri, 06 Sep 2024 09:51:24 +0000
Message-ID: <d6d5490e-7270-4391-b91a-72af551c6e7d@suse.de>
Date: Fri, 6 Sep 2024 12:51:08 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: venus: firmware: Use
 iommu_paging_domain_alloc()
To: Jason Gunthorpe <jgg@nvidia.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
Cc: Lu Baolu <baolu.lu@linux.intel.com>, Dmitry Osipenko <digetx@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Kevin Tian <kevin.tian@intel.com>, linux-media@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240812072105.9578-1-baolu.lu@linux.intel.com>
 <20240812072105.9578-2-baolu.lu@linux.intel.com>
 <c5141c18-3f7b-41ac-a064-9911873d0bf9@gmail.com>
 <20240904121614.GA782327@nvidia.com>
Content-Language: en-US
From: Stanimir Varbanov <svarbanov@suse.de>
In-Reply-To: <20240904121614.GA782327@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 081D71F8AE
X-Spam-Level: 
X-Spamd-Result: default: False [-5.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[nvidia.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linux.intel.com,gmail.com,kernel.org,nvidia.com,quicinc.com,8bytes.org,arm.com,intel.com,vger.kernel.org,lists.linux.dev];
	RCVD_COUNT_TWO(0.00)[2];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -5.01
X-Spam-Flag: NO

Hi Jason,

On 9/4/24 15:16, Jason Gunthorpe wrote:
> On Tue, Aug 20, 2024 at 11:43:50PM +0300, Stanimir Varbanov wrote:
>> Hi,
>>
>> Thank you for the patch!
>>
>> On 12.08.24 г. 10:21 ч., Lu Baolu wrote:
>>> An iommu domain is allocated in venus_firmware_init() and is attached to
>>> core->fw.dev in the same function. Use iommu_paging_domain_alloc() to
>>> make it explicit.
>>>
>>> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
>>> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
>>> Link: https://lore.kernel.org/r/20240610085555.88197-10-baolu.lu@linux.intel.com
>>> ---
>>>   drivers/media/platform/qcom/venus/firmware.c | 6 +++---
>>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
>>> index fe7da2b30482..66a18830e66d 100644
>>> --- a/drivers/media/platform/qcom/venus/firmware.c
>>> +++ b/drivers/media/platform/qcom/venus/firmware.ced
>>
>> Acked-by: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
>>
>> I'll take the patch through linux-media tree.
> 
> Did this patch and the 1/2:

2/2 is in linux-next now.

~Stan


