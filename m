Return-Path: <linux-media+bounces-59727-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPiAKcbJ72knGAEAu9opvQ
	(envelope-from <linux-media+bounces-59727-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 22:40:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3662047A259
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 22:40:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B2F7831237AB
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 20:34:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E318E372EFA;
	Mon, 27 Apr 2026 20:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="flLk6J9/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UdTOCkXl"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209C236167F
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 20:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777322046; cv=pass; b=W+beAPfJ1nQvWJKv9apQT8w6xMQkouqcbynDCrI6aoEr0/Rrklxzei8XR+auKxcAWak6TDfDiQuMmrgi1kUJ//PDzncuajpA/IscPPFFRRWEqorT6JkjEhpXq/nhkB8AuRt2uuzXBjwAkn9OJewfaazeZJO9nMq5fEHrBOVoU9I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777322046; c=relaxed/simple;
	bh=5dFf4SUBMP66al9PPeN37zfbBUVyl6Hn9p/qcpwkv2s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZQyUEvycpNxObpWSw37MJ9/e6NAzzjWJRDrKmQ+kIvBGXmD125g+MHzPyJxvyNJ2m9UVarKqKIgDOBEc9zfu5ykdjr4Yp9dHW64pCW6ZtljpDQg9OJydusGfE6jFr7xS+zIeMi3crYzZZGSbVtCGYygCquoKL4699s8dyOxc/Ms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=flLk6J9/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UdTOCkXl; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RJfPe62383062
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 20:34:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gzkPIKk9u96O6H7P1bdKNoMSV2AVIfh5b7spc/gNPMM=; b=flLk6J9/5KJGIGro
	3UckxDn6KkOsQ5xfqbYUZRKjIlrKEn0WITFWx7wYwnZK9Nue2Qs3umRUEJ8VVa7m
	n2HIVM25BX2K2lcGvFESq7JthJ+8fbE6VBrcBiU+i1NqP9dpZTBmymG/FJ0MD/LV
	bQoYSkqo81Pit0iLqYUCf9DJWStajsGjiN5igoJB0aU8EiouHHLmKKzcc+n9mACT
	qYdsna7negCmXiRdLh/4MrGhM+7DJSEIBC3hlQ5+fEW6ND6mMRzMuDdxvQhmWUhV
	Rc3Fl2+dS7jv/KV2LinTwpegk6Zj60HAvjQ+Np2gV92KdlmeFiNSO0Z2WLVo2DVQ
	6hRC1w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt85xsrnc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 20:34:03 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ae6aa148a7so210848566d6.0
        for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 13:34:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777322042; cv=none;
        d=google.com; s=arc-20240605;
        b=DJ4PjOdCI8M4Cv/dcIXDt3qQuDzzaDBe+e4ivF4ZjveFOgAhiyZwtDMz0xvxuNQwkU
         xtBEF32/RJrTUP3knq+XLW/8herj714sW2XBzb9TJixJDXsKBM4wGhmnoHi7RDkFWFYb
         2LhEBAQ1HD25XmzBdG4VNRTYdxLQGTpCwUtrf2m51eR302lQLuXOo4KFBcaTUsVATr3n
         WpQGGRIXkPt4wTGX8qhdyn42E54UVz6x7OTUhHYbAPQ9HhGOENBhNrm/IfaiqVGnLbHN
         8225Ti1tqmHfwqk6Cr8IsNlhBtK2k4Uozv9WJoivJDb9h1hqB7tHYI7TeWV0VQqzdpTN
         Lztg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gzkPIKk9u96O6H7P1bdKNoMSV2AVIfh5b7spc/gNPMM=;
        fh=hl1Oo/aFvZLNT8rvD6FUgMd6IxR6cSG6Sx4+dSirXhI=;
        b=YUoeA57nlXQRy30uTlSb4uy715Da68nUKSCaXsiPrWOOSwWEpqH7QveRh5zSc0q/cO
         gUqNo3vjuN4/w0mhSIBoF/E9ciJEiYL+g0g+9yYhgfqo6/VH+KEca/us0CGMd2UNHVIp
         fU5pTo3+ud18VLCwG69fA4ZH/rRt5ZpwxttW3I3sGmu9qbwFPZZj8t97lNj5xdHF6e7t
         k2sKXVOaidrmvkJzzjLUlNPjUhXNemQ13ldC2D9B2i4fAP4y0gw/eDOltOj4s7lBGLTX
         EE+JxeyknSpCa4e5H+zU2YEbK+CC1k0837oKlfg2JLNhA7s1irxgCz2zyWteppa6ONdH
         4jNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777322042; x=1777926842; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gzkPIKk9u96O6H7P1bdKNoMSV2AVIfh5b7spc/gNPMM=;
        b=UdTOCkXlWJSMgHKj200eRfHIMhm87R5i6AVeKir1zzkOir6l3Md8ZHiH4KTQ/e6Ojh
         v9fxYYFHbFSg/zVdjDtLqxCqH7x+jg79ougpgmYK8TPzp0lAQr9JIaC7bswYB3sjj+XU
         T6LT1jL9eSf425ux55G9PSeA9U0wwMNjAxcPXahuPxjHFQ8xoKKXbYBHI72PV4eZH+uq
         v5txlCUW72U440SENhBArS9k7u1zwNLGM3/3qbHXxlYQbhc9Tuo1P8hg7A1kHT7kNvWB
         chneS0bnjrTRJ/8Tvo26MATPVTXEfInBugDLSsg95bLPmb0L67oT+3kbetn2Bp8aPb0j
         sRug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777322042; x=1777926842;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gzkPIKk9u96O6H7P1bdKNoMSV2AVIfh5b7spc/gNPMM=;
        b=abz490GsUiV2kZX6cPI42HpdpNfuJ52rCXYgwh8tdEc2bSSAI0FC+WD85d0+5q4sBy
         C0rFGkogDmKZX3QzezGp1zUE6yBnltX8rZLIf4FOh8yW2CGlnnZKV1AnQ+fpoASIJE5l
         vfO2dPxTmhXE7ztYtMiAN6PEM923SIGzWzpFkIFuQpYXhOLc+ZJ5Aj1Kp7bz53HrjMqE
         FksJN94KKrtdMDXyEzPsjgs7+XsdwZqksvRU8a4MN/DpWqNiOR/w/eP9JFp3pcgCVumE
         YmqBlH6W9CnpFn1G5oEwHPl1ZltTCx/zBDIFMD2AorWYa6asQ424FB+3A9X8r0jPUz8Y
         cAsw==
X-Forwarded-Encrypted: i=1; AFNElJ/7pJ5J9OSN0g9tlb+pHWRAyxSJ2EBpHpmohxfxM5TA3cFxtmzQ44Ga+KvIs/ARnag2GzE0qgUr0EQOlA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw62+yIhZ6tKr178fV98wHQ5HcyUfpWuD/0N84jTXwln6jgS0UF
	atM1KXaYQ+cdQmqosJYZqNL0vQlTnV19XzGX5Pv4dB/E0rzeHiXiXvf5hVRQVvP48z1YNIVrIRL
	YGQe9nrxNgG9sSNvV1F9MoGg7qnn9IKynX65d53sZxt3dGXQg4iEdObOz2098XlJLpu1EtYGn0B
	idyRnPxRM9WOwOzfKODWzrMMqXLSx3l3dM3x5SEBWJ
X-Gm-Gg: AeBDievuVytcnZolwBnWMYIx+w7g995FEa25MdKBBKEeX54xKVHwhyvI0sHyELT8a9q
	wA64Iq5Br+9VxvcYGbwXBy0D5zhfdcgn38UnkTJEnHoY6VlJOu5b5B9kPiWzAP1VnDK9mJ822FI
	iM7EMIwnKeNerwqvCL4gTovqeJ8NwlzF3B/PQA2q20DjTvSCE/XR7KrcGX+yB1FcXwMrA2HA5kw
	xjhk+XBAi1ILQSms2k+D+PuGQ6mxpmPYdee3R+faWNvZpk2UXacN2UAADZZ0pkD7qc9S0OU0EBf
	PJs=
X-Received: by 2002:ad4:5f09:0:b0:8ac:b0d8:65f2 with SMTP id 6a1803df08f44-8b3e39240fcmr3249876d6.19.1777322042276;
        Mon, 27 Apr 2026 13:34:02 -0700 (PDT)
X-Received: by 2002:ad4:5f09:0:b0:8ac:b0d8:65f2 with SMTP id
 6a1803df08f44-8b3e39240fcmr3249106d6.19.1777322041639; Mon, 27 Apr 2026
 13:34:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
 <20260427-camss-isp-ope-v2-10-f430e7485009@oss.qualcomm.com> <aead10a8-45be-4f7a-ac6c-35a99a716b3c@oss.qualcomm.com>
In-Reply-To: <aead10a8-45be-4f7a-ac6c-35a99a716b3c@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 22:33:48 +0200
X-Gm-Features: AVHnY4KDLficlBbaC6G7fd9Wou7Y6yvKL42b-mOiAZ8QDOmheuQtn6aM17Lt5So
Message-ID: <CAFEp6-38=hcUOvW1yd+hRZ2nHV8sLxiLeB18uu-au=LgA2bQTw@mail.gmail.com>
Subject: Re: [PATCH v2 10/14] dt-bindings: media: qcom: Add CAMSS Offline
 Processing Engine (OPE)
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "Bryan O'Donoghue" <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, devicetree@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Zs3d7d7G c=1 sm=1 tr=0 ts=69efc83b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=n6yBxzqcbVTERbX9KwMA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: Q6JX4VAMwInI61cpD9Vpz_-ZSuRzcXv6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDIxOCBTYWx0ZWRfX+swbbaLoleoc
 E15nilpdfjTDvxhscRE+LzZ/sYzft0tNqT6tRVFNTqBvT6dYb5EL+QVBafEJm4BOabpZ7dGZPjl
 WOSh7uqeIOWjC1+XWUPV7x0LfuTfc+8WjzioxERDmTuxkKP9OOp9QIsvOU4p3XVF9ddUU2fiL/N
 wij80L7heO5z+gWNfSBkQBUf6nwdtj9M2cqFEkpWYk0ttVkUkGC0SYFOqWI5rMsHWytkNgJyNe/
 hdmvkto+1OOF/R/10ZwrL8z8wFCPmBIKFoQBOpwq7ggZW/fjLLNJzTRwEjkQfAwvnW5/cfD136s
 78Lw1kGRRNVNicsOV6uk357amhie+slLiVn9TOFRML1Zmpan44PskAh9i3kWrty8x6PvsvMwJWI
 8BDZod1yu2m1PlmZO11mlHNTJGMRZ8RoxfZ6TSZBTeU7RgdtXCMsgrrzLUisf7n/DxkK90cvZp0
 qVsZYj1CkM84q2XcetA==
X-Proofpoint-GUID: Q6JX4VAMwInI61cpD9Vpz_-ZSuRzcXv6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270218
X-Rspamd-Queue-Id: 3662047A259
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59727-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,mail.gmail.com:mid]

