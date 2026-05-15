Return-Path: <linux-media+bounces-61711-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOBzIAQWB2plrgIAu9opvQ
	(envelope-from <linux-media+bounces-61711-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 14:48:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A5554FE33
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 14:48:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 424AE32227F2
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 12:13:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E43EF47DFB2;
	Fri, 15 May 2026 12:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TBSe8EUJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DP5l8D4Y"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5B947D954
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 12:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778847231; cv=none; b=Bzmx1iDHLu3vNHPzHUKCRg1n3q6kjzk1HY78kZg2ttLRdS0Nq2qhqqZ/uIMNLHgbiNlmKNEXfWV1WpTs38C1aK6yaWZx+jM9OkglBQ3gcTtUNHZuUGrMuCG8qD+fRhGeJTfO6ib4enTcQmdXCaCRP8ZYSQxkzwXuEDowIyxSJ4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778847231; c=relaxed/simple;
	bh=vRwzbzspWPueputM8Mkd9jQYkXF209p2RCl0TnnxZPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GESGPEwxEE62ANM5tCa1DVONtWoOjM+hanWBdpBeDDvHafvSWukQrPKpdudGGpSjByfy7D0mGEmjTCp09cTBKMYACeqownBgV4GgB46P+zyvm0owUbaLXnC7FAVsvN+q0kZOHss2gQqqilIO5TAGJ5pz5C2vmYRi1VZd0jk9rnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TBSe8EUJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DP5l8D4Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FB3pqS2676218
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 12:13:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fY80wj4vnbS4pG0nwppUhE1i
	O6csTYhmaG08pE6CwTM=; b=TBSe8EUJEyG+e5vUmNOAfAo9Gu04KaLqw/7Qvn7j
	yd1qYeTj4vNHcrbkKAi0KUP8Qp9YcFtQzbNiMNH076Dpv37DRXfmmwGdhgcH+Mbl
	YW1ygHnbveI3f0fZbbnNU20aGIPkzfK7i1sXENkxKU3pB0qHnwFydWvJnwd4f3u/
	Pl0ZIct1+52OqRKdCVe2WKYOVSYGGNZgFJSD2RgKmhwQ1z1RRrAxnXDeT+B5S+1C
	peQvY9xnUujLemWUA1pbPYDbrrHRjvw2qFoeJNKSdtrv5hZlM0wBMckATL2Nv+Fv
	F7Opr2mvU7iY8nOwtfxJ4qxYwWnA4HqVq132TGiKYNtENA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1vu6n4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 12:13:49 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6326fc1256aso9247527137.1
        for <linux-media@vger.kernel.org>; Fri, 15 May 2026 05:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778847228; x=1779452028; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fY80wj4vnbS4pG0nwppUhE1iO6csTYhmaG08pE6CwTM=;
        b=DP5l8D4YghdvZNVpcxnosiR0jbkhRNJYcnq5E66iTdnuoBhSrPOWo2kxnR/akQ9r/O
         4AgsjOFqn/+aqon6KIvQSg6GyjIojE597Lt57nHomfl1TzGP/1loHIL01FnHGludjt3F
         EMds/8HLHBp0UjDgnI0xw6q86eQQdT5V/mOEQX9fWJuqYkvgV/uSAolG98l/yjk97WH8
         VKfbwcpLC3J4KJaSq7alLqBBFqE20d0A85ohLoCdzkm6wlEbjcWP7cEYFNXowtLbjDJ6
         Fq/wE8drgWZWUONV/iwIZxk2RmMmhCeEGTm0OioiMGeKSjjUSYV6l4FU/Kv5M4zpsjVf
         xfzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778847228; x=1779452028;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fY80wj4vnbS4pG0nwppUhE1iO6csTYhmaG08pE6CwTM=;
        b=Wav/KA2RW/veWsNz5MJ6FGY9e7yEMq5EOranMGxUKkJ4nhXmeGJ2hamcFXyGX4pSLs
         Ao/skFx3HbJp8iY6GBdeVkuejLHPjOEHG2uhURbe75HzgU4gT1s7o836R02qOQ5lYVeh
         oyDvtaladCd1pZ8DdoYOGbCJudgKubanL9ZuIZSQ/4aSjR4Y4nQi+dl44S9Y8VHNjyd0
         KguAipjtSCEyG7p4Q4G1VTi3vVsunDa5000epK9HEso4N8xEnKc6u6R/EaeBz7G1/EJE
         f0Cnh1Ok081ppuitH2hrLVyqpd6Ni6RTyUAM2XFisLMECT0OiKyRBbvHjnkrP8oIuXRi
         U6jQ==
X-Forwarded-Encrypted: i=1; AFNElJ8YtQCx0sDPJ1gMb+2lsVJ04JbRwG8E2/lpiIagHov5E9GJT7ruR4ecUaBY84C7BpjVhjaNai1XiOksYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDLq6wN1InCIUOL2ZJdrI8146FVm4rMe0ibbXesApa1Oqy03B0
	TVHNhQ52V04OBhofQ7tGRcbw+xWMlve0YhWgBGEluFNAikF8pYublIwxsH1CmWdn5WNqg/Vziix
	ZjSUsmZJhSuXBKj8rTZScokIZzJgy69wg+gQgKHi6MjsrNKhqF/tB1i+ooT90ECgqFg==
X-Gm-Gg: Acq92OGuKaCQDLwRFv1rpTLhAdz45jqEjpJncJrUFQnOnRuh4E5QuB2jcaZOZHT9MDl
	RByy/dfS/2DQYK9iH5NJHvEtknpD+LCpgsjIYE3ZNYNLr7ux7OJTO4sD0KIsnN5UOqRua5b7TdU
	EUY18nsFYpu1t9kBQR7Wo85XZv1VsMxuZDD50r2/b70gOUMko7Ak7keev62gkI1eKJ/K9CHyj/a
	d6mhHoVGDdloX+pdJA6Fib3YeY726fQ1uwcRP8kWY2cAzOXSiXjU+5bs6FZJc2d2RmZ04qSb8Ax
	RGRYQTs2/Zb+2GyyQCpOciqZJStRYVTSULFIkWW7CGKbABilHy0GkLtIzJ1p0WuPMswA/2c1ZCq
	RG4n8PJuwsKvQSHgXWNGl2enNwpX3ec1ZtbKxoUJZvyG1IBJsRjdx3bSnBk59BDJTy+ZgqFIbH4
	moYQfMiCQ0FfKTrrIpdSTeLwniKljAo+ncoOfYtWKQfagAlg==
X-Received: by 2002:a05:6102:1487:b0:610:6e69:5235 with SMTP id ada2fe7eead31-63a3f68e785mr1827033137.22.1778847228230;
        Fri, 15 May 2026 05:13:48 -0700 (PDT)
X-Received: by 2002:a05:6102:1487:b0:610:6e69:5235 with SMTP id ada2fe7eead31-63a3f68e785mr1826968137.22.1778847227612;
        Fri, 15 May 2026 05:13:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164c5a36sm1304180e87.60.2026.05.15.05.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 05:13:46 -0700 (PDT)
Date: Fri, 15 May 2026 15:13:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kapatrala Syed <akapatra@quicinc.com>,
        Hariram Purushothaman <hariramp@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Gjorgji Rosikopulos <grosikop@quicinc.com>, afilipov@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] media: dt-bindings: qcom: add JPEG encoder binding
