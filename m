Return-Path: <linux-media+bounces-64641-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id I32jL+66K2rrDQQAu9opvQ
	(envelope-from <linux-media+bounces-64641-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 09:53:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDAB677772
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 09:53:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="nU7nlP/S";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LDayq48i;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64641-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-64641-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ADC0F301954A
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 07:52:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 886133D6CC3;
	Fri, 12 Jun 2026 07:52:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B0A305684
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 07:51:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781250719; cv=none; b=CJTxObMUga/RQ1HU92o3jeWlRO7JxKPx/A7hlBMyFWBxwfiQzKaEDkucm3wK+FeKq+xVjz9DDWa5EXoGBCHrdjG9C6PEcxcrduTLXpB9ZpiKBZjwHKuIMgjJ2V3MMDbF4eFuUv7UgbC/N19ipsx46XwX/kyKGGKKaiYqpFYaJVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781250719; c=relaxed/simple;
	bh=b7KYIiMlF/9IXjY755wYa9Q/bHax8hXlvf6f6aHkvhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BFKRVMTUr/to+ducp2c/5iyWG2PBQx8nWvA61JSWZRiKXR8sgKYI/GxB1NqqFe245Lw4hpGWPmWf/uG6LHjnNCXXcPoT+xWaYx5HybcjKGluZMezs+mGgJULez+oYyqIyZMwV+OLWZrzKrat8UchD0+DOmfHRADZA9D/z1N1WgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nU7nlP/S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LDayq48i; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C3Bw602401927
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 07:51:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fpsArPwz9FEHjPUbxMWOxmW+
	LfOf1a9p/XLNuwIbeoI=; b=nU7nlP/SDjxlXsRfjqsXqP+7MA+gBE8npb6AcSPu
	Ji2YrHUD3mAtiD6jHofkBtIGMcbln2SCBt65kb/br7+OlLdm1B6w+D5+ork9wuFg
	2pghlrImhNPLzJJGmLDeYdaSSD7E1+CSBysiQpYoc3q+IZISQj3p47GTzXtGbhRP
	PEemJqxCVuNJByS5lt8/EiRVaM6pENPDZZXMhwtm9ixUdKAHmgPX9sO49aBynbNZ
	KaaMvn3a8GzzvhQZ3bEBgm4efd6j7g8+1LfSwW+XIEryj4JVmxy+sRzQq3M43pcr
	lHyg1KRtpIGASyh8Mpl1CmEHQpnzKkBdR3Zm1DdKVPeU9Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er30ga391-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 07:51:57 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ccd83d58d9so11161026d6.0
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 00:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781250716; x=1781855516; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fpsArPwz9FEHjPUbxMWOxmW+LfOf1a9p/XLNuwIbeoI=;
        b=LDayq48i7BqypEnMvLupryfmDBAFcw0v+Jcru7fBSvFPIjDRhBceztXcBmiQbJmSd6
         ZzcW13W2GwqWNwaPfO4BOC0PQz/SbumwIM8W4pK2zxIslVTQvKWJdPPbcltVJPiiAlu1
         txuzusmHq+dEJALfVw4W4bIP94gX6nG3bzMhY/QDBaf4U1vfU8IAiXuAcIQVN5OT/ViK
         XTuVxEdpd6eWaPIYn43jBa1XDRY1eGmowLZ1jhN6qAXooZO2ZECM522fbgX9/g4YUfOo
         XhxhWngi7g5rn1NXeQGt08HUTs4dHTdgvxMNNGP3Xhtckw2EnITXLgeVKUmjvMnLhyMH
         9OuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781250716; x=1781855516;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fpsArPwz9FEHjPUbxMWOxmW+LfOf1a9p/XLNuwIbeoI=;
        b=syhon0AkL9j9b5aU4jRhL/jrZakKZzKUNbv7wnWD9mnckzyMBvskY9kkZmei7g3kkM
         NCZ3Bb++GOUa9/wIY5Mt3pqefWV4Mgltr7XfwR+LXHdKJ7a2WFOk3Id5ApQb8JcvxcKa
         o7oIkvOgF6V2Ks/g7tMr6NpFMa/I/k6RZMSHoYLaTlHcURHhH5PWjZodcMkhrlfkuOuE
         qkUZmsq/A/2KLM0XPYFqJmpa2KJuGj18ddpmjowy15BZvqf3OB72w8QrrpLyA/2JDVR4
         3x9tHnkK3EsRd0JK4ExXC2tRZab/gr0+0lHWagt4LkIW02xiNx74YAibjLoNRklsEgBd
         yw2A==
X-Forwarded-Encrypted: i=1; AFNElJ9KIe7pd2palnzbnET3CVGfmH0z1h/XXgDwaqvLpJ/7tnq1sqAqYzfyam24hbxVqY1MXJFo/YkE4WXIeA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXjtrFpDSLp/8+sjb2MbxHPVoqYcjFjsXGMDAdCl+JJiUG1eMm
	hhhK5jK+Pfxn9/XQrx5vWbqVyjAaQdyQ7/L6b6SpWmvYuXuUTYcfVLreDwHT0YaFHg87QXZQDeo
	4qaM1YT85UTxGvkedRgJA0hKshe47bH7CAxLKC59ZJKVJf8F82zehpIzq9mzV+T77Qw==
X-Gm-Gg: Acq92OF5HlOczeos3Jzl/VV1qFMwfdvgxRX2mIQiLFu22HVEPEjTWWRJEQsB0edBOOf
	i56FuVSm5U1NFPu3UmCCOMMMyga8G9BEDv6lSG82gnCkgdVpp7dslSFZFw/BNFpveVZR9bXat+D
	dwzUgh6F5fKbD3q9I3+MmitGt3lNI/ZSOQFjeK/hyjaxhycouWOvw5q3bzhjCfmkaO9gFH1ywR5
	QBFukRG2CyltkJjgN9yXUKx8m3N2JgLV1yLJ5gqttCpt2NaPLMR+YJ9okP4Eskk9NJaXf/NuYlD
	vkFlSlfyNE15tPKy1JA4ZIEPQ9+ElqAE943N/EI98T+bfHBp11GOxyPi7TY/1JPUrbO1CWrYyEi
	/CZy2cwZ3P1Q78/PItPmyhueddUJJE1L0ZKLroDzsuFdQJLurF7JDdKiMr8YhVp7YodkrKGJkzb
	VYuVvh+5L+n0n1QcSq5oxxnLyVpRRtPq9GXSo=
X-Received: by 2002:ac8:6f06:0:b0:517:c38c:74b2 with SMTP id d75a77b69052e-517fe61950emr24707101cf.54.1781250716496;
        Fri, 12 Jun 2026 00:51:56 -0700 (PDT)
X-Received: by 2002:ac8:6f06:0:b0:517:c38c:74b2 with SMTP id d75a77b69052e-517fe61950emr24706711cf.54.1781250716010;
        Fri, 12 Jun 2026 00:51:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e161ee7sm318033e87.13.2026.06.12.00.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 00:51:54 -0700 (PDT)
Date: Fri, 12 Jun 2026 10:51:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        abhinav.kumar@linux.dev, bod@kernel.org, mchehab@kernel.org,
        konrad.dybcio@oss.qualcomm.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] media: qcom: iris: use disable_irq() during power-off
