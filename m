Return-Path: <linux-media+bounces-37756-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD1DB05565
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 10:50:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 364F87ADDE4
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 08:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AC142D46CD;
	Tue, 15 Jul 2025 08:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JjhZXFKk"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57BA2D46C7
	for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 08:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752569387; cv=none; b=WQDJykVB3YO0NesFY58FdEiS1DfH8izKGkj2CM94KS5EjTTa9AIAc907zw1aOVFLkxitS30ZwAEpR/7k7ZJ6UROQ5u1wNJvOxDs0PyOAiR7aFAnFQq2oHBFGbgMnw3iuhf9iCt4l6/mKYN7kqB1RT4WmR2p3ou1Lng0v6koTu1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752569387; c=relaxed/simple;
	bh=GlAt2WfKVaLh1TkDGADzmwTqzS0q/wurKHhPiKHGGOs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ElPtAfihlzLo1kLaislpTh2BMgmOEIalDnrcLyCGLn1vrd/rz8zJtOVFs+duVeR4csNyKpBoxio57gOlfqCdEimE+W70Fuc7Vl1L3b2nAPrM/3BgtpChBDklSw8IZtf4u/s6Hlnusxg4r4S+f3KrANChyRg8s2TfXca8rXE0uUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JjhZXFKk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F3kMxh004454
	for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 08:49:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	265FELEVBu6UARMHr66KFfjOqCpQWvhTrGBSX/cuubI=; b=JjhZXFKkHN6yP3wI
	p5nmqbAe9ZvzpID2bDTFLC3mjN0awo7ogAPpalB/NDNG+uhbTvtqIMC7o+vAIsW5
	SngWkeUFsh9Ze2v0HnFmom5Ee4jhNEV4SMDCq824yzUAZLsTfocNw96kJZyn4/lD
	cVHacdtviKp3OlP7qYHSifPCuIdL8PLbhpyNG8+8uDtuV9rA65BGMAQYvteURSTD
	BMjX1cu4DYs2PSSAY+CzPJRkLyqgb16pm+jIuUsIjRcBdx4rLn9fnP8TIWIh+nLB
	erVg7eO81U7DiD+E7MXseGRRx2gfFh/KG2MJao7HWGj5WWqAB4E+IawdLYMO0zHC
	XEw8Ww==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wfca0ryr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 08:49:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e2b5396898so3375685a.0
        for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 01:49:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752569383; x=1753174183;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=265FELEVBu6UARMHr66KFfjOqCpQWvhTrGBSX/cuubI=;
        b=o687blGLfBPnzipcxM7r+0V0uV0rs4OgUPQE4m8dOCjq3UfiQoWiycWOPHLcGgn4SN
         zwUDHtIFANk4TlRFJEdEvpxBuKXoqxE0cWRz0MAyyBjXPxR1iIVO/q4ILxXjVUVpXEqP
         JhGCvfKfUcZ7lUq9ADrO+3znzaT4pleQrUWXiR7/WnSvkwIerztnlVsw788QYXInB5HF
         G09GLbQP9UOmz+LFUhjFBDd7mnXk8Hg6aAuafn5dIbxSe0hsSRR3W49TuyPu36myNHKk
         6Z4YtuMVCBEf3B9UwGgs1KHgIKs3bZIk5pHqis8GnLT5plE+5zuKiKfjIx51wfcHZj+z
         +FXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWx2BBFlFT+PO8MUGW0wJ6iTjKfI+x+VPgR/LiCIfrym1g3q+e4HWnwZrpTLUiBEtOQQ0gEggBoYljQXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzR6JaV7QngeBgLClMzgLBKSmkS41Ox6ixvg7URdrIgGfF1bQYe
	Cg/Pbhv6A6BVkvzzJzc/aZL7ua8HaPFEYwQiDpLpsl8vobaBOC/2cgzgOn0+7s8RKq75P9D3/rc
	TzN4e3A1vxzAZ0g0h8irfqOqvyQpZ/pilYF0mhQNbRB+h6lpARCNc7Y5FscsCz/8aIw==
X-Gm-Gg: ASbGncs3iOoWJordSC5f0mRXTuQn5AQ2fee9IR1/495wZirglKYCUjTAj8odFKppkwu
	X04v3qvl2FY5h8wEex2nwcqzOaRhT2qJUFz2FSxd6HuJE0H+BAafsQkSa90ONcDm/S4WiZ1XGWr
	BGuVnNC/kybFYUiGvb9R2Jo9feB+/IU9V3zH967zCHFhRVxBDyvki2PU+v2HY1Z/vrtzLUEmqQr
	r7JE0eu/v57zB8O5pMhzqttZDJPZiK4jiMEYNNxROy+Hb6oPaqNEF8h0JaqHL5BL530ZvvdUPTB
	pC1yGYlor/jRV3AySPQz2ETDlB5v7PJ8kEc+Y1AJBhp3Z2OHxQEsga78GMXl7rUgTlytrtBiMmU
	9vMjOcRqftE8DA9TUIwVl
