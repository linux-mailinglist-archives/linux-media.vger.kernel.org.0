Return-Path: <linux-media+bounces-32985-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E8EABEC06
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 08:35:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91F261B66CC8
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 06:35:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70CC1233D86;
	Wed, 21 May 2025 06:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B+H/JhV3"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D22219EB
	for <linux-media@vger.kernel.org>; Wed, 21 May 2025 06:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747809304; cv=none; b=EcDsS1KVwLc9yoDpoMHisr9Ll8vaI0SJxU37kX3MIGBXN78L/wQ1eotD8KzFYaDKgLhFSpoA3O2Pqruz5tGZoUFERo4aExkpAUj5MrSbqtxmhTKUgdzhSfFtvTmgWwwLujh2g2leFZMywwL2pHdYMMJZMeyTxBBBgWcY2FTpDO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747809304; c=relaxed/simple;
	bh=yX5uXk8xZuF8KykN3btTAQn+eR1OpEbcKHd8ywumTVY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iFom30D7m/L/ux3QT96avow+h+KJMQumuFMTFAD/5qzQ7QOerqvId/LbYPKvPfsJnBE6kjQp1HiZ5Zp/uC1rF4dYK3yMHSbijvzd9UOTbd2seFfHpbEIGZiLiCCxY+PER6y7uQ5hyEnfdGLLgczr3/yCIOETwXyqE786LpGn2xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B+H/JhV3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L6Tcx4004354
	for <linux-media@vger.kernel.org>; Wed, 21 May 2025 06:35:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sZ9hKputcd1338BrnRNmVIdwAO2+8E1/p45jvoCFYRE=; b=B+H/JhV3PLJpUBSs
	ILfVntPasJvRg5MuEQm7m/GebKraXecKRXtAvjzKBr7HD3t+miPrGSQ0B52XA+s9
	a4HnxK3IaPuR1r/2ZROJZvQy1lH+NvXJypDYDRxR3DQOpI5GLQ7UJyXbgYSMT0wn
	FwSJTKzCdUlJj/xVlzjBV5u8Ltlob3RztSKOgfNbT90r9LDHXeOGyBpExc5iXO8P
	khTyGgePcFVVNvEA19V8rFkRrUguEZtsU+0m1INgf/tH3M01ghw9xSJwruQvBdI9
	uU8MzoPqLSJk4zggSBT/RGdm3k1BElqhMKpFLGiyHA+ruqUVgRXYn2+o7w1UwKo+
	cDWRBg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf6srh4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 21 May 2025 06:35:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5f3b8b1a1so1062967585a.3
        for <linux-media@vger.kernel.org>; Tue, 20 May 2025 23:35:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747809300; x=1748414100;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sZ9hKputcd1338BrnRNmVIdwAO2+8E1/p45jvoCFYRE=;
        b=FwvaLbQHabjnJCzGm1oiawHO1b9K4GgmU0OIyTs/mGseXh1L0nUIdQtuxCwiYwddNX
         BJILKqToPaBv9lcYetiumJkgMoSU5SSDErHMM7Ru4Mwy+qkPhQrpTuKcDbiGHaAV1hcP
         TXslXyd8Lo+EsZZRcwpkZVoTTLVr+esd7Y+d9WXXT572V99V/XiFj+QJz3rWXUUVvmtu
         gy6Ixx+B4FMJzovpIqTIB6fyt9vq53GWW1TBTiziHP2pdblzjrv9mS2Iy58GNRACDFCO
         UCSX9rufs51AHEB46F70vCNFqUpM5QV2xP5lRyp17aE9eFhedx3Gt1krSkvJ6UZ+5yuK
         DPqA==
X-Forwarded-Encrypted: i=1; AJvYcCWF9zGRolRY6qYqQIX0mq/oL2aVTU2yZBRkemMsXJS9fJc7K4lGEkwN1GhC7rILMHIZQcZwlChYATjWKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YydLMf48E19BjoUndX7RE7hgk2LOywGeCbcXpibD1Bo5PV1p/l0
	5idF4w9QWOXNzpGaLwSHbPTbsVh82mph5UYxSGT5ds1dl5eyEgvkUUdNNzNowIMkAz2LHaLeuHe
	jUWDKhs5QDe+d5fHaSy5Uw7JxdLLQ6SWUJaEfN3W4fFsPf0yXMnCWXCkwcpeiw+Jq7/bL1AynJw
	Pkd3wmfh/WKC/YUgzoBV5L6PQyQSvid6kG9MngvEtL
