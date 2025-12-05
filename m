Return-Path: <linux-media+bounces-48314-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6961ECA7122
	for <lists+linux-media@lfdr.de>; Fri, 05 Dec 2025 11:06:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BCE5531D918E
	for <lists+linux-media@lfdr.de>; Fri,  5 Dec 2025 10:01:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 500472DEA75;
	Fri,  5 Dec 2025 10:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lWH1PLfQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HAOznVks"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423082E2DDD
	for <linux-media@vger.kernel.org>; Fri,  5 Dec 2025 10:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764928895; cv=none; b=WfooUDnwvAuwtyq5VLaNCQ+DltPI6a7+UA4mbamC18NfP0pPKo0usLXIFr6nvn754iPBoOE//urjryFhBmyZWTV5pvMornfISbgkffffc+RQeOzkQcbzXfrLrdjmk/d+LWOJnRlD1rSiXiHHrNySxE+DPazqZbGfbaH+NfWXN+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764928895; c=relaxed/simple;
	bh=1UfligJQHsBEf/oWTPoxlgLQvvDW/tlYGi3/ZN3SZds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZgUGe34iTQfZVjR9DBMAhl+IGYsuMrq7P1eZr5SWImT8WCKNpPi/9GqMDWh0GePPsOQu/5+bog2Ldtk6/fG9lK4cQ6o3p6C25cuGjPqHjSDxF1nbbgj9jbvywEGDmifq8vPEHjBQEYNFzduAl4lLf5ZJzU33q3H60IbRYQOTmec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lWH1PLfQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HAOznVks; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B553osj3522960
	for <linux-media@vger.kernel.org>; Fri, 5 Dec 2025 10:01:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oeP/m2fJagJh7n1ezuCSp5/oRqR7bYSQxaqZUom0L6E=; b=lWH1PLfQW/wBOKj/
	KmfW/o8v++WoKd+IZB9jTgv5J+PYwc5XoNY2upqQHZWHIFsg7fZcyD6AaUbVarNf
	vn+r2OLxJ0tICRLQ/VAfJIMLDysHiDiP+PD8nLAp+xWz6co+fyRkBSs8n25WZ1rB
	WW9aQUNgenvB6pFZR9GUSTc32kMQ8UCGuiw7TFh8Avyq208mnrEpAp/GeI7YZWrL
	ImFFLub9/Tt1lSzZEd4iyF84Es1CGjyo/23eMLT6ZUhMvnfxNMyiK3/u1QaeuPWz
	QptHjo5241rwkZpGUt8p5b8VDCU6SeueDoNhViOnyaTy3SOvEmXfioo144yXkimr
	oUE+2A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aurwvgsg6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 05 Dec 2025 10:01:21 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee23b6b6fdso3573131cf.0
        for <linux-media@vger.kernel.org>; Fri, 05 Dec 2025 02:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764928881; x=1765533681; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oeP/m2fJagJh7n1ezuCSp5/oRqR7bYSQxaqZUom0L6E=;
        b=HAOznVkss/O6/Gjml7Osiev4gOL2QCOeyVWBuU0ub5uqsELvbe1Dlju/xnquj0MvhM
         HIs9l66sucESxLYQjsnzznMDOBVC7abMfIWD6uvfbdEQzs94zNW94w/hRq/cjyG7pLvp
         Xx8ovzrthcYShzw+npKT0J8IAG9wgC5UD8QKWl9emnYlxO4PYloSgLiWSM23Xm614TrO
         T0W2ZjxvsURq4Doic8ZzNhy1AXCb9S9DzjJbZZUSp2zc3MUe3U8Eqt1xvJi05dL8l5lD
         5N8DeBMywJEAbwtXUTIUIerrWmOgDpSvrQ2kvlsIkoo1sfJSCq9j4QyrUwjRkmKr3OAY
         MBmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764928881; x=1765533681;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oeP/m2fJagJh7n1ezuCSp5/oRqR7bYSQxaqZUom0L6E=;
        b=Llya6LiNPdU2PbzwzZlQbUgbhvRuhmixzLUjMl61ZHcvojo0dLpSgqYQ0EQyHG4mPu
         O3j2sy19+6BM5tMWDeP6dW8VJyjfdYIvPbuaqG9PF+u0YYwu94XqiliCgrG/WqvRnCik
         qbIRaMcSCqKAAEUiRwIuLFfiBcm6cT+Yp6XGTNmwcfeF1ZnYE+poPP6XHIbSGAB2GMvu
         6WDzqIyy+RnXiaQH9/Rom888zJKhd7ev7lQS3EGfhvyCvJ0zhI02pU85P5qLmw0pfTvL
         oXrlQL2WUzZzr30CdJpjNRocIC6f3APhZBqP5KLCs0TyDOF95ZUi41mJ28GYRz3wKHfR
         11kw==
