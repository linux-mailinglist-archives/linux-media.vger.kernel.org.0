Return-Path: <linux-media+bounces-29203-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 43828A78A28
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 10:39:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DB7E3B1F69
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 08:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46B71235BE1;
	Wed,  2 Apr 2025 08:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="0TP0tPWI"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02ED23536B;
	Wed,  2 Apr 2025 08:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743583078; cv=none; b=oyKOmc26T+LuvRd5qcjUBr23Tjma9xKA33/VYdauAgnGJAB0pzM/Wrh1QQroNv/Ri1haQyvz/UK7hKkA3JV+cebqOhQs8ynNZU44vP79iVSidhxbi74Vg8CetYG/cTPuf/i1wTzPQV97FGRL7D9RM9US08RdqIRzXoHTiEUJid4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743583078; c=relaxed/simple;
	bh=kMrRmIjYkOY3Me+cHWkmmh95rd7rxSxbOFbEeA0+4g4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=FL3Qg6TDC/wy9wBactaTCAxtc4tdcvMVP9YmgvnbTk8IeNd5E9zJXTFPlZdjWIeUXJcfmNL4r3eMV/6JFJWqMUSi+FxbTtVpnWA/N5rBffrFfgO2adMTCTvv80LiUBHwzAn6YTXPThZM6BexB6aqF4bU+tVrpH++qmhmIjSHVfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=0TP0tPWI; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5324oilu018147;
	Wed, 2 Apr 2025 10:37:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	8IQ4tQGgtZMD0SHftf9oqpXfKTIVTJ1Q4LX5qbG3iO0=; b=0TP0tPWIyrbJtonS
	StgDnlQuIIlwML9FqDuBBOJqXTK4O5Mp26CHMk7enIwpfWJIDHDHlqB6YJHyST5K
	c0nnbgkjxntUU45zOOVxz+KPuqDz5x9DqwsyI2ktbgqzMKvps0F5ULI0BxlFv2X9
	Yu2629JAxlX1l44ud/zAfvHvYacfRiWMLG4njD7QU/TSttklkRWaTQ7yDkcR5+4o
	CBPTBdPu0NBHHF2aUPF2JNDBXE6PulLBkuko8FfQtq/6UeNHS+9EHJ2SFNZqqIYw
	dRAhKK4tM7qFF6BUxtwsMfymytYb6aDx8mTBKq0C2CjeZ1i5WNDapg1TdrlOfEt3
	i2+pIQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45p6vd9bgj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Apr 2025 10:37:40 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id BAB6140080;
	Wed,  2 Apr 2025 10:36:38 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 350878F3C0C;
	Wed,  2 Apr 2025 10:35:28 +0200 (CEST)
Received: from [10.252.30.87] (10.252.30.87) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Apr
 2025 10:35:27 +0200
Message-ID: <faaebc8c-6e86-4052-96c6-f0927e4dc8a4@foss.st.com>
Date: Wed, 2 Apr 2025 10:35:26 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] media: dt-bindings: Add ST VD55G1 camera sensor
 binding
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Sylvain Petinot <sylvain.petinot@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus
	<sakari.ailus@linux.intel.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250401-b4-vd55g1-v2-0-0c8ab8a48c55@foss.st.com>
 <20250401-b4-vd55g1-v2-1-0c8ab8a48c55@foss.st.com>
 <20250402-glorious-olive-seahorse-eb505a@krzk-bin>
Content-Language: en-US
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <20250402-glorious-olive-seahorse-eb505a@krzk-bin>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_03,2025-04-01_01,2024-11-22_01

Hi Krzysztof,

On 4/2/25 09:08, Krzysztof Kozlowski wrote:
> On Tue, Apr 01, 2025 at 01:05:58PM +0200, Benjamin Mugnier wrote:
>> Also update MAINTAINERS file accordingly.
> 
> Since there will be one more version:
> 
> A nit, subject: drop second/last, redundant "binding". The
> "dt-bindings" prefix is already stating that these are bindings.

Thanks for pointing this out, I'll remove the spurious "binding" then.

> See also:
> https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
> 
> Best regards,
> Krzysztof
> 

-- 
Regards,
Benjamin

