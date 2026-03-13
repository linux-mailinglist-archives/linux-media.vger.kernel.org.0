Return-Path: <linux-media+bounces-55681-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AM+NAioQtGnQggAAu9opvQ
	(envelope-from <linux-media+bounces-55681-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 14:24:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 643A5283D36
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 14:24:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9AD5332E09B9
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 13:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63A8E318121;
	Fri, 13 Mar 2026 13:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fis+tbhQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZBrJS8GN"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3988C282F35
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 13:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773408005; cv=none; b=uJQ8durI/kGsTlmbghrRBaGLogT8q2b7ZSCoHq9SCn5TT0n2bQzVeA+hKGxvBpgbXd2zyjaYijW3n9Bhpdkj8nyddMTBUMnWWOS5gmT7IIs+EoI/uRV3mWqeOIsQ75Z1Xr4uPqmJlk/G2VRKhZ1xwjlQTZFeJky+38YIF7mYemQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773408005; c=relaxed/simple;
	bh=G9RYKt1+7wMdxPYx2qvxTPWKv+Pn7CP2ntIQWCNtYjY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EnmHMc7VzSISr0Pz+Jlu41y+G641PbX1Pt9tcw9/QP9xBxs1Kp4wYCdlPxQwpbaj+OHMWNcv/OMliDE+kambZQ9+knnYG9fZzWisCxVTPaB9hiniWxaj0eJqw4XpG2cJmSxzXp8x7j1dv8AwXPj2anYSqVqo9/85pO6H/WWPfSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fis+tbhQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZBrJS8GN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D7inQG2263477
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 13:20:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Yao7k7BxXnCj7R5aFOtM2t
	HrBcqKtg3A3kwEargtw60=; b=Fis+tbhQVeNlnBo/7FATViaEOQNUe2Yfhy5xmR
	0ylfNFUZIXUXsY0Hl5gBSrvr4/A4P7HZA12FiEJi2yiAVFN3rrTNeUCfmR7cfxY+
	cyg9pvd90fahFv4MrCtMXL6yLI8ZZLhmYSHFvuaP9N9xVJzDEDQMxmNmiYxXLTTd
	SwwZ52WFG/rInpRajvWliZFzoyrR+wiX5IGoB9GYRWqfjXavf0nK0Vf7/8uqhYhu
	Jj5dMxO+x+5FzIE9+9sDpKy3LYyb1wsaTFfI10UtO2ol+afk+S4CAf68bXbZ9eRt
	/Np8P5SDVZhuqi+HBgPaZ1Rv2UopRnmeJ1p2odfOnvabYpcQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvef4s4h9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 13:20:03 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c739120475fso1170216a12.3
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 06:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773408003; x=1774012803; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yao7k7BxXnCj7R5aFOtM2tHrBcqKtg3A3kwEargtw60=;
        b=ZBrJS8GNxJPIaUjf7dRuSKeQSd5vaIEl5faEgjVcxqEsDtcp2vQ+EJfxPsl5X7GP2Q
         QGSsydJ0+NNw0Y49grebjBS2ISmjyPe6MPe/s+5rS4wi9ywpo65iox27OwJ6QXdaa4N9
         tFfpSI42ytGt9ZYZNXn2t7SWijAFW3fIqw1+MRm6zZ7GIDteinf5CQUpNv7SqsnJmtVh
         bZ2p22eOQq4TWejiV2gB8OjimTdH3+xEkL4ACbRO5OnHcbYRVfPrhc3cnJNSbTaSrny8
         eSuzwtN2dA6UhdRD/oolceU7OBMAo8TjO5SOm58Y12/sXBXg73mwyVkvIeLzODpr+cbI
         516g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773408003; x=1774012803;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yao7k7BxXnCj7R5aFOtM2tHrBcqKtg3A3kwEargtw60=;
        b=jfMZKL/zbcO8JRPDx6+SU0Dp8ltriBzwAeRi/jpPMmJMgp8BBvLz6BVJJjUakXjOsM
         ueRgxLXM8Sfny+KaEbgP8XA673ZhbJmVg8loT3aOqMWOkTu7GnaGTbT0YwwJOTMu9nh1
         JJB7X4uN4fL35sOvmKlfNyCNekuItgKAYTIj9jcLSh+JQc++4VQQgCGN0JBZInaowX9+
         UJp9abUOj0Vor8TXZvFBLFDQRcmGeAdRTgbI1epy0M0NavGQqanhrDhJECdD/xPRHNVT
         8nWKHlX4qm05tH3dESYbFm6C/X8wNy9zIk+mQgSdRJTDQziWL7DnuT+s3E6HdjoVufPt
         BZvA==
X-Forwarded-Encrypted: i=1; AJvYcCUd6GF8N+gLCk7WgL5HLSmap39kuJTSQQVEWiX1rCS+EqduJNJFRWtFvDn58amTgTOJDxaA+f9do0fZ0g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxctyolhcaHuYFwhHaMPgCR3ksb93r9b6JsvOIb8tYn4HfNQvxx
	eXMFk7KaCjB5+dF4fZEoyR6+/27z3RSxixmgomgvwyKQCWwMxhgUugklNKwVFHxADmQCerd763x
	wK0k7jqiu3KArq2/R0aLvUJlobLGZJMIxUQGp1y1i5rgcCieav4FTla0nap86zxWZWg==
X-Gm-Gg: ATEYQzwyXr9bLTt6P4KXt8iBpTTgmeZnFm0tyxXA3mU6rOfrsXW5sOopdizFiD/R+FX
	D0zepWuNfFIwMQB1nNmvK/A4/2VSgm8+O+sgONxunlJiAuKXZjg8xoVE4HSZaXzjADVb4lMHTtz
	RgIL+xWONdWzRR4CT/ZBok2RkScdnuULBC44kltO9/9ok5vEjHWjcovM0snop0tyMVZI3cPL+wm
	GucQxzBNPrmbeq0ViPUdqjEIx1DMznIDBQ/49AOXa8bUMpCZLZDUoSB6+3VZA0ljLQN8VwFp+e8
	3w/O1lgkWt7w3tAccy5XaKrtzV527YAcGw2MA/GbKGWstOjFEotDeH51gPB9y6+68TCwUfnS8wN
	J2Sm1uA4nx/tvgmYLu7fu9/LibcYs/MfN2fERnjgypeS4bxhjUfW4Sm73
X-Received: by 2002:a05:6a00:1388:b0:829:7ee0:1a44 with SMTP id d2e1a72fcca58-82a197046dfmr3035856b3a.4.1773408002449;
        Fri, 13 Mar 2026 06:20:02 -0700 (PDT)
X-Received: by 2002:a05:6a00:1388:b0:829:7ee0:1a44 with SMTP id d2e1a72fcca58-82a197046dfmr3035816b3a.4.1773408001791;
        Fri, 13 Mar 2026 06:20:01 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a0724407csm5775254b3a.8.2026.03.13.06.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 06:20:01 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Subject: [PATCH v3 0/7] media: iris: add support for kaanapali platform
Date: Fri, 13 Mar 2026 18:49:34 +0530
Message-Id: <20260313-kaanapali-iris-v3-0-9c0d1a67af4b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOYOtGkC/3WPwW7DIAyGXyXiPCIwBEg0TXuPaQcnwErbJC2k0
 aoq7z5KDzt0O9jSb8vf//tGkovBJdJVNxLdGlKYpyzES0WGHU5fjgabNQEGinFQ9IA44QmPgYY
 YEoXWW26kA+8kyUen6Hz4LsCPz4eO7nzJ3OUxJKNLCQu3q14LFnJpCbKpBWuNNIpyuoY9XrPTZ
 Ot9WBZ8n1Oqzxc8DvM41rm93d16TI7eJ2HpKm2VUtxo4VXfyEE3vG20YShZXvRohZUGrPHknms
 X0jLHa/l75SXYfy+unDLqQEkFUvV+4E9ZCnGFXwqAfqJAppiGMSlwEK0Qf1C2bfsBnTiDppEBA
 AA=
X-Change-ID: 20260126-kaanapali-iris-29fd184e2fe4
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773407994; l=18627;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=G9RYKt1+7wMdxPYx2qvxTPWKv+Pn7CP2ntIQWCNtYjY=;
 b=ohNS/5HFddTll7tf636jIvxVfmdPBl7iD3sWQptrHafvgKcmNSl5QQO4t+biYS1jlE7ZvPA1o
 DQ9YR5+wXQpBRFRbCgPL82xmx3P6uCYuN7GIi1ddYG/IljIBLlc1dzG
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-ORIG-GUID: c4tTSe-A8-8hG5S3FwD_EtX66AWIlvgb
X-Proofpoint-GUID: c4tTSe-A8-8hG5S3FwD_EtX66AWIlvgb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEwNiBTYWx0ZWRfX6FquS9v1vndE
 Xj+lw83N7iYq+YUH30DvDUzTCrYn+aJH7Y1vumyMluiubxjZpO/Fm51vINRZdwILC0ZtbG4x5VJ
 oIa5ohd5L06GOk0wSMxMic02Gjdgy8/1mEnGqJKleuFmABppG70UnO0DEzqXzG6hlYfxSkrPb7I
 AQR1bNM0pfEonJ1+0dq98c7KyR5VfifcIVPcm8p6AhhYobFNLAJLWuSPEiKuvQ7msrZsMm86S7P
 VQRvlQEtRjZVjd2nzWSVGk2rQF6wRuO3B48lgO/+/c4Oipm6/k6duVBq+uUGQiMpvX96HTv6H6t
 Qopg4wSaAkw7z5kjF+j4Jy4MNbrfFm9GOuQ+pL1NfLORehi5ZlDKFUrIfnrUXWNJGn/hzZVMzt/
 sifiP1Vw0VbO1pfajjAXyJAe8YWHsRHRPIJrsCXrVdNK8X2eioKiuQqZBsEP1904V8RFbvvh07l
 1G9z920XEfe6s6loIag==
X-Authority-Analysis: v=2.4 cv=S9nUAYsP c=1 sm=1 tr=0 ts=69b40f03 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=apL-334RAAAA:8 a=e5mUnYsNAAAA:8
 a=AU05atYDL1vBtl2wmk0A:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=eWIHaOtA_ULHaMmHwLHW:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130106
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55681-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,gitlab.freedesktop.org:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 643A5283D36
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Qualcomm kaanapali platform have a newer generation of video IP iris4. 
The hardware have evolved mostly with respect to higher number of power 
domains as well as multiple clock sources.

Considering iris as a client driver, it adds the handling for multiple 
stream ids from VPU via iommu-map.

This series is depend on the below series:
https://lore.kernel.org/all/20260226074245.3098486-1-vijayanand.jitta@oss.qualcomm.com/

Following patches were dropped since v2, as per the comments, and would 
be posted separately. This series depends on these patches for 
functionality.
- https://lore.kernel.org/all/20260126-kaanapali-iris-v1-2-e2646246bfc1@oss.qualcomm.com/
- https://lore.kernel.org/all/20260126-kaanapali-iris-v1-3-e2646246bfc1@oss.qualcomm.com/

Patch #4 is also posted alongwith below series. If the other series is 
picked earlier, then this patch can be dropped from this series.
https://lore.kernel.org/all/20260227-iris_sc7280_gen2_support-v2-1-7e5b13d26542@oss.qualcomm.com/

Following are the compliance and functional validation reports.

v4l2-compliance report for decoder including streaming tests:

v4l2-compliance 1.33.0-5441, 64 bits, 64-bit time_t
v4l2-compliance SHA: 4310f15610f4 2026-01-18 22:09:17

Compliance test for iris_driver device /dev/video0:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Decoder
        Bus info         : platform:2000000.video-codec
        Driver version   : 6.19.0
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
        Detected Stateful Decoder

Required ioctls:
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video0 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 12 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK
        test Composing: OK
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)
        test blocking wait: OK

