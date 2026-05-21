Return-Path: <linux-media+bounces-62542-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0ENUGpJXD2o8JQYAu9opvQ
	(envelope-from <linux-media+bounces-62542-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 21:05:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D364D5AB56C
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 21:05:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9DD4E300A510
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 19:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9839401A14;
	Thu, 21 May 2026 19:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ImLba2h6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SZ+1SPsV"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03EF13905F9
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 19:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779390342; cv=none; b=uORNaS5NBYanhADu3nxYvwNM2pg6On3mY/LpWIZ+7bqMc4Rt71D213QDThy64gP24lQNnT9hIcgtKtHPGsAtfuGWF6jDCWZTDq47w33xwV/WaxBMgzzoWX+yFcTrm4c6cLMzJaVCjPCJqSPlnVIpOeM+fzWkh4vqJjdDUUuTh5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779390342; c=relaxed/simple;
	bh=hbJcDRHPyjMgLx8Gyjm4xl+QsymbPasbBLuwkiqhONc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=EgrWJEyAYcsnUHoDjn8fnG67KuA7ElYE9kmd4pbjEntCcSsvWL7YkyVXEWOXvm7AqpkbpW6suN3oQYTvlhuCaQMYYig35U5b+x3pfjnsOfE7tC5FOfDTmRXmTce4ha9z/W5hUV5dks4jZND1UKJXfdQpl9RVROb9qzOBPgRoAao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ImLba2h6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SZ+1SPsV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64LGk3ec374078
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 19:05:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6ErTCGEvIeEBIBey3SeuOo
	il8oPXaJeyio2Xi4hbqrQ=; b=ImLba2h6W2sSSK50VykOzyHgBbO/ODAqC4FFEV
	LsMYdcOt6f13bn5cYLhqPaMvYdFFR4A6PVN5qiidumPwpl6OQU95+VFFmQnqzsAc
	yni2jSfvePQAoe4KuiTmqkDhibuGvOVFaK9dYsjsMIaTHWiGdATYKr0Ra4JJHGWN
	ijOK7MDVflo13I3B0xaY5fm8EaMx0QzrnYCbVX2GszXlj9zMoaSkWRHCTauPPygN
	H6Wfp9lMxUSpHE8x1wmvibV0batNqdiZ3Kkbv+zAvx4INeeIjBAo5pJd6yeSgKAj
	Ky01VkkpPmA+UWgrRQXSEFnijRn84cAHaOjW6vZ1Ej8dlhYg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9vhbk8ay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 19:05:36 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6329c1a6710so3695770137.2
        for <linux-media@vger.kernel.org>; Thu, 21 May 2026 12:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779390336; x=1779995136; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ErTCGEvIeEBIBey3SeuOoil8oPXaJeyio2Xi4hbqrQ=;
        b=SZ+1SPsV2xRaM42OZUXPuihQT4eJe23/4anFOW2ImjRGBAM5O/i/qaeL0/z3eTbi3E
         wPvEQAyDRCTR4byMqR9Zg+jj5KQuxHmawVIvxQQz4NvOtpxio9yX3hPv1u7XSt4VdDBf
         Gqk182fAUc8TR0E6A+knVDaIDye8xtHVcndLW9Zpgtlrj0I5VY7uDaO2KUqswjH9udwJ
         dJMQ9lheXiDFtLCIBC2P2/B/XTiXvnHkGO/Ekm3kb8Rz/U9wcft37tSojLMrVrA2/oY5
         Hvo93HxKDTfQ5mCvITAq8j4nVM4az0hj0RrLHr7ZkfPZiYt7lNkMwX67kNP8FFGZGO+b
         HsIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779390336; x=1779995136;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6ErTCGEvIeEBIBey3SeuOoil8oPXaJeyio2Xi4hbqrQ=;
        b=dPgWKswM7KDt/pi+AS4OKBQy3Uirpe5SD2rZdG/FwTFdATfFfA3SEss+GlBOMqSNS5
         k64xU8L+IQRjrwZm3oQXXIF1JZpAsw13ubpmBhZE2wqK65Onym9siBNY6Qo/7DtzB3S5
         oubVBaNdpBrbJdxF4LVYWOTvMwXw3HS9Lkd4T11Cuu48yJSpDPuWSjK5Qtmg07oStz3t
         YOB48972EG9EnTOmkD9nGKGf6rroRPGmXK0tOvuY33NIYbscm64mgdU5M/a3MP2MY7xM
         uDFgGTghKAMNNLJj5oDgzIZ1gIHl8BOPrr78mCdfARAtuTDjJmmWa0kbnr95+SGjhxu9
         SsrA==
X-Forwarded-Encrypted: i=1; AFNElJ+br9s9AvMFcNK3PL+iEW6o+Gk9Be5rZGhyxe6fMMmR+ns/u+GA8UG5YPdJ79zJiXgq62x/7JXlqD9QHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOtmJppDwPbDAEH1W0dIHooeM6h0RlFlxxbZrfBlJx3ejKz7yl
	UbWQ6D3rqQWf8GEFkSaVre7iQZhZMxQLmEyvam8STi8wsVo7yTGNoZrb6yvgqiy67msNcYGg6BL
	xlfVD84QITSYYyZpK7o4tYhdZVy+ZfohHUoZ435UAUlm1XyRs3U5Qq5Nq3OZbl2FUpaulGECFIg
	==
X-Gm-Gg: Acq92OHXMWCm1uumex9qq5BvB4j3LB63lhw0E043h/G2SPCy2jX3QsSvn23BLvtO2uE
	LSzdNW+jh75BwWPqJO+2ZoaBDZxToie+WV5V82BC2x+SEr43U5SwLUGpMWB4YOsbXPET86m7nCW
	sK5XMOKsx9V4mD4+/ElSdm8SmX1suxGxbIM2NNsPcugxTex3lkscOk6n2PA+XhpEww/ryZTfACh
	ruZ1bca1bLoMeR8goqBOJkX21a/z1og4MEFPCkRCzpu53Y5iLCmovyBLhlfXGFaWRp7hpN7zQ/+
	CIVnSAhWqDNxprwk46IgoCCPdIPA+dwFfxBaK0ZJJKKmOlBLCtqdPlAtCcJI2GdBHK64ykIKCBM
	vXiZNFiC6H3Yvocc0gOD+kykmBxHTCSLg3lsAZklGHERbturD/MCihrQSGmvUVbPZlC73jZ0YM4
	Bv2xKuRYZxvp+FFtB7bY0e4uq2D84sfoimxp+r57Kdpt3c5i0dlSB33xx9h+olo6iaYnBPTptMm
	F0lDyGuCWV/mTsG
X-Received: by 2002:a05:6102:370e:b0:632:29a5:2b27 with SMTP id ada2fe7eead31-67c7151c86bmr157562137.3.1779390335965;
        Thu, 21 May 2026 12:05:35 -0700 (PDT)
X-Received: by 2002:a05:6102:370e:b0:632:29a5:2b27 with SMTP id ada2fe7eead31-67c7151c86bmr157529137.3.1779390335510;
        Thu, 21 May 2026 12:05:35 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdc87e781a7sm89309266b.18.2026.05.21.12.05.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 12:05:34 -0700 (PDT)
Message-ID: <720879ef-b07a-4e6b-a3c3-5233c49e3331@oss.qualcomm.com>
Date: Thu, 21 May 2026 21:05:33 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: [GIT PULL for 7.2] uvcvideo changes set 2
To: Hans Verkuil <hverkuil@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDE5MiBTYWx0ZWRfX68xFQcSWtywC
 fO/BguTo5pNwSwvkDQ8WM45mbtzV1VGqxa4LDFLfn+O3qgc9VG+Dv//eEFqPhYoxZOn4x6XC+eZ
 QL0g6RsyMb0bPxefvFZdkC/Xl4qItzqd5gJSCdY4tJaYlw2Mg69BCwrcGF1RzDrw1vc2AVn/OEp
 6dAG1awZxxoup6wwiQmUtn72EDRruWzTsDDoPAimmdL1ERHrslCWVRF1LETkk58aAnsybtWF9vm
 h5noYrzVWe7V4apMAkNzMC10qoTMcHN/377IDWB0LzsuyHD/JHoCYVfra97lBmWKExLDkvj87J0
 DIDkUW53NU+9IWmSzf/kimT+rcnCUQDyvHiR8dwJdyEI/Gum2IFB/bcc8PMnAPwzTyhUa0+dLlD
 nMmFp4oVgucuoAJE/x44989salkLw1EKWQujGa0wrckselHzMluCc2CvmEvLA8E6Q5/bhl5GTkR
 qCKRv6bem2H0gX+56QQ==
X-Authority-Analysis: v=2.4 cv=GYAnWwXL c=1 sm=1 tr=0 ts=6a0f5780 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=e5mUnYsNAAAA:8
 a=InBwaTAKhcPIC1lhezgA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: vnNEJmAv7aNm4UpTNtjPuO_PCrcyjwFr
X-Proofpoint-ORIG-GUID: vnNEJmAv7aNm4UpTNtjPuO_PCrcyjwFr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210192
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-62542-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D364D5AB56C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Hans, Mauro,

The following changes since commit dd9a02fc75cefc84024eb658c9e528cc97ca4eda:

  media: i2c: lm3560: Add proper support for LM3559 (2026-05-15 15:00:44 +0300)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/uvc.git tags/next-media-uvc-20260521

for you to fetch changes up to 4b32aa8f8b1c68ddb94d3c4d3e307156acafc321:

  media: uvcvideo: Only do uvc_video_get_time() if needed (2026-05-18 11:03:22 +0200)

----------------------------------------------------------------
Improvements to the uvcvideo driver:

- uvc_status_stop() deadlock fix (Sean Anderson)
- Avoid partial metadata buffers (Ricardo Ribalda)
- Various hw-timestamp support fixes (Ricardo Ribalda)

----------------------------------------------------------------
Ricardo Ribalda (8):
      media: uvcvideo: Do not open code uvc_queue_get_current_buffer
      media: uvcvideo: Avoid partial metadata buffers
      media: uvcvideo: Fix dev_sof filtering in hw timestamp
      media: uvcvideo: Use hw timestaming if the clock buffer is full
      media: uvcvideo: Relax the constrains for interpolating the hw clock
      media: uvcvideo: Do not add clock samples with small sof delta
      media: uvcvideo: Do not add samples if dev_sof has not changed
      media: uvcvideo: Only do uvc_video_get_time() if needed

Sean Anderson (1):
      media: uvcvideo: Fix deadlock if uvc_status_stop is called from async_ctrl.work

 drivers/media/usb/uvc/uvc_status.c | 28 +++++++----
 drivers/media/usb/uvc/uvc_video.c  | 95 +++++++++++++++++++++++++-------------
 drivers/media/usb/uvc/uvcvideo.h   |  3 +-
 3 files changed, 84 insertions(+), 42 deletions(-)

Regards,

Hans


