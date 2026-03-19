Return-Path: <linux-media+bounces-56329-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMw9HOPhu2lXpQIAu9opvQ
	(envelope-from <linux-media+bounces-56329-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 12:45:39 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE3F2CA896
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 12:45:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 213853014A3F
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 11:44:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D74B23A963B;
	Thu, 19 Mar 2026 11:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CkS7ZvZ9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jPUrb30Q"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7C9389106
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 11:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773920691; cv=none; b=gUXcBToibLTIXXry6V7Jb7x60oJonWaE+ZyfT583DelIVkjw4YU28pG333ZIN4zsVvkKvHD7u/eSa0SUAikeCsb9ISxrAb1mBVIDHOys5mkoKJ8V+5KxykOGPRRHYC3c+4LetRxU08gUV7ggB8e82G109KIejQEgTudnMWYkqI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773920691; c=relaxed/simple;
	bh=IMeaM7qyNNz0SPbcQiJYHpFhYP4+16fDehkL4W05A3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uE9pXbF6oU7t9zEE74PxUfS9XoVzhxPjFsxBcaI7YFDroSg7i4/u8K4wISTW0xN9PD3WtU87jdC+lApczNmWAwTaltbIpWdojLPqQF++w24rKpIepbrwq1iOSdHSQKDzGKdUpwz9BFrUlKoxJURLpMtZFxVmBeEh8MEoFOhRMTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CkS7ZvZ9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jPUrb30Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J74HS93369997
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 11:44:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jAym/nPF/f2HVSdL//JczLeb
	iTATqUB927vz7UGwmCE=; b=CkS7ZvZ9UmZBrul7eZFQWM4ZZ4hqPMgQxUuHRiSQ
	eErXPhYoHKwJ1RXQk3o2A2G5R5yE0kMJi7RpdFRzE1mXj5KUpeEleUGWbC09Fe8E
	5VuETYtfUfefOEoAY8Gvom2gcKqwx0QjAzUzhuKCNnQj6WGc1tj+9CeFLl4s04h8
	kmOwsOkpw3eLylJjVX9t+33Z6UDQwTltuN8npmT13js7L4fdxXcKDObhiN8qj/hL
	p/oyDGZMTBdmmoirQdqe7l/D8k7Wd9K6xZ4BeceytG1r7qNxchwEZ2EgMCmq4BXo
	hr1s4eLLWlUySxrLuHj2K6HfLNo4fH89cK5fBk9uoIeoqQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d00f9k044-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 11:44:49 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5091f12ed3bso56165581cf.3
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 04:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773920688; x=1774525488; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jAym/nPF/f2HVSdL//JczLebiTATqUB927vz7UGwmCE=;
        b=jPUrb30QteVC2fl86xVsm3FMVJwuQc0avmmqZDlb79JmRUf7HO9QeQSdqBzzz025W1
         LHUuX8jxk3KdF5zrqHoNtu+BOWTuUEK3Kw1opU43iqtYqAs4gXGEiVaLLO+2fT1ai6dw
         4Ifte5KUIXK4m+8yBLIylfRZ2LYSBnqTAhWIvhcqjhh2tOlsAjyXb8V+HISFBQ2Avl9X
         PL55izMfFbCJxwm49mqJDHghFo96/lRaqd0qs3XL/8MxFJ40+Xlrf3+pHMWLL64sVH6Q
         Mzaugvude3+zHnEcD1Mwa1Axz7knuGfhxN1xYpAh9ObPplcS73OGDWLoesJ+kIYCfHRQ
         s2PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773920688; x=1774525488;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jAym/nPF/f2HVSdL//JczLebiTATqUB927vz7UGwmCE=;
        b=FYGRdSvsVTkOmPMKpAi8UpmA4sp6o0wcnaYWFDIYsqJBa/ZAc4yl/bx3eBqpzZsBav
         pF+hD/cPwg3M/CmCQaaJMzjDfPVyJmTho8kvjRrehnI/es4GesHH+fP7pQ+TVKNYeLUV
         /1uQdu8plnCRYbwtJhl58Y0xvgqJBvx3zusmXjBorvY8UgdY9Dvl9gETOwA96J1yzWOL
         L+AgIyNzr/8Gms7KUxamXX9Z8GV9yPzhnmJxAbqIUEUxuzcgaXTYe9kdGw4DE019u/Dq
         P9QjCOSmhOvMZtJI0BJzYovVmIJddsVzkP4HmbVNk8oV+TLO9jf/Mxhy7GJfDtNjHICz
         XGxw==
X-Forwarded-Encrypted: i=1; AJvYcCVJFJSud4E6MhB/GkVD4OeMERIVn9LV+u6lOqB7BsDNyqkXMB7BOBLRzwgUwE2t/77izRQF+OayWkAQ4g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrIoAS53KW0Sj8UvZf3sVYkl1v///dBJYLE+ucERN0ZsBnojD7
	RyV3IWReOMySeBB5vQQ04CQStYBoEaaPBWvmmDwKqKhtNUjRGYg4OKdLMTj7dtvmGIRW4hUeHbV
	DnhkxYXt1U6iUYzfQs9cfgUIff1nprYobeIs+qPdD1nO2IKj9LeKR2EZ/dC5Xhfx+8g==
X-Gm-Gg: ATEYQzwbXefEOl9JW9ajEiZeFyG30sXvIfc17i1s7Z+sU7UyL9kZHhOsP5EFediewBE
	MpIvmFDi2R9IfKrUUGGjKnLSVbOLNvc6SoFI7GtkOmDDz7rMKm1HYCUwP4av2pQHOaBTF08bKLX
	nDlvZ6d+UhmuI7wgc7mTpbJzLzAn/Bc79BzPiF/NfG0YYsSyTFGNOKDWxUDwQKqvFwvtwf4vAJA
	zDr4MDs/69npMIKzcXOCBv10JKgXqSGKsuo6wtYPB8Tu32z4fEutrwM9wIT0wnoABP4xZS8OVlx
	AJ9xwgRZw5lmDhGkaH9pn1YrXqZ0YWOvBjtMUpVdSAM7Fy+HsOYmmMW/I4VaCyYHexskBU8VPUb
	JVmO4164Lw+QADz7Y9O79fQE/UDnRu6osLR3JQ9D2UJOTtuf2EuzpzGYZOSajpostBYrWsPxjHK
	upVd7L5eOR6oCwLVR53S9SsOltMKfE+jZtLG8=
X-Received: by 2002:a05:622a:34a:b0:509:2d8e:3eda with SMTP id d75a77b69052e-50b148818damr90864031cf.45.1773920688396;
        Thu, 19 Mar 2026 04:44:48 -0700 (PDT)
X-Received: by 2002:a05:622a:34a:b0:509:2d8e:3eda with SMTP id d75a77b69052e-50b148818damr90863671cf.45.1773920687988;
        Thu, 19 Mar 2026 04:44:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a279c6e471sm1165356e87.40.2026.03.19.04.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 04:44:45 -0700 (PDT)
Date: Thu, 19 Mar 2026 13:44:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v8 01/11] media: qcom: iris: drop pas_id from the
 iris_platform_data struct
