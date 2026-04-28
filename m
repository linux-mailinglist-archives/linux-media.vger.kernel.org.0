Return-Path: <linux-media+bounces-59831-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JY2J/6c8GkRWQEAu9opvQ
	(envelope-from <linux-media+bounces-59831-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 13:41:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F44B4840DD
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 13:41:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 39D5133AD952
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 11:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C06EB3B2FDB;
	Tue, 28 Apr 2026 11:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nidgTwLw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kON0cKc3"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946492F1FEF
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 11:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777375798; cv=pass; b=hpkfS7zLw4OEd7mQl2TLogEzFzV41it4zEWBlxm4w9neQlYi+pCGPL/u46IjUiU+bc3PuKJPLAk2w4iUb74Pa1fLPgMR2bN/rNyYkpG2BU6DCfYsDU518o5HOUMZ5SqEo1IMYnO8YEtE1wEmbJl0ZU0eZ/FITg1PXlp4TD5pwfI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777375798; c=relaxed/simple;
	bh=gAOBAXwoIZgNjfV46XOLVfiLxyQWHRJZDpDieg00AOo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bPUz0uC225Djw2r5MF4l2xNDtw3Q6dZNDkSFPNrggrtUnbQEZSMa3vA6kNl3aOdeVfKtO/ptStOXqzk1M8lawgTBICi3pt+kjzO8irMGgr1U+inHRz1CUbRX9LY9WhLUXBPXWnjfUjtCfi3skQlp5mkD1OzP9lUG1vSnOvJsCPY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nidgTwLw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kON0cKc3; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S9hXSn2045245
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 11:29:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0hbXvdArmq7BM5rLKvOa8BUlGtAkO648SmKUpum84i0=; b=nidgTwLwOByEgLG1
	y9Txngz3OgjJ0joyQ5rcFFtKfd3GKGy+sITAj1oc8zv7FmS4Ru/PnACzKjMUpnNu
	w3HaqUHSmchzsNTpfll5aHGujziIkX0sbJ6I5bwMNsOc12b0tppaHztpb5Igfhii
	xAA9zFE2pea+weLDGr3rI+uroTC4Dh9Fizbsd76/mGcvjz3+RYa2WRnzxqwSZlY4
	wf2glIzspayJhRBZZWtbHJeIp66dqEe9MU9B6LUzJN3AwDj+W+n0SzfvXo5ru/X+
	lVP14UoBzpQcKNEJF7+U0oDAI/cgprHR4XaUQYazI9KUVFK/AvcwL6EoQhv/aGIz
	XOgnGw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dttgyrbj3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 11:29:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50da31af14cso299607251cf.1
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 04:29:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777375795; cv=none;
        d=google.com; s=arc-20240605;
        b=W/deVIGVo597iRlCw1DOOq0T0L8YC7+rz8rGRM1eYOAtK3m7p5gXr16E4TLfKM3fkM
         kFBPhN8pcGTRkCJKjuyxx6tClJbVvbdiwAQRaqQ457mw+Xt62J45AlJcMRWnuoSldz/k
         z1SKPDbpohTKWAIh5MLfX4RuVYjvlmqWlJbquKWD4RT6bq7obU9MpJ+Wn/MvSL+aOWRC
         6OK5iJ7WqKJDapndHiajEOx/Pa1FnoYDpr0JxMqE4g05eo/5FnBX8GAsthu14Gwfe9qz
         N6uaZ3pJbn/Au0SF5BcPEoQ11TbJSZ7X1FX+nW6BEdd0LOi7I493euM9m4PXGId+KI0G
         5DnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0hbXvdArmq7BM5rLKvOa8BUlGtAkO648SmKUpum84i0=;
        fh=I+pHaAwdtjrT7LUuhjJkzecOeAYGWv9PjEF8eufGRnc=;
        b=Rkh8aY4wFD1Rv8tdCfvkRyx4W9mssrXiByaPbeLa9ngildHB5Og95TcV9/LV3bVip9
         zs9fc8v4pI8TY9MYQGyYXSfeP3Y4KUDI76Fsx3hRq9D/8wnJJooM+v+sPk6spAYI4vg2
         m7Xt31qogC7rvw1hyXViy2htnTafEKpcIqPj3eXiZo42HUOwD/I4aKowfArC0hVfer7W
         tyaf9KjdZ0dykHxVREOPP4pai0vuBa4NOuDZ9pTlOfBrhLuw0niq/oxDm6nM0qKV4Ux7
         JL0QMAj4QkFEdcOjAtSji077xlUJSOq1eJIik75qtJRflEmzSIaraCgeWSvGLoQhzOK/
         SKcA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777375795; x=1777980595; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0hbXvdArmq7BM5rLKvOa8BUlGtAkO648SmKUpum84i0=;
        b=kON0cKc346i3f/W7/9eZUusBzMR5MIc1pDqusZmRkHAy/K+eb2XbLpWqXtjEZFHaT7
         1oX7GMqrWFWyOMtq0eDKxLc0/V3FB/1DaTp/tM44XEaKAUHuzi5tefVRj6xYk+utZHAB
         fGAjmaW1wP7aKEAXRZefCIQlPi6g7H/aV7Pif49cyOwTiOQYCaldSz8qnoTm3TXeU51F
         SC27CzMzG3pZ1mL1d2JNJHipLZoqP5OiqrCjXA5MnZ/DbFDXX4WUaxsXLRAOBcTqLOqq
         kQWYfmLybkXP4nGj3X4nS6qBQHsOI3C+yMQUDjfBxVTcmOAExNid9HeGPNBbtenno55s
         A4gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777375795; x=1777980595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0hbXvdArmq7BM5rLKvOa8BUlGtAkO648SmKUpum84i0=;
        b=QfA01A/T1QdtDqJKN5nAe99yttabEosaiPASqmNZhWBmM5hAS5/PqDz79e/gox8CO4
         mAiFDZazM3nmUoz8d0lC4Pd0OSoBtrkfyYQiR24DiK9l0yVVkUcbq0I1Nw215oj9Ans+
         JGmW/0TnkD3kJAibvTCDKoqj2RNxXtCb6LqS7ga/6L30fZ7QVarrelzrXXgiYtZiye0O
         +76ThWjP+lhiNripS4/C/37D0hKGfQspgE+pPD+ntMaCrQsH0hXJIX6MSt3BXf1Bc0bh
         Q1r5buV1m0xPbbC12u0cS/9xV8J5euuJ51udYnGIjkSP7toBLVuFbcLGHfoqJXPBKST9
         1tMA==
X-Forwarded-Encrypted: i=1; AFNElJ+1pSGz0i1M9M+4xh7Z0JxUGr2u0fqyN8cHpe1oeDbj0DwALKq8e0WLqZP35eGaGN+DpyK+Kq7cDt2Kyw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxF4KExPxlvt284WgNoZgHPLPYd37fMzZUiTFrFhfEOeoef/fsS
	dJd9QcqIjVYSNuq9+XeCwXeMGBClUumE6m4PNUcbGUbVLPpT7LeCo3+BVKtcZnaJwMuQ26qNLoS
	RylmqU7tne0U/vT/Lg3Ijj6trL7NWNlrz7Lm9clgxMg3SvL4QBolGiNHr1B8o6IvXAEoWtdol0C
	BMlBG2gCiftFrdY5LvzRFYtQQ1eBR6ENqbfBz86vXq
X-Gm-Gg: AeBDievBxs+jOgy9Jz1XG3qL4J1MzigtdQQCbU8r9UlG9hrg20l78wOkQ9ys70xybt1
	kQM/Ztkvy74nDQ5pjqQBrL++st1RGY3fDPudqXX997Zmcv5v3katJ8fivWD7sV8D5fsjgS3XRDV
	H6bGdp//5UUGVvTf9FqVzncpaOyyFqHCSoE3Iy8ool/gYycHXoz5Q/+HcqiEDWrEsdEEMeCIbQG
	uR4XvPKe3UcorKwokTjFq5Tkwp/+gf0MrD9boUvZ2dNFeKQ6Q==
X-Received: by 2002:ac8:7e8a:0:b0:50f:135e:d68 with SMTP id d75a77b69052e-5100e1fdbebmr31893171cf.58.1777375794689;
        Tue, 28 Apr 2026 04:29:54 -0700 (PDT)
X-Received: by 2002:ac8:7e8a:0:b0:50f:135e:d68 with SMTP id
 d75a77b69052e-5100e1fdbebmr31892841cf.58.1777375794214; Tue, 28 Apr 2026
 04:29:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
 <Ptwba7JmobZufdkgayhAhPOOjZhv-yUkZSIMcQYJbKrrBFOdsdG_QI2uUof0EibbexBxSGC4drfA8J1zV2zDRQ==@protonmail.internalid>
 <20260427-camss-isp-ope-v2-5-f430e7485009@oss.qualcomm.com> <d4f786a9-3cd0-40ec-b499-8185e867af44@kernel.org>
In-Reply-To: <d4f786a9-3cd0-40ec-b499-8185e867af44@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 13:29:42 +0200
X-Gm-Features: AVHnY4IR6P3xmdEgm4g7wjJg0q93e62a-0qdxzDCaWk2GqaeMpyePeTLoKno4rQ
Message-ID: <CAFEp6-2RxaL4QgdBk4jrX3iC8mE8u6PvP89CD34x+Y4oAcwFdg@mail.gmail.com>
Subject: Re: [PATCH v2 05/14] media: qcom: camss: Add camss-isp-bufq helper
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, devicetree@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: qnQ0rrFFhOBSFz03zWPyx6YQt-iQO4yt
X-Proofpoint-GUID: qnQ0rrFFhOBSFz03zWPyx6YQt-iQO4yt
X-Authority-Analysis: v=2.4 cv=cb7iaHDM c=1 sm=1 tr=0 ts=69f09a33 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=XvfFUYa5IQhs_SHw49QA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEwMyBTYWx0ZWRfX/8necrZzQyFW
 RACu/BbpzaDRs19i9dw9rFZ5XvGrYGGsW94KjRRfCn3TMjSdCzjT85VwyuHpHETECEeM0MM4yAR
 i+dwwTLI9QpAIYaEqsycZFXITP7n/wrhU9+d0xcNoSmSck5vnJbHLMbwNnSZFHeQA+12NNNGceh
 YKcnE03NSpRAxhaFaXbs5209sVdbdn0LoCY0G8Atp7mdzw2WDO6g0I8FjX8JciyUNcrlnjrPN5G
 tkaQjNXsz28oHJ9pwLFyvd4QeetkHgDcb/B/nrUy+GYuX6iyXW4wQf3EdMLzozG7F1t8ET+9P8v
 ie0E9vNiylF2oFBpC3yuclkr+toxSahXtMx//7VULeOUAGW+Rfufo73MJPWy0p9T5m7PwvTY9iw
 Vz0W4Go3bkJYQspE/dnxHnhZNmnwkGCCZKaqO+zUI6u/Go4cf4xVomzz+H7bnDuaz6SU3nkzLUc
 XagDjdRtPsH/gD40Yhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280103
X-Rspamd-Queue-Id: 0F44B4840DD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59831-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim]

