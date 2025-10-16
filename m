Return-Path: <linux-media+bounces-44732-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5E1BE3565
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 14:22:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46C8B18929F4
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 12:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F048232D421;
	Thu, 16 Oct 2025 12:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pqSGRYDU"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07742E6116
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 12:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760617365; cv=none; b=IXmxsS1KAbXumgqUjx6cePy4q11jLKwEoZNrecf31Y7slHFzlwC393ADgu08OKFe8Y/jNjyTZnjv8ByN35PlLROuJeB5n3mEyRyP/2MDXELq16nVCQVUGmv6bSCErIGh++wCqRxzX43a6bWuDeGBbTstnPJKHGW0rI2NTQavFfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760617365; c=relaxed/simple;
	bh=mL3AkCdFjfUQDFlySMvWUslbbK6AefBEqeQD4tfNbNs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pTRVV+wdxkBDM7r0l/ktcXxOpDo7S0lfu97DlgdesXPI+7JRnEGtw1MZXvhsV6hpVukVkQFe4AbH3oN1xjauSWzoKR9L5y9K2lfsKJCt0EdsdFmSEI0gU5S/zA8IHYWtlZuQVV+lvkbxWdmNUY7PqKGAgYjE+kD1P/fJAjxd/ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pqSGRYDU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59G7RxVd004036
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 12:22:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R9yQUnMu2HxE11HdeoAr8BU2ZwERrUip4hDHAbjMAn4=; b=pqSGRYDURFh5ETLu
	QxCj9Wj4Oj78wq12XoZq1sFMnC+NS0OROrZjGVGckFJd3k/60Zpi950reha6JZOd
	qWBYVZoD1lWOjW5GDkfCKi0P3Jk1GvNhWqk0mmH5XyjRwClsT3sF/OrzWn0GK4xv
	GUN6vmTBiLZ+qyCiUnhc4v6JLS9l+Uk1LIQI/T3NIK5F0XEwoXkh31GAyMeLsVG2
	jmPb5MduYt5pqujQzb7k83aoEgK0W2BcFX5ZI5j1wIinyBN7imPjw4SLKSNlopc+
	mwD/QMLg2W+Ip86t9vYkX7J5mWUrTZ7h/jKQvWGdo2HC/T0rYd6CufsEkiJSIpkM
	9hprBA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qgdg83hd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 12:22:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-88ef355f7a3so254165285a.3
        for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 05:22:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760617362; x=1761222162;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R9yQUnMu2HxE11HdeoAr8BU2ZwERrUip4hDHAbjMAn4=;
        b=eYCELaPYudc0AQ/20x6HNUx7AVD+KooPihjtcObyg7KC4OwDllKSsuSq0GSnwIb/KW
         28nOVHTECdCSPDGI9kuoAnEYgtgtPXsPP4NGsqZbUuwCt9hsruyujKkYLLecto9NKr7y
         LJftdQhFohJX3NJzGo4EA6tGdQVD00VnnbXuHpg0hxM8lBMJsZ9j1Scy4b120rVtkFx1
         fIyxcrBgQ50I6jPHkUmZev2k2uvwlwahorJwy7DV/NleLkdB5Ef3BU9KM9L+wiHcgZXi
         CVoycQYlYedrK0mIVFwz6FTFfjX94OEBW0OfNlsef3ZP8TpqCEE53EBJAJQIEp+aH8zY
         VbZA==
X-Forwarded-Encrypted: i=1; AJvYcCXTBxE9kOzJRYb5IlPRpYCes5SsDfFl4Gqgfb5moMqej3Zypvl1Jv2LbSef78YaBnvH8gGLjZJS1Vw2Iw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmYstHto0n9npDpULiMMesAmdrkmqHtaCJI8HcbwyF0bS1yzC6
	diUY1HY5TjeAkZ0JBn1ALiY+JU+2rrcyzg1k9phytF5pkQT4yVMiPI7iMSDXsZwbn2OF7MrUBSA
	ls1rUS7ixfyIyKfLJCG7xBg7yqXSyOqQTlDyNwQhOF9kPou7rM23l14SRiU82+/g1Bx0KSIalSZ
	Z5dcAbTQ7pv+VL14QtgXMMHlgTd4zfduA5YsbRXBhK
X-Gm-Gg: ASbGncuSLrt7pD/LCbnNz3PQBonLsjYOzh5oH2XT0kwRGF/NKi1YdPH4ctI5bUc04O6
	NKSmnJ06zpuAPhVqA4G4jGcHkekbw/jRcFLEftncIZD6MqJtBrUrkRLiUOHAr4UaiHaw1XducH8
	cy0i/uCd5ZrH4lTVxUlktVYbhLeaAisMH56JuEerh5lhjJ8uixhHmzTiPzoPtocdjCPhUXtJ6CZ
	bHfi+26HBuRQfGm
