Return-Path: <linux-media+bounces-50125-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4714BCFD53E
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 12:07:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CCF093104ABE
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 11:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 880D2312813;
	Wed,  7 Jan 2026 10:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LlTHrkok";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h44kNqfP"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FC530E0F4
	for <linux-media@vger.kernel.org>; Wed,  7 Jan 2026 10:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767782152; cv=none; b=l57+zHnAqWqLOLBkmMBEH2ezX0p50wj2olYnJ8XOTeYY+U1uenjIuhYN9oTUg7CUsInfE1MQV3rj2zWZBTtKoBcbb1EdI/prDLV4HMlOK31LE6840myFbehzO8BE/9HvotoMWwdyzJ8dQxdcXXgFjZzUwgXHlok2CTD5nOTsi/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767782152; c=relaxed/simple;
	bh=m2f9qkXUrqcRe4pmfW5ApotX9bq879iYIj7ImYA1T5Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mO8O+aPouNSOR5PJ0J0bqUST8jtEqANZp0hh0CzEiKj/ZTCWglE1RqfKJccH9W0QUCtqMLhJSkdTrL+Jqz8MBjvVlT/LnP1tU4d2rwwnpq71lWK3bkF+8fi7bdwWH0xixauJypkuXqNDUCEe2fhhO5KwAHDkUzyhhX2XfrRo3Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LlTHrkok; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h44kNqfP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6076tHbW2378917
	for <linux-media@vger.kernel.org>; Wed, 7 Jan 2026 10:35:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jlry1Vt5+KLz/mDBAc5xuvGeW/Uag/fDuxJsNP+G8jQ=; b=LlTHrkok8A9sgGCV
	mRimEoA/16f3JZHGzlRtlX+w4/WyjcmA7odAvRHJgJ0f5nAYN4eI8BNKxjTf3jio
	jtRFQ4CO4NvFFBJsNV+DgvzsBd174k/Vp5Xwlq2C1qaRXGx0ZqD0enTuZn5I8ryt
	OFxnFzQ7qamK57C2RI0w8lXoi9mkEP7Qttoh3B6sIqsttzwCu6dNBjnl1rXRnRO1
	3Kt4QcaJ3lterl6yqlrW51YVWExzXkWDErwFU/LG6+9BcDG1fyU/ISO0Fa6xia1E
	wYl0RKK07u509+nY9eYxItNdEO9rGZGxTJRkaqYRfY/HwR3PcZdzwcSaVctmJow8
	UhpLmQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhjn4rq53-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 07 Jan 2026 10:35:49 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88883a2cabbso79870916d6.0
        for <linux-media@vger.kernel.org>; Wed, 07 Jan 2026 02:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767782149; x=1768386949; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jlry1Vt5+KLz/mDBAc5xuvGeW/Uag/fDuxJsNP+G8jQ=;
        b=h44kNqfPFks6S37NU6rcuk29GMVezQEkjw67woPRA+ZnJUxjFOnqzAqbzg9ygTf/G0
         5kxruaUWocwuKwaR0HcqDlOG4rL4Qkmnev7Qp5FHeeG6kvFsnNI4i/j4hxuM+OvZWX3Y
         gdh3aeTsmMjv7StExCQs7mUjMyNLBdjLf7Y21DdVXvqsmN6ciwRPRwYR1mc8du2nZ4Oa
         5ynHKDKjYfmUeme8BLXB8QA+C45TfrecFxZn/Ky1mOITFIUbiziktTThlxl0ZI4OZcLh
         wl0qEOzTr5DSDg7IUXnN3zZ/Q32ivcoDD5nbi4r218qGzI1xyNkofnfbK/GVzA4NnlDG
         rN2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767782149; x=1768386949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Jlry1Vt5+KLz/mDBAc5xuvGeW/Uag/fDuxJsNP+G8jQ=;
        b=rk7uQE/xYKiTjs32odVNta7i05sp5pmIQwHKoyZdhAKrZ/UiFl4sGLQip4fqcpJxrG
         vDdvuZiNe5FifdhZ6m1OEMrxFHz9rnkUf7LXWJEJ8o8DkxsdUV6bmIQ8trDPls9eI9Ef
         NOBxsYHRgxg315BNn/V33qBPPGLvZXg4f+V2tePp0Klq76NEXJ+LrJ7O9b5M1E78x/xV
         Aw7wsTZoZX1N63rIDndDm6uC03y8Sn0r/mLsVMV37G0+DAtUWeo55G5R6YYnvTJ8FHiL
         oDGtdMeiJllEtCKIcm2nmMLt96qiEJRaq1sPDD8Z5RSV9MbccddzLRMZzNzv2/SfP5X8
         su5w==