Test input 0:

Streaming ioctls:
        test read/write: OK (Not Supported)
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 465 buffers
        test MMAP (select, REQBUFS): OK
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 465 buffers
        test MMAP (epoll, REQBUFS): OK
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 465 buffers
        test MMAP (select, CREATE_BUFS): OK
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 465 buffers
        test MMAP (epoll, CREATE_BUFS): OK
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video0: 54, Succeeded: 54, Failed: 0, 
Warnings: 0

v4l2-compliance report for encoder including streaming tests:

v4l2-compliance 1.33.0-5441, 64 bits, 64-bit time_t
v4l2-compliance SHA: 4310f15610f4 2026-01-18 22:09:17

Compliance test for iris_driver device /dev/video1:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Encoder
        Bus info         : platform:2000000.video-codec
        Driver version   : 6.19.0
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
        Detected Stateful Encoder

Required ioctls:
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video1 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 38 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)
        test blocking wait: OK

Test input 0:

Streaming ioctls:
        test read/write: OK (Not Supported)
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (select, REQBUFS): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (epoll, REQBUFS): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (select, CREATE_BUFS): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (epoll, CREATE_BUFS): OK
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video1: 54, Succeeded: 54, Failed: 0, 
Warnings: 0

Fluster test report:

77/135 while testing JVT-AVC_V1 with 
GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1