X-Received: by 2002:a05:620a:4502:b0:890:28c7:f669 with SMTP id af79cd13be357-89028c80073mr58575785a.30.1760617361786;
        Thu, 16 Oct 2025 05:22:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnZMb/cYhHwHiWYZwoXQy2OINpsvIKqNRNCU3Ket2voCC7bfHOUUrKU4B139SqJ5kxiGE/2fuG+XnMoA4Crq4=
X-Received: by 2002:a05:620a:4502:b0:890:28c7:f669 with SMTP id
 af79cd13be357-89028c80073mr58573185a.30.1760617361345; Thu, 16 Oct 2025
 05:22:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251014-add-new-clock-in-vfe-matching-list-v1-1-0d965ccc8a3a@oss.qualcomm.com>
 <9984bc23-05ef-4d46-aeb8-feb0a18e5762@kernel.org> <bc0caeb8-c99b-4bef-a69e-5ce433e6b890@oss.qualcomm.com>
 <c4fd6bfc-cc9a-4f37-99b3-f36466691a1e@linaro.org>
In-Reply-To: <c4fd6bfc-cc9a-4f37-99b3-f36466691a1e@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 16 Oct 2025 14:22:30 +0200
X-Gm-Features: AS18NWDp6vazgiHxY7kgFcW2LE3xKj8UU2r34EGJpIgpnAkFsDnwm-UZKPSoRe4
Message-ID: <CAFEp6-2=GJL-gc+PSyAL4=prp_sXdZJS=Ewg5nP2kcp_Gu85Fw@mail.gmail.com>
Subject: Re: [PATCH] media: qcom: camss: Enable setting the rate to
 camnoc_rt_axi clock
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyNSBTYWx0ZWRfX1QPMGYvdhLhB
 5+iWKPX4NeLNNgsBHlpK7912+EVanhzBDGLxzby5Kv2ofIjwIy8DqC07xJ6r+omXt5uJTpBIq3d
 M+amDfpBFn20jMZgvyo8g34FRoMR6NfI/+AYY8iyYtcZgti8E16eSjC7hV3n4YtLeLXjnAv7npg
 zpsTqsiwd8RmfwPuVlN3pf8BWb9zW8uBgjhJs4e5dGIfyv6jLSfA+b2JUQi+to0fj/rA/O9D016
 II7o9tlyyzMT/IhnStWjwKF4W5tAPLyL2LGqGCFMKb3H7ZrC3vPEUTivQ0WOoY61bdQyHee5r4k
 KWuKfZb3Ov62+nw5Ibv+QqkpbtXtXd/vV97zeaT7Jsj/mY5S6WI9JkXkNVAzSaMfj2kWoNss7YJ
 4/0x8p79K5hYh9xpMyzHkSZQ5uJZRw==
X-Proofpoint-GUID: a_p2cAZX1KeGb0cmgVbujtkZMJqAhTxd
X-Proofpoint-ORIG-GUID: a_p2cAZX1KeGb0cmgVbujtkZMJqAhTxd
X-Authority-Analysis: v=2.4 cv=J4ynLQnS c=1 sm=1 tr=0 ts=68f0e393 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=p_FccyrFFb65Td8MQdgA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110025

On Thu, Oct 16, 2025 at 1:50=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
> >>>
> >>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/=
media/platform/qcom/camss/camss-vfe.c
> >>> index ee08dbbddf88..09b29ba383f1 100644
> >>> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> >>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> >>> @@ -914,7 +914,8 @@ static int vfe_match_clock_names(struct vfe_devic=
e *vfe,
> >>>     return (!strcmp(clock->name, vfe_name) ||
> >>>             !strcmp(clock->name, vfe_lite_name) ||
> >>>             !strcmp(clock->name, "vfe_lite") ||
> >>> -           !strcmp(clock->name, "camnoc_axi"));
> >>> +           !strcmp(clock->name, "camnoc_axi") ||
> >>> +           !strcmp(clock->name, "camnoc_rt_axi"));
> >>
> >> Just use camnoc_axi for both. Look at your bindings - why do you keep
> >> different names for same signal?
> >
> > I think the correct question to ask is:
> >
> > Is camnoc_axi going to represent the other (NRT) clock in this
> > setting?
> >
> > Konrad
>
> I'm - perhaps naively - assuming this clock really is required ... and
> that both will be needed concurrently.

AFAIU, the NRT clock is not in use for the capture part, and only
required for the offline processing engine (IPE, OPE), which will
likely be described as a separated node.

Regards,
Loic

