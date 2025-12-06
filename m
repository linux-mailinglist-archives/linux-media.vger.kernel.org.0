Return-Path: <linux-media+bounces-48345-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FAFCA9FE4
	for <lists+linux-media@lfdr.de>; Sat, 06 Dec 2025 04:49:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1C9393067D17
	for <lists+linux-media@lfdr.de>; Sat,  6 Dec 2025 03:49:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89AC2227599;
	Sat,  6 Dec 2025 03:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LqUKy4KO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ay+Pb9Yt"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313A71F19A
	for <linux-media@vger.kernel.org>; Sat,  6 Dec 2025 03:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764992941; cv=none; b=BK7r5rNKoUNvaQL++ik/YMofqv71yQdsKGt4ym54NAT2dmt+FeTR50AIXi1+GvCX8PfTGtMqLeisOugEfX8RBCuEBdjKamTUjwjllcOXOgs3Cvkm/rDbZHe4Tv6r/3jK+/eDv3hHCoYGDD+HldnT3zdtfTOSpukbIWZKyD9efRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764992941; c=relaxed/simple;
	bh=x+9cqPLCKW4K0GKwhFelsaYmydnMqWc0ZhRT9opzhR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V7LuhVWOg6nWrRmU5A8rnKPmgf29dRcvACo841C6BwjMgBSQ96IwN4LyMrgDG8UKtA+Bd8YakTNcuIIXwsbMCC/p6tRLK9OrrXq5ypAYp1MlKisUBXgECJzuBrXvegki8SPNolIYHKlRV1yf/DMDJ0bfcAsgULN3ePA8CEMsHC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LqUKy4KO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ay+Pb9Yt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5KXr5E825252
	for <linux-media@vger.kernel.org>; Sat, 6 Dec 2025 03:48:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=05nIEVTH/I6ehlNORXgT9VtO
	AtvZr13dqFzv01ipRhM=; b=LqUKy4KOWAcy1a7ncySj2gSHLMiHssL0R6GVAo9r
	Gl18qZ2MnTMNwsfMlcRvi3OQfQDt94CSHmqi1g40BwAws5OhgbnPWXyk2gTTetBH
	nWuMwYfDv65V+faGua8rQmW2SE2NRJHCEfq4BISKIeCVlW/D3Fygcb/dBp7BMzST
	zVUjX0LJpXtWb6TQKtt34w38FPX5xfg5szSHi7FqZ+8KaVTk1+IXmDu80JDWL6ZT
	X0s8d1sHuhjFZJ4F2GAH9RCfkq8cwdMowXdv7a+c2eoO1lrln9ykGqqu6m2c1SfG
	H78zvnnyh2iDCWNqil3r5VfCd4xOvN1bo14IqgM7bt5OnA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4av6hu0s26-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 06 Dec 2025 03:48:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b22ab98226so841012385a.2
        for <linux-media@vger.kernel.org>; Fri, 05 Dec 2025 19:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764992936; x=1765597736; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=05nIEVTH/I6ehlNORXgT9VtOAtvZr13dqFzv01ipRhM=;
        b=ay+Pb9YtJ54e1Rl1XcIhYpatSVZWPITICMnHrdu+s6Y9P0kE77BreJ/0E/Sd6Xkrlz
         M/nI2b5Jss3sobCi6b9sQi6LLmYi5p2fwGSafqWpwAE6xPj4R0Cgoxu7WmdBR4P9bCea
         vEUxyLBRi0kGpv1Iw4tyg5oVHzOaVUuz0YwJtC6qIHhq5vW3ZkNiEbQp0Oxm6LdulAR0
         RGXooVOtsMV4eZQ4d7IbvcG99PFN6AriViKhTKy8DloITHjKV2ES+v3IXToqbMG13rvQ
         AhRCuoM4KZjpE8WBNeHuwZgH1oGCFssIbV40wkkCc2dUQ51eenYC+qA0Ng2mS2wjCwcL
         et7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764992936; x=1765597736;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=05nIEVTH/I6ehlNORXgT9VtOAtvZr13dqFzv01ipRhM=;
        b=V+b6wcfN7vR8iXJUbPFv+L20wBmNLGgHrTv/9wKS+DawWc+IzDgdgAHQvVoavxYszb
         smbLf2xWi6R5YQR0gYfn8EWMtxFksMb/ZdeQumIxlnxitld8BYK6PRhhWhs2Tc76k/qD
         aswdZMzIWw9F4Si81wUF+2pL70FgBaI5fSTl2dtJa9gBQeMN7s+nNM1/0TLSGkc6kph6
         cbLN1iYyKUM7k4zSIuv9K/0AJ54G56Pzx8w8/KZAD1ZlyAWpTBpjZT2kmHEWbb+bHk+G
         eZri3cytl8agipJmeN3xTsH3hbDfkjaJZj7iLWGdFSD4P264v31UCkM+5neJscFD0ZWk
         DYwg==
