Return-Path: <linux-media+bounces-54072-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iK7vAZhgpWmx+wUAu9opvQ
	(envelope-from <linux-media+bounces-54072-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 11:04:08 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8041D5FC0
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 11:04:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9BB9530791C0
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2026 09:59:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A55B438F93E;
	Mon,  2 Mar 2026 09:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JBERZLeE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H+XazpbX"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251EB38F254
	for <linux-media@vger.kernel.org>; Mon,  2 Mar 2026 09:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772445587; cv=none; b=Bp6MLjijoMoljiJL1M8HL/cVW4sHgbULlWvicAss/hFlo6sKlaXsJjQQnmo5tw+sYW2Nqh4J2D5PW8bvztNDlPtZLoaI4TD3/b2YmOeCl5tQYQSKH6sS+mRO4YgArNyO8kh/Vz3+EHNwOu+VbFRthvAgRHcGq7yAIjdrC0kvCaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772445587; c=relaxed/simple;
	bh=uLUn+rnOoZEihVV7gd9Rlp+WFhuBU0T1Ovy1ijSjIog=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eRFJ1b2xX4MKPZbCBrCUO8fz+N29GVdylLcAsTFA137VG8fijav/j97OhTzV43suuLEj9lUcM/vI+DL7pl9UG2ezPRKIV/0D0SHbIOJ0E5eedUOr13/8wI22dRz/lH2aufpEzRvTFAWmlm59n9S+XbwZWGwSNws6iKtpCKPbP5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JBERZLeE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H+XazpbX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62285bjN662344
	for <linux-media@vger.kernel.org>; Mon, 2 Mar 2026 09:59:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hj1atuOIc1Cnvcb27SXrJBvJGMw+QubsyXzzR8cajNk=; b=JBERZLeEAYqSBGB0
	c/5hZEDoQ/FHmVsVslZpW6WkjRetdf1hW92tqfRz/eTJS9UU16Njm0UDtpCb50Mc
	h1jv0vPaRenNguuqkVPl6g7vnQR+6o19cUxpP9EUt5OCUPXUKCQB9PQjc92gCL8Z
	ZoIpX1bsX3LSiJxSAzhMB3eyqANTSswIT4X/jKflF3IP26d53sSxswQmLuijEV8d
	fDm7CDoDilpYohVTX3QRCaHGwcYGcsB/HY0N8EgEgOV6bib8vPZPVkRHurl1UJrJ
	/kxtZoRGXf/Dg302FbUiprFB6Ka0Fbeq9Plwra/DzQLwT+Z9SnznGaTnNqfibaSA
	41GZ2g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn6r2rfwt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Mar 2026 09:59:45 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89a04e9d4faso172206d6.1
        for <linux-media@vger.kernel.org>; Mon, 02 Mar 2026 01:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772445584; x=1773050384; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hj1atuOIc1Cnvcb27SXrJBvJGMw+QubsyXzzR8cajNk=;
        b=H+XazpbXL4PUjhvrcxESPjYiKhhZ52UIPoFiBIvtM1wur+IbGG8ZFlkj4ZVHjV4AzT
         0pZTJzUImTuEbyQfSKTJyo5GanYn86OCEff7rh/8UnYuiUMGFvR3OhwKXceKzf56Q6wj
         ECpGPl/Gahat5EF0YmTNK5wdkSAk+GgNXyVRH60ybiWxZiJhpuRZCDYqwxjHjeknurFl
         bCC4yKGr8NtlhJraqC4od4uYC1aEI61PeGdlR0GxR3E+siWQLS7kWmpGYW9hNk0nQYOu
         5urpqHt93GwoDM8DB3j7G+xuc/XdQkE/sQtbSUjCroYPjokHN99axqev8QRQI1qmHkDn
         L2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772445584; x=1773050384;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hj1atuOIc1Cnvcb27SXrJBvJGMw+QubsyXzzR8cajNk=;
        b=AW1vnQVI2Qp4e+TgvJczd5PwwHF/tjrXFxQP235rm34m3S1t0kDlpHRDVxwvVW09v7
         H2U85BliljkztdX9S9WSrZ0o6ef2xgzmW3fDflczcqowiegdF121+a81Tp3eqbmwIGJ1
         P6ZazRAK6x6WoV0E0nx54uBsdjY6eygXJj58gFaJrzcLGpIRi91GT+nkMOfK9iKbQHgh
         UZyU7NbZ6US7rE7FiK7HyEb4jQwxoVEz2eIoNhsdymWPLxPZysxBEkGvPrBLjRp6BOPU
         ClpYe7karjHVcmZuN/Ae25bz3v+KHKHPdmLy/ivt+DBUBinKO839/wmyLO13w7ygLuUQ
         yAZg==
X-Gm-Message-State: AOJu0YxT1p5yLL8QhdmR+/1NTQSNWnTW1semZq0tOm9Wv9zTY5xDwv2e
	297J63o+rM9k7RMmqy+RizMDr47qR2ElfeMk9bDomxH1rjFdmBvWjfzOHS9QYvd/L+FEQeGIe1p
	m/+VQN7Ddh0fwDFmE54rLrNgz88pqgju8M/EzOsLgWie0wGXRAgTTN6/8iiz+13C77w==
X-Gm-Gg: ATEYQzx6+6+hjNUBCo8RQ5nmpA8QFxUHqjS5Nh9D4Mh6Smexo9jYGZwEJRIfxVEn6V6
	se3REdORO0dwIUs3rMMfY5M+kFjFFtjDz25y46dMkzfyanPdVDnC4pVpBacUI42xq5+sx+V+/yW
	PWEikYeTob7R65dV5EIigZedz4mZC9nWKSgwkQ/QyqGNpDVpCJhXRVG9vdlO4FY+SDX1EdvADUA
	ou+WHB81ut3clS8nurFGhu6JQvtsYlqNCaWdN1qB9asANmVa6JsnQFr/3uv67879DLJpPhrhvDW
	PpO77MiHhqEOg94Kz51/5+Z7fDTz3IwLtJ7hMnMzxwAYqTJVNcA8STL0UiC7/PdpyEPs5h3DI+u
	H5+9+pjAxZjULGcHAnMv0rUh6Mc7m3wr0hZ9CttzD6d35jDrqzApKCV0vvTulanBeHADurNbfo5
	xTS1Q=
X-Received: by 2002:a0c:f118:0:b0:899:fbbe:bd52 with SMTP id 6a1803df08f44-899fbbec18cmr23315626d6.6.1772445584321;
        Mon, 02 Mar 2026 01:59:44 -0800 (PST)
X-Received: by 2002:a0c:f118:0:b0:899:fbbe:bd52 with SMTP id 6a1803df08f44-899fbbec18cmr23315516d6.6.1772445583832;
        Mon, 02 Mar 2026 01:59:43 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935aec3ea3sm451324066b.57.2026.03.02.01.59.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 01:59:43 -0800 (PST)
Message-ID: <35ce6365-c49a-4b42-8d47-2f5fa274cb07@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 10:59:41 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/11] media: qcom: iris: drop pas_id from the
 iris_platform_data struct
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260228-iris-platform-data-v2-0-acf036a3c84c@oss.qualcomm.com>
 <20260228-iris-platform-data-v2-1-acf036a3c84c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260228-iris-platform-data-v2-1-acf036a3c84c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zBcxwP_nqZSQTraILY6SMJJwuNBmlF_S
