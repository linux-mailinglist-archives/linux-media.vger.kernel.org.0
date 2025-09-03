Return-Path: <linux-media+bounces-41704-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 45051B4238B
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 16:25:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03F31545053
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 14:25:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B88B0310654;
	Wed,  3 Sep 2025 14:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hgkry4e0"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B418130CD95
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 14:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756909532; cv=none; b=P0IMRuTr3WbDFeBIF1I5au92R5SMd5LyHH6xaQxKu6GLcQCx3WmPJTuyOyxHJBECDYHIoqqyPAt94BYRaJcsNawHakplCvknV8pud1icyh2OafXHagwA7YykP4Osiwyb13dLpavcqLS7Iw+tIcQva3lF/VJQPVrp1q5cOYbZAQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756909532; c=relaxed/simple;
	bh=pElx06XUsACY4rxJuzKiVl+DZCWPVx0HYpaWpniciPQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jTBDsihubL9Tew3t4Dt4N7v+hJYvKnfnvmbch7maBYQ2Nj5NDrx+8Twm+m7Sdb0JK6TdlpKN21q7SI0jw3kPw968iadq40qx5SwOeFwOEWSyAccY0e0s03POUSqHM1kt17eQE2EkUOPuqxCnN3SHwNtRlscUqGIsfdY5ER1RHeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hgkry4e0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583DwrG0029049
	for <linux-media@vger.kernel.org>; Wed, 3 Sep 2025 14:25:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KhzMevr4galGDFfSj1H1OAb7NqzeNhj7vL+6EKq5HZ8=; b=hgkry4e0xYCmEwr4
	rbl8z4gZNSO9eFZvbVN6oh3nMaNwr7UFTAURPMX/RmkgvL9L1f3ALmhUEX+Gc/r3
	fdbj/2AjyGzymPgRjOd6qbHsntENIOuSVbyg2sUT/UsZWp+qW2OGSFlXKx+psVjK
	Gpb85JdTGsqwOLNt/wE3jZ56DcN85K4QHjMzkSf8+V28MpUDfgdZu1uSzYzLxeQs
	4gHOEidrf58fxCQN8XeIUQUJ7RRBp9fzalPKGYEzv3/8Gn568gjjOLA7P3t0Z5W1
	J2wh+5+YO210BkePeZSaetj7Esx+lnbvpFSzuNMI4poBHYm5oP+RbQNm4jTZCRau
	PFkwcA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw041tu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 03 Sep 2025 14:25:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-804512c4373so493187485a.3
        for <linux-media@vger.kernel.org>; Wed, 03 Sep 2025 07:25:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756909529; x=1757514329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KhzMevr4galGDFfSj1H1OAb7NqzeNhj7vL+6EKq5HZ8=;
        b=nxFU2Qrt/KPVeL0iNx0ZBlhGwuSQR3wMlHjuKbM/mH0KNakZC3jdwdfwjUE/SQD53s
         sMjIfWfj/+DpE528sPZ5FWCO6zqlvXe80Oj40+BrrOespkVFLLKZ9nLleeklGnCnACgU
         jpw5u9GE6s43SLiKf04fY9DwawnHoFYrHUHko15m6Ur8H0PjbP1jowZ+xW79y6OnN2cT
         YwzRITwng7mlB+1P0X7Grdg2BkfYeyqkkBLaIlVxCF0QxiIlDn+B9DA6bvCYMh0fd+ee
         JfER1+E0VIzWa43s7CtFa/RMlWLZ1y3C37OGmtGpiVwLolOOal+5QpVlRaf0qE/GC/DF
         qWTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuG7GPxrUZOTQn/N6qoa+NFyw6/fsbEQQNWpw2h1ESKCkxYa2lmVixVaw3Ueq+PtlJIPHyHgrkHx75MA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUmKDiEPIS+uHOVBbJUiwuaQHWxcJTH3WSJXSnmtVW73mRoZac
	D8X7qmvbL042eEG2ZUmnHDNNelJTeWPexPAvhPiA6T7hZu6cxMXI3XWWp4snVu5fOkeCuJNR9F8
	U9+kmcRIuaD2JOAH9NPN6pDVQhLswTATEP7MfKiG+ATIORATN967ruJ0cSR/NDsYNiuieFEHlve
	q3yDPnIWlHx0CO4ENih1RxZg9nzk6hphFrmmx3dctU
