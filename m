Return-Path: <linux-media+bounces-64644-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id H4vFKiS8K2oAEAQAu9opvQ
	(envelope-from <linux-media+bounces-64644-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 09:58:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B23A66778D9
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 09:58:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pdxCmlAk;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=M2KweZx5;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64644-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64644-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0AFC03015794
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 07:56:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E7483DC857;
	Fri, 12 Jun 2026 07:55:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272A13E3C66
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 07:55:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781250951; cv=none; b=nlb5jsskJzOY3+P2KdZkFBjbF5Dar9D+E6tm0coouEwrb9m+4/4BN5558LY9wwMIWLHiUlCd/yNdxaRuRoFPCpRdPStYX1fJFO1HOkT4jf8t4XK40onoLoKYm2+LYp2rg1A5BuXj8dnnF3fx2kQneYAXKOU3Q+/ICf+mHiHkWRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781250951; c=relaxed/simple;
	bh=xj6Cf2BFkU51demOt7x8+AYXxPPZBpyfYO041yfzpz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pLBXBsFmR0hqdUTKz9FEZhOdN0Z+/9CXzFt+bJAXPiSK45moLwyf7tUwIs6bQa9w9MI0xJt6B6Vz7dWYDzhA/fNvgLt0Gaz+dXTYtxjQyW8je/yhUOsgqFALu7SjmUlcFfFyg0QlpHkWgdFAw0s9vrrgSH1G7jR1fcidADex6mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pdxCmlAk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M2KweZx5; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C3Bw6H2401927
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 07:55:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NuE4PU1Q4pHoGlJdh3wxKiMh
	dG8JaFJTJYhR0esJV/c=; b=pdxCmlAkM2SjE+v2ERBB40Gjf5EBbMy/cVjKrLvx
	zcIuKZpReK6ie12vexN0nKyOaVbne3vn+WmQrOEHnshUriy1RtNaarCmFGgMXf9d
	scYKdW+VuBY2+DE2UD20FZwRzfMdi+ZIkcTtBwTKddAIZaU8fhSZMeRjBE6wsTqU
	IJtQg07+B7FywFmRfuEK/hgw+WKBuYQ1YDExs3XSr8Ac76G5V2SMPc25GF4l5CRn
	H1HpByWWlD7qPgUx3+2SfscbwJTW0VV7v85B5Runs1mb0pqiDtjUmdSATkEVG7lh
	mN0ntIyYX3xjEqMe5dI4Y7YbBOl3hIPKJclCWWSwzyu+/g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er30ga3k3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 07:55:43 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-517afbeda8eso17802751cf.3
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 00:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781250943; x=1781855743; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NuE4PU1Q4pHoGlJdh3wxKiMhdG8JaFJTJYhR0esJV/c=;
        b=M2KweZx5+3VqCz/gVJwFS6EiLFAcQKG+bFJiMv6LW4M3pC6D24UUkcuzM9YwnsipF2
         DKaHrwhZ9XPbM+kRfOVrsT2tjcjEqkS7PBxF+TrZ0yT34U0SZvjEDs7Qo8RukfWhl7fP
         S3fv/JQV5nBnwLYR/QMdQgWx0Dm+7Lmn6KwerOp8RJQpsvtfjg9jFVI87CEYwxjekWZA
         1VnsGHpCY3uS+SOgQBNjReLflm0apBzGSxDB4BF4/wT3XVwhI4+66RH7wV48+dd5Ig0Z
         uFGd28pDZk1srWPjkpJgc5jCW83B4QrnOCPeOp7xCNO4dYgnaPlXxlVSVdc4vTkazxQe
         kyoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781250943; x=1781855743;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NuE4PU1Q4pHoGlJdh3wxKiMhdG8JaFJTJYhR0esJV/c=;
        b=kYu2Wvcv6dPI15O6he2IgIzkrntjkSH4yAB68mBdkzf4wzlVdZFJqGj4D4PNfx6Ymz
         bvPkVAVgHpz7HEs1UrUelbtHZ14L5MlH6sLYyVzTEqcsmYZH1FgMmO/IUmcnLHh/w8my
         /n8KwKWbd03LhQXpsNfdvzoURj3M1GQft2MCPj0QcvGKyaAwtUV8Wml3hGrUCg5YWsxZ
         5AFvnF1M8nd0nDsu1VhITfXAIpp9rLn2whIlR/lAHiHHmM+JkVw6lI+QjZ6xGhlcR70c
         ao0iRmrsrf42UywzKjL6NBt3ohDXZTLnPbLr4Wuigayyj26nx3c+/0LMVJ7KCzxdZB+6
         UNIg==
X-Forwarded-Encrypted: i=1; AFNElJ+VvIPP8cYHON8XMWTDyDbOJLQb5d+Yp0F3es5IFXr7AEH5QC9M72jnd2932GHFKtv5sT7ctIVK9mn3zA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoNfHZtJL3ipPbZUj8ImA5m0Wt4XG/ifAFhxWyR+eWr5Cib2rT
	LMrbwLgSidU5UFopk1QrsZMw1/PpA2gUUQUNtPgZ6YJ3kolY/Tc4yELzsCFk61KdbQqdU4E9GWH
	fdg9MW9GqSuSYSQoja2U6rpbrlJtJUeMIYMjl7FGFJMZ+YQzA7fnNtjcumTRPaVOUEA==
X-Gm-Gg: Acq92OHo+u2a5jjm8f2pxwI6niil7gNUeJk5YYMMvN+I840tnTa5kmco9jMe7K8e05j
	8F+s4rVcGNrWyafvNihTvHnR0FL+BLHJWWCf2uPle3rCHuS5ACbcILhFMcubjAEnqQv+ypW1dmD
	rBWHRwZs3lld/KjDsxRzXPQnet6XNCWKR+LUUgyvhXmXN1m3wN0BZmZN4xaMhfoldivOROT9Jgv
	vICDKKmZaBoKEf+LI992HReW7dl6YV5paorxKZ4dSmpoH9KwI24dfz7JYchD9h1cSXkI+2Upd5b
	o+8UNraSObpMzJ2BCuGh5x3HGdz4VeCsQRBDCITbeGSGIQ3Bi2kabB3qnfTd3M7tK1uSD0BCLXv
	H2WW8upE+MDiy57SStP0JfWqSFbWiZ8+32lesf5y9f9QzHfY1sKEyR80nC7gfe6A4SelO5tY81Y
	UluQR+gaqa7G7rAAUN74ng6PvJTZ3MLtyroGQ=
X-Received: by 2002:ac8:5c92:0:b0:517:a9ef:ce23 with SMTP id d75a77b69052e-517fdf19634mr21653661cf.16.1781250943031;
        Fri, 12 Jun 2026 00:55:43 -0700 (PDT)
X-Received: by 2002:ac8:5c92:0:b0:517:a9ef:ce23 with SMTP id d75a77b69052e-517fdf19634mr21653341cf.16.1781250942593;
        Fri, 12 Jun 2026 00:55:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e16217fsm326756e87.15.2026.06.12.00.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 00:55:40 -0700 (PDT)
Date: Fri, 12 Jun 2026 10:55:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
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
        Ulf Hansson <ulfh@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH v7 1/2] arm64: dts: qcom: sm8250: sort out Iris power
 domains
