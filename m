Return-Path: <linux-media+bounces-48441-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E59CAE1FA
	for <lists+linux-media@lfdr.de>; Mon, 08 Dec 2025 20:58:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AA2BB300500A
	for <lists+linux-media@lfdr.de>; Mon,  8 Dec 2025 19:58:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AF6F2FBDFE;
	Mon,  8 Dec 2025 19:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JDj4ftL0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cS9v7NY7"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F14C2F6199
	for <linux-media@vger.kernel.org>; Mon,  8 Dec 2025 19:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765223915; cv=none; b=STzEzrSCuKRZrp5Gztw8CAaaWWkg405y+KIs1oaRZmxnwWE96VLGEVvRBAztO0mlWrnpX3I6m88g7pALv3cX5f+kHrVwVNLSuMch1e//Z4fWQrhsFLvm1C1BuC8eFVWT3jEo5xSYvDXN9PdQyxzkjmBgZBLjjX/988q8RRtAe1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765223915; c=relaxed/simple;
	bh=qDxVfd+kjbAbDZBRDuwuXDLEi6JZmbu3TVP/4VitYpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AU6sfESEyqMWZnWhxHMl3qqF1vLhNjc5MFKorH5VjAKR1BbP60ps70tNDJglUkwIE2sHOAsBYru8UwHvoTEVisPG7hUMBiQVTSPDtnijxBYIn/ZAVYC23L2JCWFRkv15DhT8+ehocqub6SykVs4zHS4P/baijQ3I1tGBW57QqQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JDj4ftL0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cS9v7NY7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B8J8F7A1327418
	for <linux-media@vger.kernel.org>; Mon, 8 Dec 2025 19:58:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tIQxMRJoByHgiShcf0XXstieJQqdicMUSF+aEIZfOXg=; b=JDj4ftL0+bNqbZ8e
	6ztS9qejy6IiPjon2e5wvRAvClZL5rGLXIZ5iY2xvommZk6ctApibPUS1Uuh+CyV
	3BlwvLQpPeG+27DQWN6g1rJgTC06F7htifbw1DFtUJrpwhLUM0eIPnwaa4jmzVB5
	5iturg7gllX7aZ2GebRMtTqkzFZ26pVotHs5Wpsq8vaL8g5mXi0BKfw9m4yCjjyn
	Mr9iIzaFGtWS/+GZjDoXS68evplL6c4kg86ufFYm6xJgqEkyYdzWEQ1Nl17kvrK+
	Wl2VG0BpUQmS8izF8y2LcvmrsKaF4Vfc+i3gVyLlvomlLqlecYsTcmCp55LJ/GLa
	nzqKBg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ax4jng3vk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 08 Dec 2025 19:58:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee0488e746so106102041cf.0
        for <linux-media@vger.kernel.org>; Mon, 08 Dec 2025 11:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765223911; x=1765828711; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tIQxMRJoByHgiShcf0XXstieJQqdicMUSF+aEIZfOXg=;
        b=cS9v7NY74c2cv61q3t65Ih+iyU5zS24ATDlMlM02AN85H/wdwy+DgZ+exr84eq1gGF
         cXzo0mj5g+/Ay2dwkmg2acf8hdh2tdB6eLVEpU6b2vqblhF6MtupA7ebeQoiy6MTwgtt
         RKwkGydtUnAB3QHAJQ5fZ3NaH+axFTZyZXG25TLRLcTKmMUWaBg/CS0DbTy79TdIhQQm
         QQNsaYJiX5exQpbRbb5rjoKo/YA+wxdPFRUwZl0s3egm9vyJIAIqmW1eDEV8heAVpOpy
         S0df+6+d9Tjxs8FskOSNfebfIyq4ayWrZFcnYuey6gcbi9t2BU9tXlLRY4V5wVSbRFGY
         LtUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765223911; x=1765828711;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tIQxMRJoByHgiShcf0XXstieJQqdicMUSF+aEIZfOXg=;
        b=ffgkRmuoUNNktKGQ4TSvtx0dxkYQDZQEUgIdzHEBgPyAQvpxl3greWc/SlEZ51Sj3c
         bE9lgUYfoSO2doFZ0cCzRRVZ3AlCf3venzRPUYQiyjWlDJeo1mddmXBnMVE65usTAAxM
         1N73pUzf3/HVsC13kwzy8FugWrB8lXfs/zx5BxKtLsH2yY4Od/D91vkOcfdkyhjJHd3z
         gXB9ZV04L39iILxLfhuQVU60MyMTfgZk8s1JVVqtRqvh9R/ubsQUntQSUWPcvKZdh2lP
         zi3Jv8emMdFC2Gsd9Geu6NGyPKHezCESzxdYG/hKqZh5onqEjDkOg+QyN2i6I5c8n0TP
         PYIA==
