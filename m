Return-Path: <linux-media+bounces-58192-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIxOGLcO1WlQzwcAu9opvQ
	(envelope-from <linux-media+bounces-58192-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 16:03:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 204E13AFA41
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 16:03:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 778F53032CFC
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2026 13:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 775013B895D;
	Tue,  7 Apr 2026 13:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="US70F4Ie";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dKP0xK6+"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937DB3B7753
	for <linux-media@vger.kernel.org>; Tue,  7 Apr 2026 13:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775570362; cv=pass; b=rDo/mLd6giiyV2eYyDoAqVRCGj3n94IhlZoSItWB47cBsfXOETWF6WXfNsubeqwr2LSOWi0DvUSmcKuzEgs9qEQ4LJdcMHWdIfZPIoBHddRw06TFCAh02ovLZSn5RH7PUv1ChvgFOVm5VO831epXktmLrWxUPPyvqDp5LQ+7nhs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775570362; c=relaxed/simple;
	bh=+n5doLzOFi7ZKgFPZX/LE5Tj2tXEj16CUUf+VmgJ/WI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FO3snUtNrKXDwJadS19xMyMOgtVj3VJUmIZWcuCOeryBe35k7QlMCqqe0WaE4XKraJQP+ZIuTspH2ixoL526VYaqILEZ/AX9vfsUU2XtITBtfX1Ih77OA3nmfPmMzE7iqyN/9YQOUi8Hek1p6byGLy1zmvJnfZsUOI7I33e57/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=US70F4Ie; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dKP0xK6+; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637CWZ0h1404160
	for <linux-media@vger.kernel.org>; Tue, 7 Apr 2026 13:59:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5wwLRnMPrBmfeeZTx0oik5QwI8hZXsXAmq60o8j4/sk=; b=US70F4IeoblYjB0X
	FedEtZ94wXfHGR6zhgWh5PA3Qm2/RbrNC3kSUk83Nix4x277d7b7RJKiOayP32u3
	T23wWA4fQ2CswbO/TMSC/Mzs7I00W/H6EIMlih5m5igB01wmDxKhfiLGjnbfuUC4
	dOWUwspxQKo+G6c6YSCHoaPXssHRsH3iQ0ND+OEILigJcayO2tR/KWQOsP9gcVAJ
	eJppLkEqdbcTiQSsxTKJXBuQ06mxMFfGU3q7KER6uDKe422Jso0LHP2yGCJrxejT
	skQ9af8U30lvFgPSVYtD+DjrdJRTzeMVcCej4P87tKOnrsPeCCH+tEBlCxWiYICz
	prK0Uw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr8b0qh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 07 Apr 2026 13:59:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d812c898cso83574991cf.1
        for <linux-media@vger.kernel.org>; Tue, 07 Apr 2026 06:59:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775570360; cv=none;
        d=google.com; s=arc-20240605;
        b=OkzEElks1QS/O7KdlHcYuvlc2kN+eI8GcdFRjS735NGJImfhPl4yP6YKtITRUrYIFw
         H3Yk3h5me4JRbFB7xY94rzlyowE3KluQcuuVTPnmo+w2oeKHh8/Z0iZ2hgYGH4MZwqqe
         6NMTQvEzZel3pTFodTu4I7ahMcViS40QME3EDgXP4yJQ8MaGzqsYLVqwJwqOTeEi0HW/
         UtOU3FMvDm0Vde37Y/7z6HJ/IUZliuOT/OtnY3zcEv43YDLGnuVXLXkuFGT+A25YvrND
         GxkcUIiyACpUmQyEZB7D6kg9CiN+88SjZdeLQEQTpdLcCmAWoW8Oo4nOM3MByEcmqD0K
         65ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5wwLRnMPrBmfeeZTx0oik5QwI8hZXsXAmq60o8j4/sk=;
        fh=v8vOIUIaYwBD4ixSAx60c6dI2RS+SgvMt51NJR6J96s=;
        b=U2wDaHUeY+dA21Ajmh4OLf1hnuSdADNGMKkPwXv5fX0kacWpEYXqDDbSKDd1sPNXOj
         gMnj6Ti5qds+cW6F5nw7hWUsN+qrdC1W3M7hxpot3MIRpD4XNQftl5GYQb9cjBJCGanv
         /4zwQ4vdaB9eBaJZZa9OZsaYQ3RT6ezliIK/gZnbysqBpIGbmTds09IPH+FwgnSTjPUi
         bz0HKfMI7NyxxjCsBsc7LNnyd6CIPRYVes2Cao+U7pT8IbHM8HGC+rqj4BoxE6GjVnr6
         QqqQXBHAeY9zmVPqlIVoji/i/lNBEw3U5YM3qNm6Iamr3k3zMLKz7HSrPfeRn2OYkJr6
         uQGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775570360; x=1776175160; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5wwLRnMPrBmfeeZTx0oik5QwI8hZXsXAmq60o8j4/sk=;
        b=dKP0xK6+2IVJ0VLC0jG/FUR6viEx/ma7uvian5DbAD5jAatE0RlWkCQGAkWlmwgHw3
         M9Z81cz1eTj7iL4aWl0DNobhtF1VHJgyeI3ILyIEDhrVxVe4w0/FnrpQeLQk3/pIXNHF
         9VopBfHCBqiX/3wkS9kXK9uNF/wK61c7iikUW5Y2N9JLw/0E4mn+Obkdm/HgmDdO8+sS
         7RnYdejpKKAA8IPcs7utHS38V/WUGb5bSwiu/VBFYYdphgRbq935PbqGEKgeJe6AIXE4
         FYIA7TIIu0mUBDdQ0VpNjTr0R2rMJn9o0Jg91rtY3HrTrD2hbA1hg9bLBl/FFYsWMwLK
         tp4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775570360; x=1776175160;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5wwLRnMPrBmfeeZTx0oik5QwI8hZXsXAmq60o8j4/sk=;
        b=P+bWB9k1BrKqmT1l+o+4U2X+yixq+qsOGftm4PkBgWkPVj2r0VQKF5pzqwGD3I2D4R
         bOvSLxZWBrBs2JEHIGLBD8y+fkU6I+gSqdOccxF9ub8hQUYHZSuJV1GbrDDsiSxIw9Wc
         R4iD8cCfC7whjj8/p8VqhdDofODpc4yWhzIg/AtJYV3EgltojgIeqdXuQGj8J0P9I6Q/
         6Kr+pQCcz2ZeSplNkSDbdjZ2JUK7P3swEU3pH5Fsv/CkopY7U8q0MJ7H9kdDXfl5dhK5
         ouoWiS942q91neAw8uOCZoTdeSc6WXc1YgO+M8qCUgJYQsc/E2ar9Dtm1xIi7vdakMVN
         KxZw==
X-Forwarded-Encrypted: i=1; AJvYcCXtSFln9BCHi5GX0wm7EOWVI2R3ZKN/4Qe1XeiFec1IkwUy29+I96qixclrY+4j8Vkr0zSUZEs1VsVc6A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9YB4A8IdJeScJAo26elAKkW0y0+17Qr6zKaHScbYRMGL6/HQp
	12SkaqM70WvJ/xDXJOpxCpfLXt36aCJuRvY/PXanPpJyfwRlf6pxhaNDYhXZ0dzMS202R2fxCxK
	vE56vR9IJ9l+oCBV8zfN04K3rDuE0TlgrFmUSozZHQ+MsAVDtEFV4+ny4oZ3YrDdzBP37rTO06q
	Nqd2QEPV0G2RoyHQz6dehbRIk8CBDjfM2/xLmzj3Xt
X-Gm-Gg: AeBDievTbAtP6eJAldBL3Iy9FBNpMmsw1z7OitunPMwc/I+SMmZ+8AZ4vxgHI/Bs7sF
	20P0Vk1TkKuu5tzXYSgwk8KFZbcDwaF9H4gvJ36waYZANp8FKI2ph3WbgoeusMG3SgxuLVsoqlO
	oF47sXs3kOjVChTiO2pvIJtEF40mLUeOSrIVUjtcF6JTtPQ10D0Q0CLf2w3gN+tXrAKhDfy63f5
	3uQLwF/dsGMNoVRTM2rEwpxdnc9Wnxrivq8lHI=
X-Received: by 2002:a05:622a:229f:b0:50d:7b0c:35e7 with SMTP id d75a77b69052e-50d7b0c40a9mr186001161cf.43.1775570359662;
        Tue, 07 Apr 2026 06:59:19 -0700 (PDT)
X-Received: by 2002:a05:622a:229f:b0:50d:7b0c:35e7 with SMTP id
 d75a77b69052e-50d7b0c40a9mr186000641cf.43.1775570359192; Tue, 07 Apr 2026
 06:59:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
 <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-7-5b93415be6dd@linaro.org>
In-Reply-To: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-7-5b93415be6dd@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 15:59:08 +0200
X-Gm-Features: AQROBzBZogzJhWGuTj1SVy1UDtblAmXk85UGkr9wH9qtEaCpzQ0Senf27mBKbGs
Message-ID: <CAFEp6-03ZCUiZ-_bjK1cxoCOWf=GY6V0cntZ-DYrpKM+zpPAVg@mail.gmail.com>
Subject: Re: [PATCH v11 7/7] media: qcom: camss: Drop legacy PHY descriptions
 from x1e
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        "Bryan O'Donoghue" <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Christopher Obbard <christopher.obbard@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: T0HiZsOGL5ccMHsfyeVCJVNGEwomOSUS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEyOSBTYWx0ZWRfX4Ho8gj3UtULB
 Yy1Gf2KebMxtzAQnooOq2vU2DzL1iIR4xOrWGlsWpSxwPDPgQ9DzEsiy3ElPj45oia0PT4ZVJFl
 7wWQoAoL47gtL7i+D1l/344hRi8yOZDXA+HDbaImstcA15+k1I8FMfT8Xu2Hbur3tJV9PiYoVLS
 l7jR8FCC5hkj0oyaigx8DdjVQxBZAknsO4rBAFa7bkHS5cm/H3OXMQoyKvypRrDtNUQ4e8l/JeH
 6+B5tJiTXGPEDrTWPbZSKqqFyNVhvhy3UKoq/8W0SCIlwRpu7JCssk208SdU9eACgfItQf5Zvhy
 oTccWJJwsteEdHQ/1VXFbZKgOwOjULWkew1/X9ak0ldlbaTQvAp9iDYDax0hzULARG7mKks8Mvv
 qczMlH0iqoAZCEREBZnF7hqM4PS+NlWm25aohu7WnTo8F8FGfN/PlmTXTiAsaPYXTYjM24T4jvK
 JHCDDLxW/p7uX+2LyNw==
X-Proofpoint-GUID: T0HiZsOGL5ccMHsfyeVCJVNGEwomOSUS
X-Authority-Analysis: v=2.4 cv=A/hc+aWG c=1 sm=1 tr=0 ts=69d50db8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=EMJHxtQxxZhPlACdTpMA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_03,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070129
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58192-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,linaro.org:email,mail.gmail.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 204E13AFA41
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 2:29=E2=80=AFAM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> x1e is the first CAMSS SoC to use the new PHY interface. Drop the redunda=
nt
> legacy CSIPHY descriptions.
>
> Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
> Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss.c | 37 -------------------------=
------
>  1 file changed, 37 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 224b5472d7771..3b092560b5df5 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -3896,15 +3896,6 @@ static const struct resources_icc icc_res_sa8775p[=
] =3D {
>  static const struct camss_subdev_resources csiphy_res_x1e80100[] =3D {
>         /* CSIPHY0 */
>         {
> -               .regulators =3D {
> -                       { .supply =3D "vdd-csiphy-0p8", .init_load_uA =3D=
 105000 },
> -                       { .supply =3D "vdd-csiphy-1p2", .init_load_uA =3D=
 58900 }
> -               },
> -               .clock =3D { "csiphy0", "csiphy0_timer" },
> -               .clock_rate =3D { { 300000000, 400000000, 480000000 },
> -                               { 266666667, 400000000 } },
> -               .reg =3D { "csiphy0" },
> -               .interrupt =3D { "csiphy0" },
>                 .csiphy =3D {
>                         .id =3D 0,
>                         .hw_ops =3D &csiphy_ops_3ph_1_0,
> @@ -3913,15 +3904,6 @@ static const struct camss_subdev_resources csiphy_=
res_x1e80100[] =3D {
>         },
>         /* CSIPHY1 */
>         {
> -               .regulators =3D {
> -                       { .supply =3D "vdd-csiphy-0p8", .init_load_uA =3D=
 105000 },
> -                       { .supply =3D "vdd-csiphy-1p2", .init_load_uA =3D=
 58900 }
> -               },
> -               .clock =3D { "csiphy1", "csiphy1_timer" },
> -               .clock_rate =3D { { 300000000, 400000000, 480000000 },
> -                               { 266666667, 400000000 } },
> -               .reg =3D { "csiphy1" },
> -               .interrupt =3D { "csiphy1" },
>                 .csiphy =3D {
>                         .id =3D 1,
>                         .hw_ops =3D &csiphy_ops_3ph_1_0,
> @@ -3930,15 +3912,6 @@ static const struct camss_subdev_resources csiphy_=
res_x1e80100[] =3D {
>         },
>         /* CSIPHY2 */
>         {
> -               .regulators =3D {
> -                       { .supply =3D "vdd-csiphy-0p8", .init_load_uA =3D=
 105000 },
> -                       { .supply =3D "vdd-csiphy-1p2", .init_load_uA =3D=
 58900 }
> -               },
> -               .clock =3D { "csiphy2", "csiphy2_timer" },
> -               .clock_rate =3D { { 300000000, 400000000, 480000000 },
> -                               { 266666667, 400000000 } },
> -               .reg =3D { "csiphy2" },
> -               .interrupt =3D { "csiphy2" },
>                 .csiphy =3D {
>                         .id =3D 2,
>                         .hw_ops =3D &csiphy_ops_3ph_1_0,
> @@ -3947,15 +3920,6 @@ static const struct camss_subdev_resources csiphy_=
res_x1e80100[] =3D {
>         },
>         /* CSIPHY4 */
>         {
> -               .regulators =3D {
> -                       { .supply =3D "vdd-csiphy-0p8", .init_load_uA =3D=
 105000 },
> -                       { .supply =3D "vdd-csiphy-1p2", .init_load_uA =3D=
 58900 }
> -               },
> -               .clock =3D { "csiphy4", "csiphy4_timer" },
> -               .clock_rate =3D { { 300000000, 400000000, 480000000 },
> -                               { 266666667, 400000000 } },
> -               .reg =3D { "csiphy4" },
> -               .interrupt =3D { "csiphy4" },
>                 .csiphy =3D {
>                         .id =3D 4,
>                         .hw_ops =3D &csiphy_ops_3ph_1_0,
> @@ -5365,7 +5329,6 @@ static const struct camss_resources sm8650_resource=
s =3D {
>  static const struct camss_resources x1e80100_resources =3D {
>         .version =3D CAMSS_X1E80100,
>         .pd_name =3D "top",
> -       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_x1e80100,
>         .csid_res =3D csid_res_x1e80100,
>         .vfe_res =3D vfe_res_x1e80100,
>
> --
> 2.52.0
>
>

