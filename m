Return-Path: <linux-media+bounces-65298-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id r9xTHydiNWrNugYAu9opvQ
	(envelope-from <linux-media+bounces-65298-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 17:37:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1A56A6BDA
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 17:37:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NTEjpDPM;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OyVJCngV;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65298-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65298-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0C1383023050
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 15:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 575423A7F51;
	Fri, 19 Jun 2026 15:37:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB5D3148D8
	for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 15:37:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781883422; cv=none; b=XDCh8oe/xOcmnii2dnlmV0v7Z+P1m7GPqd4fBzqPw/aqLN3vZVrVXaE1Ujcf9zYFrtwSB4O1mslsJeUYRlIM+j5zu0pk8O4+5XrHDTVdyteP0xDTSIbXhSGgtnis60hP46+g0XpZTX9/sGLbWyREJg+RowCVGjfuw6RPf87hPtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781883422; c=relaxed/simple;
	bh=Ue+aoWk4rNKM0Od3UOoy/W5n1XtBpOFjK2/UGI6BV0w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OubDuBPdashFcl0qOy424OyZRsXwEMOwVb3+Pi6sZ9+AUxGNiGReYD09zn3pB5ML9q5D+tLfWEdnOnMBS3nPTFbdU+vqmeKmBrXQH1SdJjHu1iwpXmEcUEj3/Eszy7MFpPOVWr1Pzhb0lIrtpliKqtrlvJ0Sl9kIHsBwoPxCWqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NTEjpDPM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OyVJCngV; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65JDBXjm833362
	for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 15:37:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l+ZBZUukYW3UATRdgCDpkV2aWJmXCVShzbz3nEXQmKM=; b=NTEjpDPMMF3fClMq
	99XprWICtZJqKb5hCefZmSdGR+n4Vkjm9DPB8qEYu4aFFUqW2+3wERYRO6NZ0K8x
	/CEeFego/qLHer9/xB+4BypzIfgNNXuTCrTCaXilPy5mq136KVEOcvXNaRH5XvN6
	HldYzixLRRiHk0Y56tfhsC7n58hRLQxe00jmpLmO5nw0vUwIma1wZAclSEFMqHV2
	NSrx1uZVHLd8R7FJjvQY8RTQrPCIqx3hZCF4Z9dAHvAGx4KPp9LcAOBQ9z+FvQ5s
	TCw8URFrGr/P+AC6guothYIFhpWY/TVtHZ+gaFTl1W46sULmb7p5cgr2Hav5XWPi
	gLJLnw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evmtjc6v4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 15:37:00 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ddb0711609so7741246d6.2
        for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 08:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781883420; x=1782488220; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l+ZBZUukYW3UATRdgCDpkV2aWJmXCVShzbz3nEXQmKM=;
        b=OyVJCngV6+IxrgWniWczhsi614GdXH8gCRS6g90jaTouhvojI2vDeXhlNdz54+2XkK
         tqwbphsLNYSjU2M1VspEWSq9yj9NI+PqJG/lbFmb0ZQqXKdKvHzGr319aNyIWcQBZV1O
         80Rgbu5jUCxPFLfSUVmn5C4q+Hm2GwCMAc8JF5O2ZSQnFakP+ypPFOKqOLjslh/US15U
         zL4+jCabbFUKSC1SbwmSVeG73TQX5Mt2pZ5oV1px0pKJPnkEpKPI+PXIkyKGd1ArX4oc
         +lv06EAAmrJYDWoA79ITAm7aahMOvnLcXtuq99/uEZg5Pszmm7361cHmXdxnW0YkCRTP
         veJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781883420; x=1782488220;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l+ZBZUukYW3UATRdgCDpkV2aWJmXCVShzbz3nEXQmKM=;
        b=ixBGLs8PVdttJ81IbVMOTjc3ROYcSRtXIojHaMpy4pymI+wTH3eeF/XAhkPF5sWKoW
         eYyUeYVa1Tl9ncgreFcubMprvdO8FppnWtRuQr8+eLRB8GAqsb4lu80tzEKFSVJUoJw3
         TpCwZ6cG0xxixTsFCKb/eKTg5934lZSoCxYvi299F5ZRE2+WC+7pThRIz6Rgq4jxrKMq
         5MpJI0aTOmGUAQcvdgIlJxZzFT7dAbtRIdwocnzAwJ+eGNwx0kYB254kpxggyRPBuUAX
         IgY3l8lp8PXR0P0PjegliBpVXUvtz2D/ogQMWn5dJKDU8LbGZOKEp8kNii1jV1joh2d+
         UXcQ==
X-Forwarded-Encrypted: i=1; AFNElJ/rdIwPeO5HXfy3ojE1YlsFIETzBpuUuzzFoBPRMRPymEi15V3phKv4gxWiqvF+tvG+IFUZzTTu9x0Ecg==@vger.kernel.org
X-Gm-Message-State: AOJu0YymGsYnGSKlC/+fblIXit1tVbuUaQ48WtMhvn4buVnlNQ+168zG
	ggWpU8L3ihOA130lL4U9qMrXHH1wQUesAe3rK0V6ezbdnw0IP6sdHIJdOa3mf88em2FagbRC76d
	JM/OPrc2YCZ4Gq3NE+7fncZRG8lL+oSX5b6H12+GwRpP+myDaJ+d77wsRYuITnK/8UA==
X-Gm-Gg: AfdE7clmfuZMc8Ps1Q/anAqK1/eCf9HeIGq7w/58pJjHRFmftKPF1P+unIJl/3jzhkC
	OnaOoPJWmT+nnPrUoeULok0kxcX08jjs8jH3O5u3tw+PmvFtQuSjBOzmxs9WV1tqmCaSRlylvki
	wy/ouWrVpG7J5fMBWySsDDyEV71Z0MEhmT5KFonVJDbtIRIuKT5gxjTiUhdHTmb0JI1FyQNP9FI
	etbwG9hFUItVy151KPP4ZsGAUmfkrIw03UcAIhgWro30SJYWxF2f0i1f64A7XzjGZ0ncnmGCcZn
	4Q4p7DZSZNazBS4vwh2WfB3xy8PUf/yIgTF5FCNV8xghVTA6ll8f2QRl3UikVn3asesHds78D62
	wm+Y43vwqYxqGAbes7dRMOXHTC2RVNde/vlQ=
X-Received: by 2002:a05:622a:1393:b0:50e:487a:bfef with SMTP id d75a77b69052e-519e4a25406mr39022021cf.2.1781883419819;
        Fri, 19 Jun 2026 08:36:59 -0700 (PDT)
X-Received: by 2002:a05:622a:1393:b0:50e:487a:bfef with SMTP id d75a77b69052e-519e4a25406mr39021521cf.2.1781883419316;
        Fri, 19 Jun 2026 08:36:59 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-696edc76242sm1042750a12.4.2026.06.19.08.36.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 08:36:58 -0700 (PDT)
Message-ID: <6e760884-87b1-4ec8-9ae1-e53901451b65@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 17:36:54 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] arm64: dts: qcom: shikra: Add pin configuration
 for mclks
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
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
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260615-shikra-camss-review-v4-0-bcb51081735b@oss.qualcomm.com>
 <20260615-shikra-camss-review-v4-4-bcb51081735b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260615-shikra-camss-review-v4-4-bcb51081735b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDE0NyBTYWx0ZWRfX49/MLpYgz0OE
 9RXga+h57CxyuQ6vaUS3d0X+4TTsPc663vlDP8OW5KuDN2ua6HMqKmUWMqTPbHQzjk6NvhmboZJ
 qy8cElpTHRnxcQzVoKuUGDIAfLzxg3E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDE0NyBTYWx0ZWRfX4WWpUjBbXg4T
 ihbP0/vm4n5qdd2XAfLonsPULMWDwnF8kSN6AjheRgjS9DNL9ZMMVzy6qqUwMOjAAA9qTUcklyg
 BA7QDPt8DxmeZiy6Ibta0wvYxTUeIWmDoKNyxOo2sRbthl1qYaodMrL3I8d9JzqbSgg9KT0VTBF
 SFLwJCrWX+WzQEToDRgD2HR8QZXN8Tp4of/qJnQ2cjg1/8mTetH5oiFQh0L7fCbNTZHupL2AxW7
 9fvmH2hptPyy8dC20tSOO5KvGC63zwj5nZ15rywD9ljM9I5E6eTb7iMLaa2IL1rE04tRw0ynAyh
 qAUZEfk6HrK3t1QeGLTw/z6HQ3UJZnvL112k6fvaJaL2gECDhpY8pDYoOHb9zOVHsrKNzAGt4wf
 cWvFOsK82lezXZxmaXuU1/CxGRbDzbZmJdF42pP+7e5OJvuCBiAD3yMjGT5r4dnbO/KojH5L3Fr
 wmlYH+17VGcNMYkVbPg==
