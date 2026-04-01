Return-Path: <linux-media+bounces-57886-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJ6VOjUrzWn7aQYAu9opvQ
	(envelope-from <linux-media+bounces-57886-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 16:27:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7027E37C1F8
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 16:27:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E50C33098FA6
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2026 14:12:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDF8A40F8D9;
	Wed,  1 Apr 2026 14:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WFQLde/H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eqFw+Clj"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DF92DB7BB
	for <linux-media@vger.kernel.org>; Wed,  1 Apr 2026 14:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775052766; cv=none; b=UVf8yop5g7Aob6oeZ1fzGzXWHSZ46HV3uBlDxHCA7ArKWlsy+D4VjM5ZnSP+rzqrOnM6IlqCIX6t3co4TjK4/IDGNrM0mwq7AZqE1n227ieufYPYHLKeux2ckuBYwArRTkuUjccJj90zGnfRG1hoEOhIffZ4lBdxQpsEcFdOeZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775052766; c=relaxed/simple;
	bh=C3Bvz6+dr63+4olpaxktcoW2bMenHTk6Y/NyA36vuvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HK3B3F0RYO25tBUDn7m3NOT/kXFa+65DT6Ok1F/I+CPk/di2yVAYskL6WO7qBiLYM3VgqeJScMOKV5donOQSWsrbNgVJLALjfwldaILOqlFFBuQt+KIHifpzclOTU7d/D/xJHtPrhKouhYhgpa9orWrZMbmHq3evl3lFduSecmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WFQLde/H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eqFw+Clj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631DPnMS1894106
	for <linux-media@vger.kernel.org>; Wed, 1 Apr 2026 14:12:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SKV5RsuNlQlTgHyoiQ7K1nfj
	fKHtd2rOvc/7sm5jAfY=; b=WFQLde/H+4DEvSXEcUb5UzLGM2sd6QJj+VXJLzEt
	XJ8mgnHVPaP3GxLUuclM99ic8V7w61i8FeaH6L9eMZUwLKafn0ybZthz//JhmXm4
	VwIXQjVgIsUjPn/C1esZJkLy8dpJCn7+q2HH8qA6w2v3Fah2eB4omIuhmGhC/5FH
	KRs7SED2adblud2LORvRmooA5m/vjAk5qjEDxsh4XQ/ANE6O2h1tKYswW5QzEgr1
	lWgZSoGHGHDdo4teDlruLRKF3AiDGG3LfUe2RCT6UnMynIGc9usxZyvgbVk5YB9+
	kv2AkAmCxlXmS/R2YGSKDw9iVhSKJ0vYSZNsqQtdqsjlWw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9483r5u7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 01 Apr 2026 14:12:44 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6057a534ce8so465995137.0
        for <linux-media@vger.kernel.org>; Wed, 01 Apr 2026 07:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775052763; x=1775657563; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SKV5RsuNlQlTgHyoiQ7K1nfjfKHtd2rOvc/7sm5jAfY=;
        b=eqFw+CljmSp2foU6lb02IdJUarACxyxHmYP4ESDiV554tttZGkWuHgveyV6k1hZQse
         +oLPPIW4SD5eIWFcwyB0hhiaNY0Vt9ayC4G05oQ5DQ9I5W+tVYYh/Ws9RNYhgyVdylAz
         QgrHs5psAEycBK4JweVQ3amugs86TWg8Fk/Nbw2c+vzlWdJMPEkWlaAoOA/jMaZrxUvl
         thaaAFqlvVBW4BOPow8AKbLwZjn6sg1Dzzp1r7YWINw1MtEwNU74kTCeNDlrVjeU+43n
         ie9RdELoYGtcjhHnCdfBPI13/e9IvbjnQBp7YxJd4swvOK5zZE5nItlWgHD50a8Irj4S
         AemA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775052763; x=1775657563;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SKV5RsuNlQlTgHyoiQ7K1nfjfKHtd2rOvc/7sm5jAfY=;
        b=KNTuhlzyNnKJyGMS/Fh8PsPk191pCvzgdV0CPbd8FbpJ7kY+Qy+VHP8PUxleFMkVp4
         HWwTdBT4sUhql2Llpzd1GaaYp27oi0FCLNI1LBOryEAG9Pbti0l1g0HiqaY0yWMe97UM
         H0Pae7S2a3CxlKUAbP/vJ8Zf0mTeYTYEEka7MeAB+kpV0q2BYWsddEZd5GD06Sx4P6JD
         sAsrMWK5nogTrA0ewR3tHIM4MAsi/rrdf71GG75MHrFjODP/nEwSgeXagbpvpoHdHg5C
         OeSJdP4TvFZkg9/PlaPg0CiF/2akcr7BTUcUYihiNZt646UzEu5Z9EnSXyUGOhrzO0xv
         jKYA==
X-Forwarded-Encrypted: i=1; AJvYcCWUT0+xmBgf7wjWQVGPgRrqcf9JbCgD96dwhKKlRS1PEUZ6uDtZDG8ceXP0mauU6BvCn/t1ydPHoNfPDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBx2JBup3ZaexroDheuET1hnTqXMaZpWRqCK5ymS3SPNqAgu9k
	vg/wRUWMObiIJenRQMir9H4Y05t5SFwEQA60POW39uoAoR8f/whKEkh0p+f/cBZajMcTi4z6vUN
	7IDs1iJt+/09SPeELa51hJoKAVVDDR98CQFPWjJLnmrQIVBV7qh5FN5Mefqi/vWBxDA==
X-Gm-Gg: ATEYQzzka1YZDmzsUPZJAwEuRU5IXZdpe/SRQsD0wj/ciWJ5BcbhMl1iS71W92uy0hM
	NP4VYX4YQXhtE6wkHOOG/A9ZaCvx1kgqVkvB9mH80Sccdc1nKAvxC2N34flDhvsW+fTkXMfBSoH
	zLexZTX6imP80ZNPudGXU1IChN8T/kIVYhlLpRslK2008O4Prq+3bo7bJqbT2JIzXi8L4iM9PJ2
	seB39ZypzRwmsaGUDau0F3P6FuWuK1A3jNWNSblaqM+nJHNKHL0p/A8nNS60k/CI8jUXLQpf0Q1
	g72bKrW22uimsizd5kcCi85cnd0+s+QTpq6EFEZaS3KG+BntqPX1V94hG82uGjO0ZHwVOMMiJmg
	R5VeTg1wUvjXBnx+Wi+RnPHXkUac18EqE7g/SIDsx/mj28lvWHMaqbl0VDDyAKId+45S4bbnzae
	S5NLVb4c2vOiTjnj/IT4pwrqFlv2JSCAT5Q/s=
X-Received: by 2002:a05:6102:2d09:b0:602:896a:84ba with SMTP id ada2fe7eead31-6054fefac74mr3215560137.17.1775052763559;
        Wed, 01 Apr 2026 07:12:43 -0700 (PDT)
X-Received: by 2002:a05:6102:2d09:b0:602:896a:84ba with SMTP id ada2fe7eead31-6054fefac74mr3215547137.17.1775052763100;
        Wed, 01 Apr 2026 07:12:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c43b3597sm455593e87.23.2026.04.01.07.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 07:12:41 -0700 (PDT)
Date: Wed, 1 Apr 2026 17:12:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v3 2/3] media: iris: Initialize HFI ops after firmware
 load in core init
