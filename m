Return-Path: <linux-media+bounces-61705-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MO5HxUOB2p0rAIAu9opvQ
	(envelope-from <linux-media+bounces-61705-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 14:14:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 402FE54F43D
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 14:14:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D4CEC30C103A
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 12:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 289D5346AF8;
	Fri, 15 May 2026 11:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="atRImTyp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lud0rfCj"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0DE38F254
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778846375; cv=none; b=UWVEYeoNkByjeQyTczbSBsmZ8QP/MUdZxf10PzD3pe0unyR67NO+hHyunFpThHr2JDqXdrVLXbB9i2O8M6rHOcMQ0RgbJPI475C79yagG9raCO7m/pA3+VvyAlvxNFC5JrKDVbex/jp1GCQw/hnQV/rpvp1y6UoH55ysPoHlha4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778846375; c=relaxed/simple;
	bh=4Ws36Kh4YBbC0ww0Jy+xw/tAJtFPBW16pQwGma9xSls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a2dHncPn/PNYbJWzHLM90PGWCVvWuUsr1WTLm1gEvKOqSat2fUMci+4XfUrPev5sWvp7bwQp+Do9Tf9tFsSsemK5bYLYNdsSyCrp6YoZxC588iQb23CorwrV2Mmv7dHYxVGgYcZsrN8LlvJBWxFlJEkdlkvsrmI1zDrldHSNiTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=atRImTyp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lud0rfCj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBJdn03795596
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:59:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kb1gCwgaGV5H3d/jKwmfo6mOPiG1Fyfm04poCnOImZw=; b=atRImTypaWq+vaUC
	aoowq9ZGzAZI1YmvBE8zaMxzwNDLQzNrt0i5FwgSh5jvRBFwTQdmu3eQiqDskwt0
	rCxOQ/Cjhaq4eaJmwifvMRZQci4+xTLG15hqNTYo6C4lXULkuvLeik71yxnvffFb
	3paoRvdT5MpcPn8PLuF5xiMamJXPzG26r+z6rQ1wklfjrQFmBTKUyHTm0bo3DgJZ
	/FoaNUGJZXRQiYV0Pamw6H2dCjHUFKaj2d3RfOnZzPp9QJoNPP8LfWhhqk2vMUHl
	S0A9NRUVS/76H/BOnOSuuxjAhqSWz5VEB3Q4hqVXDAe6UiKVSYlHNdJMN7iJh4Rm
	4Qu6aw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1su2ru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:59:33 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51494d74d4bso24147561cf.1
        for <linux-media@vger.kernel.org>; Fri, 15 May 2026 04:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778846372; x=1779451172; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kb1gCwgaGV5H3d/jKwmfo6mOPiG1Fyfm04poCnOImZw=;
        b=Lud0rfCjlbxN5JNaluZucclWdIPgZGFqh0ILR6N8iUSGJGirPdA4VADV7f7aL2cXva
         IGQCnrFcwoZ11eppVoKKF6dd7iOPuNNTK1wo8HCgPehI8mu5fID75Qrn2IoWDXIdyoZS
         YLmVvnF1yZI3JlDWs1vTSj8Cv9OSonp4MNGPD+jT9r48ik29bhRkxjMtGok1CBnqkqcp
         dZO0mebmmjInJdlz0L2OB0rxnQptZ1t0419aKutccW4PjHjuDInPmKwc+crIhOE5eq6f
         ZQ0NmDNFhmzXjcrr2begg1wwnZvhYk/eCevK1AxXFAKplGxGj16j+UHcTsCk3kQY7NTv
         W81g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778846372; x=1779451172;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kb1gCwgaGV5H3d/jKwmfo6mOPiG1Fyfm04poCnOImZw=;
        b=kECfgQFOJcfwB8ljz9Oj/TG5aymVtqFJBk8ODaULZvux8P+9IAdYPAp5aHFv7IRRrK
         Uwqd/YhmNROD3PPWJmoQzZFdeY1tE9aTB1k+5EnzZAom5MBZSjD7LEucOjctylVh6pm7
         iFlJEmWmLOUIOxdiumMJMkgX4GvwNGiVydN77YZwZ/a+Gx4eCsN/Cib/BXbU3ZLYpb54
         oiL37Sx92zx58TKbWIuU2vqKY97Xb6xoJfUEMaJadRsztc1/9cDWLjCtpltD43EuMr2V
         vrztTMKWdQcTc7zQUEeakzzXXBfb10RIccYhKIns3SQslDUecRgLduXdftVk/AWryDmB
         EWsQ==
X-Forwarded-Encrypted: i=1; AFNElJ++ilUmcUrz0/RVKtuY2A7xk6jZjmoX+lTXnlD7uY9KE4vydVwLm1LDk/egnETro4xlQJanJNwgCeXk5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNT274TQOsW4fZiO2FH0651asYgiog24JcgY3mlESBuga+n6Ja
	/mBIk2KhlyhD9vOB9bs1lqEx00h00iXUBwNkH0eFth5mjDRTIyRaye6cy502M2GmU7Ak1mbhO2e
	4qxbAnTTHrzII71i+KHpFxBs3T1eaBrLq4JFs9Uvh4aXG+Kb7pzbNzZE3+wpbU2UBZQ==
X-Gm-Gg: Acq92OGqXFXMAB91TYaugfATj6NQbUhdbR87Rruw0WiiW3zugN3H2kL8Js1IL0Z3BeU
	8Qe/wn2F2/4NsiAJyMkWacpykxBdugjjn7FflX40lKiefrSaVqMTlHeg6CFoe3Gd/GhYOUSToaI
	ZmHDmBJNjUKVcwDcvoUeyPR7rJYIIqLguyzYozp/gyYWa0U0/rE9vcS0SeiMY+hUBCZyY3C5QM/
	01DOyQwSvvQNknWDCzWgdm1Z26L2bioWeRI01BHzXtVtYjFQtz3RhYW4709VoEmdrfJHOyCxV+o
	uWejNx/PBRQl4DC2uwFL088JRw/exEM1Ko8fe/W1gBrztCg3l5QTV9e09haMXcGqg/D0T4u/opO
	G8aO2SiZw44tHRDtnMZVxEXe2eQRLpNqyjsC364bzXvF1NACvpzAESTFA1i63Z2cl/gEb2vQB4G
	IuMcuF6qSkXAWkeg0BIomA057BpImUoAO4SiC5dmLNaspkAA==
X-Received: by 2002:a05:622a:254:b0:50f:39f4:3a2b with SMTP id d75a77b69052e-51641967867mr97238061cf.41.1778846372548;
        Fri, 15 May 2026 04:59:32 -0700 (PDT)
X-Received: by 2002:a05:622a:254:b0:50f:39f4:3a2b with SMTP id d75a77b69052e-51641967867mr97237671cf.41.1778846372086;
        Fri, 15 May 2026 04:59:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f119ff4sm1295651e87.20.2026.05.15.04.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:59:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:59:24 +0300
Subject: [PATCH v2 1/4] clk: qcom: gcc-sm6115: Set HW_CTRL_TRIGGER for
 video GDSC
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-iris-sm6115-v2-1-2ab75229de61@oss.qualcomm.com>
References: <20260515-iris-sm6115-v2-0-2ab75229de61@oss.qualcomm.com>
In-Reply-To: <20260515-iris-sm6115-v2-0-2ab75229de61@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=712;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4Ws36Kh4YBbC0ww0Jy+xw/tAJtFPBW16pQwGma9xSls=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBwqgPduWkAngFc0G01Tesp7cCgfjcVKboQxbt
 YT21p7aWzCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagcKoAAKCRCLPIo+Aiko
 1cM/B/443v2lMaVWPHvJrTYc1RFnRzV5ivedKaUcEWKFICvi64tyMvfY2S6isJjVmCVGX7b44/u
 l6rbKs6/esUkMEf6BToi3ya3P6EZsmyoGDmD55JIgE0yyHsuc8DrihOKipB/H5lWYAQUmZCDFuy
 X3uIJ9hC0/ifpQJvYsykiN+U8IH4izBvspB/SqoLF8INoQxSqb6xMHbpOZwtmidsgcoItSVtqwk
 94BGZq6tpfCdggzDjGXHaQwQO86zxHJ4BUSN+ix647dZdd+1Sq4P4nCKLf8AZXqq7IUIuYP9WeO
 pYsmv/gCtOHZa4Fi0sr5CtUmPgd1Sfj/oi7vvMpmpuUTqNqA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEyMCBTYWx0ZWRfXw29q5+AOju1T
 u8Bbr5TcMmaerID4XYxDw4WmigApZvZhwIN3DYaTtnMixZdbFv5lFZyzGbJ1Tg4JdX81/14er7m
 TBT1pvathVhUCob/A2LRU1BVG87WWpyNicUh7yglghpLhlG9B+nPPilenUG87frJLMvpWgcN2e5
 0Ft3sAyWyJHo+EhtaCPsxFfQgxZHh0ycI0uj+yFsxsoxh0ExiPDajRiNjHrUK2KljMVX7FspsXz
 6XTG7kYqfFNOhliCaBXNYu28pUGXJ8f3Hb9w45ioKXqZwjrdW2gAvFuauFU4iCyEYFaKZrdGcac
 /eg3+xJcTqkYPzeYWFyIGTGPAX61COzQxVUagkWUxa2Ky5tll2BcLZFbgdRylU/KCGgH14QRXJw
 ohAWC3VZaLfIn1kEm0Eok2l92QS8n8SxAUg/NAJiaBsy5djvLJnTcudsOf2HO7F8jwJxLhhbHyX
 +ssFeAGP+PBaVkwNTDg==
X-Authority-Analysis: v=2.4 cv=cZXiaHDM c=1 sm=1 tr=0 ts=6a070aa5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=KOvF56qbc03BBMn0VcwA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: pX--btRlUMpZrmL3VSA1L2CC8eUfbRnN
X-Proofpoint-ORIG-GUID: pX--btRlUMpZrmL3VSA1L2CC8eUfbRnN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150120
X-Rspamd-Queue-Id: 402FE54F43D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61705-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The venus video driver will uses dev_pm_genpd_set_hwmode() API to switch
the video GDSC to HW and SW control modes at runtime. This requires domain
to have the HW_CTRL_TRIGGER flag.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm6115.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm6115.c b/drivers/clk/qcom/gcc-sm6115.c
index 4c3804701e24..c5251aff9886 100644
--- a/drivers/clk/qcom/gcc-sm6115.c
+++ b/drivers/clk/qcom/gcc-sm6115.c
@@ -3218,6 +3218,7 @@ static struct gdsc gcc_vcodec0_gdsc = {
 	.pd = {
 		.name = "gcc_vcodec0",
 	},
+	.flags = HW_CTRL_TRIGGER,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 

-- 
2.47.3


