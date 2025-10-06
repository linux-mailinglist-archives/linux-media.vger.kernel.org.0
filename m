Return-Path: <linux-media+bounces-43797-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E32A4BBF25D
	for <lists+linux-media@lfdr.de>; Mon, 06 Oct 2025 22:05:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 692943C3EC1
	for <lists+linux-media@lfdr.de>; Mon,  6 Oct 2025 20:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 877042DC328;
	Mon,  6 Oct 2025 20:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iC53j0zX"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCAF1487F6
	for <linux-media@vger.kernel.org>; Mon,  6 Oct 2025 20:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759781110; cv=none; b=P7SBOx3dJt+fhSo1+BZNJuzP1+EEVjODhhrOkGskadFXIshAXcDwyXjbTtFftHGGB67Ni2seW7uBN9Cu1mCGz+mcDUAv3utLT+AAHWkPaikjU3szi/i9LruwGebzIA07/LRd+GafnRjrHtfUcZAHDLkY/fWYrZPy5cZPRcD5pSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759781110; c=relaxed/simple;
	bh=ZarTCEKrYJ2uwCZ0DY8fR+K1qpA/Zk8TxurjsZ7MzJI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nq1BP/h2Gr0fY++dFxTVS/IWquJMaxkHBl1q3lS2sj+AF/Qg3NY3gvMjawQ3x4JxalSUVZnqsHTlZvX4YI8Xg6+NSXAJuZnQzqzIo0hSRWG6QhBRG89fH3uzEMrVPBebePGfvwnv5Kp0ljeeWeiRS77jZ2PadgFTBM372gu7XSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iC53j0zX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 596GlvtN028753
	for <linux-media@vger.kernel.org>; Mon, 6 Oct 2025 20:05:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jXF0p/uNDuCc8V4ymUfNTV4xeJ1S0VxZNmP+RnJGw5c=; b=iC53j0zXs9ytKQKy
	X8fefj4moZ0rQP4gUwPsHF8y7HdRlXy8TJ9oQE7VwOReOwehZorKH6/H/Tc0nHth
	B0teVpPgH/BKljbXCEGXIp6POU3wMM9/jiDy2MyZ8tJ/yP9KYPuLjJdZp7Pk3H5T
	Z2vvqNJtRCiU0+ppQX8GeN3+xunE2TY9zsCBw7IPWBWg8Po2AjAIwgUF9AF8jGE2
	bFciQMBWgTlkdpKnYIWmEGozK4f1kbcok+ZMf99qFbbEGi6JU4RZBZRcgroS+guC
	ueB4rOAGSNzorqOEtjZSYLUQGxrBHE7KbXpkV5PwsW/llwkgE6F8hHJMNrJrtDlJ
	hEgu/w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtwgn39u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 06 Oct 2025 20:05:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8645d397860so1665059585a.2
        for <linux-media@vger.kernel.org>; Mon, 06 Oct 2025 13:05:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759781105; x=1760385905;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jXF0p/uNDuCc8V4ymUfNTV4xeJ1S0VxZNmP+RnJGw5c=;
        b=tVW83ylWVv3yH4ZdfJVnQgeRDpFhv+16n4AW01LMwfsbHLlrwgISx9japvtbUfkZqL
         WCaKeyKTG2kLRloxugtEOfoo0+UQb1+HSJwU1SR4peT/SxY5GrEThfb4Maszs6yahXTA
         gwkaFmaFIJKb899nv2rFWnCo7LcPFtam1cQU7EwnQQ+SBz5tE/09JiHfFCWnw0Mfzq9o
         QUlOrJuqLBAFXjpjdNlEouwug+N1V57tK6b3wIf9+gNwOVbK/okwTDwJRNSca3WG5Jyd
         5TlDp3LzOmDHbnvnLZ5WqBfauh/CCFbDoyRtOAboPWWJ0tQ288kBSkeuQBD+b2OXVpw8
         9LIw==
X-Forwarded-Encrypted: i=1; AJvYcCXsVt93yq62DWXsAB6Yz25puqoXdGMo9yL1XbAD+UcKtm3EU07JbxLhJ9duxtSBRk0QrJDzkiyHqtVm0g==@vger.kernel.org
X-Gm-Message-State: AOJu0YywLUqDNQVePHoS6TJKr30vP5PKwfe7ticY68ftItfAaUML2wve
	0mHtyK/9M+CoyP6BNnhrwVERIrArTvLe7fIQgp/V5lp50a0aM32C9xfGREorlO3xCKP4XRoVYoc
	dnBw344tmbdsTMMVlyVK+KCNXHdrWnOu3WKZUa6PrkZRFpa3O5nggS3M25qRsQ9rqcgqGDgJTvP
	KJdezecLqstcLMmz5w48in6QrspfSqz9F5o7isUCXk
