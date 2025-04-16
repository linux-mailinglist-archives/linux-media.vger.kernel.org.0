Return-Path: <linux-media+bounces-30352-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADC8A8B9C7
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 15:04:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5093190188D
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 13:04:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94FC01946C8;
	Wed, 16 Apr 2025 13:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cpCA5raT"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD3017C98
	for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 13:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744808670; cv=none; b=LSL2ms0B7Q7lk5cY1HoAYxBgTcY0FppWpnTXG6oqU0aAlKhqScvp+TSYAVg5e2VBQGkgTttQhuNph1PmtZ883dE+YtSBqkPbJaNk+Yp3SAMmxY8jkIkuvW0z6TB1LYaWELwXSA0egq9NCBDGAzw8l4N6pme7FDw1Vfs43r5CH+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744808670; c=relaxed/simple;
	bh=gxwEAxbi6z3ugW/ifjPosDOrGhdGdahjWiQHmtat2OY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WncUEualRMC/nBuoAf6gwL+fJLtJOqz/4gZRZ7bGDJMi6UdMkdFziiZv+2rV4bFRqer5pnhuoKpiGbBm/sYowF9500QLQUeZnfYaMC8TWBbv4GYFBjLCA8NE3nNPd0qJn1x3kxHchsMgiamaJrHyK07iPF/cRkYrbOhrDotrgEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cpCA5raT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G9mDq7006993
	for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 13:04:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gxwEAxbi6z3ugW/ifjPosDOrGhdGdahjWiQHmtat2OY=; b=cpCA5raThVjaNWNN
	I7nPiZJWpo84FpJSW9ZJHYBzNj7zBE6jVBU+1VYc75HHxv5gPsVWVKiWFFl1hqmQ
	Hus/tO/mcfafguu/FwEX4hhLYQf/H5Z/4vc8OAjOOnWlAY1NweE2IYUZU9d7jctI
	5N0jhNqXsjDFBZQ4sTtdNszadeeZIefMHidmuk+zZ028rJ0ZnTMqWbB9cMSMs7OK
	O7M16VYNhks/GMUmxKzm2uqCWcBcJglJPKxXdJJNr3HHZFEfMhO0XhGGsVw8YCkk
	0APtmzeq0IdKSfhIiRT0PzP3US1fA5WpLXlnnqbeDtVuslOTSaiwjVxr2FFKHkTP
	6G9Fow==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd6kkpy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 13:04:24 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e8feea216aso11228936d6.0
        for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 06:04:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744808663; x=1745413463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gxwEAxbi6z3ugW/ifjPosDOrGhdGdahjWiQHmtat2OY=;
        b=Bkj4yF781Hq+Q1MORSfRpIQyKN5BjAkGU+e8xcHCETLF3hdmBOptUlUhxxCKrL6bgz
         ZdIxf1iGnXb0GbirGtLlqyyyMd4Gitd/Jqs+qDcY8Al4xqUlDveuhoBFmGYfi/ivsqBL
         WuB872yOiGwTEP2oTkNzBsEb6t55Zu7a+Hnp6D67BVFjsw4/RN28dQBaUJsPot24BikE
         wqQceVgDe8w5SuMUf9GXftOTILpb0cw1cB6WTCGslydbJu4YP5XVbQAxN3RuwmGbeWRr
         +gwVvIUtZL+hvytvOZnzJ7yrYGrTvcM/4BTRjbNCjaDtey7FjY/7MPGuTXVXvxwdgePD
         3fow==
X-Forwarded-Encrypted: i=1; AJvYcCXp2vJxSHLz5kPf2WRK889CMa9Qalh/ojXHO0ur4qzF4moyNHJUPg+gNjKL+Rddjdxag2FqdfWrKOzwtg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLNpr8bhAuYtXHogA+cohW2s0cxLdGQoSjG/TI35gSTVu+ABQw
	2pgjEUR30XHCMjPBUc/UzcFc/pyV7qupeS49n7qA18WGDGqMD3IQJGVtgM8lw1U9RUzIjd1qr9y
	w1MtgixQkbIIgzxjLbGDfPXEUsWDRX44gOWY5bOrfE+3rDVQFwzTUAIIPeomboeJuAm4gtGG1Gs
	ET8FoLOwHmvqgI3CMGBaiuo1OHoXl/a+vS8Nzu
X-Gm-Gg: ASbGncubolvaFWMyCPHdGqhYp1+rRKR2Kw8jlI/VsCXys+u2rWD8ydpCPrXfP/xosDo
	lYrzn60uIdsF7sewE/A0JVOeQGyDKGbTmH0MT5fisSmE4fTRTibmVeUGOaSkB8aAjQ/Z2SIo=
X-Received: by 2002:ad4:5d6f:0:b0:6ea:ee53:5751 with SMTP id 6a1803df08f44-6f2b3ead495mr22815006d6.21.1744808663053;
        Wed, 16 Apr 2025 06:04:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEOmRSGWyp41Z84OdRCbPebLRDoW4Vr0UmFozZz7UWb4JA0S5fXDYC69L5HZgj+zXf0udYFfGIyz48MyoL61E=
X-Received: by 2002:ad4:5d6f:0:b0:6ea:ee53:5751 with SMTP id
 6a1803df08f44-6f2b3ead495mr22814526d6.21.1744808662608; Wed, 16 Apr 2025
 06:04:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <yD7X4MYItg2wLMb5iPs1JXadfzhFB7wSFqo_hFbs6K72VbLmTtoOrnwcLJrP4WBvndDUd2eklJl3R4GRWLbl6Q==@protonmail.internalid>
 <20250416120908.206873-1-loic.poulain@oss.qualcomm.com> <3483e6d2-23f7-40e8-a56d-d7419b808290@linaro.org>
In-Reply-To: <3483e6d2-23f7-40e8-a56d-d7419b808290@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 16 Apr 2025 15:04:10 +0200
X-Gm-Features: ATxdqUFEQ69jLQRWoPWFAE_LVRc-yet_jkfAopU4vczSRDGKdFUqslJ2vHVpvBU
Message-ID: <CAFEp6-3fs4ZAB0cW_rxbmoSmrKPVk0ueR=Fn9nDj29a8dV33yg@mail.gmail.com>
Subject: Re: [PATCH 1/6] media: qcom: camss: Add support for TFE (Spectra 340)
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: rfoss@kernel.org, konradybcio@kernel.org, andersson@kernel.org,
        krzk+dt@kernel.org, robh@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: iefwNmH-i5PJ4HssuuisIvbUewnFKwvp
X-Proofpoint-GUID: iefwNmH-i5PJ4HssuuisIvbUewnFKwvp
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=67ffaad8 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=6670vO1W_d13aYf7LkEA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_04,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=983 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160107

On Wed, Apr 16, 2025 at 2:30=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 16/04/2025 13:09, Loic Poulain wrote:
> > Add support for TFE (Thin Front End) found in QCM2290.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Maybe I didn't receive but missing cover-letter for me.
>
> In v2 could you please give an example of how you have tested in your
> cover letter, if not already done so.

Yes will do! Thanks for the reactivity!

