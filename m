Return-Path: <linux-media+bounces-60747-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHoZMDBH/Gk0NwAAu9opvQ
	(envelope-from <linux-media+bounces-60747-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 10:02:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C7B4E472F
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 10:02:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D61B3034577
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 08:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40E433290A0;
	Thu,  7 May 2026 08:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bMA9nIsL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fHM/21RK"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A143B31E841
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 08:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778140953; cv=none; b=MpRQWJKYIipSFBRQVhx1wivh2qpVElOU6v5GfqTYW/7wCUGtDVuJ8P4R6JrkBAPPf2dY3R6flJHs0aIZ1YhBF2t7kH9lxRj6+F+tysoetOmRNi1nj0q3jCM9CXTXR5mP08DxDwQQ0PKtxyLluIPPWiXrdQZ30ivJwO2MiAOaeMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778140953; c=relaxed/simple;
	bh=fWCWn4DKAbxJbMQ55/WJyCf/z5nsIopkXBwEjkA/RCw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uccyd1SQ+obxqB6k73AnDw7lMRHMZDV3BcmneXNbZ4VIS/D9nWO3kH67l+UGYuDmm0eI5wpj788Em6m9Vlpe+ZtoVZWnmtgXD3MRGj8RsZf3T0yne9DPBFLidx+5v3S7U0QcJiOR5jaIn3oQTdYtNgbRqzLLvyeDHgDY7rYleck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bMA9nIsL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fHM/21RK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475wTYw1926229
	for <linux-media@vger.kernel.org>; Thu, 7 May 2026 08:02:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uDM5x0G3BeJBlZvuzxy44IohP/P8rL00g506vuvpl4c=; b=bMA9nIsLUBpSoodC
	d0tMJPtvfYgT921+6rsG9vWTxr8oGs7wPHYi4ZLz/iZ25je3yN7kWnwVtZ5f9OdM
	FfTXOxvBsvhG1rFYifyuVQJG5ore47/MtqRWi/afr9KKdvuKtPmtM9Sgan1diGa3
	fHqrupKxypWKEZKlfxEKPx0J4GuimDPnjeNblQlSc/KVCDJOXbHJNwBD7mw75vX4
	t4u7+nkrvD64oJNB6ZY/6jyb5oX98BDb6YqMFQhApIqf2frM/nY3F3FZj7SKh5y8
	J2UT6ZyNo+fhh1nKcIVjivqZUrbkCdoIc+nttc38cDZeQBOjYK8gdpNgUri/nb3j
	H20bHQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0n2g8f59-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 07 May 2026 08:02:31 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5753c3390b3so77867e0c.0
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 01:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778140950; x=1778745750; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uDM5x0G3BeJBlZvuzxy44IohP/P8rL00g506vuvpl4c=;
        b=fHM/21RK2hhpD20ygkPOtIBMw41B6dUDGFRKzOW2lkzUay05lEZpfyD9mSlOhlG94V
         7fvjpCg4egORH+zv8xvfT1VN1Vt7qXhJbgWI/ydKahL4yfefQqlgWcvkxdLGeAh6Z6x+
         jQZFsbV7CuIb8RgRejlhrzQR4hFKVjTGJIuJ+GQG+4XHtVkC03CNQXt168zlrsNWM8hm
         mwpSQupatwQzbhBj1QtPKVDov+2psZb+QqI3ammlgF0ZRJqRsoMaW2qi/t+7e4k4Xywo
         PZt/IndBAfVu9hd0PrayejXkqsoDjk7wtfWjag52QGPyFPZx1WhJijmtX232n2F/HBLU
         tV2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778140950; x=1778745750;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uDM5x0G3BeJBlZvuzxy44IohP/P8rL00g506vuvpl4c=;
        b=KIMFCq0H8bueozqvTnb6HlFBKNstAqFISoLraOX6cTg15BxKidzZMVMhFtBQq4XsZT
         XmIfQ3kwy4ym0RuKaEriZjBT1yGT+vLSid0ILeZbkXi7Xs+uS+rFoR2Y6cBb283k0rOi
         0jALtf9R+mayXs0RCE26W0TcfBZ1g/XA8m1M9sAphFcH2LtoTTmgMrCUds/C0xALB1IN
         d657Ji2Sfm4D83EJNyc/5SeDO0E8pd8Czdv05Ext+hgF/MJCkMn8yhdJZNVBxcSM8PDk
         qzc5IXFOPVU1WzcCcex07p4CvZs10I75r8bDKKA+buSCPN/aWAcTrjdVS4jF7+TSFRhO
         uZJA==
X-Gm-Message-State: AOJu0YwUfEld5BMCfLqyyxDadbLn3K1/8u5Bic1X8M4gL1+KMn4fwyc6
	INJ49PvN0VpHM7N0xx1LNRYFFpOE0WiLk9DPNEtYszr+EwPdbPLP0v9tR1BHeS+VH9cQUVmbkUN
	fr77J28GdBDAJ67vJ4J5Snb5d/uis9VctTOztdGteMGtJrZanRrtjtkbq/nzuNrkrhg==
X-Gm-Gg: AeBDietAhm4dKTUP5uY0UNE4kuCTsCBE6587XYZGeXejDWAQbv8JBx94ojaKJRE9Nfd
	o2lo/vgLlH6z5Y19RgPOWnwt4yv5+iDO4VkdfQ02Lu311GUy1hQefGvL9MLPPbRxXo0iJsaST0v
	+x2JTDYrjYIRLzxuiNbwZpb8Mgz8/isc/T5Wd24eBqaD0bJVQr8Q2q/NAz+akfkpZLjYeeTkm+4
	LTv3HjRsYj6i5Oq1wNPJ0BZyzeHHsiXUXfA5EEWp/HrR53p5D0tPY8Uqozt3vOtGi4TsHXOLhVb
	DtRLWwnQanVO6pJyNNE/OXMxc+jIh4FmmOe2snu8Nj+FwK9WQiwjURsMsis99tTaZ6OP8Y6OuOB
	uU2hBqB8hqEgBF90kZZcMp2wLVoJu2Q65fkz7tSmytWcYwWv7tvZnbp+BxFwzEYH1JhKkfJ92AP
	6Y/5rxTUi3LPZ1xg==
X-Received: by 2002:a05:6122:3b82:b0:56f:8cf9:33c8 with SMTP id 71dfb90a1353d-5755968732emr1762267e0c.2.1778140950040;
        Thu, 07 May 2026 01:02:30 -0700 (PDT)
X-Received: by 2002:a05:6122:3b82:b0:56f:8cf9:33c8 with SMTP id 71dfb90a1353d-5755968732emr1762261e0c.2.1778140949657;
        Thu, 07 May 2026 01:02:29 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc8341e64b7sm51465866b.48.2026.05.07.01.02.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 01:02:28 -0700 (PDT)
Message-ID: <9afad9a8-f25f-4cc9-8af8-047fb46ae5ff@oss.qualcomm.com>
Date: Thu, 7 May 2026 10:02:25 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/16] media: iris: Skip UBWC configuration when not
 supported
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
 <20260507-iris-ar50lt-v1-1-d22cccedc3e2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-1-d22cccedc3e2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Wv4b99fv c=1 sm=1 tr=0 ts=69fc4717 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=dl9dPoTF8b8Ju4ANzBEA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: -DI-Y8PcF4laE2d_Ygj6bmp7TGKa5TAc
