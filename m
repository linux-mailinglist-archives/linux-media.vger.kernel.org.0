Return-Path: <linux-media+bounces-63828-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PIMFMbypIWpRKwEAu9opvQ
	(envelope-from <linux-media+bounces-63828-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 18:37:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A20641E65
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 18:37:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="h/2s9QTB";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WfpDr2O+;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63828-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63828-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4DA2A331F9C7
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 16:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 473C748B38A;
	Thu,  4 Jun 2026 16:22:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0D648AE22
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 16:22:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780590159; cv=none; b=MG+XUTCF+TvSsta4nhQCKSsQxo2QztDyM8HGGslpK5oaxC7BgiYWwlrvISYxXG2U8AFfgAs4WtbMnBiJoCFRfAnWqoLqN3Yids8HDy3pKfeKNAbVfwOFrJmKVMQeyp3hNjqy/lb78uy5+LK2hOslmYVawoy8AoaNo2SXUdlnVks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780590159; c=relaxed/simple;
	bh=tAf0rKBBwkXyRwND2BGMfyJ4D0SH0mmO19xN28c3anE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WalIKlG6tKfb9RPkVmYEzbn+YWYHuVC4YkjSRwacsPKhdb8XVCWpfgFVqY3kxExIMG9vVvB75snQBYFFZcyRO5PbPOFEscAXSsQ1wF8wPIp+UgSDB3SqI/OcmSPgOoTQ/0RV4z9tSHTfaS8TXqEf7VFMjqBqJO4T7FkE7fM0exs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h/2s9QTB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WfpDr2O+; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654ClqAD2477907
	for <linux-media@vger.kernel.org>; Thu, 4 Jun 2026 16:22:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aSiRYIrO26+BjUsf10ick3Aw4wDwsjDETXDiupofQVs=; b=h/2s9QTBH1KDJOPb
	s3Pnj45qUf4ulrCdQETtUEalncY2iwnYA7r6x8RVGrp7LoSL0KjOeZwhbQppSRQO
	mn52Tsr3HPlJgtKGQtBLNqpflxwjaM2sqjJaSdr1xxTnqW29mSv6+tafwyrL7mki
	+ouiyWxmvmZMMrKV1ujHto/cdhfyZb2EzfHGM8Lyx1orxR5dRgEBvHEiqHOi2nA+
	ESsimG2j6niz7EuFFjkXafxx7nP5uM6xMItISUY9MLyLR+pqDaaZKdqCqXiMbX+b
	1V60JtXllc7PE/+kdy3pqCrqdzaHsrYavwpGHFSxq25DorPdcZdqel6SxhgWO26H
	GYGCOQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek4hvjc7t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 04 Jun 2026 16:22:35 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6c69c788ce7so457458137.1
        for <linux-media@vger.kernel.org>; Thu, 04 Jun 2026 09:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780590155; x=1781194955; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aSiRYIrO26+BjUsf10ick3Aw4wDwsjDETXDiupofQVs=;
        b=WfpDr2O+aYgMqpZZ67xaj8jfbI3rO3BSh6FdKQz5IqoX839a+nF2mebgWMvqXcpTzE
         Tbk58tm9uf83SSitUcQtE00MT2X3Q0BHHOLn4t4QvlFY9XVEWMPJty6efuI4JAe8dFFu
         S3dvlFR01SfQV7MGuRtqXAXw389+b6nOJre6cG7Ft4hWQ3RQDOVoWWbib571nleYFK+C
         Hb+YsPWbpnaXwe5m31PsI0yfn5XtR2aRUqR2rQriPTbUQL5w6yDRPUf5WOM89Knqa8IR
         ilm4ylFU9VVnjC09fKhvEvd0P+Fw5Z9TvMsWHSILSVv9H1OfFw4L13lOj/yhpCkt7jqP
         8Psw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780590155; x=1781194955;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aSiRYIrO26+BjUsf10ick3Aw4wDwsjDETXDiupofQVs=;
        b=cWP2WuYpJxEdSm5uCrzPpcNuWtikHUHE22gN46SUilhkcsNGRBBawcYc4H3m5LDT1e
         Td+XRmhpJgI6DIL5723fLTUAmykwyCEqR3K4Imy5oX89ybE2p+p+WptoC1Zy3UgVCKd9
         H60GxmqANIIXkZ2ObuJhy3/9wLCiVzptrA+WseWm6x5iaTd6dx2cpzSHSse7B4PfW0sg
         nDUZ+90LNpLLiBKZXYaHGWihp7VqumVWViPdNmkdMOMUclu1P/viZQaaWxucN1TZkFMF
         fhbaLXWLlRapzlnYe7y4Q7rasYne1lWRGj97YS4B5O1FiZrYFea5C9UpeyycQLAwJHmo
         z1qg==
X-Forwarded-Encrypted: i=1; AFNElJ8xGvQxCmqBIVsA3W2hKM1OZr2ItXqCLYiGIDB0lZCG0IZdC418sjid+SQ8WLeYxt3Y2/g4xDbJ7Taj4w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb1xLxVnJVoRajttlXu5Ayr2sJ6SZqWjawYzVlQSFo2YvOoimj
	OuQ4cpvCBDZcW5hie0OAVklLkGLY7l3Q0O6CDlo1+Rk6qSWIc4UCWOb4Dpbd4b3cO75DEV0pjod
	1T8hKyHJzWXPrySTrbETxWhNKFz0tydqgBFp/4oV8TJx1yB7HDycofm+eYVQk8DYc2A==
X-Gm-Gg: Acq92OHuTVQkobIJ1jxJLKD8UiaDvmFk6v3DDd/Q1e09iWptHoYR5JCO6IjyqtFhBpY
	jCl0WxW8Y+IMzM4LGCDBNwwgi8N5wxHOj4Zy9+bSW/4A6PeEbuPE2euVH2lSCl6uD1tW4B5Zqfn
	OvCJkYRwvsKreoPQeiDMtl78yFt7AOqn+5AQp2yGE1+9ukE+IQNYX3CkqZ7ES9+ZNMOiwUgz9cn
	rMGu0ejNwzVgiBNdDq6u4XVpb/nnRc7HUYqOKGiJUb6sqeEA+kItkPWtZtVDpsWSU3Qfdlmr1b+
	63wW8cmVKcmv/mymGtM3sxuMDdkOK1k42VtWd7PDacPsE8otxd6mYfp5wkMOpiRzEvfioVBIW5C
	cWM/uIZuD55CHHCjqnXj9ojWf8GTEpsA2IIv5qfTOXrD/U5/Vhq0AJvzvQcfh65riJu2pqzpdIF
	sGMpKK+Rj7GlF/7S5sgWfM/cEZvq1whjf24mUqteN8+EAD/w==
X-Received: by 2002:a05:6102:511e:b0:6d3:9409:d1b6 with SMTP id ada2fe7eead31-6ec2a7e2fa2mr5262020137.6.1780590154360;
        Thu, 04 Jun 2026 09:22:34 -0700 (PDT)
X-Received: by 2002:a05:6102:511e:b0:6d3:9409:d1b6 with SMTP id ada2fe7eead31-6ec2a7e2fa2mr5261811137.6.1780590151171;
        Thu, 04 Jun 2026 09:22:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d5034sm17591591fa.29.2026.06.04.09.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 09:22:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 19:22:23 +0300
Subject: [PATCH v7 1/2] arm64: dts: qcom: sm8250: sort out Iris power
 domains
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-iris-venus-fix-sm8250-v7-1-7bd2f0e5bae8@oss.qualcomm.com>
References: <20260604-iris-venus-fix-sm8250-v7-0-7bd2f0e5bae8@oss.qualcomm.com>
In-Reply-To: <20260604-iris-venus-fix-sm8250-v7-0-7bd2f0e5bae8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
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
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2180;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=tAf0rKBBwkXyRwND2BGMfyJ4D0SH0mmO19xN28c3anE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqIaZBK6EmOt15zGsa7CbGu/21Vfd8Op5b+pOY7
 lguo+qKNTyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaiGmQQAKCRCLPIo+Aiko
 1TcMB/wMY2JZA6XcGclZFriqAELGFsj0qR+EpLlX4rJwIi2GQIs7nGYmJPmIJcCCHQ0GHDcaYiD
 GaCpQRA60Ayvm7gfASpec456uvD+ujDD3mAdR8CKJwHwoDf582I+Q0Gqu9QmlKeZOi/8W9FQ/Tq
 vhLFq0rFXj05Rv0QxC5750kS8ug7YJPFWvDmiFC/oNsKScZGW00E4Xc9V6X3ygIIwt7h2SGCfWE
 LCOLrFq3OAmYEgsSyQqzcOSGXT8tTUo8n4dn64LeeUWQUSNmbo87g4IreUZR90rnWmkjglNsfzX
 RyRJGkkoglNtBb47m+jMZEJ9R97Gh5E52s7YNZy7qCahce7o
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: K35-jnMcLKKKpANvxv9eG4Sm5h3bo-bF
X-Proofpoint-ORIG-GUID: K35-jnMcLKKKpANvxv9eG4Sm5h3bo-bF
X-Authority-Analysis: v=2.4 cv=Zp/d7d7G c=1 sm=1 tr=0 ts=6a21a64b cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=rGr7YpdD5vYbGY1z0rMA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDE2MCBTYWx0ZWRfXz8iSkmuuin2u
 Zw6Jm9+kFBg9iPjj+NyYhNOLxK/IPs2YA91YHpXdh6Y8LT6epA7mypJ+u7Uen33Js/+RJr2i5yj
 dNKjmwN0D1NilBPzZhN30oXR9QxHF+CO8D2O3i1sGp/RJ96cBz/YDHBqQLc1bvQqs8G3yfYhE5g
 GMuMvtwxr59rUG7PoEUYT2ToAiLYlpf1Mkb00dN3owncgMS6smATIRMX07RsaL4buE1q0CDzIlE
 mB2ez66DRZch6fX6c9reD6VKP48b2eZf6YPTRSutlDnzou0fNVCskjRRWJZ1ClGlfvxDEpoYwwr
 LkMU6wNkXQxVYdMR+OP1ZgKns+tHgZA34ZTaAEajy/rtyFZmIqnPAZh5b/8y5ZSAK7yMNYjG6vb
 5piw1mR+Lwm3J5kWtOSc02k7zro8UxZTUDvOe5ZdWQW2uA7VkcRRAv4uDVSsAHBhJUufYfWxjGZ
 6JEII2ITrdXeLbp4AUQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040160
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63828-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_tdas@quicinc.com,m:jonathan@marek.ca,m:rafael@kernel.org,m:bod@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:mchehab@kernel.org,m:stanimir.varbanov@linaro.org,m:abhinav.kumar@linux.dev,m:hverkuil@kernel.org,m:stefan.schmidt@linaro.org,m:konradybcio@kernel.org,m:bryan.odonoghue@linaro.org,m:dikshita@qti.qualcomm.com,m:ulfh@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-media@vger.kernel.org,m:mchehab+huawei@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,huawei];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 33A20641E65