Message-ID: <pmhamab25borj22drn5oamb3c3jybqpjd65m4j2btaroqxhn2b@eiw6zoj4fow6>
References: <20260331-kodiak-gen2-support-v3-0-958296fab838@oss.qualcomm.com>
 <20260331-kodiak-gen2-support-v3-2-958296fab838@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331-kodiak-gen2-support-v3-2-958296fab838@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RYydyltv c=1 sm=1 tr=0 ts=69cd27dc cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=wb2wMtAIV9lWYoYjNPEA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDEzMiBTYWx0ZWRfX24vOFVCIcanp
 1vPm1IFdi6LVJNR3VnFNldF5oU8gmAo73mSKXHtv1J7kBKtM/imzzNk/a0qc5GH/pY70MmJudvE
 cjlDcmCi4/rPS9DdoICBEyebjlE7h+rYHk2UzRIB4B8NoN7jhCibmWlEcpwPe+4MJx7/JNdm9zk
 m200i73US9yeJKwhaUOEtv1WpbjMLr5QMdqNZ6gqi7VD3QuusJgjaggGm4hvBQmfVynO7804awC
 uUAKbByd/x4wouHfvy/kbgopHuZwWvpaKdTXilG8up7/1o4TBRZBa20aGcM6LECJHddlXEkVDs8
 2IfyoAClLIHtFLlSddgx8Dg58C3mIKT1FgDtdjQFVj2/X5I7nMYqEZKQL1tVoyCLnXaffrnsUX0
 9AMI/XI12ZrLpEJ010YdFjewLakNmEW+9Fy7MczbfVTlcacTcsJS4qiPj+/qrImSvpOxzzuELoq
 EgHP6QQphJiJQZF7xww==
X-Proofpoint-ORIG-GUID: iR9K2H12WtoX9xKFkXQdo1vVoHxPPENY
X-Proofpoint-GUID: iR9K2H12WtoX9xKFkXQdo1vVoHxPPENY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010132
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57886-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7027E37C1F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 01:09:56PM +0530, Dikshita Agarwal wrote:
> The HFI sys ops were previously initialized in probe() but, we don't
> have firmware loaded at probe time. Since HFI is tightly coupled to
> firmware, initialize the HFI sys ops after firmware has been successfully
> loaded and booted.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_core.c  | 2 ++
>  drivers/media/platform/qcom/iris/iris_probe.c | 1 -
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

