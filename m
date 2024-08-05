Return-Path: <linux-media+bounces-15768-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C838A9477DB
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2024 11:02:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 847E2282861
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2024 09:02:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21E73154C05;
	Mon,  5 Aug 2024 09:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="neeNjURY"
X-Original-To: linux-media@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EE114F9E6
	for <linux-media@vger.kernel.org>; Mon,  5 Aug 2024 09:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722848433; cv=none; b=N0ZQHR8uGBxBed3gW8pm8wIjg+t/xNKls9hfarUdZi00wS9cNWZbU58QBeddGYE86e91wQC85SQM7sWlYBRtae85ydebLp6M3rFLBKccsDYSsOuE7pY1A0MwfKRuXwe47ZO5+nFzkXIby00P50B6NFuiK4t+Y2FwZxxCTVDaQpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722848433; c=relaxed/simple;
	bh=rzqHZBVZl6Wg+pgrgpm9CtwoWcDsmhv9/n6R++rZ6Ds=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gtFHE6JFtnrHvSa8KGgtVVo1Bf5kgxdgj/6UFgK4ZwNE7+UlwWPlBQ2kWz/HBRpAbgrNmXSSSYgvdlTqEactPm0cUK7wgtbBPlBvcZC5bLdNVFhafFTrh9HIwvCgNU4lYw+D0KFrQp3rnMnAkflQI3iEEA65QedIZs8k83f5hgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=neeNjURY; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4758NmJ0008303;
	Mon, 5 Aug 2024 11:00:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	Ze0cM5Qg8JzE1KFDx0dHqB6KUqBncGpdbOSDiC5f2hE=; b=neeNjURYxiMX5ZaE
	LEKPh26zgOpmk2OvpL9bxOauLXNedYlPid4ESqaAABuipZ/TaS7KiKEfAk6dMFyU
	OD56rAbC3tO57i/2yJ0BCayatZ9ScQUF4dc8xq+1Cjjem5UjUx8xQHqdTan14Tyt
	MPcBrxzKtRrWtZ9vjC00tiWCq2dhiajs8jgEd8cnmFEtpDF7NdeRZrrJA/oJY7Y1
	TxDk1xVpki3IBLfCH3vqfZZIU2BCHvHx4tHERUplcF1DcIKQDMFghlEaa/D8wu9a
	fPgmBIAoBRE9BktAlSLew4KhuveSkLD0GW+MPlaeeMSdhKyYAszwsYfkeSCFP+oz
	ZyA8Rg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 40tu6mg5fc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Aug 2024 11:00:21 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 29AFD4004F;
	Mon,  5 Aug 2024 11:00:16 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2D297222359;
	Mon,  5 Aug 2024 11:00:00 +0200 (CEST)
Received: from [10.130.72.241] (10.130.72.241) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 5 Aug
 2024 10:59:59 +0200
Message-ID: <90fb7f04-d90c-4269-9bc6-8839c0a0ccbb@foss.st.com>
Date: Mon, 5 Aug 2024 10:59:59 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Interest for a libcamera workshop in Vienna - September 17th
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        <libcamera-devel@lists.libcamera.org>
CC: <linux-media@vger.kernel.org>,
        Kieran Bingham
	<kieran.bingham@ideasonboard.com>
References: <20240729090042.GA2725@pendragon.ideasonboard.com>
Content-Language: en-US
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <20240729090042.GA2725@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To EQNDAG1NODE4.st.com
 (10.75.129.133)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-04_14,2024-08-02_01,2024-05-17_01

Hi Laurent,

On 7/29/24 11:00, Laurent Pinchart wrote:
> Hello everybody,
> 
> Following the success of our workshop in Brussels in February, we would
> like to host another event in September.
> 
> We have evaluated different options, and opted for week 38 in Vienna.
> The city will host during that week the Linux Media Summit (Monday the
> 16th, [1]), OSS Europe (Monday the 16th to Wednesday the 18th, [2]) and
> the Linux Plumbers Conference (Wednesday the 18th to Friday the 20th,
> [3]), and we expect that co-locating with those events will ease travel
> for attendees of the libcamera workshop.
> 
> The week is already busy with camera-related events on Monday with the
> Linux Media Summit, and on Thursday afternoon with the Complex Camera
> micro-conference at LPC ([4]). We have therefore selected Tuesday the
> 17th for libcamera.
> 
> To help us plan the venue, could you please register your interest by
> replying to this e-mail, either publicly, or in private to Kieran and me
> ? The event will be free of charge for attendees.

Thanks for organizing this. I'd like to attend please.

> 
> Please also let us know if you have any preferred discussion topics you
> would like to include. We will draft and circulate an agenda in the next
> few weeks.
> 
> [1] https://lore.kernel.org/all/ae3b6b11-c3ec-4a3d-8fa1-c91ef2f8e151@xs4all.nl/
> [2] https://events.linuxfoundation.org/open-source-summit-europe/
> [3] https://lpc.events/
> [4] https://lpc.events/event/18/sessions/193/
> 

-- 
Regards,

Benjamin