Message-ID: <rhwe3y2p6btmiduhbwzfoxnlm5rui2s6p6ydlcuazi7zpqx7oy@ulqpio2ygbbj>
References: <20260610141511.92352-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610141511.92352-1-dennylin0707@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA2OSBTYWx0ZWRfXyUKdNuXTwbiZ
 UtZi+ciQhqVllLPywdsAvwBi8eq0qdWJYEef+TBHX6WpSCz206UBOCKV/J49h66hEGRe/pg3oYH
 fNKCJtxuAX4iDOLhU6uOktihMoobJAs=
X-Proofpoint-GUID: MH5SKZagiwf1MBESRG1j5Pp8HTqYF1r_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA2OSBTYWx0ZWRfXxLJw+5oPD0xE
 Wt5NBQH0uj4b0b4kuDMFPB91C15sbbd0nuyKyJfOmjr+sRWpxj3jAZIqe3H/PmqKSd65xL6bz8/
 rsg7pc4OYETKF+WrXFx4bvO+1IACsOdIvkfCOiuMDuAatSaSu28L3Gg0xbuhjisrAtwkIwwmZkk
 uz2OwLX+P1fZaUjNzPm50jElKVoaclnt+FwT3Snd8GQwqAb9bG3mcp9HhkF5vRL0ysjsoVWQmhI
 v9w5OkfPgrYLba4BKl+xQMxzSZ3sVDC3bAcPu+xiWCjsD1AVn64cS53xw17bE+V2OtzjBBK8Nep
 b7TrfuMRir2Gzf28uW9YKPAAqmGf5IS78mKP6hWVC3jxCDtSj/5TjsZti+9mRS2qzgNIDQWxGx9
 wQVJnau4xqbmB7FtlsQYTllKuhtRcwxzDUy+jwsUjkS5Gbxncb/jWekStINv/mOr7dfgRIp75w4
 Duxr5V+VCcBeEmyqGog==
X-Authority-Analysis: v=2.4 cv=evnvCIpX c=1 sm=1 tr=0 ts=6a2bba9d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=i9UHGDUotTi0YGreMNEA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: MH5SKZagiwf1MBESRG1j5Pp8HTqYF1r_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120069
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64641-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dennylin0707@gmail.com,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5BDAB677772

On Wed, Jun 10, 2026 at 02:15:11PM +0000, Hungyu Lin wrote:
> The IRQ is registered as a threaded IRQ.
> 
> Using disable_irq_nosync() in iris_vpu_power_off() does not wait
> for an already queued threaded IRQ handler to complete before
> returning.
> 
> Replace it with disable_irq() so the power-off path waits for any
> in-flight threaded handler before returning.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
> v5:
> - Drop the runtime PM check in the threaded IRQ handler.
> - Use disable_irq() instead of disable_irq_nosync() in the power-off path,
>   as suggested by Konrad Dybcio.
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

