Return-Path: <linux-media+bounces-67693-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id D9LWMceVV2r8XQAAu9opvQ
	(envelope-from <linux-media+bounces-67693-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 16:14:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 649C675F3AE
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 16:14:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XyxjMH36;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UsKlxXjY;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67693-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-67693-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 810123040550
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 14:11:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D35037CD31;
	Wed, 15 Jul 2026 14:10:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88208371049
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 14:10:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784124648; cv=none; b=DQLC8+auLjgkDF6jOXfi/6ZJzNPS66oD/wPjeMPHPpzToVVEYO+bf+dWNpfOyVVf+Lq3P60bbWJkjtwiP/YvmxEBNBx4Qc/Fm3OoGh2tBiYZAYj6lDRUd4do6ONh6lfi3pqJtYNCDA04yL0o+2wk2TstoC53zDmscYNe2ghAvNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784124648; c=relaxed/simple;
	bh=xDKjG51jBAk9EXSAgV+S8o6yhO9zrtRBIJx3AXPH7vc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IxHnyRR0RPsZSyUkU/nke2fcwriaW2tzNn6rB9bfKmtUMz+byeQ1XrS6AcTy78pw6AHaVnTlCgLk+pPVaEl/11+uXem5Ao1TNyw+XSW6qrpN7IvSp5rRpU0u+pDToAJEadKZI2PeKliy9hZONAKIJKM6uLWkReG6QgFcSOgYnR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XyxjMH36; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UsKlxXjY; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FE3eVD3806345
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 14:10:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jQ1czwxEPod8YlqEh+zmO/6OKv3iOp22VfF1LBuIlCI=; b=XyxjMH36YcJYCkgq
	TcU5Kyl3MDusL3IHng7fMmA1mootoYxMMTmttEKkJgbs7i4vnplaKd2roZzJ1p1P
	QdGBkf73b3BxR8aByaWY+ZklGtCFDuvpPUUB3Y+s6e4NL++gnWr69Z7RAVRLGvyA
	SBWR/u4Wxa2tcb71VVAONa/ZIXpS6XCuniX0SBuFFcr1fh/B9EFEcYLRWd6v3wxo
	/l0x5N6Y0XIwF9PCeEsgC/cMB99Wgsw/GuVU7/fTOmwyuLbk7ToPo4CgP416peC6
	4pnep2+FnBJFShicP1fPaX1jSxcED346tWWIhIkr2iy6tOanQVJv9ZUx/MPHAQeK
	MGb8mQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9g40wd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 14:10:45 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccafc5e82cso26975415ad.3
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 07:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784124644; x=1784729444; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jQ1czwxEPod8YlqEh+zmO/6OKv3iOp22VfF1LBuIlCI=;
        b=UsKlxXjYvAVYe6VUxhEiLmargQEKf7noXHq+ga1TSoVYzh7GCN1yo8Ho9bfYbsl87y
         dx34nzIAXhmNc2bWL3hfjvVU67Gjuh4YLaCZgR/WmO4rvFVMcdKjTgV/Ttz5MHEhugEs
         +BRW6A57uCsZrsf2nr71mF7PC01APZeqEHS8X8/Q9fb31KvarEFk2r6aaEDhhi+Vshx2
         16wDgdnz5fctMr3YSxqLe+L2OwUbLfc8p49MyDIa+1g70Rm7iKEIM+/tCMW0B4xFirU3
         2qNCUHWdY22HOOU86MOcdwKKJjOF1zobAozQR4bLMoxVOt5KoauqiGXYT9bfhnrL1eIq
         tXMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784124644; x=1784729444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jQ1czwxEPod8YlqEh+zmO/6OKv3iOp22VfF1LBuIlCI=;
        b=SAWhwXGK24GiEXaRyOxHpGB08hmg+69kkSuECYk1x5Foh00Qv/AX4ctCZMsJ8Llnkg
         2sd3QWta96hV71VbgiCDibh20taP3yB6XgRErVTT48I4FiKC4NUx6kUVuyu684EZQV+I
         1zM2N74j98sGwI+IKsZNXrnSK3QARE6rsRnFyIIzg3xNd7SATpL0d3noizdQPuVE72ne
         BXl6TMBzISlH6oC8jei1Ovhkmf2F90C6S5rMZYRmEjj+pUCYe5s6bSTZlANpwVmMghad
         UeiqIvEkunM9AWLYFfx4ygWUpFtBSLRktcIeMrBs0ckdEXyC2XSdQ6naSQpg53Mcom01
         wQfg==
X-Forwarded-Encrypted: i=1; AHgh+RqX3Whtg5UbnEDzzq7EPVOej+d2GVxxwKIVnSrbWoEyHhCjwF3at2Wf7KGOHxuBw8DVgUGACLjXCHVmng==@vger.kernel.org
X-Gm-Message-State: AOJu0YxksuEmbywifJ/BPlCF5PmqxMe6MRNXx0j7Xc8nxTsUKptZyMv8
	0n+qcdpSYupRseOG5oKNymBR5D0we60fLECzjwMoGj7YdtGAy8E3wWZMcxNalU7btPYxRYwCzUi
	id+kheAbzwvidTrdJksdkrN1ZcZr9z5F8d6MMd+ep/z3KPr+5+HsIWiJ8fWHXZto5XQ==
X-Gm-Gg: AfdE7cmpAYzDTYi3O/AuC1bnoWry+J4lb7lwLRWsUxEtxBlvN9O3PhsfRfykgD8wXQx
	BNhmO4/zzPNA0ed0LtiHySSGd5Gdh+l037Ry5h4A1pLngRgk0qkr1aeL/LhnhAANKvQBEOOYIHg
	LSTh2aZMZEq3CFn68uLZARQjmUhvoY3wRBgSc0YYUl7ExxjrBn+icDc6waJt0e9vUN80eGdTrlY
	Wzg6hs2FE36xH0L5kIo4XcqfJ5vxcHJUJ526io7AqCMKfJUURGb/ZwV1HHApioz1oF1CwgM7XS9
	M5FpH/ODkmcTXj1un7SncAIe4dl9X4Ce2v7kVVjOd4HD2jJOuxdMb6ICL3YjHOSXq1KhmsgJEGL
	CsiNVWe91MttTyc/EjpuzQrljpEhjnbeSx8nniPVw+ViR
X-Received: by 2002:a17:902:f68e:b0:2c2:cf20:213 with SMTP id d9443c01a7336-2ce9ee1142emr186082005ad.29.1784124644511;
        Wed, 15 Jul 2026 07:10:44 -0700 (PDT)
X-Received: by 2002:a17:902:f68e:b0:2c2:cf20:213 with SMTP id d9443c01a7336-2ce9ee1142emr186081605ad.29.1784124644086;
        Wed, 15 Jul 2026 07:10:44 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf1070b68dsm2913215ad.79.2026.07.15.07.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 07:10:43 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 19:39:59 +0530
Subject: [PATCH v9 05/14] media: iris: Skip DMA mask setting to core device
 when IOMMU is not mapped
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-glymur-v9-5-8cf2cbe12a07@oss.qualcomm.com>
References: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
In-Reply-To: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Daniel J Blueman <daniel@quora.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784124602; l=1589;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=sjEt7zVED5HiiTDKACtd2anjSuOH/+nGuerIdCCDwyY=;
 b=Akf49Yj7dW3GwqxuoRtoRP9AK2qcSXDAAVD2VoECqphz29qaa69SzMfa0lyuS81QJoZMYeFtN
 VXSV51eLUv2BIs9kTVKE9Zn7eYjgvGiQ1FBu34jm+ykdqzRBARCJtpg
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDE0MSBTYWx0ZWRfXz3fhDxg9O1Yx
 fAlwrqMPZXG2XFJXS8XF3OefW0jC4m7zzeTv1J9C0hDeaiZaTqKGXRTvlv1z61jnd2WWB4vXphO
 IWlxlx6iv9TQ8Qqedkl8wx/juJ2knho=
X-Proofpoint-ORIG-GUID: hJlMdEeqhChEvi6yGg57N95kdg8soRbu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDE0MSBTYWx0ZWRfX+RF1MKgv2qMm
 mqaEZ7K2ExIfwwONOXoDe8tpkME9F/OSZ6wns17OnHED/33etalEEOUU3Wzer6ubi+I0FCZVJak
 blFy6EUbjPn/DOm3OH4aKTiiksuIHg3b1/txSTDqzjshakcwvOS0kQgDRCeSw1yPkOoe9uqYKXm
 bibebdRGjCU7WjvKLI1HHtRQTWkqKJCH8+cRu3eydkbUAHMxQCob1Ktj5i57Pc/VET5kWMEM/qc
 XbEhFqOYvwPLWYJghvWUWoFs9Nccu7Q7PxLvUPjOckCFKvKXSCXqksoW/cwP+35SZVsMH6Og+of
 yMdiExeyDamnnY/wty2MP3U+4dzvGImtnKS6zLeuhHwY+H2EzA8u0eFERf8wKwSkZylGMVQPMwS
 /nUmEBddSb4nL8+g0PydXNPpZ+ynneHOyCTISFKVZHtZIfKMgaVS/HaSk9mwC4aenJG90G1UhbP
 /w+jYTJGBxsWBCvyDyw==
X-Proofpoint-GUID: hJlMdEeqhChEvi6yGg57N95kdg8soRbu
X-Authority-Analysis: v=2.4 cv=VoATxe2n c=1 sm=1 tr=0 ts=6a5794e5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=t9ty7G3lAAAA:8 a=2w7d1ukKp82XeiQ8bL8A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150141
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67693-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:mchehab@kernel.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:stanimir.k.varbanov@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:daniel@quora.org,m:krzk@kernel.org,m:conor@kernel.org,m:stanimirkvarbanov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,quora.org:email];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 649C675F3AE
X-Rspamd-Action: no action

From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

The non-pixel and pixel subnodes move the IOMMU streams away from the
iris parent device. As a result, the core device may not have an IOMMU
mapping, and setting its DMA mask is unnecessary.
Legacy platforms that have not migrated to subnodes still associate the
streams with the parent device and still need the DMA mask setup. Call
dma_set_mask_and_coherent() only when an IOMMU is mapped to the iris
core device.

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Daniel J Blueman <daniel@quora.org>
---
 drivers/media/platform/qcom/iris/iris_probe.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 2594f5a67378..c40c4ec44e83 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -310,9 +310,11 @@ static int iris_probe(struct platform_device *pdev)
 
 	dma_mask = core->iris_platform_data->dma_mask;
 
-	ret = dma_set_mask_and_coherent(dev, dma_mask);
-	if (ret)
-		goto err_vdev_unreg_enc;
+	if (device_iommu_mapped(dev)) {
+		ret = dma_set_mask_and_coherent(dev, dma_mask);
+		if (ret)
+			goto err_vdev_unreg_enc;
+	}
 
 	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
 	dma_set_seg_boundary(&pdev->dev, DMA_BIT_MASK(32));

-- 
2.34.1


