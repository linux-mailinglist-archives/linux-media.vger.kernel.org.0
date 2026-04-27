Return-Path: <linux-media+bounces-59673-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCQwNzhb72llAgEAu9opvQ
	(envelope-from <linux-media+bounces-59673-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 14:48:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2CA472BD8
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 14:48:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ED123301491D
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 12:47:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB7FE3BA251;
	Mon, 27 Apr 2026 12:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d4onTU89";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JWPD7G4j"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FC63BE144
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 12:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777294011; cv=none; b=i0z0R+94EEigcKJOA7pQMEzL0XQ5eB3JsesHGrAD0L9kTwVlensOsiqlxUUCcd48bq00gt9cR8IIEuZg3e8ouU7bKxLfRe/7U/SwAg2yL63cEJZiRwanzngYLm03lzwzTgha1TL3k3STxunMuYNWKVt/bHocFSnWmNIsc8BK9Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777294011; c=relaxed/simple;
	bh=us+Y4Cb7pFVSLnADy916NDIEoYZAuE4XXB6lyTKrzXE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TF0GcjqvwDYLxha2RezJiTcxuPW1DKYa1GdM/TBK5vauVm1/EKRSPCCLm7WkqiRnBo3Eaoc32F8m4oj6hpeDE4wSqP/xA0DZWb7lOKaMCrQ/aw2nMBgI9F8LfoxIRyd/0md4FKtJircIY28p1/DccrOZVOiWVV4HzWFhZ1jiHJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d4onTU89; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JWPD7G4j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TAtq1762194
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 12:46:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zpAVUiE0mWNRiDxsSieW36zbJskMY3EKSaK21P2YpUw=; b=d4onTU89SjGFIA92
	+Dw4xpZDQ6Tg8GvDUi2FEzcjwhlE8/TfgV/Xbt4kQIXZuyGCzxwEcwKjw20gItR1
	sh/trF/BOGYFIzf4SgDVFnMxdyPlKitrZGfdYGFB8bYucbK+TlTKOzHN+pzMCfHE
	OLvldclOEfDS2Ynh4Uu1SD6I3JvGYsPE3P3rEpT3D2/NhM9kOYqgr/5qoxZtXrsL
	mBK90fmUBxyOKJKv2W7CNl2IB3YzexdKgMxIQfT668CoZM+dSVmH+4+VHg+i407k
	j7h6Dg8ne/Uwj9h0hBUJu/3yJfC+Q+Wct+UwS2g1iCJbecYyY7/OoZzVtF2txBK9
	e18EFQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drpw9e3cr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 12:46:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fbc70cfbdso151353031cf.2
        for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 05:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777294001; x=1777898801; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zpAVUiE0mWNRiDxsSieW36zbJskMY3EKSaK21P2YpUw=;
        b=JWPD7G4jZwwfw5gCpH7kwworxGE4Wg8pOPtCfc4pQ1av8UpwNVAGtMaN4ch+xOBY15
         Vpo4mXqDWBe754KGWZ06IgAfOdXw9121TAxlH1R7WB+MEccgFNQSy2fJJ+t8suS1qhlb
         WVFLqCpRpSp4N40YQrjLjhd1J7p795XebIz8QuahxqX5gCZ8s/C+nATV+aSIUjDHWaJE
         UbQMpQcObnpf1KaS48ijKpLpkRXfawdVB46gXBiHT9qaN4gbzWSAdZ3/n8/qzCpEMyMC
         C3CgoQ9ZC37FB1LHoTJu+4nqn6arEIfkxIZZhFLG6E99DCgWKkeQM0mCVVNpvW4jrWHi
         4gIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777294001; x=1777898801;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zpAVUiE0mWNRiDxsSieW36zbJskMY3EKSaK21P2YpUw=;
        b=h5/tJW2oXWRQxk6K+Jqv+XMOxsvs8/pgehom565L1c/tg3xjgKcuNd5Ckgls3MwNno
         lYcPYZjMUB+eSZT5mIVMAn8GlsOcowcY2pXBFwwCvgZ0LV0XSsHzib0qD9RVADjnpW51
         LqaBmhzjbVWN9TCAg35P+QEhGU19OhJRX73lqo/1LbSEf/QEMAE/MzbrkP8iG2vgof2n
         LKYopgVS49yHKNpt1wLi7+4F4PpbHFNPOrYfl/w2vhh/KPqlpTn5qNjCqIwF6POvFnFi
         dMjv/9VzJQt0eZINRCYzp4ge0/2uvM3jh0PHwLlx1qMwabQAzRuNwH/od/xnl1xmqUQe
         pp/g==
X-Gm-Message-State: AOJu0YyaIh+x0DAjrDrfetqHZvWrgqLs1jmhtRQuxWkrSuF/a/+Cre+z
	cmdpwBzrgDbWhq3UccxwQYpXG9Mc0X/Z9MOoSeoLG4C8a5qmiS1oJjh3KJANHTUBuhkT6CLkk5S
	IraffG/+EnqfYCy/vnYYvt4wxeYIn9xfAe26jmSkcMCw5H0woB3SK+GqTl6CScCx79g==
X-Gm-Gg: AeBDieseawFU1CGJ9jKaYK9wVkzhB8UgZsr2YDCKh3alY611tN8RSzXb2p93ZKL9EgA
	cclJBTEMu4sDD3unVLGNG8lcsXviHZd8tOe3nKUGh43g2oK5HP/xeT+Im+GWOySE/HQDTdN1ZIg
	9zI/Iv7eXKMZASpUh9rBvo/tdWLyDVfW+SyOMY6oW5QT0UR0+uroohv/gG4BC5S6Cyp+5ha3wFN
	Lbn1+VwX7JiqMJY4xKWmG1rgIMRyBUovYe4Gkcj6ax61cvBrOkqLLs9t1Mff4DkB99W3SIkqHfJ
	GG6rYGqa56oW+vp5Tn25+VmneJ/ZTBWa47CFrobYeE6mlGB4YQwZDTX83zkvR3Tf4tXYdWC+/FH
	mNYLa7kT3vNmwUBaKx9x+4dqQg0AOpIZLYQUDb0UStC1I5Bwad2z+R4cwps+nJv44GVwONtgad2
	lYwl94lAe6rkgFi4/JD3wfKNWX0XU=
X-Received: by 2002:a05:622a:2449:b0:50e:6399:eed4 with SMTP id d75a77b69052e-50e6399f879mr479265351cf.27.1777294000905;
        Mon, 27 Apr 2026 05:46:40 -0700 (PDT)
X-Received: by 2002:a05:622a:2449:b0:50e:6399:eed4 with SMTP id d75a77b69052e-50e6399f879mr479264881cf.27.1777294000497;
        Mon, 27 Apr 2026 05:46:40 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:653f:4d28:6a78:a6ca])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1bd19sm1091496866b.37.2026.04.27.05.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 05:46:39 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 14:43:30 +0200
