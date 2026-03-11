Return-Path: <linux-media+bounces-55302-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CI49Ccb+sGljpgIAu9opvQ
	(envelope-from <linux-media+bounces-55302-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 06:33:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8180E25C769
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 06:33:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 00D89311BBC7
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 05:32:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7560E1C3BFC;
	Wed, 11 Mar 2026 05:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MigaVoRh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BEp4DBRQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20C71D5ADE
	for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 05:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773207140; cv=none; b=mzszqd87zTzxi+81KK/iD9C6VEv548TZLEVbgdT6qqP2gaIo0FYDlFRjIpw2cQhcz0lrLkztrtvhYMJHobCHaRfIzBtSmznYSC0/tIxYrv7r7MTr3vMgErqDfWOueLUJM2Egrh1KkzthlVv9RVgE/EvEfTTAjAvwgXooB+roUpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773207140; c=relaxed/simple;
	bh=RXGhIeORuiCyM0y6t78CX51kPoEPHIR+ounDkOA59X8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I9euar7YoLoZ55+BFqEOlVtBo6EpRrFQUQOHd2tIyB88V0raVhqZqxFzwIeFmjLDf/vZlwv1NwI3G0TWD62xOz0sZu0VHM6WS2ENp97sr+gmlwJlyDPSwuU3jzM+sxc6KjPZTnJUS+JbynYMS41BBNJvVTRmS3Go4vxHqG5auiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MigaVoRh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BEp4DBRQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B4Xw653417921
	for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 05:32:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	olTyyzBo2D5n62FYYMqMF+UNjzmxcvx7lFogltM3uOU=; b=MigaVoRhKZbG/a/B
	PT+USEn2YeGe63cooXTjK9/Cb/n6OQj/BYVLjN5KE9G08W3zX3IQxQkecuNMAXG9
	ug5sPD61R0GuvXwrYsBSD1ApqXDth8sLwDbgw8dznzmx7yVEyloCt6aac69v2XZf
	c+qjW7cXJk0OA57sPOBYIDDWaUvBhmvDkOR0AZt5TmcqeAIviHbW63wKqA7v55X9
	GhXtkD0vh9tyg0Xwu9VdetAOv1wnOQnt8jUq/NeNGHlY0Xd7nu2yIJs60WfxQY4g
	4Wg4zwJc5la35BPiRlt0WvI9JQoUMC/pwtw3Y8oePlzurjonDWW7U+0EzaEY4Bme
	rj5vpw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctja2bgxw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 05:32:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd83cfb36cso2193941585a.3
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 22:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773207137; x=1773811937; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=olTyyzBo2D5n62FYYMqMF+UNjzmxcvx7lFogltM3uOU=;
        b=BEp4DBRQYFt5uI1pOmxpBNSIcDJ9uFr77DDYadCRwQXelHS0idZovPnk2IFRp6Py70
         TVxnGcWK0mDgM/J/iGJZv+hBxux84W2iN3Tb9TuGegczJIRFuCqh40qIjp+8d56p0ak+
         2YCRgsPaINmFss7gGnTlMiRUNgN6su13uL7pZN3/g26lNK383i5UTxBiZkF/iySdAs1h
         CBTuKv2jocq7hPI8tovHypVg6OeprMt6SZFkw18IjJmU+yTkZfo8osoEZXs0ORg1tkiT
         NECik21HHFUg3lLkdKSMRTSd0vKa6IO1abY/9xL5htQScOOmb7FXmJ9y2H/4bG2Fl6+W
         8LVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773207137; x=1773811937;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=olTyyzBo2D5n62FYYMqMF+UNjzmxcvx7lFogltM3uOU=;
        b=BA2hmmA5yb5qGGPp+ck648yTDCsDb5Z337IAkO2Bh4kwabLiBsbPz1LT3A1wUFf5qK
         f6KwaZvBBFVonw/BE3Vp93FdAnFTbiMSd6uWdsPe0LH893+/LmzVtuTkefJHbdLuXntd
         pUdNjWO93BoNTphXa5b7MG41W6pduPhioaLxRBj/FZvRIz2AMZrKSyaEuAoJHyHEkMxY
         2m4BT8tnSjOxwGTaBOlI9dCiPp5HhTX75Cge3XS/9K9MGQ+rIjL/2eY1N59r+S7C2kkq
         RPjr32DzEdySv4ZN1q9FHyQoJOPY9dTH9PEx4JpIJOGA70r0fzwF7obBV0DdLPgWmyZ7
         Vs3g==
X-Forwarded-Encrypted: i=1; AJvYcCWnSia0y1b5pYUPRQu/fpIcR5/m8MfbJyhsnKZY7i+svG0Cw7edQVqyAWr9qPkZ1y3h7pP6uaQDyqjw3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwT+vypf6LCW1UQ1iDOi1ixvL2ZKpXnsS1D9TZZFyPYVMgHK21x
	v758nQxjLBBkcKw8P0NegFpRLxkxBg2exllnNkPWysNBm/cVMNgnhSpSmGjxSICIzab3pgXw+uo
	Q/FbufcBRNEFiX4mpHZN1YTmJ5CuwibCmBRgGZq0pw0vkwm0lwXNZqoQ9aQ9LNbw9Kw==
X-Gm-Gg: ATEYQzym+DaBCbZZJ5vCp/jD1qNUXCsrI1ccS2twFwDalxf5hIcoEu6bdWpChCioiKb
	VD5Ef6hgIRo9Vt2BTyQyYza624wWJwrD/n4vh2a+/2LJEThdtB2Us3lkES6iJOoWL+S4K8b+GEd
	KPpCPg1Ho/D6dNlHFN6GIhmcDslZWFF5JoEF/8bd2mlhEa/GHxSSAektia+rfraZ9ayhYfB3x0s
	Hmd4sJU8GUOkYVztDULPjUPElUjrrVfNuWK697ncwzkLsFdcORQ+k/e+T6Z+RZUUfnBBySP9857
	GaRqILmK2iLSowGp9IWzD3VobvCSfouX8r7Vo3uJ2oKSztKv24sbYeG726MjcHITbVehiJC7Wnu
	D88orpI2lVlb7zcv8YCoYgjSUwnqLMc9DxpmsgX/nkfwiRACRKURXLC2LiXxu19WIFnrgTJXYoo
	D/LZKpKCM9gj5rGcIYk6ZvjBF909nhKWvsNwI=
X-Received: by 2002:a05:620a:6cc5:b0:8cd:93b7:ebc7 with SMTP id af79cd13be357-8cda1a7cf07mr167060385a.74.1773207136753;
        Tue, 10 Mar 2026 22:32:16 -0700 (PDT)
X-Received: by 2002:a05:620a:6cc5:b0:8cd:93b7:ebc7 with SMTP id af79cd13be357-8cda1a7cf07mr167057685a.74.1773207136134;
        Tue, 10 Mar 2026 22:32:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15602e2ecsm213902e87.25.2026.03.10.22.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 22:32:14 -0700 (PDT)
Date: Wed, 11 Mar 2026 07:32:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 10/11] media: qcom: iris: split firmware_data from raw
 platform data
