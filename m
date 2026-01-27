Return-Path: <linux-media+bounces-51643-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id i7USGyGqeGn1rwEAu9opvQ
	(envelope-from <linux-media+bounces-51643-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 13:05:53 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 169E293FEB
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 13:05:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A67A3035279
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 12:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38D5430FF2A;
	Tue, 27 Jan 2026 12:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FdHx079D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VxQob5rx"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3819B3101DA
	for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 12:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769515540; cv=none; b=DP4D2NeoIWYFzseyqEH77f34xsBOHkbsFc1pabCJ1IPkbDcGhRct5H577uNcWLFkrdmG+2r7yFOH0lRLa4gCU1I4XrK1p53Ursep9ESPaXsDMQ75lnc5cDrjQOoWct0rzliRSPlYgf8KxYeuAQGtTP1oZlzVSc+OX8JdLQYrMpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769515540; c=relaxed/simple;
	bh=rQZTW1KFFF+u9L7bVaWHv0qfwm7WuhjBt3qISDyOewA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a4CzIFUj+s2BR7qEWvRBTlTkfjdsfY2WWXnxP/ywjX5oorrJuqvcBUcUottKWUvXWIFvn+K9gHmcVBxc0Ony4fTkGAZzpvOhwp1AvoLpYLDNX3MZ0kumQB4KcuPkRVgorhqpVzU40st9QHGh9m4nOG9vt2NqTWyEkOumcMBwigo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FdHx079D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VxQob5rx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RA5YZj495954
	for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 12:05:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qvP1nha68TmjWq1yG4HqEak7RpRVW8n0oHhzBIiW1iI=; b=FdHx079DrX/8Ddji
	HzxsZsn0cyRVraRC6cMHiXQ5Jnfg25RErSei28/8OztCChmKMJWYGdjzU23wOJw/
	ve/jgXgPf6xCTO3A5Z5KySE++TsZsosnLI5SGzupL+BM6KePDcZX8E61lM5YWe57
	IsR/IX2eZt8S1tB/DFyZZgcqt4/r1g1CQg4Suj6PEI/tu7xgnAq4oBmQ0v3cLcf7
	txpnEFSrl33biccWuL8eUZ+Fl93bKItHjUzGJ5EBweX/7N1NUkVFKu/ifO/yzP5d
	xzs7SiriKjDyBgl9/MvnSV9GEtb4avD7hvGE+fKK5nWF+8JeoZGP/zse5v7xt1lV
	kzjTIA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxf3bjnc3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 12:05:38 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5f58f90f83aso3740832137.0
        for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 04:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769515537; x=1770120337; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qvP1nha68TmjWq1yG4HqEak7RpRVW8n0oHhzBIiW1iI=;
        b=VxQob5rxiaZctKS4rmdkJDbEXCTLE4IEQ/NDXTkuxwMVw/Fe9UTIMJCLGZWLpLpREI
         IltFMVQWpnKZr/CpitLI++5yOczlJFb3lV54eivoNVMzNFqXKz3EF+SZZKe/zsV1WcLG
         FuIqI3oA9cHKoJkdkUa8BNDpQvv4eOqgvJjg9cqZyBc2VGBs5KwBuJ1FwWUWA+BLeD6e
         Y96mZJPmcrU24sOx+oTDR8tQNqHEfbXs1t6FIBZ1cJYt9tWy+Zw1pRctYdHvTzhEpfjV
         +13U8dULws7zxzRsbp7TslTYF2XFLcEEYefUmLu8mh87GcRZCIzMGiRtU4gqN3xFQ503
         QGnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769515537; x=1770120337;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qvP1nha68TmjWq1yG4HqEak7RpRVW8n0oHhzBIiW1iI=;
        b=GEldZQS40qugjjwbQyYhQN8fsgedi/Jx190FvfKrkYyAmriXfcn5Z2keStJeuxbhK0
         iWXlt/CL5LbHbdI9sknZYMq6s5GwT+UaqqgZluQ1tpkUOchzRs5kMJTOb6I6IzE5nGxW
         1Ce3WIepYepvqftE3JXvukTAHIgagesZzZEkFnY3PrpoCUFWstS1e4ZKfMH5d9BSw7FZ
         nB9xIRKHon6n5kuD4icCkBSNnu+NJLx0GqTwq4UVBbeFAAWRlCWiKYZR9lM9Os+5xDdF
         OixUAR9L5Uu/R7K8pxAulj9yYufr3SaWIQKbdd1aDFMGT1NTSygY1m4J6Vrl23Aj36Zx
         W++A==
X-Forwarded-Encrypted: i=1; AJvYcCUTaenq9d8o1TMQYEqauibw4uxhlrZtWWIKyf1LSoIwsoENcC1Ms9BJBfw5h0WkOEbNVEOi2sDpvUSSCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh8F8ZUysWHANzSP+oLrUJFw3E4C0WbJoZp4QFsBCj/1TV7eYb
	FK692kF4b8s+StIXzi5d5jKvHCdCuOSN8JsDbCxzrAn4+f8NAXtDISxDnRVdyUbfy97DWk4CsAI
	U3H3cKHM94kji5yxuoVQz1128oibEjAPUgvqxRKBa0p6UBTj/Io9Q3ApwUiU98EOMkQ==
X-Gm-Gg: AZuq6aL7wL0CLGPAHGFi3dnXXoGU+TSTwTxhIycX+pr0qhU3GSx6Hs0ewLAbw6Bhck8
	k8PyD4Dr7ogy8zxqIhipxrfTMWwzuA7WuS8Ajnm2lYY+58hUXmkAQvnmOtK/xOw5mSfMeOw4geU
	8UjuPgQ5ChQefVQXQLVFf8fsax8OUJ08YyzMUt2+vlXHYpsrB6tvy+uVXyBjt2AiQUtsEcSJPTB
	ssJwIi3B6D0NaVZhtQW1u/B+JVwWyXutF5uM4XGKGnru0Dd8yHSC1iWtEYtgvwaKbeR7OIQdxPn
	anSFBZev0Wa1S/5RSyTgBuNRJOctYuCp7U/wKhvB9wrKDVz6EmzkSkLqpvg/B+BVnc9OfOh6LkX
	MBDP9TwGNoS0CC8YeV5RJZPv4UQ0hmEwbf+5zZXMqGOqBxw2ZFQv4l0g5hN5MgrOBAXygko4iiU
	uCyu3DCRRzrpPPAIM7TWRvUo4=
X-Received: by 2002:a05:6102:3a12:b0:5f5:421a:fc79 with SMTP id ada2fe7eead31-5f7237a585dmr638674137.29.1769515537291;
        Tue, 27 Jan 2026 04:05:37 -0800 (PST)
X-Received: by 2002:a05:6102:3a12:b0:5f5:421a:fc79 with SMTP id ada2fe7eead31-5f7237a585dmr638653137.29.1769515536815;
        Tue, 27 Jan 2026 04:05:36 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59de48ebbd8sm3380127e87.40.2026.01.27.04.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 04:05:35 -0800 (PST)
Date: Tue, 27 Jan 2026 14:05:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 0/4] media: qcom: flip the switch between Venus and
 Iris drivers
