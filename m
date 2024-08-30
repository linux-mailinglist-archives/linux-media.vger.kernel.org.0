Return-Path: <linux-media+bounces-17232-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCD0966688
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 18:10:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3A301B23B16
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 16:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A87A1B81D4;
	Fri, 30 Aug 2024 16:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="glvNI7XQ"
X-Original-To: linux-media@vger.kernel.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2AE199FB7;
	Fri, 30 Aug 2024 16:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725034203; cv=none; b=hzAU42FzdYzLsEKfm3TvoUggfSL+ubbhQ+my0YtUnGNcFpohTcZuZ7ILWz5CMlFvabXltHqUCrWnlzcMQ9kqQaZxqtLk0iTjUO0iGUktt91sKtO/41IS1couyAzkoZPTxEdCZkhzE79yp1EzMeJc56wxK6EFCXXukP+35hgL0Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725034203; c=relaxed/simple;
	bh=fs5r9a7+4o5m7r+P9T33tlELpNm09e4/5KwdXAJI5Do=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tLI3aKiYUm21M4t4Es9TxgaRBobjSLMGWScGoV3ZuKqgfWyPYNJlljd3lmQW9NQ2pKQ/qYw40LhHbc9qwhmS6BeE1TH6h6rY19VsZkznSOJMczktMPuLArcFi3ksuQTqp1Kn2/OIvczC+H6GUopkgRLlVSEAW+OTBOnnUih6zDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=glvNI7XQ; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47UG9esH063664;
	Fri, 30 Aug 2024 11:09:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1725034180;
	bh=UtRIdCY2mej4r1D29l8J74CgITE2kP+9FO1lvFfhaAI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=glvNI7XQl3VfJX9JP3tF257zQsTkDtXy35GyRrNX98tDty78nIYCf9r0Ls38KmkZC
	 JEg6MLMSA2FGCCi7ffpM9W6SN2bGZ2Xgy4UravJmnEf1mTkS03VdwiJcxP3zfUYG70
	 BO3NtdILjD8WIp0fYzUfDSlrb7zcvTYvTaCCtR4E=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47UG9e3H077994
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 30 Aug 2024 11:09:40 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 30
 Aug 2024 11:09:40 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 30 Aug 2024 11:09:40 -0500
Received: from [172.24.227.193] (devarsht.dhcp.ti.com [172.24.227.193] (may be forged))
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 47UG9WFb094581;
	Fri, 30 Aug 2024 11:09:33 -0500
Message-ID: <f6331333-dc3c-b28c-2bbb-229a180c9ede@ti.com>
Date: Fri, 30 Aug 2024 21:39:32 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/6] math.h: Add macros for rounding to the closest
 value
Content-Language: en-US
To: Jiri Slaby <jirislaby@kernel.org>, Jani Nikula <jani.nikula@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sebastian Fricke
	<sebastian.fricke@collabora.com>
CC: <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sebastian.fricke@collabora.com>, <linux-doc@vger.kernel.org>,
        <praneeth@ti.com>, <nm@ti.com>, <vigneshr@ti.com>, <s-jain1@ti.com>,
        <r-donadkar@ti.com>, <b-brnich@ti.com>, <detheridge@ti.com>,
        <p-mantena@ti.com>, <vijayp@ti.com>, <andi.shyti@linux.intel.com>,
        <nicolas@ndufresne.ca>, <davidgow@google.com>, <dlatypov@google.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <rdunlap@infradead.org>,
        <nik.borisov@suse.com>, <Dave.Martin@arm.com>
References: <20240826150822.4057164-1-devarsht@ti.com>
 <20240826150822.4057164-2-devarsht@ti.com>
 <Zsy-8xXQ01-JhL0m@smile.fi.intel.com>
 <9c41f6b7-6b06-cd5b-74bd-24873c4beaf7@ti.com> <87frqqyw9r.fsf@intel.com>
 <0b06794b-34c5-ec0d-59c6-8412a8789eaf@ti.com> <878qwfy9cg.fsf@intel.com>
 <8bcddd10-6699-4e76-9eaf-8768f1c1ae66@kernel.org>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <8bcddd10-6699-4e76-9eaf-8768f1c1ae66@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hi Andy, Randy, Sebastian,

On 29/08/24 15:24, Jiri Slaby wrote:
> On 29. 08. 24, 11:19, Jani Nikula wrote:
>> The stupid thing here is, I still don't remember which one is the
>> generic thing, rounddown() or round_down(). I have to look it up every
>> single time to be sure. I refuse to believe I'd be the only one.
>>
>> It's okay to accidentally use the generic version, no harm done. It's
>> definitely not okay to accidentally use the special pow-2 version, so it
>> should have a special name. I think _pow2() or _pow_2() is a fine
>> suffix.
> 
> Concur.
> 

We have got 2 votes to change round_closest_up to round_closest_up_pow_2 and
likewise for round_closest_down to round_closest_up_pow_2.

Kindly let us know if you have any concerns w.r.t above name change. Else, I
was thinking to proceed with the suggestion.

Regards
Devarsh

