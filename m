Return-Path: <linux-media+bounces-12332-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B80908D5D06
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2024 10:45:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 717772867BE
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2024 08:45:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DF6615444E;
	Fri, 31 May 2024 08:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="fKXFRJ0z"
X-Original-To: linux-media@vger.kernel.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080F7153BF5;
	Fri, 31 May 2024 08:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717145106; cv=none; b=ipAWur0DG64V6ok6SgyPjl7T3fiO3zqT0kLKyPFM2l5YldQ5UnDXfIpVipH1+PPY2hkRiIjN2sdXr/AM+FdHfhYvDRECllD+rZOT0ZFs6DOGHyFcDYkvhlXdZXs/m+rSPNhjazLrN82qDecpML4UZwyb2T/6CCTrgDxaO0uohTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717145106; c=relaxed/simple;
	bh=VZn47+GZj+jLSLNV6l/+iYb1pLAD622SqG1As/bdIT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IPna74slnck36nb2N43L+Q8WZ4bmGP3D+3VAIY5Izy7x4DHE2Nymvk8xP77s+ldK88u++e2WivUJmayR7J6XwchWV+9lha1LIpHmHGV/ImEmlRNC5qJbKRHYGazljgsgJDOEkN0ZY5Nv8TRtiTJuqe8FQtn4NHM6mGjhiJ0AHWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=fKXFRJ0z; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44V8iamh029960;
	Fri, 31 May 2024 03:44:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717145076;
	bh=AszhhTIurz/VYk2Xoix0o5cWzdjhRTUjFXk+beQkWsU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=fKXFRJ0z97b9GfUKxlqEQtRAjd/7X8Norfrvt74G629S5vPd8CllPsjNO3ImloPj0
	 L6TtbBKoY5W9i4rh8cmzGu+krM1d938VLLffV5MiDwgETCKgrQ02hRys1QEGejqsXK
	 dn0SuFpE2U+PQZYcJatDoKsASxG8xT3jkqL/Udc0=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44V8iaOl018948
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 31 May 2024 03:44:36 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 31
 May 2024 03:44:36 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 31 May 2024 03:44:36 -0500
Received: from [172.24.227.193] (devarsht.dhcp.ti.com [172.24.227.193] (may be forged))
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44V8iRNI067443;
	Fri, 31 May 2024 03:44:27 -0500
Message-ID: <cab5ea84-9d8f-b9d7-b31b-b520252a2878@ti.com>
Date: Fri, 31 May 2024 14:14:26 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v10 07/11] Documentation: core-api: Add math.h macros and
 functions
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <benjamin.gaignard@collabora.com>, <sebastian.fricke@collabora.com>,
        <akpm@linux-foundation.org>, <gregkh@linuxfoundation.org>,
        <adobriyan@gmail.com>, <jani.nikula@intel.com>,
        <p.zabel@pengutronix.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
        <dri-devel@lists.freedesktop.org>, <corbet@lwn.net>,
        <broonie@kernel.org>, <rdunlap@infradead.org>,
        <linux-doc@vger.kernel.org>, <laurent.pinchart@ideasonboard.com>,
        <praneeth@ti.com>, <nm@ti.com>, <vigneshr@ti.com>, <a-bhatia1@ti.com>,
        <j-luthra@ti.com>, <b-brnich@ti.com>, <detheridge@ti.com>,
        <p-mantena@ti.com>, <vijayp@ti.com>, <andrzej.p@collabora.com>,
        <nicolas@ndufresne.ca>, <davidgow@google.com>, <dlatypov@google.com>
References: <20240530165925.2715837-1-devarsht@ti.com>
 <20240530171740.2763221-1-devarsht@ti.com>
 <ZljRpSgApF6ZwGKD@smile.fi.intel.com>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <ZljRpSgApF6ZwGKD@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180



On 31/05/24 00:51, Andy Shevchenko wrote:
> On Thu, May 30, 2024 at 10:47:40PM +0530, Devarsh Thakkar wrote:
>> Add documentation for rounding, scaling, absolute value and difference,
>> 32-bit division related macros and functions exported by math.h header
>> file.
> 
> ...
> 
>> +Rounding, absolute value, scaling and 32bit division functions
>> +--------------------------------------------------------------
>> +
>> +.. kernel-doc:: include/linux/math.h
>> +   :internal:
> 
> Please, double check that this is correct keyword in this case.
> 

Yes, this is inline as per what is described here [1] as there are no export
symbols in the header. Also the rendered output looks good.

[1] :
https://docs.kernel.org/doc-guide/kernel-doc.html#:~:text=net/mac80211/*.c-,internal,-%3A%20%5Bsource%2Dpattern

Regards
Devarsh