The failing tests are:
- 52 test vectors failed due to interlaced clips: Interlaced decoding is 
not supported.
- cabac_mot_fld0_full
- cabac_mot_mbaff0_full
- cabac_mot_picaff0_full
- CABREF3_Sand_D
- CAFI1_SVA_C
- CAMA1_Sony_C
- CAMA1_TOSHIBA_B
- cama1_vtc_c
- cama2_vtc_b
- CAMA3_Sand_E
- cama3_vtc_b
- CAMACI3_Sony_C
- CAMANL1_TOSHIBA_B
- CAMANL2_TOSHIBA_B
- CAMANL3_Sand_E
- CAMASL3_Sony_B
- CAMP_MOT_MBAFF_L30
- CAMP_MOT_MBAFF_L31
- CANLMA2_Sony_C
- CANLMA3_Sony_C
- CAPA1_TOSHIBA_B
- CAPAMA3_Sand_F
- cavlc_mot_fld0_full_B
- cavlc_mot_mbaff0_full_B
- cavlc_mot_picaff0_full_B
- CVCANLMA2_Sony_C
- CVFI1_Sony_D
- CVFI1_SVA_C
- CVFI2_Sony_H
- CVFI2_SVA_C
- CVMA1_Sony_D
- CVMA1_TOSHIBA_B
- CVMANL1_TOSHIBA_B
- CVMANL2_TOSHIBA_B
- CVMAPAQP3_Sony_E
- CVMAQP2_Sony_G
- CVMAQP3_Sony_D
- CVMP_MOT_FLD_L30_B
- CVNLFI1_Sony_C
- CVNLFI2_Sony_H
- CVPA1_TOSHIBA_B
- FI1_Sony_E
- MR6_BT_B
- MR7_BT_B
- MR8_BT_B
- MR9_BT_B
- Sharp_MP_Field_1_B
- Sharp_MP_Field_2_B
- Sharp_MP_Field_3_B
- Sharp_MP_PAFF_1r2
- Sharp_MP_PAFF_2r
- CVMP_MOT_FRM_L31_B

