Return-Path: <linux-media+bounces-40454-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0385DB2E128
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 17:32:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B11A01CC3E2C
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 15:25:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B0583277A5;
	Wed, 20 Aug 2025 15:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GuIKBIbS"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A622E8B81
	for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 15:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755703114; cv=none; b=PbJnvksaHsmKzFG8BcFOqByrjJn78JO3hFHUZjgEAvMRaE8kYh+9kBnFTNvtSbSNQqZcUle4dmhB0r4XD62RjwZAfb0iLPoRMJLSmDx2LIu/tTDRmY+fif1WNFoEEOt9vNqrKL/1tInmAtDi4Rcw8msLUhXwA4zZBRGnAXLboP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755703114; c=relaxed/simple;
	bh=DtQjcbMNvcByxf+0zZY1naeHA3tbiB/xArykXaaUpLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xo27dZjjFrvbEm/ok7XiDKQFBJZe665umtb9zJqFKs4COgrIl5scjVIs1hPqZ25gZzc2pWFyAxISA785V9Oie8g3/5oIbUAhtjyAk3h3uD+aBIJkxqm2wC2kVIrNJ9W+yqFu+MiNjt0CQUzhCejkTst0BnTZT6rP0o0fgRuf84g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GuIKBIbS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KA5JSZ028580
	for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 15:18:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hlCeQ88Snci0AxZIyBl3l26zn9aHH0uhjgkXgI9gCMA=; b=GuIKBIbSbDq7X2qG
	Tq2AtzWu4ZvKaJ6q476gogBr4bJL8h91UGpYCiYzEf4JVOqla8AyZd58F6fgMgfK
	563T8OSGnqqxMDTcyRcGEgb2UXRSworDMqXlmnS0rlkjZ9vm9cG2v+sgLQXWC69o
	i4nWQ/exP9Ej9kjTN7IwpZQcRFsmPTKu64ws/P4Qxl3j2PffoMfqXmsz6Phm452q
	B+OKWJV9FFfIRTVe+33/Q6NuVd/kYvMIsTc3dfi9qf5HygcxkJlUcvkJ78G2f7O+
	+Lx0W7H7c5oK+5wsEIISXZLi6A5x7eOQ7QXV0A6I9RGa3rq861auU1095NbqsvdA
	VvUoHg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52at3vb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 15:18:31 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2445806eab4so70123425ad.1
        for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 08:18:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755703110; x=1756307910;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hlCeQ88Snci0AxZIyBl3l26zn9aHH0uhjgkXgI9gCMA=;
        b=rBD6sxkZuMCbl8xo9EqDP6lzgk6xI72viCZDPbAjlEQNLgFs9yyvYFLPiDS2rwjOKI
         tCnijVUCb9dXKvlk2QaxrnY+FqpaV7tOwiAV5IC3/no/Lb5d/aBsH3FVEh+yMOREODxn
         X9dsRjFejCcWLtnF5edW/EwC0Ydj/Ttc5muV2xkCRAO4Q8YAveNIpZ+6GagKMcHCtc2u
         vLp6Ws5Mv+s7fLOinMgRxWPdMZKJ/Wl/qLBL0XUg5kVQslTL5eECLWVdEGF785n6x2vM
         kfLhRbEbroQ3eYEQw7tk8wQGTjC52p/EFaykc4fo0QcfdAg2VR12O91pEGLMVNgFebQA
         j+SA==
X-Forwarded-Encrypted: i=1; AJvYcCWTfVQtXMVj6NxAxDMGgDQcQsIBgfwNEidfPEm/XvSAxxh+zXM2go1erAod0rsuRIulKFivdLbOq9AxUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLX1NRLC5L+m2rvRpmCQjpMsEu9kUPW/sfveGc0j8xDnhBTgSb
	3K/pDSbzAAQ3Fu6jBzv0uQHzWVmgZcwKwSefCfW1e8UQqrxrX1UdOjpdhvqxEyUmSgY5gdfRIu2
	wOpd1qItJ90IsG0RezJkONhfuzTNENiBpVWuIY5XRw+FLIkrbld+XQKgbeR55sbBtEg==
X-Gm-Gg: ASbGncuCnrZp4N+FFhd0Z4wAo1QHtLUp0ktsvosbCqXCAaeSRZMfS1OwJUEI7/jc2F8
	lxgC+11Z5l0R4F9se5EVymBbXEX41WhNuiyCHYXPMM4smMDE50zQy73+Uh58qD2YeCqD14NLRZ9
	6DpGXnsxfC9vxJdVt+jn/3iGJ75TunK7KWKqci8gXizY1/XxGdXkf1nlCVoLWSP3D5QQ4Nug6XK
	MBUSQQBZPthhyqxsHIoJiKkTMZsYWPTBXfWM7K/yXfKh/qvafbX7UCgJZwl7ZlYr51SvQAT3Gi0
	w5agLrNRitv9ME8O3+RGEG7whbNJ3aeEiT7htvn7dgcuJeoleOs9PEdkAtaKIYnrE10=
