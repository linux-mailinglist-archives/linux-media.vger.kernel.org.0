Return-Path: <linux-media+bounces-61041-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMx9JFRLAWqnUAEAu9opvQ
	(envelope-from <linux-media+bounces-61041-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 05:21:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F1436507938
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 05:21:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1717B3015462
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 03:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05C2437C912;
	Mon, 11 May 2026 03:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a3Cbxw7K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FZlnF3Sd"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9FD378D9E
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 03:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778469702; cv=none; b=fgcjMU1ZBcdz4ez0cmyNM1BBnax30rdgDIgOrdb8y8mKRXXQ+eilyY8SdnK72pJk7/PsYq1fAaHIC2t55PlG7PLbDWDTwwwkVOf2TxmXXKLj9eVE+ZoAwFe9PIO2SXYUPk7kAWqY6J0Ag3D0xoBzrVi3dLlS/YYIXLWlBw/mUDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778469702; c=relaxed/simple;
	bh=eNRiDEIcluIRSwWhC80cEyHWCnUatRnuX2GHrSiDM30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LFeiEzzq4wgmpznbVWlGcXluFnELhHYhofHtgMdQQNX1kwJpvgyH4MPnFxS/cDDtXHcCiTxBx2dlT+Gxm98SRnB4PAfd6H4FDXpWsWoAW9Y6z2ruMcy6myLu9VGF1jIpXFz5PI4pR4ijLNZ3E3L4jYwJPs+uEMAs1rNDLkWw3wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a3Cbxw7K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FZlnF3Sd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64ANi4bB278785
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 03:21:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ot0AvZ++ETPuA0JLPkzl0nZT
	3QrDG0/3gj0Tx8fDXqQ=; b=a3Cbxw7Kl1S1swM5iIsFNoI4TCsmooEMOyn8FK7B
	20EXYxGH7whoOf3X/iL9dZeww+N5rBcJ2rmEsT6u15lPaI48QLfv/chJme+xJgwr
	WfxyCOOguqwX7krjnVWuTovV9GZ0WP7vBDJfnTf54DouxpN8pzqnm9GQdaoPyfmt
	c4ryzb8M7ORHQlEJuWazeQ4YUrLxlhHO8BqckmgCxQqkcLFEbO7MigzWWbMBl8Wa
	nyoqIN4OD9O419U+b1L1CxOVO40KR1omHOX6w/6le0Y60tNlPzsPs+MFfLhye3Xv
	6xTq4l8MgIuAdhqZcFFfT0Horxd2m9TdQ0fYwYiqJraBwA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1vgy4800-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 03:21:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8ee1a909037so718757085a.3
        for <linux-media@vger.kernel.org>; Sun, 10 May 2026 20:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778469698; x=1779074498; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ot0AvZ++ETPuA0JLPkzl0nZT3QrDG0/3gj0Tx8fDXqQ=;
        b=FZlnF3Sdrpa3uDMn0A6uhCNbs+3S+Z4c4wiVJFubaanlNaEf17he2CCTL7GdDbVF8S
         hPYTWiuoNH/2WXaXoCbEDA3m9Uz8ugO+BeHeE+lALKanGvmvLeOsKTuaR6IoHj2mEY2z
         4x6tm1Pf4embQcHKh4Y98f3CauqnjzaBNDFGvIPZTivsArUo/oguzMPq3lq+foTYZu9r
         4GBtb0dXmzyed45mqlqC1yA/d3Pq1xEWl1s0QSY57Pj5Q0c/blo/KTVbOpfp/l/u47Zh
         Eu5HX0C5VRHKLQZEocfsWTC0qM6kPvP+f4xoNL25gBp5Y1U0KC03843Ez8tLPnslW+YL
         5fiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778469698; x=1779074498;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ot0AvZ++ETPuA0JLPkzl0nZT3QrDG0/3gj0Tx8fDXqQ=;
        b=nPpX6JijQh+btLScNN3gFILMag6ODAG2AlcA0LMOryXvhz4cN9aR33MdcP8rRgffMl
         rDkqc+C7RCRLNGAY+STCXhcZLkTAhoyTy5uV0eUtIMSSD8QmJesfDyG/nehf3bTA332K
         4frACP78KSEMfEqgEBZIUsD+qd45dtYXpGgZXV0h8R+HxifqLIG3LR/duYaY6uFGdELo
         ShVwfR8lp7zD11inwjZS3t2h1dv8aL+F5CafyBWjA31wF5y+ujq46h/zzSAj9DfCjdX+
         kyOz3XlsnBMIPbvqQ4PYESiEg6QRz/SEHZGXFjm6AAgYc8m8x8zh5EogmBG/9evzHJbS
         DgTg==
X-Forwarded-Encrypted: i=1; AFNElJ/dZn9ci/83uZKR5/jJs+g1FhPz593bDMaQKu3PWevobedkMdhAi4/+DQT1u48YhOqiiYxRoiv4V7/lTA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzfe2mEonZpOEqP3GRNlZBhqLDVuCT03Qf0mSZ/cnHPrjxYXx3x
	5C4Gg9X+dDgkKNMf1rn3We5v3o65eCUDHnl2Qmkpo4JXUts0QZT5+7n+h9QsoYLXia4gfGkyrkv
	uCL2yeFmI9GDUXjCwMbI5VG8L17mvmp/BNvAlwjlNyb7pvKb0B1fyDsZIOCUmTkolLA==
X-Gm-Gg: Acq92OH5KA6zZDr8fBk8G0cRRxPDCCqUENuZbx4atvWLzm5TWECWdUv+0P4gKG8UkEs
	pGAHPJs1O21DRFslpyCt8rW5KY7amWQ0cS53UG42lwYPmYqPMNu8gcVS2MDpfV04FabJZXdpdqj
	Bo1U+xR+SaLu+Bzf8unAXuNXCY3attWZjARTpGVrwW/Wil2224EAr972r6KkClx1KhGkKWkUskJ
	80VsdYSu9C2npM03S7dWTo9+IHtsZxgnAT+DT5Xuh792cxV7GHwwkl4qrfks201AwAoHAUGCRZj
	NTwXsMF39/OsCfb/JeZQ/fUPmHLikpVURObqt26zTAkqab1Ba1AunnzYhoar2vvf9eUyiCvPVxA
	ji8iNf3nOxmr+OZfPJOSv3pVSu7jCf7pdnpACBFeeaEQNZ5t6pGXf7OOp2Fl9AIPTsXYD2is1iC
	CdhadZ2/2b+MJqgFi76o/GDCC5o7tgSubPmFM=
X-Received: by 2002:a05:622a:40c7:b0:50e:5f36:1da0 with SMTP id d75a77b69052e-5148e99c6b7mr178858701cf.49.1778469698181;
        Sun, 10 May 2026 20:21:38 -0700 (PDT)
X-Received: by 2002:a05:622a:40c7:b0:50e:5f36:1da0 with SMTP id d75a77b69052e-5148e99c6b7mr178858401cf.49.1778469697725;
        Sun, 10 May 2026 20:21:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8bd7d8974sm1274980e87.64.2026.05.10.20.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 20:21:35 -0700 (PDT)
Date: Mon, 11 May 2026 06:21:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Erikas Bitovtas <xerikasxx@gmail.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH v5 5/8] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
Message-ID: <s67ja4ae5ogjvidv4b6lzlpiskvowctlzki5idkku5warfdmto@gtfy6nvnf4lj>
References: <Jxt4BbN1dL8VKh_Zjah1xecAjz3c9VfbhKSm4a0K2D1MNKfJKIFnCPLj2VvdW1q4LnMIQy8bCzV3YoVnLFYUlA==@protonmail.internalid>
 <0cee27b6-f566-4958-8634-2c43e099281e@gmail.com>
 <dd435489-0cf7-4274-99bf-a591a15e91e4@kernel.org>
 <-hM6afm_Cu_8Cha9U-hrlrg6CGDEb5D3PFpPPCfIh-QgkdFJp_r0Ah9k1dvAF4zkju2dPc3FZJxvOA4V4hupAA==@protonmail.internalid>
 <69f9a6b7-7431-442a-82a2-6305635a508a@gmail.com>
 <9bf43e04-f834-45b6-8942-bcae2e480371@kernel.org>
 <eiZczGoYszhu5QDfm96oeViUfzDjhlJ8JLLIm2YmOU6S2gfCQoBeo9K2T65EzVLvv9B4lSo0k1KCVWMGLnzL6Q==@protonmail.internalid>
 <1ee77cbb-9894-4b16-ae2b-8e9035fd6cd5@gmail.com>
 <6cbb9b37-9560-482a-9fa6-15d5370d258f@kernel.org>
 <1c2cdaf2-fe30-4443-b164-c37c26f3dd05@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c2cdaf2-fe30-4443-b164-c37c26f3dd05@gmail.com>
