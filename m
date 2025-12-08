Return-Path: <linux-media+bounces-48363-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 80978CABBCA
	for <lists+linux-media@lfdr.de>; Mon, 08 Dec 2025 02:45:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CFE6E30038F1
	for <lists+linux-media@lfdr.de>; Mon,  8 Dec 2025 01:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 022F7222590;
	Mon,  8 Dec 2025 01:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j5K+B8Pu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QiP6k69k"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB79021CC7B
	for <linux-media@vger.kernel.org>; Mon,  8 Dec 2025 01:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765158303; cv=none; b=Qw2PXc8THFIGJTDMqXm+bRIGSJLq+Ef8b6t6qeAT6D3EzPuC/KsfT+tsf/gOyzrbC3Ds8t5C3urk8V0EOkO3PPcBweVWbT5ICtK/wAR5b7O9D1iyeudnlZ738m7b90wHcvAr2hnyUBJfkCLv0WKGEb1C3rOJxN46Zc2xGTu/AK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765158303; c=relaxed/simple;
	bh=wyUAR8rdo1VP/fVrBoh29x21Xg+ywxFyINBfBNEKrrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rEIqunzo7onu73e1r7bYQMypOj2FUkmuw3iv65JSbDuTH5joClS+7HeuP32BGy0RnEvr4ywfM3a4bsPN7bUAI7RlcmR/9Moc0JqJC1BZ2uRA2v5N52rw3wns91liKSUY3JDI7eQr0+0ym9KHZHijF8ZMi+PJD04S5k9UYZ6ln9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j5K+B8Pu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QiP6k69k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B7MQ2L22488906
	for <linux-media@vger.kernel.org>; Mon, 8 Dec 2025 01:45:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s/5Td7nAdECmiMY6x3WUmyCCB0m8xAINpFEXzjXf/j0=; b=j5K+B8Pue9Wc5uWH
	4+OlqfAzGrtYGYd1ubiEOs4qzyn2GcvnxZ2HAJH31t+mXHhW9cq4cNXlXUo8vM2M
	4GhudBf1WasHagbOCOtrXUydFqgV/8+/ltF7vwcfDQi/UwX5qo9afGCrUt1UalMn
	8ioxJuzAThrM2eKl4JYPk8arqbqL7ScWmRW36HSfxQpUMWEUc8zSwBG+s4mKLgkv
	w7HUzdrMQYxnUIu6ypED7zXrHbXro5aC/aXktjKWkTANAPyyqsePEx2gJ9N/hKVQ
	Kd3fZ3EYjU8MK7e0Hc5fPI5ys4bKp4Je6vcbkAAk1QpHmyytOkr422+86oCeb+s8
	JgI6rw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4awha1g97u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 08 Dec 2025 01:45:00 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee0c1c57bcso128792661cf.2
        for <linux-media@vger.kernel.org>; Sun, 07 Dec 2025 17:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765158299; x=1765763099; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s/5Td7nAdECmiMY6x3WUmyCCB0m8xAINpFEXzjXf/j0=;
        b=QiP6k69kwbEbjDPUR+OXnvPr2Jy0PSuBlfE+UmVJbpV5NxQISHrmD/LZlxYDqpkPzt
         Jab6QutLXy9UMbH1Nv1qdLhzLEXBoU8Zm7u6p8K9d7SGyWuU3erM4RVlBN0Mer3rrkqR
         zRP/lp8PtY9vsQOwkPmArt0XXmMueeg0UXiAY1vx6L9eff3YpoAQERGRof9187lmv2Dl
         7BzdWYj5CKVpAPFc/hRkytjuok51EfdbTZe4TTpwRN8XVrsOoKz25vxewo/66/yEEO2B
         a8YHaPT81r5tQvdMvG8G3/c4M8u4Bdc4IZGWCCQUWA6Lg0R+tW5SuAPnlH5uVQ6wvObw
         sKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765158299; x=1765763099;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s/5Td7nAdECmiMY6x3WUmyCCB0m8xAINpFEXzjXf/j0=;
        b=oDwcRzMhs6+ZjMVBhMJdYgqLGaDvflNnMRRoqo05BVIO1yk0ITSThTMTezOgvamvVz
         xf4aAiLxcYW8qq1Tv+vk3pg6D/4Ec9/vrrGXALIcfF7OjrQTja/bH+awmTYqZWaX7z3i
         wKJSu9x0dspR/70TEM6RW+k+HUMVMMi791rUjK2WfGHLmHoEWyazXLAgCE0Chr6uIK7J
         +aaP3RwyW3BpzY4ciKwDJZvxPlppju6tVaeqpoSIlNx4vXL6b6O5ID+dMTzkIv2DoGaX
         UA8/rVFksdLRH2Zu7GNQ0+1JbmE3x9KC3W6lzn1R9T43Q6kLW5hl1yKCJ5rdZyMvuIQ7
         QHRg==