X-Forwarded-Encrypted: i=1; AJvYcCUitO7e2lE/KttRDhz/RRRM9gOGhYUtbLSRg+x9dkXcF9jo/OxlHCO1h2hgQYpornb0GKdhYTXr7RIfMA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1lRs0JoND6NkPd4Vqk+yrExJTj/if78bae4Jt0LHmQgQG3+Pd
	z5pcoxkylYwhI6hxpD6035rUAcaJ82MUv/9RNrq/3g9/7nOfpzr/yQRDL701HT93V6fdvNSToMO
	95m+JBBjBY6j2NV49fTkJvjjT31v3Yx8vi/WMVJbbhHPxRVpt4ujPtz35cXDydVYEXQukqfc7FM
	bGsttapRjykSmkJLRaBrOrsmH5+CCSVkMOMKc7CrgW
X-Gm-Gg: AY/fxX5LUj1kO2+LzqPyPPGC/vfaffyZf6in/6oVDmrrDdVp0imAsyOT55bp1rUCZiK
	HChnVSjzVXwkjJW+jyFDkcx7kydN5xusHWSeJZ+Gxq57giLzWoQ4/X3CQ7z7oRH0Tg9zn9sjS1v
	cCbEtHkXScFtc9BAs0hzt/aYi8jARUc9vCskMz0onjdcBSORDhGE+yGOY7CxViy4Jy5rVRq/2Ce
	K9bhnLxqgZ5ATXRSVzUiuTa/yc=
X-Received: by 2002:a05:6214:3bc2:b0:882:4b1f:a812 with SMTP id 6a1803df08f44-890842a26bbmr24451116d6.51.1767782148975;
        Wed, 07 Jan 2026 02:35:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHV2bQVnOOkUfKi9YLuyJCwO/xFnCEJJVbcyuS2T9YeMsjnl+BzdxTNWnJToYbvGC4KTHNdu8uA2RXyTo97TPs=
X-Received: by 2002:a05:6214:3bc2:b0:882:4b1f:a812 with SMTP id
 6a1803df08f44-890842a26bbmr24450806d6.51.1767782148542; Wed, 07 Jan 2026
 02:35:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260106-sm6150_evk-v2-0-bb112cb83d74@oss.qualcomm.com>
 <20260106-sm6150_evk-v2-1-bb112cb83d74@oss.qualcomm.com> <20260107-tungsten-barracuda-of-management-5edb0b@quoll>
 <6a74e675-b011-4e1d-860c-4c3232beb2a2@oss.qualcomm.com> <7fc7c14c-a305-422e-8755-22e7c28bcfb3@kernel.org>
 <674b8615-dcd3-4ae8-8433-cda6e8347048@oss.qualcomm.com>