Message-ID: <a5hlaakujhy2ternljhbgydtj74aendziboqmcty3ksj4c5skj@p6bmw7graltz>
References: <20260228-iris-platform-data-v2-0-acf036a3c84c@oss.qualcomm.com>
 <20260228-iris-platform-data-v2-10-acf036a3c84c@oss.qualcomm.com>
 <c9ab511b-c773-fd99-45e2-54fe619d3576@oss.qualcomm.com>
 <2w4urjzvo3ccmwoggjzzxxjhfgmplfgd7ojj765yulnlkesoit@nfancaoqqvzf>
 <23d6a9d2-7102-78d2-053d-037227edcd69@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <23d6a9d2-7102-78d2-053d-037227edcd69@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=c9WmgB9l c=1 sm=1 tr=0 ts=69b0fe61 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=NO05UAudYb0SBG__3SQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: -611z_DPYM36paG8iq7fWefcRBjufG0V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA0NCBTYWx0ZWRfXzA4mZsvQYDBW
 tgbOT3+0teIEBF3eN6fEJ7Iz3w21qAOash3Pnu5aXTRQ5vVK3NVUSec5UvkPZiIz9/rr0VScDAK
 CeAZfcDReYJT/pCaM+sgp9K6p3wnicnv93C9pe8dUkUj0KJD6di3t5WlSiSkipKUr5faK3LCMNG
 F/NvoX+b1z2ihqAgiaVcWgY9pMC3RJDUyHvWxhNVQcdWqfffAuH9p5TlhSlfqrDZyYzZWiSV2Jv
 UXw/NCblF7LLpVjY+bwge44Rvl5nCAfsdj8jNMIr4s39DRQrRp/cSDSEEgewpWLPHH01ySD1uGr
 tQO+PGKLPj9sah4f8Tf0MQDl3NmYn0F4nBwz5nP08GW138Rw6Stb0v8xJnVGKO3zy6dSPgW7cUi
 wOSsDK0W8aAz1YYt6F6AER/G82Pnt4RacOaocT9bcZHgSjGlve4eXEu9ToPC+U+6TVm/kBcSay0
 cbqnOGRDvNd1I/bTnJw==
