Return-Path: <linux-media+bounces-49738-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE3ACEA05E
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 16:08:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8525F30CB289
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 15:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB9373191CE;
	Tue, 30 Dec 2025 15:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E12JvLqR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I+hAujjj"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C8D31814A
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 15:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767107053; cv=none; b=KfyoqFfQMl14cbqHl4AS3M9M5aIkryvNji3mUpv1LwbyETKH8DY11H5ANNCq1bSUM9qFlD31K/dbSx9+jHL2xesX2oyswKE0wgvl2y8GavsSVbVJWCuPQc/PnFmRRIO8u4g/ErrtS8+tQWdUBO5ITrCK+o2Prqw9DosAXsG3Kc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767107053; c=relaxed/simple;
	bh=vTnT7xNUFKQenxdsBo6MsLgQlML4AvrzV4VY3W63P58=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kHydz75KaJGFfjRT+0MsYjpLxzZruvh8VZYSL1NY4QG+94G/4TPDluNRd6BA9vMhECBZ7aKEKCU5nkkUQwCNcubs/fX1ZPK8GWWRjMcYYIVggy7rcfyIVY/2t8K8sThCcidm33cnqrnA++2HaG+qAdKPRgjMKFhgDGZyqONU+lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E12JvLqR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I+hAujjj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUEebHK3539557
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 15:04:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vTnT7xNUFKQenxdsBo6MsLgQlML4AvrzV4VY3W63P58=; b=E12JvLqR3Zl5EBPP
	5rSMN9pY2SbThHJAwCv3vE/bP15w38KuXsKNgRP2fW7l3PNy2H2TDw7Rcvt6mrCu
	igNwYC9n1tN1oTV2GZVCV2S8JXrPWEU7Yx/j7Gqd/dxa6R+gQBH+X+3Q8A5RMNN/
	V59sG9toNdcGROV8SQO5bhedQHVRTCfRhJtCmPdpxDwNXK1rZ7XhPwqr6fwYX+XO
	vDVNoSBQc8HvKJ5F/15r63Y29BuwWhUV2XURZw3gHlKyrYlFN5ycDkLt7xKNywOH
	/kTyiWKGp25WFUeiCTCF6VgRpYghdK0V+TEPMA39Fy9ZOn676uvjG36z9I12pCZV
	0Rr08Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc88yhbdc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 15:04:11 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88a3a4af701so274643446d6.1
        for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 07:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767107050; x=1767711850; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vTnT7xNUFKQenxdsBo6MsLgQlML4AvrzV4VY3W63P58=;
        b=I+hAujjjsb9/Dor4yHnncYLNymu80dkr5gjuiuPIKCgUJPK9ICgeOLQeDJdZitbDTJ
         C7TTUMZR2c1NHOtFKCDv66Rc9xjsLZjla6KsS3Bf/6McDoh4j6PtnLEnLd/PVwaYcHFY
         nLTEz5Uv+7Nz8fHdTBsn0YWNcxna0jkIUQgz04gN6yr6cRGpf2D6gH5hLqx47WomW3+5
         GJUTHcXYpso6BEIlJ0ycHKntGxAmJAbHAS0UDtJGsJ0yqVfCChI4zmNhha1OlRR7YPF4
         ugiE9JD9YL4Wp/qnZvkq2e+GJP/asltcRLHPsngfYHLlVvnClMUEjJHLGl532+vAY13Z
         CDFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767107050; x=1767711850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vTnT7xNUFKQenxdsBo6MsLgQlML4AvrzV4VY3W63P58=;
        b=MCTd1V+267oQuaYLXGZmLSQZM1i5u2iVLtCODrv+LGcMLT77Hg+rgMiYmGPd5gNLGI
         L/jY5ryOesoaAvlMdp/4a2s8EdI8+Ev1/5p4IRfQe9h05SRT7dfxX/4GJr3pN8SV6dD3
         +dXcS4OjMlcgEvYOWCO1a+l9w9beLQuWf+bvVGpAWP/KvUrwpCUgfZLBgPtWS8JQSMrN
         tl5/WxVCutMFGRSXQSUiVxH38FyJ7ClhuPaTAE5T7pJeIfhfYDg/lq+X6V9lRrzttFJ9
         CJ35c6VVYdt5y7+oiPwO1fy1nnMVHAZ1cWKEt99/U+IAC5N6R34gw84ifCgPppGfKiti
         ADBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBKgo7imQuMLmRSMZ//+0Wg4JQtUa/uEgBVefLe+zVjXXdZdFq9t1gbW7GRHAKuqKqcWzwvWhi4unfpg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGEWF9oLSXP8Qog4O9IJDU5Wt0SZgU8ETUbdDHzY+j+MHkTNj4
	21SZFk/Mm+X2z5T/qs6RCI5I8K90GW/U34qCAIlrD5P4J5qtyCJUBGfj6Cw+JsrEUxo8JWTaEKy
	DsA+f1KtLILGTe0ifpKag+TOV2mfml8aJ12VIv2UKs8spSdovFBeWckuMwNvGUMqIcxZlcHnkU7
	jxZorVS7MevaNlvA9ay0DiNZgJy5/wD3WtC7FX66Ew