On Mon, Apr 27, 2026 at 4:22=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 4/27/26 2:43 PM, Loic Poulain wrote:
> > Add Devicetree binding documentation for the Qualcomm Camera Subsystem
> > Offline Processing Engine (OPE) found on platforms such as Agatti.
> > The OPE is a memory-to-memory image processing block which operates
> > on frames read from and written back to system memory.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
>
> [...]
>
> > +        clocks =3D <&gcc GCC_CAMSS_OPE_CLK>,
> > +                 <&gcc GCC_CAMSS_OPE_AHB_CLK>,
> > +                 <&gcc GCC_CAMSS_NRT_AXI_CLK>;
>
> Should the two AXI clocks be aggregated by camss-top instead?
>
> Otherwise we run the risk of the OPE driver setting a rate of A
> and another sub-device setting a rate of B

On qcm2290, OPE appears to be the only consumer of the NRT AXI clock,
while the capture path (VFE/TFE) relies on the RT AXI clock. That
said, this may not always be the case and these clocks (AXI / NRT=E2=80=91A=
XI
/ RT=E2=80=91AXI) seem like they could reasonably be managed at the
camss-bus/top level.

The open question is how the NRT AXI clock should be enabled when
required? enabling them unconditionally (similar to other camss PM
clocks), introducing a dedicated CAMSS top=E2=80=91level interface for voti=
ng,
or leveraging an existing framework to handle this?

Regards,
Loic