X-Received: by 2002:a17:902:e750:b0:234:a139:11fb with SMTP id d9443c01a7336-245ef22704cmr37010815ad.27.1755703110144;
        Wed, 20 Aug 2025 08:18:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvgrjEM45iEXFzZdFgh90MepofgKG2tYDHkeGY0eIX8zylArW1Zrd7Fk7SrPTDwjAl/RsWbw==
X-Received: by 2002:a17:902:e750:b0:234:a139:11fb with SMTP id d9443c01a7336-245ef22704cmr37010415ad.27.1755703109682;
        Wed, 20 Aug 2025 08:18:29 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed50352esm29255935ad.128.2025.08.20.08.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 08:18:28 -0700 (PDT)
Date: Wed, 20 Aug 2025 20:48:22 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
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
Subject: Re: [PATCH v2 06/11] remoteproc: Move resource table data structure
 to its own header
Message-ID: <20250820151822.6cmowxfsheqxfrnb@hu-mojha-hyd.qualcomm.com>
Mail-Followup-To: Stephan Gerhold <stephan.gerhold@linaro.org>,
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
 <20250819165447.4149674-7-mukesh.ojha@oss.qualcomm.com>
 <aKWDXySSt57tXHVP@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aKWDXySSt57tXHVP@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXwCtsnTQTmjRk
 v/EvsZ/UxnBXNHXrW53CeRblnX5jOUE1RrhBWD00YlCd95OwN9UTmI7GI47uU+x8BAVNmrwwlo6
 bx1b6NBfmbS6X0oUSVSeyiWA6TvjeOx+Y3taHL0XNugBak2/kxrQ5aMwK2kYJD3UJpIznG0UUZe
 /SS3s2Oc2iwbR0Q8BNHo+HGgQIoSQx9zKo1efb1d9pvUanU89TsiZScC73TlS9DXFhuBS72Ibnt
 +L6fUFx+kBJA8g+4BPwRBHX9LgDOAy73wALYQfs+TOpnJCDv69NFx7ZKqsDqSyQn5mh3FErEjxC
 SX1EWlywvxMWq+XHRRFDw8X8lC3RxhHuKgz6lsDx8PDxPila3u/zqs2Gu2Y8FJqMjCalL+qYE16
 /zI04Xpmhw3wJ4gVIf9/K61HEKongw==
X-Authority-Analysis: v=2.4 cv=TIIci1la c=1 sm=1 tr=0 ts=68a5e747 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=r3SgeffVVk19ujrvIvAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: W4QF1iJ9jAuMAxRa6l_AWY3MKRWAwdpF
X-Proofpoint-GUID: W4QF1iJ9jAuMAxRa6l_AWY3MKRWAwdpF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_04,2025-08-20_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Wed, Aug 20, 2025 at 10:12:15AM +0200, Stephan Gerhold wrote:
> On Tue, Aug 19, 2025 at 10:24:41PM +0530, Mukesh Ojha wrote:
> > The resource table data structure has traditionally been associated with
> > the remoteproc framework, where the resource table is included as a
> > section within the remote processor firmware binary. However, it is also
> > possible to obtain the resource table through other means—such as from a
> > reserved memory region populated by the boot firmware, statically
> > maintained driver data, or via a secure SMC call—when it is not embedded
> > in the firmware.
> > 
> > There are multiple Qualcomm remote processors (e.g., Venus, Iris, GPU,
> > etc.) in the upstream kernel that do not use the remoteproc framework to
> > manage their lifecycle for various reasons.
> > 
> > When Linux is running at EL2, similar to the Qualcomm PAS driver
> > (qcom_q6v5_pas.c), client drivers for subsystems like video and GPU may
> > also want to use the resource table SMC call to retrieve and map
> > resources before they are used by the remote processor.
> > 
> 
> All the examples you give here (Venus/Iris, GPU) have some sort of EL2
> support already for older platforms:

Example was taken from perspective of remote processor life-cycle management.
You are right they have worked before in non-secure way for Chrome.

> 
>  - For GPU, we just skip loading the ZAP shader and access the protected
>    registers directly. I would expect the ZAP shader does effectively
>    the same, perhaps with some additional handling for secure mode. Is
>    this even a real remote processor that has a separate IOMMU domain?
> 

I don't think it is the case and think the same that they can skip
loading and Hence, I have not yet added support for it.

Will check internally before doing anything on GPU.

>  - For Venus/Iris, there is code upstream similar to your PATCH 11/11
>    that maps the firmware with the IOMMU (but invokes reset directly
>    using the registers, without using PAS). There is no resource table
>    used for that either, so at least all Venus/Iris versions so far
>    apparently had no need for any mappings aside from the firmware
>    binary.

You are absolutely right

> 
> I understand that you want to continue using PAS for these, but I'm a
> bit confused what kind of mappings we would expect to have in the
> resource table for video and GPU. Could you give an example?

We have some debug hw tracing available for video for lemans, which is
optional However, I believe infra is good to have incase we need some
required resources to be map for Video to work for a SoC.

> 
> Thanks,
> Stephan

-- 
-Mukesh Ojha

