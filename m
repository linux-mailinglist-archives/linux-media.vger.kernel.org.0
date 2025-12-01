Return-Path: <linux-media+bounces-47968-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FB5C97EEF
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 15:59:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A333B343D0B
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 14:59:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3141430DED1;
	Mon,  1 Dec 2025 14:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uy9k/Jss";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D3PtwSem"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0902E30E0C6
	for <linux-media@vger.kernel.org>; Mon,  1 Dec 2025 14:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764601135; cv=none; b=QSzDmNlid6BZ45qQSS28Xlwa0BDVW2yEOeitOpu+Z9l4ZoOe0b00DAudypkCKE4KwWN7/18eg6Ey6w4BUcKQYW49/rHZnNOAfBJYX57XXOyz6iLJuBuetdu7IVIPIp/YUD4y0MWuLYtG9QJwY0II6gX2UrddoXlIB2O+mRC2MiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764601135; c=relaxed/simple;
	bh=YTA9iv+6P/PzCi50PzRgWIo8HSHGzMhnxoCzPMq4MCc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iM4dRKA+8mBSlNL0O/lXXpBlI/1c2bFwthViKcn2P/OlkGrly09lAhKGdXvqWlf1xzH3bBqP1xxAliuY4/nTw90pNFWA7US559icpUQhgm9pLsQkIMAlbN4pZBDdHNorXLJG0YgyAXKCgdc37d85IZ4k0H2OvYpyVENvexoY++8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uy9k/Jss; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D3PtwSem; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B1A7iXM435733
	for <linux-media@vger.kernel.org>; Mon, 1 Dec 2025 14:58:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3d8sQcDwQPK78J27J6mXt8OqnGzf15lwl8xqUrKNYOA=; b=Uy9k/Jssl3Xr4sJ3
	IG3BZYTHlVsi2lV4QyO6Ko9muB0u6Hhr0+Aut0Osei+a3VLkqdMkRPxxo8L+mgWu
	yRf5hWPyv8AIrEOTLvCrfxOjlCzwmcEzYdWXG58f+YZ7jxv/IMrH591zscCqBNWP
	0CXK0iZN3g8qKnTJS30RaZVjW6IaRxIfJry79A88RoKNxr8VBVZ5XDxErimaDhr1
	4F+nvLkwn5xH+FYZI9eEdfvx2CzGlvTJ7q+VdoY4Q6qSXT94j9/kjNWc+rGh4WXG
	DzA0H61ZnqSvfbIOsc+9G4cvLJPZe3no/8nLLwFbc0yOBKOF1Wn7fTghbAt1ggy3
	fwQtxw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as909rrnx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 01 Dec 2025 14:58:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b1be0fdfe1so122795485a.2
        for <linux-media@vger.kernel.org>; Mon, 01 Dec 2025 06:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764601132; x=1765205932; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3d8sQcDwQPK78J27J6mXt8OqnGzf15lwl8xqUrKNYOA=;
        b=D3PtwSemsCqL6JCTF+O07cUiaDHUlTAW4UBHzQ0z47jeGmEXrOzuJ+DosKg5Q6jo0/
         s0uXjYaipwbN15S/826sOyEThwP7jsv1ruWWKd8lpI0aLTk8xOwrmrqRvf74cU/cJrZf
         YD2yE9iMFXg+VONxeKgUYLUkHPhjNkm3F05GTINauvCq4onzb2sX/J3WxpRpsNJ7zTYx
         Hv674i4Df0BbEusqMktIg9FWbZs+xljQEvE4bTwfKFo53urrAAj69HgVhK+e1Oj4AAVp
         MRyJiQy+EIsmWhnNTwE4iL2/JDXw4+R/uKUE3tJewDoCp4kh+XSJxBo8w3vY/KkyVoeQ
         zoTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764601132; x=1765205932;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3d8sQcDwQPK78J27J6mXt8OqnGzf15lwl8xqUrKNYOA=;
        b=TGVdxQXP0CDAD5WgqqHSN43hTfYMweT/CmJ8aHnMGWK95+zNjcw5JMGF6UaNDdndkh
         2Dgm8cXcmZ6rJIIjT8iKQFKboFRn9R7JKaTnxMj0DIlNwlBkakBK0vMElATO9AmNDBDa
         uGOGtDImaVBV5AJx1fwM/4OLsX7mgYZvAsHIxgi0GISNMEEKn7hc8l6q5JQL3gTm9ft4
         oOM8RUcMcG0a08FbjwmWjIBtCMUgaIf4O21ZEG3v2bJumVHyo17QBFaosKdNf/NACYKv
         l7e/tVyDXcqFjgB2UiEYehViDi4tJLzZCEjaXte4yl3rxdWReRRj9Tar7700V9uOw/RN
         nOYw==