3 test case failed due to unsupported bitstream.
num_slice_groups_minus1 greater than zero is not supported.
- FM1_BT_B
- FM1_FT_E
- FM2_SVA_C

2 test case failed because SP_SLICE type is not supported.
- SP1_BT_A
- sp2_bt_b

1 test case failed due to unsupported profile.
- BA3_SVA_C

131/147 testcases passed while testing JCT-VC-HEVC_V1 with 
GStreamer-H.265-V4L2-Gst1.0

10 testcases failed due to unsupported 10 bit format.
- DBLK_A_MAIN10_VIXS_4
- INITQP_B_Main10_Sony_1
- TSUNEQBD_A_MAIN10_Technicolor_2
- WP_A_MAIN10_Toshiba_3
- WP_MAIN10_B_Toshiba_3
- WPP_A_ericsson_MAIN10_2
- WPP_B_ericsson_MAIN10_2
- WPP_C_ericsson_MAIN10_2
- WPP_E_ericsson_MAIN10_2
- WPP_F_ericsson_MAIN10_2

4 testcase failed due to unsupported resolution.
- PICSIZE_A_Bossen_1
- PICSIZE_B_Bossen_1
- WPP_D_ericsson_MAIN10_2
- WPP_D_ericsson_MAIN_2

2 testcase failed due to CRC mismatch.
- VPSSPSPPS_A_MainConcept_1
This fails with software decoder as well. Earlier discussion on this 
here https://lore.kernel.org/all/63ca375440c4ff2f55ea0aa4e19458f775552d88.camel@ndufresne.ca/

