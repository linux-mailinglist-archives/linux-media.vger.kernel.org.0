Return-Path: <linux-media+bounces-30701-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3982EA966BC
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 13:00:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 35CA917E80B
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 11:00:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5066021D59F;
	Tue, 22 Apr 2025 10:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="4hrkMWKr"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5D025C6EE
	for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 10:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745319519; cv=none; b=uTcBjA8XBoLHy2/HauJfEFpMjbD26lzJLCfkc67Is5ZW6z333sR99k2btFbS3VntlhkGkD0bYyDPNUBgfTDoTqlbllMw0bVy+6PDnyugSup3UFytlwx6B8D9v8crkxEq8TKnpsGeK2RvcyPD/s0Z+5LzyJil+DnX5A2oehvzCkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745319519; c=relaxed/simple;
	bh=JClppVPbwrxwYQ2ho8gNUziYbUnYM1d7zwZFwtHIPJY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mrbxKsM91bJp/nsSMFlGqifEWvFbCOG8bNPgMRSiA150kRd4oGUP6uY/lo7G2tNG+dMfrlmNkXrsvATtpHTpb5RnXVNzJNm++ADbQNeR470C30nfEPRJIsbJ0u0sWNfhzkR/oUw2pjwHDIy3Q3UesgS7EYCvQ76mi4ECC/NBfqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=4hrkMWKr; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M7SZmU028178;
	Tue, 22 Apr 2025 12:58:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	R43p9bhE6WsZg7rP+wxh4+kZN7qdhWh+eUb+6arb8cs=; b=4hrkMWKrO25EDd4q
	2B79kAaCtx3HBTqGfrFlfE7Wp711iS1wPrjDivmXKqF4rnApWhDqn9EfTajFZaqP
	9xBoPm6i9ykfATRbKUqg4IhNz71d6FCMjuWkJhhhXVi+hYeov5E7f61ghe/avXRj
	dW6+R6Ie91RqXPFLajCkT9V2nlYu/XVKconXsMl2LLWV1QYnQapGzITZlkieD2zi
	NWsbDkAoPro7NQLz+3+tbsTPreoeQmBKnG9mPX5gMF2eZZ0zWIFJopAwf2XDSV+I
	rxp61WemcMJbiAS0TQrb+VxJYsLJKE+EGO24EmuRP4QeYiZtLeFmBm3CXrnfK0gc
	ZgL69A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4642qg9ph8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 12:58:33 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 684D540045;
	Tue, 22 Apr 2025 12:57:55 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6318DA01C66;
	Tue, 22 Apr 2025 12:57:38 +0200 (CEST)
Received: from [10.130.73.167] (10.130.73.167) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Apr
 2025 12:57:38 +0200
Message-ID: <751ee8b7-8758-4a98-8b3d-eb91f1f90b99@foss.st.com>
Date: Tue, 22 Apr 2025 12:57:37 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ANNOUNCEMENT] libcamera workshop 2025 - Nice, May 16th
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        <libcamera-devel@lists.libcamera.org>
CC: <linux-media@vger.kernel.org>,
        Kieran Bingham
	<kieran.bingham@ideasonboard.com>
References: <20250325102750.GE20035@pendragon.ideasonboard.com>
Content-Language: en-US
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <20250325102750.GE20035@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_05,2025-04-21_02,2024-11-22_01

Hi Laurent,

On 3/25/25 11:27, Laurent Pinchart wrote:
> Hello everybody,
> 
> Another year, another libcamera workshop. After the previous editions in
> Paris, Brussels and Vienna, we will organize the next workshop in Nice
> on Friday the 16th of May. The event will be hosted by Embedded Recipes
> ([1]) as part of their workshops day ([2]).
> 
> This year, our workshop will be colocated with the Pipewire workshop on
> the same day and at the same venue (but a different room), to facilitate
> discussions about topics that span libcamera and Pipewire. The Linux
> Media Summit will also be organized in a nearby location on Tuesday the
> 13th ([3]).
> 
> If you would like to attend, please register your interest by replying
> to this e-mail, and indicate if you have any discussion topics you would
> like to include in the schedule. We will draft and circulate an agenda
> in the next few weeks after receiving topic proposals. If registrations
> exceed our capacity, priority will be given based on topic submissions.

If it's not too late I'd like to attend to the libcamera workshop too :)
Unfortunately I didn't dive in libcamera yet to talk about a specific
topic. We plan to support ST sensors in libcamera, and this is a great
opportunity for me to see libcamera's evolution.

Thanks a lot.

-- 
Regards,
Benjamin