X-Proofpoint-ORIG-GUID: zBcxwP_nqZSQTraILY6SMJJwuNBmlF_S
X-Authority-Analysis: v=2.4 cv=Hpp72kTS c=1 sm=1 tr=0 ts=69a55f91 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=OinizHH6AUJIbddlOokA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA4MyBTYWx0ZWRfX8m0dfy59V6fy
 ESFM3P6uAYiDJYYi6oyh26J/6UcL36QMn2RB+hR1ePpfjbdk7lb2idd+7C1MRTh5Rhj9Rkh7RF7
 CmwjBpzvXzcevesg79ZtJSMmQEjBFRDvOvhxQeJjremsuI/t40NmRo03xLLf8kG/HhOj7pwUbkt
 NN0q/ZLu0S8WcUalKZy/nF+JT14UxgQpvsSnZftJGKhJLfyf/WEr/MWFzRQffw4AZm0ofPHf11s
 NcQykTUTZd+f6LW1Xz8eZEV+B9rmtYdsjDMbST1I9fqXf2bXfqfcIlaHN+X4bAeF0zpBnLxkH6t
 ZdSQOKaGhxSLzzyUKXUiQTWYuy2WKziZ6B1AtggdI+mUjtHCZ/1zSF+6woYRIVf4OdNYUbb8dhz
 //HpKXxWRVpxeDLspmYhHcXBGtcBd24d1UuK6oYlNYUiu3lKMj1BsZiEnbCWxWsS3tMV6ULx0h7
 FQE/E/3zBNuALV/GodA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020083
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54072-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7B8041D5FC0
X-Rspamd-Action: no action

On 2/28/26 4:26 PM, Dmitry Baryshkov wrote:
> The PAS ID, the authentication service ID, used by the Iris is a
> constant and it is not expected to change anytime. Drop it from the
> platform data and use the constant instead.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