X-Forwarded-Encrypted: i=1; AJvYcCU8prF7MAccgm33AfUrI6XiL+tPKuBacC3J9DWODjjvGnmdkmJ/scdAx+i0bDmg5N39tb9qCCfeHzJWEg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzve+G9U7wjHdcgf14JjonZQseEICDuMRk5QKVAnifgoiFU21+N
	DTade69i9gogXHwhwmCkCKSO2wXLAFC/XDBEl2YWOzNH87Y9M4b9YBB5JgEU3QV4osG9S8nH8tc
	vyi3s0oNHXWRNykGn75+5tOGlqub0yKToNEBNqE71h6rvjeGsN92MyJYiomH1bLi2cryAYnJOXw
	==
X-Gm-Gg: ASbGncuae4ODh7Lr5wOs6m1vMhfpCyZNQVkxppy49Ndb4bAKL/4DjnU2FCI0tdBg98Y
	4a1rjEPyANojp7XDjUxnyy3FvbvW72XG9pyCX95+dO5ub+K069DlSCdbFureXMXC9Q+aHghsKKT
	KDB78cfmLGoNnuhE8r8FtV8hfzGfk3cKIvHvq9w2RiiwSmW4/3vq0ULv5x6g11tD22K9ndAESmQ
	wLTvDl+EaOOXOH1jut37oN8Fxeo0O0HoBmGq/bRzPJIoKkSMidT4i4KxNxz8EqPk9sfyK+7HCba
	gwG/5jtopEd+UbmZc1ctlyw/lLodSfocWQ1ObL0zkDDjlzu3pclZaUGixBxnk6+o+K/+417oBMl
	OPbLiSjRxl8FppIlT/FV+zWz5Dm9tSvmAhQAOCeM1d6w8tWrkn94YK4yzbzgW3ECxG4NSA5C8/x
	1XatyNg0v8GUvxuzh64+HtN0c=
X-Received: by 2002:a05:622a:550f:b0:4ee:146d:771e with SMTP id d75a77b69052e-4f03fde5843mr110993791cf.29.1765158299600;
        Sun, 07 Dec 2025 17:44:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFG5tMeMcoAMyr/D6y7kUXHS4WQHquHkfAyh9CnnpFda/YPztbmumK9vpF5MSdg5rUxQsDKwA==
X-Received: by 2002:a05:622a:550f:b0:4ee:146d:771e with SMTP id d75a77b69052e-4f03fde5843mr110993631cf.29.1765158299212;
        Sun, 07 Dec 2025 17:44:59 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7b24730sm3748827e87.33.2025.12.07.17.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Dec 2025 17:44:57 -0800 (PST)
Date: Mon, 8 Dec 2025 03:44:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
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
Message-ID: <2tvkcuipfaa7cn7goynt6jfzlcxg2d7yvvjqizb6p7sf5oqwuj@drqiyr3khoyf>
References: <20251130-add-support-for-camss-on-kaanapali-v8-0-143a8265e6e8@oss.qualcomm.com>
 <20251130-add-support-for-camss-on-kaanapali-v8-1-143a8265e6e8@oss.qualcomm.com>
 <f4d29f9b-98ce-4e57-9916-5a37927db2a7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f4d29f9b-98ce-4e57-9916-5a37927db2a7@linaro.org>