In-Reply-To: <674b8615-dcd3-4ae8-8433-cda6e8347048@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 11:35:37 +0100
X-Gm-Features: AQt7F2qkT7aMmhrEGPvM2Y2e-bOqSDMUhFEImzULpOu1Lheg37dfANazadn-rZQ
Message-ID: <CAFEp6-2qtws+Zhz7yFHCGK_M4RnBz1_ium2=HkdS4=A6JYeX2g@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: i2c: qcom-cci: Document sm6150 compatible
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=LJhrgZW9 c=1 sm=1 tr=0 ts=695e3705 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=DP5Y6ZztmILrlu424yMA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA4NiBTYWx0ZWRfX3UJwHC9fgM3G
 tCRHMjILIG1k2tDjo8pSA4FgQxoidQjaLHx26McIW9zLl/JR1Ilxy6Um894kf79ft7Vs7fHLAzY
 qqm6kkImLizc/gUpOBNwdGB/RSRsjGgSRekp3NH6yhWVVQNpciaoJ9eWEvivYGYFhD25+D2USa7
 9jM/AO+LX1ZRBe/bXZh4hR5P6PKBDurZZPhZryOGt72FiEJxA7v9m+oISuq3e0kYlj+pA1ejJoh
 ZE5HH3HTjbfaJAm+BtdNC3AuI8XQGv5F8BSv8ecRTB4wG3lzKqoXtZ8+Y9FedlqsD1yNKXycKji
 gUyaSPuRz2rBqxWung8xI14twokGQCbsbEwKn++UhPh5k1HvbXv3mmNJzVOsQHvPp+yoOA18wCv
 n4Y8mK/LSfrPbxgKJ44ZCNJQPk94CbNaZc7wK08NRoO71OVMh6TL5vPAy738mzJKPCsXI7huwm6
 YOqj01X+UHlm7D++AQQ==
X-Proofpoint-GUID: RfW1fxsf9wfjePkaZ_3rDD6KQM9cElMk
X-Proofpoint-ORIG-GUID: RfW1fxsf9wfjePkaZ_3rDD6KQM9cElMk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070086

On Wed, Jan 7, 2026 at 11:08=E2=80=AFAM Wenmeng Liu
<wenmeng.liu@oss.qualcomm.com> wrote:
>
>
>
> On 1/7/2026 4:34 PM, Krzysztof Kozlowski wrote:
> > On 07/01/2026 09:17, Wenmeng Liu wrote:
> >>
> >>
> >> On 1/7/2026 4:00 PM, Krzysztof Kozlowski wrote:
> >>> On Tue, Jan 06, 2026 at 05:39:53PM +0800, Wenmeng Liu wrote:
> >>>> +  - if:
> >>>> +      properties:
> >>>> +        compatible:
> >>>> +          contains:
> >>>> +            enum:
> >>>> +              - qcom,sm6150-cci
> >>>> +    then:
> >>>> +      properties:
> >>>> +        clocks:
> >>>> +          minItems: 3
> >>>> +          maxItems: 3
> >>>> +        clock-names:
> >>>> +          items:
> >>>> +            - const: soc_ahb
> >>>
> >>> Same question as before. I did not see any resolution of this in
> >>> changelog or commit msg.
> >>>
> >> Will update commit msg in next version:
> >>
> >> For this platform, it uses soc_ahb instead of camnoc_axi.
> >
> > That was not my question from v1. AHB and AXI are both bus clocks,
> > meaning for this device the same. You again name the clocks how you
> > called them in clock controller which is wrong. You name here CLOCK
> > INPUTS. What is the role of this clock FOR THIS DEVICE?
> >
> > I already asked to pay attention to this difference.
> >
> > Best regards,
> > Krzysztof
>
> Ok, i got it, just feel a bit confused.
>
> +                       clocks =3D <&camcc CAM_CC_SOC_AHB_CLK>,
> +                                <&camcc CAM_CC_CPAS_AHB_CLK>,
> +                                <&camcc CAM_CC_CCI_CLK>;
> +                       clock-names =3D "camnoc_axi",
> +                                     "cpas_ahb",
> +                                     "cci";
>
>
>         clocks =3D <&camcc CAM_CC_SOC_AHB_CLK>,
>         clock-names =3D "camnoc_axi";
>
> If this is acceptable, I will update it this way in the next version.

No, the idea is to name the clock from the device=E2=80=99s perspective.
For example, from the CCI perspective, you typically have:
- A core clock, clocking the logic, which could be named 'core' (but
'cci' here is ok)
- Clocks related to the bus interfaces (such as AHB or AXI), which
could be named 'iface...' or 'bus...'.

This approach clearly identifies the role of each clock and keeps
naming consistent, without depending on where the clock originates or
its source name.

From that standpoint, some of the existing bus clock names defined in
qcom,i2c-cci.yaml are not ideal. You can find better naming in bindings
like qcom,i2c-qup.yaml or qcom,i2c-geni-qcom.yaml.

Regards,
Loic