Message-ID: <333357ytgiuiygnnra444vyf4wbdcww27idvymnpmyllixsx3o@mihebporybbv>
References: <20260319-iris-platform-data-v8-0-55a9566ebf60@oss.qualcomm.com>
 <20260319-iris-platform-data-v8-1-55a9566ebf60@oss.qualcomm.com>
 <bfba4e6e-94d7-4968-bae6-4beb3b01eb9f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bfba4e6e-94d7-4968-bae6-4beb3b01eb9f@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA5NCBTYWx0ZWRfX/MdOU/5gAgdA
 hERPRierspb+qEGBLJAwlCvUG+/giUgb3TVfaUSkFruAPRxRUqIi5rUuTx1MBVxs8YWD4xXBR5e
 vaQy8S9JJZ5l6vNTIJH9KREAg2y2dlN0bokeNut1zoSypa4QCLmmRwU8fSR/u5cLtbJlj5cfmW3
 1x7STvjajpIdVzM03xhBqwpUryuS0gp1cgHm9RikQsBxuklK7kwMd9fcXyuY89jV7nqDOCex6in
 3H8OT0iE45LkoY7A4bb636Zo10a2yKhDS4TNYqf9qV59wDMme9i7bdJhs+GDT4b9+PCNLAUcquH
 BRDHc611ScFFx7sBQk2xSkbVQlo6xD8aQsZovafB8Hehc0zsA3ATyYMTre9dQJqSgfCoPqVZBuV
 pKoqvjtyg191ub9cORg5OWNEtibpgYOZPqQVEGr7LkRkui9DfoFqzGnFALAl6EIdjCkTTOvjPWa
 eYRAyxEJrpuCz1QKlwQ==
X-Proofpoint-GUID: s3UsZVzAFQHHvMypbhPMRf7geQRZHC8M
X-Proofpoint-ORIG-GUID: s3UsZVzAFQHHvMypbhPMRf7geQRZHC8M
X-Authority-Analysis: v=2.4 cv=MJttWcZl c=1 sm=1 tr=0 ts=69bbe1b1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=_imjDmhTM-B0SO7G2TEA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190094
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56329-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6BE3F2CA896
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 02:31:38PM +0530, Vikash Garodia wrote:
> 
> On 3/19/2026 11:29 AM, Dmitry Baryshkov wrote:
> > The PAS ID, the authentication service ID, used by the Iris is a
> > constant and it is not expected to change anytime. Drop it from the
> > platform data and use the constant instead.
> > 
> > Reviewed-by: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> > Reviewed-by: Konrad Dybcio<konrad.dybcio@oss.qualcomm.com>
> > Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> 
> b4 trailers -u ?

Sorry

> 
> Regards,
> Vikash
> 

-- 
With best wishes
Dmitry

