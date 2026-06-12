Return-Path: <linux-media+bounces-64637-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jhZRIrGLK2qz/QMAu9opvQ
	(envelope-from <linux-media+bounces-64637-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 06:31:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D28916769D2
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 06:31:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jeNuPdkj;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OE5KSVAK;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64637-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64637-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2927A331BCB5
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 04:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38D143988E1;
	Fri, 12 Jun 2026 04:29:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ACA73812EB
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 04:29:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781238547; cv=none; b=G5bdMny57YFeAiJ7p8AV9yJkTVyLaJhrJTEPzZUP6hfQS8tNBcBWJQUQn7OWA6UTzRYq13408akk72w2Gpt5I7hYEFsZttjk22nEa6yY55aY/ORRaz3EXeE2nF8POVA7IBFH6Lj3uhVrLE9AXgOkgCFNb9b6yuFFgKXQt6xVf24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781238547; c=relaxed/simple;
	bh=Qq3QPHQQplIj6vQL+RwVx0v0hCi7JnuK1p9NR1v+1HU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a9ZBtqHui2+XifrEBx8a7oUbkttv7yOsCL+W1HILZyCH0jpokeArGYG3v1H+BKHOXZV03flYYakGq4OqGlwFCgl2ChvLNcrL28GrLTwPMZZEeWjfoEL0b5hFLfh1QIDLhItiSdya1QpkIv0rpLuWMmLjh4PcXOltb3Ba8TQYk1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jeNuPdkj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OE5KSVAK; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C3Bb5k2548181
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 04:29:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SmNdWicmYA/hCWOfkYARYqJaGdXG2iYDvY8C9/rp4bw=; b=jeNuPdkj9czCH5HS
	Qt/sYulB+z5oP1QJXs2uwCW5tjaz1/QC5zHG5zG/ouxsZMCgo/zFXi5AMzUI3kaW
	Tidbokmz2FhKgBRrloIaek3XOLVs7HFbdvIXr5LV0klebXwQGtgh0aTznMcRZGLS
	Jzq0L+adYfkhdzni7WrAvoqtkjqCH99MkXju/iRzPwC9CWQb9b/0v72h5jnz+TfN
	UJ977nI/ixrn2D59bRs1M8aPtdcCWQoKMKn3RO7lfc/ZZgPJSfHk2yX3a3aCWalI
	F2hyK1MP99EXqPY1s5hngemSs068soo91mr755/CwLObP3U31/5bGydZVkEjfuOi
	ZI/3Lg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er29usrau-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 04:29:05 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84256bee9a9so412249b3a.1
        for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 21:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781238544; x=1781843344; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SmNdWicmYA/hCWOfkYARYqJaGdXG2iYDvY8C9/rp4bw=;
        b=OE5KSVAKWlx6vnVLft00DR0uO/adVaZZ3icZLORGW8sLQHJ0akG37TeLLTHJf9izvY
         zbNzcgBIxOUSjJ3jLngw15J+hUviYXnEDzlG2FJ3I9aMdOqzkp65nM4eXQyTNrsMOnA4
         i+hpiaJ0YPk7pwVNLQFKz2Uh29U/sb7dBWigsgAB9jQa5RjUvOibMf5JE+eTP86Y1BmU
         SLu9/Vdu1ogl7cW4EOGEt3rQPkkYlpjaO2QMDoKTetXORLCVOcXsPz6eG7rFYTdzJVYl
         y1DCZ0uD52oVyhZI7CKQnnDrYEAZcE740JfareTOaiENlDKDjtigYCHnRKks7EYsE6zS
         QIyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781238544; x=1781843344;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SmNdWicmYA/hCWOfkYARYqJaGdXG2iYDvY8C9/rp4bw=;
        b=UrXQNBCYGoFdMvbVQyP6NbXWbjFIlXmXglbUFWUHGnqe7Sy1cOhuCtefecCf31yd6c
         /cY0uL0buNFcg7LLYu+kTHLbzVltEMZkvx4+mB9iUMCamZ00sSulh6lfD5cNIQRwyVw9
         zgQO+IKERQZUJ4YnOFdACYVDeeOdwZPn7gY6ijdrG3a206nLliXmZLcfD0u1MvD0xEFe
         1jNrdDRkAu3sqpMh1KtgQpnWlyxUPqsJjVIwwdHF9wL2REeGtdaWLdssSwa8eveyjkxL
         dMKRsUylbZRVjVj1fCoNCiuKniG5j9i9lVbPn1Sj39jAIr3CPM8vnva4k3OPD+IiWLKQ
         +z6A==
X-Forwarded-Encrypted: i=1; AFNElJ9EU/0/BSdZJpCHarAo+8eEd7c6k3TX0L/yGUPDe8KRSpaASNJpI4cUUamf2Gf1huU+OagTg+jbOa+Yuw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyprrQVCdtYeQ5BB1YsB1JlCMDdJSd5SCPR9MN3G7ZUheh8XJdN
	Wxx67pVY2CoI+5XW3YaI/CCAjWuTTSkfcOytply0deP3YF6pGChdPA6SatI+hr0L5CSa9b5EFzW
	R+brB25uGHmeiifJANODK4SQgBVOm4EmESP9d8wAgxwZGYdZXDLWsixkn0YMSSi9SlQ==
X-Gm-Gg: Acq92OEJCRisoeC2W7metkWB97RWzSXPGZ+j8I0geBEaoGN4h8TQh7pMGUioKvar32d
	9LoyHTm3Y4Ex1fCdlsqAYdk0TMivFZrb7oCbwCBhvJqrEPtyNnQKshoFb4Lc9/6SFETiX2hTKnJ
	YAqgWKAHElDBJnIiQKSa4mjqAVeQK3Qg0pLUymraF18Zk45dqx/X3VnqnTRLmgxvCsgO2XEUCi3
	HOdTdBZeYPKGdU6FNMbX5UMEbBwbid53g0S+C2VtPPlJu5awCsGNPjvGDWECf0Sx8bxCIHDeePX
	XuHgAWwuSqn2EFI1phQO4UQ0QA+zzVO2Hm+OtD7KS2Zap+OJzLYMA0d81r60z2KLTV5+FADWH8O
	6YDty9UlO9JscrVxjiuTdCZBDkT+Cw9It/PFslTLV/OIH7ixuCOY=
X-Received: by 2002:a05:6a00:22d1:b0:842:6a3b:60d1 with SMTP id d2e1a72fcca58-8434ce0e251mr1229414b3a.31.1781238544388;
        Thu, 11 Jun 2026 21:29:04 -0700 (PDT)
X-Received: by 2002:a05:6a00:22d1:b0:842:6a3b:60d1 with SMTP id d2e1a72fcca58-8434ce0e251mr1229378b3a.31.1781238543954;
        Thu, 11 Jun 2026 21:29:03 -0700 (PDT)
Received: from [192.168.1.11] ([103.211.19.106])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434afd50e6sm711452b3a.30.2026.06.11.21.28.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 21:29:03 -0700 (PDT)
Message-ID: <ce7a9067-bde1-4989-81ce-c5663a20ad32@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 09:58:54 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] dt-bindings: media: qcom: Add Shikra CAMSS
 compatible
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
 <20260608-shikra-camss-review-v2-1-ca1936bf1219@oss.qualcomm.com>
 <20260608-reliable-vivid-stork-f4ea6c@quoll>
 <ab1055a2-6916-4083-a360-62eb15171fe3@linaro.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <ab1055a2-6916-4083-a360-62eb15171fe3@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDAzNyBTYWx0ZWRfX8XvNS5Vduq26
 TzBKtgFLlQXcUFo4LRZws4PlwgpYkxqrxCWMDRhH06eETeOp22+TDsgA0Wm7nD3jnJYFCpOh9Wq
 5UjsSohsQnKfmetKb6tsd+5x9ae8UmA=
