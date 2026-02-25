Return-Path: <linux-media+bounces-53419-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKLWDQ1cn2lRagQAu9opvQ
	(envelope-from <linux-media+bounces-53419-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 21:31:09 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD4819D405
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 21:31:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 18F1B30151DB
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 20:31:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 735A52DECA1;
	Wed, 25 Feb 2026 20:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="obtOg1NM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C6Qi5NkO"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEED12DF13B
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 20:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772051463; cv=none; b=mYiG3XYP8zrCGyzhq0rLq73OJCHA1psK4ruLI/KXmbFnASZl+WceuC6xkSgcoC3wFp7oa7ZrEq8QiPQedqg+tNZK+q+GvpQKNkSz/rvC4oqWyUNDFQqYQwVNKNUjxaVSAgQ8ED/6RPMP5bNOTTCMsU4IKp4UH2QFse+TdcmGaVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772051463; c=relaxed/simple;
	bh=xCjeBcqWBHugq6NLRZMoJ+XQb7URgwqYCP6Ukd7ZBkc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XkGKbHnxjuPpzu2bSFakFIe/yZSpO8T/hLpFprSUHEJk7GqECwwzrSd5qpfX7CnZ03yNyNhbkElXhZU1JZn1uofn7gbnwk7zr+LFg/vEg1uqepMqGO5qWI1Gd+5y5SqrG29W8ifuezb/ePt9EuocllE4fJ1DpsdyHw0gWy/5GqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=obtOg1NM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C6Qi5NkO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PH4gSc2561036
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 20:31:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=dZKL7MYb3JBhvdpg5or1kM5+xybaZESjzxs
	xIWDVROc=; b=obtOg1NMDpG+DgTrWgMxVZonegDzM0k8sWdsr+yXn43J6v95bbJ
	QR0jS+rV7Oce784qG0fnwtbr1bFCt+fqukJNc+gZdduY+DBztH71LZ/w8R0b/GlX
	XbAqokMXVa1dr3AmhMJY7M2RNzeYbMyfd+KbVV4dnCmD2Q8XKezY+UryZnV9RKA6
	74dhX6nV/KdsOE7jk971D0TUCbq4acOP87oVu9bGu3BEIaW97WBHt5jy+sCrwi2B
	4s3Q5Npb3Xl0q0qIdiw3xSdiQT35o4MsFQ4ZVdPa3tjfOdY5a6T0YSKAtybo2YDx
	VrQO05SjcRSD7BSc7ZUK7pQHMkWgA1WxCRA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj55srk8x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 20:31:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c881d0c617so17074385a.1
        for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 12:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772051461; x=1772656261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dZKL7MYb3JBhvdpg5or1kM5+xybaZESjzxsxIWDVROc=;
        b=C6Qi5NkOrqyZCPOxfRkyC9BSuy/kr36A/uQmMv1fsqfyo1Z+F93AF2cP1FFYvmFP8y
         dkTupVwzp6xmNw3VKguxO4H0ioInFGqfAjL5/gV3se23uYVwnaeS7ox1d/jTnc5WhV6s
         xNTlhLdJrZK0dqkmUxH8HLcDIAwxsQCRnvz7XIR7FU7cWglVQHNgxXXQDaOEjp1j4ewV
         qVSknEMfZnKfeTifpZuGx/9UAl0Djpclm7ymtzsrReLANRAXsP+Av5t8Bb+8Eh3Ae0wO
         NKQawNbWGanMiFj62+zXS7geZs90s1BOjBkubLNG5NuDUqRfa6C9mccpRo817Pm3LaOM
         3glA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772051461; x=1772656261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dZKL7MYb3JBhvdpg5or1kM5+xybaZESjzxsxIWDVROc=;
        b=r992EkbOPf5ygka+gWSM4jyV+hG3R12fOKAzx2Tre9FGAIpLkPFR/7LbDF/tbowlMe
         hhRS4JKWogf8IQnkcAMDzYDQ67LO77AheJHbaWrULtqMCzqn+//s13LTQN+o8MJFTcZO
         uXCbl6aqLQm2qRCD4kGiP5NOSan3/tZTo2MY4WeMs33Gh0Gi3CZhobLqQZH/kukKzFgb
         G7aOaYt4+d+ypnGuMsWN9KWzNMXjNiF27o7GU4yellQk0fZT628+R6KhXbHSLO8+DZl2
         KhoalB7A3HZZJi5CdTcsNguiMLFoF3H4yoet81NzkuK04smmMb/RT6BL+wFZZ+9rrclS
         lf8g==
X-Forwarded-Encrypted: i=1; AJvYcCVSKi5bP1BXCagPJCI17zUHFC6vfMyhdUNyrbEESzy/NuujUgHtSrsksd5X7qKEIywnmxMxKBlLOXt6/A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxbufh54QkpLX97qiOspKuPf3mpKdvPwXh+y+wzL555cbNbAie7
	7FBUa9QqjgSw71B7BucYhYYeydZ6ajIn/6AExSbyHbfQqu/ntJmH1s6sqAiKRDkECGMhs+UF27p
	D4MeCXWBIebaH6uZSmVaIiN81lRE7CoJEunXyLlfdockGKajp9USW8a6D4BJ3IfyAPg==
X-Gm-Gg: ATEYQzzDJI3/v2E7La5DDDAPkR7caY7eTczECh2IRTpiHrCTauh/3/QMyU/xJ+NZ2Cc
	3B8V8PODiQVutfJbE4mWFIv9rI9pC3J+oz143I1s/ApkxqfLVAQnuj8rAhSlnirBmseaddA1egi
	nwPf6zmwKqFPtbQtBWFPAI8HsQX/LltkGzrMzbo1L1e2WhtGbsWxmo5UimaGfq1CVS1MLurufH0
	0myezH5Gk37oA/+hhrPhBfTmSMEW2Me5IaDTITEaUSX7qmXj77+CxCEDYssHPdnmmuYL+Kf6RhO
	UPUhJP8Ik5Hd9qBitlQ44bVvoytZ9eR8tvcZaC0BryHnqPH9Gl/gx4uGapgJZCK7HfBo5A8hhlZ
	5ijcMh4TalrQxciV9Rr7LQvlJByv3QMjtfocspAfUTHoH5ezY7exyr07Gj7uLEPxwNH6TYTbDMG
	Z1uS2Bo0QuJpy/1u6yZur2wBZiGVrCQ3X3v84O
X-Received: by 2002:a05:620a:46ac:b0:8cb:54d6:7ba with SMTP id af79cd13be357-8cbbcf2da30mr254521285a.7.1772051460848;
        Wed, 25 Feb 2026 12:31:00 -0800 (PST)
X-Received: by 2002:a05:620a:46ac:b0:8cb:54d6:7ba with SMTP id af79cd13be357-8cbbcf2da30mr254515385a.7.1772051460202;
        Wed, 25 Feb 2026 12:31:00 -0800 (PST)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fac06dd07sm43842a12.24.2026.02.25.12.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 12:30:59 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
Subject: [PATCH v2 0/1] media: ipu-bridge: Add upside-down sensor DMI quirk for Dell XPS 13 9340 and XPS 14 9440
Date: Wed, 25 Feb 2026 21:30:53 +0100
Message-ID: <20260225203058.40545-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDE5NiBTYWx0ZWRfX6pbC1TcObawB
 /GV2fO5YCj1fFvOuyY6W2XtLbG5KYLwvVA2WvaiU9k1SWyGYcqPTZz5kTm3IgVO5t9IL8SSLRTa
 zaoNMCHvlaIpOrEoVTxb+dzVGm8aoQkzJ3KimUEiF6+ZsTbjVhv7oHghJIBW5hjX+9Owto5cNNf
 A9GTPqg7p9WnYfdFcWCFUqUPxPwh4BH/hoLSVj5f6OMJS+1cRbfE4WS2DYtr/1PJFqRxPxhMdbO
 y/CviQINLXRZ6NTgFaZvLLVcm0C82PfgBhW702jBFlCuBRew6ZlTu12T3Q/so+/Z9loOAgs1vZD
 YyoOLbqqKHLkDpioKh3wxl0iHJEzbUa/rZpgnbFNdz0TDsbqofHfr/fDa1ivoAMl289jnUAdBfM
 N4lbsAs8dU3B0EYANtyP1i5LbMeJrOCD4bVGS2KZivnIqz+QNV4HF74MgODrrPCcP3s6a+HbDE4
 niSEkYPWNSFrC9ltyGQ==
X-Proofpoint-GUID: 4Z0RzoRoESnK2aL2erVYYOWeAabnQnu8
X-Authority-Analysis: v=2.4 cv=JfGxbEKV c=1 sm=1 tr=0 ts=699f5c05 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=20KFwNOVAAAA:8 a=4fJqxa_hlY5khsBZABoA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 4Z0RzoRoESnK2aL2erVYYOWeAabnQnu8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_03,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602250196
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[xs4all.nl,linux.intel.com];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,gmail.com,redhat.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-53419-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.990];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8CD4819D405
X-Rspamd-Action: no action

Hi All,

Sorry for sending out a v2 so quickly, I thought v1 also covered:
https://bugzilla.redhat.com/show_bug.cgi?id=2440581

but that turns out to be for yet another model. So this new v2 now
adds quirks for both known problematic models.

This fixes a regression in 6.19 + older versions with the ov02c10
upside-down patches backported, please include this in the next
linux-media fixes PR for 7.0-rc#.

Regards,

Hans


Hans de Goede (1):
  media: ipu-bridge: Add upside-down sensor DMI quirk for Dell XPS 13
    9340 and XPS 14 9440

 drivers/media/pci/intel/ipu-bridge.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

-- 
2.52.0


