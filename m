Return-Path: <linux-media+bounces-55580-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gB3BAAO6s2lXaQAAu9opvQ
	(envelope-from <linux-media+bounces-55580-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 08:17:23 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D27B27EB2B
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 08:17:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E252302C5DC
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 07:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE09D3659EA;
	Fri, 13 Mar 2026 07:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RLsk2OC0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QmF9DOFv"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFF03659F7
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 07:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773385954; cv=none; b=jRZtift3ExVTBN6ZYnBv1uqEUH3c3AvSRqsuweMs8cxNvQO0Vy1gBvqrfCcMqCv5YvYbl+rB4pON6bJIWYBQH1qslKwNZiizQG8DYeq4wmqNRYZv4h4tdS5c429WJ+/h+yckVItmGqBDqxRI7SGOAgi/CJXAJOIspyiLZWQocRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773385954; c=relaxed/simple;
	bh=8AMzBbhJPBeUt5jt7kk1OhmLI6J1crW5JOlqSMud0a4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I3X9h+0xXaqvOgD7PxNZFzZo3+rI+AQJ0S6tcCfyoBjcJx6jjYoe6YATFbvNTNkYI2E13PTNAsxi/8R9xWqQUqH7aZHQRYdCimS63bec2vgRcI0TZAiipxC+NrByg60GDkPa7G7QeSvlF8AnDN8R8yMOF+J8D8/PErNFr06uFWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RLsk2OC0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QmF9DOFv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5th3K3342929
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 07:12:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n8EDnjQTGGFxIkB/AfhBobgmAh+JZlBOG+lFaq2bx50=; b=RLsk2OC0bNo7N+3D
	A6LIp8T4jpaIaRnoRoM9YjrVRIqzaWKmiMeC7BiiEjZ2mG19TUO9hXQ4FpywttQD
	hliZaeVumsW1Lb14JETZDpqlxuGlagWUEyd35ypA+FHdZEFqbAfcFMGwliYsfpQn
	ceq3F6Job3kCKufoUaYgWM0B8xga67t69ziZEey42q7QoEwW7M3Ps7tQqlFnKqZ6
	Ows4WOlQt8iF0GRMfbGSLaCoS9kAWuVIKJ8+43XmkFyjlMHNz24+mdwLky716ORL
	fmK5ljnRf0n0Uxi6GT29MD++yvuMEhpBDSmMJnqqVaSIcVkS5yXLFVu/u0a4bJFd
	8JBWPw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cus9w3n08-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 07:12:32 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-358f058973fso2061958a91.1
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 00:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773385951; x=1773990751; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n8EDnjQTGGFxIkB/AfhBobgmAh+JZlBOG+lFaq2bx50=;
        b=QmF9DOFvTMpNoGvBZ1BK5mbJy8tRyl8OEbZyt/P6mJuloJ6yZHKkZxpa/wXsBPr3ys
         LjDOS+991gb0XMbJC3PVWJWraG4FaegsyVN/f+heN4wy1KvTjTwRu15YfK7aeG1lE22+
         aTC5VAekVb6fOYKYOD0Dj1Al7qMSqIS+IMTJAn/SVi+BIXWWfdAzqWzfl8ZLXKNwJEh0
         4cqTqMl7HUGNhJcp8rPI5C3f3QgP3ENhZVuim/93ppoBSxRHnWMhhdXricyYs7ANvneS
         ajr57/6/RMk6GcqzTdWk8G9KN6Oaj0AgxSixrOuchqaye5WAKN/RBUMUeVkvA7bMJnGT
         TpfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773385951; x=1773990751;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n8EDnjQTGGFxIkB/AfhBobgmAh+JZlBOG+lFaq2bx50=;
        b=m4RkTzCbc9PDXd8qPjFEK2f5A39Q+mYS4vD4sUCfr5EnCNN7Ao9PIJT73iShSsVfAb
         lVUw0bYZrXmg6Gq2F8K/LB/t6YXoccU5bBxuntPbk9vYNNYubeNmQSF2HKcREKTbSM4W
         kvIGdoGw3+hpaVXqO0OMYmF5tWS9jZQU5bgZ02SCU5YpQz2268YlBzdO820UgIK1VaSd
         pF6R2/Uigl/Q7jdZhu71F2dJcTxNwYQF+IKoxLugQhcU6wrtDLcce7o0mdBxpoRZz2No
         D6jTX80uUZ8NACvCufyGxBJD1cZzcNpKBoo6NwMWG/x4hwURUeqU4I6n9jSQR3aZZFg8
         wqwA==
X-Gm-Message-State: AOJu0YzdDPwkqdPRzLteDIPifEV0YWdMREuMoOgcHJHsU/a+/hLnS8IV
	mvM8jIMgMuthwPyx/mJPxMzq5MnEuDGJR4/Z+2xTuOyPWmElYXXa2aAyopdgAYmfBQj7AO5YbWA
	+qnfDqgQ3xF8ZTq6WjrEUpE66gG30wXxPgeG+N2rxvJUaSF/NKx/YY07yIw2Xy9pvwIAA5p0w0g
	==
X-Gm-Gg: ATEYQzx0rLV1j9SJrAgqxwOblPDGDLXSBgvZmLMy/DYQUmeMToXuYVcA3p6HEskvX94
	CHs9d27uwSBarvXXH2B/tOZDRgAHqbvWTYl/eicAuuBZ0FHwq1+kZgav+zIypt+IrcyYuQjuVal
	7R6AtBqIXmPKI+tDWKYbPXL3wj+SS+rZFXl9GKEv1fZnYKWP1p5uCGxaaIH4ciUJAMa+QFXjKAB
	lb91Vejdar4cPA60amPz8CojeJ6srxxHjKkxuGzIgzSHlpned8DSSFBahDtdC1kc477TE/DcSTM
	9Dn0LbFe+yTrp7Ad0PubmrE0s1L9kGFLPg9B1sYoL/EzLBR55yXskW2paqIsxZ6RoR/lqw1qQEo
	lVCRw0rVSjBMGxFKdzHBptlTIKF10647M6eiSB3qGN080clrjfJpQ
X-Received: by 2002:a17:90b:498b:b0:359:15c8:e8e1 with SMTP id 98e67ed59e1d1-35a220532eamr1923675a91.25.1773385950536;
        Fri, 13 Mar 2026 00:12:30 -0700 (PDT)
X-Received: by 2002:a17:90b:498b:b0:359:15c8:e8e1 with SMTP id 98e67ed59e1d1-35a220532eamr1923642a91.25.1773385950084;
        Fri, 13 Mar 2026 00:12:30 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a245b3e97sm470040a91.10.2026.03.13.00.12.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 00:12:29 -0700 (PDT)
Message-ID: <36c3bc1f-99ac-ad49-8a35-85e6c0c7594a@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 12:42:24 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 6/8] media: qcom: iris: move get_instance to
 iris_hfi_sys_ops
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260313-iris-platform-data-v4-0-14927df4906d@oss.qualcomm.com>
 <20260313-iris-platform-data-v4-6-14927df4906d@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260313-iris-platform-data-v4-6-14927df4906d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1vt7dADsLtRFm5TyrfPZ_PCNVIdNYoVW
