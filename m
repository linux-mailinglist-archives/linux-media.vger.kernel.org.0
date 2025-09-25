Return-Path: <linux-media+bounces-43216-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EC3BA1340
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 21:33:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05C2C1782F0
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 19:33:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98F2531D725;
	Thu, 25 Sep 2025 19:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n6pMUdgg"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8798231CA46
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 19:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758828787; cv=none; b=kwv92PqNwb1BJLZammsJFNw8vClTX9Ap8jkFSxFrNvib0Sf4zQxKPtgSfZmbvMh5I6l9NASTWQOL7kE+Sa4nzb2Blr2+0CFrA2TemI+P+dQbfgOLufNyswYib2wNpVslU/LbCOGPmqNV3phZ0UG+ag8DQGmOEvAw9V6T1QtUEqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758828787; c=relaxed/simple;
	bh=TnBEnMqj9PcBFYUsBVb09AJzYDc97RSDWF7EDvNsZr4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mXWgVA4uAwybLmu9KqfQWabNz/lf5bzGb/aA4xRDHjGsU+OA/vrBw5VccvZD+wTEmeWQ7Pzm9GZ6XojjvjjjtoXpTzYZFNzB1J5aVk1UG4pmi6d8+8d7a0tL9a6hAIn1tyGYR7AhLzOr80MB2PKAaCnNw+VUwxwyXFS2uX3oqFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n6pMUdgg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIQFcD001061
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 19:33:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TnBEnMqj9PcBFYUsBVb09AJzYDc97RSDWF7EDvNsZr4=; b=n6pMUdgg7o1HOrgY
	EhGqoBKaP6P2x8Bf+fJ0BEpsE9y7I9q+ZUsYD9Upeuz+1qp3rab4zpH6l0DAbCoH
	pGmpyB/yuXh5Jd47KllaZk53mhlUdOuw4ydqth+gkoXHHIgTQdrDzi47c8soowfa
	etPQT3hvO3eavu8XhEpS77QWY3YVZlzSSvKI5qX3j+4mO+/NU+gMsgj6Y1XEXw4U
	WhDf1QgSRAOXGbm3uHmYMh9PSrAWdsA0Uhd4Y8u0pC/419B4xZOj0S2e7LND0PPA
	QK9hgYURCbFTagVrzz0yEQN4QwrN+JkNtFJaoRotH10ta5A2cVZdvP8VY2o0fkb7
	T7EO9Q==
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0tr52v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 19:33:04 +0000 (GMT)
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-90c806bc886so56488739f.3
        for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 12:33:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758828783; x=1759433583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TnBEnMqj9PcBFYUsBVb09AJzYDc97RSDWF7EDvNsZr4=;
        b=SXzMc2dBu+mFwMhv7ugijzT8xA5e8rImzB8rAZUOaE4NsOEmw4Omzo6LaWtnCCy6MV
         B3pND/dYCv4LETpmmIeBmoDfULV7FDiZd/2bcbtPopsubK/2Ji8a952FtZcrKcoJ7zwg
         UF7f2jtySjzAjvBALIC26FNgvQA7VlYvP/TDQzz1n5rj0GWwBjh2AZelCTkZ4DwCX5xG
         MV25/OJ39xNgY56DBmOg4xFSYzvoj6VT9K+wA2l0lxdODScPlHrkfFMMU3WuoaUqBaTI
         /kBpghpbL4a9RliJwCNWjvsvxy9qBXh+iFU0CnYV3YJOIxoykwb4tXL7R8kGY2lhITkw
         WDrA==
X-Forwarded-Encrypted: i=1; AJvYcCXPe5kOBy6L7iKJasGNmV6gUhiGpeF7UzlYZ6/bcuBzy9cCS2karkg+SlRjC6fJTBj9pOUGDZEvdaGSpw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoJh0UoMd9GuadXvoZrhvhM64gwn+Uw5gbnstDrEiKR7wT/8vE
	3duJ4AaMbm4XUhr3eUS0c5sPO5GzasYs3qF81fqDdasWLGH4C5c5LRVfKSjQl2h78dk9rMMjj2E
	ssc0NU5JKCs5w/ESJmPqFeMh0FI2jsZh3GWnwhP9yqp5kw/HJJ1dfhoB/WagYZnwYdzynmKboZT
	W5D0u7PnMoOuBKEufgjZ3dorffun5s7GtHQAPCDh89
