Return-Path: <linux-media+bounces-62802-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LAaJOmkFWprWwcAu9opvQ
	(envelope-from <linux-media+bounces-62802-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 15:49:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 305775D6D81
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 15:49:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 17C32306BE8D
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 13:43:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C6A13ACA5D;
	Tue, 26 May 2026 13:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SK9ncPOu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C9DpACHr"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B333F9F2E
	for <linux-media@vger.kernel.org>; Tue, 26 May 2026 13:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779803028; cv=none; b=ke3IpssLQiS11DtevnuXKyuCB4Y3KSAMHvv1sqRbBaoJRqdfWXKagvbzWJnPhog+vubIeLMw8xO4bCwDUUqLoetnmOCGMlqK7+Rxa1aQKPOt1lkTfGpmaUfqYyOKCS3Rps/0+Hvpqku6gb0bCbtULPo1cp9/CKLNljcS3MVcT0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779803028; c=relaxed/simple;
	bh=2x+GvNK+8LsAyeENUcpy6NQiC7D+AMmUeAQf6e9WMOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l9jf0RSYf6mpyKDgTrxoColubGZ/wbF+moS7iUf4Yp0FWpCe3oMlL04nyU3Je16UHTZAG5cRs4HzdkKdMq0VNJqUD1G2l5HQmIQ46FzwiknkobILEqvPFPd/nXgCx6CrVRZyQdXVJltRyg3YgqN2kaY5aM3MRgwtFpCOjJiX5vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SK9ncPOu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C9DpACHr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsWZm2882564
	for <linux-media@vger.kernel.org>; Tue, 26 May 2026 13:43:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sSnJHbNRLCRzAj/uxtSz2ph+
	Cjf0LPA0vDHzMyAXWg4=; b=SK9ncPOubFILx13HC3G0erUqgLSsIOOXtK4ocNqc
	qrCWASWwYyroOH8PSf3EgvEMU0yHcgL6u3kZWgaOs6DF0xkM9XiyhXbqPCrefmz6
	EEZ19cHiEs6nXOFC4CtgMhQAEiNe04cwIc8VuuJEGaiNpQXpXTLVfmI3tI+XbXQQ
	t7kVjkF5bZx2jDygD4a7PD9x2Qp4kg9FuPa712FySxOmxwOGO4IMIj75mD+rOgXl
	mVMJufypweLjtvZi6rEOD+ghIoqfTfdGcyCEK5eoU6SCn4Kaf4ktvsaOIC/JKfgt
	y1fuhLFAwUj/LFBu4GRf1RXgfmpQ+DO0q8cxy93qCRdr8Q==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqudceub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 26 May 2026 13:43:44 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-95fd5da382cso3431461241.3
        for <linux-media@vger.kernel.org>; Tue, 26 May 2026 06:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779803024; x=1780407824; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sSnJHbNRLCRzAj/uxtSz2ph+Cjf0LPA0vDHzMyAXWg4=;
        b=C9DpACHrV7MayhcKk1Vo7RgWljsUOpWDi4Hsq6blxVCj8le1r6GOM714dIKd1GYzlg
         05Gcaxor33ALc1KKqXgy6HF6JSbEnnztNsgMcFlhBut9TEd+EuYeqj3dBZQ6Ur+dU3tO
         XAw7H3Ak0k4sHjipEWGoYlMQuyxzhiC27NOpJHaEkblvW9U5gYF2ajXx4TX2guTR+zuT
         buFbEMJfXeI6lUJ7Ol9DBmbjxRD3TIVY4xpSsnkVUyc2muUWQfehxo04gMiDJXQgdfQS
         5RZqlA0IhW5YGQ1qp7QgqvmZA3RGY3wAGfhjLNtFYDZKhImQJzqTHIy83luEBn51ZmWs
         dbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779803024; x=1780407824;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sSnJHbNRLCRzAj/uxtSz2ph+Cjf0LPA0vDHzMyAXWg4=;
        b=Od/9Bwt6uuYrqqzUlhIt+UxoTrIdn6oh2A2NEO3kwuwucf7ee3q6VRV8+nQEP+a2yf
         XJIf3dofAgze4dnbzs/WGmsNXvQ7rdYQBlInDXk0QSEIrsVcawZ2Oi0f041vfAaah6eL
         ZkYhczfmMl+5XLV72ijkl2qO1bNVJAAOlOOYwxYt4iC6hH+haUm5MUYNh4sD6lJ//Va0
         KZDuu+kBbpnuq++v47d5aPbE6kwd0OaMpunKjQaK3fw43zWQD32p+o/+s7lOjE+H/XdY
         YPGhea8jQEYF3BSyux5hUsF4FFVldGc+FGIGzHvcxtp/6CSLtODNCuOKAr+AyA6F/ZTD
         0zvg==
X-Forwarded-Encrypted: i=1; AFNElJ9cuDXBJffJQsdwTN6fCYULjbH0VMZ6NoDrJ/+YSgA/0SHA74t72s811D4sLDmMoTi4f6rXWMkbfDq5WA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+yCXDHSj/fLHBDuEirX0F4NRU0U6mNZd4A07q65gdTDd3n6Xr
	9F9VXN9exZBru9ugq2gKq1rG3CSgxD/2ExSK0Fwuhl+yJ2TvXunpVhtM+lL/En0guC4qlVCNZhV
	zj3U1NWwCjcH1dGvHZGUCYMx9rQGHcFdAetfG6IlF3MQGExv+u8i6hGEHi4cV0nUzfpGFPAR9cs
	+SuDM=
X-Gm-Gg: Acq92OE2ArpmwdnrlcSx/eY98/C3nlOdc6PW9oz3c0zZ2oYj4RRNho5GNE6fwuRoRWo
	ctWV36drq+FPEgaTr6C5k+QJAaHBTJ4wOs1pvwuPgko7z+2q644Fsk40jXH5KQj6Xg33LLbwivd
	dEb10rLOxY5TXU5dOojNVE6O/DY83bySfp9+ctrc8Yn++s9+ERP2uoXCmkyH2jLyj+JSDvzBbVf
	lDmWMZxVY+DB5sz6Oy44kMhe7UFGFdOY/WDiFiH9imLOfa8uCSRmMbV8TYEONQLfdBoglhztyjd
	rbhTULi5jo3YQBYKgtfkb4D0T3BmfkBLnatmA+dMOzfVVUWTJ/4W8efjbbC1mXRx1/HzNs6jem2
	0L2MzF51rZNeeqzmaDj7C/PMC6egzXIOmqzCJlyd5tVfh/U8Pxgz76We9SRGKVKD/YBEqF3hdy+
	64Rdp+/v6lyK5cJXt8W9+z7lHLitIX5dd06PM=
X-Received: by 2002:a05:6102:2c8b:b0:607:5cd7:d7c0 with SMTP id ada2fe7eead31-67c8a075bd8mr7549704137.19.1779803023878;
        Tue, 26 May 2026 06:43:43 -0700 (PDT)
X-Received: by 2002:a05:6102:2c8b:b0:607:5cd7:d7c0 with SMTP id ada2fe7eead31-67c8a075bd8mr7549678137.19.1779803023409;
        Tue, 26 May 2026 06:43:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa4634d4d5sm444972e87.80.2026.05.26.06.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 06:43:42 -0700 (PDT)
Date: Tue, 26 May 2026 16:43:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 0/4] media: qcom: flip the switch between Venus and
 Iris drivers
