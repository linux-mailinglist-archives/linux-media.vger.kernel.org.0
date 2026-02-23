Return-Path: <linux-media+bounces-53190-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPlpEkFpnGlnGAQAu9opvQ
	(envelope-from <linux-media+bounces-53190-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 15:50:41 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F619178416
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 15:50:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 83A293025679
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 14:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE32C1D5CE0;
	Mon, 23 Feb 2026 14:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RrBbrp5s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j2ZP4uCj"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D681EB5CE
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 14:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771858232; cv=pass; b=QsKnlskH8YAzS9kowP12aXDhrPNhJX1mIyAS1ifHshuPVQPgz0NtkO8HqFCp4BjsCvWzF/23gQY47bSN4VSyrtHZs3zqBJAzRXpo47UHeocNi9mc8iqNguM0JXRh1i401VtMEbp6tN0ju+t58SVPI+4P7jk5d9L44PM85GisVYM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771858232; c=relaxed/simple;
	bh=o56bxe8U3e4y5QW1fvMwYwFVS9ioLcqTo+5NbrNK9ws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O30QeCdv2RUofq+sXDEqSLTux/1PaGrZseBsihmrivEe6ymchuVTpRyxlH96Z2L6gzFUwptUS8Qx+qewLnqZU0l3N7xlp8LTF7sLyJKf1bAzApXQEuLQxbEXc7069941BY+cVBypeaY6tSarFGG2kqipR00IEnMkSTi2LHXYqiE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RrBbrp5s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j2ZP4uCj; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NC2q4O3152071
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 14:50:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o56bxe8U3e4y5QW1fvMwYwFVS9ioLcqTo+5NbrNK9ws=; b=RrBbrp5sg9GigQxg
	VBWCbkAmtjDYtGPGu6nRnrLjW+yuEnQ3WFBeXXvkvrBZrhsaL8k0ABl4JxWGkoHx
	WAkGUP8n1r+oX0OybbbqQEP+KacKrQBBDAnwo+aNotW3BbKvS7txRiHAXkhtFJPS
	YkMgbqr9U8j4+m5VKbjjFshud8R8Xvj5YjzNnpBLiVYwiH2c5Y97zU/D+kVkEUpm
	i/XcgkV+4a0i9ryzE2BHJndZmvvLWBbuYNtLQX8o4eOvQ7L4iDDFe9AYgaDjev4U
	Tzx+BF3/I8oEq8N5g1KfRGUgRwxn8SGJfFoh4iwXmG+DL79/6w2poKVPKs48iAF9
	3rS75A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgpj88e9v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 14:50:29 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8947c4398c4so569981106d6.3
        for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 06:50:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771858229; cv=none;
        d=google.com; s=arc-20240605;
        b=lczGulhTQn3jNVkNx6GrHwjwp5UFJJxZ2KRiskKCJAgg6yOzBs6CUAsxdrzOQDwwiO
         L2rmYqX3H0UzpJBx7AflFBUwq39e6NomgZRGcywhQK2YZHnOXKYt0GyX10S7jllBwjep
         XU2diJPHz1zAKm2srcGhoKYItf++79zwO/g5Q85l0N+I1TDdlGWY+mpKQpSvbVzeW7WF
         dbsIHGfVAcWGqsX4GifqG02PYSIYVD6WQ1oIWvXEhM7o+PGmg1kWbnR2SQdc5a08zuSS
         X/Fcoevd8ky/+q7zpxy+Wm3oZuRPn5t++M71qaUn1db/zb0h/+5KF1oWdjEqmXeCwUba
         PYrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o56bxe8U3e4y5QW1fvMwYwFVS9ioLcqTo+5NbrNK9ws=;
        fh=TVXgSppwRSm9hUzZ+u5zybuxQAVbZmB5VD7q5PLKdLo=;
        b=E+DumJEym6OE7Hawnqp5RVtK/y+zps0fzq9Z0wHw/vSuTM9PzdD8RvWGW/dEZ3Xplv
         9Ff3zlg01e7xCtcEF4enez7T+ahCZqwDIFejJQ+HV4SPmbs0fkspZDkm3VWtdm/rBUuL
         IVL15hPjpWXsoSdXHEhhCZ5Ro+r/VcxJGrnkbtGmvvqh7BxTil0EmNuC8CP/L9Kcv0m/
         wuE+Vp03fvK/kGIlTuwhuLoHgb88Iq6PXlzkSuMruDPw//vVY+6JipbM1YGy1vS8hIWe
         o+z/NtdSyQfaT5+37zGKXV0BM5i6FI5G550HRVqmrwng8l5Pv8N7Le9inBYt/P9+psHZ
         rjYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771858229; x=1772463029; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o56bxe8U3e4y5QW1fvMwYwFVS9ioLcqTo+5NbrNK9ws=;
        b=j2ZP4uCjPsiVFgRkJgG0gKV+ETsQENOVGy5Vw2GPPenfSN07hUdmzlVtv5F5ccQWvI
         QCeLPaXSBb5yu+KpzZsUzxvMcSUPFKwMdkI5l+Vs4bQ0S7aRkUjq4t/RzKS0HIQjaCbM
         BWg/+cQ0j6KpkwaJg/ViEKe7VTjLu0r+ojneU7oJRB/u263jBM2Jx5zFtZ9Wq16OJnsO
         RvVdo8j8viDpCCcgz2j+fOATG7fygTQTnbca1nT2rvA0rw0VGvznl448SE+CDopK60bZ
         ULn6WrjuskXGjURQz4rCjIuGTd4TpctVqvdhk837+edD2NGoJ+RFVXQT3MXu08FtQcX7
         IB5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771858229; x=1772463029;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o56bxe8U3e4y5QW1fvMwYwFVS9ioLcqTo+5NbrNK9ws=;
        b=r98NqSJ4h05EZ+G96/+R1ZbyaMuy0KpqCeC5lc62dK/ZB8oAc76Vjfjed7HzTY+UnN
         UXCF5RyDm56ZNGe8OS8E7BAUk4ftecEpdmdPFRKOPTxZ/Zl8Zy3/BbxeFidooaKrAx3B
         3xlzfo3/eVR9+QGbfhD9xSen3LJ2L42Z1AzOpZtsiWYJQM9TXYRJ/Iqys8IeCdv65kDs
         W8OMUPTqbA5koQ7ScoPA2Cr9TMZZGE+YkMJG61O2SBsKXQNGj2A7fBsRCoT0VHX1H5G1
         9lBPhwathhDnaopLeG4aYe9+N3Y/U6lnr9TYcz9SaUcRe7HsPlSwzG/+zJXpWAVrGldj
         XR4g==
X-Forwarded-Encrypted: i=1; AJvYcCVvy/501DUDcGwmbfSYY1IiE51XEiNl3AoWvF76G2cuCyKtb/stWwgTxX5DDCEmPlsEO18OjLrpY3pl8A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7dnIzh/fspG5ycEh2Fo4nYSfsjYjYgMAPWqtWLM8fDCLd5NQy
	zbViqmk/iqro7z2bPb0UpXRLVUcfR81OD88A+W0ugkpou0ulIEQwmPn2k47RN7tXoQWksmdD5Iw
	/O0Z8liqzXET1LuQmyXGRZcK8qlFEI7QCuuimoqr6TAq/STJaBMaum6j8RlO2rpnMwQdZTl1DNJ
	nyHg3PKggEyIxsR6vdUQ079abHcDTHkDqdtoyMTA1YqYQQiyiNqrrO5w==
X-Gm-Gg: ATEYQzyry5OPY3gug2clu4JwhO47AsNbe3tLbVSuMycbl/l9u7E1KZZmSWkskMjF6iM
	L+AWNdgOHje0Xp57yjdUPFYMfqdPaPvzPwLDOs+LfS7xY5aYm75Kf3EEYMpGlHeZtoKeLH9EvqZ
	7YY5i3Z4dPWyBw0eAs54axoPo9n8P6vGsD+2cfDNMa3jOUlyE/DQ7XhbfThylS0mIhg36/VaQi0
	w7ar/pOBOOnSio3dYZGAt7ipWW+gG0UWXJ6mBgL
X-Received: by 2002:a05:6214:202a:b0:88a:2d35:6a5e with SMTP id 6a1803df08f44-89979ee8fe6mr129190296d6.38.1771858229243;
        Mon, 23 Feb 2026 06:50:29 -0800 (PST)
X-Received: by 2002:a05:6214:202a:b0:88a:2d35:6a5e with SMTP id
 6a1803df08f44-89979ee8fe6mr129189906d6.38.1771858228831; Mon, 23 Feb 2026
 06:50:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260219152737.728106-1-loic.poulain@oss.qualcomm.com>
 <20260219152737.728106-4-loic.poulain@oss.qualcomm.com> <s4xcnk6zef7nzmozptjj24ngvpa5ntllykvt6ypn6sv4xem6bm@dpbhlqdgnkqx>
In-Reply-To: <s4xcnk6zef7nzmozptjj24ngvpa5ntllykvt6ypn6sv4xem6bm@dpbhlqdgnkqx>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 15:50:17 +0100
X-Gm-Features: AaiRm53FQZ2mkbYH5vF6byzQyZ0NhqXi7alA3bavZgg9A29IkaWroXadzJ9f9eM
Message-ID: <CAFEp6-11g-5PjaaNz3CLeZY0JSZu4QQaW0_QE_3U=NQUcAdQaA@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: qcom: camss: vfe-340: Support for PIX client
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: bryan.odonoghue@linaro.org, rfoss@kernel.org, todor.too@gmail.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, vladimir.zapolskiy@linaro.org,
        johannes.goede@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDEyNyBTYWx0ZWRfX3xxtWZf/qBCe
 wFXJo/vZvO/Hnq7i2pYN2d/abYGYghSdQKI6Av8h5EdYiGT1WZWZ52/FXN4tV2PevUXb9Z96HYK
 mjKoZf13LEmEZKLumsIBHbcJOWBWE0qOiLUhXuJskjZRVdKxwVpX01rgRJN+sFFsukWvdmWf95L
 D66tFZjmRl6lRTg0x6NgszvCfLYqw7aQEoxdVgIg4gvmQM4L8DeypeEXVIJc0O8+ayIy4m4bg3V
 IIlXRUO+eRtTlx5cvg1sQ9WO5VVOVmvlT6DOdlUVAiVtGK+K/2Pp8jhN1RjBoceItt8lMBCyxYk
 X6hYuJbfumbNoAbueBFte1R6jKvRbjdJuuAJWdMF5Yv5uMzPIGWBHwWw8zdy32pJ2dspLWjh40W
 b7HmG0++FaRHaw5zDWpWmCYlJlslKcSXbuo90GR4Q7n7g2PyepF40fnzc+qnyq7vjxHkttIX3s7
 ZkjZRp8o55B1yxPMF2A==
X-Proofpoint-GUID: hp97V5DpF5_3IMl3iznZW_Mev8wDaEb5
X-Authority-Analysis: v=2.4 cv=Z5Lh3XRA c=1 sm=1 tr=0 ts=699c6935 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=pV5dpWT8A3q40HeYRHIA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: hp97V5DpF5_3IMl3iznZW_Mev8wDaEb5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_03,2026-02-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230127
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,gmail.com,vger.kernel.org,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-53190-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 5F619178416
X-Rspamd-Action: no action

On Sat, Feb 21, 2026 at 9:47=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Thu, Feb 19, 2026 at 04:27:37PM +0100, Loic Poulain wrote:
> > Add support for VFE PIX write engine, allowing to capture frames
> > via the PIX video device (e.g. msm_vfe0_pix).
>
> And nothing specifies, what is PIX.

I will describe and explain why we want PIX in V2.

>
> >
> > Tested on Agatti/Arduino-Uno-Q with:
> > media-ctl -d /dev/media0 -l '"msm_csiphy0":1->"msm_csid0":0[1],"msm_csi=
d0":4->"msm_vfe0_pix":0[1]'
> > media-ctl -d /dev/media0 -V '"imx219 2-0010":0[fmt:SRGGB10_1X10/640x480=
 field:none]'
> > media-ctl -d /dev/media0 -V '"msm_csiphy0":0[fmt:SRGGB10_1X10/640x480 f=
ield:none]'
> > media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10_1X10/640x480 fie=
ld:none]'
> > media-ctl -d /dev/media0 -V '"msm_csid0":4[fmt:SRGGB10_1X10/640x480 fie=
ld:none]'
> > media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10_1X10/640x480=
 field:none]'
>
> If we are using PIX, why do we need to setup RDI0 too? I thought that
> they are two alternatives.

Good catch, that was just a leftover from my test script. We don=E2=80=99t
need to configure the RDI subdevice(s) when using the PIX path.

Regards,
Loic

