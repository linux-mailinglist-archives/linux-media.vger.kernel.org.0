Return-Path: <linux-media+bounces-58191-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IA3eA04H1WnMzgcAu9opvQ
	(envelope-from <linux-media+bounces-58191-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 15:31:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 066BD3AF2C8
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 15:31:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B57F63016B3A
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2026 13:31:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54EB93ACA72;
	Tue,  7 Apr 2026 13:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N0G0d8Db";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TNVZn8jM"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E58528E0
	for <linux-media@vger.kernel.org>; Tue,  7 Apr 2026 13:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775568658; cv=pass; b=NvBQgItYDZUNMvfLeeh1hNNxOb94wT+ZsJ0hv4b46SX/RIGKEAG1r1xRGWcV7TAYfBzd9CG0Yzk89k13aC+gCGs/2ngtuT3NMvLTAROctDSvstuECwBkMlnwZBpnqKHrKglkGNCKcK5mPPteR9GBoZlfpZomfpJmyHf+zfnRA0k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775568658; c=relaxed/simple;
	bh=6ok4H/A78ZyBw+LzL2iBrCbG8eJHW49PFV8E20QJ7qc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mK5PdawylyOKDiKVGaU3hLJklrv0jH9C2yCb4SQC3vIfMoRx5xA0W3VB6yAxDfyyZ1pnEqTxWCcexmndsDVGg1bD9cHWwK/FnkeyosDiCeLJF9dnswwJcnbJH0uYdaDjnVa62K7SCK8/O1O1g07cWYDxFWrSeVaOC6PSfNPxFEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N0G0d8Db; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TNVZn8jM; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637CYa9E3815781
	for <linux-media@vger.kernel.org>; Tue, 7 Apr 2026 13:30:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RBu9EXcvfTVBwdBS0Esdcym/TI5NiAgkrKjJnoDtpYA=; b=N0G0d8DbYhV3c59P
	T1u9TCVvMXAyXi9cB6zsmEjLuOcq+M9tPzg8Wwi9WCi+7CwmtWWaTC+pxzpQxYqI
	kwlCtusPZgBy2eSQ8vdze89ruve4QzHhF8lnGs4G/OX7Vdd7cfvusS1/jXgmLtbS
	7wnvi/AFV1EZ07xWost4dpRWZJTMgiEPF/THuvkTlwYrGEa4x8am1zzdatko4vcn
	lEr1oHw4QaD9O/sN+8YIAFie4pK20qY1DbXvyoaZN8gpbZQDrHc7igf7b4BDHq5I
	xFX+Nt/m5mDEIaluoguhoOb/+Enzf/5O44GkanpsAGJWI2ecSKDKx8vBQwufCGC2
	MXX0zA==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr4tx0u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 07 Apr 2026 13:30:56 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-649deef077eso7308737d50.1
        for <linux-media@vger.kernel.org>; Tue, 07 Apr 2026 06:30:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775568656; cv=none;
        d=google.com; s=arc-20240605;
        b=ENJ9hCmYLprsIvEveDCNMVu3HzJyI2JdBIQuF5f4NA/ImwMJqLH2P+bfL+yNwsyd4g
         ZCsIlOM5r9eQDt5esSDS0/8/x/g3Z8yy33QG5safj1e1BYAMR0Jr6XYcQtPGB1Ymgrna
         L/5f23M2UZnIG1frqhppL2rsP5ED/xrRvo5jzYIsQ/2C44f6xZVlUMkFsX2zDGf3d0G/
         SsBW4SwlhFcEQobJelwij2Zo0x0buo7DMEzes8ArlTtRRCw/HLUMnwLMnayO8f8Tt4ph
         uQXum/M9rZl6+2uJfLWafwBH/8/p8qayUcT0eiOYNkfF9lx/sQ+Hy56daIxylJebPrGW
         YRLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RBu9EXcvfTVBwdBS0Esdcym/TI5NiAgkrKjJnoDtpYA=;
        fh=FVeY0E08hEZNvVkcfpNC18i2yxTygTr7y6QjFN1AmPk=;
        b=f4pg1ftA3T6oRFHBGRFE94txpiqu9PgmInpwps+hfJWp8mYTvQRR7h0Mc0Umw3OO2+
         p2gPQIbYUrzc9vCDIvkwlBt6qfwUjBtRCHCTAGC4p18adSHz1PCyrPH94KAPY+3Ea7gu
         utvwZpEsuD53izAfrX2pGxeoLWOZ465T04UC6bquiMt5OtU2Rp1SNw+8Xh02rLeoPyh/
         dMiYo70mMzu37gaOraqx0wQqmMwP2T9qr0uGeGGnYCTPNNXqX6XWvt631a/Qx+lNaaBx
         TcqYkT/UH/516IpubGN5w3Z0NY4k5TR9s5v+mGvAADiivNt4ep47kF39CI+4Lex9Rf8S
         EzMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775568656; x=1776173456; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RBu9EXcvfTVBwdBS0Esdcym/TI5NiAgkrKjJnoDtpYA=;
        b=TNVZn8jMC1dltAzK4X+pKcGc/uyO5SxmuN62LUc2bzgo8XSAdGhFimQQwEY8S+tmmK
         6hZIljLthbLwWgNAx6agLVZpr5+dLE+6UWMVApZTpo+bRIroFaIBLelfSpLU+5V/zfz6
         OBPp8oLAHoNS1R31awM590qabXiRKzxDssbvGMliEcxi+TVUekVCJ/CT1a6NWsdpFnQR
         TIXPwNdWc6zIKjpzUrGHEhoFwuEL6Xw+9kq07aW+h2tM+GMbWM3XJiZFIvpVf6BJQxMp
         7+0EQuh+mYfJA5IAR6bh5HScWL5fH6x+lIiiVnPuVbX9aY/uvfIijYgZaP73uMq3btkT
         13/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775568656; x=1776173456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RBu9EXcvfTVBwdBS0Esdcym/TI5NiAgkrKjJnoDtpYA=;
        b=KxltfvGLGv051aBi9oOLBXuSjOmzoqQC3AFKv+3s2v9M+NSQCbfr7KM7gqY0Z85rd+
         j8N4s+Z+JjinoH9L60xzpTugziOlRFu5c1Nl1ggQ4cnNHOUm7GwgLvxnj7Wq3Y5/ylbg
         fWsmr1QVKt1anWyrwF7zbSL4uugg7fgDaOxvX2Y9ZUhC2K0Yt7XzO+V3jZZ7k0wufvJ0
         RhkFVabZjkrR9QLPGKH5TbyKCTQxw3iJA5uWWPZYCGiFtNJJh4A/lvP7zgzmUk/u+m2g
         aKJ12ZbvU7pkPNKTs64Ocor98hJfUKBKYgDLFpeVRE5mmAounQYK/bZM+I/YJo6Cw/9E
         Eq1g==
X-Forwarded-Encrypted: i=1; AJvYcCWZom5AKY4b87CbLp6bAp1F9yR1tut+O42+UZe2cpkdyX5OWW5+Mk4L0D2b91O7N9YgnfobRQ8IACO1MA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSkCDc42WYFs+WLL/K4KZJ6jaC+eCSWAMkSiOO3qluLWDHVlFH
	VUcXysm2r8TEyuQivfoIT9eEHnDHlI6CcAMR7hb8Wm46UKikTXOrtsIYiwYPi4J6sNA2ec1GKi+
	6RBpuOmmhROQtFLQBALNuu46ZKPAhF2+TF6t1s4WlEk71n57iYhvEL5zs3m/aO7beijM/rrisgm
	EWstxH3pfmYbQDHKAxA/H4QlR8IgfSzHLPWwBgaa4z
X-Gm-Gg: AeBDiesGjsDQmg3ZfdoNWUBMaCEyStKRqi07+nWZTrM4grUFaN9aK9Day4r19qFsJYg
	SF8rAvCcdjFpH5U0ZxW9Lo2SJ3YlMJY6Btm+RxTtlQrRQWAdDhYLEiXG7NyDHWGludrPoeJC04T
	GZSrNntcv6aqWOkX84YMVH3XAVowjAoq2DOy9mDypWU7MQdxyzoolpz8nwAxi7MKvm85EhTtK6G
	qddcZJDNVuD4asA4X7O7xkHuPhB1G3mRnThwSI=
X-Received: by 2002:a05:690e:1902:b0:64c:e789:4397 with SMTP id 956f58d0204a3-65048698fbemr16755091d50.10.1775568654896;
        Tue, 07 Apr 2026 06:30:54 -0700 (PDT)
X-Received: by 2002:a05:690e:1902:b0:64c:e789:4397 with SMTP id
 956f58d0204a3-65048698fbemr16754990d50.10.1775568654023; Tue, 07 Apr 2026
 06:30:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260407-camss-rdi-fix-v3-0-08f72d1f3442@kernel.org> <20260407-camss-rdi-fix-v3-5-08f72d1f3442@kernel.org>
In-Reply-To: <20260407-camss-rdi-fix-v3-5-08f72d1f3442@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 15:30:42 +0200
X-Gm-Features: AQROBzA_LvXeAkvS_aQxZuX5tek0ZSvAzp2tpf4m_l3i-V-nzuLhNv461BiH2MI
Message-ID: <CAFEp6-0Xj_evmeKXX+1yXaULL65eemhfRiFjMrQfZcwELiK7Jg@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] media: qcom: camss: csid: Rename en_vc to en_port
To: bod@kernel.org
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Gjorgji Rosikopulos <quic_grosikop@quicinc.com>,
        Milen Mitkov <quic_mmitkov@quicinc.com>,
        Depeng Shao <quic_depengs@quicinc.com>,
        Yongsheng Li <quic_yon@quicinc.com>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=dO6WXuZb c=1 sm=1 tr=0 ts=69d50710 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=1FwFdbLlwGuMXyfPU3wA:9 a=QEXdDO2ut3YA:10 a=uujmmnXaIg8lM0-o0HFK:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: XuoqQygN4h03YXAJl1xahMTf1WE23BQT