X-Authority-Analysis: v=2.4 cv=fpHsol4f c=1 sm=1 tr=0 ts=6a014b42 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=bAtGagR5AAAA:20
 a=e3rO1A9j5ybCLOvar8sA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: 5gnTCwpP4yPSzedGxGEDK2m3XfDkJf1h
X-Proofpoint-GUID: 5gnTCwpP4yPSzedGxGEDK2m3XfDkJf1h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDAzNCBTYWx0ZWRfXzyddIbxKpHws
 1WuSvhcbmyqL4y2SpDq8nqiu/gbJIKEEH1GfFlAQfSDHQu/ZjecX42m79vbk0hX3TXxkQCrjTNi
 Oz9XjXaU957Tl//scPx3a55vOmRiQVhePCemCSJUEbLdzzBH0BSQXSHi2tCjgqYHQUzLcn6/5cJ
 neGHb3IS9lzBe13XRTUQqapTTjB+8bVSBc+k1PgIrwhOKeUr/5yBQmomXekcHRQtyaeoLnkfEkh
 U+hlM5Ve5SiuSrR86O0PAsUpA6Ju1wTYqPCFXaOgClVQJexZHOJrN841Kej30vHF4GDZ4jxQ6uA
 wgMUvxyV6wFRwOrZiehsmnwkYsOfVDXQaDokGRvOfm3X8yXqMuw4AI+FiKon60s42inFhKKolpk
 kn5nI0hL/HuGF2YQwoSxhl93yDSw+2C8RehLtbqUo6DQe1y9ZQVIkNm1wg0a1IikxcTrDh8Rk1I
 Dyr0o3sXJztjrNK94FA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 phishscore=0 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605110034