X-Proofpoint-GUID: -611z_DPYM36paG8iq7fWefcRBjufG0V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110044
X-Rspamd-Queue-Id: 8180E25C769
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55302-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, Mar 11, 2026 at 10:39:54AM +0530, Dikshita Agarwal wrote:
> 
> 
> On 3/11/2026 5:53 AM, Dmitry Baryshkov wrote:
> > On Fri, Mar 06, 2026 at 04:28:48PM +0530, Dikshita Agarwal wrote:
> >>
> >>
> >> On 2/28/2026 8:56 PM, Dmitry Baryshkov wrote:
> >>
> >>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> >>> index a936ab2aedaf..be3449861993 100644
> >>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> >>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> >>> @@ -201,9 +201,32 @@ enum platform_pm_domain_type {
> >>>  	IRIS_APV_HW_POWER_DOMAIN,
> >>>  };
> >>>  
> >>> -struct iris_platform_data {
> >>> +struct iris_firmware_data {
> >>>  	void (*init_hfi_ops)(struct iris_core *core);
> >>> +
> >>>  	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
> >>
> >> Makes sense to split firmware-related data out of iris_platform_data into a
> >> dedicated iris_firmware_data, one comment though, get_vpu_buffer_size
> >> should be in iris_platform_data since it describes the VPU’s buffer
> >> requirements independent of whether the SoC runs gen1/gen2 HFI firmware.
> > 
> > Not really... Your patchset to bringup Gen2 on Kodiak points out that
> > this callback depends on the firmware: we currently use
> > iris_vpu_buf_size() for Gen1, your patch have used iris_vpu33_buf_size()
> > with an explicit comment that it requires a bigger buffer.
> 
> Agreed. However, that case is somewhat unique because the firmware code
> changed significantly between the Gen1 and Gen2 releases. In general, the
> buffer size is determined primarily by the VPU architecture, as well as by
> the features being supported—especially when specific features require
> updated buffer allocations.

I'd still disagree. In my opinion in your patchset we should have a
single sc7280 platform data (because in the end it's a single platform)
and two firmware interfaces associated with it (one for Gen1, one for
Gen2). So, get_vpu_buffer_size() callback will have to go to the
firmware interface.

> 
> Thanks,
> Dikshita
> 
> > 
> > 

-- 
With best wishes
Dmitry