X-Forwarded-Encrypted: i=1; AJvYcCWc5cO9pcE+FVo0V5jkdN0vFy3EocaaO5huWHAI4dAsjyPV7x42AA6flaDIb8sjxqY7qMcgslT6sBia7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv+Mf5mfPfrALLkfVHwHoc1Gz37Bp4T1DNsBTq/8vVMExkH+lP
	zCff3HN8gxOmlEGUv4X/puXgWBhGjqxFHjm7CoKYm/2K4TdtrGr+ZKH5OM6TMrKN3bdepP6MhDw
	CEYE88uwme04+uSg0p6Nf5/GLyTH6Qer9fAEQLzG7/ddB9f3G6mR1KPxbvQjHIjC+7A==
X-Gm-Gg: ASbGncvAQCg+bwPCrD14zRlzEG35wXU8ixkOCkfd5IsfhjDQsQGMPHTNjb40lbR9GqQ
	jDJLQ081/5zX2wqVnr6ZJGNBOPilV0Nx0dXN7ztnzZhW3TzVr8Rot/IdeXSdrnYw5XufvRC0uYM
	SvS227B5N9PPO2k84F7emROXFlZ5W9PwPK3teifBvu6xgqkIQCMBBLFDwW0zbqLOFAqzH5Rub0j
	PMa5IvKjgTogt+MDJ5MphEF4b92nXpqIfzdSXqoxZlYzQG2rZ8i8/F4Tq2+uGZCF3GWPx/k5nHe
	DEORD7/p73x9TEygLQKyRvKhl5BKykiv0MeNVXTwmvC9ogWMAGL9gpWFBbE6gS63ZW6Yd5pk6FP
	KT3wUGsk+M/OrMltPzR+EpjU2I9OAq3uxJzd3IROjRMkgb2E122wqM2CUytmxl2GYpdcyW5bZQT
	SPE/SDefIKBI6DnhK10DBfVYY=
X-Received: by 2002:a05:622a:34e:b0:4ed:a8e0:13c2 with SMTP id d75a77b69052e-4f1a4139f33mr9644681cf.10.1765223911513;
        Mon, 08 Dec 2025 11:58:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGHzR/+p0aIGPsigMrM2khvPLyN96tvvzb847GA21iVlQZxLUUcOjKB8cQthS8CCsRNAd+pDA==
X-Received: by 2002:a05:622a:34e:b0:4ed:a8e0:13c2 with SMTP id d75a77b69052e-4f1a4139f33mr9644491cf.10.1765223911026;
        Mon, 08 Dec 2025 11:58:31 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7b24976sm4479290e87.36.2025.12.08.11.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 11:58:30 -0800 (PST)
Date: Mon, 8 Dec 2025 21:58:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v8 1/5] media: dt-bindings: Add CAMSS device for Kaanapali
Message-ID: <msscnw2e4xil3kynnrfpujaybknbbzzk7mgcowgefqlk57zzfd@h73cxwezx7fg>
References: <20251130-add-support-for-camss-on-kaanapali-v8-0-143a8265e6e8@oss.qualcomm.com>
 <20251130-add-support-for-camss-on-kaanapali-v8-1-143a8265e6e8@oss.qualcomm.com>
 <f4d29f9b-98ce-4e57-9916-5a37927db2a7@linaro.org>
 <2tvkcuipfaa7cn7goynt6jfzlcxg2d7yvvjqizb6p7sf5oqwuj@drqiyr3khoyf>
 <dc0da45b-165c-455a-8e03-7cdd2d2d2ba0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dc0da45b-165c-455a-8e03-7cdd2d2d2ba0@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=dZSNHHXe c=1 sm=1 tr=0 ts=69372de8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=xq3W2uTSAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8
 a=bKaWK86LcX3T_COk3v0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=P5L7wpMTXyg1GfFA3Gwx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ZFI3S9wHPGZGdya2JjJZBH6RMZRBFOCE
