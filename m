Return-Path: <linux-media+bounces-65942-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tzcuKX5sQmqH6wkAu9opvQ
	(envelope-from <linux-media+bounces-65942-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 15:00:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8986DAAC3
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 15:00:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OtKc6xDj;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HnywOhJJ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65942-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65942-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7CE3D3034832
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 12:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF5B6403B10;
	Mon, 29 Jun 2026 12:58:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47E9402422
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 12:58:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782737890; cv=none; b=eI2TpHCwDaIxVfZKUgUa6xD1P9+QtxAxqwsVZHothZ9o7nM/VP7XTIIQMht3NtW2x8paIMAQbusxg94KF/V2CQine5cKtZZkS1Sz/PRhPp5iLgk1G8PbT47D8m5/ZxrEpAC2NpJklp2E4GZtG+c/kx4L/rXasx6HrhHXNWGgwho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782737890; c=relaxed/simple;
	bh=GN+ENysdiDdzO37pUY+h8l/bPE2nFulQeO00vlfFr1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mIY+bXo570ojCKetVQw5Ir9By2nT3M0dKSwrCyXe+I1NuhPYZF5ggE1NEDnyns5IL8e/GWyYqfDXcJTUsPEsTySaTuZeg6ARDoQNzEcCOYfi9+L0HIYWfdrHYA6Z9CHnQFRU1Qqj8EbPJizkCymfVeSry6dHks9Yp5V1ioHes1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OtKc6xDj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HnywOhJJ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATDE52647785
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 12:58:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PNfdf4Gwdi1FOTJ0GQC585fh
	e2B9GJS+MtypU4Ccw5U=; b=OtKc6xDjTQLyKv/lHqDPhJza+kazCPzh4U4QUz3W
	eFaaoszQcy0iRI7mt0cy1IUI1c2KJ3HcJ5+fxuK5bEdiygLecRmCAyPPyGLqqxvB
	8m0Ak+0Uz2ZmKoJlvdRZn7lSxb355WLcukmme1J5ORpaBGWhH4rAvri349jATJ48
	JLCcLNcLR0kV7fwXT60rI87zU8rquzKzuCAfrTVS84angfvGP4hg9XuuQS0IYuCD
	5AtarUwRikY6rSmlfi65pZXPvB+Ncf/U7WJMbdvb3l2WiVvesj1O8H96lmC8hb07
	vyxE+jVoY5xrwQoSiG1uxEEiKB0AB1CEI2Z6Dj9jOaeShg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kyjhc3e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 12:58:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915d3261c5cso695983585a.3
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 05:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782737887; x=1783342687; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PNfdf4Gwdi1FOTJ0GQC585fhe2B9GJS+MtypU4Ccw5U=;
        b=HnywOhJJ+lW4EyTN4dw5pHmjj2vxRUAXppEPdXy/vkZP01Ct+GJKJ4uyaPF/5OuZlz
         DPvVIJkMvXxIz0635o5lOmHiSxWTKNxeU0efkWmTmKSguS5PEfO7F6JvECVXHxl2SjWu
         L6e/z0G7ckgzv48zJO3jMgSwgl8aVTqliyuBYkMH/TNCiOjM8uhtdOrT7+moVIN8rXFp
         mU64PR3zZAiQUywM8b+3QrBpftMVb6GoSIVSFry2P1Wz8IXfMz+e0r9Bb9jNhQqLWZME
         CkEwTSVxXPmveAPPEgvq12sSJRcNDZMpO+GxKDOk6gATOCHhJzr4BStsD0dx6gk1T18S
         yk2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782737887; x=1783342687;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PNfdf4Gwdi1FOTJ0GQC585fhe2B9GJS+MtypU4Ccw5U=;
        b=XA3aSOEgHY3BoLao/ohq0Y7q9c0upfkERzExRdLdZPMjbmTSxEo7EmLr1W1ujtpkNm
         lru/3jp6Iqm8t0FeJw/bLM4zg7aGA9Xp/pMtRZ06tiV+xodlRyRp8uGgahoAwRWz4ft9
         rUsQrsAqLgm/Y8twZNh2dkCKoNDr7/jyLVSM1Sjr7D/XtFdixc7dhSDaF62WZEgnqIX5
         yDiHgyELtdlCcgINXLcnF4mA57GzTgxn2/4a+nqNvhJTDZJtipKUCIlgoMKUr957Phew
         9DdKh6CKZzPAO1hBiL0Fqi6RZEX9UQCIceo2AiomeE/IhTp7bg06k5VTmuZbG0VgZCxI
         z5lQ==
X-Gm-Message-State: AOJu0Yys2Mzsp1T1jj5DGO1FIjr7gctHHrWxeDTWXCtKG88WWfqslVoz
	U7ji2dVkcaRmZsSzGk91oXRqeEFDzQdJn39u86eaZQm31YxYHrgkBn/nY+Qq4hpXHCUgIpz8N78
	JJjCnnJeWtA8hz4v7JhfbQS7KATSV0gxeDdOhMnGzsBipOlg5OzEDk5QSYczcdOh/hQ==
X-Gm-Gg: AfdE7ckPdUkrTFzREBse+7LQs/zlUlWD3KwNNlesGg4YQilI0dm7cdwhr5k0d2UJ77s
	2cA3RYjuUGLhYB/8dmGkcWSJQJV2hBpOA+0+DPchIH/tUlEKvqesQGAllqru/XDM2X0Ay7PJkwx
	yq6GFdD/HaN5xvZ7UFLk6Xw7MuQvkyQnOnukQ9YFDbR7QmIEUMpcSkDVWusX8or85buzU7bCKNj
	EKMop4AQu7amaOsWyrmoiNYgOUgeDbg+O6FulcX2ngo3pqg+70AgjAPDofHVtsQm/qVtTOXznDI
	Y+npBr908QoFrT6UZso10zyrg3VeqkpKIRjFRO6xlLtcBVIFoPw2nNtHouNkbglWqTJgUzgFOSA
	F5nYhHPJqaLLOPmwraD1NxKqtn1nOlXu+pPWfHfZZubA6Bm746oGDyBGMv5lpenjLu0PdZK0roO
	7ufMI+1rEtFAvJlHdD21D5vFeX
X-Received: by 2002:a05:620a:44c5:b0:915:bf79:3e08 with SMTP id af79cd13be357-9293e3c92cbmr2740050785a.56.1782737886834;
        Mon, 29 Jun 2026 05:58:06 -0700 (PDT)
X-Received: by 2002:a05:620a:44c5:b0:915:bf79:3e08 with SMTP id af79cd13be357-9293e3c92cbmr2740035485a.56.1782737885217;
        Mon, 29 Jun 2026 05:58:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b1a4e2d5fsm1091291fa.37.2026.06.29.05.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:58:04 -0700 (PDT)
Date: Mon, 29 Jun 2026 15:58:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, robh@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        andersson@kernel.org, quic_vgarodia@quicinc.com,
        quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: media: qcom: Add JPEG encoder binding
Message-ID: <gaod5k77yywmimg6bajpdk4keym4hirksgdxxbphw6rw6mkfal@oquq5oyies2c>
References: <20260629121750.3469292-1-atanas.filipov@oss.qualcomm.com>
 <20260629121750.3469292-3-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629121750.3469292-3-atanas.filipov@oss.qualcomm.com>
X-Proofpoint-GUID: EF5AXn20E_HurSIunMNi_5didiJfudOm
X-Proofpoint-ORIG-GUID: EF5AXn20E_HurSIunMNi_5didiJfudOm
X-Authority-Analysis: v=2.4 cv=Ftk1OWrq c=1 sm=1 tr=0 ts=6a426bdf cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=xu2w3LTtMloSOAqb-NgA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEwNyBTYWx0ZWRfX2ZRRWmneFFLK
 q1FEwFVcLkN7shjVE6kOVWvLVVb8CYAMnQszCli8v7C8JU6EydXoVs/j6Epsr6uKVv84t/0SAKz
 55fSuKqCom4Vwf18LUlqQCqRTcUUock=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEwNyBTYWx0ZWRfX5BxCikp53FMC
 9ew81n0S45pNmnBNL2ZL7bCTC9eXCJilKhPNBm0E8Zt4ZT7kjKUZLAmYtpTGACg92O+ctiVxmqy
 IyvWs8d5h5AjhWTJJsYc7Z35bV47AUIFIa/L1xpaxUkqL5e6qiXhGSGio1cpR90xJ3m7OcWp8KC
 tyJFq6upUNto7HdLa59equnI+5+Z4/jdo6Vuy0Chn0rQJniTvyh+BHVax1/fma76uh4aaiBS9qP
 U0Ept/8hSk4wc8LgVe4dHE75P4tIoZxc/8yp3e9qgZrJ5a7StbHA+TkzAqbjx9ZeG6jlZ3KDhc1
 cFQv3SjTjOTmi7kbFyfZqGRlKOkHG6OYVtf4q1TdgF5xEYCVRedSewUE0W8G1nFax5ZbinISTHi
 nGeW4988BoHZXUBtMrkliu9n/K+CeQwl9O8eBxVG0nA/Wr3NicS1YvJpLCugZwWjNTKl6JIa7CK
 8OJz0yOlt1S5G4fTS/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290107
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65942-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oquq5oyies2c:mid];
	FORGED_RECIPIENTS(0.00)[m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzysztof.kozlowski+dt@linaro.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:quic_vgarodia@quicinc.com,m:quic_jesszhan@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@linaro.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RSPAMD_EMAILBL_FAIL(0.00)[linux-media@vger.kernel.org:query timed out];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8E8986DAAC3

On Mon, Jun 29, 2026 at 03:17:48PM +0300, Atanas Filipov wrote:
> Add device-tree binding for the Qualcomm JPEG encoder hardware block
> present in SM8250 (Kona) SoCs.
> 
> The JPEG encoder is a standalone hardware IP within the camera subsystem
> that performs JPEG compression in memory-to-memory fashion.  It is
> separate from the CAMSS ISP pipeline and has its own register space,
> interrupt, clocks, power domain, IOMMU streams, and interconnect paths.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,jpeg-encoder.yaml     | 160 ++++++++++++++++++
>  1 file changed, 160 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
> new file mode 100644
> index 000000000000..c8b4808054cb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
> @@ -0,0 +1,160 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,jpeg-encoder.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm JPEG Encoder
> +
> +maintainers:
> +  - Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> +
> +description:
> +  Qualcomm JPEG Encoder is the JPEG encode hardware present in Qualcomm SoCs.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,sm8250-jenc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 6
> +
> +  clock-names:
> +    items:
> +      - const: hf_axi
> +      - const: sf_axi
> +      - const: core_ahb
> +      - const: cpas_ahb
> +      - const: cnoc_axi
> +      - const: jpeg
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  iommus:
> +    description:
> +      Two SMMU stream IDs for the JPEG hardware. The first entry is for
> +      the JPEG core engine; the second is for the JPEG DMA/scale path.
> +      The exact stream ID assignment is SoC-specific and not publicly
> +      documented by Qualcomm.
> +    minItems: 2
> +    maxItems: 2
> +
> +  interconnects:
> +    maxItems: 4
> +
> +  interconnect-names:
> +    items:
> +      - const: cpu-cfg
> +      - const: hf-mnoc
> +      - const: sf-mnoc
> +      - const: icp-mnoc
> +
> +  operating-points-v2: true
> +
> +  opp-table:
> +    type: object
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - power-domains
> +  - iommus
> +  - interconnects
> +  - interconnect-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,camcc-sm8250.h>
> +    #include <dt-bindings/clock/qcom,gcc-sm8250.h>
> +    #include <dt-bindings/interconnect/qcom,sm8250.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        camss@ac6a000 {
> +            compatible = "qcom,sm8250-camss";
> +            reg = <0 0x0ac6a000 0 0x2000>;
> +            #address-cells = <2>;
> +            #size-cells = <2>;
> +            ranges;

Drop both SoC and camss nodes. Rework your _example_ to work with the
default seeting (address/size-cells = 1).

> +
> +            jpeg-encoder@ac53000 {
> +                compatible = "qcom,sm8250-jenc";
> +                reg = <0 0xac53000 0 0x1000>;
> +
> +                interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
> +                power-domains = <&camcc TITAN_TOP_GDSC>;
> +
> +                clocks = <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +                         <&gcc GCC_CAMERA_SF_AXI_CLK>,
> +                         <&camcc CAM_CC_CORE_AHB_CLK>,
> +                         <&camcc CAM_CC_CPAS_AHB_CLK>,
> +                         <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +                         <&camcc CAM_CC_JPEG_CLK>;
> +                clock-names = "hf_axi",
> +                              "sf_axi",
> +                              "core_ahb",
> +                              "cpas_ahb",
> +                              "cnoc_axi",
> +                              "jpeg";
> +
> +                iommus = <&apps_smmu 0x2040 0x400>,
> +                         <&apps_smmu 0x2440 0x400>;
> +
> +                interconnects =
> +                    <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_CAMERA_CFG 0>,
> +                    <&mmss_noc MASTER_CAMNOC_HF 0 &mc_virt SLAVE_EBI_CH0 0>,
> +                    <&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI_CH0 0>,
> +                    <&mmss_noc MASTER_CAMNOC_ICP 0 &mc_virt SLAVE_EBI_CH0 0>;
> +                interconnect-names = "cpu-cfg",
> +                                     "hf-mnoc",
> +                                     "sf-mnoc",
> +                                     "icp-mnoc";
> +
> +                operating-points-v2 = <&jpeg_opp_table>;
> +
> +                jpeg_opp_table: opp-table {
> +                    compatible = "operating-points-v2";
> +
> +                    opp-300000000 {
> +                        opp-hz = /bits/ 64 <300000000>;
> +                        opp-level = <0>;

No numbers for levels, thank you.

> +                        required-opps = <&rpmhpd_opp_svs>;
> +                    };
> +
> +                    opp-400000000 {
> +                        opp-hz = /bits/ 64 <400000000>;
> +                        opp-level = <1>;
> +                        required-opps = <&rpmhpd_opp_svs>;
> +                    };
> +
> +                    opp-480000000 {
> +                        opp-hz = /bits/ 64 <480000000>;
> +                        opp-level = <2>;
> +                        required-opps = <&rpmhpd_opp_svs_l1>;
> +                    };
> +
> +                    opp-600000000 {
> +                        opp-hz = /bits/ 64 <600000000>;
> +                        opp-level = <3>;
> +                        required-opps = <&rpmhpd_opp_nom>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

