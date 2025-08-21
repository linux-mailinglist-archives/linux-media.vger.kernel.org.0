Return-Path: <linux-media+bounces-40645-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FA9B300EF
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 19:22:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E73611CE6CC2
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 17:21:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D502308F02;
	Thu, 21 Aug 2025 17:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FnpnpTMB"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9712FB627
	for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 17:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755796853; cv=none; b=fLkgcw+D5stf2HQgZ4XB7dhe5zu7cE1NJiY9ajisJo6wsBr+cvpva77to4agc66SNM5JduFj/H9EfSpKJhyH5OJBeCbiBxDzBcutUrbV95WKreuYmolOB2rPQW6kPdj5c+rHyXZlpK3ZK7BTX7JswCyMnniemrK+AaZrvNrl1Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755796853; c=relaxed/simple;
	bh=TLhz3rMWCYqIHd1iDP8owe1GnVQepPj0RnY98tlw4tg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n6KjnmgdkTJ8yfAbE9K9M/7ZlSFK/2CeH4iq4CbdGkM28OVOzSHw9veBckdxmlM8AL860t4CGEbVT2U4iOBQ0v9zKs3X8niio7Yu1RjCjQTo9QlO1P2hqIyGw/5G8eidWc+WxkTiNdmCj/oCRNoPojIT3Amn5GBuKxmlPf0BRJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FnpnpTMB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9b9Tr015176
	for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 17:20:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aoikleB8qrZ5qP9Q/cyNCn1p
	Z+IFQyJRynDCSYl4hUs=; b=FnpnpTMBbAjGVONZOUKSg45IKIU3/Pt/XLcXMtBf
	ZxuQp5uWC/cq1N5YbOoezaPPyBEZB00p8bN+/xX2uNGVQbtA48PLCiUjlFuY9rLm
	W7tb/H5ZNYtgNlPGbK/6i58P2CgLxj+qRO1GjoXbYwadaCnLkLkXoiW5JkrT476z
	zU7lHrKvjTE/o0ApQEGMY8e4I8jPEz8Comuec7kBpBrNhnnqbpEWYPwG8NOO/6qE
	f+pPMoG7pOsufRCKCQz/lx5H993Jj9wiaTQcqNlMs7SPj04CFuRZjwOcZ9IuVygt
	jxOmM1ge/LklBDcRj3xAOInuaGu0QUppmdPfaJxRbbgYLw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52cp9jq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 17:20:51 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-76e55665b05so1174708b3a.2
        for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 10:20:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755796850; x=1756401650;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aoikleB8qrZ5qP9Q/cyNCn1pZ+IFQyJRynDCSYl4hUs=;
        b=jGYIy+/a8pPq2NHGzU5APL8VGEdtkF6z4VIzgoBMJnnnL760iAUt7/hqCYLqPUBOop
         ihMoIYedzO6WMa6iXUf5QyKgQqhfq3Hn+Etvb8D2QKTXiNTGXzLfhjNGuOcAFGtAzIGS
         B2tkPYhjHnHtwQVjMaIhPQPCFcdBVSWi5VYHA4utj5ZGkjKHn7hZCgoXC9BGrlqKa0+J
         x4FrnC9BUhzd23szhV+IK1DYWheWl+0b1fWWmRyfJ5yuuxm2wgxniO2rBEi1zaAbkZI0
         Y2oN2aZM8YmpjbNtQofxOrKdwqwWwZS5wKweWef0NBpqsc+Z2w6JKKYrvkeAoBNKJ8Jt
         XCxg==
X-Forwarded-Encrypted: i=1; AJvYcCUMKNd/n1ZJyQYvM15m16bMlk+6FPIiSvRchgykl4rdS3eisENVAi+oYTKgX0jvsvoZgBcn9txcF4/UcA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7My8AsycMqajFm9ncYgldADOglM5Q9queBr+W8yfcmk3A4VeE
	84XDTOQGAKIRaqj9gqB0KB5nst4me0ojD780VNuToiJX66jxc00Jhy5VxOmlORUAuO7vAlyqmD/
	1KvEaKbikHK9fmCuW7QHvDoBxOahToaOvmCx3yQ0ApVIaUiZRoVHdpYHydClQOjDgYQ==
X-Gm-Gg: ASbGncsW8nXPxxKhaMxBzoFxVUNfIKm10nmE+IxRMljoZv3dar4R4taxEsrtM+3o35m
	VjMIACwWwMOiSMQ9XsrJk0n3Mg7LrkIeysEu6WjYj+XPCCjZiwEf7UmQ7SlEp7hzs9ABru1GFr4
	WAR7xrp4MCscKK1iLPx0gKX4seCT0o+bTEKFyGqhjEpP5+Thy2aW1muYtNldCZxP5j3S67maT5R
	OwRsFcUFatamn4xfUt49Xbgoqzs3+C8ZVKh8LWxHrFM4nFqlWlGH+na0a76Y3PRwkUchqLMTW0G
	w4Llo7MEj1bRTQ8nTGVwbPKRwpuF1zX950ikXoKj16XS4VuXMjmyNTLAyoTKA/gNUXs=