Message-ID: <bfohhhg63kwhi2i26uhvif6xphpj7qoapcym6d6vbgic53oxzn@qj55uifqzg2u>
References: <20260515-qcom-jpeg-v4l2-v1-0-f38c2e1b3555@oss.qualcomm.com>
 <20260515-qcom-jpeg-v4l2-v1-1-f38c2e1b3555@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515-qcom-jpeg-v4l2-v1-1-f38c2e1b3555@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=PKE/P/qC c=1 sm=1 tr=0 ts=6a070dfd cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=kY0BWnVueK400W3C_3IA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEyMyBTYWx0ZWRfX56UMbKHdkmhU
 jSIt/U5E7Z3A8fiv8KQRIQuQKf3fe2ynvSOXKWasv7O5dGyQSQ7TvcbgzxlfVkbpkwloQqZ3iK5
 ptLO4qGsx0JKTuqfSvZ1CcjHsxFh6SblzXFH5pkG3cka8vuBr6Sny8R1fyV5ovyNEddCDFNddVU
 GazA0EXZ5TjgZ+tT2f1K26uVJEXazLNWF6duO02QpbzfMuutfhqGlg5ArtOOeau8UDA9gAA/bS2
 B/bBOO7p6F0LvbpWPFwUMn+3wjGK0M4OWexi5Sp/KVZREEbChYN0imdUv+J/zX3yeRiXX2+EKlz
 1Z3o/0yQktzB+JFaUBCrsY8RiU5wpBHVh5hPPfpalRl84f+7I+R8WifYZXUIm26f6QuX/mgLD//
 5cbRp95ZcvCS5X6U0betPETT98vRYug3sqZYGRsEN97oLW0WliFiitj/lFLL9GQ6yUeKo/+RSXW
 xd5BE4siOsmSNqGiY1A==
