Return-Path: <linux-media+bounces-64951-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nU+TLpWTMGqEUgUAu9opvQ
	(envelope-from <linux-media+bounces-64951-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 02:06:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 567C868AC8C
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 02:06:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Qiyz549Y;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dxFTw7Dg;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64951-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64951-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 90F413015C11
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 00:05:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2380A1A682B;
	Tue, 16 Jun 2026 00:05:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7E81A6819
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 00:05:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781568326; cv=none; b=bPYE7Xy4zp0SlsYOgpu9q/NHbslEtM93d3HQyiLjKuefXQtndkwr3/4wNJOCKV4IHLwlNSQbHZiOzFpLzuvX88Aya0F/8ILT/8gQJY6OSoTTUeVF6DOXOPrFQs9tOd7j4Hu2m0SB36MgxHvGkDtIApfHiqxlEBodhs54R4L4JQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781568326; c=relaxed/simple;
	bh=rzyqQrKzvy6ldK9fhdbOvdhzBtzpiycrKy0NRCh1cXI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QI/wQKw71pgX74SuTozsToV2WQC+9qp/+jSpMzoOs4CH4nzl5KIp1rGRgDdJWmMsJIHIPLQmmhZzgem9hVdbMDSHW07Fh12ASICw665i7Pp5ABcxmUkVl7sDy2+fZgNapDCmqQldHgEBQxsBthKHJq1In77R2U8da9TTgHTHNCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qiyz549Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dxFTw7Dg; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FIwxHm881740
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 00:05:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i0Pk/65yvuq+3l2N+bYFXSL7qdsgACQtO5BE0On9j7Q=; b=Qiyz549YAFK8b5Z2
	zMlMCotrDFx/3AYIDcPFSj7wlIACdPq36R6oGIT1G64KJqaqBwibTYU6igtIknUq
	FgqOux1rJD8rUG3Ehx0Sxt78BZqn5TJRyfPb+YWT0vcDZRnIfGV0b2ruZ9gToMB7
	iHi0Y2vivDuKmeZb7Juwuw4zeuITKJGFP4JTYKPLCQSvTlsnvln+DGS1mtWlJOoA
	Io4LD+SbTlwgy7QXTwXyfne51QPGMctYUDl4B3x72ENbSGdGH6Y3nMk1pn9OmlVL
	E2d4+2lBsAR85AbskIpQxxCBxyFFgLUrpZscFKgBK/onkFitqi8xmIqZ9UqEDMqv
	Em3Cog==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etew0kq5q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 00:05:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915757be497so570225485a.2
        for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 17:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781568324; x=1782173124; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i0Pk/65yvuq+3l2N+bYFXSL7qdsgACQtO5BE0On9j7Q=;
        b=dxFTw7DgNHl9c98LG8QojT4tabVCjfcaOREePLGI/cAgGWYWc+zU875GdvYANoZpEg
         dU+7d36kpYok+DLxraG0dOWT3AzR9x1R3Y5y4sUMvpOe6znTerhCi52vK8as1n5RM0cV
         aEk1LJuIQ2NxPOhunbhEtk2bJNQ5XuM+oxNw6j6I6X+oEndxBrud2YRdm0um6ZpFna05
         9UOZCA5H7IMnrCr3uzg+G93jVBHVdnB6iaUtvUh3CdVosDqDv24YSCILtYT3OZIjfZRe
         JNn/55nCH6PuSyIwG3gODKZbjQxuATW4gAPYZRlU+FKjmHC5aae3anK+WfvL21Q1Q2bD
         NY7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781568324; x=1782173124;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i0Pk/65yvuq+3l2N+bYFXSL7qdsgACQtO5BE0On9j7Q=;
        b=bpew5CjFkFwQhb2cnuwXf771uuaD4q2Gu3BZYTZjDIrMs+aw5t6rrnjI7RmYp2asjI
         hm+erkWrp3QR1hE0BAnDLk/K7wh7gYhVOmyutL47be/d2Vw0BllhrKgpCqcXBZXAngjE
         zlsq5Uf4TZdoKIIseOOjkPxEG0nA5OI4Kk3zepdOVK5D+py4yLmP+g+UUl7fXHyYafHy
         lFQq0Jx2mbluFQrIiTC3tIJfsaP29bT1frs01IWgp687DK+4t7kACvztFGFz4JnzSla8
         Or929Z1/84ta3PPQCzjK9rqOZaKgc7etXHjBcx4itsBa6N9snvsTCtB9GQjgx8JYLpY/
         lc9w==
X-Gm-Message-State: AOJu0YxyCutpiQcuAsM9AnbS/XnkbxAGDT+7byqUSiTBWSoT24qeF/j6
	CLUjlh16GeP6vI6zzcm5THXmQgT+OvY5B24M1q+XY7Pa5hZYQMTnZftriWguV/+IctBZiar513G
	69Q+V3xvKuLImlk1lMmMP+9PqqLx3w0bOVe/wejrYJVeeVzNsAcHjvbKYYEv6WKDcNA==
X-Gm-Gg: Acq92OHYNjEdmJJx38v2QS/XVW1ps1C6BEYhNxNNSUKUxJBGsSRNZT0Hat0PWApcxbK
	OpV+SV0jf9sRlDgZncw2GoMRsHFF6Kd3HcMhQauH5UDhK5zDWFV2enqrYV+oX9Mb48+JbODTFa1
	tEDseqs9CsPHUPhKTBljnBGQfMQwwEX7tqRcHsEkmLo8hfcLU6WjjnpTX0CfAeOqEmF8saBMFfW
	/HzZLMXjbGPUbYePYPziF7Fpe4ud53W16WPmUvSt1nDkeaTdgHKD35eZs568eNH0bC1+qnzbqlY
	n2nXy73clhqFBP0ftjpIEkrQdSh/+4zbez4c9hXaYVrCnC67HeDAJfm/o2DSbe43vhcXJKNh77m
	7Dv/XQLTfK0JVRK8kf2y6QKhC994aeweJeFS1aTM033mT1sVZ2vqayUlT0fNUum+v3ReSjWhYh2
	b9pno9NmX4/fJ0GUOH0zogtoN9Lsu8UTHB5OU=
X-Received: by 2002:a05:620a:1791:b0:915:d5d6:f1fa with SMTP id af79cd13be357-9161bd3a595mr2526503485a.31.1781568323569;
        Mon, 15 Jun 2026 17:05:23 -0700 (PDT)
X-Received: by 2002:a05:620a:1791:b0:915:d5d6:f1fa with SMTP id af79cd13be357-9161bd3a595mr2526498885a.31.1781568323093;
        Mon, 15 Jun 2026 17:05:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a7092sm3015731e87.50.2026.06.15.17.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:05:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 03:04:38 +0300
Subject: [PATCH v5 11/16] media: iris: update buffer requirements based on
 received info
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-iris-ar50lt-v5-11-583b42770b6a@oss.qualcomm.com>
References: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
In-Reply-To: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3438;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=rzyqQrKzvy6ldK9fhdbOvdhzBtzpiycrKy0NRCh1cXI=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ5bBZP4CSeHJjVu+9UnkbrdSaU99GB8mUpqk4r7jYlrLy
 emPU291MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAi83vZ/7tHmc3pNzteH1yu
 lB/WsXJ/stQWr7SQKu1vpxe/bssysPphvtbtzOecXvc9jDdrFGbpbNje8t9w61+P7b8dJZljjp8
 zdb155Kp+1P5lauFGFtphZ3yfXDx5qjVGJXPt3cqTxh8O2ebOjnOo12mu47b/eqgwdfLlnYvExA
 Uyop/cmqX1PTCm/0IaJ8/1pD1P13GcWKDn05Ztv8bU8iKzcknho7VpNQt2npMvFOTeLciuVxGkc
 6PwWO2lW1ci8pJ97zXNnsX2/OCBN/J7iq46u7IJS2Y6qzhmrn6YLnjXxzhzt9vcQ/WZCxk+PUt1
 UXI6k8jI/qLznnb7hE1i5g69jFHesXZ3W1ZHPlIw+rgTAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDI1NCBTYWx0ZWRfX4d5WVnEx7xiB
 fn6dIwBv21uG94Fhtkjviw9f0SOkLIOTM34//0KmKYUa8hrn0Q6W38raOUQ9D8qz+6NXnAL/LVM
 Dlwixf8tcIo68kyFbo1V+C58QW/z1co=
X-Authority-Analysis: v=2.4 cv=QLlYgALL c=1 sm=1 tr=0 ts=6a309344 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=_TRJU0tGboi39qq34nEA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDI1NCBTYWx0ZWRfX7OFtuhMWMWfq
 7RQ3iARmq8tRxSTQGoDmb2o5D4gfkeRqmMqu6VPDg9caGchTyGxn/MM+Of5gjTLPVubDds9YVj7
 moCBKVMkrXn0XO77lDZncAm/t6PVyy1QEm5hxAQxnMbS+XiAUzZebAq9NR0oaGYJMPzxthDLbxy
 6xTF1W0Tw3mH3J31l35zGS4Xy2pv8/uMEnOf3SlemOZIjebAZ3uYqY118KCHAZa2JjF5FYk8MYD
 qpnyIFO4Q2mS5efidyhbFSdlRRWhVDKK9ZggRUTkpk31Tlv/EaVRUomJbo9XSsf2PMHYFTzVjNI
 96mFnD9jOXac/9sE2OsY9eBmldwpdZDgEEXWT19SqbkgwvLEWLBZFTJBsz5eif/o/rpJC3/C9yb
 PSrUKvZVrAqmXWoyOGsIQOHQkjuJLhB0uz/1gfTEguusw6LY5R+GqLR01ZgeEqQzhYOFtHymDK8
 ZVjwxlCBz0p/hkYuk6A==
X-Proofpoint-GUID: MCeLtsXffvCGr0NqzGMdepsLhu4oSV_Z
X-Proofpoint-ORIG-GUID: MCeLtsXffvCGr0NqzGMdepsLhu4oSV_Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150254
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64951-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 567C868AC8C

Upon receiving data for HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS the
driver should update buffer sizes and counts from the received data.
Implement corresponding functionality updating buffers data. This will
be used for upcoming support of AR50Lt platforms with Gen1 firmware.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_hfi_gen1_response.c    | 75 +++++++++++++++++++++-
 1 file changed, 74 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index 23fc7194b1e3..896953ea62ea 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -533,6 +533,79 @@ static void iris_hfi_gen1_session_ftb_done(struct iris_inst *inst, void *packet)
 	dev_err(core->dev, "error in ftb done\n");
 }
 