Message-ID: <m5nsdjbogulmegaavp2twkgf7y7gujm26da6glkbirgxefxxyz@3ac3xzbt3hwj>
References: <20260126-venus-iris-flip-switch-v2-0-b0ea05e1739a@oss.qualcomm.com>
 <83198eae-088e-41d0-ac5f-2346e422a25d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <83198eae-088e-41d0-ac5f-2346e422a25d@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 05l3LAFZYMQPU_swOWPxPJ-IYlUwZWAV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA5OCBTYWx0ZWRfX9zgx1yumq2tW
 hGfullJQQg0l1tdtsy4w2kBc8yrggESiZdvoLqhJyQHdymZ8zc2v3FI18+lcAtcbjNZz/bAV7y1
 05LCR832JfOXRROVeISeMiuL8j02ZWZJaWBhMwoMuymUtNNRGsMsXEoA68SvZsAQDkgS0enZ/Mr
 pjcxjyU/O03zVg/j7ryrk6XMtNL2yzPnyFWfDZUxKe22tXVy/lSJiXfYV1XKQxs9+OgYO5Wm4X2
 ssuKL0oeCzsPRB8nfpvGWxO1unNWtUb+aGY4OqzghMSFYPARN+c64WRslr2wskXgwBg68UVbcQM
 UuzOvvKOZGCo307RBBRxMaYRDa2b2Q1fCEvzd40oFrpzqGqq5fE/5KYMWBjbdYhcgozv3u/BFDh
 +K8CUtqR6bMFwRVpE89YOl83n9pyHUxTx49FRF0q5146/QM1LuRZRNmGDTSUAJQVCzH40JOX1b4
 rLW8FZJnn72MiTyO/AQ==
