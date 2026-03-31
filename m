Return-Path: <linux-media+bounces-57808-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHwcL5EWzGnfOAYAu9opvQ
	(envelope-from <linux-media+bounces-57808-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 20:46:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E943702A2
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 20:46:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 21D063022F4B
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 18:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50F9B38AC6E;
	Tue, 31 Mar 2026 18:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OBiv0jRY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DEaoA71O"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517CD38F64C
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 18:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774982795; cv=none; b=XefGyW0afMk5XD8+UhElztSRdOVHu/GglNs99i6WKNN6tIPESbklPVVLTFCFN/lDcHubBrHIm1G2zKHk6C/GHd3sb0CFO0ebmwlWVEgFgSL7ZdFap+JRCOXhtHDjMLsHv4p/IKloO40vhE5/sC/jDT3/96BP5F6J7CLYyc+pZJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774982795; c=relaxed/simple;
	bh=zrnIMjxXkZ1FG/FBdZl1JwIEtIQ2OE7bZ+1HVn5IA1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bfx6la24pWevoW+OTWhuEpeO6pHMcSyXjcvploROpnYxsu4WRi10qZ9CuzZpIOwIRfrvkrCzbMBp91ZXjICiTTeCtcaVRkS4r7A1majnYhbTblFgwes/ncPDhabqyKLxva1wjgIl9GFRkw97fyuCg1NoZ8NkSzzeXOYMdIauTYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OBiv0jRY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DEaoA71O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VGdH8Z3882824
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 18:46:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o8s7tu3YObr0O+v+/4mTKF5LO/Z20gad1rhJhAKZNX0=; b=OBiv0jRYBi5BYjPH
	3vJHjSpkA08ACZZWotSV9YnUcLoBSb6cEdEGNNvrzW5VYzn9dOu3+NsUmo7BrT11
	WUKhs38pFLXVw5IJ1yx0kg+nZ28knGpPDFBwJYT1yOpPjootWGW+hJvXARiTzyw2
	3D+C74X7y7vw8madNaC6LVU2CVRgWZZWzfMr1TgJ3cyuj/E5DQg6m+3+9HRaqrBM
	oiAkzzsdLlwdPn6bgtkAt7qx1oWmoljJvjc0LI6/tOX6FKrZk5/VIF3/q9hjoNBP
	B7rxmeLp7NbGZ1bfvy5QiGUaEyc03cIP427uZTVmZpCseHF+YgtgWYbulnuPgLcG
	EPpxeA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d89utb1tc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 18:46:33 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b44f7b7bbso193956251cf.3
        for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 11:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774982793; x=1775587593; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o8s7tu3YObr0O+v+/4mTKF5LO/Z20gad1rhJhAKZNX0=;
        b=DEaoA71ORKtE3TpbJ+k5YgII9N7uZqqPAyapwy0XcCHoKn3SC2w5f3mZTHk9V9sQCA
         9aCNPwDQgfnPNoXPXcDAfrdjqNwzsax/aqdGF3Awu40SsLMEs/UErlLpcek6i9RoGue6
         SXaJ1xmirpDZnUz9t7t3eHihTG/BxKd+a78KoyN0Q87y5EskaXR0m2Qa0SRPef05iHyO
         4JycD2cO1nLzA2lBoXHbi7OuWqGzSbw0K+1+PNW4ReOjrN8QKTD4q9Po837Q7SXoiF8Q
         z+1QYZ9iPqIF4qauKJ7pmHpu7+nzeLViVN2VZe8/xItlLbBeZaDeUfZFTjGEd6riWHgI
         0oAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774982793; x=1775587593;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o8s7tu3YObr0O+v+/4mTKF5LO/Z20gad1rhJhAKZNX0=;
        b=hawPpf8AjXTGsmcc+kYgjzlfvoGp76FdApaTaUjxVmicYx6xfC5/+dgdveUP19NRcp
         LfU9Pf+CEdtVt6HdMz8t9ytq9RRqWcj8MabMwhiCXynNG1NcW9LLuwyT9urV+EvrO//r
         ZyuFDO9WDASy4oamwg23+1sL7pdzn8xMiNyxDh1hb5mymFwlF8Q2ffJduI1we8TbQPc4
         wdxbnwRtf3HwxSrfbfesw+ODwkTLD/RrTiX9be4AUiLwETgCJKR21pKowqFBj7XMMbFL
         3imsw66f1uE2GVCfi5REW12bGfaN561g4zHH78lozLPDZHEDYyPeQaPN/Oo9K0ZELHVd
         SRaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrpgrbDinY6Pz3uNmp4/t0IMFiwxP1pbZqgrNnc0a01VXAuA0H121GHR0M1ickwOC+/0B1LA7/swdE/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzblFi70md0HO41EuUwoKQoIC/C+zU63yNeYtmthVcOQt9qHPK6
	zWKHwzxiUyiurxjrMJu9SiTgFto3FU/PuQECjsZ0YAEI82L+vQgZmK+vPAsWC4/ysIXggdLsO4h
	AHiExCV55Yu0X94GLnc9DpGHujFi9ErUkoHYWaEt9+NHt39RC9NRN97VVcjN/l5f75g==
X-Gm-Gg: ATEYQzx7TN7mkTWtsfalfbskeBZ8/xKHnw0eR+GiiJ+RuDES3jgI4Z+pOrUeY0qRR5g
	jy7eRsovisZ5oczOIhvHc/ren11NioUM9NG1ARtl9OSfxdu9bTuZU+wTdZ5q2J8XdYwPiYZ8Meh
	1LqoBO/YX/aYWrG/rzLvB+tAhFE9LAsXRfBQL/5PxxzQQSMzA88U+TLmMNvNt4o8KNjC8ahDxaJ
	iNLenrmkX0o4UiwJOU0/2O//Fl9tDMMPV+GHMPSKaK8rP2N2jkWJqiJcxg8KeBOvSU/Kxj9AmZm
	I1R8x0bLXIDmJQl8RyhOxokFNyNXqKUph9tCMF9W9EBspPjwbfeLcSMwP/76TpTX4OB8HEsCK4U
	wIARiFJH1pLQ5K+YI8o5OtNd72IRW0APoubEWVQCpWFj0oTTXAwL+7PfCHEpr1VgglVSOKxfY9c
	Yp2HXo74JJl2LyrNilJ1/01Wl0foBRNgZwDDE=
X-Received: by 2002:a05:622a:209:b0:50b:460b:650e with SMTP id d75a77b69052e-50d3bcee065mr9348221cf.49.1774982792607;
        Tue, 31 Mar 2026 11:46:32 -0700 (PDT)
X-Received: by 2002:a05:622a:209:b0:50b:460b:650e with SMTP id d75a77b69052e-50d3bcee065mr9347561cf.49.1774982791950;
        Tue, 31 Mar 2026 11:46:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13fd035sm2691936e87.18.2026.03.31.11.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 11:46:30 -0700 (PDT)
Date: Tue, 31 Mar 2026 21:46:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH v5 2/5] media: iris: scale MMCX power domain on SM8250
Message-ID: <6yfn6ux3gbin2dtopdxxv4okinspueryuey5vfdq633gsewc6r@ttp56brnpgvr>
References: <20260209-iris-venus-fix-sm8250-v5-0-0a22365d3585@oss.qualcomm.com>
 <20260209-iris-venus-fix-sm8250-v5-2-0a22365d3585@oss.qualcomm.com>
 <5e2635ac-35de-645b-b5e7-235923f844ce@oss.qualcomm.com>
 <x5gv6dxdum5klzfjyo7xjqull6o43okkmkn7avssg26epbvrz6@z2brpssbk7iv>
 <0b41ee7c-83fe-d604-b750-8a5a0bd62bf8@oss.qualcomm.com>
 <CAPDyKFrO3DzfG0aW4z4w87j_iWM=3dpvp=2Wgr4MX1Bin5-6ZA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPDyKFrO3DzfG0aW4z4w87j_iWM=3dpvp=2Wgr4MX1Bin5-6ZA@mail.gmail.com>