X-Authority-Analysis: v=2.4 cv=IIIPywvG c=1 sm=1 tr=0 ts=69b3b8e0 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ndT/fs+coltRyMHftQWjTw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Zf8dAvqNuctCz8TeMh0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA1NyBTYWx0ZWRfX8+eHmjzGJcmI
 5sIRDdfrYYzX9mcNRo+A+YPhmHx+MDVrxlkbtqZLFQ7XQwMBN+oGfW6449+MYHqalRcaCBD/pgC
 CAcIEXUtOkcEA9cNdLq8JTnbvb4FwstzNokT84qsWFAN2ax47WPQaNyVeG3oUqy4hIlB4Agaf8n
 +fSnfMOCq36ZQDqrw/pciLVO3AkwQ0ecwvCiIByblzVY4oQeIviltMA5B/BepVci98yyIjuFRi6
 yLeuhFS8ie9h/hiOsetmP/ev/X6scxK5u13eBEChP7F5h21A66L1hL6rJVzLgfb/jBauDCGzTLr
 rH26DQlROwZslsaDBMQoJKAtSaMQg4Y+S6/fqaTtQYZGF5pcQaYBg5kcgQZo0FHQFuSNgBkBYck
 +++ObP6HT3NuvTlNkmuFsfPCBqV4yM7twmBszR72CAEooIVLS/TGIsq6fHFg1PEH2EFs95B0GCe
 3WdPBLnN/7TPO8pmG1Q==
X-Proofpoint-ORIG-GUID: 1vt7dADsLtRFm5TyrfPZ_PCNVIdNYoVW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130057
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55580-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5D27B27EB2B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/13/2026 9:00 AM, Dmitry Baryshkov wrote:
> The get_instance() is a callback tightly connected to the HFI
> implementation. Move it into the new iris_hfi_sys_ops structure, merging
> all core callbacks into a single vtable.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_common.h |  2 ++
>  drivers/media/platform/qcom/iris/iris_hfi_gen1.h   |  2 --
>  .../platform/qcom/iris/iris_hfi_gen1_command.c     | 28 ++++++++++----------
>  drivers/media/platform/qcom/iris/iris_hfi_gen2.h   |  1 -
>  .../platform/qcom/iris/iris_hfi_gen2_command.c     | 30 ++++++++++++----------
>  .../platform/qcom/iris/iris_platform_common.h      |  1 -
>  .../media/platform/qcom/iris/iris_platform_gen1.c  |  2 --
>  .../media/platform/qcom/iris/iris_platform_gen2.c  |  4 ---
>  drivers/media/platform/qcom/iris/iris_vidc.c       |  2 +-
>  9 files changed, 34 insertions(+), 38 deletions(-)
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

