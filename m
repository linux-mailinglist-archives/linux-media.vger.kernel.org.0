Return-Path: <linux-media+bounces-38479-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70454B121C0
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 18:17:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0894167BCD
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 16:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3918C2EF2AC;
	Fri, 25 Jul 2025 16:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VFdm9juM"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397CCAD2C
	for <linux-media@vger.kernel.org>; Fri, 25 Jul 2025 16:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753460068; cv=none; b=ETfk3Uza6zxNwQX5mxFKKBNfq97C20XbFSiGb1zWQoGy/lWjYw5yHdXZ2FRDKB20zXFY9/IZPGMbkZdBHkPIxYc+wWmm3AM4A8q2xnCdvki/9OR+YC6UGo1YG8BYpesp2sIH52uBttPQgMS1RLk3Wmcr/gtDahos3pJbh2KEvc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753460068; c=relaxed/simple;
	bh=zy4+5I7aIssi/rmMSBtYygJxN6pNtn3MaFBiLibPOAA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FR6sJAO3ULJYIZFq5+Lrhs9gU9k8OpvxOXo3Xg5ZHYDafR79edZtx4fi/noMJAGNG7jm6dqkoBgny7zo3TX3gREqxg2eYoRY44yI8aAkAWKd2zEYGy78Qp8tfBMwq/gflWHx25eUPeLzLyiKDzFZ3MYyQyNVtQRQP7gxAlV1Gi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VFdm9juM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56P8mMFR004704
	for <linux-media@vger.kernel.org>; Fri, 25 Jul 2025 16:14:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pTRAzXltnnQkXzy/4MfHD1BpN0UeO0JYTlGtIooVxhY=; b=VFdm9juMycnYZSHZ
	zUXA92nIOBcEnWTYEaYZVS7emlqydaCowoY21CWFScsHSDVVExvYnMTn3+dlby5s
	4hFLISQiz6TZG5bi9tOohYCb2gCWD9ar+XlLTzhbijgIX5E+1GuC37zcPa/MIpya
	Oo+QWB/wZTSCWzJFBHyT5vIqi3kLN//g/8yaVMd6jODWQHGtad5rkobIVYMVlpGi
	QLhQbu1VTEgSBYOY3iL0IqqWARLFc6G4r96pz9jb5jkIpBrByhITf5ekJy3yUGmo
	cGXUD/bTv2Rbch1TAYQSSp7JiozaHKVfDPiHii4f0OPK+8rFfOAqjLYfe6b2gPOs
	XMi8ug==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w2ktqu7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 25 Jul 2025 16:14:26 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7494999de28so3488049b3a.1
        for <linux-media@vger.kernel.org>; Fri, 25 Jul 2025 09:14:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753460065; x=1754064865;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pTRAzXltnnQkXzy/4MfHD1BpN0UeO0JYTlGtIooVxhY=;
        b=lSMESL2WP3g9uaKl6yvtRTiVBNcJyiJsvj7GVDeCRU++zlbaAFMbs34s/91ue6SMcM
         86nyCI4I8Q3/yvMkh9vURoDE3OPQRTByGEVe0iNVzvLGE5upKrFlVBPl3Nhxou/7edOq
         /3SkCKk9SVvQoRLjRmiFVO4AH94eOLvDF16YyHTTWTZ5nGMqQR0HgBzuTawvx5m8DnSh
         ut1xROD57yM6ITE0TNQqmCksINgaZceq3H/87Cto0d/8oKS0nZvei+6WEhf7V5LWssVz
         Vzz0lVQIDdvBv+iYlevhYPrZcMLAWAmaE0B71M9FOrm4nEnYTgBut/I2l5YA7m4GMZGi
         UDuA==
X-Forwarded-Encrypted: i=1; AJvYcCWcx1Urqe2aIj1oMfLdyVTIOU3weKVd+l/0IfmUI81yKZ+3ooVHU1pSXrRH0p+xVcUEx0zFbgkCOA+/pw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUYLFiPhyyTXbYFJ3Z5a/8r/06+p7xfjvyUSvp+DgkyOv1zO/Q
	O5yoKSGMB5uhfiUa2ySrS3TtXsNemuInAj6A00tfH9OPUKD6WhKSkhljptYQO0gBUvxZGAkLSXs
	R9WrcYPTODYfO43lU9HUeMYLcKxdRL4X2mmRuWODUwwarrzRuUxn8OGDPTY6k+mNKQw==
