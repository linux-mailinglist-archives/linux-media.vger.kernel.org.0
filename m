Return-Path: <linux-media+bounces-62281-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJWmMvyuDWrW1QUAu9opvQ
	(envelope-from <linux-media+bounces-62281-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 14:54:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C2758E491
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 14:54:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B480C312D3D2
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 12:45:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 358DA3E1233;
	Wed, 20 May 2026 12:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bJKrYH+H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZmZBGr9h"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF8D3C661A
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 12:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779281156; cv=none; b=EbFjv6TvCD6afjIm+7Li+5haj23fsU06v8PxqGZ2H6FaLCjVsitRh11LX3lQy4PkgZhiMAAalIaKAJ0Xlto7wJGmxpN2YoPrBnUMYwQg9bX9ThIvdBauJYJWI7hu4ldextpeAZjGQK5QTmABTx0va1D/7cHbtQxD2BjKXCLdkR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779281156; c=relaxed/simple;
	bh=cLaTmSKhZdE69LzIgcez/DsGhTPNYNcrI9RL0CruJ5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HZzlzNROH1hWXFzwchjEZgK9+kMoyeX6v5CTrrCulcymdoExW6ZjG4Ae3aMgX9h/8efeia3X8EZiHP1EX41QfPgVOBaU96lbIL7yH2IPbZYKnKbVYqRTeFfe+gu6ud+8+PwsRhc2QBGlw67wbQ4JWKScqEhK4jTHRFU5qECCKw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bJKrYH+H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZmZBGr9h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K6kNWg1725321
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 12:45:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cIZhTAzDt9+wu0W7bhluPXYB
	8tTK/ULqj6C6vI+4RFM=; b=bJKrYH+HZjulNKG2nXTbJFE5pY6emoCZ1RcOpXoq
	HXkHQ92QHj6os7+z3O3bpOMY7W7DN2TN5b5UPzpda9mZLuAS27CGgatIBNS2zqju
	GsocGnD0zr81EiY6gImdXecz/ASrZh+Q3KJ9MYSQV40m+CKba1NEfY1Fx6Jn581i
	BYMdzKMfiHVX9JzdXNuPq1z/nwOHC+dN7T1UsVomfbWvcM4TXyC2IkNZx7A2OYnP
	6Vn2mIf0a/P+mKl4lUz3haD9lB4nJTzamlD4g9W4XrBsOExzMLvlxG21UUkpqZHF
	m4pVbaO/Vee4X9P4PzNse/kXjwj8uGr2KEg3Nh0ZaIqU9g==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3qms2g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 12:45:53 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5752402f5e1so12815791e0c.1
        for <linux-media@vger.kernel.org>; Wed, 20 May 2026 05:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779281152; x=1779885952; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cIZhTAzDt9+wu0W7bhluPXYB8tTK/ULqj6C6vI+4RFM=;
        b=ZmZBGr9hCRJ8sHrQXwQEA8zcRy6siYS3ekwjNd89jFYGQGQ0mErIzDfrT6bMOd+nub
         H7xBMJWPk1N897u5c1mLablto7GcrfYuIoUs/5yD1pPnQfpzprlZT+OKRRzizFsxbgZw
         DHb78CULZD60IDJ+hNWpjJGLN9UWn4fdbyoDLtgNpAd8fS5aNuv1GRKDUxBVP77beY3h
         ytxmwU83Lzh4x6V7Y77/Sy4qs9i6sBXtwjT6D+JsEZOVGuvoObbpTSWNlQrfGjeP7d5e
         HH+6IHRJ97G1ClIhdZOFWsvteyJFaM1DH17duzBazSHU8PZhGhLeo7IvhP8cTMGo9AOp
         DJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779281152; x=1779885952;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cIZhTAzDt9+wu0W7bhluPXYB8tTK/ULqj6C6vI+4RFM=;
        b=LQaXYGbB2Pp7tLFGCWmWOydIbb601Dpe4SeKnyuUrkMbzOrETd1up1xkB4rSVrJYtU
         guzT624QF/v9EvPiQokXnDVcngngs9y8BI4DEeKPDZLZEYdw+BzWPyFv0Q/uv5gtaq4b
         9+tl4eV032+LSe3Nrop2Eh3zaHb0tR3mumQFqv1DL8SS5ftAvR6IXudA1doiPL4UZfQb
         Rb4P0LMOm+bO2hdVaX7vFNBKqjxYAaylV56z4nBAkKGcwPLkGwxSI3gA6ffYhIb3AOgM
         e0uqSh+A2GEhgujOiVt3TjijL7uvHzNwio8zx0Kek0V3Gnx+kBUJtkRzG34ir+bBKcMm
         Lqhg==
X-Forwarded-Encrypted: i=1; AFNElJ9hAlGqzAhZm2fTHcZ6aeZYzHQb3eN/D/Eetu4EjFHlQfveK8XOyAl1ITPkTrXQ+JIoQAU2KAsB2fTRJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLQhHm/GwOVBQLc+8qmCSQyQfLplEepKBlBX4eSgeJ3oEX1Xbv
	X090UBIl72yp8/NsMByuiMpWgww0ymmR20oQB882ma/vrmfnrkuC5jUb2mSSru2eDOkR+6Kqouc
	cvvgPWWSMmd/hyrXqNiKdGF4oLF/njjcF+0qtDscUQs4aL8SyeDnWBC8EVImR0qbvVA==
X-Gm-Gg: Acq92OGxC54Ca+ipxWgJLb/jEphXN1f/ezSjG+bmtKbhP2xA98TYQCMcIA/VPf7arED
	1vQCj7hmnbJ8mQG7tIi7MJWYluPNA2uJC2NGQ+AHip75t4dAb+xlHpjJKw1aK1eKW9wy0Fy2GXw
	GyueMspIJlY5OX1QWNRWF0vkeepBRrnMYjiveHvXOv4dkpa6IH5DekrRI4Zzsii7zNgcvvE46h4
	FtkBwUlsrMIgek/5mE1MPto06JvHO3aX4Nu4Tky+d8vsGQN93mF9kjSiFZom5fGi9+nBv54lp2+
	RsX0DpRliwSWBGHNQU9FBMbz6QQzmaENMrFcOFnewixPoJdzEX6ukFkwDGUBTISQD+pLgRLcN1F
	9L0LJPRE4fGB9r3Zvnub0t4ZIJvmrtn+JvWxVoJURmBnjdlAz/6XATdNTNfpVu5NoM0OK8uqCCa
	ee2RQja48GSdz4XDkVSeYxF2tRDZn92L1SEWY=
X-Received: by 2002:a05:6122:a5c7:10b0:577:51e4:ef1f with SMTP id 71dfb90a1353d-57751e4eff9mr6283728e0c.9.1779281152535;
        Wed, 20 May 2026 05:45:52 -0700 (PDT)
X-Received: by 2002:a05:6122:a5c7:10b0:577:51e4:ef1f with SMTP id 71dfb90a1353d-57751e4eff9mr6283671e0c.9.1779281152095;
        Wed, 20 May 2026 05:45:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164c5712sm4836341e87.59.2026.05.20.05.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 05:45:51 -0700 (PDT)
Date: Wed, 20 May 2026 15:45:48 +0300
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
Subject: Re: [PATCH v8 5/9] media: qcom: venus: migrate MSM8916 to new
 blacklist mechanism
Message-ID: <mvlslbtufxodehvqqcmhihtchct3tegjbfjl2nmt3bh3fczdze@4fnrrtm2njlv>
References: <20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com>
 <20260519-msm8939-venus-rfc-v8-5-542ec7557ebc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519-msm8939-venus-rfc-v8-5-542ec7557ebc@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEyMyBTYWx0ZWRfX7PsggCOMtzbE
 aGE6GQ8JWz8rULGXNlrS5GSnPTgIFYLgahKHf6mvggiXo4m0oZ3ikrKBBIfYYqNNBkkLShLdxZG
 BjY/Lq1D+MleC1qi5xjmRHDKmo0Ekrc3+ls5Ychk2VGdNMMaxkGMN1hMU2frbestCuomjJWFfAW
 GfWdkP4Fp+X41bYpJdmHWAL3HW7PuMlCyuZd5VuS/oijFAbUpNflPCk43KyUZMCbdgy3s4BbUmI
 0pd/duEkwCBXUrMM2vZXC8t5lLGsqxRT8eWHuRptnWvlvV8i54OtcTSoA9KZ7YQUykYy6U9Jtzq
 RvBHxsdYdnBcXYFMub/svABSe8N4ckWaG0PJjr8ar8ie455G6hadcQxt1vc13/kWuAECSYZifdX
 9SriUjv58nQk+UAW09fZpYeCHvRo/UOSm2mS146mfItxgxCQmY9yjtCktmCspBi6UKc9ThuJ9gC
 E/eNfPuVxlBq9djdWxA==
X-Authority-Analysis: v=2.4 cv=N9cZ0W9B c=1 sm=1 tr=0 ts=6a0dad01 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=pGLkceISAAAA:8
 a=FYQP979REZT08Aj4asUA:9 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: svF2iJx301Rcup86n9lSgESqj4yfWiWL
X-Proofpoint-ORIG-GUID: svF2iJx301Rcup86n9lSgESqj4yfWiWL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200123
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62281-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 63C2758E491
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 06:10:50PM +0300, Erikas Bitovtas wrote:
> Blacklist unsupported codecs for MSM8916 reported by firmware to prevent
> them from loading.

This should be squashed in the previous commit. Otherwise the codec list
will be broken between these two commits.

> 
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---
>  drivers/media/platform/qcom/venus/core.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index a87e8afb23df..3baa6bb4968f 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -684,6 +684,8 @@ static const struct venus_resources msm8916_res = {
>  	.vmem_addr = 0,
>  	.dma_mask = 0xddc00000 - 1,
>  	.fwname = "qcom/venus-1.8/venus.mbn",
> +	.dec_codec_blacklist = HFI_VIDEO_CODEC_HEVC | HFI_VIDEO_CODEC_SPARK,
> +	.enc_codec_blacklist = HFI_VIDEO_CODEC_HEVC,
>  	.dec_nodename = "video-decoder",
>  	.enc_nodename = "video-encoder",
>  };
> 
> -- 
> 2.54.0
> 

-- 
With best wishes
Dmitry