X-Proofpoint-GUID: -DI-Y8PcF4laE2d_Ygj6bmp7TGKa5TAc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA3OCBTYWx0ZWRfX4X19izuvMlgb
 VJ1iUfToD0wFgtuOnAHcwoZGSeGShJvvJiEuSNbMzQL0gdq3icriJBFQBLA8QYlAST96T6OAVDP
 Dd3NCWojOdE0Zp1VNyyphNCnODk97cLXMX10vImmtQz6iJCj72749zl645UECdzUowbrsrc0JXo
 JrZfu/e0/omaStmf/PN8UhG57j49QoBjHTROnxQGg7lgshFtghipRwbp2lKrZSr4cSP0onxLCas
 6vEFdG7gx9BUUf/RhqGMGg4ZDM/+a2NXo7RwLinq+m+BRHsc0uMlt1khab65MVfxWwSYseNfDwY
 lK084Dn7M4yvm9VVVdG4sWizFJL3LgInvHfmh6BXpuxWBov23DkRDWe18cthlFrgLrGSpZe/EjT
 jK5dqkcgS6tymRF/4Fzt64TtSnW+DrbwjXRbp1CGrwzpX1Xry3UMddzcdlI6JYPYEPcSJQz6v1G
 6mrir4DZdTMcT+wboPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070078
X-Rspamd-Queue-Id: 21C7B4E472F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60747-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/7/26 8:42 AM, Dmitry Baryshkov wrote:
> From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> 
> UBWC configuration is not applicable to all SoCs. Add a check to avoid
> configuring UBWC during sys init on unsupported platforms.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

