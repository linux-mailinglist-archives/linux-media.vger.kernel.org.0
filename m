Return-Path: <linux-media+bounces-45462-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CDAC053B8
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 11:04:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 77AD84E3389
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 09:04:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AA203090D2;
	Fri, 24 Oct 2025 09:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IIPDBXJu"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CAC3081DE
	for <linux-media@vger.kernel.org>; Fri, 24 Oct 2025 09:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761296660; cv=none; b=n55BOLpA+YNcH9sICtku187r8sr09kKhoNI4I5IR/qPSB3aEaITWHHHZnqBYac5iKJHlfDGfcXc9B5GEl0huUu7q6zT9qSMNKvu0G4UIZ7RZ2ZiWQa1HEhkmqHVeg4dKG0lF+0xG9HHDi8SI01mU8ubiZ/OA8CXKkQnlKJr7L7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761296660; c=relaxed/simple;
	bh=g0gHpOAw3zIMj/1wPF3opcMcNJQ2q+c7c2Rj1F54Z2o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pZUuAQYSGblLcVAPoi702UuvBthP8puatpvW2GB4KTR4eewz/jDLtthdmiHy/Q5/IsQrAyDn3XuTIJ4dLuNi/ATEqe1WspJVB+NFfNsLZ1WavTTl8pt7NYHmTEECMk4jogJHm92qFtY00SA+YeFBIkuN8XEDQMSOgpsIx85lZOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IIPDBXJu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59O3FVLs021578
	for <linux-media@vger.kernel.org>; Fri, 24 Oct 2025 09:04:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g0gHpOAw3zIMj/1wPF3opcMcNJQ2q+c7c2Rj1F54Z2o=; b=IIPDBXJuu4Wv4fTO
	BP0/CSW3yBaanAXa1ednNtDx193YunyIBOTP20xwJDrvYpfEVnRs8KRkyOsddfS6
	iPjv5ZgBFQKhxDAYe/knDFL4S2vx5eMxfpU3lLYEolUl9WIjTvgcey4iBHYz6Cqr
	PL6NXQdHKX9Tpcy4thmetomie/ra7ok2ckj9hS4g6stKsLilRJ8Unzpeoj7B9K1c
	V9YNoeNvO65iEcsRnZTq90Jas7nIZBHA+AyhJ5r+1ruDywoCvvmTfJhJBnsTcxIt
	yICX+/CC6H5gjaLlsI1zBVlmH//qMi73kUmhQNxDg3CVwR284C4ps9GJ6bd455s7
	+WOH1w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v1w8be2g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 24 Oct 2025 09:04:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-891504015e5so515956985a.3
        for <linux-media@vger.kernel.org>; Fri, 24 Oct 2025 02:04:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761296655; x=1761901455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g0gHpOAw3zIMj/1wPF3opcMcNJQ2q+c7c2Rj1F54Z2o=;
        b=HBQZLnj7dgX/+0X9SrNlDqAVAqv14o9FLLwdWSaD4zz3eLhXpBrYE1Ksg30WpfRoD6
         9uEjqophKWmJiJnjupGbo3MLac47Rf2gzbThy+Nr1HtoFtbkKL6U6tCpcaS4K5pl3h4g
         dgPkCQ8UfN6ykOfEEH+YD+3KOpdSAzZjElkFUSNMGJm9HNWFFYZJW/qJaevKFvMYsVNy
         Kkv0B4pbQkuJ1vtEzmm8uwnOo+jYv48j4EJRfS4kfaP1c1VtCETJrcLkyNoQ6s70KAs9
         CuI32Gq6NtvNhU4hJfYStGI165WI0DQg62AD8VyYnJIr1s7lUa8GrUh5936QHH5iSFXo
         f4AQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKROccepiBHx3KjK/QdW6+iqf92sSFxQscQ3J/LnXMsQw0CpNTJGzZR8YN6doYfzUr6JnSS6HyEj9OiA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyul1Lv3j5NyaB4KwdG2bjOP3eCR0MKWu/c4V/44ZJ/pbNwr4rk
	P054GIKUnr79GtqrjrElbjGfTTlE+gxG1CEJ9sRHbZAuo4eBdvc5vhMeV6/8V1YgLDhXbzULTB9
	93i0WD0Cs/qJkfLIapjj/VNuJIW3tbP/YpqW0Mix0tgjvpjQUh87Wk4UXERWDe/xgu6MlSEtVVl
	OjoA26Yicku0eitJPZcmstgsJH4p5K+X+GLuhCDbUR
