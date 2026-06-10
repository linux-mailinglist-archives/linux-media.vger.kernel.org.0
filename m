Return-Path: <linux-media+bounces-64358-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eqYGLgYGKWrlOwMAu9opvQ
	(envelope-from <linux-media+bounces-64358-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 08:36:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8A86664E7
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 08:36:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=T4mIcnMj;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="F/pw1vkU";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64358-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64358-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 95D8A317B659
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 06:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8535437C0F9;
	Wed, 10 Jun 2026 06:30:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685563793DE
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 06:30:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781073049; cv=none; b=J8t/+mkD6DMWOC3y/djvrwPzihXbKaQdvrNYMvpZoUDIDCY8Av4758VCUYr7VR934F7WI/N41X75oPSrvuxszaxH135XZTVtB1Qm6melbs6K33csam4f6Vt9+1h21fw68zFJKPfuR5udQ2VUC8M7Zl2jrIzUtrTWhIERaN+/L7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781073049; c=relaxed/simple;
	bh=s9wTJg7+ivqEyqOea5nfQPWB3ECRffaa/U/6xK1IonQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XTAMzZ54fo3CUaxiGP+ZLKCm7HPCFqMYfiyKikKKxzqQzjXT/AYNacYtDYabaeOgFCMgHh3zuDC+Us68kgaccUzyopi1+thqbx5KKGmOjbxf4zcq+C/O8Inj6sPlbspcYy8uDnXa4T/lSTCwEEMZTkgImdjoWR6OZ34J68Ja4Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T4mIcnMj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F/pw1vkU; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A2egeU4061505
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 06:30:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KcjYoxNYJZSF7oYA+rD6cGH2cTKuwIPF7kWTMRGHtCA=; b=T4mIcnMj/34gviTl
	dTDAWLi6fEbNh6+A7ZYs5s8NPKDcVZzH3jma5PoKR/EXeY+WyzrRz4TXsdLR+aGY
	Tccmo5Ine1GZvtM31nNmKomMkrOpSN8RmR3za1cc/B6Khc/Vytz7ElOhGQIKkNVZ
	X2jDAuY32JgrYhDWAOG+spmbRli2+9xx/0dGZGdh8fKP2T7X13uSIVAOUTo/dXon
	MR1CBPPk7Vz/4C/wHaTOCKAtlxU1C/moivKHeEkOiaDi3jgYVcTwmRuvVPgjzZmf
	NT/eki6WGKAc8hpl4LhoyPCSSnY6v8v8B+uhys83p1Y19IjzioS9OoKfC4DUjaij
	aFFtfw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwr2h1m4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 06:30:43 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36b9d265308so4827351a91.2
        for <linux-media@vger.kernel.org>; Tue, 09 Jun 2026 23:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781073043; x=1781677843; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KcjYoxNYJZSF7oYA+rD6cGH2cTKuwIPF7kWTMRGHtCA=;
        b=F/pw1vkUs3uxzSsKkD7ywJd17UswkyRvYN35xBw4E3KFPbMIiZCQz0BTmBxaWsBPeq
         muloiyPefGqJRDQROsB9vvQ+iRELb0B8T/jNDFdEyB7EdIFn8DQo7ZriWhxrNwUQYWDA
         ZufNUz91JV0+CCHfHkLiPraKtzdTe06l42oKs/oVlu+JeMfeMNfeAKBLKvrLBCC1655s
         BdgbkfVNZ0zYVtgRgFg2mQtJtF2x4FUMyKiFyap/GZT3WLae+QPg2b7TpAsTX8PaKJ+V
         b9ExrLwETOpLHM6kWX7h/I7Vx9ztuKKCkrp3nsNaV1yqx8wYc3YfFkyNDiP7Zh6Xl63n
         0NjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781073043; x=1781677843;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KcjYoxNYJZSF7oYA+rD6cGH2cTKuwIPF7kWTMRGHtCA=;
        b=KXDlxcTedLNahfOvCCpFhPPLCYXve/b7eTSaFfaslU7I8/1mqkTHowgxIa+X592Bgp
         M9fBO7vl1prCDLeivYsaa82hYhjRJpuzRN5Alvcc2W4kAak0CNsd6wiNpILyJOGKx6TS
         hFVNTzLIk4kTdx60PorWWWlTggjediJES3g6CUMKC+vP48jdpvZIlDpfzghTA9AgEulf
         qBA7HJGXOGCVgHj2sTWJ/jAZMrGyp8BhArUEtS7Dk8DpXw0PfmAlX4ArXt6eXtPCTvaR
         h48N2R2tUS6F6doF69nNGCmHveu21xwTkiz//enCy8yvi2Tn8vWWTorVtABCbSIQDMBZ
         QQ+A==
X-Forwarded-Encrypted: i=1; AFNElJ+IAM1QLvRK20X24yE8LH5vk8MKAjcHyRfIPbSkkrQ1ECBDvabwmq6NR0Pp50f1S0YTNJhC9s8Rab6oIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQbnmy+LzwxoZkduzXwYpHlgwxQ99SFNmhVXNB6XPBnZruibO0
	XzwSDlPh3L4QiZS7aLb56ID/G1FYONqXOgNvhzpWVHnXgxc5FHgi4dq9o8MabCY8TVm4TC62DgO
	dZcoP3LII/pPVZybZ1K9cQtFD2zgA70LorTKos2d7MiPoQAU7PehiFoYlw6MHNaA4Yg==
X-Gm-Gg: Acq92OFvZvpBMsye3tjZp+QXyfls6rI9GLqMs4CSER80iWp3O2ZVSeZ6XnQiF/Stpg7
	zHjLD4HMdieaWSLbhBOYHS6gghXe+4Sn+erKiIVlr22UnYScIaJkKHvj/cb0CuD9jt+BGp+BmGJ
	JjIhFydPLqzEymHLsvZB2MjQAnZwqpfZRhqGx8jbnPLgkm0MDKl+1Jx7B+PTGl0yJxYqneI9fp/
	n3s30LWyUyYnHsuDyLeIczw2wuojGwSzCVjBRrxCexRE31cjBeQEBPbkSdbgs0O6bKY2OCs5iu9
	7HX2SNChqECNp0huUE1V06b5axQTxGYag/wyQFRH2jVWgNjvM152KE+OhDeK+2nuBUM0L0z/xws
	aEZh9+Hm6S+xzeZaNVcYXK/TKigLIolkYiEAEHJ4oFzmLftPLX3H8i+ThmEKcauYv1Q==
X-Received: by 2002:a17:90a:c2c7:b0:36b:9c70:3367 with SMTP id 98e67ed59e1d1-370f0480c9emr24546925a91.17.1781073042823;
        Tue, 09 Jun 2026 23:30:42 -0700 (PDT)
X-Received: by 2002:a17:90a:c2c7:b0:36b:9c70:3367 with SMTP id 98e67ed59e1d1-370f0480c9emr24546839a91.17.1781073041515;
        Tue, 09 Jun 2026 23:30:41 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f70a2892esm21580420a91.10.2026.06.09.23.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 23:30:41 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 11:59:41 +0530
Subject: [PATCH v8 05/12] media: iris: Enable Secure PAS support with IOMMU
 managed by Linux
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-glymur-v8-5-1c79b9d51fc0@oss.qualcomm.com>
References: <20260610-glymur-v8-0-1c79b9d51fc0@oss.qualcomm.com>
In-Reply-To: <20260610-glymur-v8-0-1c79b9d51fc0@oss.qualcomm.com>
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
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781073002; l=7472;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=xDfVfdVapDwiA6cb5Xkv+E/anLdZly0Gh0yY4RsIYls=;
 b=G5/h11HQ2YGX5yoC0q1s6abElPR03Hs/F4++PLBRwtKyflllLfJyj1SRvj3POX3p7KFWlSxa8
 kb/RoJCH5+nDFeA3PaPbC6z2bqZjK5W1Y3QLdDRE8M22oCNy/IsyPB0
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=Gu1yPE1C c=1 sm=1 tr=0 ts=6a290493 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=U8OLdchxA3Z7P0hrdlYA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA1OSBTYWx0ZWRfX1Vnk7ihG4Kwo
 AyAKrSHfTKsB8uHBel0rpHHH7TefnxzYDmNDWJhDCkz9Xcu5lCvvYOavyVuhhsiUH9ylurDxo43
 54hh/SEUhJ7I2CEnkhUsYjgde30JFAV85FjyqFbB9X11oLM0rzKc0WtfGpGasaGGUVzcpxUjn0k
 WTXQjKTIWzlhZNN1BcQtT7khKWWg/0mTGrGJEuOnNmFwgIezio5BVHDcZqmfl4e0CPGcKe6jl0y
 MJiGtQW0M7vS2trxX4c+TFZKqv/yemsLzHBgIZV4M8MIqvkuaddtik3KKWE0+Ujq53yUzVglRxi
 TyUmaflcgJaeQGOVlOJlfsG8kwJAUvgqeJwqnvS/+Hytk4fyxrw6lklrGcXucT85gy3l+33+FXU
 9HLHSvm8+KCbTJrUHR0TegK4F3s3dWutr1i6X2ZRXvAFU6PBnFMeVLsmgaBVh1nGhddpXxAbyTP
 WDswz4EgLggiGd+EEnQ==
X-Proofpoint-ORIG-GUID: DvI71RI5tUlg-LTaaMxUdCv_eUFFAGmJ
X-Proofpoint-GUID: DvI71RI5tUlg-LTaaMxUdCv_eUFFAGmJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100059
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64358-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:mchehab@kernel.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:stanimir.k.varbanov@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:mukesh.ojha@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:stanimirkvarbanov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 1B8A86664E7

From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

On platforms where a hypervisor is present, all Secure Monitor Calls
(SMC) are intercepted. For qcom_scm_pas_auth_and_reset(), the hypervisor
registers a Shared Memory (SHM) bridge over the Peripheral Image Loader
(PIL) memory region so that TrustZone (TZ) can access it, forwards the
authentication SMC to TZ, and upon return maps the PIL region and
triggers the co-processor bring-up sequence:

HLOS -> Hypervisor(SHM setup) -> TZ(auth) -> Hypervisor(map+reset) -> IRIS

On platforms without a hypervisor, Linux drives these steps directly.
The SHM bridge infrastructure required for this is already upstream [1].

To isolate firmware memory in its own Input-Output Memory Management
Unit (IOMMU) context, a dedicated stream ID (SID) is required, tied to
the firmware function ID. This SID is specified via the iommu-map
property in the device tree using the firmware function ID as the lookup
key. A firmware device is created and mapped to this SID.

The presence of a SID mapped to the firmware device via iommu-map is
used to detect whether a hypervisor is absent: when the firmware device
has a SID mapped, Linux manages the IOMMU directly; when no SID is
mapped, a hypervisor is assumed to be present and these steps are
skipped.

Extend the Iris driver to support Secure Peripheral Authentication
Service (PAS) on platforms where Linux manages the IOMMU, by creating
the firmware context device and performing the necessary IOMMU mapping
when the firmware device SID is present.

[1] https://lore.kernel.org/lkml/20260105-kvmrprocv10-v10-0-022e96815380
@oss.qualcomm.com/

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Co-developed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Link: https://lore.kernel.org/lkml/20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com/
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.h     |  4 ++
 drivers/media/platform/qcom/iris/iris_firmware.c | 69 ++++++++++++++++++++----
 2 files changed, 62 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index 24da60448cf2..2edba569fa25 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -36,6 +36,8 @@ struct qcom_ubwc_cfg_data;
  * struct iris_core - holds core parameters valid for all instances
  *
  * @dev: reference to device structure
+ * @fw_dev: reference to the context bank device used for firmware load
+ * @pas_ctx: SCM PAS context for authenticated firmware load and shutdown
  * @reg_base: IO memory base address
  * @irq: iris irq
  * @v4l2_dev: a holder for v4l2 device structure
@@ -81,6 +83,8 @@ struct qcom_ubwc_cfg_data;
 
 struct iris_core {
 	struct device				*dev;
+	struct device				*fw_dev;
+	struct qcom_scm_pas_context		*pas_ctx;
 	void __iomem				*reg_base;
 	int					irq;
 	struct v4l2_device			v4l2_dev;
diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
index 1a476146d758..07b3ade88777 100644
--- a/drivers/media/platform/qcom/iris/iris_firmware.c
+++ b/drivers/media/platform/qcom/iris/iris_firmware.c
@@ -5,6 +5,7 @@
 
 #include <linux/firmware.h>
 #include <linux/firmware/qcom/qcom_scm.h>
+#include <linux/iommu.h>
 #include <linux/of_address.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/soc/qcom/mdt_loader.h>
@@ -15,11 +16,13 @@
 #define IRIS_PAS_ID				9
 
 #define MAX_FIRMWARE_NAME_SIZE	128
+#define IRIS_FW_START_ADDR	0
 
 static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 {
+	struct device *fw_dev = core->fw_dev ? core->fw_dev : core->dev;
 	const struct firmware *firmware = NULL;
-	struct device *dev = core->dev;
+	struct iommu_domain *domain;
 	struct resource res;
 	phys_addr_t mem_phys;
 	size_t res_size;
@@ -30,14 +33,21 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 	if (strlen(fw_name) >= MAX_FIRMWARE_NAME_SIZE - 4)
 		return -EINVAL;
 
-	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
+	ret = of_reserved_mem_region_to_resource(core->dev->of_node, 0, &res);
 	if (ret)
 		return ret;
 
 	mem_phys = res.start;
 	res_size = resource_size(&res);
 
-	ret = request_firmware(&firmware, fw_name, dev);
+	if (!core->pas_ctx) {
+		core->pas_ctx = devm_qcom_scm_pas_context_alloc(core->dev, IRIS_PAS_ID,
+								mem_phys, res_size);
+		if (IS_ERR(core->pas_ctx))
+			return PTR_ERR(core->pas_ctx);
+	}
+
+	ret = request_firmware(&firmware, fw_name, fw_dev);
 	if (ret)
 		return ret;
 
@@ -53,9 +63,23 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 		goto err_release_fw;
 	}
 
-	ret = qcom_mdt_load(dev, firmware, fw_name,
-			    IRIS_PAS_ID, mem_virt, mem_phys, res_size, NULL);
+	core->pas_ctx->use_tzmem = !!core->fw_dev;
+	ret = qcom_mdt_pas_load(core->pas_ctx, firmware, fw_name, mem_virt, NULL);
+	if (ret)
+		goto err_mem_unmap;
+
+	if (core->pas_ctx->use_tzmem) {
+		domain = iommu_get_domain_for_dev(fw_dev);
+		if (!domain) {
+			ret = -ENODEV;
+			goto err_mem_unmap;
+		}
+
+		ret = iommu_map(domain, IRIS_FW_START_ADDR, mem_phys, res_size,
+				IOMMU_READ | IOMMU_WRITE | IOMMU_PRIV, GFP_KERNEL);
+	}
 
+err_mem_unmap:
 	memunmap(mem_virt);
 err_release_fw:
 	release_firmware(firmware);
@@ -63,6 +87,18 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 	return ret;
 }
 
+static void iris_fw_iommu_unmap(struct iris_core *core)
+{
+	struct iommu_domain *domain;
+
+	if (!core->pas_ctx->use_tzmem)
+		return;
+
+	domain = iommu_get_domain_for_dev(core->fw_dev);
+	if (domain)
+		iommu_unmap(domain, IRIS_FW_START_ADDR, core->pas_ctx->mem_size);
+}
+
 int iris_fw_load(struct iris_core *core)
 {
 	const struct tz_cp_config *cp_config;
@@ -77,13 +113,13 @@ int iris_fw_load(struct iris_core *core)
 	ret = iris_load_fw_to_memory(core, fwpath);
 	if (ret) {
 		dev_err(core->dev, "firmware download failed\n");
-		return -ENOMEM;
+		return ret;
 	}
 
-	ret = qcom_scm_pas_auth_and_reset(IRIS_PAS_ID);
+	ret = qcom_scm_pas_prepare_and_auth_reset(core->pas_ctx);
 	if (ret)  {
 		dev_err(core->dev, "auth and reset failed: %d\n", ret);
-		return ret;
+		goto err_unmap;
 	}
 
 	for (i = 0; i < core->iris_platform_data->tz_cp_config_data_size; i++) {
@@ -94,17 +130,28 @@ int iris_fw_load(struct iris_core *core)
 						     cp_config->cp_nonpixel_size);
 		if (ret) {
 			dev_err(core->dev, "qcom_scm_mem_protect_video_var failed: %d\n", ret);
-			qcom_scm_pas_shutdown(IRIS_PAS_ID);
-			return ret;
+			goto err_pas_shutdown;
 		}
 	}
 
+	return 0;
+
+err_pas_shutdown:
+	qcom_scm_pas_shutdown(core->pas_ctx->pas_id);
+err_unmap:
+	iris_fw_iommu_unmap(core);
+
 	return ret;
 }
 
 int iris_fw_unload(struct iris_core *core)
 {
-	return qcom_scm_pas_shutdown(IRIS_PAS_ID);
+	int ret;
+
+	ret = qcom_scm_pas_shutdown(core->pas_ctx->pas_id);
+	iris_fw_iommu_unmap(core);
+
+	return ret;
 }
 
 int iris_set_hw_state(struct iris_core *core, bool resume)

-- 
2.34.1


