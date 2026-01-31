Return-Path: <linux-media+bounces-51886-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCqBIDDAfWkYTgIAu9opvQ
	(envelope-from <linux-media+bounces-51886-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 31 Jan 2026 09:41:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D54C4C14A9
	for <lists+linux-media@lfdr.de>; Sat, 31 Jan 2026 09:41:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 90A713010163
	for <lists+linux-media@lfdr.de>; Sat, 31 Jan 2026 08:41:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A82D6325723;
	Sat, 31 Jan 2026 08:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YAyz2uvK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DkMxQZAQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE821F91D6
	for <linux-media@vger.kernel.org>; Sat, 31 Jan 2026 08:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769848868; cv=none; b=R1svFvx44hT/vW4tjcFadmZOgi31d3Z7Fo30uIubKIn6yTePkH4OkE9WtxKy40JBl72AFRhidMs/33iSpc9/R0QAusT5vAde1XxFqwQ5W6n+rmrS+Ib7N6KN5W1DhAN8yKiv+egVt+m4m6Roeow5t9PZHJns1HkZnJEXdPjUNL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769848868; c=relaxed/simple;
	bh=oB9QcaC19nqme842vHtnShH6XLLgaJxZjZbbgezZVu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GrJcSra9LahzU6qEUi00XqGyYuCJRxzIo1KWF3eTv+5hy0TAFeOsbsx4G/radz8I2Na8nsZzIi6jEZLWSZwVsMMCmJQP/TR+e/+sPDds9M/iZg3vi3Mep003ho7Ok6iD6BYvtIwEDNsVRLkoh2r/OLF8UE51HmUoasPZy4HZOW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YAyz2uvK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DkMxQZAQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60V4edjJ393384
	for <linux-media@vger.kernel.org>; Sat, 31 Jan 2026 08:41:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2B2x+Dd3cpyw/HDLjqqfqkeD
	kafSL2hk0axLDy9uY8U=; b=YAyz2uvKHh4yabRyC7j5AY3SSPtlwgx8BtG6JbuD
	ssMEsEzWqtskaY2KS2lh0jBd0rnElepYyFI3vId4raOK1ewmzV2VW99O7bWPAz99
	EONFXXWjqQskXf/1dzXDOLY1SjTxkgNmlJmr4+5tcv4RbnvwWPTRN4m4foQLMDNa
	h0iyLXyDRbIlg3lAF1G73TC6+g3WVdHuNBFDzG81DgGeCjM7A+ral4uLctyZ9b1M
	UNNONsnIEa0e0v6km7mh9yLVQn4/sj1i93S/TCrDGLGLgsYSOzPfltxCH5bMjO6e
	ONBwBW0Q33RWnE/sN/N7xdhohWl07g9mlyme5RS75Kx70g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1awnrfff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 31 Jan 2026 08:41:05 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8946b186018so103369286d6.1
        for <linux-media@vger.kernel.org>; Sat, 31 Jan 2026 00:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769848865; x=1770453665; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2B2x+Dd3cpyw/HDLjqqfqkeDkafSL2hk0axLDy9uY8U=;
        b=DkMxQZAQwyq+bBcbL0Dz3sO2sb+7xp35R6biNUG5NM8bTPEu/F/aQRKFmOKUMseuxB
         L2FK/CL1LWilzUbg0acVjy3cwcGHZLNrqY06/cRw9O/3d3LTBeuyGz8gllJrmJW005G1
         2yDuj2gPwPAU6JKtcuqvci9oT4vCSJkZl4JPS4+7d4M4u/faLX8HL0U4rYaYzhcIpRHY
         q7iU13PLtjVeKyAZf5e38kvoyNRmczcmiXfO43Eiko6UIkeRtZy47DomdV9ywoL0yFV0
         o1/NXbtzPa3o9PIZVJacPAXzfe8W8wZo06KfFOID9PJocO/3mrcF8ChQDxWoIK5ViwqQ
         Wi8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769848865; x=1770453665;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2B2x+Dd3cpyw/HDLjqqfqkeDkafSL2hk0axLDy9uY8U=;
        b=btUS19UbucId+pfmHQkkVkHHK2DMYS9z6x18ZzeswGTBsJdYxjKCVC3KImWQwj9kgh
         IaYkNxE+ffkmbYVMcV2IUUCa83u6hvIdKmp+x/fL5rh1mzt2hLlnv6xngvwipu1Qgyv8
         Vvp+2sAYkytzPXkx/SsCw82v7VJ0uFtkhfyCfDPnBAdw2Dgh05TlCiU98nOJu2J1I3T+
         qyvaaDVJiytw6Mwz8vDtNd7Lvoz1A6/JqU6TtyhIMIk2uDGuhkhh8PVz3lRE98Ng396l
         eRpeMcREQuFvNBOqYJMZpPr5VHCQhhDpH+P3twUsDOIUUGWphtzcGXW55DMM5mV2OolX
         7ESg==
X-Forwarded-Encrypted: i=1; AJvYcCUfnrbcsxteADa4D5scVxSDNCVQZdoX4I/wWWw4eyqV9oJqIOSRg0Klf+tzXUcALVSyb2WsTTBYjjcw/w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6nm+I5K88fjS7v8T0+pgd63QaYXYGaq2AtX/t12rDJaXErI4q
	gixqCpiz34ECjED+pfuxl5CEEiUfRHvBQ0izAO7Q95rGybs/rawGqmoLNeHtS+RKy+eL6xSkmO9
	hw3KBs/8EaaqsTNA/XCwltGzGedF1t5u3O053iYzVEJZpdPbQQ8yABX7wA4Dc3pyDMA==
X-Gm-Gg: AZuq6aJO7/UacUHqkZh0B+4yLyQ99DejRGqvx/q0nZWoPPLKPCJUGy7vpr31L/yLuxs
	UzRLjBVyT9TaMr8h35gcHFnAtHm3x87w6H5rKmOqpgPMhYMTg5J+uxfwT/OfESXteenazBtvD//
	/6Vg6wXE3MGlQ1zmUhgAMuP2ddOB8J76pQVqd9VvX5sThY58yyZI6q271GG/McgF0z8ZWQkJO/h
	j7bAJ7LLW3rr5YO4f59DSsXESvirnlzmTaE8XebYEMFSjIAlWOeNZ+Ozqn3DbxsvytekGbEgv6P
	zEacxLbgKO1+Wy1hT9M+LbJfQe7UHg7d7CFMj0fijxr4LxK0pZng+GAgxYSzxYg+iMUz09gfF5M
	OQehFVDAgIQ5D27r7x/TOrSM760osw2ZgK+tK1B0uioQmG97cPXc/TWcTItxlF6C9l4k60yOrhN
	u2M7VVH6adG0rXs1VmXw6srd0=
X-Received: by 2002:a05:620a:4151:b0:8b2:d26f:14b0 with SMTP id af79cd13be357-8c9eb1fc031mr685531085a.3.1769848865016;
        Sat, 31 Jan 2026 00:41:05 -0800 (PST)
X-Received: by 2002:a05:620a:4151:b0:8b2:d26f:14b0 with SMTP id af79cd13be357-8c9eb1fc031mr685528985a.3.1769848864555;
        Sat, 31 Jan 2026 00:41:04 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38627876ab6sm17930411fa.49.2026.01.31.00.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 00:41:03 -0800 (PST)
Date: Sat, 31 Jan 2026 10:41:02 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>, quic_qiweil@quicinc.com,
        Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 0/6] media: qcom: iris: encoder feature enhancements
 batch2