X-Proofpoint-GUID: MbATMr5YOkw9y4CHtaszY8o_LRUBJHnN
X-Proofpoint-ORIG-GUID: MbATMr5YOkw9y4CHtaszY8o_LRUBJHnN
X-Authority-Analysis: v=2.4 cv=OM8XGyaB c=1 sm=1 tr=0 ts=6a35621c cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=EY8lGxjS-5OGnG_HtjIA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_03,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190147
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-65298-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linaro.org,nxp.com,pengutronix.de,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:nihal.gupta@oss.qualcomm.com,m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:andi.shyti@kernel.org,m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:quic_svankada@quicinc.com,m:vikram.sharma@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linaro.org:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
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
X-Rspamd-Queue-Id: EB1A56A6BDA

On 6/15/26 10:33 AM, Nihal Kumar Gupta wrote:
> Add pinctrl configuration for the four available camera master clocks.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index 57732804a6c6a114a407a4a541a1cc7af7635ea2..16b547131e8b14541abc68ff7cda126ba777ad80 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -380,6 +380,34 @@ cci_i2c1_sleep: cci-i2c1-sleep-state {
>  				bias-pull-down;
>  			};
>  
> +			cam_mclk0_default: cam-mclk0-default-state {
> +				pins = "gpio34";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			cam_mclk1_default: cam-mclk1-default-state {
> +				pins = "gpio35";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			cam_mclk2_default: cam-mclk2-default-state {
> +				pins = "gpio96";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			cam_mclk3_default: cam-mclk3-default-state {
> +				pins = "gpio98";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};

Please try to keep the entries roughly sorted by the pin index

For the entries themselves:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