X-Forwarded-Encrypted: i=1; AJvYcCVl0rI9q5yC9RldzWySNhtDpvh0qVDeAG7EI3xHblY5Ly1PxgZmBBc9me08N79RxTibGjHWSx61gcO2xw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhoLx/6q2pJhJt7ZH4TZuupA2nFsCf7xgpLHvEwwC2HHKVIwZW
	22q0sHVdK3uAkbq+JfxHcpjLqPRRogP7JI+CpegdwY/BtIaVKgS24tzX+5tAq1qBCNeTuuG9GEk
	WFdjEii04pj6FbtRIbLAxZOFMrD+0v7+u9gb2cZ1t5Wp1fN4dadi48YT+IEGE7cdjpw==
X-Gm-Gg: ASbGncuW8TvnEXqfqnXGMgP2q1kouvEu92YMSa+Th5VkDwDoGObuVF4Ga2kJHRbtc8m
	psa2Dh/gvx9GNutFJ7MlHQa8ck+9idE5UITC4gARSo1zyAvErJAl6hArONaRm57aGwt8rzvbrrz
	ag0j3EB5dbd7dgJA9XCrDdU3I7e5NsN1Ou1uJkwlM7boC3un4WsXVHRIkyOo8ff6Z80Y8yogzZG
	Ao3mQ4NYPcXC/pvJPV7VcLibUDp7DxSbtDeeYu3ml7g6Ey6aCQvfOEl1IDg+tSuZZGAGCdfEuAO
	kRXu1QtJoQvMwB4+B4o0otLahYxqrmiIg/NIcpjQqyQojAr5e9K0oM4SCbjoR/7U45JZSexzXoX
	qvr+6pg+iaZccK/YRk71Hrnm+xFcLpk89ql3SobbMYdbAiDOWsNZFi/lPKMapSrIS138=
X-Received: by 2002:a05:620a:4609:b0:8a2:568c:a88b with SMTP id af79cd13be357-8b341d51aeamr3765910685a.11.1764601132265;
        Mon, 01 Dec 2025 06:58:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHvdChHYrp4lDEpgkA9p44tKoa6280uvB4pPk0o+kOM6TSHwYl46FaoIgjnk72rNAAZxAzKbg==
X-Received: by 2002:a05:620a:4609:b0:8a2:568c:a88b with SMTP id af79cd13be357-8b341d51aeamr3765905785a.11.1764601131779;
        Mon, 01 Dec 2025 06:58:51 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f519e2f0sm1255891266b.21.2025.12.01.06.58.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 06:58:51 -0800 (PST)
Message-ID: <e65c9149-47c7-49a4-8076-0b8ef161997d@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 15:58:47 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] arm64: dts: qcom: qcs8300: Add CCI definitions
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
        todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
        cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
        will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, nihalkum@qti.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ravi Shankar <quic_rshankar@quicinc.com>,
        Vishal Verma <quic_vishverm@quicinc.com>,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20251126081057.4191122-1-quic_vikramsa@quicinc.com>
 <20251126081057.4191122-3-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251126081057.4191122-3-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDEyMiBTYWx0ZWRfXwpCjAWpPsdSd
 ALbTjP3oV0+YLTrKHSt0oLfHtrBOTRWaNnBK7wSZJU6nbzVuVAG7zlztrrPmuqfFKb858A8kYAj
 xJJlGlYsgtmt4S6tqWs6hDLM3nTs5AWrd2wle8UPM77k9zRS2B/q9T0TYHiL5Mb+PwFOgRPdNBm
 OctKziUVL2K/F3aaFOfGQJrUDXwP20KSOybDYs6ZqjpkCZXYYXAJuQidU2BRLT8kB6CZi8ODaCH
 GwE2t8RMBYaPORpVeTmqAm9qMGFkWlWH5kfVKYlz2645yzvTfKAcKuj5mCDLgIGL5XRPcHhWJ94
 X0YHMdt0rnF66eB//PJpZbn8aykja9NFoKqfkb/w2Q3PLQ+U7nsQgyc/3zk9zZkAoWR+WnseNg2
 lbTYSxmHvUMhleWc9XHXBM2FguYaLA==
X-Authority-Analysis: v=2.4 cv=XJQ9iAhE c=1 sm=1 tr=0 ts=692dad2c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=Q6ag48FyZXsM4XAYfK0A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: mJAA6WLfkk3n2MBgrUojb7-fwCpctL6f
X-Proofpoint-GUID: mJAA6WLfkk3n2MBgrUojb7-fwCpctL6f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010122

On 11/26/25 9:10 AM, Vikram Sharma wrote:
> From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> 
> Qualcomm QCS8300 SoC contains three Camera Control Interface (CCI).
> Compared to Lemans, the key difference is in SDA/SCL GPIO assignments
> and number of CCIs.

[...]

> @@ -5071,6 +5182,240 @@ tlmm: pinctrl@f100000 {
>  			#interrupt-cells = <2>;
>  			wakeup-parent = <&pdc>;
>  
> +			cam0_avdd_2v8_en_default: cam0-avdd-2v8-en-state {
> +				pins = "gpio73";
> +				function = "gpio";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};

I'm not sure whether I was unclear, but my intention was to ask
you to move the MCLK pin definitions to the SoC DTSI, because that
comes from the design of the platform and doesn't vary between end
products.

GPIO_73 being related to a voltage regulator is strictly a property
of the EVK.

Konrad