- RAP_A_docomo_6
This was discussed on bug 
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/4392
Based on above discussion, the initial error frames need to be safely 
dropped in the firmware or driver side. Client does not have the 
required logic to drop them even if marked as error.
Discussion ongoing with video firmware team on a way to handle such 
case. Note that the issue is not specific to kaanapali, and its there on 
all platforms.

235/305 testcases passed while testing VP9-TEST-VECTORS with GStreamer-VP9-V4L2-Gst1.0
64 testcases failed due to unsupported resolution
- vp90-2-02-size-08x08.webm
- vp90-2-02-size-08x10.webm
- vp90-2-02-size-08x16.webm
- vp90-2-02-size-08x18.webm
- vp90-2-02-size-08x32.webm
- vp90-2-02-size-08x34.webm
- vp90-2-02-size-08x64.webm
- vp90-2-02-size-08x66.webm
- vp90-2-02-size-10x08.webm
- vp90-2-02-size-10x10.webm
- vp90-2-02-size-10x16.webm
- vp90-2-02-size-10x18.webm
- vp90-2-02-size-10x32.webm
- vp90-2-02-size-10x34.webm
- vp90-2-02-size-10x64.webm
- vp90-2-02-size-10x66.webm
- vp90-2-02-size-16x08.webm
- vp90-2-02-size-16x10.webm
- vp90-2-02-size-16x16.webm
- vp90-2-02-size-16x18.webm
- vp90-2-02-size-16x32.webm
- vp90-2-02-size-16x34.webm
- vp90-2-02-size-16x64.webm
- vp90-2-02-size-16x66.webm
- vp90-2-02-size-18x08.webm
- vp90-2-02-size-18x10.webm
- vp90-2-02-size-18x16.webm
- vp90-2-02-size-18x18.webm
- vp90-2-02-size-18x32.webm
- vp90-2-02-size-18x34.webm
- vp90-2-02-size-18x64.webm
- vp90-2-02-size-18x66.webm
- vp90-2-02-size-32x08.webm
- vp90-2-02-size-32x10.webm
- vp90-2-02-size-32x16.webm
- vp90-2-02-size-32x18.webm
- vp90-2-02-size-32x32.webm
- vp90-2-02-size-32x34.webm
- vp90-2-02-size-32x64.webm
- vp90-2-02-size-32x66.webm
- vp90-2-02-size-34x08.webm
- vp90-2-02-size-34x10.webm
- vp90-2-02-size-34x16.webm
- vp90-2-02-size-34x18.webm
- vp90-2-02-size-34x32.webm
- vp90-2-02-size-34x34.webm
- vp90-2-02-size-34x64.webm
- vp90-2-02-size-34x66.webm
- vp90-2-02-size-64x08.webm
- vp90-2-02-size-64x10.webm
- vp90-2-02-size-64x16.webm
- vp90-2-02-size-64x18.webm
- vp90-2-02-size-64x32.webm
- vp90-2-02-size-64x34.webm
- vp90-2-02-size-64x64.webm
- vp90-2-02-size-64x66.webm
- vp90-2-02-size-66x08.webm
- vp90-2-02-size-66x10.webm
- vp90-2-02-size-66x16.webm
- vp90-2-02-size-66x18.webm
- vp90-2-02-size-66x32.webm
- vp90-2-02-size-66x34.webm
- vp90-2-02-size-66x64.webm
- vp90-2-02-size-66x66.webm

2 testcases failed due to unsupported format.
- vp91-2-04-yuv422.webm
- vp91-2-04-yuv444.webm

2 testcase failed due to unsupported resolution after DRC.
- vp90-2-21-resize_inter_320x180_5_1-2.webm
- vp90-2-21-resize_inter_320x180_7_1-2.webm

1 testcase failed with CRC mismatch.
- vp90-2-22-svc_1280x720_3.ivf
Discussion ongoing with firmware team on how to handle this case. This 
is not specific to kaanapali, and its there on all platforms.

