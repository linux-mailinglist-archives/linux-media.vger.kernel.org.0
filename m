Return-Path: <linux-media+bounces-39069-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 60562B1DC5C
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 19:18:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D914584F55
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 17:18:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 334BD25DB1C;
	Thu,  7 Aug 2025 17:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bz6yMIvr"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F8D1DFE26
	for <linux-media@vger.kernel.org>; Thu,  7 Aug 2025 17:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754587119; cv=none; b=rUikkhP2DFyS1a75sV4bI4Qqiyea92ntnOSXhqZyRKz99hBqbZ8EB0gv5hdG9tQ6tUAB5bKJSOfJD7tMCmkCKBq42CF2djKKhZrDwtKQ8zol5yvrb+XkKMmGkeqwG7kH/WP2gqNBNfXxo3nU5R5uC4HTt9a9jRGeUrQwga/SD2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754587119; c=relaxed/simple;
	bh=ix4wfzIRuANwVsXaP/80+i/iUtqcmQAOhg9cFDtjiV8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d1V4WxZCRIhv85531OfTNdCINbvIcV6NtIownnoy6IPTDtoD0sgUZWjrGzLCFffsbvlOF8fM0tC+eJj6EB55KghyM4c0m4DEkSkkMse9uNaHAYBkVPZsy/9lO6yslDYqZB1GOb+83zuxvKQ36tJIBd9W9mI0wAOXZ3hFz3snyjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bz6yMIvr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5779DBZe020477
	for <linux-media@vger.kernel.org>; Thu, 7 Aug 2025 17:18:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nLC8GBJ52JS4DT8cnivnM/XJofTs0u4QYcTbqVdpwM0=; b=bz6yMIvrF9kz4XD5
	JXh1ZKRAyPHsw7ms/x/AUct7v/ZICwoDIGWBEoXLH+y3rHmxk0r2ynysiQgGvbK5
	M1NeeLuLYhvy6mhM3394k5ccr3MZ6tgu54fwlz1o+LVJbRoRdvMbRq4zz2hqrQXc
	Klmc41t1EACwREobXBIWgMsIqpIb2TI4id8u3aWiwszLy8ISiEzfp3e2gSL2xCN1
	SlryyDV+M26I+zlwStMSAxdGM4AG8wsFy8c9HS18M+Z4ZGYqD/xyoMy0z0TQ+j7o
	mhIRzysGp+bw0kpmFtT5fTjzrl5jsOVQvzLOOdXJIzeEYIkATxpAVsyK9rYrtHr2
	ij5G1w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy8f2u8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 07 Aug 2025 17:18:37 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-32129c65bf8so1442094a91.1
        for <linux-media@vger.kernel.org>; Thu, 07 Aug 2025 10:18:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754587117; x=1755191917;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nLC8GBJ52JS4DT8cnivnM/XJofTs0u4QYcTbqVdpwM0=;
        b=igJXJvgC5h6Yn3V5yi7tKPNNa0KNo2CXna1kYmni4ioFKZWBz5ilKLIxabJNQ2zFWe
         NKxORlhHdKfWZm+pykxbJsRqpVABOyoqvNQ/5D/vR570oegkeAzP/jnyMbThY1uIcmVy
         fJ4mXLcfn5PFXBxz2kFcs/SFX5Z4XDheahBtd6aG1zLhXLdWYJCZHwbiiWlYgKAC0D5q
         3l1Ia4V9V73bHk7lEI8tULvybmY/AewhBFWCb6INUq3PaM+G0BGxHOvluuk5yJzocXeP
         eC2PnzxC4yJffLvGRXm+6hic27+pZ/7Ame0dfXHulwjxf51zM043UVB9F5U0GZ7WiFuu
         zBog==
X-Forwarded-Encrypted: i=1; AJvYcCXJVYkE9mQMNnj2YlcCpiollt82aYWy1ed/5eUWHbktvtuXHk495Y20qbN5x7sK7OM2oeiss0VyEkVdZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEw0YloBRq321k2MS/NX1f7JfayHQdpMecv2kvx6QIMJNQTB3f
	yo980145mmdjlrcjCXY9ZvUCTfEGQczElreTaN+LWRIr7UYR7HSe+dQoHrDmtjSMlgbaCGDoRXB
	IPxapuM3pq53wYwk0Ez/96NrvNp+75UxIBd6G8+7lL2xFXltH9mw/CrBGYVZEEr96Yw==