X-Proofpoint-GUID: N5ywkR5dRrSG-Zvv-gtu25xlGlWb9OEQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDAzNyBTYWx0ZWRfXy2/vSmnAUtLb
 t7YOqniHo0UIRhNKrxGDEBHhTk8WZuwhO0vU92QphZpz+Q/TTZny7ki6srNOEQKa5N3WZGRINvU
 pNn3+4cypdKSkY6x/0hvUsIHpF6bictyA57dezTdV2vwkxchKMXl1XSEuAJkMqOHeZkWsLkbqSS
 cnL9zF+RxWyeMkBAgWQrjwSjL9Ce+5jZa8wGsrXA51c9lqq8oQsfuFSXC66UAEEw7IVLK/v34ir
 EjfUqc0gR5pbIsQIZLA+dYWsjQGL/YJGrD2lCVfePPJDpM21YgiUmc5IOU1DeCFjXIDwdbsYg/x
 58RyzPn0aCSv7MHOawMqMrOwiXb4RhFh5LO91mbW59BwB5r1IZHLy7dybFa3zqxZ6kYhh9euNUw
 2N3r99c4WzCC41LXlZZm9ZWu1EB9XztVkSsJMkqYR3XUHC1igOLxoy4RM9QYyGkG3f6V7s3QVgv
 LmM5Vl5k9y2RDXkzh4g==
X-Authority-Analysis: v=2.4 cv=DppmPm/+ c=1 sm=1 tr=0 ts=6a2b8b11 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=RuEr1PiGI7RNW/QBahnYvg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=OmvEUramPnncoLCXQdkA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: N5ywkR5dRrSG-Zvv-gtu25xlGlWb9OEQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120037
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[26];
	TAGGED_FROM(0.00)[bounces-64637-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:krzk@kernel.org,m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:andi.shyti@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:quic_svankada@quicinc.com,m:vikram.sharma@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[nihal.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,oss.qualcomm.com,nxp.com,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,quicinc.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: D28916769D2



On 11-06-2026 20:06, Bryan O'Donoghue wrote:
> 
> @Nihal.
> 
> If this is the only change you get asked to make, I will just fix this up on application for you. There's no need to v3 the series for this.

Thank you for offering to fix this up on application.
That works for me!

--
Regards,
Nihal Kumar Gupta