X-Gm-Gg: ASbGncuggzSBTVKPfdJhFLRvJrJjxqtFtDYPt39IPbBI2LKiXJwpG1jq6uU6r3jG+FN
	WsGXwLIXJLTvX4T12zCtFtGOUP7l/Zz5UEwhYHwmejR9BK/pO++EXMQMXSQqUkFjbsqUloOT3GI
	Npt93gFaHe81lAHPiamn7UONA9S056dJjilzab5GklOWyi73B7ULvhVs48ZAU=
X-Received: by 2002:a05:620a:454b:b0:813:ccb9:509f with SMTP id af79cd13be357-87a36779e54mr1714651785a.5.1759781104771;
        Mon, 06 Oct 2025 13:05:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGne7xfNe8unOt/NAN2kz9eXzbxLkQJRAiVoCvhjk3dUQt0hM9XFf85nEv411q3AVZgczfBFN7PoifKbBhxgqI=
X-Received: by 2002:a05:620a:454b:b0:813:ccb9:509f with SMTP id
 af79cd13be357-87a36779e54mr1714645985a.5.1759781104330; Mon, 06 Oct 2025
 13:05:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924-knp-cam-v1-0-b72d6deea054@oss.qualcomm.com> <20250924-knp-cam-v1-2-b72d6deea054@oss.qualcomm.com>
In-Reply-To: <20250924-knp-cam-v1-2-b72d6deea054@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 22:04:53 +0200
X-Gm-Features: AS18NWBIGvGcnNKBag4b27Z_4By6kHKqpoHvsZREdDDpJpvbwz1h4h67ThPGt84
Message-ID: <CAFEp6-1o11B9o3HjdJY-xQhDXquOTknXo0JeW=HfpTxXcEaK3g@mail.gmail.com>
Subject: Re: [PATCH 2/6] dt-bindings: media: camss: Add qcom,kaanapali-camss binding
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bod@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxOSBTYWx0ZWRfX5t6gdAPkdl6u
 aPl+AXfjQ5AJEit/Z7grDdR6Nh6Wtd17FB6p9xsaFoc3AGishIZWcHlMXhfERiP51rI9b8r3hnZ
 +hgniDY1vgP0vCL2bu9zNknnhc11PRU/V84NJ3/u1YURPHl4lF5WMLvfRmhFUff1nxQY4VsD3TN
 Oagtp2qneouHdzyEmnCzaSExGuIM9tLGobI13hpsQfgs5SgMX1QACNl6iF81pZvZ+lH+P91Lhhc
 iZPQCRVHPfW9PQMLx5ou1GYAEDc1IfJKDfEP+k37K4ciUSKULMOoMGtUAjU+ZhWsOI4aQXjX+MF
 vZRSk02yMCa2PCGYOgVA0XoM2BXYEOuo3tQP4IqFFZ3nOFpEaprXHBREVcPrd0HY0feIT5YjVIy
 DwR439XJ9FEJdvWMEZbb8GQl1Av3zg==
X-Authority-Analysis: v=2.4 cv=B6O0EetM c=1 sm=1 tr=0 ts=68e420f1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=AMVQ22f2qhwqeWk0KgQA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: KqoNhdicVXWEcEohF2fjEP5WEl9WNHyF
X-Proofpoint-ORIG-GUID: KqoNhdicVXWEcEohF2fjEP5WEl9WNHyF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_06,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510040019

Hi folks,

On Thu, Sep 25, 2025 at 2:03=E2=80=AFAM Jingyi Wang
<jingyi.wang@oss.qualcomm.com> wrote:
>
> From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>
> Add bindings for qcom,kaanapali-camss in order to support the camera
> subsystem for Kaanapali.
>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,kaanapali-camss.yaml       | 494 +++++++++++++++=
++++++
>  1 file changed, 494 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/media/qcom,kaanapali-camss=
.yaml b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
> new file mode 100644
> index 000000000000..ed0fe6774700
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
> @@ -0,0 +1,494 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,kaanapali-camss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Kaanapali Camera Subsystem (CAMSS)
> +
> +maintainers:
> +  - Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> +
> +description:
> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
> +
> +properties:
> +  compatible:
> +    const: qcom,kaanapali-camss
> +
> +  reg:
> +    maxItems: 16
> +
> +  reg-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csid_lite0
> +      - const: csid_lite1
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: csiphy3
> +      - const: csiphy4
> +      - const: csiphy5
> +      - const: vfe0
> +      - const: vfe1
> +      - const: vfe2
> +      - const: vfe_lite0
> +      - const: vfe_lite1

Wouldn't it make sense to simplify this and have different camss nodes
for the 'main' and 'lite' paths?

[...]