X-Gm-Gg: ASbGncufNQ4OYJYCu6QMp6ZqjPFDOpqJcbK3dqf7m4tTr256DoBVRZBYn2i52wYz0bw
	PMTDLWEiQ8YfbYZ12kNpa9bk6jYIVqNw0C01Nrk7jfEB2acLZ3C/xdo42nyN7GSEGdRNV+HaUxm
	wgvV4gny4nwLuGfsc1fG77HJoTmHkxpiOIRMS0JK3qiMpCTcXg8XzXvBCV5a4j+Z8Xcq8m0GZn/
	tKox1qu
X-Received: by 2002:a05:6e02:471c:b0:425:70b9:243c with SMTP id e9e14a558f8ab-425955e5344mr62881355ab.14.1758828783021;
        Thu, 25 Sep 2025 12:33:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGM8FpReApr0CA3Q3i/iHZMzcvXpITYuK0dqKpybMbm53VSYRwCkGk4q3clx06ZAwPs9BfYLZtd0oAmaJMnlD0=
X-Received: by 2002:a05:6e02:471c:b0:425:70b9:243c with SMTP id
 e9e14a558f8ab-425955e5344mr62880955ab.14.1758828782638; Thu, 25 Sep 2025
 12:33:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924-knp-cam-v1-0-b72d6deea054@oss.qualcomm.com> <20250924-knp-cam-v1-1-b72d6deea054@oss.qualcomm.com>
In-Reply-To: <20250924-knp-cam-v1-1-b72d6deea054@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 21:32:51 +0200
X-Gm-Features: AS18NWBmOViIv5jdU4dSvUosy08SUKDUBUh2nCRDhTzk4mlZzt1vwqBX05hLiQM
Message-ID: <CAFEp6-38buo3WafiiXUEUs8n-=SKgacMD44gGAd1pnEDAsizCQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: i2c: qcom-cci: Document Kaanapali compatible
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bod@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=I9Vohdgg c=1 sm=1 tr=0 ts=68d598f0 cx=c_pps
 a=WjJghted8nQMc6PJgwfwjA==:117 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=i1QE4n8HBj4RHUU_w4AA:9 a=QEXdDO2ut3YA:10
 a=CtjknkDrmJZAHT7xvMyn:22
X-Proofpoint-GUID: uVptkwyPE8lcFALX9xDJj1MbW6YevS0P
X-Proofpoint-ORIG-GUID: uVptkwyPE8lcFALX9xDJj1MbW6YevS0P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX34VO4q/k9/4D
 Z6ag8twyKfZ227UR1zIbOeD8anVPwQY7aDIyU7GjOMVnftKzMM7fEdC0b6wICKFzXy+QuNJ0Q2+
 h0u8bV0U+m513uVEbAH6kQijbPEDjpJkIXgSVsQ/8iWHCN6I/B9W3FxLTNnTMqziyQTWRpfTFK8
 bBfkLdEQW8AvkhNwEh2Hq260UqZrM1Hnwi/itJgtAXJiDr/vx7idin3HEnrLOYO/kMquLiZ7mIA
 +dXNKc3nKkiWcW0l4KJnRjOdNxmvNrhgcUWnikm8zvhxyKVwdeFlpUwqRkwNa5p+SD+NRQLHgF3
 +V3Ul+Hud/EHWR6DQaAy/CZJCs+4Re76DKnz/2+y6T/KOtlQo8qyb6/Ihb54OvClz9VL3a+9saP
 fJae18LFC6Qcbqx03jrEIM6kzuzQmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

On Thu, Sep 25, 2025 at 2:02=E2=80=AFAM Jingyi Wang
<jingyi.wang@oss.qualcomm.com> wrote:
>
> From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>
> Add Kaanapali compatible consistent with CAMSS CCI interfaces. The list
> of clocks for Kaanapali requires its own compat string and definition.
> This changes the minimum number of `clocks` and `clock-names`.
>
> - const: cam_top_ahb
> - const: cci

The recently introduced qcom,qcm2290-cci has the same definition with
two clocks, ahb, and cci.

