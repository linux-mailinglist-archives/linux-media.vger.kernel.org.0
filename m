Return-Path: <linux-media+bounces-3417-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B0F82877E
	for <lists+linux-media@lfdr.de>; Tue,  9 Jan 2024 14:59:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB1E51C21230
	for <lists+linux-media@lfdr.de>; Tue,  9 Jan 2024 13:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20ABB3984A;
	Tue,  9 Jan 2024 13:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="r5WFhP2+"
X-Original-To: linux-media@vger.kernel.org
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330E039AC5
	for <linux-media@vger.kernel.org>; Tue,  9 Jan 2024 13:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedor.com
Received: from eig-obgw-5007a.ext.cloudfilter.net ([10.0.29.141])
	by cmsmtp with ESMTPS
	id MxC7rKI3aCF6GNCdnrRaZ4; Tue, 09 Jan 2024 13:59:39 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id NCdmrTA8TPwzWNCdnr1xuT; Tue, 09 Jan 2024 13:59:39 +0000
X-Authority-Analysis: v=2.4 cv=T8yf8tGQ c=1 sm=1 tr=0 ts=659d514b
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=GfQleyYEO+cc22AUyTT7qQ==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=dEuoMetlWLkA:10 a=wYkD_t78qR0A:10
 a=jCw2ex66E_5x05uIvzYA:9 a=QEXdDO2ut3YA:10
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Y2CE/Hs6RAOXjZmVqnvf/IR9hVOQliV1xVMEpOaNeSM=; b=r5WFhP2+75l5rixF+KzySrozXk
	Em5yzbvm+7Ph8FfkFi1jYJqU1p7OjImbmmn69lEkRzQGLCpnX0ZjBI5fyeVORQXekDp1QsE3VejGI
	LDIOp1zMKjqde7+a+sAeVwIE4zjQhornHY4VzgVxDmefdWOAWfZjDOLpRLjJoVpVG2jACjt59CiQ6
	A3U1GJ+betZgIhQjgCJRuelB5T6k5a1udLstM3MifyPgChl79UZcp7KtdRawCN4eobptrE6RKaMqj
	PcwOgDWaPUOuMeQTvEjB+zO+VgD6l9SQh0xr3CvsOz3fFOUG2YmqB18aVcIxkabyyh5IurA2tNG/g
	XigtOfQw==;
Received: from 187.184.157.186.cable.dyn.cableonline.com.mx ([187.184.157.186]:12259 helo=[192.168.0.10])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <gustavo@embeddedor.com>)
	id 1rNCdl-004NMd-01;
	Tue, 09 Jan 2024 07:59:37 -0600
Message-ID: <d7ac4bae-3ab5-446b-9230-58dd01637375@embeddedor.com>
Date: Tue, 9 Jan 2024 07:59:33 -0600
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] media: venus: hfi_cmds: Replace one-element array
 with flex-array member and use __counted_by
Content-Language: en-US
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Kees Cook <keescook@chromium.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <ZSRJfRdUXQOzagKr@work> <202310091252.660CFA9@keescook>
 <20240109124026.GA1012017@google.com>
 <b8686724-9351-4f40-a587-fcbba5b0eb14@embeddedor.com>
 <20240109132831.GD1012017@google.com>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20240109132831.GD1012017@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.184.157.186
X-Source-L: No
X-Exim-ID: 1rNCdl-004NMd-01
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187.184.157.186.cable.dyn.cableonline.com.mx ([192.168.0.10]) [187.184.157.186]:12259
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 18
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfMy4doxPSOfZe9TqrZGQM4v7gcta1CeK0Md/yPN08e5btvQ05u2azrlm/yRyvsBM2SijKbqWMQD2TUHvxb/lVWhfBoCYRdEjrwtGGIDbHUeP0/d80YZb
 pMqn32wmNZ9qaGQfNySI4A8gqSXl/54KLQhGKy6m9ZT8puX3Cy26jMe196Bx5J2ZKYb5ebMLEQ609FazthOQcyqTVl9R4vOzNaFvXg2SupbVX8bNoDk+hjgO



On 1/9/24 07:28, Sergey Senozhatsky wrote:
> On (24/01/09 07:17), Gustavo A. R. Silva wrote:
>>
>>> Sorry for shameless plug, a quick question: has any compiler implemented
>>> support for counted_by() at this point?
>>>
>>
>> Not yet. And at least for GCC, it's expected to be released in v15.
> 
> I see. Thank you.
> 
> I got confused by include/linux/compiler_attributes.h comment, as I'm on
> clang-18 currently, seems that we need to bump min compilers version.

Ah yes, compiler devs have been running into some issues, and they had to
postpone the release of the attribute.

> Oh, and clang link 404-s on me. I'll send a quick patch, I guess.
> 

You're right, ick!

--
Gustavo