+static enum iris_buffer_type iris_hfi_gen1_buf_type(struct iris_inst *inst, u32 type)
+{
+	switch (type) {
+	case HFI_BUFFER_INPUT:
+		return BUF_INPUT;
+	case HFI_BUFFER_OUTPUT:
+		if (iris_split_mode_enabled(inst))
+			return BUF_DPB;
+		return BUF_OUTPUT;
+	case HFI_BUFFER_OUTPUT2:
+		if (iris_split_mode_enabled(inst))
+			return BUF_OUTPUT;
+		return BUF_DPB;
+	case HFI_BUFFER_INTERNAL_PERSIST_1:
+		return BUF_PERSIST;
+	case HFI_BUFFER_INTERNAL_SCRATCH:
+		return BUF_BIN;
+	case HFI_BUFFER_INTERNAL_SCRATCH_1:
+		return BUF_SCRATCH_1;
+	case HFI_BUFFER_INTERNAL_SCRATCH_2:
+		return BUF_SCRATCH_2;
+	case HFI_BUFFER_INTERNAL_PERSIST:
+		return BUF_ARP;
+	default:
+		return -EINVAL;
+	}
+}
+
+static void iris_hfi_gen1_session_buffer_requirements(struct iris_inst *inst,
+						      void *data, size_t size)
+{
+	struct hfi_buffer_requirements *req;
+
+	if (!size || size % sizeof(*req))
+		return;
+
+	for (req = data; size; size -= sizeof(*req), req++) {
+		enum iris_buffer_type type = iris_hfi_gen1_buf_type(inst, req->type);
+
+		if (type == -EINVAL)
+			continue;
+
+		/* on relevant platforms hold_count and min_count are swapped */
+		inst->buffers[type].min_count = req->hold_count;
+		inst->buffers[type].size = req->size;
+
+		if (type == BUF_OUTPUT)
+			inst->fw_min_count = req->count_actual;
+	}
+}
+
+static void iris_hfi_gen1_session_property_info(struct iris_inst *inst, void *packet)
+{
+	struct hfi_msg_session_property_info_pkt *pkt = packet;
+
+	if (!pkt->num_properties) {
+		dev_err(inst->core->dev, "error, no properties\n");
+		goto out;
+	}
+
+	switch (pkt->property) {
+	case HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS:
+		iris_hfi_gen1_session_buffer_requirements(inst, pkt->data,
+							  pkt->shdr.hdr.size - sizeof(*pkt));
+		break;
+	default:
+		dev_warn(inst->core->dev, "unknown property id: %x\n", pkt->property);
+	}
+
+out:
+	complete(&inst->completion);
+}
+
 struct iris_hfi_gen1_response_pkt_info {
 	u32 pkt;
 	u32 pkt_sz;
@@ -657,7 +730,7 @@ static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response
 		} else if (hdr->pkt_type == HFI_MSG_SESSION_FILL_BUFFER) {
 			iris_hfi_gen1_session_ftb_done(inst, hdr);
 		} else if (hdr->pkt_type == HFI_MSG_SESSION_PROPERTY_INFO) {
-			complete(&inst->completion);
+			iris_hfi_gen1_session_property_info(inst, hdr);
 		} else {
 			struct hfi_msg_session_hdr_pkt *shdr;
 

-- 
2.47.3


