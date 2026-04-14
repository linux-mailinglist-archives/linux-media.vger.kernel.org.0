Return-Path: <linux-media+bounces-58769-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDBoMj+W3mm0GAAAu9opvQ
	(envelope-from <linux-media+bounces-58769-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 21:32:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D91D53FE080
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 21:32:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B10F1302E7B8
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 19:32:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADD3229DB64;
	Tue, 14 Apr 2026 19:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QdITEKKG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JJIs85ZO"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE61114E2F2
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 19:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776195130; cv=pass; b=oRjshE/Kan1kjfJElG4hqKw8T1uSNEnXABCFF7DZKvkaJLEdvfW0pFOxZm1iZpD00veTfUWqhdG5V1FBnYS+WCgmBfudMXt11NvILr1aKXJS8sBY6Z8eaRKVf89+x8eKY85Vfma4aX/g2j1aiZ01yR/GGBIAAbtStGRn4JZMmlg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776195130; c=relaxed/simple;
	bh=KWNMLGggJeuxR4jnVaz8gmRT7gwcKbVgVXE9kPT73kw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=enxqyJi4XCDM3tYVMnUqOY2Xpr0oOkn0xvwLALQL4vUOvzgtVTWUQDQWKCfSsqoPCtpHj3y7EoNjwoEfkn2gbUEkqRfZWwt40YXhTUchZYRUf/PyS1iyBdREcSkDzRT9rlc+NfeRMYX8owRJ8X5pJYzjvDbtjmFF/apQ/LzmtzY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QdITEKKG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JJIs85ZO; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EHbXfL3126613
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 19:32:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4lnM01/HINKWExKWtn+/pUMhXJKImwAV4a6Gn+hdsK4=; b=QdITEKKGye5FHEEE
	7sbHbKlHsxRvKCEODbqmKWPIuHQpCBC+HAdXHX/Z/jZonHSDAFpGlXjS3+kV4Cr1
	etn3iXmUBwcdRwfVb4b/FFUR0SXc9nnbxo3ljQXr2YP1Qhg/dWs6JlNGvk14GiBC
	Bj6+3RQd6X7L1cK6ftgliCnQrnvojtljgxx/GxBfCvO/qqTJj4HFVkBYSfM8lSbL
	aZBrK+fh32ppYE+p6kFihIgg9TS8yVccMbpdOyu3QB4e46umm927Iu+syiZrq0zg
	kSe2EfuAwYdHaXEQwzJrKZ7545aE1idVelzpT+bWJTyY/kcjzD53zehhqebLMy4V
	2o5/JQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dht56rcdp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 19:32:07 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8a5f6110cadso98415506d6.3
        for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 12:32:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776195127; cv=none;
        d=google.com; s=arc-20240605;
        b=JWmlsEnQ4rzG4brxoCVpD91hQwohDNAAONzf8s9yNHyIYKIKYXDsQs84lucpF7iut3
         F749YnAR9NRVDuKovrJcxhUzVqTgTBlvvwCP065c719QMJ/P/YcMWZLgGuL0nSUjVz7V
         N6Nkib6fJyU8K4cVYrVIaaZl1Io1krNO85IpeT129opN/R3L+V0v8F2HqzQKTpuhQq3M
         V8XUMOQWt7TUgK6TuVmp1bpB6HVXpgpag9PAFYjh95aWWII2+LVLNSqv6xPz8xXI+1PK
         Ww0sHQGIuYssn2vgCtzESElxvb6IJnswh8+YzV2FUkXHnMBo5T0hYa3epltWTtYzm7WT
         O6rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4lnM01/HINKWExKWtn+/pUMhXJKImwAV4a6Gn+hdsK4=;
        fh=v2zAupe5obAJAyDUvHa3s+y8SSWXzMVPT5TEDb7WewY=;
        b=JQQuHyIZ3q5ATeQ3cdUdCtyaICiCgiqIyImX2MU8OwUB5eF4rkrIuOiqIQpLIxF1SF
         EbBq418aypUO8cYtHt6ruLPlbT0ZfUvQhFDsgQD3gQ47aTfj2C07xRINB6Sq6HauZPMM
         3r6/JV8EkrmzIvl0VckYHB57aHcuxBcOp3B5GYi0+zGqPHgh7xwtvMxSRaxvkNPrNguJ
         xvUu8iVBtIC5TxvijyvBO3UTJkD/O4HqwjPB0FO8oQOHqkr0URsHb3OxUfEgMPZI2Ad6
         /b9uwkopde9GYh8vRIRRzmhmyoDiiXGwuHeOnEc4COfibvS8wudtWVLInaCRTHXOh7jT
         pHDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776195127; x=1776799927; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4lnM01/HINKWExKWtn+/pUMhXJKImwAV4a6Gn+hdsK4=;
        b=JJIs85ZOOMzp0UU6vZSnc3FZtWgsC6fjvzfdB83aQPDba8WyUnFvfssikUFRapvobh
         6wxo5aRRKZulJYCHtpVxGPts8g/pmAM5HVsTmjpd1T+aUNqzaAv7/FhaRYjqyqwIlbkF
         s2tptdHp40u2lx893tmayHEAM/zUBDBuAfLASboY8Nn7hD3nKBByTH3DiJqhoeM0QfHg
         +lywopnzqpxsN6NrtkhgKpnzo/HYvFsClJFE9OdkXInHKTxPE5p8kBeHiwB7zedP+xA9
         8xg95fODBa5F0wrXK908kgyXnngp0iXzO8XrbuZUcrR/R+n9h4CLkFsbXFIRdiYBVdx9
         L71A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776195127; x=1776799927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4lnM01/HINKWExKWtn+/pUMhXJKImwAV4a6Gn+hdsK4=;
        b=CPhluiut+wmL+bWlaFiT+mVZ037+7rbAaAIY83mKdINs6B7ALZPOCfAsf0tM7kLrK/
         lKiFWSL9wYyAQk+c9XzTdkBnesC0MKLSqp59fjOFg6xYE3NAo/aCixMboZXaZZS3CfEy
         LdvevmNLyVjHLEhq7D+nkTvOuE0itIhEo11LCr/+4dUfRu2OioBudcNO5CtXpYFA6u+o
         W+djWawP9XqPAbw0MTfHhzG54NiOfzeL1lwzaVw+N5w/wjgOXLCHIluG3LzGAdiOuvdR
         h4uWKixcDCEcUHV0JfS7J3WK/xMy1092ceJE2O81PavR0O6K1WnTi2YTFu1VVgZ5/p+k
         W0Wg==
X-Gm-Message-State: AOJu0YznCRsjZJtMdTqMhRE2qXLZrCnmHVgEbzqflEJpUp0Uhvnr7JA9
	/xHpDYpWQDVBdi3Q8P0nw44G19uxhnqd9tX8scWOND+42YZHHrM8iwu6p5+9PYUxLo4abKMvaT3
	bhKXaftfAqlICGABietk/U6mykPqr3t8xCw8rvLsSXqOfrJsiyeeZs5LePPF+M1mH7CAwx0OZw9
	CD919hfnQWJZA/5kk/g6NSgqLI+0Pat8enna5tQUJu
X-Gm-Gg: AeBDies4pk+0smq/VoVnMU0pk6m2FdgTEgGc8gcS5Kv3Uz1V6OPA0AdFKLzuyr12yUh
	yM2TEmBNbRn0mWA0pvjJDOOPZNfRwsg8jF00G3ONwSxlDMeE+I+YDRoju3hbjWdhyy/sl3XyQRo
	HfCUSPuqgp3HVHfvtq+4+L8zIRT0nqnTJ22WoBE/n275oOR9c3hD/FSgb23BNYNgfmlykP+T2fe
	L7YSWfy9zM5MB7/tcCvR0A4Fy5vw4S8OtX/bGQ=
X-Received: by 2002:a05:6214:8012:b0:8ac:a6f7:8a71 with SMTP id 6a1803df08f44-8aca6f79755mr152462356d6.24.1776195126885;
        Tue, 14 Apr 2026 12:32:06 -0700 (PDT)
X-Received: by 2002:a05:6214:8012:b0:8ac:a6f7:8a71 with SMTP id
 6a1803df08f44-8aca6f79755mr152461776d6.24.1776195126382; Tue, 14 Apr 2026
 12:32:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260414185202.2714019-1-loic.poulain@oss.qualcomm.com>
In-Reply-To: <20260414185202.2714019-1-loic.poulain@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 21:31:55 +0200
X-Gm-Features: AQROBzB_zqoJ98z82D70XjchR2wbCQsqzrKE47oy1E6g3QZfASfGbshTwGg4bp4
Message-ID: <CAFEp6-1+TeEDodfMM+ZmvGOwxr2sQa5pJ9vuk+h2WWPtkMvVXA@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] media: qcom: camss: Add PIX support for CSID/VFE-340
To: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=LuiiDHdc c=1 sm=1 tr=0 ts=69de9637 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=kfigPR_gXQGDb6zMejoA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE4MiBTYWx0ZWRfXyX/ngxrnRClq
 3EqQZM6OTi/TX2KdJQaqvx13hTgZ1jCCdtALeSliQjdxSTmH54yB0BFZnKiLtN4eeo7LV15iB5o
 qkuMLyXis2TDiAiyZf88D09SzlM4MzDD5WbF64ck34v1Begh4DzBt4IOXJZiXvPOWgLfOJ5m0r6
 6GcYoBvm6/ETJzzDEfcc4q2QM9oim5lsgraWzATjD/Pk/tSsK1oqma1hXvdy7SLfQwxx8Py/q+v
 glD9EqrF3lqIUQpFszUulGtYW4OStGrurG3YI5w+Uri8pcx/2yikD3LmZdkDEtglRtQXPZV3SX0
 IdOh/K94RsuksYtup14Jy3OtvOFj9M+3OY97kHDgU9vLDMlr21uuJHwVIFkNVze4c5qQLxEpxY5
 D7c6x0/xpFgRSmqMBwuqiNh3OsochNvbKkVgJC/4YCWcDL4dGfWCxndTFg9ZUPuaX5PH/3VOSfq
 oYBlbYEwbn8Kna3FtoQ==
