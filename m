Return-Path: <linux-media+bounces-51386-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OrVH4Qbc2mwsAAAu9opvQ
	(envelope-from <linux-media+bounces-51386-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 07:56:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25595713E5
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 07:56:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A5B52300C0CF
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 06:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FB5634D901;
	Fri, 23 Jan 2026 06:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b2/i92SU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SI1H/5CU"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D5533F8D9
	for <linux-media@vger.kernel.org>; Fri, 23 Jan 2026 06:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769151241; cv=pass; b=Eq9qMTs4RAiwNvcMPBOOnyrRnD5tdaYUBreZjecDZVzX/A19tWHKx0uwjRk+i4xLtwjGgPVwHXGJdTh5W+oEBLYi3wde38DPXh1+T6YrPBh9zabCPVfxcZ1sFRrdPKGXBPic6LE5kRm0p8Ey1na1b3PXTYuSLmF+FMf9Jda6c9I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769151241; c=relaxed/simple;
	bh=s/FYJs2yh0Mn9e9zJI3uFU6aHvmEISj88LdCakLhM38=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fhmDde3fanyBx7STbj4UzRTfPCjbAJzWJ+FyPbSWOBMJKxJtZz7TVjskqat0FaWJ6V4l42r9KUwQ2BUHNg5BBotN+rSYJsPj4bA08UEhwB7HbU1Mf0jl6sQNuo4FZQmowkLsKgfWaIaQv7455I7phljsCeWJfWFhMxaWi0w4jhQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b2/i92SU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SI1H/5CU; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N4BbVD3503792
	for <linux-media@vger.kernel.org>; Fri, 23 Jan 2026 06:53:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s0VLzkj7kBAIvIeyO4Yw8QzJDHtyD3yHiv4q5/eKWxs=; b=b2/i92SUYiaESdwo
	VjpgHSfUiI9ApnLF4g+bN9LAW7zupMgnhCP4F9o8tLoJO7gv+VIdRuAgKrfweDLy
	YiZLR7ffNcNbVFBysSa3ZrZ0kOuzbK4SK/MykF6F/4rmfOTJy/xFloC7XR/3Cm7a
	00MPHEI8J1dbYMJ/4d2KB+bpBTZ6ZWt5ay5qh5w2ArRGpwyGy5wTEDUuU88a9ISf
	RJZcc39lq2fkNIq04SmCjD7HPi4JCp8INMfsq8smh0uOtBljMhR81ImMqt7kjgJH
	onVApRORNsJUohMQArtR0lksWoi4QJHICWbMkiMzJi91TVVjajjnQ/R5efOFfgxb
	Ijc6AQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bus98224a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 23 Jan 2026 06:53:55 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89493622b50so4352886d6.1
        for <linux-media@vger.kernel.org>; Thu, 22 Jan 2026 22:53:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769151234; cv=none;
        d=google.com; s=arc-20240605;
        b=SiVxjG2M89VUz/hCI77X0wNTEFjHkZLOjtI4bPK3hia2KUW8Z7oIR8+w1jNWN3zzA4
         oGMXcqVOl7mpTxbvESBoCUs3Ya7hR4ExT36vVTFwC998byxwilYRdDHWSUqE+wjZt/6d
         0lRC8+9yLXsQa9aN5NySYWVv08KmxSUk7NtuGTDFHKWAgsoMdKS0M0DXZ+U19c9cbrf4
         JKrvTApPoGR4aqno315JVZngysyTacjgJU6cU7G+SDTrgKm/I54LvD3o/ObIRKscf66+
         qYqg3TL4ccVBIjN0wv5aS+CFbjnq9QP7dEg0YGq4jItV3JEn2/XxYGqlRGDOWvrxWGz9
         +zcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s0VLzkj7kBAIvIeyO4Yw8QzJDHtyD3yHiv4q5/eKWxs=;
        fh=pRtyRg/QWB5T4CsyHwu6aB3VzFhSwDvdGI0mVJW2nCs=;
        b=NPx5FfyoJKqngwqPWvXqmPjj5mVTryOSTnMGVkuqXEddP/DPGxLbMyYQ8TKdUKEajV
         +run67ec5CsA3mCxPwIvJSZ0/Oz65PLFFuDJRsePEYv1Tae+ZSHk+OfAwaSX+UwVyMBf
         x3pzuQHJZLJcsfNda6W8BYvg5QKWFRCy3nQK+1XdOTo7Z7z9mWrm0GbTNvNTQDOTIvhz
         JL3SEDM5jD4DJjUQm/8LQ6JIweDlnuCdmB22Fjx3XNMhOPXkPodas9Rse6yaolIXqLDT
         fifIQJ/FD4ymlCJNHtbiuXvhLaHTn7ey0Ulbkt3H5nD6NR7VvzeX1ENN5IPjy9s9EFHk
         a3IA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769151234; x=1769756034; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s0VLzkj7kBAIvIeyO4Yw8QzJDHtyD3yHiv4q5/eKWxs=;
        b=SI1H/5CUAJRE1zhwCvHuQLPfVZgs/wh3gq7q9ChkLU3k98AkGnZz8JO8LKHb1ctwTC
         YMSNtqRA5+CHuZpMUZl1u3tldyBmyGpReolZJH3D8MF1YnCTt4EZoUGvbdJf0hNjgM3k
         j746wtmAlsrEeNwFvUydIESCsvEcx7mNzKloNywvaW/hwJlzNIrtofEtQ2S9umPu7X+B
         ZXE7+bN87a1aMBddyG9Z/ysEaSmCI2aJ18QJGKfa2oWQoTveVhXXjNuX1FIAa1oTvIE/
         HnwdNJTPbJ+kqLRdIgQnaKTB+8BiKp5Spr53QFlVwTk588CWALBzze2CMlGaPXB0zBM+
         1JtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769151234; x=1769756034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s0VLzkj7kBAIvIeyO4Yw8QzJDHtyD3yHiv4q5/eKWxs=;
        b=diEsEilZ69OSQpFkoAamAWitPtw6aJVksV8/XLG0A1ZqOH3aQVUFCL8RmNFdGVn4wC
         OF3+MSFHCi9XlUJCuSOocB1UC6qd/T3rJXZs9heGk05aeZ0cGO+ipVd6x9WUd7Cye0ug
         9zO9l2OmQv/kGsEuIvt8y4iHdqh7Dt0+Oa7McQLE0ZB+uUBGwCuYOTGw8oXoeJyhOLmR
         mmnGSDBvWHMlGhdywQIMHwwZ5dnJ1FMuYJd1QEHb11O6EyqJstzLDX7O53t3Z9bFXv3s
         l+Wn0BYIr83SAq2Poy2Ey+ngF64F1sTsKD/YzL1oSLwrCsdw0bC+raa8T9jl83uGh5++
         HCng==
X-Forwarded-Encrypted: i=1; AJvYcCXyL852YhJ2q2kS+7nQBoWjHjGOWMtkSuGClXppTIcnOa7spySoj/LKMjcagZiNw23LDlkVnOeVQTwKXA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe+qYR4NPZvSgUSbcnRh5I9Aizpv+mRUKbLSkWMNiP4kXttQ/z
	zP02+v2io7HhZ7f+7Gc8v/Dw+q2xGPOIiMBcsZy55uPhkzeQFRUfvdyM7vFP9pVq1OjwjBtYrOu
	MvnSSe6LvPiyyy8XoDy7EVqPYlfAOxxCApM5NeTw8/pLKAw/Y9Na3PRZ7dnE6v7w35p/a/anTCd
	XQHhG7uVeAsizAMQNN5lL1ARUj9Yqt0bnDX5kR0VaA
X-Gm-Gg: AZuq6aKBZleICYh9gpKfcgVF2gtO4AKYNjWhRAQinR7WvyOkMMRZT8mB8n2BQqxMNmg
	7WohTr1nzru7X1pnxxP2yWBB7c8bf9BWydaHYDT8tC9EOz5cxelQ8jl3HSx19HBuW4ulUHt+h3l
	aR/fDNKcg2R53ol1plbO58wdYJPYDfyzhzizw/RGx5n5mVcJnP30ktvIW7lotNfOaBEmgZogLGQ
	30LkpG8HVbfLfTB2NEqsGmc
X-Received: by 2002:ad4:5def:0:b0:880:63b1:3f57 with SMTP id 6a1803df08f44-8949020d656mr29225156d6.38.1769151233723;
        Thu, 22 Jan 2026 22:53:53 -0800 (PST)
X-Received: by 2002:ad4:5def:0:b0:880:63b1:3f57 with SMTP id
 6a1803df08f44-8949020d656mr29224416d6.38.1769151232692; Thu, 22 Jan 2026
 22:53:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122-sm6150_evk-v4-0-a908d49892e7@oss.qualcomm.com> <20260122-sm6150_evk-v4-2-a908d49892e7@oss.qualcomm.com>
In-Reply-To: <20260122-sm6150_evk-v4-2-a908d49892e7@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 23 Jan 2026 07:53:41 +0100
X-Gm-Features: AZwV_QgW9xaHk1V60VCFg-RSltJOSQPj7qJ8VK_VnWofnB4yGozL2VT2va8zIr4
Message-ID: <CAFEp6-3qrfnn5EdLXX1+1qGtAZa=L4QS1nyCs23JnKq+oy=pqg@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] dt-bindings: i2c: qcom-cci: Document sm6150 compatible
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA1MSBTYWx0ZWRfX62yTnmUlUD7f
 4KRE6iRmw7JGy4Fu19L7TB4RY7DLsU/V2jy/UdaErb5fuuSxh2hlsV8maojIbOp9TTcK4XIy5/q
 6cW0NiRnl0Ve8v1NX1Bvr2ZMYuyPAFucGBWud3KJEGOr4EGgC1qcmZC5/7OImaxE5verVNJMDn0
 9pqfel33jgXrf7wkX3UwMu0y8x2QpPT5TS4wxAclftTRrEVcQgJ0wph30dsm8H2tK0yjND/vudO
 eh0H05E5Fh7sJJu4glf5aL/sdjI837VQqNP2bACW7bvpEpJ1YgMsTTyi1iImpNhDayYdvvagzeF
 QWjILB7q9MHmjE2o2bFDkgBJztdkI6LNKHrm8sJ1u/Eot2wT+TxuOG0JhwRU2uKpzhRS5GhCYOl
 716HBVTzElICEkvBpSO/IBiiAarBPa3+LpbDMxTJY+JfMYFxZ9M2TqOBbu5WBzVidHzaKACBGjD
 Oz7RKLLz3ocNCMqEDUA==