X-Proofpoint-ORIG-GUID: XuoqQygN4h03YXAJl1xahMTf1WE23BQT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEyNiBTYWx0ZWRfXzb8l705XHLlf
 93NF0e96TL9CGqhTxJcifSm/kv01prFRGaloD0c82BeyJyFoATM+QvmC9pN3OPQb2iEz76IdO4o
 iv5TIRvaAiNfMgP8PGh7pwpj5tV/Qjt7qqWDxmSEpH16c5YSRQ5hWPY8lOC9ceH/fzqyngZO0U9
 0ydhtiRkKKpIC0KLjX16CNQ5wA8LiOvGbtvuDulQ8j2NvRwV17jjsf3VjjaFgONi54hwAlnM3J6
 Ty14GZDnNx3z1Ahep6A9rFc9YbtRfIoiUikzrT+crkk9q1xeSCeEPEqxenCO1u2vgIGKI6tr+O2
 nER+/dxbjPJOxyKDxGKWC+Y25sXLVEAsvVV7K7KD8jh/ywixndfNH1J64fGCgRtnF2BF0fMn12M
 4GqK3Tg2AACe8MQGqlRVc0q3QcsnvZcXARCEbwi7rEqn8pB4cKg8eyJ3najLN+RbPc733TKiWnN
 SatFrU7eN2yBo13/PxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070126
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58191-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,quicinc.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,mail.gmail.com:mid,linaro.org:email]
X-Rspamd-Queue-Id: 066BD3AF2C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 7, 2026 at 12:35=E2=80=AFPM <bod@kernel.org> wrote:
>
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>
> The en_vc mask has always also been an en_port mask. Name the variable fo=
r
> what it does a bitmask of ports. When implementing v4l2 subdev streams it
> probably makes more sense to have tuples for port/vc mappings. Such a
> change right now feels like putting the cart before the horse.
>
> Sanitise the name in the interregnum.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss-csid-340.c  |  2 +-
>  drivers/media/platform/qcom/camss/camss-csid-680.c  |  2 +-
>  drivers/media/platform/qcom/camss/camss-csid-gen2.c |  4 ++--
>  drivers/media/platform/qcom/camss/camss-csid-gen3.c |  6 +++---
>  drivers/media/platform/qcom/camss/camss-csid.c      | 10 +++++-----
>  drivers/media/platform/qcom/camss/camss-csid.h      |  2 +-
>  6 files changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-340.c b/drivers=
/media/platform/qcom/camss/camss-csid-340.c
> index 0231985746edf..6827d76bef5dc 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-340.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-340.c
> @@ -120,7 +120,7 @@ static void csid_configure_stream(struct csid_device =
*csid, u8 enable)
>
>         /* Loop through all enabled ports and configure a stream for each=
 */