X-Proofpoint-GUID: 05l3LAFZYMQPU_swOWPxPJ-IYlUwZWAV
X-Authority-Analysis: v=2.4 cv=AOFXvqQI c=1 sm=1 tr=0 ts=6978aa12 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=CmvD_P2JV1gQd9gkirIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270098
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51643-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,out-h265.md:url,out-h264.md:url,out-vp9.md:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 169E293FEB
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 12:43:36PM +0100, Konrad Dybcio wrote:
> On 1/26/26 3:09 AM, Dmitry Baryshkov wrote:
> > As the Venus and Iris drivers are close to the "feature parity" for the
> > common platforms (SC7280, SM8250), in order to get more attention to
> > squashing bugs from the Iris driver, flip the switch and default to the
> > Iris driver if both are enabled. The Iris driver has several
> > regressions, but hopefully they can be fixed through the development
> > cycle by the respective team. Also it is better to fail the test than
> > crash the device (which Venus driver does a lot).
> > 
> > Note: then intention is to land this in 6.21, which might let us to
> > drop those platforms from the Venus driver in 6.22+.
> > 
> > Testing methodology: fluster test-suite, single-threaded mode, SM8250
> > device (RB5).
> > 
> > $ ./fluster.py r -j 1 -d  GStreamer-H.264-V4L2-Gst1.0 -s -so out-h264.md -ts JVT-AVC_V1
> > $ ./fluster.py r -j 1 -d  GStreamer-H.265-V4L2-Gst1.0 -s -so out-h265.md -ts JCT-VC-HEVC_V1
> > $ ./fluster.py r -j 1 -d  GStreamer-VP9-V4L2-Gst1.0 -s -so out-vp9.md
> > 
> > For H.264:
> > 
> > Only the main set was used on both platforms
> > 
> > On Venus pass 126/135
> > On Iris  pass 78/135
> 
> This sounds a little bad..

I'd let Vikash comment here, we were promised feature parity for Venus /
Iris drivers before accepting the latter one.

The list of tests passing for Venus, but failing for Iris:

> |BA3_SVA_C|✔️|
< |cabac_mot_fld0_full|✔️|
< |cabac_mot_mbaff0_full|✔️|
< |cabac_mot_picaff0_full|✔️|
< |CAFI1_SVA_C|✔️|
< |CAMA1_Sony_C|✔️|
< |cama1_vtc_c|✔️|
< |cama2_vtc_b|✔️|
< |cama3_vtc_b|✔️|
< |CAMACI3_Sony_C|✔️|
< |CAMASL3_Sony_B|✔️|
< |CAMP_MOT_MBAFF_L30|✔️|
< |CAMP_MOT_MBAFF_L31|✔️|
< |CANLMA2_Sony_C|✔️|
< |CANLMA3_Sony_C|✔️|
< |cavlc_mot_fld0_full_B|✔️|
< |cavlc_mot_mbaff0_full_B|✔️|
< |cavlc_mot_picaff0_full_B|✔️|
< |CVCANLMA2_Sony_C|✔️|
< |CVFI1_Sony_D|✔️|
< |CVFI1_SVA_C|✔️|
< |CVFI2_Sony_H|✔️|
< |CVFI2_SVA_C|✔️|
< |CVMA1_Sony_D|✔️|
< |CVMAPAQP3_Sony_E|✔️|
< |CVMAQP2_Sony_G|✔️|
< |CVMAQP3_Sony_D|✔️|
< |CVMP_MOT_FLD_L30_B|✔️|
< |CVMP_MOT_FRM_L31_B|✔️|
< |CVNLFI1_Sony_C|✔️|
< |CVNLFI2_Sony_H|✔️|
< |FI1_Sony_E|✔️|
< |MR9_BT_B|✔️|
< |Sharp_MP_Field_1_B|✔️|
< |Sharp_MP_Field_2_B|✔️|
< |Sharp_MP_Field_3_B|✔️|
< |Sharp_MP_PAFF_1r2|✔️|
< |Sharp_MP_PAFF_2r|✔️|


> 
> [...]
> 
> > For Venus several tests crash the firmware or crash the device,
> > so test-suite was executed with extra:
> 
> But this sounds way way worse
> 
> [...]
> 
> > For H.265:
> > 
> > Only the main set was used on both platforms
> > 
> > On Venus pass 135/147
> > On Iris  pass 133/147
> 
> [...]
> 
> > For VP9 codec:
> > 
> > On Venus pass 174/311
> > On Iris  pass 232/311
> 
> These two give me hope..
> 
> Ultimately, I think it's the right thing to do, if only to prevent the
> crashes you've described..

Yep.

-- 
With best wishes
Dmitry