X-Authority-Analysis: v=2.4 cv=JuX8bc4C c=1 sm=1 tr=0 ts=69731b03 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=AGkvFC_LJttw-4NvuOEA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: tTVWosKCBiMpJ7HUypK8v2fA0-JOKJv9
X-Proofpoint-ORIG-GUID: tTVWosKCBiMpJ7HUypK8v2fA0-JOKJv9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230051
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51386-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,pengutronix.de,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.992];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:email,mail.gmail.com:mid,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 25595713E5
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 11:41=E2=80=AFAM Wenmeng Liu
<wenmeng.liu@oss.qualcomm.com> wrote:
>
> Add the sm6150 CCI device string compatible.
>
> SM6150 include three clock:
> bus: Bus clock responsible for data transfer.
> iface: Interface clock responsible for register read and write.
> cci: Clock for CCI core operations.
>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>


> ---
>  Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Do=
cumentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index a3fe1eea6aece9685674feaa5ec53765c1ce23d8..d3f87da54fcc14a8f808f34c9=
4551583d8deaabc 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -33,6 +33,7 @@ properties:
>                - qcom,sc8280xp-cci
>                - qcom,sdm670-cci
>                - qcom,sdm845-cci
> +              - qcom,sm6150-cci
>                - qcom,sm6350-cci
>                - qcom,sm8250-cci
>                - qcom,sm8450-cci
> @@ -249,6 +250,7 @@ allOf:
>            contains:
>              enum:
>                - qcom,sa8775p-cci
> +              - qcom,sm6150-cci
>                - qcom,sm8550-cci
>                - qcom,sm8650-cci
>                - qcom,x1e80100-cci
>
> --
> 2.34.1
>

