Return-Path: <linux-media+bounces-52056-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKhCLKL5gGn9DQMAu9opvQ
	(envelope-from <linux-media+bounces-52056-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 20:23:14 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D66D079C
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 20:23:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C864E303D2F1
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 19:22:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57D222F532C;
	Mon,  2 Feb 2026 19:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hege47Hd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V+GZBBeg"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6D13009DA
	for <linux-media@vger.kernel.org>; Mon,  2 Feb 2026 19:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770060154; cv=none; b=C9+1NfGbZvOMjeLhxWZ7UvM5RQ7p6sT8YASXENXvvtz6FrrF5pSikxb16Beo1ya6y7ylaagdN3/rJVeZ9VMgdyoQ8d145/lRfHaFKDGa+pwNPYLgD1qJM6KcD2sF6BTQDNV6rRbkYzSbqKbk7UsByV6J+/dpDjK5RTNeCpmNDmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770060154; c=relaxed/simple;
	bh=DYOamzKGh7mXxypwNElwACUDgdhs4fTQAbquZDHGhlg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M+LA5Ps7rDQlaRcNWJYfD512Y/wyuhEozXjiVazG0xlyBM2nxtR7KUjcTtgQBokXs1mk+cSCvNYcOClXIVPHtifiHEOGexKOTiy17f3YJy1jn/yKbd8L6QuPnuKZqPdPqDSPIBFJRuODEyOvhaqGMaReX+gn4fziFxog7cRP3Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hege47Hd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V+GZBBeg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612J3eMP2100879
	for <linux-media@vger.kernel.org>; Mon, 2 Feb 2026 19:22:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=btWkS/c7dprwal4TPhyVpLCd
	6iARVOljRFkoRjoQnrI=; b=hege47HdG5UdDYNVdtzNh0EKWO1NWXkWYrNDKUpJ
	qZgcCBC1kRhLgqFNwgfkpmDbP1q27UF5voi1xmqP7NWXRQE7r/DVpga0Dmd+ojH6
	bDc0QXrXmBhFhGuloC55hF9gQllwqC1SBIf6CTL1MByFiBxVb9qy3znG4sfOEfwc
	PpeWGQ7Uu6cjSRffjRcc0Kl+69DISyFB4a1HF7W0pLIltEkleVjC7zeHnUEa+Vkr
	Dy39axWd4Pv4qKTT1p5PeGvD0lbLSeQ6Dlfmztz3lGUwOFia+IGX2iGRWemg5muP
	x2Rb1ET+nDPs06vlrCAeKFsJJJhXjFr6vXIRQOVZ3mELMg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2t5e9p36-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Feb 2026 19:22:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6b315185aso898905385a.2
        for <linux-media@vger.kernel.org>; Mon, 02 Feb 2026 11:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770060152; x=1770664952; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=btWkS/c7dprwal4TPhyVpLCd6iARVOljRFkoRjoQnrI=;
        b=V+GZBBegDSpnnZTb5H+sm6BgTP/zi2382WgYfTQprtwJjdq1cQaK3u1fW/FAt6JhYY
         Gh3ANB86EMlQ04GPcaiZ0Sn81zTtfTasu7by+ca4YltMCilPa20c5PzQp5WytjpEaaxj
         dO+r05kCwm2H9g1KUXx6GTlSKTL79tD0ncjwLi5TYtATAed40/Sj96h0KisZU4Gy0g8A
         c1mbFP1J8PJDu/i4WX4CWDHctGoLxOfnlgUC1grOA2xqnKg8tRit0L698yzo3u/lhnf1
         dQ2C3pOFmXM91u15SpA++CJud1Xg3/VhoouF5VUE6L8R5qhCBH4LZAkwCzdTNmhUeJuc
         x8zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770060152; x=1770664952;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=btWkS/c7dprwal4TPhyVpLCd6iARVOljRFkoRjoQnrI=;
        b=nDnfq2MWIus79Nihjsx7MEqLM8uDLTQbyEvBEpSdsuGopCQD9g0/rKO3IuAg9j4UgY
         QRfC1chhIoG1kV7ZjTYHp5lgD5WT1WGPxibC1f4gYDK2+3RyVDSj0wW1O7JKitOB3VQt
         cLeW7/2dBUfJ8hTZvhGSgFgr1wtks7FKWP7G7S+8Ui27S3xcZ1QYVHMqGFt1Ro6heZgI
         ZBFXCEGeMNkyXapb63huhHOqxtOph5VFCWJNPFCDUaknuz6ok95Xbx1HWl3gzGyltdPS
         eQRkNGAOsFxZJoVC2SY2YAzPrNLrISHQ6nnBFtmU/8f2zkJ7OaQrrecmIuldHSSJgOU7
         woTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZLGwdt+gunw/AB4HMUCJVVYXvrgWDNjzgv0cQGEm0cIDusLEJtIMQP2l0Z2N093I8yTnmmiROJ2wK+w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzyo4uFAoTG+eMu4qPYwv+k+TRu64rzLlRQvuZhCHQ9Mht+bAW3
	Y5KVClTLmFaf9ada1QzcnQSc1dMMn4P+P2E0rR3zb3DLWzniKFeyrqOpjOjv9EQeEueHhVkfbGQ
	hzsmiJa5AdJspyfnhLMBitPQwOnZ6OGho6iwfGfII/ODeyWkbFv1wgWu2r8y3W1livg==
X-Gm-Gg: AZuq6aLkI9xoKx1YFDGvTOuW6VwggmtRpQSYn+DNrqkC30GdW1as4kqkbovZmcw1jFu
	N0oIF331uFtDAajKQC3tQ0N8tE2NbV4DCVnDevShxZccjLym2D5sCp13ZTCRLpjxglCPQc+PdJi
	DyCRALaJn00aT3bsePNu9lphSS3XfJ9dG2UzXvquBPcc3+peDpkVkQG774u+gu49qLSVT5Fl13j
	jVEO6UaWIz3JmEkoZLDV8ws3CNBqUCSw4L7Jb1XHkNNxOhNpq+KIGFeWTOJ4e/am1f1DttcsQTR
	0FL6etT1flO5uxMUrz+Lo1uiEtouZvK5OC75Nly4507cNcDiptd+12UZsx6nu3jRrVbBSBoSnfC
	ghburRqyt4njZNUOfZP3oKkgl7sjvnbN1WqSX+t2QfBq7MxnqDnOpR71vou9D5AKH1FUL0XRNi6
	3YYr9+wQSsGUvyhaQfYEmCDnA=
X-Received: by 2002:a05:620a:254f:b0:8b2:e70c:427a with SMTP id af79cd13be357-8c9eb2fac2emr1664617985a.44.1770060151695;
        Mon, 02 Feb 2026 11:22:31 -0800 (PST)
X-Received: by 2002:a05:620a:254f:b0:8b2:e70c:427a with SMTP id af79cd13be357-8c9eb2fac2emr1664613685a.44.1770060151233;
        Mon, 02 Feb 2026 11:22:31 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38625f8b70esm35186351fa.34.2026.02.02.11.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 11:22:30 -0800 (PST)
Date: Mon, 2 Feb 2026 21:22:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
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
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/8] media: qcom: iris/venus: fix power domain
 handling on SM8250