X-Forwarded-Encrypted: i=1; AJvYcCUT7a7KttA2yq0Qkdcj1JGXjCjkkYLDlhVLUxHZaCQay56Q4Rkvoy/G5q8dQMzEH3BY8HbrZlGpseDO/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdk5CQTwGFRVTupg5y3tRwKqsilCx9Kve8oXBhwcASI6ME/nDy
	J8KnFl8LGM7sP9YcZUn6SjFVxlOdtw2WvOhp5Ahhf7nVJ33WT0xcKz69lKKMSqiQSNa7Zg1yKSI
	Bq4hoBJz4mX1ZiL4iCfO2E29aj3/9/48/rsMv2HKB99jIon8ffDVKa6Z5cPxMcDs+9lxM5jlTBQ
	==
X-Gm-Gg: ASbGncvd56lt1QvVFxKuYbjdyUkluwtsABL1Ni1bI4R/A8WlirFHEzx7v75NQcz0D02
	IIbRKsfcvuQEun2oDDu8U3+Tn7ZeJrbWiUvrHDIMX0VwmaTG5S78ZJXY8/h2MHMW7pus7II0Q9f
	QUZZgLoEUeX+Cbg72JeXJZwn5suB4WBO6jVoMhKrO39gVYtEnWzIdb8YqZXQGoMq33XR39+d9Pc
	TrstkcVp+00hhjv9u0BgSqhol7dn6sLSTOkVzUVvC5tXV8/vQ47VgdNIg3otWF9hjbnBB3iwrnE
	w+BPjEkMhMIlcQAUCC50a0Ra1IieJE1mUzs84AeV5ES8xoqQboJibD6yUISoLRjSXk5st8enuVe
	mdzeVQ+H+3t/vc+BguP09dEPJFQP6b1O8olThkEytm01fqborJBjc2QVMwLZTJ76I/hIPWwDTTV
	1iKp1LADppS47ADRFSyz5oavY=
X-Received: by 2002:a05:620a:4515:b0:8b2:e5da:d310 with SMTP id af79cd13be357-8b6a2332c66mr181349085a.9.1764992936321;
        Fri, 05 Dec 2025 19:48:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF93lWjddbirMGOfjDSwFVrDvnZOh98/DfM2siqrj7J5NATC0XYA3TxsVHkWUdjITrz5J/VKA==
X-Received: by 2002:a05:620a:4515:b0:8b2:e5da:d310 with SMTP id af79cd13be357-8b6a2332c66mr181347585a.9.1764992935876;
        Fri, 05 Dec 2025 19:48:55 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37e6feab896sm18951691fa.17.2025.12.05.19.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 19:48:55 -0800 (PST)
Date: Sat, 6 Dec 2025 05:48:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: bryan.odonoghue@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vladimir.zapolskiy@linaro.org
Subject: Re: [PATCH v2] media: qcom: camss: csid-340: Fix unused variables
Message-ID: <o7i53tr4glcpahvinghklmltbeepqdpye47bfcwd32tltp36jp@nhnedmhdtnmv>
References: <20251204090325.82140-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204090325.82140-1-loic.poulain@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDAyOCBTYWx0ZWRfX7Mly2fNfPImh
 GmlsraZKbNWSdc9aEhReALXMxopstSu2Uj+9Xi3IKSYH1QAfXtz5Jm7U1roQ/pPgouux3miwiMb
 0rsapX5OkPGKZAOjg+cEMRGetPjTefMmVq7uwUgR3oC+kFiFMrh5s7tSqoLL/j/2zdUROCEh9g8
 zRzCwvWN/BWFwFkSUBtYxyS6TngfULUyOoFYQWWw0ee8LX9tX0KaNYkvpWs1efpyK1aZeZSQrva
 d/f9J2nleElyYD0kq080s7Ku/Puirvdo3EUpgS6CK6RstaK7Hx48QJXlRaSbdoRj6vAlTXlyMbF
 Vn3eS/LtSKnjoKsetAvxvc8ZMrljzB+hK6CnWQ/nHWaMZH5mwzCagEstOlXjFEl/CqRMbv1aB0Y
 jn1LwX5KPGzH0hHm0u4wcpUByMvZ7Q==
X-Authority-Analysis: v=2.4 cv=NPHYOk6g c=1 sm=1 tr=0 ts=6933a7a9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=a11_dG-raeqLMxrPIc4A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: xvKeFuw7QTzim8uwl8aw79hMl_U4Onqk
X-Proofpoint-ORIG-GUID: xvKeFuw7QTzim8uwl8aw79hMl_U4Onqk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_09,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512060028

On Thu, Dec 04, 2025 at 10:03:25AM +0100, Loic Poulain wrote:
> The CSID driver has some unused variables and function parameters
> that are no longer needed (due to refactoring). This patch cleans

See Documentation/process/submitting-patches.rst, "This patch"

> up those unused elements:
> 
> - Removing the `vc` parameter from `__csid_configure_rx()`.
> - Dropping the unused `lane_cnt` variable.
> - Adjusting calls to `__csid_configure_rx()` accordingly.
> 
> Fixes: f0fc808a466a ("media: qcom: camss: Add CSID 340 support")
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  v2: Correct the commit ID in the Fixes: tag
> 

-- 
With best wishes
Dmitry