X-Forwarded-Encrypted: i=1; AJvYcCWE/p24XL++AnuiiIQCzTXlSHSHsR5nAqg1PA5Nk5F7UfkHctwRmu/Oorfa9+gk6l34SqWqfjWuJ0QOmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJSogmZoBFEV/qqp1oEPM0ehBBRQfo3hj48WWkgytHgXx5GLBd
	heviDyOzZTF956SUyQCdMGyv0v8Nr9HKr/LhfytFazfY61dXWqcIV6zNmFRqEeUhOuYERDFD8Wt
	ab+6tsvVO+ilLq0Zog+NrTExam4D8lJO+YJ/aVDJ7x3oBaC5cTi4nWh/6ZTB8Ms/DMg==
X-Gm-Gg: ASbGncvWWXzk32E98HkJel5gZzBOzURi8mO81Kv95MTBuYOtlb4haRkVzOKVoccFFjF
	QlNH7hQEDGSn42ubWeqWovrFZC281P95dqeokIJmSA3RvkcCgcRF1H1gWPqN6jSAshjVlisTxo4
	F+m38TWp7rOjjhmdLo/BIpvj+qucDvJ8jbCXV/j03IlWrYXYRb5p0cRI1IF02S+RsAc6ridp+oV
	djYGHFFHUWfJyuEoW/mESE2nGkXAru2Zs+wOkI++1rht7eF7lr+pVsQayNHyLFNwzWRfYSrY5Ks
	wP9qhv9BmzXn7/fRAmaN4rY0tF+WwkgaQvt3HV3GX7CyJBogprq+sGn/Nt1EYDGZht668+w1f6Q
	nisdAIdz7gnImTVO+5WvMTAe6B6gipayWueym/Ja+e9GZm56REBVuu7skKCHMbf8rhw==
X-Received: by 2002:ac8:5702:0:b0:4ee:4214:3226 with SMTP id d75a77b69052e-4f01b21e81dmr87142561cf.6.1764928881134;
        Fri, 05 Dec 2025 02:01:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFKshyoRtp9ZzsajxtgrEuEZW1LKNnO0PjqbOpSQZBzXPV/Xv7fWXBN10MdVp54WsP1yl7acg==
X-Received: by 2002:ac8:5702:0:b0:4ee:4214:3226 with SMTP id d75a77b69052e-4f01b21e81dmr87142021cf.6.1764928880561;
        Fri, 05 Dec 2025 02:01:20 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b2edf5a7sm3383939a12.13.2025.12.05.02.01.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 02:01:19 -0800 (PST)
Message-ID: <e0c5f40f-9bb2-4e62-b057-772dd3d6806a@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 11:01:17 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v2 7/8] media: qcom: camss: csiphy-3ph: C-PHY needs
 own lane configuration
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Petr Hodina <phodina@protonmail.com>,
        Casey Connolly <casey.connolly@linaro.org>,
        "Dr. Git" <drgitx@gmail.com>
Cc: Joel Selvaraj <foss@joelselvaraj.com>,
        Kieran Bingham <kbingham@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20251204-qcom-cphy-v2-0-6b35ef8b071e@ixit.cz>
 <20251204-qcom-cphy-v2-7-6b35ef8b071e@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251204-qcom-cphy-v2-7-6b35ef8b071e@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA3MyBTYWx0ZWRfX3U8OY0yQEuqF
 5wx/NHP4RI6W6PHRGCgkftiiDXq2c0MoyU3IiQ+u+anEpvdDwzp9rX5FE//T2cc8KWAl34mIYD4
 naqNZ4a5xEDnfOYXslu52qm5gAvENgykLEm3TQBg2QlHhDf2BKfJS8Ez++ZxJ1lkHNqgH+i2shD
 +2Ac6v6lj6kXf7sYbNPJTm21S4BGIoUkR1gZTGKH/gAF5lDqkiPXPPT+MIp7bwdusFS2x/LXijT
 Dbnek6V2/HE9XfMLvTrru3z0CPerzyqgHarZrj1sd4IeTjSJMw+uHual35jl/cBnJJYB54dR+Gq
 w6y9SpVWiMYQx8Q1IdHDKbNepU46HLkoD8jXLAdh5D/j4aV6TIiSakTMv64iFJ0II6yyVbNiEhO
 tK3yV48XLjMcOeT975xP8W6m4D+azA==
X-Authority-Analysis: v=2.4 cv=Yd2wJgRf c=1 sm=1 tr=0 ts=6932ad71 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=5e6XgBO0iodNXUd1Y8AA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: XM3sOQZr-TzGQwXwFgp9wW6frNLDgA6F
X-Proofpoint-ORIG-GUID: XM3sOQZr-TzGQwXwFgp9wW6frNLDgA6F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_03,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050073

On 12/4/25 5:32 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Make sure we have proper lane registers definition in-place for each
> generation, otherwise C-PHY won't work.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

>  .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 48 ++++++++++++++++------
>  1 file changed, 36 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index 6d6dd54c5ac9c..c957f7dbfb243 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -1222,8 +1222,12 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
>  		}
>  		break;
>  	case CAMSS_2290:
> -		regs->lane_regs = &lane_regs_qcm2290[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_qcm2290);
> +		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
> +			dev_err(dev, "Missing lane_regs definition for %d\n", c->phy_cfg);
> +		} else { /* V4L2_MBUS_CSI2_DPHY */

If you're checking for C-PHY specifically then just say it in writing
instead of printing a magic integer

Konrad