Message-ID: <ijevonu6ib5daesvvzis53qh5ztufrdlqdsfmx33kiajplqwhm@muhxbznlx5k4>
References: <20260604-iris-venus-fix-sm8250-v7-0-7bd2f0e5bae8@oss.qualcomm.com>
 <20260604-iris-venus-fix-sm8250-v7-1-7bd2f0e5bae8@oss.qualcomm.com>
 <5eaea87f-5fed-4869-93e5-55c9da5ced84@oss.qualcomm.com>
 <cacfl4livqlkuk2c223hgapl45ojd6hsqg5sqqd7g5g2q57kk6@codcnqhfz3e6>
 <73a30753-527b-4662-ba99-2ebc3878861b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73a30753-527b-4662-ba99-2ebc3878861b@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA3MCBTYWx0ZWRfX3STZuitkNg0e
 mEnaCSdM/bbaGq2r4XcIt+dKn6l0qyh9Jtvd63YIXWQAIAp0CHtkTfq/AMhX+HvFrgu2qShpVIs
 7v9FMebHhD2bx+LbSdtCBm5Y9fWFoA4=
X-Proofpoint-GUID: 2iIVNxsmVfHL29NscmlDarLhBFNiPePz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA3MCBTYWx0ZWRfXxIN6AyTB4QRh
 rEWJgTPoO7W7ChV5TovNMtWsDZDNMvNi4JTZxGwC9HHGRlRVO2Vf7qcHjBMSBk+tEDnyPF8LE/7
 rE4FNVbAQ/teQmRTorMDbX2Mvkb4qVywcCEDxtXWeXo47kCf9BQck7r2TmAya90riyChHNRAB5X
 5asy3fwE1WYUBMijgDyOF4OZNe7gzke08ACjEHBvzr/TWAz7nsqAhT19M9UdphejtqSr3u4IRMf
 FFw/5h0gbgIqhwv+qaKHLqkoKfx9dHatpujMFpFWxF6x+0DAnMNdxFpmyVsa5dqgJ0+j4Gtdnm+
 RI8fECpV7Dh+z785fxw80CMrgLGUc5ZxMIXRqlJDKSa9myXrME1IbMzVWfxr1FJoS9DJc17Zbpg
 yJmPEFgvRQpNkN5xIQkYtxCvOKHv2i4DYNWVgYY2PuNcDQzWB7GgFUBqI9Xaowl6vgB3bISNzB3
 NKIqrT7zGAEKV0MPUcA==