>         for (i =3D 0; i < MSM_CSID_MAX_SRC_STREAMS; i++) {
> -               if (csid->phy.en_vc & BIT(i)) {
> +               if (csid->phy.en_port & BIT(i)) {
>                         __csid_configure_rdi_stream(csid, enable, i, 0);
>                         __csid_ctrl_rdi(csid, enable, i);
>                 }
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/drivers=
/media/platform/qcom/camss/camss-csid-680.c
> index edf01ba79907d..e530639456ee1 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-680.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
> @@ -292,7 +292,7 @@ static void csid_configure_stream(struct csid_device =
*csid, u8 enable)
>
>         /* Loop through all enabled ports and configure a stream for each=
 */
>         for (i =3D 0; i < MSM_CSID_MAX_SRC_STREAMS; i++) {
> -               if (csid->phy.en_vc & BIT(i)) {
> +               if (csid->phy.en_port & BIT(i)) {
>                         __csid_configure_rdi_stream(csid, enable, i, 0);
>                         __csid_configure_rx(csid, &csid->phy, 0);
>                         __csid_ctrl_rdi(csid, enable, i);
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/driver=
s/media/platform/qcom/camss/camss-csid-gen2.c
> index eadcb2f7e3aaa..0e0c44d118a59 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> @@ -329,7 +329,7 @@ static void csid_configure_stream(struct csid_device =
*csid, u8 enable)
>
>         /* Loop through all enabled ports and configure a stream for each=
 */
>         for (i =3D 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
> -               if (csid->phy.en_vc & BIT(i)) {
> +               if (csid->phy.en_port & BIT(i)) {
>                         if (tg->enabled)
>                                 __csid_configure_testgen(csid, enable, i,=
 0);
>
> @@ -370,7 +370,7 @@ static irqreturn_t csid_isr(int irq, void *dev)
>
>         /* Read and clear IRQ status for each enabled RDI channel */
>         for (i =3D 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
> -               if (csid->phy.en_vc & BIT(i)) {
> +               if (csid->phy.en_port & BIT(i)) {
>                         val =3D readl_relaxed(csid->base + CSID_CSI2_RDIN=
_IRQ_STATUS(i));
>                         writel_relaxed(val, csid->base + CSID_CSI2_RDIN_I=
RQ_CLEAR(i));
>                 }
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/driver=
s/media/platform/qcom/camss/camss-csid-gen3.c
> index ed5c5766efd36..cb6ca470dafa8 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> @@ -215,7 +215,7 @@ static void csid_configure_stream(struct csid_device =
*csid, u8 enable)
>
>         /* Loop through all enabled ports and configure a stream for each=
 */
>         for (i =3D 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
> -               if (csid->phy.en_vc & BIT(i)) {
> +               if (csid->phy.en_port & BIT(i)) {
>                         __csid_configure_rdi_stream(csid, enable, i, 0);
>                         __csid_configure_rx(csid, &csid->phy, 0);
>                         __csid_ctrl_rdi(csid, enable, i);
> @@ -263,7 +263,7 @@ static irqreturn_t csid_isr(int irq, void *dev)
>
>         /* Read and clear IRQ status for each enabled RDI channel */
>         for (i =3D 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
> -               if (csid->phy.en_vc & BIT(i)) {
> +               if (csid->phy.en_port & BIT(i)) {
>                         val =3D readl(csid->base + CSID_CSI2_RDIN_IRQ_STA=
TUS(i));
>                         writel(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR=
(i));
>
> @@ -309,7 +309,7 @@ static int csid_reset(struct csid_device *csid)
>         writel(1, csid->base + CSID_TOP_IRQ_MASK);
>
>         for (i =3D 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
> -               if (csid->phy.en_vc & BIT(i)) {
> +               if (csid->phy.en_port & BIT(i)) {
>                         writel(BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i),
>                                csid->base + CSID_BUF_DONE_IRQ_CLEAR);
>                         writel(IRQ_CMD_CLEAR, csid->base + CSID_IRQ_CMD);
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/med=
ia/platform/qcom/camss/camss-csid.c
> index ed1820488c987..71a40c2cb350b 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -1278,21 +1278,21 @@ static int csid_link_setup(struct media_entity *e=
ntity,
>                 csid->phy.lane_cnt =3D lane_cfg->num_data;
>                 csid->phy.lane_assign =3D csid_get_lane_assign(lane_cfg);
>         }
> -       /* Decide which virtual channels to enable based on which source =
pads are enabled */
> +       /* Decide which ports to enable based on which source pads are en=
abled */
>         if (local->flags & MEDIA_PAD_FL_SOURCE) {
>                 struct v4l2_subdev *sd =3D media_entity_to_v4l2_subdev(en=
tity);
>                 struct csid_device *csid =3D v4l2_get_subdevdata(sd);
>                 struct device *dev =3D csid->camss->dev;
>
>                 if (flags & MEDIA_LNK_FL_ENABLED)
> -                       csid->phy.en_vc |=3D BIT(local->index - 1);
> +                       csid->phy.en_port |=3D BIT(local->index - 1);
>                 else
> -                       csid->phy.en_vc &=3D ~BIT(local->index - 1);
> +                       csid->phy.en_port &=3D ~BIT(local->index - 1);
>
>                 csid->phy.need_vc_update =3D true;
>
> -               dev_dbg(dev, "%s: Enabled CSID virtual channels mask 0x%x=
\n",
> -                       __func__, csid->phy.en_vc);
> +               dev_dbg(dev, "%s: Enabled CSID ports mask 0x%x\n",
> +                       __func__, csid->phy.en_port);
>         }
>
>         return 0;
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/med=
ia/platform/qcom/camss/camss-csid.h
> index aedc96ed84b2f..b227923ca5c15 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.h
> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
> @@ -68,7 +68,7 @@ struct csid_phy_config {
>         u8 csiphy_id;
>         u8 lane_cnt;
>         u32 lane_assign;
> -       u32 en_vc;
> +       u32 en_port;
>         u8 need_vc_update;
>  };
>
>
> --
> 2.52.0
>