X-Rspamd-Queue-Id: F1436507938
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61041-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Sun, May 10, 2026 at 01:14:02PM +0300, Erikas Bitovtas wrote:
> 
> >>> Last time I tried to enable only 1 of the cores, the following would
> >>> happen:
> >> - If core0 is enabled, HEVC decoding would work, but not the other
> >> codecs.
> >> - If core1 is enabled, the rest of codecs would work, but not HEVC.
> > 
> > Can you be a little clearer here do you mean - doesn't work on that core
> > or doesn't work on all cores ?
> > 
> 
> By that I mean that when I tried to play an HEVC video with mpv with
> only core0 enabled, it would play fine, but trying to play videos in
> another codec would result in power collapse fails. Likewise with core1,
> but in other codecs.
> 
> I assume this is how cores are split - core0 does HEVC decoding and
> core1 does the rest of codecs. This is confirmed by downstream code as

This is correct according to my knowledge.

> well (although the cores are flipped - core0 is the rest of codecs
> ("legacy") and core1 is HEVC):
> https://github.com/msm8916-mainline/linux-downstream/blob/b20608408caff817ec874f325127b07609fbaeb8/arch/arm/boot/dts/qcom/msm8939-common.dtsi#L1589
> https://github.com/msm8916-mainline/linux-downstream/blob/b20608408caff817ec874f325127b07609fbaeb8/Documentation/devicetree/bindings/media/video/msm-vidc.txt#L35

-- 
With best wishes
Dmitry