On Tue, Apr 28, 2026 at 8:56=E2=80=AFAM Bryan O'Donoghue <bod@kernel.org> w=
rote:
>
> On 27/04/2026 13:43, Loic Poulain wrote:
> > Add a per-queue ready-buffer FIFO helper for CAMSS offline ISP drivers.
> > camss_isp_bufq provides N spinlock-protected FIFO lists of ready vb2
> > buffers, one per queue index. This can help multi-queues management
> > and synchronization in ISP context.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >   drivers/media/platform/qcom/camss/Kconfig          |  14 +++
> >   drivers/media/platform/qcom/camss/Makefile         |   5 +
> >   drivers/media/platform/qcom/camss/camss-isp-bufq.c | 101 ++++++++++++=
+++++++++
> >   drivers/media/platform/qcom/camss/camss-isp-bufq.h |  85 ++++++++++++=
+++++
> What is the purpose of this and the next three patches - why not just do
> it inside the OPE ?

The goal is to improve reusability and avoid an complicated/large OPE
driver by moving non=E2=80=91OPE=E2=80=91specific logic out of the driver. =
This would
allow it to serve as a common framework for both offline and inline
CAMSS processing engines. Looking further ahead, some parts could be
further generalized or refined to fit within the v4l2=E2=80=91isp framework=
,
although that is a longer=E2=80=91term discussion.

For now, since OPE is the only consumer, and to keep related logic
localized within its respective files, should these components
initially be built as part of the OPE module? They can then be moved
out later if and when additional users appear.

Regards,
Loic