X-Proofpoint-ORIG-GUID: sXEXZZ4i_HHjh7g0A7CsoAt1RhWoKUoD
X-Authority-Analysis: v=2.4 cv=C5LkCAP+ c=1 sm=1 tr=0 ts=69cc1689 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=b1_-gKTMq_g9t4VrXxkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: sXEXZZ4i_HHjh7g0A7CsoAt1RhWoKUoD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE4MCBTYWx0ZWRfX0TxAsqhDVViF
 QmtqPD/wsE59AueH77PMR0KLH6JGwhZSTUpUrKmewdhqhWIwjhBRG0AXUQTP3Vg2tltb/R1RY0l
 WwwWw0CS5BQwDTL11B3HxqCIoggB2CWKWbY7pEkXc6kDK6GquOQPuNi/++pMP3qjEvOGLtma/4e
 XMOKbrf6t1KwcOvYuhJBlb+Gb7S+ZP4HKTdOvZP86R29JhQOX5MCFr5TLdzCuBFjZ/PT3r0y3eW
 UXHqqMVOWvywTa+soFjNKfNK6ug7ykKISGcNT49/1JNfYKl2EdMIL7MpPYSFecgr0DI1GGFFLJt
 8kC2FlRacFxZ2eNElRIaLMuHC4nudlh4be6EnrEWMdzk/rXmxDXjTGbIV9Tyo7uOJdpifT13X03
 NBQoaEOfA5hA3H15JcnoLK+vc84IQvzZxDWK3+tlIfIk3yw7alWR3UWIQSEanB1epVgVDkb04lp
 iskVyc/Cs2hS1AYx7Ow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_04,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310180
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57808-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,huawei];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 30E943702A2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 01:33:35PM +0200, Ulf Hansson wrote:
> On Mon, 30 Mar 2026 at 15:06, Dikshita Agarwal
> <dikshita.agarwal@oss.qualcomm.com> wrote:
> >
> >
> >
> > On 3/30/2026 4:45 PM, Dmitry Baryshkov wrote:
> > > On Mon, Mar 30, 2026 at 10:55:02AM +0530, Dikshita Agarwal wrote:
> > >>
> > >>
> > >> On 2/9/2026 7:02 AM, Dmitry Baryshkov wrote:
> > >>> On SM8250 most of the video clocks are powered by the MMCX domain, while
> > >>> the PLL is powered on by the MX domain. Extend the driver to support
> > >>> scaling both power domains, while keeping compatibility with the
> > >>> existing DTs, which define only the MX domain.
> > >>>
> > >>> Fixes: 79865252acb6 ("media: iris: enable video driver probe of SM8250 SoC")
> > >>> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> > >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > >>> ---
> > >>>  drivers/media/platform/qcom/iris/iris_platform_gen1.c | 2 +-
> > >>>  drivers/media/platform/qcom/iris/iris_probe.c         | 7 +++++++
> > >>>  2 files changed, 8 insertions(+), 1 deletion(-)
> > >>>
> > >>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> > >>> index df8e6bf9430e..aa71f7f53ee3 100644
> > >>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> > >>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> > >>> @@ -281,7 +281,7 @@ static const struct bw_info sm8250_bw_table_dec[] = {
> > >>>
> > >>>  static const char * const sm8250_pmdomain_table[] = { "venus", "vcodec0" };
> > >>>
> > >>> -static const char * const sm8250_opp_pd_table[] = { "mx" };
> > >>> +static const char * const sm8250_opp_pd_table[] = { "mx", "mmcx" };
> > >>>
> > >>>  static const struct platform_clk_data sm8250_clk_table[] = {
> > >>>     {IRIS_AXI_CLK,  "iface"        },
> > >>> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> > >>> index 7b612ad37e4f..74ec81e3d622 100644
> > >>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> > >>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> > >>> @@ -64,6 +64,13 @@ static int iris_init_power_domains(struct iris_core *core)
> > >>>             return ret;
> > >>>
> > >>>     ret =  devm_pm_domain_attach_list(core->dev, &iris_opp_pd_data, &core->opp_pmdomain_tbl);
> > >>> +   /* backwards compatibility for incomplete ABI SM8250 */
> > >>> +   if (ret == -ENODEV &&
> > >>> +       of_device_is_compatible(core->dev->of_node, "qcom,sm8250-venus")) {
> > >>> +           iris_opp_pd_data.num_pd_names--;
> > >>> +           ret = devm_pm_domain_attach_list(core->dev, &iris_opp_pd_data,
> > >>> +                                            &core->opp_pmdomain_tbl);
> > >>> +   }
> > >>>     if (ret < 0)
> > >>>             return ret;
> > >>>
> > >>>
> > >>
> > >> Hitting below compilation error on latest kernel
> > >>
> > >> drivers/media/platform/qcom/iris/iris_probe.c: In function
> > >> ‘iris_init_power_domains’:
> > >> drivers/media/platform/qcom/iris/iris_probe.c:71:46: error: decrement of
> > >> read-only member ‘num_pd_names’
> > >>    71 |                 iris_opp_pd_data.num_pd_names--;
> > >
> > > See commit 7ad7f43e568b ("pmdomain: de-constify fields struct
> > > dev_pm_domain_attach_data")
> 
> The intent was for this patch to be part of v7.0-rc1, but I failed
> with my pull-request to Linus.
> 
> Instead this will be part of v7.1-rc1, assuming everything goes as expected.
> 
> Is it possible to drop/defer these changes until v7.2?

It would be very sad.

> 
> Kind regards
> Uffe

-- 
With best wishes
Dmitry