X-Authority-Analysis: v=2.4 cv=b6q/I9Gx c=1 sm=1 tr=0 ts=69362d9c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=xq3W2uTSAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8
 a=b7N2CkzV7mNB1x08AMEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=P5L7wpMTXyg1GfFA3Gwx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Uku2frA-khdWc5B6YHMmWRwbyJB6EypL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDAxMiBTYWx0ZWRfX3gJD10kzcUzW
 /+Av6/9bhM1rsk4G9FBkc0jEwXyYK3oS9nCnmBz3cHZYXyqMxzd6J4JkEofC8cOl+MoyBfPWsiz
 kiRCAjZBJ4BdONV3Afdih5KTr+zkBXs8+ikgUznqvDeXiPDmMucnQOYGKHaLCtW1DfgwOlUXDGJ
 D09mHuhj3bsAxvkUw3eUWaQWTjo/pVEivXbKGMT3TWcLdX0XKGwKxfohymD40ghY4U5IcLpwU3C
 GPI9XY/hE3i8G4ryc8xdW0f0QIrS/WjFhcv5PZ8kBjjfMOx6G57rWXQ8jaiLCRj5uI1jIGgU6M5
 4wkmNWotGnik/yYzOmesJRjXddS2tSF1eccnj4L21OIL2yllEH931OMx/XVhJsqdKdmFWIhjCe1
 QlVEgEYkGXtKXMqCPY0/qALhWC6Y3Q==
X-Proofpoint-ORIG-GUID: Uku2frA-khdWc5B6YHMmWRwbyJB6EypL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512080012

On Sat, Dec 06, 2025 at 10:11:20PM +0000, Bryan O'Donoghue wrote:
> On 01/12/2025 06:30, Hangxiang Ma wrote:
> > Add the compatible string "qcom,kaanapali-camss" to describe the Camera
> > Subsystem (CAMSS) on the Qualcomm Kaanapali platform.
> > 
> > The Kaanapali platform provides:
> > - 3 x VFE, 5 RDI per VFE
> > - 2 x VFE Lite, 4 RDI per VFE Lite
> > - 3 x CSID
> > - 2 x CSID Lite
> > - 6 x CSIPHY
> > - 2 x ICP
> > - 1 x IPE
> > - 2 x JPEG DMA & Downscaler
> > - 2 x JPEG Encoder
> > - 1 x OFE
> > - 5 x RT CDM
> > - 3 x TPG
> > 
> > Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> > Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> > ---
> >   .../bindings/media/qcom,kaanapali-camss.yaml       | 647 +++++++++++++++++++++
> >   1 file changed, 647 insertions(+)
> > 

> > +      - const: gcc_hf_axi
> 
> https://patchwork.linuxtv.org/project/linux-media/patch/20251126-add-support-for-camss-on-sm8750-v1-2-646fee2eb720@oss.qualcomm.com/
> 
> Pointed out by Krzysztof in the 8750 patches but the name of this clock is
> gcc_axi_hf.
> 
> ~/Development/worktree/qcom-linux-next
> ➞  grep gcc_axi_hf * -r | wc -l              [git:platform-qcom-next] ✖
> 48
> 
> ~/Development/worktree/qcom-linux-next
> ➞  grep gcc_hf_axi * -r | wc -l              [git:platform-qcom-next] ✖
> 0

My 2c: it should be none of those. gcc_axi_hf is the _source_ of the
clock, while the bindings (in my opinion) should be describing the
function of the clock on the consumer side (e.g. bus, iface, something
else, etc).

> 
> Please resolve the other inconsitencies pointed out by Krzysztof in that
> thread here also.
> 
> I will have to skip application of this series in the meantime.
> 
> ---
> bod

-- 
With best wishes
Dmitry