Message-ID: <l6o4lv2sy7x4g33mjigeh6sb6cmrfyz3xshhmbc3el6qvw3oep@okwpfykypawa>
References: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
 <CAPDyKFoNX087ZhLkQ_n8-42WNQcL06noSuPJPDG87y0andVdNg@mail.gmail.com>
 <CAO9ioeXkhxjghtGVGsOH=1hwC5FvS_4LEXt3hmAEuAbwVjct3g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO9ioeXkhxjghtGVGsOH=1hwC5FvS_4LEXt3hmAEuAbwVjct3g@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDE1MiBTYWx0ZWRfX5WJK+0ygt8Nc
 fpwVAzUGuP97tTm5oIvz1XJ9sJ3z2mFLszNByZ+tfBflFQ0l8xHnjtOfRoymte5OeI/NH3UNDZK
 Fu+W0J3FuhmIITAzNmK9A7UvNQ3Yr1s/g0TbX8JWAMZJPEoRguZ6DWTzFhNlQLpg+zlcD6QFYCD
 RSaeiuwXnSq+KP/crBWo4aH/SwcJudP786o+DL1B5g4p0idlvbOLmZQ8cI0AbV1hMy+dS6rNGwe
 yUybBkG1yysHY6iZ7iAaO1GTa+wML7rCu8AACS8bx3Gs7R7nYv1quhrRtPGP+wlywCWBbtibOx+
 grCg2UCPf26wPIEN5JFa+h0yM88iFlU+NZNPPEg4leJu8emN3T25VYQdZ4WGFIRmEzbS/IeDyZB
 fzwQxCzLOLkJk9qR7Ek/Gioy2mXvosExznPJwkJc5abYluVw/zBPIMkwJw1YyhoyyZ6LCU92e+9
 eK7lfZ4DmlDpkfdrmZg==
X-Proofpoint-GUID: deblLwqBd41_e30E4oOc4qVNBzsmXwyW
X-Authority-Analysis: v=2.4 cv=NOfYOk6g c=1 sm=1 tr=0 ts=6980f978 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=AedQi1eqkiGwAd17v3cA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: deblLwqBd41_e30E4oOc4qVNBzsmXwyW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_05,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020152
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52056-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 18D66D079C
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 05:51:16PM +0200, Dmitry Baryshkov wrote:
> On Mon, 2 Feb 2026 at 16:46, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> >
> > On Sun, 1 Feb 2026 at 11:49, Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > As pointed out by Konrad during the review of SM8350 / SC8280XP
> > > patchset, Iris aka Venus description has several flows. It doesn't scale
> > > MMCX, the frequencies in the OPP table are wrong, etc.
> > >
> > > Let's correct the Iris/Venus enablement for SM8250 (unfortunately also
> > > stopping it from being overclocked).
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >
> > Do you want me to pick up patch2 for v7.0 - or what do you suggest at
> > this point?
> 
> I'd prefer it if it is picked through the immutable tag/branch.

Another option would be to ack merging it through the media tree.


-- 
With best wishes
Dmitry