X-Proofpoint-GUID: ZFI3S9wHPGZGdya2JjJZBH6RMZRBFOCE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDE2OSBTYWx0ZWRfX7PSTPRdNKIRG
 eAnaQiOT6IM7+V/pK/NXtfOQYj3Wcoej+ydfn8xpmbB5OqlCL+OrqBwQTJvA7H+apeTnIvSXjVk
 DUAqS3yYIniuLT0yoqtixaCUoI9BHf8BCCJ6gd3Nd//1mipnRT+0NUx6Vax9oZGdr5IDUYTamlx
 Haj++JuTPG2MLt1JRGy9xFJvz0nxuIS0Y8tgvj2WduSNOKGGPfmsfJIp6/qzduRd6Bjx/fYki3F
 OA7AQyYo58DNIWPbxAwrknuWDGWvXwL5A4kKgqMryvrsD8a8i/pifE/xI093MSgpVNJLK7c0Kve
 MxzhRoixrtWUjIrW22vk1wkSnVdll9fKEs1Gx6yLzalyhNgXP0je6GoFuH8mDgvo/somCQP+8mP
 1oAEZ7jIoBc1BeTcVkRyoz5+bxtv9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512080169

On Sun, Dec 07, 2025 at 09:41:11PM -0800, Vijay Kumar Tumati wrote:
> 
> On 12/7/2025 5:44 PM, Dmitry Baryshkov wrote:
> > On Sat, Dec 06, 2025 at 10:11:20PM +0000, Bryan O'Donoghue wrote:
> > > On 01/12/2025 06:30, Hangxiang Ma wrote:
> > > > Add the compatible string "qcom,kaanapali-camss" to describe the Camera
> > > > Subsystem (CAMSS) on the Qualcomm Kaanapali platform.
> > > > 
> > > > The Kaanapali platform provides:
> > > > - 3 x VFE, 5 RDI per VFE
> > > > - 2 x VFE Lite, 4 RDI per VFE Lite
> > > > - 3 x CSID
> > > > - 2 x CSID Lite
> > > > - 6 x CSIPHY
> > > > - 2 x ICP
> > > > - 1 x IPE
> > > > - 2 x JPEG DMA & Downscaler
> > > > - 2 x JPEG Encoder
> > > > - 1 x OFE
> > > > - 5 x RT CDM
> > > > - 3 x TPG
> > > > 
> > > > Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > > > Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> > > > Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> > > > ---
> > > >    .../bindings/media/qcom,kaanapali-camss.yaml       | 647 +++++++++++++++++++++
> > > >    1 file changed, 647 insertions(+)
> > > > 
> > > > +      - const: gcc_hf_axi
> > > https://patchwork.linuxtv.org/project/linux-media/patch/20251126-add-support-for-camss-on-sm8750-v1-2-646fee2eb720@oss.qualcomm.com/
> > > 
> > > Pointed out by Krzysztof in the 8750 patches but the name of this clock is
> > > gcc_axi_hf.
> > > 
> > > ~/Development/worktree/qcom-linux-next
> > > ➞  grep gcc_axi_hf * -r | wc -l              [git:platform-qcom-next] ✖
> > > 48
> > > 
> > > ~/Development/worktree/qcom-linux-next
> > > ➞  grep gcc_hf_axi * -r | wc -l              [git:platform-qcom-next] ✖
> > > 0
> > My 2c: it should be none of those. gcc_axi_hf is the _source_ of the
> > clock, while the bindings (in my opinion) should be describing the
> > function of the clock on the consumer side (e.g. bus, iface, something
> > else, etc).
> 
> Hi Dmitry, this is MMNOC side of the AXI bus clock for the HF clients. If
> it's ok, we can change it to be consistent with previous generations for KNP
> and we can take it up in detail when we refactor the bindings for Hawi?
> Please let me know if you have a strong opinion on this at this point and we
> can discuss accordingly.

Well, why do you think that for Hawi the requirement will be different?
It's the same: describe the _use_ of the clock rather than the source.
You got that feedback internally already  during our telcos and then
later when you've sent your proposal, but for some reason you didn't get
it.

BTW, if it's an MMNOC end of the bus, should it instead be voted by the
NoC driver?

> Hi Bryan, we are addressing the things that makes sense for KNP as well in
> the next revision. Btw, couple things like a separate CSIPHY DT node and
> ordering of the resources (that were to be added at the end as you advised),
> I believe are not relevant for KNP. As for the GDSC names, we preferred the
> module name and it's GDSC name to be consistent so changed the latter as
> well to VFE. Hope that's ok. Please let us know if you would suggest any
> further changes to KNP v9 bindings and we can move forward accordingly.
> 
> Thank you both.
> 
> > > Please resolve the other inconsitencies pointed out by Krzysztof in that
> > > thread here also.
> > > 
> > > I will have to skip application of this series in the meantime.
> > > 
> > > ---
> > > bod

-- 
With best wishes
Dmitry