Subject: [PATCH v2 03/14] media: qcom: camss: Add PM clock definitions for
 QCM2290
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-camss-isp-ope-v2-3-f430e7485009@oss.qualcomm.com>
References: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
In-Reply-To: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: x-2GBENjXeYvIhTcjDu_kivDlbt9m4AH
X-Authority-Analysis: v=2.4 cv=H67rBeYi c=1 sm=1 tr=0 ts=69ef5ab8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=6k50daf3fveMbYCwvhsA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEzNSBTYWx0ZWRfX3eT1rFiR3tGr
 94XqC3gXJz3xmMHLHvSPMkeG7gaxpAts5RvHfWq7IbTbJ0wMQtnuHBVRo4CbpDDSrouFLLzMqJL
 YUv7t9BMsFMAbPnHXKNwBbc3GHNQ+lLlxvy3dukjLx0zEERg9TLQFkX9QlE30HuWfnj9mC/kPg6
 qPa6BEt+qACMWgMrTxqgobvo2DSM93ql0xydHG8ZLou6J35rskDwQ3uPNZ/U/lUlFmIm7ZybNOu
 2e2aQySAhAHroS5aIRLOSSkhiFMq1EW1Vzu3mSIZP83yZlgLOwT5ro8O6ejpbY3lQBHMxkvMXcH
 qvkJtDQDaUDEm11tCNlyrrAlDgqAZqL7IqJ70qzZ0NtJAz5YdCXhWplD8CAtDou5AY0DyYASDXW
 rl33Pxln2z44jUBrnXwVscuFwuFVCq+/xuiI7/d7WL9tNLAFxpnBPxCY9jQjFeJ2xzC52I/jZqI
 SQMdAe3Fm9D1oKugM+w==
X-Proofpoint-ORIG-GUID: x-2GBENjXeYvIhTcjDu_kivDlbt9m4AH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270135
X-Rspamd-Queue-Id: 1F2CA472BD8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-59673-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Provide the required CAMSS PM clock descriptors for the QCM2290
platform. Register the top_ahb and axi clocks with their appropriate
nominal rates so they can be managed automatically through the PM
clock framework (both are part of the camss-top group).

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index ca68ad7fc9ff30eae23d3baf34cf1ca642acf9d7..b2b0afc3fb5f597622f9b4ebfee2ec6703bf0890 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4846,6 +4846,7 @@ static const struct camss_resources msm8996_resources = {
 
 static const struct camss_resources qcm2290_resources = {
 	.version = CAMSS_2290,
+	.pm_clks = { { "top_ahb", 80000000 }, { "axi", 300000000 } },
 	.csiphy_res = csiphy_res_2290,
 	.csid_res = csid_res_2290,
 	.vfe_res = vfe_res_2290,

-- 
2.34.1


