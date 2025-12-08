Return-Path: <linux-media+bounces-48445-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CF281CAE31C
	for <lists+linux-media@lfdr.de>; Mon, 08 Dec 2025 22:11:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A830330161C7
	for <lists+linux-media@lfdr.de>; Mon,  8 Dec 2025 21:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75DE821423C;
	Mon,  8 Dec 2025 21:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OVTdQFX1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fny7tMeb"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690D72D7DE2
	for <linux-media@vger.kernel.org>; Mon,  8 Dec 2025 21:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765228289; cv=none; b=FbM7rYdoW1jeSCIEQ8ZzswF6rhKyoQEzHL4A+GcEZ1sMHtL3IdDsut9exAxu7DVlwMEwjeX+CoOh65gLbWzYUfDxMMJrV70Vomu1LGtDg5hL/xTbCnepO/fOotA0Oo7CBYdijw/6uuBwDLo5Fttzv9Z1VWmyGdr5UukWCBpjkNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765228289; c=relaxed/simple;
	bh=x9bk/cws1AiAbG14aJY0PQmg/AfNPSGHyIN/r9iphT0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JPFSXFrEnaMzWp8Mw+ENHB+pv1BkBWbXGLvD6rEZACgNfw1ppMiXMmArKnKFqyGPv1ctpuKbLGMfA1bQyML/stdxDB3KRX9YY+sqMp/lJN0PHNOyDcUdabVr3EQR/UntmFftSqDQrTfOVE+oVLs6+9LoI1GxYzeCqzX+uWlgP6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OVTdQFX1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fny7tMeb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B8J26341812319
	for <linux-media@vger.kernel.org>; Mon, 8 Dec 2025 21:11:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x9bk/cws1AiAbG14aJY0PQmg/AfNPSGHyIN/r9iphT0=; b=OVTdQFX1B1+44LT2
	Xq4tOMwGqu6pdaeFPBFGjVIWthPcpLRQQA++O0Dhdc127rrBDi2Aa+janhH3oDdX
	VOg1zoCTcV+hzY5h1f5BTr9y0TtDgFRkk8qj5D5/unS4SKM51zS9xPCE9Nfz1eEF
	5ZAerUtga1ZbHGY7BpCUnddJv8blarQCzWWFIvJSrgRs9BgAQH1Xv8iUqSBQZu3s
	fA6IopPu4bXK/7tqUznSfE0xkEv1MaqYegq0wyTL3zByknwRfgPgVTU9D+2cgSOq
	v5WJouM6XPa/g/H8efQFOurp3nWUEivqfzid7QhEy4tIozxPze/sK5dqH+BiYVlp
	1pub5g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ax4fqg9s7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 08 Dec 2025 21:11:27 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee1964b1b4so42923351cf.3
        for <linux-media@vger.kernel.org>; Mon, 08 Dec 2025 13:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765228287; x=1765833087; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x9bk/cws1AiAbG14aJY0PQmg/AfNPSGHyIN/r9iphT0=;
        b=Fny7tMeb/0b/bif5/UtWGATNW8ms8HF6HVpjq4liw+zpewtVG/SGX6OkNfYl3cSkBZ
         q+V/102Xm53W7EXtDr5jY2FKWZLlmUOEbC8c8KVSQL5ohrqj5qZk8LKhiDER4XF0XliA
         ynLGgEVNpNfZRVeo2s1RNyvX5n9Kty1d4stFyqxZHKvLixmkR6wxuLKOb7a5bN9DmlcC
         WN5nARzX9E+1NBL60QmblMJpH0d+PDTx1WAuiLjAAJJzTJIUI7yRTHKMeJ/Vy4vR9cDv
         /fmIc6xVA9pYLmLYbR0HP9rqhYNL2Ncj+Q7t1HxKq7G9Cb+RBaBCj0A+eIazpf+e+ogS
         qpxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765228287; x=1765833087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x9bk/cws1AiAbG14aJY0PQmg/AfNPSGHyIN/r9iphT0=;
        b=CtjLix6sOiqx2N3s0wA9cV9cnCpZpWOWWya69aws+7q5rxuPQRy5yrj5c0o40sUxsW
         Dp/Lt3gv538Neoa6aVeCXqRXuJ6vQC/CXQjw349qFTFSYglGrOFWsZeGbor95CeA67r7
         Q+5/soD48jj/XA0eJoWWl0Us3ZBPhkp/MnsUZK4opc9A7ZlQiIbPFBC7SGzJ7RdbAKpi
         +E6F+mPh8+um1BxxCT3ZBlnBmCxqkzOutvCRF9uZAzSgi+wT/d2Jth2AfP59XT0aXsuO
         5vVnTvUS5xZMb3u7+DRoC4bCAu0BTIjOBpr6uPQq6+XcWzAhPVedHkcoZn+DwXYAIo9x
         yd/g==