X-Gm-Gg: ASbGncs2uhRkYCyko0Gx5lmT96D+EININjwnJ3X5CTCRPRK5gApo/qoeQVKorXUWnQE
	JuvGOScnu1NUrrfif1WtPl6EJRva1af03C2t0+zpcKrR9RYCaCw+Hrpe7VVxUYLObUrVUshwy6t
	3tYJzC161I/zflYWJou1PbEg==
X-Received: by 2002:a05:620a:4451:b0:7f9:4ae2:a731 with SMTP id af79cd13be357-7ff281d319emr1704093385a.30.1756909528565;
        Wed, 03 Sep 2025 07:25:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMFAV11HIaSUVgZ3ALHRBvVq6pfjeaW5KeNRCsxTPe56c/+2TFlwmQcucn2djwmXuhbKgluFGw/vwIx3gPAXQ=
X-Received: by 2002:a05:620a:4451:b0:7f9:4ae2:a731 with SMTP id
 af79cd13be357-7ff281d319emr1704088685a.30.1756909528007; Wed, 03 Sep 2025
 07:25:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250903002255.346026-1-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250903002255.346026-1-vladimir.zapolskiy@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 16:25:16 +0200
X-Gm-Features: Ac12FXwxJyt2Vtrcm9t5pYjL2KIhw142I9Cg3Y9Fx9qnoKymlsnFjzOdDKtzTl8
Message-ID: <CAFEp6-1sA5Bfn-2JGVyO+iy8T++W1-Ke-yuXn15DL5sM=bxJ5A@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] media: qcom: camss: a number of cleanups and fixes
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: HNiMo7s9oIUZiVrfRvSU7Pg17eug99Rd
X-Proofpoint-ORIG-GUID: HNiMo7s9oIUZiVrfRvSU7Pg17eug99Rd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX/fMRZdjYvFz5
 aBixqMhr2VcMrzx62CNGoxpIltgHVMEqUgx19BEfP4z0+lNHHxdfn2ishJTOWZ7Xwrzyktm6Xm7
 mbglC8QnVZypNsueclGPVeJeIKZ20ExthIYpRB4eM8Ij0bHGL6AKPGGDlwK06JkF7HIZJn7L0fB
 jJg5U6gcbRrYehcO/H0jVTOsylPWz1ui1Q7XUBSdifPFe1cToCzkCaf/Ljo3AjrYunzUIEHBC1U
 Yx9IrquNcBFpT5P4bH5DLf4JY9LHQ/ZT8N02WzoD2CgwSislBuSO4s8wbpzz3ADarXMl9srZ56T
 Jc5cBzJDS1osC1+us0BaEu1E2g/xg20Q0XU8xhiebuqn+tQSXYjvCRcbI+K/aoLCI3SOR88TlQa
 eZAJt2i5
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b84fd9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=282giOLc0aumesrqazgA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027

On Wed, Sep 3, 2025 at 2:23=E2=80=AFAM Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> The patchset noticeably simplifies common registration routines of CAMSS
> ISP device driver.
>
> Link to v1:
> - https://lore.kernel.org/all/20250513142353.2572563-1-vladimir.zapolskiy=
@linaro.org/
>
> Changes from v1 to v2:
> * added a gained Reviewed-by tag to patch 1/4 (Bryan),
> * reworded commit message of patch 2/4 (Bryan),
> * explained better a removal of port node availability check (Bryan, Neil=
),
> * cosmetic and non-function clean-ups of lesser significance,
> * removed already applied changes and rebased the rest on top of v6.17-rc=
2.
>
> There is no any functional changes between v1 and v2 of the series.
>
> Vladimir Zapolskiy (5):
>   media: qcom: camss: remove .link_entities callback
>   media: qcom: camss: unconditionally set async notifier of subdevices
>   media: qcom: camss: remove a check for unavailable CAMSS endpoint
>   media: qcom: camss: change internals of endpoint parsing to fwnode hand=
ling
>   media: qcom: camss: use a handy v4l2_async_nf_add_fwnode_remote() funct=
ion
>
>  drivers/media/platform/qcom/camss/camss.c | 99 +++++++----------------
>  drivers/media/platform/qcom/camss/camss.h |  1 -
>  2 files changed, 29 insertions(+), 71 deletions(-)
>
> --
> 2.49.0
>

I rebased and tested the series on RB1/qcm2290, Looks good.

Tested-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