X-Received: by 2002:aa7:88c7:0:b0:76e:885a:c3ef with SMTP id d2e1a72fcca58-7702fc18b12mr165887b3a.27.1755796850501;
        Thu, 21 Aug 2025 10:20:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqqgWcrAIo2xfc1nSKhO+omw39OC5L/phKySKVnNxOepfjjZ83oA3Goh+/8/RVSK+mnw4EhA==
X-Received: by 2002:aa7:88c7:0:b0:76e:885a:c3ef with SMTP id d2e1a72fcca58-7702fc18b12mr165864b3a.27.1755796849972;
        Thu, 21 Aug 2025 10:20:49 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d0d1b63sm8977588b3a.7.2025.08.21.10.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 10:20:49 -0700 (PDT)
Date: Thu, 21 Aug 2025 22:50:43 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 07/11] firmware: qcom_scm: Add
 qcom_scm_pas_get_rsc_table() to get resource table
Message-ID: <20250821172043.fh6sr6w4bwyhov5q@hu-mojha-hyd.qualcomm.com>
Mail-Followup-To: Krzysztof Kozlowski <krzk@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <20250819165447.4149674-8-mukesh.ojha@oss.qualcomm.com>
 <4a60c3d3-11fb-40fb-8686-3d83539f250b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a60c3d3-11fb-40fb-8686-3d83539f250b@kernel.org>
X-Proofpoint-GUID: _dV3wEPNAPkEdDFRg_MG0Fa5TpNYSQZm
X-Proofpoint-ORIG-GUID: _dV3wEPNAPkEdDFRg_MG0Fa5TpNYSQZm
X-Authority-Analysis: v=2.4 cv=Xpij+VF9 c=1 sm=1 tr=0 ts=68a75573 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=SpqgzKZKrfenv9_tDssA:9
 a=CjuIK1q_8ugA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX7LP0/200lPD8
 5lnom0+YEsXjAPLeHx5MpXYNNatRl/XIc+BPaqwCBddG/byI4g2Mq0x87fliVRSwKwWq+q/9oaj
 ejjJYyK5Aizda1kQdwBxxRQ3+toE3FmN5AGw/UJ4vYKpA3htP80E880cNMfHdwYiPKdswtcNPSu
 g4NjeUGEB8iBpBsDR7TOGQ6TCxs+3/flX5F4/4eF3qsxnm4vfrvVj5rCMVZxtjziyzJLh8Ygq8g
 ybMzxK/n/CICZNttUm/mlQNUIqifHxciVDZt11t9pdyykbGzQZmUHpnSER8VKudQik63ZvrC6xc
 YAopepzeNovRFjeH10KdgxLdwF9ne44phCkJzCed+jbwhbM9nqh2ErVS68NCke+f6AqNmHz1d9d
 5P3kkIzQwFNO1uC0acmR+18EL3Yy9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Thu, Aug 21, 2025 at 05:05:59PM +0200, Krzysztof Kozlowski wrote:
> On 19/08/2025 18:54, Mukesh Ojha wrote:
> > Qualcomm remote processor may rely on both static and dynamic resources
> > for its functionality. Static resources typically refer to memory-mapped
> > addresses required by the subsystem and are often embedded within the
> > firmware binary and dynamic resources, such as shared memory in DDR
> > etc., are determined at runtime during the boot process.
> > 
> > On Qualcomm Technologies devices, it's possible that static resources
> 
> It is possible? Only possible?

its possible 

> 
> > are not embedded in the firmware binary and instead are provided by
> > TrustZone However, dynamic resources are always expected to come from
> 
> So dynamic are always in TZ?

Yes.

> 
> > TrustZone. This indicates that for Qualcomm devices, all resources
> > (static and dynamic) will be provided by TrustZone via the SMC call.
> 
> And now all of them are by TZ? Previously it was only possible?

Will correct the wording if it has cause confusion, I meant, currently,
some of the chrome product supported in upstream has resource table in
subsystem firmware while most of them Qualcomm SoC supported in upstream
does not pack resources in subsystem firmware and rely on Gunyah to take
care of its static + dynamic resources when it is present. On its
absence, TZ will provide.

Will add above thing if it is not clear.

> 
> Srsly, what sort of AI hallucinated slop it is?
> 
> I think this is pretty close to proof that your submission does not meet
> criteria of open source contribution.
> 
> Did you run any of this through your legal process in Qualcomm?
> 
> I don't trust any part of this code.

I don't know what made you think that way. There could be confusion with
my writing and may not have expressed the thing i wanted.

> 
> Best regards,
> Krzysztof
> 

-- 
-Mukesh Ojha

