Return-Path: <linux-media+bounces-56756-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Cr1LXNxwWkQTQQAu9opvQ
	(envelope-from <linux-media+bounces-56756-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 17:59:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC302F93F9
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 17:59:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5704E313D85C
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 16:06:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F3053BD62B;
	Mon, 23 Mar 2026 16:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ENPDGsh9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S5nHpIeu"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF14D3BD237
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 16:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774281827; cv=pass; b=Cm32YPqOXiCHRcqWQ/X/RE75ohmu8QrPjebWAzj02i7d6pd0fzqpOj5bj/pWoBIRg8XXJYo7DSPTBn+LveS6rRcRbaAEYh8Pavd8pHaSP74XsMpKYZ66g9v/7dNxd7LLR+WYXY6KmcdkEOqH3itU6l2CichazTMlI+Eqd0H/8N8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774281827; c=relaxed/simple;
	bh=6IeZ8bg0RppZOGpii6z5tIjcxbE9K2oPFgD/N36lrPY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cZUvMPJdG+UGDMhdsWJBt4NgRlyUpVt+bYOYhZ5hZFey0dklkX343IMTNHBlG85jjUFOwToi+PDHk3s75o4QlqRfw73c61pEGMIab7GfaCjvAKdvEauZfbbC88z8zVfakjNw2R/yC2KNjyjYiQ9z5JurE4vycxEUHlppJY82s8M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ENPDGsh9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S5nHpIeu; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NFHuHJ1423691
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 16:03:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YUbYj7E6USUjs39a3+mImLkR+XQomQn/mwKeuuq4nEo=; b=ENPDGsh98jYcruUN
	B9CMsz9yRVTdwS60oVcVmGmU+ZgAS7ZwB3KyRLOIoinaX0DTys31BGD33rcQ/To7
	Vc2zk6elqkw7IrWW4vw51tgRsbs/YHjbIbl1xvz/LAgGltAZMTEDiPTjVAFKgn1E
	IGHXL5LJCVPTsztCcYs7lXOzCjzUXrLzW+75QP0JyxW/oOLsIDeDFseQCI7PeEMj
	ZTGU0qUE9vTWGz0D7Ct5QFlTrsUMdocnotuDYp2M2kTPGwN7ndO2uD/CmGwHvele
	ED2Qu0EWecgbz/SrzR680MQIEcaTEtha27AsAGZofNiKgjkoXRUvE/kH9oV1Gqg3
	LTmEOQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d36f08jp4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 16:03:44 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35b96fbfc64so15957730a91.2
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 09:03:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774281824; cv=none;
        d=google.com; s=arc-20240605;
        b=e8olMnAs4pyK0Y7GmBqv8z6+JDCw13bazo5GeCDGCT98diwGxFNRi3qWCEPnwezKFQ
         E1KoYQSfqV9tOL/+TMQNzzXN+ps9dXUNGQ/p+Nv3MfhSApwePW/HZLb5PMcLVKq1sDh3
         IhpQ7QhhX5ROhh9g5hBGc8J1xS2hr/850br1Clg9wdYhEwnZsQjlYJbrHRsMEBeUbQiV
         IghIVD2km75VBOLXvAFwUIos+WV//s8X5PPDHUHi0MpnjdiRaOOiRgI6JxlwCjIbKTf8
         Xow6JfQRKq0w+koGDwOzYqq2Vgw7UX0Y8bbGkQ5UJLtXGSyJqegIBTij9qnRP82eHypP
         31ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YUbYj7E6USUjs39a3+mImLkR+XQomQn/mwKeuuq4nEo=;
        fh=ZgWUYGS+vKak6fxtkCrZolkpYdWeHlBJdW+PvE8y7ao=;
        b=GclsC9VJobSdgVZ4VKhbQ72NP7N/9E9EimpAe74hn7cVFXy1cDkKOrYfUoZpv2PPst
         qWjjQuLe8HPuXSnk0H49EXI4x8BC/jH5L3+5nnN9+FIdqUAQ7OBuAMiK1slSTRmAWfAg
         44tSo5d2pozaO+oHb64cAqnjgstxI6gpUOh1b7Huma6Z2QH65vlqjYNfSTzW2PzxrxxJ
         fClZV71FZxJCA0AtJgTJkqWeWRnYNEkYhngztvy994+2r20n1b7xLfj9x3M8uPBh0iou
         MA9zvwp8fA0BjfRNKXJohg8FkQ6zVY42aZW1PKdsjyZbhdnFcHVRiKGGhUt1Lj8e3hQu
         kEBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774281824; x=1774886624; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YUbYj7E6USUjs39a3+mImLkR+XQomQn/mwKeuuq4nEo=;
        b=S5nHpIeuKoHqhEfkzN/HHDnMFscZFCMA5BbSbPpAMLNXQAWE9ktlTdytognjLpIGRT
         9dMdPPVMUF/P5avjEUaB+URjj2KEF6DHzkx5D6WahYi7h+UuYv4cH0R0gdkEr7VHWZnY
         EOQGtbJgMnT1F+xmDYkzsPPfNs5Bs6wlx3wo9K7Qm6wndylWj0UjtgFcwsMuoVSHd7u3
         mNo01vB9DWvN2rzL9tdxWz8QqH7NYNIUBZwUfCnQqFYsiknTSqMGyfxKYVqBdhORNVbc
         g26f48Tl33TF3g3AT8oo/SRnqn2tdnmHqy7LKIh/AmxChTPEGJua3Pw8BeEP06V3fdPK
         1clA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774281824; x=1774886624;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YUbYj7E6USUjs39a3+mImLkR+XQomQn/mwKeuuq4nEo=;
        b=o5gnbARvpsfdI5uj+O+prR3dW6FZFTpph1XOD3jAhb5U6sYtdU0VcBPZALgx5yt8Hx
         24ykqB1BgdTKslq3eCdyKk0vLqWHYlEu5xAuwI2GGPdsqvIqrcY/Xv2By011t2Am8bt1
         Iw6zlEOSWxtAKhyJxz5v0bHY5YTck8Lq2pHjhNkzyMiao1VXcQQbJsKU7vZ4NdBrUL2L
         nuYdELfHh3rgMEV8V9gqx3VMLq1B8oHz2crXf5mRUVLUsJ6xkFxjf60DuADO4/IQQOw8
         r8YZWupk0DJo8EDuzAMWWD7EPdWrHN444a777sfKvKu+LNIhPdy2dPPEVTos0Ev7gOPO
         /KKg==
X-Forwarded-Encrypted: i=1; AJvYcCXcf+n7lXsjhnVBxMBAZmzzCuYyZHno+N3Iciw4QnnwkwxXJvCqU544dNeqQxIph4Xy7IYeUiUDRl4Q7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm1R7q4VzBBUWJXX5a2iPxcMIU8Eym8prAkmRP249dtRCeHl6D
	duwpUiMV+NJHSgKf9tsonChrXCMK29GsJmHTqpVCiL0ZDYgaa48UHN+QgwpKYUAvuZs/99YZ249
	z7xpiAM2th/1Oi4xFHX0xd7b9Z0077dzBYYbi/GhwDWJOetQBJDD2H9UxaOpz3MnL3MgZOG/+3N
	Y2Kttgp7vmsh8tfIrtgBvaOxzWK8bU0R6/HX0csm06
X-Gm-Gg: ATEYQzx/VKMPGzu78FNlZ5XRj+SXyhd79SfV6ObbrrJeX9pRdh5jdzvNBe5oODOp5b9
	kNRpN6X9B2RYwRDirNH2Gne2gJqQrasExIhZvSmOkX52CyIgIDR6MIirSgi09oI4rA7f+0wSWmR
	chz9SvK1TAous7jnay140eeC2+aXXCUXlHt0z/9RkMrF35D1bYh7upYH8CXDoZhJVV+y8MtrPBB
	KBrxgMVfjv+e6P+Jr73l1X7uBw7k6ewGf3KlPS3UeTSLz4dn871PcfuDjSKC7Dif/GC
X-Received: by 2002:a05:6a21:6da6:b0:39b:a48e:6a77 with SMTP id adf61e73a8af0-39bceb68288mr10023602637.37.1774281823527;
        Mon, 23 Mar 2026 09:03:43 -0700 (PDT)
X-Received: by 2002:a05:6a21:6da6:b0:39b:a48e:6a77 with SMTP id
 adf61e73a8af0-39bceb68288mr10023550637.37.1774281822778; Mon, 23 Mar 2026
 09:03:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323125824.211615-1-loic.poulain@oss.qualcomm.com>
 <20260323125824.211615-2-loic.poulain@oss.qualcomm.com> <94b415bf-9a76-4d31-add4-6283e8b43b72@kernel.org>
In-Reply-To: <94b415bf-9a76-4d31-add4-6283e8b43b72@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 17:03:30 +0100
X-Gm-Features: AaiRm50U5VFBZif45c0aETtJ851A03Y61IDlm_uO5C4c7JQdpnRMGomgP7_ijXI
Message-ID: <CAFEp6-3xmL4q9eSLpUZjdP5z1yCr_AJxSLmzqF70S05DK7Or1Q@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] dt-bindings: media: qcom: Add CAMSS Offline
 Processing Engine (OPE)
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: bod@kernel.org, vladimir.zapolskiy@linaro.org,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com,
        robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, johannes.goede@oss.qualcomm.com,
        mchehab@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=b+q/I9Gx c=1 sm=1 tr=0 ts=69c16460 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=dDmFx4qguRSL7zYZr80A:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: zepYac7eS8VOthH4Nd1jXMS26XZytb3B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEyMiBTYWx0ZWRfX0er4FaUggIFR
 p852dDg3slu6LlAQPexzJVGvVxxEs1cwsrNFLBOKEKFK3YfVtf8oA1Xhl5eoTHlReLHXLUIDtGq
 kiqxTI5o907dLw5nUVB+cegVJySQmN/d8rWGPT6wfsJGK4u2g7bmLMiOhN4wj+SvbUtSsENtl4v
 G5x8+Y8Ig6ngWnor9YJarrp9AQ+DAP0YLoYKuLjZWWvF6hpMxjfwtX50d2+WkBlhcZSNuVZ1dfd
 R9FEWuzUi9RHDO+qFKdORXClVqlFz5ZUlZDQhkkYaE9f3tVFHOFetMNAWM7qkHYA9bXevbzhtAI
 ecOIkmTcUMPAH+MfyDQTvQmoTRWNA1LQN1b4LNhMoOWrpUAO4Rz4CYbpceF0YwXdjlz9a6rpBsE
 UraI7WEDVEezrRw0wG+ToPj+iD9eQL7mNeKjHz2RLM+okRMk0SWgM38fhyBkietl0N7Gy5HWbML
 dtyG43ZopwYCppYAnxQ==
