Return-Path: <linux-media+bounces-51911-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNDwCcEvf2k8lQIAu9opvQ
	(envelope-from <linux-media+bounces-51911-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Feb 2026 11:49:37 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF24C5941
	for <lists+linux-media@lfdr.de>; Sun, 01 Feb 2026 11:49:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 844F43001448
	for <lists+linux-media@lfdr.de>; Sun,  1 Feb 2026 10:49:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CF6232F762;
	Sun,  1 Feb 2026 10:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J+fSOL8o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LXonr7KX"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDEC329C49
	for <linux-media@vger.kernel.org>; Sun,  1 Feb 2026 10:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769942960; cv=none; b=OJU6faTSz7XtZKXhcvNJ1rcF/PWa1JGo6KlzP1+hHahMhHaeRp2WADr4siiQtPNT+YzvsrW4aQ8KBf9DDtCwgKdM4WhIPgfpCyiWk7K6VdAzERFWzQRF/HAYFIyybErW/KHO+Kz/w7WmzzW1nY8AKSjNxqGML7/MCcRUMoPWH3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769942960; c=relaxed/simple;
	bh=32YQR180l4XuatpViT6nfN9ULShKtuaugvJ8/48mdxQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AAoy++s264Pq2N+gpsLlBeqtZ4corxGYW+5nQpMi+UTOkDKOUhdTYFL4nY97tyVBfV5YHol1W2JR8FTnmVJyKMmuA+h+tPANVKQ4QlUD4Kwxx54yKZo8JBgNpy++a+O0Xlsjv7iigmWvNFAu4I0Xw4zY8AAq/T97KeMz+EuRoS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J+fSOL8o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LXonr7KX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 611AGnVr3842737
	for <linux-media@vger.kernel.org>; Sun, 1 Feb 2026 10:49:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M1pl67zhaQRIlZ7r7pA0ZyoUVVuJsyuZALZX1rr0pn4=; b=J+fSOL8oecJ7htUY
	rnOB6a3qU6Xuj3iE/3SWCU8jRB2OA2RaeKEc8TqCusqzgO6Y4g1WsoNPxvzZ7R/L
	nkIDQJiIgkeNh+b08w7MB6Dnr82x+gNiS9/WAEmiYmJ8BDdNzmKLyIAkTBQlzaA/
	6vh+yuz/0sW2MCaggJbwgzfoA99kboaLhAmXwtxGsE39MOGQursySv8NHmstUf5O
	HG/DjjJrL+W1EHj/iRe/Bu4x0h49lsGDxATGmUP6GZdaUioNNU25OqlQnIlclQNC
	k9XATVdbJZUX+u+LRaFibeloS6u/sOO+R7tqtzMyyY2jFiv16Sq6GuH5akEON13z
	gpCfnQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1as4tfkc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 01 Feb 2026 10:49:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c52c921886so417133485a.2
        for <linux-media@vger.kernel.org>; Sun, 01 Feb 2026 02:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769942955; x=1770547755; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M1pl67zhaQRIlZ7r7pA0ZyoUVVuJsyuZALZX1rr0pn4=;
        b=LXonr7KXMKu6OjLrpKR9QKi1L5El0DwbLeoVB9wkez+a1rAahvb9Zc9vem85VhoTi6
         sSRFGwPhku/Hry1htGNrTKQa31j8M1mthvB2MT3r8BxQBpWl4JwJq3xszHCgydcG2Gka
         TVgFQRJ2k7icKAiMa5gr2aufnaMYb6dBL0sQkgnXLVk6wwOoBmbOJVs9nNZj6Of+DKho
         gAAUc68Gk6I7B/HLFZzVMiBdG/vmtBgPrB8azncs/PSoLTW48VX7PXMvf124pbsSY1nZ
         rQzAT47pe/0We2H9mhSooOjmX2kN/6NcFdcQR2dk8JqndoMDunzuC/w0TTHqan80tmRY
         wvZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769942955; x=1770547755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M1pl67zhaQRIlZ7r7pA0ZyoUVVuJsyuZALZX1rr0pn4=;
        b=TIshSjywKW/Xvhab/nvCoKJGRFgpfHScNwiLcX1J88JJFdYqc8iKBxf1cv12OGkpnJ
         Ox8YgnhtICy4cLpuTJ8WLmtZU+cF9xEXu5mclgSbGIruvZBu2ZNES3S/eOlKK8LexuDT
         lH20SnaAMKPIn9jzMjtwUOkI00nhdS/OpR9hSzwKp3CpKPGtzfvSAx5uYNmBjwkB8BTE
         9NX6UnwBwH6jKwoKIACp0Y46YRIoD4S03BgCZ62igK8fUag+uBxzw9vJ4ZNsLsoMsOAo
         WjcIcle8NtrOycIp/FDw4j5ewzzv/BGEU7dDbZZ06RkGTICKtkNug2xkd0m5PLzJS1cb
         nsgw==
X-Forwarded-Encrypted: i=1; AJvYcCW6skx/ynvk0qeFqoZnP2DQNOWw6G0XPW5MhD3rgG/y5wWGShCVkXIaqEZtcW+sKMKrVvNi9y2PoL0HlA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt5VufDD0TqZaT1GNJSQn/TeKDgQBhdnqF3AZVM1Wmbpf2NLmm
	+pJmm69h2nvRHE8t1S/CijxHdH4HW4OJrpNydkQ3qPNRZ/Ajpeu+Jqxcy0lplYe3TEx5VDetnGq
	VytPvhYavAxiJyGb70CIj76UTMVnCiM/tARGM5YI2XQG2cE1Na+i/jkame0w8FNXeeQ==
X-Gm-Gg: AZuq6aKjcmBhOe3s6NkweXR8aI3OeAR1K+i1gnpiEASKE2JuWh+894PzZLumFz4goWD
	qemhtMtG2gvt1iS8qosImo7ki2+B74QkJLxmbKeAcpeLNrkgkasVeudu8jzoWLjb3N2ReDj/Dlg
	Hxe1e7WXpszbPxBMmUlyWGslMKlJpT439zeCHm1Ofg9a8rXfCcXXL1AdlSUwGOsHoDXG7swbK1w
	pu0HeargXjEYzc58a5krd685JmeMqoykofMPxpu+OxPwRH0U9PmuCQ4NsCT45XdRHq4iz6kVl4W
	Yxnh8hBnChgbzzMhR8N7KiWciQsqXVKWMBJkPftE5ElOHdMkm9WOQdlnVXM2dOyS00hTVjgSxkF
	ghxeBDfofz9u8ZOrTgI0+oFdL+ywAiVdEGP88UaZaLNF5J2Dlclq8eq4kmoEeALfGTTErLTXt5e
	xkQ2B7c8C3SXC/OVE6HMg4WcE=
X-Received: by 2002:a05:620a:2906:b0:8c6:a85a:5204 with SMTP id af79cd13be357-8c9eb364f83mr1127875285a.88.1769942955063;
        Sun, 01 Feb 2026 02:49:15 -0800 (PST)
X-Received: by 2002:a05:620a:2906:b0:8c6:a85a:5204 with SMTP id af79cd13be357-8c9eb364f83mr1127872885a.88.1769942954578;
        Sun, 01 Feb 2026 02:49:14 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074b7a8csm2835006e87.77.2026.02.01.02.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 02:49:13 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 01 Feb 2026 12:48:59 +0200
Subject: [PATCH v2 2/8] pmdomain: de-constify fields struct
 dev_pm_domain_attach_data
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260201-iris-venus-fix-sm8250-v2-2-6f40d2605c89@oss.qualcomm.com>
References: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
In-Reply-To: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=880;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=32YQR180l4XuatpViT6nfN9ULShKtuaugvJ8/48mdxQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpfy+kyu/4kaubF+LUVuH4Re7eRBOaxduY4IJPt
 cXB0D862a2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaX8vpAAKCRCLPIo+Aiko
 1aRuB/9WBlRYvHMHWuVOGRyjcbOrZio4cJ42F43gS/VLCY0xeqGW/Mca12KWFPezXuLAppc+RUn
 Ku4AIG1IbCuKx3vVrZz24t619lL3DXZLWKNWR4O+bgiYys3B3BZiwpQ6UdAHcz4EVEQAO4l6Xxz
 qIM5qoSfNUCS9mex4aqDiUgyOW4KpIAMyTAsVyeaE7/2xDrvmJW+cPCkDKFMdp5RputgCBc+qBh
 7VWcqxKMpJ0cc8eiGwHznJ/eFVz9f9YGZ1OLRwNN2SHdJ3Ah1dMWCWo/ij/o0f1qimYu7/XwE+/
 DuAPT+2YNHGocojIFbyT6n67q06WMtGWPpqD/NHN8Z9B83Ph
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: nDKlM_7LCONIx_T5uGCjigJISG0nCiPW
X-Proofpoint-GUID: nDKlM_7LCONIx_T5uGCjigJISG0nCiPW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAxMDA5NCBTYWx0ZWRfX3izj9TxtxeTI
 W7Gq0UJD+ReUyKwR/6Cn1bLS5/op6toNi/Nv12D44FOsl0/zvITqL+ws5Pk7ow1zBq3D2bftnMJ
 ZFwlK0mBopTs4zvDv6Gu0Rbce00S0iFjTaLX+PSM5io49Uu0j1Ft5v1FieZtfXPGxgmGztMrJy5
 l8OFKUcI4SOyQ0yklJ8mKaBTao5+0t2W/YxSvYCFsjeBGnsTpM0yCxTX36SW6/3eOk3kVQmflij
 GnffmRBze97fu3FKVuILcFYMFXDNQqdETPrJwzEerl7fBqR+qgrlt7Cacbv/XhLHZ2w/0GhpGxU
 iFEyxOXVJFeo+rCFwK+W67Xja8zNk04gVkxBbBlE3W9MuqmW3Wu2/FSVzI2qcM+1MUnYigTdqma
 odmBnXRXyFtCEPIALUU4FELNJ2AWiv4MjjxRYu0ksOO36uN40vsxTatqRNP/kxhYye/K+HfHUtf
 FRUHZBqliaQx5H3uqWA==
X-Authority-Analysis: v=2.4 cv=bIEb4f+Z c=1 sm=1 tr=0 ts=697f2fac cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=0MtQHd9Mo8yxAPGUVWwA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-01_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602010094
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51911-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0FF24C5941
X-Rspamd-Action: no action

It doesn't really make sense to keep u32 fields to be marked as const.
Having the const fields prevents their modification in the driver.
Instead the whole struct can be defined as const (if it is constant).

Fixes: 161e16a5e50a ("PM: domains: Add helper functions to attach/detach multiple PM domains")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/linux/pm_domain.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
index f6f6d494f728..b299dc0128d6 100644
--- a/include/linux/pm_domain.h
+++ b/include/linux/pm_domain.h
@@ -49,8 +49,8 @@
 
 struct dev_pm_domain_attach_data {
 	const char * const *pd_names;
-	const u32 num_pd_names;
-	const u32 pd_flags;
+	u32 num_pd_names;
+	u32 pd_flags;
 };
 
 struct dev_pm_domain_list {

-- 
2.47.3