Message-ID: <y55kvpanvwryfo2kimbumsvl4q76mazr4j6tb2nc26sbctxcp5@l4oqqi3x3cy7>
References: <20260129-batch2_iris_encoder_enhancements-v4-0-efaac131a5f7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129-batch2_iris_encoder_enhancements-v4-0-efaac131a5f7@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=MNltWcZl c=1 sm=1 tr=0 ts=697dc021 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=3UXICtTis499TI3vC5MA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: 3Pmq1ZTMQoHt7UkWe_IrPpmqByM32_df
X-Proofpoint-ORIG-GUID: 3Pmq1ZTMQoHt7UkWe_IrPpmqByM32_df
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDA3MSBTYWx0ZWRfX/aXGUzEzz4/4
 GxC45W8YZDnBIWF8n7bQgHi1N23lROsc7fPAeCT1l6/5dc3OWXsnUSgBitk6MvaQcRhA7F51g92
 JQtFzW7/R2+nBGFBVkfs78aW4k7mwsH8oUuCNCVbuBZfcZvwLtvPDBh0NOSIYKKrdeVfmbSL2v4
 VR+tvyh7d5vjfb73gUN2HOUGPOONhhc04+e/Y2u96Qaccl5V+ufVHuyCl/OZ38EuFtb9LekyrAL
 I2Hvb/jS6lTfFfkAlzOd0KgpOQYOCUUlNCV2QUvZeS78bqpHSxOQOIF9I6t7vHU+XKG4Do8RRwh
 0TYWLNbok6zxj7i4GbL08+nb6zXrfkwZrMEILqdEb1st7IzDdJqBgPckH/kS5rybeuwMQfCOKM8
 eor+fZ4UBSH9nebdf59cPheFGp2bQrxUnp8zTdG9DQO9voHaTEBibGniYRO0XOa6qDvmpb4eAbB
 mHe4jM11RWF05JV0hag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601310071
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51886-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D54C4C14A9
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 03:48:21PM +0800, Wangao Wang wrote:
> Hi All,
> 
> This patch series introduces several enhancements to the Qualcomm Iris
> encoder driver, improving support for V4L2 controls and enabling more
>  video encoding features.
> 
> All patches have been tested with v4l2-compliance and v4l2-ctl on
> gen1:SM8250, QCS6490, gen2:QCS8300, QCS8550, QCS9100, X1E-80100.
> 
> Commands used for V4l2-ctl validation:
> 
> Intra Refresh:
> ./v4l2-ctl --verbose -d /dev/video1 \
> --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
> --set-selection-output target=crop,width=1920,height=1080 \
> --set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
> --stream-from=input_nv12_1080p.yuv \
> --stream-to=output/ir_random.h264 \
> --set-ctrl intra_refresh_period_type=0,intra_refresh_period=30

These commands only set the control. What would be the way to test the
actual encoding? Possibly using gstreamer pipeline?


-- 
With best wishes
Dmitry