X-Proofpoint-GUID: zepYac7eS8VOthH4Nd1jXMS26XZytb3B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230122
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56756-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_TWELVE(0.00)[15];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: BBC302F93F9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Krzysztof,

On Mon, Mar 23, 2026 at 2:04=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 23/03/2026 13:58, Loic Poulain wrote:
> > Add Devicetree binding documentation for the Qualcomm Camera Subsystem
> > Offline Processing Engine (OPE) found on platforms such as Agatti.
> > The OPE is a memory-to-memory image processing block which operates
> > on frames read from and written back to system memory.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>
> I don't see explanation in cover letter why this is RFC, so I assume
> this is not ready, thus not a full review but just few nits to spare you
> resubmits later when this becomes reviewable.
>
> > ---
> >  .../bindings/media/qcom,camss-ope.yaml        | 86 +++++++++++++++++++
> >  1 file changed, 86 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/qcom,camss-=
ope.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/media/qcom,camss-ope.yam=
l b/Documentation/devicetree/bindings/media/qcom,camss-ope.yaml
> > new file mode 100644
> > index 000000000000..509b4e89a88a
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/qcom,camss-ope.yaml
>
> Filename must match compatible.

Some bindings (for example clock/qcom,mmcc.yaml) do not strictly
follow this rule and instead use a more generic filename that groups
multiple device-specific compatibles. I mention this because my
intention with a generic filename was to allow the binding to cover
additional compatibles in the future.

As I understand it, in the current state I should either:
- rename the file so that it matches the specific compatible, e.g.
qcom,qcm2290-camss-ope.yaml, or
- keep the generic filename (qcom,camss-ope.yaml) and add a top-level
const: qcom,camss-ope compatible to justify the generic naming.

Any preferred/valid direction?

>
> > @@ -0,0 +1,86 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
>
> ...
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
> > +  - clocks
> > +  - clock-names
> > +  - interrupts
> > +  - interconnects
> > +  - interconnect-names
> > +  - iommus
> > +  - power-domains
> > +  - power-domain-names
> > +
> > +additionalProperties: true
>
> There are no bindings like that. You cannot have here true.

ok.

>
> Also, lack of example is a no-go.

Ouch, yes. Would it make sense to have dt_binding_check catch this
kind of issue?

>
> BTW, also remember about proper versioning of your patchset. b4 would do
> that for you, but since you did not use it, you must handle it.

ack.