X-Forwarded-Encrypted: i=1; AJvYcCUbcEZWZyDqGAb5vBusdtd24h9A8y1NkYCBsavm3Sy4TLI3eJTv/89gsmN/WJHZinUoN14xiEH4U8kyDw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn+ZENwIeIQ1BuV0BFEf9unTNqeo4B49yrDW22RC+ADbpOM8iv
	GeSbV8h3eMCGNv6SAqu6Yrhx2IiIkbVAmvusbxaAfvYZvCR/yX0Sx28QwNjyZyiRVQE48JjaSd8
	eeTqJ101Vn78w54DVfGCfWV8JeCwKGgqDkLVlOpmfu50r/sHm2J9NaPe+kw/tnV7JUYWMoZ2qrF
	hTII4rCaWNFoc3eRliQouoCUP5frDmQG7xxG9biE0d
X-Gm-Gg: ASbGnct9fkGK4UNBvjKS++x1/MrPSygSw56vn5CiZYg2DpYFNMzAkGzLOqV4Hs5y76u
	eS/ibXl3LNChoezhiLApec/555uOezwLsJoizmEmY4EeuvoucnrW0rPPjj4NomQHu+06p8O1DhE
	JBNLQciioIIwHR7bgZfkEoQxh4d9Z2/khj4GwE/h3m6EoXoDHgngE9Cev2Ls48smLdO1QG3hHZq
	NIOMLVXRyhCWivdPHH+6FF15+HO
X-Received: by 2002:a05:622a:144b:b0:4ee:2984:7d93 with SMTP id d75a77b69052e-4f03fd967dcmr122397021cf.17.1765228286651;
        Mon, 08 Dec 2025 13:11:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF261ZBWZ0MO8U4blkfknNwiN5rJkPnmbFQFEwoCicRlq7tsjeLC4FnE8/xVvPZ2W042wDuY3pZBTBaNzp3D48=
X-Received: by 2002:a05:622a:144b:b0:4ee:2984:7d93 with SMTP id
 d75a77b69052e-4f03fd967dcmr122396641cf.17.1765228286270; Mon, 08 Dec 2025
 13:11:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251204090325.82140-1-loic.poulain@oss.qualcomm.com> <o7i53tr4glcpahvinghklmltbeepqdpye47bfcwd32tltp36jp@nhnedmhdtnmv>
In-Reply-To: <o7i53tr4glcpahvinghklmltbeepqdpye47bfcwd32tltp36jp@nhnedmhdtnmv>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 8 Dec 2025 22:11:15 +0100
X-Gm-Features: AQt7F2qLBOfEByKyRMYYc2kNjCVuFu1DL5YYVws91VLkM-B9oDA1PSu9hGZm5Aw
Message-ID: <CAFEp6-163xQ06zZ-+QsyL_EqV6yFve0bRxZNTHuJpBxzfVMoWA@mail.gmail.com>
Subject: Re: [PATCH v2] media: qcom: camss: csid-340: Fix unused variables
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: bryan.odonoghue@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vladimir.zapolskiy@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDE4MCBTYWx0ZWRfX/MNgIq668M+0
 e8u7DgPrlqEFa3yv8Z9iIqEacOIef2lFUhhefKC74kgh3xXNWXLuDD1T9j/Rnc9U5gK+lS/ORo4
 tUgqHpJ9+U4WytzejQC3Xvc8Z7862g24ICVTQZaaC5vjX1NR/VCtpOqRK4mZs66XIegjIwda/t2
 1fIjBfClMLnkveYMRvsJZhMvOTMHg4oFU/Vq7XWKu8cdJvCp+O5fOT3ta7jrBMb67lriWMablC8
 wslIk6k2ZyD77KzklSLzt72BKhkFRnfYY5hQtpDXZ5l29M8BDBjm3q9CLQ4JZ85+8V7Ljz2dVDM
 SCrfG1J89dJTU/C3GA27Kty0aXsM6rhradPjRVi0mBBMDI7FRxzx1gZz1jobl4ajsThk0xH7d7l
 NkVVY1UHadhgngpQZhWMzrv8ctv67w==
X-Proofpoint-ORIG-GUID: zICaNapwtiZE5mlVxbwCEgqTTU21822N
X-Authority-Analysis: v=2.4 cv=TPFIilla c=1 sm=1 tr=0 ts=69373eff cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=uCX18gEAPB5gAkYnCOgA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: zICaNapwtiZE5mlVxbwCEgqTTU21822N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512080180

On Sat, Dec 6, 2025 at 4:48=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Thu, Dec 04, 2025 at 10:03:25AM +0100, Loic Poulain wrote:
> > The CSID driver has some unused variables and function parameters
> > that are no longer needed (due to refactoring). This patch cleans
>
> See Documentation/process/submitting-patches.rst, "This patch"

Thanks, will fix.

Loic