X-Gm-Gg: ASbGncvcuZeUKySl1jGv01zW9F2UBQn4j1YiIUKVR/CQl46vkezcI8XEFbrwhl1nEgR
	XFIUzWZKvP3jWClrTr1vMoWKBqAppbOO0D9dQ7KJhRa2ZcpSQmWVANmpYCt2ITaGDCI+MPNYAYQ
	noJu/3aVhirY5GUryjuJjBEupTQAJM92I0WaOo3WEaI+KQHrpb1hNJUFSECS4SaD3rdhEpZqpAM
	jrcLsL7QkoX488+1p1n0meChbka2uTTxNvLskrVOIXjpLR/LLJao47ZwkgqCbJllz2SjUYys9tU
	iFB/qPBRA7ajALXlOooJcytRcuY7OKAvGbJVMO+S/jdUzGeKFsOLyxxmUILNCjUjku0eejpwGLq
	NWOqhZyOioWN8iA==
X-Received: by 2002:a05:6a20:7288:b0:239:1c1e:3edf with SMTP id adf61e73a8af0-23d701eaf4cmr4483519637.40.1753460065409;
        Fri, 25 Jul 2025 09:14:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEH45mowQM24zNVVrDWA1OAKen9/Rncat1udl96ywd3HTaGlMrzSKhS42XbAwTPbo2lmkT86g==
X-Received: by 2002:a05:6a20:7288:b0:239:1c1e:3edf with SMTP id adf61e73a8af0-23d701eaf4cmr4483464637.40.1753460064981;
        Fri, 25 Jul 2025 09:14:24 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7640b8b0c60sm71215b3a.126.2025.07.25.09.14.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 09:14:24 -0700 (PDT)
Message-ID: <12223a91-82f0-4889-8f07-bfa5833c8ffb@oss.qualcomm.com>
Date: Fri, 25 Jul 2025 10:14:21 -0600
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/10] New DRM accel driver for Rockchip's RKNN NPU
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
        Kever Yang <kever.yang@rock-chips.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Robert Foss <rfoss@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250721-6-10-rocket-v9-0-77ebd484941e@tomeuvizoso.net>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250721-6-10-rocket-v9-0-77ebd484941e@tomeuvizoso.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ZCh4-Yp7ygoOjhvu9eXE__zcIqKec5sr
X-Proofpoint-ORIG-GUID: ZCh4-Yp7ygoOjhvu9eXE__zcIqKec5sr
X-Authority-Analysis: v=2.4 cv=QNtoRhLL c=1 sm=1 tr=0 ts=6883ad62 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=e5mUnYsNAAAA:8 a=DISFzqtZAAAA:8
 a=XWXL-kdBtCKZFopiRrIA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=aug85vrO5LANNmmtkfAW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDEzOCBTYWx0ZWRfX/XIHq4sP8Cyi
 8rXWt9Uv+yOuMuNu1KvyjhRjq8lKxv8kmUUOKK+HsfEouwK5a/EqZSVshaJK9ggUwI/6u1r3EEd
 v1/qGVn/4rCdE/4D9zgTCes5K0ZKtYFnzZS9ajvZaTaTWLilm/G7TydHA3sZRBBfClArG0BqaTj
 4cVIeXfYpx7Gnc4rYbsc0pleYWHCUgfBl6Rsj8ZGOt3ysQtMGUHmEzIjK7alKs+Cr1hLkCIbH55
 AStKlwNt3/uxx1S9J8NC10YYs8SoWRTiIsu7xXNMBmEfQue4FmhxohqDXc0Xxhj9i+0K9ouZTOB
 lOeA2QveQaUEzRhpHkztrKVatJnXmDra364jizFuDBB615ZQSoJL9hfH3KBLgI3sIj5tOJqHPQz
 EtaRASUtO/onVLPMbBhH3872Q+EYkpPi7wAkgmWDzypa8yeWNif03sj1XkwLlYTk7ZaDwtZr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_04,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=717 bulkscore=0 mlxscore=0 suspectscore=0
 spamscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507250138

On 7/21/2025 3:17 AM, Tomeu Vizoso wrote:
> This series adds a new driver for the NPU that Rockchip includes in its
> newer SoCs, developed by them on the NVDLA base.
> 
> In its current form, it supports the specific NPU in the RK3588 SoC.
> 
> The userspace driver is part of Mesa and an initial draft can be found at:
> 
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29698
> 
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

Patches 1-6 pushed to drm-misc-next.

-Jeff