X-Proofpoint-ORIG-GUID: JQIqTqGp-A5hVOPGBWu973NW83gqbnhi
X-Proofpoint-GUID: JQIqTqGp-A5hVOPGBWu973NW83gqbnhi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0
 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140182
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_FROM(0.00)[bounces-58769-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,mail.gmail.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D91D53FE080
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bryan,

On Tue, Apr 14, 2026 at 8:52=E2=80=AFPM Loic Poulain
<loic.poulain@oss.qualcomm.com> wrote:
>
> Add PIX-path support to the CAMSS pipeline on CSID-340 and VFE-340,
> allowing frames to be routed to the VFE PIX interface and exposed
> through PIX output devices such as msm_vfe0_pix.
>
> On CM2290/TFE, the PIX interface includes a minimal inline processing
> engine, which we will be able to leverage later to export statistics
> needed for proper 3A frame processing. This also fixes the PIX path
> not being usable on this platform, as PIX routing was previously
> unsupported, causing frame capture hangs.

I forgot to mention this series now depends on your CSID/port series:
https://lore.kernel.org/all/20260407-camss-rdi-fix-v3-0-08f72d1f3442@kernel=
.org/



>
> Changes in V5:
> - Rebase/Move from en_vc to en_port
> - Use common __csid_configure_stream for RDI and PIX
> - Use bitwise | for packing vfe width and height config
> - Simplify vfe_packer_format, no error expected
>
> Changes in V4:
> - Remove unnecessary boundary check for wm-to-client
> - Remove stray \n and fix commit subject for 2/5
> - Add proper define for PIX pad index in csid-340
>
> Changes in V3:
> - Introduce what PIX is/means in 2/5 as discussed with Dmitry.
> - Fix patches format/encoding (proper ASCII)
>
> Changes in V2:
> - Fix various typos, extra spaces, and reword commit messages.
> - Split the CSID-340 patch into three independent changes.
> - Make VC/DT-ID configuration explicit in the CSID/PIX setup.
> - Add the csid_vc_iface_map helper to retrieve the interface offset
>   from a Virtual Channel (VC).
> - Add cropping configuration in the VFE/PIX path so that it
>   respects the crop parameters defined in camss-vfe.
>
> Loic Poulain (5):
>   media: qcom: camss: csid-340: Switch to generic CSID_CFG/CTRL
>     registers
>   media: qcom: camss: csid-340: Add port-to-interface mapping
>   media: qcom: camss: csid-340: Enable PIX interface routing
>   media: qcom: camss: vfe-340: Proper client handling
>   media: qcom: camss: vfe-340: Support for PIX client
>
>  .../platform/qcom/camss/camss-csid-340.c      |  83 ++++++----
>  .../media/platform/qcom/camss/camss-vfe-340.c | 152 +++++++++++++-----
>  2 files changed, 156 insertions(+), 79 deletions(-)
>
> --
> 2.34.1
>