X-Gm-Gg: AY/fxX6eSjAUyFcYvvKsQMN0V5pbBNppa4d2pwNBL3WgnhF0ux3PlGyoXxZd+XlaSyo
	kedXIbM/KYZ33V4j0ep4DMZqCntipSvwEpB2KlR/S6lpgPcdC8koVrwqVpDUNbxwHFNeUm4ATJQ
	AatcH8FEGFZPDQ24OT4N8OJCh5gh1fFU3ecOLfWqVNowPr+WFZKFvo+tKSkaY6PcFuR9UkB5lKg
	HVOh1NeEPMIx/FnBbeK9jffyBY=
X-Received: by 2002:a05:6214:8208:20b0:7e3:cc6e:3c89 with SMTP id 6a1803df08f44-88d84fff436mr404477956d6.56.1767107049735;
        Tue, 30 Dec 2025 07:04:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE40sWM6QfGLw1nJ8RdwS5EkB3Nc934n6/QR0zGhoNmIyrukY4vuxWWrxWa9XqC9PVpCKID32SVxpQ7QoqPiDA=
X-Received: by 2002:a05:6214:8208:20b0:7e3:cc6e:3c89 with SMTP id
 6a1803df08f44-88d84fff436mr404477126d6.56.1767107049061; Tue, 30 Dec 2025
 07:04:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251114133822.434171-1-loic.poulain@oss.qualcomm.com>
 <20251114133822.434171-2-loic.poulain@oss.qualcomm.com> <aRtbwK0Afo50Lh0B@kekkonen.localdomain>
 <CAFEp6-1Tdmr5v0r+q0qeOG6qqA-hiBaF1iTEcmhBA0oTjLgbgg@mail.gmail.com>
 <aT_Xc6LR161QBRFp@kekkonen.localdomain> <CAFEp6-2PP0ufge0RXTrE2Nrn_sLCN5erokxpJsuGeHq7ZEZ83g@mail.gmail.com>
 <41447e2e-52af-4fe0-8204-7ee7f43841c6@kernel.org>
In-Reply-To: <41447e2e-52af-4fe0-8204-7ee7f43841c6@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 16:03:58 +0100
X-Gm-Features: AQt7F2ouy88udX4bk0QdNc2fKBSy3lUpdLxir7I6JQJFNolaGaTJSf3gpi_Xm1U
Message-ID: <CAFEp6-26NiAcoP-nTaFZrG6AT3QimZsNLfPU07Fj2TwqimBbRg@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] media: i2c: ov9282: Fix reset-gpio logical state
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, krzk+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        dave.stevenson@raspberrypi.com, robh@kernel.org, conor+dt@kernel.org,
        mchehab@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=POcCOPqC c=1 sm=1 tr=0 ts=6953e9eb cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8
 a=cgXU6vlCXcim1KvwOvcA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: JRDsI4tlEfpDp0Qlgr55AUL9wZnrufnN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDEzNiBTYWx0ZWRfXzllzc+R6xOya
 FT2DXrYUrhzi76EXt5qQL3Vo11hG7XhEgQWwfgcKj0iQYI4uTzckhtO2f6tk/JwMNlb1bm85Cle
 rVlz1NsPdOfAIqHHqnwmVCe0G9yKxgMxUoSTYmg6vUwDTRpgUomQaQGF1wixQKZPxIfEZGXLvTy
 1Hv5BFvdCNHRTOM/llIPnR0jwuGogNWx2nN9KlQfmygoy/Z0HxYV7d88wF1PlPESkBRUWBEreKD
 mbpRdxERwLB697clXY88xduX7meRzobX8vqoAyWUqbbdnYfRdPmuis26H9u7KSNJQOYxFOv+Djm
 mMJ1FmqxsWEW+C8dKhDto//VJnbFAOMz5LtoB969DXuQIMihGkws9Fli4ifeOiOKDOrJtQ/WP9W
 /KYAoM82Vv8IHYI7bVDLhZ5a1HoNgN/IwWqNFRBFNG15rR04smqtmy1w/I4uMVpjsHTLC8c5G2G
 8Dr6Kt0ADRetMsSSlwQ==
X-Proofpoint-GUID: JRDsI4tlEfpDp0Qlgr55AUL9wZnrufnN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_01,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300136

