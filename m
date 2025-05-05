Return-Path: <linux-media+bounces-31701-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BE4AA91A6
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 13:12:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A92C3A5CAC
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 11:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 139C520468E;
	Mon,  5 May 2025 11:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="uanME0bx"
X-Original-To: linux-media@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8712E20D506;
	Mon,  5 May 2025 11:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746443417; cv=none; b=O8kk1OrHX74KStYsiadWH7IxmewWMQhWipkoAnsIUHVEFDXw6z9oQF7La3EItsiQowIXvyHCNM+cT53mg1Kqet5wlp+8PAPRDWc4gzn5IdBZkO5w6UpW+ARI+o7Bz6yzH/2LMMCL3vqd7FbXtb4kX3nqAXFv5Mh8YmJ9zapEeNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746443417; c=relaxed/simple;
	bh=iJaVMgd50y/RnCXRg81TNgmiWPGPCTRnLSqLZR4Fta8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tM0/YdRx1kWVlFzNZ/Dxp9NtO3fQfQx2hYzX3Dsuaq6bgjDMFGPeueodItlr5XrWxVrNULA3uqhmEUCbn8DDvYrrrCI6SBMknHLD9YJwhYUwjjJm4GuX6/HcRYKQ3IU4ktlSDzpfjWjRpzY3vKpRIqg/yeXJVJe2b40UYA2/ZyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=uanME0bx; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5457crpm028600;
	Mon, 5 May 2025 12:49:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	dZm36Yfu/299NsjICP2d/3EQGEdcRXUPll1j4pYAovk=; b=uanME0bxGMeWrEun
	VXEhYyAmcF3Ggw6Bcn0ItgQ/sXDGAggQUoiRu+HWBFgJMRHKGBmt4uszK+mxTGjg
	o3Tr4N6p1GVASh8Az3GJTKGm/NkyLblxT5Ke0MtYoSGhwxW+02J5JGvJzj7Ujk3J
	HN0UBvoQ/rtT4AxjrQcl9s5Y//Ke129sHGJIUfuZGfU5J4f6l7D7c6dxHrbrEpQU
	iXZNJf80abNSQNLxV6wYhfMpdDFPffsIcRc1lq3ygHidGPfzclqhmkDlKid9zkW2
	IFIF4qK671K5M+46V4eStRbxVfdg1ZeD2h9gqOaS8G+so445XQboBtVpnV/3DCh4
	wnNnzQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46dx3m3yn7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 12:49:50 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 037C940060;
	Mon,  5 May 2025 12:48:32 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B3199B0ECC8;
	Mon,  5 May 2025 12:47:24 +0200 (CEST)
Received: from [10.131.131.7] (10.131.131.7) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 5 May
 2025 12:47:24 +0200
Message-ID: <b25bf051-1459-4572-8d41-ebdf5fd7abf3@foss.st.com>
Date: Mon, 5 May 2025 12:47:23 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] media: i2c: Add driver for ST VD56G3 camera sensor
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: <benjamin.mugnier@foss.st.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <laurent.pinchart@ideasonboard.com>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <tomm.merciai@gmail.com>
References: <20250502201849.12588-1-sylvain.petinot@foss.st.com>
 <20250502201849.12588-3-sylvain.petinot@foss.st.com>
 <aBhwIl7G60EJ9k9F@kekkonen.localdomain>
Content-Language: en-US
From: Sylvain Petinot <sylvain.petinot@foss.st.com>
In-Reply-To: <aBhwIl7G60EJ9k9F@kekkonen.localdomain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_05,2025-04-30_01,2025-02-21_01

Hi Sakari,

Le 05/05/2025 à 10:00, Sakari Ailus a écrit :
> Hi Sylvain,
> 
> Thanks for the update.
> 
> On Fri, May 02, 2025 at 10:18:49PM +0200, Sylvain Petinot wrote:
>> +static int vd56g3_check_csi_conf(struct vd56g3 *sensor,
>> +				 struct fwnode_handle *endpoint)
>> +{
>> +	struct v4l2_fwnode_endpoint ep = { .bus_type = V4L2_MBUS_CSI2_DPHY };
>> +	u32 phy_data_lanes[VD56G3_MAX_CSI_DATA_LANES] = { ~0, ~0 };
>> +	u8 n_lanes;
>> +	u64 frequency;
>> +	int p, l;
> 
> unsigned int. There are more cases where you have a loop variable that
> doesn't need to be signed. Please address these in a follow-up patch.
> 

Thanks for raising the point. I'll do that asap.

-- 
Sylvain


