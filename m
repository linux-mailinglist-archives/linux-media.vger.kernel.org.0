Return-Path: <linux-media+bounces-60513-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCjDOJXi+mmGTgMAu9opvQ
	(envelope-from <linux-media+bounces-60513-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 08:41:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A81DA4D6B23
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 08:41:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 91BFC305BF16
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 06:41:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75E0630C618;
	Wed,  6 May 2026 06:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="myK/t5yU"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44CC3081A2;
	Wed,  6 May 2026 06:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778049666; cv=none; b=KTuXVDIdhKpv0JyokZO0nyz1Lp+htD13dULjgX6iQAA0RqLC4vfmguxIMVSZ9Yg8et41menSFTPvehL5F97Jc9rEIU0hwFLgLwLPZw8v+v0uTHcfkffDB1Miq2v78hYPLVPoF0HvsietyNQxV2VDbrRqvvgue/d5yUmcuOLGXtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778049666; c=relaxed/simple;
	bh=HGMq2Uo/l/iHk+nqiVEHdNRryVqppF70YrLidAhyoCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rddo6eFUr9WtV2f+q5RSnm91Zg/rSID7JH90wcjJs2Q8G0jNDuKk250II/czHKpbSv4cZnpRc4p0A2Oa/XKidxiRkawNwBy9RchLK3GMm7AWBY72aaBqQdyB8wAOVsh4TnplUltNWEu/rdBkNIXb6uU5R5P68fj5k6qEJriI/JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=myK/t5yU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19EB3C2BCB8;
	Wed,  6 May 2026 06:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778049666;
	bh=HGMq2Uo/l/iHk+nqiVEHdNRryVqppF70YrLidAhyoCQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=myK/t5yUv+Gaaae3ebCK5RV6hNkNmr1OI2UPCEv+dV/MGmCLGBuJs/EHIpKoI+qO3
	 fU618Pc69tCpwMGVLqER1QlO966U7Xd/E62zU8SyTsq0HrsHD9LlxR696QKUjOeSeC
	 ZqU3aqfcXNLBq5lepNLRtxi67o0vuFTQ5xsgnf1N2ZNATzpsiSAyYuPSn65xnOf1+V
	 UChedTOXBH7pM7xr5lklsKhsFgvYbr1LYZzjQSUVdnqqHjUxwJ6v48KuckOWmyaeVx
	 baEUx/R5U9tLtulUH/EKBoYbzV3CLK2lzazx2w6Mh/d04189ze2+85xKrJhVFEC6gT
	 UDGzrKAZkNg5A==
Date: Wed, 6 May 2026 08:41:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Bryan O'Donoghue <bod@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@kernel.org>, Stefan Schmidt <stefan.schmidt@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [PATCH v4 02/13] dt-bindings: media: qcom,venus: Remove clock,
 power-domain, and iommus from common schema
Message-ID: <20260506-inquisitive-wondrous-lori-a9e639@quoll>
References: <20260505-glymur-v4-0-17571dbd1caa@oss.qualcomm.com>
 <20260505-glymur-v4-2-17571dbd1caa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260505-glymur-v4-2-17571dbd1caa@oss.qualcomm.com>
X-Rspamd-Queue-Id: A81DA4D6B23
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60513-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,kernel.org,linaro.org,gmail.com,8bytes.org,arm.com,vger.kernel.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Tue, May 05, 2026 at 12:29:23PM +0530, Vishnu Reddy wrote:
> The common schema defines minItems and maxItems for clocks, power-domains,
> and iommus. This suggests that the number of these resources can vary,
> while in reality they are fixed constraints per platform.

OK, that's interesting approach. I am fine with it, but then you need to
remove these from "required:" list as well, because requiring properties
which are not defined here is not the most readable.

I still do not understand though why you cannot just grow the properties
here. The point of this schema is to define common set for range of
devices, because all of these devices are supposed to be veri similar.

Best regards,
Krzysztof


