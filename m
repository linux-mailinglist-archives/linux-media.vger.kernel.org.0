Return-Path: <linux-media+bounces-67625-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +2DWDEo7V2owHwEAu9opvQ
	(envelope-from <linux-media+bounces-67625-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 09:48:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E49875B969
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 09:48:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=QKfvrEjY;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=J26WSoVa;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67625-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-67625-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BCC1430091D3
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 07:48:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF1BF3C553F;
	Wed, 15 Jul 2026 07:48:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C712E37B01F
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 07:48:00 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784101683; cv=pass; b=g24d67hkD+3nqHdO7Ht9iRV6o+3v9X8G8N0v0gMswkMTIndfFph/oej15xad9sdSG21yrFM+Xg06PVh8CZtgSC5xWptMEVhsfSre79FG6IvSCl0dof89Wqhw9FtgQsoKknZOXvPwNtl/xrx8zBCXmFeu9zQSGk4wkp48VyemIhQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784101683; c=relaxed/simple;
	bh=Bu6Ky6yX6sbDl5UgTFXVtjOAaG6VLdCnbYe3baMXbv8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RBgKv/CHYbVbSbyb9sBBnMUbTrGuVIICdmY/othpYkcNOwVSUseG5YCHAbE7HHentwJnIW9htKCnDxVmtOHK6QtcyMpTGKOcy4qkA7G9tWcbOUWr6vaE80/pn61oHBzsOevolmxW/NpBb+3oy0KuG7SkRUX6EUsppHldHBET9zk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QKfvrEjY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J26WSoVa; arc=pass smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F3lxYq2374697
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 07:48:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5akeSIk1resecXsgFYOfGYCtw/8OsKDC10ORZ+u6bPU=; b=QKfvrEjYHpGdECBU
	5D16x+dmjrxnZ6Tfw69NOV5xnTp9SsQR2zBGpeK4QUm7aIkPyYce+8cGU3eSs0hq
	7s4Y14uTQSh82J/RZl6S2XYMYjgK69sQlwoxgcG0W2GxTZsN6NwR4oA27gjXSbSF
	Gr7TmigLeM8ZUC5Rfj7P852XhzaFUkCFQ/zbos6s7UuBo3cl1UFgcmC+YCX/HU8l
	rO5PjpYByiN5acmNorQKuvoKMs8UmLm85t21767s3cpx6q9xIAU/rOHkgsA+TP9R
	or5TBkDCvdsDPYK4mubn6hc59aHHVBkBziLtQE0WqSXFAqvLgzMvXxl6k4ZUTbLB
	usIAqw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdmkk3x1q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 07:48:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9309af14fd7so22481285a.1
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 00:47:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784101679; cv=none;
        d=google.com; s=arc-20260327;
        b=cjKxMeK4NCrNIv4mmAyrtlwpThixBGYnxjWMd2AUjcEhtfoTjKZKxIDjMrdXoMoshn
         LppFzLyJb2CdxAHO1ozt7NV7Bu2338lQkEwcqa1XBX2njWFNuKnqC1OL2ypbi6MMmzxZ
         hkTEIynWEvSEbZ7P5xJaYjNxlkZ9i0bHZWPCZsxPzB19qFF5OBZPsZqIT8yuPl4Z3OEh
         Up0qeH5ztvAaXvnFMispJ5xy4+8OGOUJ9QRMJ5yKBBM+q5MXgsF2eXYDVqvaOAYFcvi1
         kFPGkTuUU5BJ6oMePlNfh8zAzzID/nIHixQo/PhANPD0Sbl07nVgWP/dtR9beonRpcZn
         ZPpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5akeSIk1resecXsgFYOfGYCtw/8OsKDC10ORZ+u6bPU=;
        fh=oVULp9DiC6fO0WXM9c0Iiz5BWx4JryXVMYQtoHbsFiQ=;
        b=MEjxwBvhWc1BNZ5cPwuJERqRwe1eCCKU8vGJkk9ZZ/vAPmz+a3ToRQzxjIYn+iHxJC
         MDbm0TW/BUv+ly/7TWuhKhGiVQhzMlEhXhxpGiDlgXdoZVzRF94rDNXTQHiXTny06vVq
         ywNKIbrWIu587kdbfAFu947DEbzMvgZRToUOGe1V/ofY8SQggchL+CxfPxQm6uHJ1Tqy
         FKMXxW19WZ5l+QsKDjBcAggJV77eY/A4RZRk+ckftQ8Onko7pLnbe/kg0UDr9sR7s15j
         enFWuq+lrzQyfChVME+Aowrb72R9fkzmjnk5xsQpE/TU+CLqhfdJ9cbDsdT1iCSR5bwI
         UdAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784101679; x=1784706479; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5akeSIk1resecXsgFYOfGYCtw/8OsKDC10ORZ+u6bPU=;
        b=J26WSoVaEqHoJVfKTFpoWVyzzvftnQWw3JdindqbdDybKAm+ie8owQ96t2RT8EM9lt
         Q9sEWeeNRcSnauOIfl5Wpok4zA8vBs8j3OwMrtWGGIwrywRI+eSBMk8vsKPlrZiBpJJT
         9IuiHIShL30FXGefsuRQ4EGoZO/gzwkfjvv6/+1wES4z+RjYSGMpq9PX+n6CQJY3AGQF
         r/udkX+bdMDTFMndJDtnu6g+PPg82nqVEDf6S8CwrQG4nBei4F+XC/Ljlp+9k1evC4uY
         CcYJYF9oJfgxOadQFSepz0exig35Hd3GNmtSoiwQizBjos59uU2Av4W4c5F/Dv2qAIcq
         0bRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784101679; x=1784706479;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5akeSIk1resecXsgFYOfGYCtw/8OsKDC10ORZ+u6bPU=;
        b=Xt6LffMtnpNyHif/QmyIGR0+J9zbkmBA7dO5cZYqIeUkTtjoQE/RZN6Uk6XJHjNRHz
         69i/Mj2X7FxvD9dudxMYif4B9fFMXX4/5hxqDCYXZbtuzlM1YWRDZqv4B0B9rdXyXGTw
         U0r0JyiwA5+yEJl8j6IPXDVeXur+flAuut8CcMn5x9smL/yFtsaQcs8G2Ul/vCJT+PYh
         hr+X6WdaACBGwwwO4/ujt750jh5niF3KV7+5QiAdjz93X5JcG87BAHpDCJo8qx+3LF/q
         mwTy/HCSsfSzEXcB4/D+aldsAzmvBNBE31aCDvJy5RtAu7ktFt+89eoobcmlmfjBU2PI
         xGcg==
X-Forwarded-Encrypted: i=1; AHgh+RpPyvmhszv1K4l/yCtims6pUEjkRo/OMQc3Er3uTGlabMON28NH0yG4yXrZxmtaZ2IfaCCunxGtYodP7A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8WMJaIIHndPan5WSe8flGNdac6WaMEawon68dG6cc0SNJZpPp
	Xbfugus2rLGn92GcdBLkvWFe5YOESlP69rSeTQxN6CrSx5RKcxiMWeqaLm0EIz7yYSADNLcFnZc
	pjp/G95ho7tXSW9Zau4SZG5YXD2uylv8P8Jd9j/6jdKkIh+Kxy2tbh88HshzssQ7fP77ix8ANU7
	166c+ulVagnumPnTrawKBewmpdtIIKB0+A/3ylRJ4/
X-Gm-Gg: AfdE7ck7BrePxMLdoP6dVCkb46Qe3dwsHKEEhXCpFIWfBcOnBQz8dPX4oakyX4umDar
	KRJOQkj/EchAz0v9/WGt5tIjAWUgs7mMtRurlRD9nR248QJMhMqQsh0r1E5/GYn49CbuyFQPQIy
	3jLKNR/87bGPceSLQ3valyjbRkvKVzAEfxRJ4nqiWK55dyzEYX3AcqfnNr4lPrSSVFWJUIhUwlQ
	M4kIDQ/EQqjfnAZdcmg/mJe02DsBy9ddcPEnpxsjUMrT6nBmLaBN/TuyyMlWtBQ+7iuw/4b5Een
	SyVi+Twr4o4=
X-Received: by 2002:a05:620a:448c:b0:92b:6805:91a2 with SMTP id af79cd13be357-92ef2ca5724mr1598996885a.74.1784101679082;
        Wed, 15 Jul 2026 00:47:59 -0700 (PDT)
X-Received: by 2002:a05:620a:448c:b0:92b:6805:91a2 with SMTP id
 af79cd13be357-92ef2ca5724mr1598994585a.74.1784101678668; Wed, 15 Jul 2026
 00:47:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710-camss-isp-ope-v4-0-51207a0319d8@oss.qualcomm.com>
 <20260710-camss-isp-ope-v4-5-51207a0319d8@oss.qualcomm.com> <54d76244-8ba2-472f-8577-b5d445d6ede0@linaro.org>
In-Reply-To: <54d76244-8ba2-472f-8577-b5d445d6ede0@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 09:47:47 +0200
X-Gm-Features: AUfX_mzpIoQvU_fl4v76ZB-CbH3Mrj5s-TpzADjkC7rux3HKFHCjhcZr8kGUlMI
Message-ID: <CAFEp6-1LUNta5qADVMFLG-W0v3qV79APwSUohGPcMtoAA1Mbbw@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] media: uapi: Add CAMSS ISP configuration definition
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-hardening@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 77dlV9QQIrxrbQlwMVpWfbgw5WCs5bBq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA3NCBTYWx0ZWRfX4iopcPfOtYuo
 Sa37c1CDUPNxQNuJFLe5YjwE6JfJw/jf8bbgAnGg3kgLELOK65tPnMW7Z6KBQPEB5QmQeJmVnCd
 CTpApujw7cjErt4OgXap2fthtRUoQ7afEdBa66bHYT7kbEVXG7rVXwW7yE49M3GL7bnMFjHJ/UZ
 ZNQMlb7mOSS2i+H5b/PQyEpMkVfIdmf9Czpjo1DFMmFi6JR7MZOcxEToHo2TM8+aW4Qjs2XNERx
 35ciJq26FlwpVM2tiPVr3WZBCllGhaTvafeKbH2/Nx84j+RJ1shZw/0pOOzl/2uht6SGeOoOHlu
 UGLcjd9egBBqiuP8mmBGdhNkSDl0h+yJ8VAFHDHeXOxgKmaSmyiU2SnnXwRP0wraiMNcIG438PX
 PGQxW/XKsNwRfYWMkMy9oDTqJ2WHBbWLGnEld6Pm+X0DtF7+lvmShVqVE7K7BtioPPvHl65OPCy
 M0Ysb01GE0zJ9o+0ivQ==
