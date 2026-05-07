Return-Path: <linux-media+bounces-60739-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPx2L3g6/GmUMwAAu9opvQ
	(envelope-from <linux-media+bounces-60739-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 09:08:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC124E3E0D
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 09:08:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C56723029C22
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 07:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F2E634C140;
	Thu,  7 May 2026 07:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N45eEQEd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jdtfTSNW"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54909349AE0
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 07:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778137704; cv=none; b=l6qmniLMhnEx6ee9DkLJDSctYoTQcI8a9D6OCApWYOlkfTlDTib64V1rpTshJ5aTEtvSxHhfEb8GLMXuh0rdslGX1ogACTr5rHh3CPqNM2XPz1oJIpW3/0s1iGrQ6Su1OVHXy30ceZHG0MUkgfBiyUGRgXrfc0ZeKXE76Iy+bWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778137704; c=relaxed/simple;
	bh=4Ws36Kh4YBbC0ww0Jy+xw/tAJtFPBW16pQwGma9xSls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o8cY8CuKnGvDksrNorhDMA4ZukhzlKIZtf75gQ6VOqZ5JyvLIT//1NOhLVtm5Gx6MHmf/ZUD7daEDpCPwEg7cj5iH81EaqoI/WFmI0AI5TJ/217XynRsUxV8Oyhb+2T+TKUnRY9JYcZ+tShNB5VdJKEi+D7nGp0FDkpNMF5hiRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N45eEQEd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jdtfTSNW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647444o2151029
	for <linux-media@vger.kernel.org>; Thu, 7 May 2026 07:08:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kb1gCwgaGV5H3d/jKwmfo6mOPiG1Fyfm04poCnOImZw=; b=N45eEQEdw9pIS0Z5
	eUD9RVMc0SyCILgyB6fbwC7ZrsGaFqryR5FkjWvSZnwXBYVq/MU+iB01GgdvT7Zd
	CCX6sy9vYjHvVT9UzeYXKoaXPZ9nqAJ0O3iI5UTV2kp+w95/BZ6k+AqYlZSfzYdo
	84pYPQgqpjJJuEjm0+b5nLvOiOdb5auu1FurC/goDLhu3StJLCu5aMeBUjEutX9r
	yv0gX5D3H+fiG6mSYOGPx/P/E16Re3yP5JK4hmx9K8p/pYtlFdO893yzCfo23xDX
	BNqgTDT08cemH5rw3H1wheiQJwcWRlHSJlrK+i4//SlPJ8VByam+r2FXTUnSks9B
	G5UyMw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kctrkvg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 07 May 2026 07:08:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d6bf346adso8826371cf.1
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 00:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778137701; x=1778742501; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kb1gCwgaGV5H3d/jKwmfo6mOPiG1Fyfm04poCnOImZw=;
        b=jdtfTSNWujwtlsFQ37PMZBiFjSxXsuN91b4dxj4Eopg4q83CQLePZnBNI+1Yp0iQ7E
         zRQZ1Ebw0ttHPuhpXDZQLE1vsucUgsnqqBOBO23FzIRkzeFCdtT6EBDAQy2CQozVAzq1
         hoicPER8peWzJV1rkoA6i61P3YjgjDixiOmy9n1k4AtydXfS/isjlGUREOJ78UdPR9vy
         dtLCAGqK5YBRku8YlF1TX2GEcp7Cs2Cj5LBhHUC2ACpD+2aUTnjA+p0Rx7cb3/Co0uNd
         xIlx8n9AfxyjySfU3+bt4ixs3PGFGgXWChIRwbmQ9Jw3rTLzdSCxz2gYo6FZytwZOq4Q
         tYhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778137701; x=1778742501;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kb1gCwgaGV5H3d/jKwmfo6mOPiG1Fyfm04poCnOImZw=;
        b=Tpqw18VF2nkvKJINXd+kCMZGET6YfHUwKvmtEMJ2lDFZvgbffthrfZi6T3NDYQNAi6
         KIaHUBl5QWmpYboNATWvmVgEXnguVRNp82UnDwAfTs4eXumRYxBFMFz1Ax5LTdHqoGyn
         A23Z0IcGxVK3uLc02FkdL/17rOYJkRvB13TbCJJDPlVazAxvfTERcgNFYDIEfd74EvaT
         6trbkkPhema5GdWjW85GUc+TWLeuY3w6xYrCjOhTZAu0rngq1kX/TkN/z2o3eeQnJ1Rp
         q5803YngW30Q1CuXQ9Wh27DAXv4CYmQz9tFxc/WRrlA32P1M3p4PppdoWkf3AiC/09k1
         xU2Q==
X-Forwarded-Encrypted: i=1; AFNElJ9Tjr+cZg1mUC/+F2fyw0LXIUYiOF2lWfoXiBR0ARU3AM1dPn6+2yVnhT4fQ1aloAy4ZZ7UTNGenz9GIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYjfKzuJ8Ve5WdDB3hrqSwLT2eLMVG5gtEU3QuVusQ65SWkW7J
	NEg+bI4UoCDg3szbdzu4ssKGVfoCCUJEH8AV81xHaswYGQnQNGa9+G3XUdloGgAmjcO2lbBFx0A
	TMusqx5JopD/5Y/+wOFtXTiRVyLkHBEJQThCDXVOM5Rt5hUI7k0C7Z2TWhW8GwLX61A==
X-Gm-Gg: AeBDiev+ivcVZZ1LbPCDaOhgXqoxo6GN+/Uq0btjNlkcOUAj+hGfM4GhkO9m1ccCicv
	R8iCeEqMTemhSZpTLg23X0AMffkQzKxNWsMjUC6xfUhnbzuTxSC2zBc+kdXovdI5/ugSWM0hj4u
	3PmRimOeSBWBgWpPkHye8X1QvtPuylyhFXhqvhk1nJ5/ucDHh3IGSN4cqVzP9jioseCWX5vtkxX
	MXlgEfhQ7b9P3Yl+DzV7CGv6oie4z+yMkWiit58GoV5AwJB1IPpqiNHzRfEcHOZPjIyPGWMU1ub
	SpPdwyyasPg7vMO5w6JtPAL8NU4rmKh7hAjcWGih8zhkAyqTf6o6/eCrTlh6qyfEzIytee+I3Fy
	VxO65tD9Jm4zc44qsRsWLYFI+n9eVtALxKCYFbKvOTb0GgSfBdmFt78izbWTwT6eDRTW+y/QMYZ
	ntDP96dzgKi/kdRmRydNyflj2991fjQAC92QfhDs4ivHv4pQ==
X-Received: by 2002:a05:622a:a13:b0:50d:8903:ae6e with SMTP id d75a77b69052e-51461be03e2mr99847051cf.5.1778137700698;
        Thu, 07 May 2026 00:08:20 -0700 (PDT)
X-Received: by 2002:a05:622a:a13:b0:50d:8903:ae6e with SMTP id d75a77b69052e-51461be03e2mr99846661cf.5.1778137700205;
        Thu, 07 May 2026 00:08:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a86aa338aesm4296784e87.43.2026.05.07.00.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 00:08:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 10:08:09 +0300
Subject: [PATCH 1/4] clk: qcom: gcc-sm6115: Set HW_CTRL_TRIGGER for video
 GDSC
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-iris-sm6115-v1-1-0b082ad8eea8@oss.qualcomm.com>
References: <20260507-iris-sm6115-v1-0-0b082ad8eea8@oss.qualcomm.com>
In-Reply-To: <20260507-iris-sm6115-v1-0-0b082ad8eea8@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/DpgMRbML8GFqypvwXYiYitpkAtVZv8+fXRXb
 Vd5Ftn04PeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafw6YAAKCRCLPIo+Aiko
 1a/iCACMJACnilb3n03uyLi6TaAfrxpc/UBFCt7wVt23e+9UMHZ2+vsiS8SpgAMdRbEl0l3X6Ej
 +yLxQc4j+o1QSqHLuMBViP31wuIwjf0i7zUG+ZUWLQ51uQwC9JIrZ2RdH9dpPFooFnhcu+1wwXH
 Hnuy0o+sxe8FAwecQpF+Np4OBLQ+/fZMgXa7zxjvNqxUFq8ht8qkbNpPhfQzEBfOzGqQI5yDAoP
 CpOehfpO21GfxTnHBgg3e8qVyXq876Z/p0eKkfvWq+nrS4O2qFSvtEnk8KLYxbWWu/2lYoZhoZF
 BI3zeLED3xsdSQF2tkd7OfkJ9gaqW/6bWUTuPodn1PDMj+J6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=XsPK/1F9 c=1 sm=1 tr=0 ts=69fc3a65 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=KOvF56qbc03BBMn0VcwA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: IB09EQouyOk9Ex4Cte1SBefYCOaG18z_
X-Proofpoint-ORIG-GUID: IB09EQouyOk9Ex4Cte1SBefYCOaG18z_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA2OCBTYWx0ZWRfX/Mk65dns2Z6y
 PRWtKws08SvDZoJqMubSP8EFZIB/NMEAH28JkMPPy+oIaT645rkCw1V9tJrN7JzjjYkUNXkb5uF
 GnGktbzP0Q41ApSuhja0yxwFs25hke0LRJv0yVkWBM46tXB35iSQCctF/b8Zye0p4Tl0pnyDrBX
 l1MmaHz5OqeXJctC8Rc8vfBIYyaH7L4oAIyYIkZLA0n/WmrSNjy+XAUmYejC+DIbXjPJ4mzD97u
 8CReIC1miGLTxq/4ikVgwJhRIxaNnNTcp7BhWk8fJYHfJ2D/6YINiaGsHrj8dkQgC+npNMtgTG9
 Q8OJrMQQT3hVeC7SqNPI1E9ja2iYM2mXOd/LdSSyXnZtJDm2UhJvJ30iV23rc8npC2ofEIR3900
 Ed7AJzfVDk0QmigGFF68Uz17y3gRZotYlPdzJa/Pat95lnTJSrL/WVWor7HGKpvYIBL2Msv9y/f
 linXkb97cikWJfejmmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070068
X-Rspamd-Queue-Id: 6BC124E3E0D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-60739-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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