X-Gm-Gg: ASbGncv8jmkkIeiJi+UjyGATSMDKApV/SWWNzSu3gbfSIDrMfROQtN4u7Sk8hJannzw
	JKBgE3hkXkBluGVjnna/14OsR2bxoeOkGZybvjZvHGRgoUwySF5B4+Mgu3EQQ9ccjvF1MMRhTHh
	hM2Eh7fZuLmu0hfDGAymLk5PKS5h4Iju0vB2Bb6QJQBtj7hIFN14QhVGYeJ6t8z6+GVvl8wV5TN
	riX2BCjzvcyEHMu5RuoJFnMVmCkxuGgd6j406k/mG6z2tqBsxpXu6bxw0UCNuvR+867emE0q1MO
	KXKm6RgLV3qBFDz8JCFPiHkPowyOdTGNr5EjnC6/wFVYGwYDomq3p1tEZYOhjzn6YstWiD5R4P4
	/eZrjntsHqUJGO72K0IQ=
X-Received: by 2002:a17:90b:3806:b0:311:d05c:936 with SMTP id 98e67ed59e1d1-32166ca78dbmr12228082a91.17.1754587116447;
        Thu, 07 Aug 2025 10:18:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDSBIxZMtyLHjJ8ZZPSYmQQchctU93wo3YtjIAb6ci0mllkfGZXT4TLleL1LzuppQ6KSZiwg==
X-Received: by 2002:a17:90b:3806:b0:311:d05c:936 with SMTP id 98e67ed59e1d1-32166ca78dbmr12228044a91.17.1754587116004;
        Thu, 07 Aug 2025 10:18:36 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3216129c8cfsm6088656a91.34.2025.08.07.10.18.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 10:18:35 -0700 (PDT)
Message-ID: <9b1f4ea5-2948-4807-a4d2-0efe7b672a4d@oss.qualcomm.com>
Date: Thu, 7 Aug 2025 10:18:33 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch v3 3/3] soc: qcom: mdt_loader: Remove unused parameter
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org
References: <20250807074311.2381713-1-mukesh.ojha@oss.qualcomm.com>
 <20250807074311.2381713-3-mukesh.ojha@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250807074311.2381713-3-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zw1C5jqnkzgVma6br5HVwHoMhMhlrXt8
X-Proofpoint-ORIG-GUID: zw1C5jqnkzgVma6br5HVwHoMhMhlrXt8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX/4ENnELTDJOn
 efqihtd8QE7hBIeXmlub1c2Kyap/vw06LfU9HybxApM5STmDeeWc28DdMv781+A0E5KUxKkopI7
 QCi7d17SRgPMLCMjaDb9o+OqiJ6xPGgvCsvLDSneQ2Kmaefr7e8zOD/zs0Xxq+4549mQSv919Gy
 IN/A1J9PtFcVw+olmaKcL8+0HMwuLEsbSd/r+ct+/mlGjNe6nQcMDafG6qmT/cbKFSBvmkIaT/u
 8nJ5FnYxXcFO//7IlhW6bUm7Ci4/IHiET9/uFdMyEkdYPi+m9jHPr4W/5y+UzAsj04ssqXdzt2H
 OOwpVZPQq5U0Ocxp77S0T+5BPkZggTJ9FZJanZYKMks6QunRJPhe+DJhESZwJ5FsqNbJ05rOiC5
 0f99FFPX
X-Authority-Analysis: v=2.4 cv=GrlC+l1C c=1 sm=1 tr=0 ts=6894dfed cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=NyTICe1PHtTOfF-B13wA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_03,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

On 8/7/2025 12:43 AM, Mukesh Ojha wrote:
> fw_name in qcom_mdt_bins_are_split() seems unused now, it may have
> used in the past for logging it but due to code refactor this parameter
> is unused now.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Reviewed-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>