X-Received: by 2002:a05:620a:45a2:b0:7e1:6d46:9bde with SMTP id af79cd13be357-7e33c77c561mr33584285a.11.1752569382686;
        Tue, 15 Jul 2025 01:49:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHONjuWDLBX/meg+vZxl3dvOyT6rlLcHZrwGStEZGnqSxFx27i2hWHIFBHZRanIBHg+1eTfhw==
X-Received: by 2002:a05:620a:45a2:b0:7e1:6d46:9bde with SMTP id af79cd13be357-7e33c77c561mr33582785a.11.1752569382288;
        Tue, 15 Jul 2025 01:49:42 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8313c93sm952819066b.183.2025.07.15.01.49.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 01:49:41 -0700 (PDT)
Message-ID: <c7479bc2-20c4-42b5-bb9c-0a401bce0494@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 10:49:39 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] media: i2c: IMX355 for the Pixel 3a
To: Richard Acayan <mailingradian@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>
References: <20250714210227.714841-6-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250714210227.714841-6-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDA3OSBTYWx0ZWRfX6oI3N0b/HHKN
 6ySzT6MO/Ejbxyj0j8JUyNwRdLx9TdbMeuj1clfr2WqgeW29Bz3iMg8FioYkI0zM3PqzcMEwJkX
 1p3vcQp753M2IY9bqPsMA0wADYQdH1xlzSP3IjwUrZIyTWXPSq/CJIY1UdQW87cvDCZu7WCtdyz
 zoIiMvUtlcCt9NLCQ6XheakhM5GL4u+34KsV+RdfIfwIi1ar49JwO2ALaIh5fNyNJejD6sEpKHS
 3lDZD86J7uRZjSAMlrXogghb25XGrzoVyJ4c0DV4xlDf/yx/K8WE9XhSWgYZDtFba4q93FniK7x
 dEizzUaQR50JRJSjEpTKz2ZSifPkUJyk+Xv4wqyKvKk3WK4r1BtgDIicJxidYpXWyww+J+oZYhq
 0iwNUV34sz8yTMihMdYyX3XibQT1F8vrKZ+ioszwcJk6588UrYu4+boUqVX39VKQjO5dQamK
X-Proofpoint-GUID: j1zxO36i9wM-JtJ9_K4W3xomspsOJNqp
X-Authority-Analysis: v=2.4 cv=SeX3duRu c=1 sm=1 tr=0 ts=68761627 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=cssea-Id4SAgXxmdXaYA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: j1zxO36i9wM-JtJ9_K4W3xomspsOJNqp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=815 impostorscore=0 clxscore=1015 adultscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507150079

On 7/14/25 11:02 PM, Richard Acayan wrote:
> This adds support for the IMX355 in devicetree and adds support for the
> Pixel 3a front camera.
> 
> This depends on https://lore.kernel.org/r/20250630224158.249726-2-mailingradian@gmail.com
> because the GPIOs would go right next to the charging, if sorted
> alphabetically.
> 
> Changes since v1 (20250630225944.320755-7-mailingradian@gmail.com):
> - too much to have a complete list (1-4/4)
> - squash camera orientation patch (4/4, previously 5/5)

if the patch indices changed between series, it may be easier
to refer to them as e.g.:

dt-bindings:
 - changed a to b
 - moved x to y

sargo dts:
 - pet some dogs
 - drank some water

Konrad

> - squash driver changes (2/4, previously 3/5)
> - remove labelled endpoint node in sdm670.dtsi (3/4, 4/4)
> - change init sequence to match other similar drivers (2/4)
> - retrieve clock frequency from devicetree-defined clock (4/4)
> - remove clock-frequency from dt-bindings (1/4)
> - remove redundant descriptions of child nodes (1/4)
> - switch initial drive of the reset GPIO to low (2/4)
> - set mclk frequency to 19.2 MHz (4/4)
> - add vdda-pll supply for camss (4/4)
> - use common power on and off functions (2/4)
> - use devm_clk_get_optional (2/4)
> - remove extra layer when describing mclk pin (4/4)
> - rename regulators (1/4, 2/4, 4/4)
> 
> Richard Acayan (4):
>   dt-bindings: media: i2c: Add Sony IMX355
>   media: i2c: imx355: Support devicetree and power management
>   arm64: dts: qcom: sdm670: remove camss endpoint nodes
>   arm64: dts: qcom: sdm670-google-sargo: add imx355 front camera
> 
>  .../bindings/media/i2c/sony,imx355.yaml       | 108 +++++++++++++
>  .../boot/dts/qcom/sdm670-google-sargo.dts     | 116 ++++++++++++++
>  arch/arm64/boot/dts/qcom/sdm670.dtsi          |  12 --
>  drivers/media/i2c/imx355.c                    | 143 ++++++++++++++++--
>  4 files changed, 355 insertions(+), 24 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
> 