Message-ID: <vrbly7s7cguxdubha4mxj5hszicp5dqkdmfagqdxruadkdddqw@qps7wgp2etqq>
References: <sYZHD3u8jIct2FxvEcwr_2zJAwlRZlgApp_nZRHcBHzhnTYkersBivmgF9agXwr_MAMQq9aXHnEfhYlOs_B6qw==@protonmail.internalid>
 <20260327-venus-iris-flip-switch-v5-0-2f4b6c636927@oss.qualcomm.com>
 <ad61077f-4e7b-4088-834d-0fd7d3567a47@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad61077f-4e7b-4088-834d-0fd7d3567a47@kernel.org>
X-Proofpoint-ORIG-GUID: QBEp4JuUzgHMpP601Y4C7wPR8f1bQmSV
X-Proofpoint-GUID: QBEp4JuUzgHMpP601Y4C7wPR8f1bQmSV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDExOCBTYWx0ZWRfXz1rXYIykto8Q
 dGOmqjcW+PzwPwdDPYW7DPOlmyhCc8OkbsxMxnXG4a8ETrtvvuudVR8fBVVl4n5n0IUnlOtnvs0
 e+nACjym1yqgjJ4NC30EknP71zMRQsm/fMF9YIre8gd4nKbRI9qoR3lbAfEmRNNZ78ppCaP/i9F
 pmjq/4UFKxCnxSd4blUoB++3l8Jj+/qUYRzgrTIigRpq8ArPiNqBjJC+i5b0bVeDK43sOF5ps+u
 8aXFT56myfXp8v4kSbbFt26tRyX5ozAq99Agh9FooLYjS8EwmVLi4+XvvfOL7jeWlpYKcn2cxqg
 Z12T7vu9TxDIwPlx7HzrsMJSGLWWemmN9tg941Uwh7xwBADY//Y3mxg7mChPu+S5n2Rxd3iF3pR
 K+j+/T9BRih4cR5iPgenGdiEoNYxEoGvJYxJCudXT/yP5WzgyskjVd3iWME9RJaiAz4vM3n4qw4
 5Go8Fs5XUnysijFsFzA==
X-Authority-Analysis: v=2.4 cv=C9jZDwP+ c=1 sm=1 tr=0 ts=6a15a390 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=tuamT_7bMBkhMHfOO0IA:9 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260118
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62802-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 305775D6D81
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 26, 2026 at 01:49:15PM +0100, Bryan O'Donoghue wrote:
> On 27/03/2026 20:19, Dmitry Baryshkov wrote:
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
> 
> Not applicable against -next with enough of a splat I'll ask you to
> rebase/reset this yourself.

But you have applied it already:

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20260525&id=8f100f5896e1ccec3802dafd0f719627733c8183

-- 
With best wishes
Dmitry