X-Authority-Analysis: v=2.4 cv=evnvCIpX c=1 sm=1 tr=0 ts=6a2bbb7f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=mcP3zJosRo5iYj3H2dwA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 2iIVNxsmVfHL29NscmlDarLhBFNiPePz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120070
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64644-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_tdas@quicinc.com,m:jonathan@marek.ca,m:rafael@kernel.org,m:bod@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:mchehab@kernel.org,m:stanimir.varbanov@linaro.org,m:abhinav.kumar@linux.dev,m:hverkuil@kernel.org,m:stefan.schmidt@linaro.org,m:konradybcio@kernel.org,m:bryan.odonoghue@linaro.org,m:dikshita@qti.qualcomm.com,m:ulfh@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-media@vger.kernel.org,m:mchehab+huawei@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,huawei];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B23A66778D9

On Wed, Jun 10, 2026 at 03:52:09PM +0200, Konrad Dybcio wrote:
> On 6/10/26 3:34 PM, Dmitry Baryshkov wrote:
> > On Wed, Jun 10, 2026 at 02:24:24PM +0200, Konrad Dybcio wrote:
> >> On 6/4/26 6:22 PM, Dmitry Baryshkov wrote:
> >>> On SM8250 Iris core requires two power rails to function, MX (for PLLs)
> >>> and MMCX (for everything else). The commit fa245b3f06cd ("arm64: dts:
> >>> qcom: sm8250: Add venus DT node") added only MX power rail, but omitted
> >>> MMCX voltage levels.
> >>>
> >>> Add MMCX domain to the Iris device node.
> >>>
> >>> Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
> >>> Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >>> ---
> >>
> >> [...]
> >>
> >>>  				opp-720000000 {
> >>>  					opp-hz = /bits/ 64 <720000000>;
> >>> -					required-opps = <&rpmhpd_opp_low_svs>;
> >>> +					required-opps = <&rpmhpd_opp_svs>,
> >>> +							<&rpmhpd_opp_low_svs>;
> >>
> >> So the computer tells me low_svs would be enough for PLL0 to generate 720MHz
> >>
> >> Is there some transient dependency that bumps this to svs?
> >>
> >> Your changelog mentions you altered this in v6, but I don't see any related
> >> discussion
> > 
> > There are two sources of information. The "clocks plan" and the "pll
> > info". For some reason, the clock plan doesn't reflect actual PLL
> > requirements. See the info on the corresponding PLL type.
> 
> OK thanks, now I think I asked this already in the past..
> 
> still, both point to LOWSVS @ 720 for sm8250

Not really, PLL type points to 615. I've posted you the screenshots
privately (sorry).

-- 
With best wishes
Dmitry