X-Gm-Gg: ASbGncs2QFzFkDgO/fAPh7sFu/tJfvxrA+OTEAaxsUdvmQYxkZuOp2qpDmioGAVFbdI
	5oV21I5PX2uwwQ5zqN+0Jrsj3MjNzNcc3ekcyNzD4i/w3OXOHJDhOjuK+w8ZSVhLsG67jqw==
X-Received: by 2002:a05:622a:5c95:b0:494:b316:3c7e with SMTP id d75a77b69052e-494b31640afmr313606811cf.28.1747809299969;
        Tue, 20 May 2025 23:34:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhL/8XUvaTvdbPP3M/jAlhpC+jim7euSMn6JxVG7/tX7Zqm2OcngXdvkAaGGLBTeDl/gT4n33IPTAgb635QxE=
X-Received: by 2002:a05:622a:5c95:b0:494:b316:3c7e with SMTP id
 d75a77b69052e-494b31640afmr313606551cf.28.1747809299623; Tue, 20 May 2025
 23:34:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520-qcs8300-camss-v1-1-1dfcb2e3bf93@quicinc.com>
In-Reply-To: <20250520-qcs8300-camss-v1-1-1dfcb2e3bf93@quicinc.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 21 May 2025 08:34:48 +0200
X-Gm-Features: AX0GCFugv4ozE6oN7_Lq0Cwf2qtCI-Rj0snyB97U0vzVGF9Yp5a-qiJ_uQuP00w
Message-ID: <CAFEp6-26HVokO-0+HEUf+cm1V7=OO5z1ndP7zVAk=Qk440Qviw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: qcs8300: Add support for camss
To: Wenmeng Liu <quic_wenmliu@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, bryan.odonoghue@linaro.org,
        todor.too@gmail.com, rfoss@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: EAKk0VI3uGODE_lkqgdRMgOkveSjqm2R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDA2MyBTYWx0ZWRfXzNiJZZxLK5yu
 iwTuecmIbODNUAnzN+65qZb26HGNdStt6HKPdjW6CWtAZNhXBzmApgXNrmWft1b8eueuOjKxPIf
 Cx3fIDi2SklP70e+sUC/5dFxv4bR76aOlW4jcl4BV/31aeTuBUJv9l9X4is/YM7KtOaYwH9gGh2
 DFnbiH8YgZwRZtHfpmxc+uPQh+GU8Zajsy4I5rHPPiys8+qCzzcQLnE7zi43SL36KYom8gIismg
 2x9vdV2g9Ni1Qfzl7uPQYAAPuBiV7eLG1uQhUeQKKYuQtqScDG7tB4Zrrb0xUm9OO3x34/tlXGa
 yqYnwZvrxszVmL3klCEY1samNDPnHwk99Ao+psMPI+8FR7OUYmFdOMwPpQKj1RAKi3D4grXOLd4
 berfLQSJRV/YBd//oBA43c8l1kNSaM5eHZ+0qejercUeP10IiKhub7045I9hWzGHB2OtxWAI
X-Authority-Analysis: v=2.4 cv=fZOty1QF c=1 sm=1 tr=0 ts=682d7414 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=PPW_EwrsXE-T7dBlnmkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: EAKk0VI3uGODE_lkqgdRMgOkveSjqm2R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_01,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 mlxlogscore=829
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505210063

On Tue, May 20, 2025 at 11:40=E2=80=AFAM Wenmeng Liu <quic_wenmliu@quicinc.=
com> wrote:
>
> This change enables camera driver for QCS8300 RIDE board.
>
> ---
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---
> This patch series depends on patch series:
> - https://lore.kernel.org/all/20250214095611.2498950-1-quic_vikramsa@quic=
inc.com/
> - https://lore.kernel.org/all/20250211-sa8775p_tpg-v1-1-3f76c5f8431f@quic=
inc.com/
> - https://lore.kernel.org/all/20250217-qcs8300_tpg-v1-1-6e0f4dd3ad1f@quic=
inc.com/
> - https://lore.kernel.org/all/20250214094747.2483058-1-quic_vikramsa@quic=
inc.com/
> ---
> ---
>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/=
dts/qcom/qcs8300-ride.dts
> index 3ff8f398cad31a36fa46060855b075c8c2020aa7..97281d6d7376a406e5c31466e=
175358b10441256 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> @@ -207,6 +207,10 @@ vreg_l9c: ldo9 {
>         };
>  };
>
> +&camss {
> +       status =3D "ok";
> +};

Same comment as for qcs615, what is the reason for enabling camss
without an actual sensor? If it's for testing via TPG, I'm not sure
why it should be enabled on this specific board.

Regards,
Loic