Hi Krzysztof,

On Tue, Dec 30, 2025 at 2:54=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 15/12/2025 11:19, Loic Poulain wrote:
> > On Mon, Dec 15, 2025 at 10:40=E2=80=AFAM Sakari Ailus
> > <sakari.ailus@linux.intel.com> wrote:
> >>
> >> Hi Loic,
> >>
> >> On Mon, Dec 15, 2025 at 10:35:15AM +0100, Loic Poulain wrote:
> >>> Hi Sakari,
> >>>
> >>> On Mon, Nov 17, 2025 at 6:30=E2=80=AFPM Sakari Ailus
> >>> <sakari.ailus@linux.intel.com> wrote:
> >>>>
> >>>> Hi Loic,
> >>>>
> >>>> On Fri, Nov 14, 2025 at 02:38:19PM +0100, Loic Poulain wrote:
> >>>>> Ensure reset state is low in the power-on state and high in the
> >>>>> power-off state (assert reset). Note that the polarity is abstracte=
d
> >>>>> by the GPIO subsystem, so the logic level reflects the intended res=
et
> >>>>> behavior.
> >>>>
> >>>> That's an interesting approach to fix DTS gone systematically wrong.
> >>>>
> >>>> I was thinking of the drivers that have this issue, too, but I would=
 have
> >>>> introduced a new GPIO under a different name (many sensors use "enab=
le",
> >>>> too). Any thoughts?
> >>>
> >>> Apologies for missing your point earlier. We can=E2=80=99t really nam=
e it
> >>> enable, as it performs the opposite function and that would be
> >>> confusing in the device tree description. A property like reset2 woul=
d
> >>> be more accurate, but I suspect such a binding wouldn=E2=80=99t be ac=
ceptable
> >>> from a device tree/bindings perspective.
> >>
> >> Many sensor datasheets document a pin called "xshutdown" or alike. Tha=
t's
> >> not exactly "reset" or "enable" but it can be mapped to either and thi=
s can
> >> be seen in the existing bindings. The polarity is effectively the oppo=
site,
> >> yes, but does that matter?
> >
> > I assume naming a pin 'xshutdown' or 'xreset' indicates that its
> > polarity is inverted at the driver level, the driver interprets the
> > shutdown or reset function as being active when the logical level is 0
> > (low), as they actually incorrectly do for the 'reset' gpio.
> >
> > From the driver=E2=80=99s perspective, this naming convention is accept=
able;
> > however, it causes the devicetree description to slightly diverge from
> > the datasheet and leaves the reset property effectively inverted (and
> > therefore incorrect).
> >
> > Honestly, in this specific case, the simplest solution would be to fix
> > the driver, since there is currently no upstream devicetree using this
> > sensor. That would technically break backward compatibility for any
> > out-of-tree DTS (if they exist), but those would have been incorrect
> > in the first place.
> >
> > But yes, this seems like a good opportunity to discuss and define a
> > more general approach that can be applied to other drivers with
> > similar polarity or naming issues.
> >
> > Krzysztof, any thoughts?
>
> You need to first CC me. You sent it to the special bulk email
> address... Anyway, please be specific about the question.

Ultimately, I=E2=80=99d like to reach a consensus before moving forward wit=
h
V4, as several approaches have been discussed so far:

1. Keep the current (incorrect) driver logic: This was the approach I
used in V1 of this series, explicitly noting in the DTS that the
polarity was incorrect. However, this workaround was fairly rejected
as not being an acceptable solution.

2. Fix the driver logic: This was the approach in V2. It ensures
correct behavior going forward, especially since there is currently no
upstream DTB using this binding yet. The downside is that it would
consistently break any out-of-tree DTBs that *incorrectly* describe
the GPIO polarity.

3. Follow the wsa881x approach: this is V3, aiming for best-effort
backward compatibility. That said, it=E2=80=99s true that this approach doe=
s
not handle all cases.

There have also been discussions about introducing an additional
property for the same pin, with polarity described correctly... From a
DTS perspective, I believe this would likely be rejected.

Based on Laurent=E2=80=99s reply, he seems more inclined toward solutions 1
and 2. Would either of these approaches be acceptable from a DTS
standpoint?

> I responded to earlier message that your claims in your comment in this
> patch are clearly wrong, but what it is surprising me, it's second
> approach this month people completely ignore existing and new DTS. Other
> was MT7530 where author also claim all is fine, but actually both old
> and new DTS were broken. Same here.

Yes, the comment is oversimplified, which makes it incorrect in
certain cases. I=E2=80=99ll ensure the comment is accurate in the next vers=
ion
if we decide to stick with this solution.

Regards,
Loic