X-Gm-Gg: ASbGncvXvB+dsEwX+m+/+tW3c01Tx/it4S7q7zklgwvC+l22Esj0P/fpPy4xGWc5H4N
	U9u/CwpAKhghzs4KvZzEz4j6/XdVJ+VtBPMImC41ga+1/jK0J38PURyic4au70LPtpoOmRvkqJq
	bPl7z788bShb/WTDjLAgPvgGUj8NeXQXszcWuuqMoOjrp98k+Igo76S/VjUrzUUzApFdYFNEWN6
	yt6lAZ06ZlYSau2PVMVw9QT7tySoC622ynB8HGZtNITJw==
X-Received: by 2002:a05:620a:701b:b0:85d:3c32:c404 with SMTP id af79cd13be357-89070cd842cmr3029024885a.85.1761296655461;
        Fri, 24 Oct 2025 02:04:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcH7X9I3oq3A8xpwU4zFj0woURu/t1UEGWZ4WrgfA2Vy8Iz3Rekx75D5h0egBppJT6eu7llttNgC/cYYRxzYQ=
X-Received: by 2002:a05:620a:701b:b0:85d:3c32:c404 with SMTP id
 af79cd13be357-89070cd842cmr3029010485a.85.1761296653367; Fri, 24 Oct 2025
 02:04:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251023-add-support-for-camss-on-kaanapali-v3-0-02abc9a107bf@oss.qualcomm.com>
 <20251023-add-support-for-camss-on-kaanapali-v3-1-02abc9a107bf@oss.qualcomm.com>
In-Reply-To: <20251023-add-support-for-camss-on-kaanapali-v3-1-02abc9a107bf@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 11:04:02 +0200
X-Gm-Features: AS18NWBkyZO4ADCwbuPSpZ8_0D23U3UYy4lbimK41M10tmzNwaNW7w3WqyAgoBI
Message-ID: <CAFEp6-06bubGxeNqf0rK7Oe3+YDS7f0_wHPCDTBnXmT7taw7Fw@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: i2c: qcom-cci: Document Kaanapali compatible
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNSBTYWx0ZWRfX97BnOhSJ1Bay
 vMhVtWTzCtp9oTCIRH3exY1vc6QS6okwK9vI+/NWOi0+by9I4CBYZcodEdehVJvCvT+PdZmpMcg
 NdDjam/xE+EDJzc7XUdomBqnlTlRJbAhfMi5Q/Ilqfrosf+fKNkV1XpN9/rI4WxWMgjrZHcdZDs
 mfdkOqL19ezLA/vS83SeqkDNT/cFkkb1llP8xZ9/RTyz9rLFDCNMbIYWaL00C6FIgFxPgiv8uS7
 oSUovjtiI4dBhp8DIRBkzdllBDBAeqH/OS115N3vwEH1SX7GS2bXkA6C5BI2tzj5XUbpbeJmVS5
 yE4zYoe2KYaU1bv+WGIPXNgSmwhz88MMh3I0hKA6nymGCG6B+dm4/kHNbGcvU+VKz5KIc55QtIF
 lQr4UdKZW6hPbz6WTzzV2CHCx2h3vg==
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=68fb4110 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=XIB30I8Fq4NfyXnsoAUA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: hGjF39q2l-HeJP4car73e3faWQjB11Ii
X-Proofpoint-ORIG-GUID: hGjF39q2l-HeJP4car73e3faWQjB11Ii
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180015

On Thu, Oct 23, 2025 at 11:14=E2=80=AFAM Hangxiang Ma
<hangxiang.ma@oss.qualcomm.com> wrote:
>
> Add Kaanapali compatible consistent with CAMSS CCI interfaces.
>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