1 testcase failed due to unsupported stream.
- vp90-2-16-intra-only.webm

Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
Changes in v3:
- Added description for each item in iommu-map property (Dmitry)
- Dropped definition of iommu-types (Krzysztof)
- Renamed file to qcom,kaanapali-iris.h (Krzysztof)
- Updated function id from hex to integer (Krzysztof)
- Moved the struct to facilitate individual patch compilation 
  (Krzysztof)
- Fixed copyright by dropping the year (Dmitry)
- Updated struct in platform data as const by moving the context bank 
  devices to core struct (Dmitry)
- Simplified logic to get context banks by array indices (Dmitry)
- Dropped BUF_HFI_QUEUE, instead get the device directly from prefixed 
  region (Dmitry)
- Link to v2: https://lore.kernel.org/r/20260227-kaanapali-iris-v2-0-850043ac3933@oss.qualcomm.com

Changes in v2:
- Described iommu map in a better way in binding (Dmitry, Krzysztof)
- Defined the function IDs as ABI instead of hardcode numbers (Dmitry)
- Added iris vpu bus and configured callback for dma_configure (Robin)
- Remove parsing of iommu-map from driver (Robin)
- Fixed fluster issues by adding H265 line buffer calculation for vpu4
- Dropped iommu patches #2 and #3 from this series. Those would be 
posted separately (Bryan)

- Link to v1: https://lore.kernel.org/r/20260126-kaanapali-iris-v1-0-e2646246bfc1@oss.qualcomm.com

---
Vikash Garodia (7):
      media: dt-bindings: qcom-kaanapali-iris: Add kaanapali video codec binding
      media: iris: switch to hardware mode after firmware boot
      media: iris: add iris vpu bus support and register it with iommu_buses
      media: iris: add context bank devices using iommu-map
      media: iris: add helper to select context bank device
      media: iris: add iris4 specific H265 line buffer calculation
      media: iris: add platform data for kaanapali

 .../bindings/media/qcom,kaanapali-iris.yaml        | 254 +++++++++++++++++++++
 drivers/iommu/iommu.c                              |   4 +
 drivers/media/platform/qcom/iris/Makefile          |   4 +
 drivers/media/platform/qcom/iris/iris_buffer.c     |   7 +-
 drivers/media/platform/qcom/iris/iris_core.c       |   4 +
 drivers/media/platform/qcom/iris/iris_core.h       |   2 +
 drivers/media/platform/qcom/iris/iris_hfi_common.c |   4 +
 drivers/media/platform/qcom/iris/iris_hfi_queue.c  |  16 +-
 .../platform/qcom/iris/iris_platform_common.h      |  21 ++
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  90 ++++++++
 .../platform/qcom/iris/iris_platform_kaanapali.h   |  83 +++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  70 +++++-
 drivers/media/platform/qcom/iris/iris_resources.c  |  87 +++++++
 drivers/media/platform/qcom/iris/iris_resources.h  |   3 +
 drivers/media/platform/qcom/iris/iris_vidc.c       |   4 +-
 drivers/media/platform/qcom/iris/iris_vpu2.c       |   1 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      |   9 +-
 drivers/media/platform/qcom/iris/iris_vpu4x.c      |  24 +-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  51 ++++-
 drivers/media/platform/qcom/iris/iris_vpu_bus.c    |  32 +++
 drivers/media/platform/qcom/iris/iris_vpu_common.c |  16 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   3 +
 include/dt-bindings/media/qcom,kaanapali-iris.h    |  18 ++
 include/linux/iris_vpu_bus.h                       |  13 ++
 24 files changed, 780 insertions(+), 40 deletions(-)
---
base-commit: 7d6661873f6b54c75195780a40d66bad3d482d8f
change-id: 20260126-kaanapali-iris-29fd184e2fe4
prerequisite-message-id: <20260226074245.3098486-1-vijayanand.jitta@oss.qualcomm.com>
prerequisite-patch-id: 421e3bb43ae0dbd6a1ba02acd02592d260456eb1
prerequisite-patch-id: f4b9b5e59b3d37407941f7fee05ca4996ad3d9ba
prerequisite-patch-id: 4556a2b44275b120be0faa86bde0b55593065476

Best regards,
-- 
Vikash Garodia <vikash.garodia@oss.qualcomm.com>


