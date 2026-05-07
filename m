Return-Path: <linux-media+bounces-60697-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mO1ECErn+2kaHwAAu9opvQ
	(envelope-from <linux-media+bounces-60697-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 03:13:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A01B24E1E39
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 03:13:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D35F5307E2B4
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 01:11:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D14B3285C84;
	Thu,  7 May 2026 01:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R47gjx3N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NlwjAexe"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D711F37D3
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 01:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778116266; cv=none; b=pNesoWkZVIHCY4dvj4XOj/LSp+/hAW8riSXtbMu6bHiKL70/JL4ASD2kJ8UfCI/Zv3fDQXwKleC9OIRhfz5OYe3hDY6AcW8pjSqyLdq1jXO1s8W4+qegHHyeo4gB/JvUpDJikLzmP6dyPlzql4Vdh15zHa5VL5VQilN+F8ra6gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778116266; c=relaxed/simple;
	bh=Zii42vc933kIDeIsFaUR4oAw5uqkZPXC/RIXb2eV3yc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DlZDymYV1xrqZm4wvfpNVylZ+mKuNPwZtV8sEIltwNZsTd03fX3UFgAhAReBEa9BBDXpwx80ZkY6ryXqriZsnawxaW4TmU6WD/gUPhXm2EotUYmWBOe8e0I7oGqxZm26g12Rs9uXJbVJQ2azgPNrvB62upwCVtkQSOk3/QEB168=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R47gjx3N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NlwjAexe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646H7n191953122
	for <linux-media@vger.kernel.org>; Thu, 7 May 2026 01:11:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/qBXAspLOui/eBATBY+xFXnkG3ex3UdKwBiljLWkZ0s=; b=R47gjx3NyZWvQVxM
	nIkpo3qtaZhNYaiPb5dGRfj1/JILarNgcXPqz+1UGW/NWV7GTZ3Kqm0GSoUZdKCF
	MBE9U0vjb27jEiI/49WP19JuySFF3B47XDhmeJZmQlOc2Nxm0k3AP4cHBcc+1j/G
	AlWWAKEek95+nx61atTXI57De3HMAg1FkAjjT5GK8DfN7kU8iqcQJhbw2gUPgay8
	2wV782VtmLtlel9nO6DnGWGQ/YnGBAZnwL2Jh2fB5IVvG+1Eeqfa1/9P7tJc9aWq
	FBfCTOxN509FcC2eyVqDLe6jt/8i6BiH48kFT/nYMdTgDXPutUHM33xeOo3EDD0G
	gSbZ+Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e03jc323n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 07 May 2026 01:11:04 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50df4c130dbso12267651cf.1
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 18:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778116263; x=1778721063; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/qBXAspLOui/eBATBY+xFXnkG3ex3UdKwBiljLWkZ0s=;
        b=NlwjAexeqWy8//61do2NCMjyNA9nQb2ATHcCFLjBaxXZWuScZJGjRSzlMhZGPrAjJN
         lKGuQedP0HtT3gW5Mh4I8GRiMzAheoYn2jt+s1Seopx/ldqAc7Vk79rMp4Gp7L1TMXWe
         5lJBe7IpOJbS79/urf0dIZbP6TEpZ58+Xi6pb9IUZJdDDvnOQMyheZwjNCjhI4ZqehD4
         Fu14Vh0qXQgj0sMQtbRW1uKxdjwm03K00qPvT37obmVjaIzzI2di9D8Oz93hhLhuMKb8
         zA618eZ7wuxZuT5uZP146kx72IJTbxOCqK88ecAjx71jzIpbWLnHFKW7WwOQ2bM1oL51
         Ycmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778116263; x=1778721063;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/qBXAspLOui/eBATBY+xFXnkG3ex3UdKwBiljLWkZ0s=;
        b=sRO+3/GmhHy2RNojD5YEGZh5o2ARhKdEP3XI7UTBtBlgwjzYXZRUIQqyAO1HJ7FMyX
         brbIBZelsq2WrYrksA/g1zcID79xflWaRPYc1C0E4uh/G7SrCWMxamBOA/8vWJ+Lr3vM
         gztKj5zfhk8A1FeLC1hnJmmxULc5Vr9m80gifspS02G/qveJb76JzIZNQA014a42NxXu
         qWRZtrg0g3QOR+kKXxBqrZfcGNGwjfIMHQhd8AVhMTCiD0y5pwc92VzpY0Tm15cPq2Lt
         7zRPpFD2THdd4/NjE94C9BiT0/teWYuiXHrZYRUPj+AOqqsEtQ1c/BROI6ZLrMN325TJ
         Gtrg==
X-Forwarded-Encrypted: i=1; AFNElJ969vUrE2eKGSgC9S7bs5W6He5vnUQqmPKjXxBrRShqD3gUgeeTF770TUcqQN4HDF+jZ77eZr9hTJ79RQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp5X0wD/4U5pLtoGzoq2TJnqm7ZxWq+F28lNCfS6ZShrfWVgob
	63mudDIZgUjcsx3Ugu4m9cHZT2FvQA82GY4KcjEx0FIvzJaIJYvKehjkfIMqleFgTIFwkU8MFOs
	C1EFExCiEhfxJPOxPyrbj7gHb9pPYdWBLUNedwC/2PpHTElEQLxbJxl89OzWhMfDZIg==
X-Gm-Gg: AeBDiesZAcu4WNb9yyCvikw64dZDbRQEH+xPe9p7AUMQMXCKhyYBb6ePu0NRvT6by3v
	FcnkhH0azmwPuW8mUsV5IxDoRKvzc1eXTVPX2HVs042ZAyqnekWJOwOB7j0sjBj3+3vEtsuxZPz
	ZZFr3iJ4u05UCZwvnvj+h6buTW6odPw1O44nnWXcK+gz5+9uXI8JqSj+YNITBqK52wyJvdhDUD6
	ElHbwShYPbDlR13s86fc9OCob1SHIR+aO56dWkcn6yTPhBCnvQSWy91QCAJhds1jU2/cCuFpqi9
	zpJZ/h9eVgZdiCkndO+DMWL0nA9zJdxNBymvVWS/fVwWosN05PNDrAiIHNQdCr7iwxNtIKCsv3h
	6ZYTPgEnnlZt636HvOd7FkEPxVDK/KmZvQ98zv68yt+XzYXaOtOkCqGxdhWil3Oc+V8g2FGqhdY
	qxGbUVFpHeFzkGGdwqOGqDxRoDAOSDVLLcupfOWGrJPjjAGQ==
X-Received: by 2002:a05:622a:447:b0:50f:b427:7525 with SMTP id d75a77b69052e-51475cbe32amr12181511cf.42.1778116262947;
        Wed, 06 May 2026 18:11:02 -0700 (PDT)
X-Received: by 2002:a05:622a:447:b0:50f:b427:7525 with SMTP id d75a77b69052e-51475cbe32amr12181081cf.42.1778116262505;
        Wed, 06 May 2026 18:11:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c230e00sm5221967e87.29.2026.05.06.18.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 18:10:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 04:10:45 +0300
Subject: [PATCH v5 6/7] media: iris: don't specify max_channels in the
 source code
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-iris-ubwc-v5-6-e9a3aee53c49@oss.qualcomm.com>
References: <20260507-iris-ubwc-v5-0-e9a3aee53c49@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ubwc-v5-0-e9a3aee53c49@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2408;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Zii42vc933kIDeIsFaUR4oAw5uqkZPXC/RIXb2eV3yc=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+bvZ1PsTt248ugI6/Y3GrUOom+jFvt3SHDXBn83fbeJ4
 2uQ57P9nYzGLAyMXAyyYoosPgUtU2M2JYd92DG1HmYQKxPIFAYuTgGYSFYmB0NDWKthvWuYf1JG
 W82bKVWb87ULpkRMSVYxmL/l5J2sijlqHwT8OWK+/sj/Za+44/t29887rySzG4pccHX+EyK065z
 N6cQAScmaZpnZbtHMt/46aE7erD3TVOCo0Vnm/ukzbU54X1XIKPjK+k3dk5d5uRJ72JUqsdb5iT
 NyuzSXsXy4+W979rfQI/Mlri7iyFO0U1EtsDX7MP9D/LMnO17ISJpbS3MpL/9zNVCFKddq8SEdN
 lkh4Y6m5B/J145/j3+e9k/0/UkLe33tLnb2d9lpf8+6SkqxRuvc+7FDaIn1QqXo/wXVegLyrada
 37gx+Av76f3yk/2olbtu+QL3eTO0lial/+AwUuS2U2gCAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDAwOSBTYWx0ZWRfX5PYTea8qeSZ1
 nriPrvJZkjLQqS0d6Nm3xVsA9vRDQo/Id8nBjW190Y9onGQ59UhtQXEEoDwKi3a99QEODWyVw0p
 jV8D8x5sp1VLNvQHb6O2P5/8ANdnaYmpVPzNwHOe1l7Aor6eFwv1+m3aKrG5pXoz77UEMHyIRw3
 GQgP7Sadf2fLwKFH4FCis0Q5M4m+uHAr3NT7xk+Ujy+ubuhSczYiLi9DpSGbt/EWGtKOa27FYF8
 j10jte6tb9wD+viUfnUAjSif+Q56bbb3qaN0ulUpxglRU6dOoMgC9oYu45k57N7BdKYEsL6hQJr
 t66RALZ807K3BOSou8xKrfA/6tQzu6Moj8mhHkE4aWO3wJs5zMQ7P3OYNl57PHP7EXA8f9JpFgW
 EvPJHg0S3BV+duuqtIHwpQxPgRZ/2fJkh7BpStAck9ugf7jdJd5431I/KaeoxopjEJyOYUZtFer
 S4UbvibtBSztHZC8bDA==
X-Proofpoint-ORIG-GUID: ekBDQ9QEgoopCly8qYgXaNYth5iLmTp5
X-Proofpoint-GUID: ekBDQ9QEgoopCly8qYgXaNYth5iLmTp5
X-Authority-Analysis: v=2.4 cv=EpHiaycA c=1 sm=1 tr=0 ts=69fbe6a8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=rTy9geyXzX0TkIcb0cAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070009
X-Rspamd-Queue-Id: A01B24E1E39
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60697-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The UBWC max_channels spreading is specified in the Iris driver, but it
also can be calculated from the platform UBWC config. Use the platform
UBWC configuration instead of specifying it directly in the source.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 2 +-
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 1 -
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index a49394b92768..0d05dd2afc07 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -140,7 +140,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->max_channels;
+	payload = qcom_ubwc_macrotile_mode(ubwc) ? 8 : 4;
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_MAX_CHANNELS,
 				    HFI_HOST_FLAGS_NONE,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 07c58cf3a14a..e8b5446dce76 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -76,7 +76,6 @@ struct tz_cp_config {
 };
 
 struct ubwc_config_data {
-	u32	max_channels;
 };
 
 struct platform_inst_caps {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 4e617176dee4..05b1dd11abce 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -791,7 +791,6 @@ static const char * const sm8550_opp_clk_table[] = {
 };
 
 static struct ubwc_config_data ubwc_config_sm8550 = {
-	.max_channels = 8,
 };
 
 static const struct tz_cp_config tz_cp_config_sm8550[] = {

-- 
2.47.3