X-Authority-Analysis: v=2.4 cv=NszhtcdJ c=1 sm=1 tr=0 ts=6a573b30 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=sqNdUdlMnWxU3ffuJxwA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 77dlV9QQIrxrbQlwMVpWfbgw5WCs5bBq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA3NCBTYWx0ZWRfXzG4G/2Z5oX3P
 qDOcrt1ty1m3VFDZla4uW4Bby9+SXwbuQKjnpjxzAK2ClpNHlw4ochVyC+CXvDOOfbaEeplbkcx
 djSzhTHkF/yJuW9gtI3R7J6nymNtGi0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150074
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67625-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:mchehab@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1E49875B969

Hi Bryan,

On Fri, Jul 10, 2026 at 11:41=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 10/07/2026 10:04, Loic Poulain wrote:
> > Add the uapi header camss-config.h defining the ISP parameter
> > structures used by the CAMSS Offline Processing Engine (OPE) driver.
> > This includes structures for white balance, chroma enhancement and
> > color correction configuration.
> >
> > Signed-off-by: Loic Poulain<loic.poulain@oss.qualcomm.com>
> > ---
> >   include/uapi/linux/camss-config.h | 161 +++++++++++++++++++++++++++++=
+++++++++
> >   1 file changed, 161 insertions(+)
> >
> > diff --git a/include/uapi/linux/camss-config.h b/include/uapi/linux/cam=
ss-config.h
>
> Why haven't you based this on the HFI stuff I supplied though ? Its the
> same hardware right ?

For the three introduced structures:
- camss_params_color_correct is the same as the one you supplied
- camss_params_wb_gain has three extra offset appended (post gain), as
supported by the hardware. But maybe the signed offsets you introduced
were supposed to support both pre/post based on the sign?
- camss_params_chroma_enhan is newly introduced here

Regards,
Loic