On SM8250 Iris core requires two power rails to function, MX (for PLLs)
and MMCX (for everything else). The commit fa245b3f06cd ("arm64: dts:
qcom: sm8250: Add venus DT node") added only MX power rail, but omitted
MMCX voltage levels.

Add MMCX domain to the Iris device node.

Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 7076720413ab..6150380795b8 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4326,8 +4326,12 @@ venus: video-codec@aa00000 {
 			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
 			power-domains = <&videocc MVS0C_GDSC>,
 					<&videocc MVS0_GDSC>,
-					<&rpmhpd RPMHPD_MX>;
-			power-domain-names = "venus", "vcodec0", "mx";
+					<&rpmhpd RPMHPD_MX>,
+					<&rpmhpd RPMHPD_MMCX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mx",
+					     "mmcx";
 			operating-points-v2 = <&venus_opp_table>;
 
 			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
@@ -4353,22 +4357,26 @@ venus_opp_table: opp-table {
 
 				opp-720000000 {
 					opp-hz = /bits/ 64 <720000000>;
-					required-opps = <&rpmhpd_opp_low_svs>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_low_svs>;
 				};
 
 				opp-1014000000 {
 					opp-hz = /bits/ 64 <1014000000>;
-					required-opps = <&rpmhpd_opp_svs>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs>;
 				};
 
 				opp-1098000000 {
 					opp-hz = /bits/ 64 <1098000000>;
-					required-opps = <&rpmhpd_opp_svs_l1>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs_l1>;
 				};
 
 				opp-1332000000 {
 					opp-hz = /bits/ 64 <1332000000>;
-					required-opps = <&rpmhpd_opp_nom>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_nom>;
 				};
 			};
 		};

-- 
2.47.3