X-Proofpoint-ORIG-GUID: WDlF2QlhFdiJcMIw0w4AOicstwxdDyQ6
X-Proofpoint-GUID: WDlF2QlhFdiJcMIw0w4AOicstwxdDyQ6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150123
X-Rspamd-Queue-Id: D1A5554FE33
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61711-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 02:46:59PM +0300, Atanas Filipov wrote:
> Add YAML device tree binding for the Qualcomm JPEG encoder
> hardware. This binding is used by the newly added driver and
> describes all required resources, including clocks, power domains,
> IOMMU mappings and interconnect paths.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,jpeg-encoder.yaml          | 122 +++++++++++++++++++++
>  1 file changed, 122 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
> new file mode 100644
> index 000000000000..fac3e654458d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
> @@ -0,0 +1,122 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,jpeg-encoder.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm JPEG Encoder
> +
> +maintainers:
> +  - Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>
> +  - Hariram Purushothaman <hariramp@quicinc.com>

What is the recommended email domain for Qualcomm submissions? Why are
you nominating some people as maintainers who haven't even touched this
patch?

> +
> +description: |
> +  Qualcomm JPEG Encoder is the JPEG encode hardware present in Qualcomm SoCs
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +        - qcom,sc7180-jenc
> +        - qcom,sm8250-jenc
> +        - qcom,sm7325-jenc
> +        - qcom,sc7280-jenc
> +        - qcom,qcm6490-jenc
> +        - qcom,sm8550-jenc

Is there any difference between JPEG encoder on all these platforms? If
not, add just one primary entry (qcom,sdm845-jenc would sound good) and
then use it as a fallback compatible for all other platforms.

> +
> +  reg:
> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: jpeg-regs
> +      - const: cpas-regs
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 6
> +    maxItems: 6
> +
> +  clock-names:
> +    items:
> +    - const: gcc_hf_axi_clk
> +    - const: gcc_sf_axi_clk

These clocks name the source. Can we have a target-specific clock
name instead? Also, why do you need _clk all over the place? What else
can it be other than the clock?

> +    - const: core_ahb_clk
> +    - const: cpas_ahb_clk
> +    - const: camnoc_axi_clk
> +    - const: jpeg_clk
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  iommus:
> +    maxItems: 2
> +
> +  interconnects:
> +    maxItems: 4
> +
> +  interconnect-names:
> +    items:
> +      - const: cam_ahb
> +      - const: cam_hf_0_mnoc
> +      - const: cam_sf_0_mnoc
> +      - const: cam_sf_icp_mnoc

Is this supposed to be a separate node or a child of the camss node?

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
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
> +    qcom_jpeg_enc: qcom,jpegenc@ac4e000 {

Drop the label, it's useless.

Do you see any other device tree nodes with the names starting with
qcom,? What should node names look like? Which document covers node
names?

> +        cell-index = <0>;
> +        compatible = "qcom,qcm6490-jenc";
> +        reg =
> +            <0 0xac4e000 0 0x4000>,

Do you see other examples having newline after the '=' sign?

> +            <0 0xac40000 0 0x1000>;

This points out that this wasn't even validated.

> +
> +        interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;

And this won't build as is. 

> +        power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +        clock-names =
> +            "gcc_hf_axi_clk",
> +            "gcc_sf_axi_clk",
> +            "core_ahb_clk",
> +            "cpas_ahb_clk",
> +            "camnoc_axi_clk",
> +            "jpeg_clk";
> +
> +        clocks =
> +            <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +            <&gcc GCC_CAMERA_SF_AXI_CLK>,
> +            <&camcc CAM_CC_CORE_AHB_CLK>,
> +            <&camcc CAM_CC_CPAS_AHB_CLK>,
> +            <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +            <&camcc CAM_CC_JPEG_CLK>;
> +
> +        iommus =
> +            <&apps_smmu 0x20C0 0x20>,
> +            <&apps_smmu 0x20E0 0x20>;
> +
> +        interconnects =
> +            <&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_CAMERA_CFG 0>,
> +            <&mmss_noc MASTER_CAMNOC_HF 0 &mc_virt SLAVE_EBI1 0>,
> +            <&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI1 0>,
> +            <&mmss_noc MASTER_CAMNOC_ICP 0 &mc_virt SLAVE_EBI1 0>;
> +
> +        interconnect-names =
> +            "cam_ahb",
> +            "cam_hf_0_mnoc",
> +            "cam_sf_0_mnoc",
> +            "cam_sf_icp_mnoc";
> +    };
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

