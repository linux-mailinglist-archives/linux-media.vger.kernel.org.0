Return-Path: <linux-media+bounces-64875-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8QvzDUymL2pLEAUAu9opvQ
	(envelope-from <linux-media+bounces-64875-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 09:14:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C73684169
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 09:14:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="DPYp/7V1";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="S/z/f2Sp";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64875-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64875-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3FEE2302DFBA
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 07:12:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DE032727E2;
	Mon, 15 Jun 2026 07:12:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A073D38A714
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 07:12:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781507569; cv=none; b=QmJieHc3XwFFAGJb8uWTnz74y6OCVxjXk5MzmA2jJcdLgtuOOevdm0AZVyKCC6ulBqFDxeV1EnNl7CHTJQrnD8RqYX4DZNj31wFGDFKcNMz6Y9kF8hAWTE30Xj15hSrWQ63bpxrpG7bQRCiIIEU2TUR69rTyB1u5Kk62LQYz6O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781507569; c=relaxed/simple;
	bh=yiYdgiJqd9IrcyVppfU6gBuaofPptGycHJJtR/oHevs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qzaeiwiSvjJR/zqYZWj6aWHOeHflhRZOz4mRyP3UHyadCeu2xuSdpvBzW0hXeNpQiXlcqiAYpj37DMAKijERg5k6wR47L1IP+n3YBkmnl1nScM0sfoe9TThKm0dE5TR+DwoHiLP2qia26XwP7PRIb3ZoZ2cwgvH5qxPq7ypwDq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DPYp/7V1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S/z/f2Sp; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6Lk823853257
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 07:12:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4nC2LTSIQg6tprR91g53nLLPdKX5ERT2wD35VYnpBLs=; b=DPYp/7V1v0KJTR6k
	Pb2ikbRoKdm7tBCZIv7ExGns2q6zkh5AJzlF7prfQqdeCXtF6nXkST++T4QmHZ/9
	9iDGAoGPbWSpSQG4+IqdWrM17ShIojeDAzNB+8Bc0wE2+y0q59oEExuxqKCdaG2v
	5v928V9ykaIk+BIz5pfyBpeiIUSs+lcGYbV2eafCMOMJcmTA0bCcLt0VVIzWR9i/
	gbgWMKmY1Lk4ZDTL08fhBI77CCWP6e1iENUwerWdCIXk8pk03H1mSIuSDYRsndci
	EP+9iZke4E05gj9Hg4jM8fkirUaW8MttHrUH7yCMT/OxDIl9l29x0dLAdgaWjVOf
	qd0O/A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery7gx6sg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 07:12:47 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36d8719bae6so2769216a91.3
        for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 00:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781507567; x=1782112367; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4nC2LTSIQg6tprR91g53nLLPdKX5ERT2wD35VYnpBLs=;
        b=S/z/f2SpfvI0u4OOeCFbWnUi5v6qF02YijMWXA3TpQ0S7MUsDqltOYas1XYWrQTy3b
         eSBHF9y5HDZcPkZRukeaDlnAyajKXb7s+NjMi3DyrbXSi74c4ixdLxopxkujdVmWjp8C
         D/8A/jLqF61X6tP97UntE5eeJjE1AnIqJlHZgkA3m03JVhOloU77AbwScqvmHNySF6ie
         lQgXPCA8GO/sQo9R5/x0Kvh60jTG/G/bsktRU7Kgwl0xkgdPdgrMCLpVAxCiUa0P69gz
         ZIGhZevyxsHBptD8PzeuuPIomQJnnCbpT8Azr1JyTMRaGEKNo0YeoPHfHwdOMGuUAjLl
         8QSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781507567; x=1782112367;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4nC2LTSIQg6tprR91g53nLLPdKX5ERT2wD35VYnpBLs=;
        b=BebbCLWgTRznJXOo46LmlZ8/aXt1aeeHvT39D0dSp3qJgBHp2BmcD0YEGscGtGmzGk
         fwlLlna5LQH7q6gYgJEOvSzvZopT91AIdwDspVBsIMGJgS3Xo1xG/UgVAyblLy9v5fj0
         Wl62uymaNQYkxtzoau3JaR+LO7aDqs2Wmwsxxc3RDtXTxM0cG89fOXcjbineBBl9U3BD
         hJPY5HCCcNHpvIWdk50w++UBrS8IsjOQRmsPX79cjdUYJhun4Li7ElEzmDPCywbR38+1
         xQwW/Uhst+OhbSfnUrbT1a1d6/uFkJo1zPqZUnIMwvODXq6kKmZ3w0hOC0Rv9yK4+meS
         /+Lw==
X-Forwarded-Encrypted: i=1; AFNElJ8WCjdXqoAVb0qO5kUOSe8UJtLBCTmXPwSZvBwus37vg25tVbAz31TuOqMwyx68dyMnVxitNGzN3bSmOA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzft47Ucg1IKbjEGOiPitJNiKLu8UCR3aJJRcqPImUM7BJYlI88
	uiQpFc+5YsSYtqqWwkC9yQsZx5JRbH4KgBT+5yx3BRWyZyd4VDlS3lygGP+mfKPTRDFeF4N0Az4
	yBQT64ci6QG3bOExUDn4IzpUcLiyIT0k1hMuzZVbE0GnNDCtTVy5J+Yez2vV8vHBKZA==
X-Gm-Gg: Acq92OEfZVU3d1hyB+tR7Ca4bz8MGJdnsBMmGYOvPt2srkQrrE3eLrKmvyzHsM1b3IE
	/ZJz+rYrBuQ8TDbHNQmJGk1L9PxeD+PCPKQWUtbRVgSv2TnwSFk/Mzoylm9ebPXHgua+ssoTINI
	Ef5Po8F5pTIs03DDkznD/gRx6g/bCs7SbsqyMxTvaxNwWW+Q35Hrt6pxEjIuPH28g56ht9SaOy+
	hoNWlOUddjDJQ2aiTMiPkkGqL5DTSey7AEWWiYxniSF6Qfbhp/GqdP3sx2zXU9hPNjHWYNpnJjm
	2UxioQPV5Jr93W0ex5/VJKXIaO/nXaC8qN6EGOqKGql00zaM1uVDgaq0I1lrERI6+qc3wS+iV57
	PIHybUkNEePzz1AbLXXAnwqSpK84nUZt3q2/ydBmOMY7I2vJtUSYp
X-Received: by 2002:a17:90a:d406:b0:36d:ae6a:22fe with SMTP id 98e67ed59e1d1-37c2bcef7d4mr9907983a91.16.1781507566651;
        Mon, 15 Jun 2026 00:12:46 -0700 (PDT)
X-Received: by 2002:a17:90a:d406:b0:36d:ae6a:22fe with SMTP id 98e67ed59e1d1-37c2bcef7d4mr9907946a91.16.1781507566199;
        Mon, 15 Jun 2026 00:12:46 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a2668cce5sm14867474a91.16.2026.06.15.00.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 00:12:45 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 12:42:12 +0530
Subject: [PATCH v3 1/6] dt-bindings: media: qcom: Add Shikra CAMSS
 compatible
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-shikra-camss-review-v3-1-8183481f48d0@oss.qualcomm.com>
References: <20260615-shikra-camss-review-v3-0-8183481f48d0@oss.qualcomm.com>
In-Reply-To: <20260615-shikra-camss-review-v3-0-8183481f48d0@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781507551; l=1799;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=yiYdgiJqd9IrcyVppfU6gBuaofPptGycHJJtR/oHevs=;
 b=f6wJE4CawInMX9KIDvKJViD6Wlt5Tb8NHLZYnQ3WetCaKjTUaanZjZR6mQRiCRIVFywgsCQa2
 swTrlMBOBRpDRRcvKXIC37+gh3lI9mSmlKbAJyP4d8IYj/e0sooWdzj
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA3MyBTYWx0ZWRfX8dkcX0Ue0thu
 P9Nnh/AwKPhS57IA8IYJSQUbvtQIr90GkFrd3yUNabKlrL7fyq8tpU0MSUD7xO3OZ1j6M7VD2V8
 cyQVN2ANc62CDtU6CAyxUr6S85nis4o=
X-Authority-Analysis: v=2.4 cv=fLYJG5ae c=1 sm=1 tr=0 ts=6a2fa5ef cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=butnsgrUGOw-u3YEFNkA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA3MyBTYWx0ZWRfX8V1MAp3LDJn2
 ZL3X7fzCRJoD22/jHxO8JDJcrWA43ttIHx458QP7mZ8Boj5gvT3x7g7d0sAms9DqS6zVIc1T6+/
 eg0SSouKNU1qBYzIIOM2+6Xz8vvcGAkCtXuaRm8VKvannqV0P1ZyJWZ8ILaqt8pw/cOsdbUzVNB
 5OetmtbP602waM6G1KX+P3evyUTlQfuB5A6lsFWQdX3kX94nkDaq2id8yy5CUsQQ4+9Pw/ZjZ50
 ea7nTRZLicKxpb7rjkgrFXj1yD6wPovotGIo/y0JFxnfkYX601bg7R1MGhYZ9v58tQzpqWq5HTR
 +KJcTv5FJIexS3Y1sTFfh8hGRk1VxU/Wy2+aBWDnN5jb3lXTGVX8ZPsCQt06EZKBIYJf7iIAoq7
 xHDumjdhmoj9ZcW3lhN9yeQ6oDE64WmOVjWWkpnNOLqNtCy/uOx2Lf72phm+WijoxKaZi+lxj80
 /81bSCIaJIPHX+eNvfQ==
X-Proofpoint-GUID: l9eq7nCRVhIv6SseiMUd3BxqopFVkw1-
X-Proofpoint-ORIG-GUID: l9eq7nCRVhIv6SseiMUd3BxqopFVkw1-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150073
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64875-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,oss.qualcomm.com,nxp.com,pengutronix.de,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:andi.shyti@kernel.org,m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:quic_svankada@quicinc.com,m:vikram.sharma@oss.qualcomm.com,m:nihal.gupta@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nihal.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,linaro.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nihal.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 89C73684169

Shikra contains the same Camera Subsystem IP as QCM2290. Document the
platform-specific compatible string, using qcom,qcm2290-camss as
fallback.

Unlike QCM2290, Shikra omits the CDM and OPE blocks, requiring only a
single IOMMU context bank instead of four.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,qcm2290-camss.yaml     | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
index 391d0f6f67ef5fdfea31dd3683477561516b1556..490a7f3a8c5ff9c624f46150ee651793811823de 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
@@ -14,7 +14,11 @@ description:
 
 properties:
   compatible:
-    const: qcom,qcm2290-camss
+    oneOf:
+      - items:
+          - const: qcom,shikra-camss
+          - const: qcom,qcm2290-camss
+      - const: qcom,qcm2290-camss
 
   reg:
     maxItems: 9
@@ -76,7 +80,14 @@ properties:
       - const: sf_mnoc
 
   iommus:
-    maxItems: 4
+    oneOf:
+      - items:
+          - description: S1 HLOS VFE non-protected (VFE only)
+      - items:
+          - description: S1 HLOS VFE non-protected
+          - description: S1 HLOS CDM non-protected
+          - description: S1 HLOS OPE read non-protected
+          - description: S1 HLOS OPE write non-protected
 
   power-domains:
     items:

-- 
2.34.1


