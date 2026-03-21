Return-Path: <linux-media+bounces-56602-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kF9MMsixvmmAXQMAu9opvQ
	(envelope-from <linux-media+bounces-56602-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 15:57:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E70F2E5E9B
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 15:57:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37C39301174D
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 14:57:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9354E391E4A;
	Sat, 21 Mar 2026 14:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lcj3j21z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HfWvg/LP"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC915391820
	for <linux-media@vger.kernel.org>; Sat, 21 Mar 2026 14:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774105022; cv=pass; b=V760e8FKWIFOLBb+LYqMqjYMqsc4TAwNzHYER3W7ihrGPDLag5JgZheujeniPaWl13WKjBuqClh6p/TmI15Z1GzSqbRzzFc8LaBuNytmstGquu+ZVhgz5baObGpTGRgGQYjYHxRC43OufjhnYXIYvHoZZzt3LE2t1KS32ICOlh0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774105022; c=relaxed/simple;
	bh=1GmXpOs+zXTsbr9RCYoSBINmO/8mKSST65ibpaAOJJk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VUlSVdtWvHj/UwS96HydNyROy+D946HJMTapHBJD2bf+OeK3qWwMmf3WtU+9rwnd20QuQrLF11XaAyFFsL87QOt4vULQom7IVKwU/rH76JcKpMxpGHGbSo1O0QFTK8i9AD0GH5ov2KaiUXLV9pcPeTFEFBYGJgONp2OponyHZLA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lcj3j21z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HfWvg/LP; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62LCn6W43591549
	for <linux-media@vger.kernel.org>; Sat, 21 Mar 2026 14:56:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=IsCUsB8kbj2Nj1VB2Vt34iZkOEedc8eMCY8mNmwbBsc=; b=lc
	j3j21z1Zl2CcUxZ3LOLwDgBUPV9P/DyGmoXZpwglb7t2bhwCar1muQQY9k3IyjUY
	c356FmOB+qnsz8+ey9N234QBd7wMl8M0IbUq0WGwim6/RRCuIWXuMDuen9VAHVBN
	KvlUMLWLkeJMvSN93Vq3hsPS3oPCu/dUfI1WYf2MlG07WrNDRdb3X+84HUshmeIH
	olLsFYQ++tbBKeapTwy+gwVoOB21h3SzBX0XRJfpB3/rJ8ZMWoD3WgLVZJz5oBkb
	++akuWqdFcj8AqlDffRcBkNU+TtzaKDqcOj1dCWDhGOlcQXNnJe4irt9nLPajUyH
	JzcGUBDZ720x6ATmK28w==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1jng0xf8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 21 Mar 2026 14:56:59 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-67bf2b72878so12355050eaf.2
        for <linux-media@vger.kernel.org>; Sat, 21 Mar 2026 07:56:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774105019; cv=none;
        d=google.com; s=arc-20240605;
        b=Nk5nH2arnRqwmgpOd3MJMAloaITepRWgZm689QspE5jAn5Z29kgnERbgUou0Nr93Cg
         JDS+WEZm4TZEhTe2l+GPRXj4Q0/pPdrNbddyzDS+57IrXoJhCuZBDmyeepISzm01j3i1
         hh2XjeAHYDmKu1gtb6R1jyhG246y/ipe6PBI+YLqSDXC+cOHX9bhRJeRTkIZMxSGHtTq
         noK4ijCG2rvMJKiajQel7+hg9P/y0ksNJDVgJIYgjGrNekp+8vfEX3RxYMt+P1E4XuX0
         9dRIbCKEt4Wu+HJa8jv8i+kMrgefgGH7iKB0lrGppy4ErCLt8PhNgGxeUfO/I+7IqVyh
         L9sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=IsCUsB8kbj2Nj1VB2Vt34iZkOEedc8eMCY8mNmwbBsc=;
        fh=7wmu7sLFeq6MvaayiAWdXxBlW3VIipBjKdUrZX4zwck=;
        b=jqEJHdVE3FgBZ9ZXYq01DXh8HA0tqc199aEmrMdiAsTBHwdCFw5Z3Pt9Mug0avfj0H
         Hii7Gbt3S+hqxUvPcJYNjo7eQJ0NY7w5MekRyPRBLYFy1+8KGEK3/qfVpnsVcQeDxTel
         z15HFuvWBANeDiXqucDGIJpices3MN988FoWsJUDuUiJRUswAWNB6UwQmChk+gbWXz5G
         EMESG+LOItGEnzjMEEe4By0QfIVgQl6M/9+RB6xRKpPLNV1x6T4NBE+d3hZv2QExHdyI
         5Mdtu/WfXFfxvmWuLmxbN4K2dcxKn2UFjprqZudbxfsL+dC1PtWxBC8RMFpoJjLFE1Rm
         RguQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774105019; x=1774709819; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IsCUsB8kbj2Nj1VB2Vt34iZkOEedc8eMCY8mNmwbBsc=;
        b=HfWvg/LP9C11GHJUPov/1gvxxiQTcA7brr3/vmnGHiJGgfk2yb8nQIhZ0FS0+peAHg
         r5UZ0jSFpOeZmMeagJU6Wk2sjy0rfVm2tAAZQ9CKN1DcT7jAZb53EpYucNdVZQRrYPMc
         QuXqwF88dPVXZCEKuusvMGathwjv04RVw19iIK8zK31YKTVdrb4vZl59QbmYjUp6UtUO
         CUtlpIHdz7f6W1czNY+UXURRd2iPv98TsoBnwzt2Jp2HbWqOU3nyYhEeKY8jAaJT790+
         PtIc+uDGQDE9D2iyPyUC7rr3Mn7ciFtYMfkW85vENnLTGURfH5HIp9q+k0t+alZ/Ym/3
         HkOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774105019; x=1774709819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IsCUsB8kbj2Nj1VB2Vt34iZkOEedc8eMCY8mNmwbBsc=;
        b=J7fi8eeOb6qx4acpSGOI+vVP62NuvjrpxFk4w/scLUuuvv+FJ1BZYDYDgYhDJGpy/1
         GqTETmt91fUCIJOAP+0gqR+ZmoOannYcEX8Exvo5pyz1kclVvlOVGHQdZPM8A7p/+0Sj
         b8wzb+GgUIBk05BF+zFmgmcepcKMLp6+8mdHM8dcVDEioljg77ed2/KnLphck2vyEyoY
         P8CqJPwcQ4dhnUdb9iYSSeA3s7Dk2q2OpYtjR59Eq0GtPAxBdAscKPQ18nJTc8qn+pxS
         jpG+uVySEqa9DAqCJoDpgFkkwmvXEvJX52rjDRGyr0mmwMG2K90iKvnZJ0+U1u4jSl2T
         3aAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtx1+sIFmOht6RluZOgtzMzvJZkervhvBXxviDZR1nXDItaZ1rXFa3zlpZo3I4o54Lz64lYNSDmfFf2w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc4bBzTzvnT+2lLfUgVjUeWO1rfNf9Sab6OKV6m49x41p0crEW
	e4Q5aKofHjlxQvvGJDzVBdRiKSUp6XA3ps26fe6D1TagTzqLrLxzhijTekXhgof6Dr86jPYs6b/
	Bmo/cs6lLF/zpWikixpgeyUcPbzrdzwonvoW0oQ1Wk8P11e076zKeafAaVv7g2psoUZkaBS7Zel
	rLBEnjhu+XYdq/OwsXoEa9sNwKqDJUbbeotpUT25yf
X-Gm-Gg: ATEYQzydovhmrJkjsPjs1xU+mr0A+DkLMsW1hWqISTQPVs5v8rLyz96jZDiy+I+VFhW
	6kflCF3YGEfPs3mGibPWkt9s0aXSQASAgQbOvm03TQMXLh7YASKXtU+RVuYkRF3j2bDtQn/mlny
	twyiu4I/vagMUjkVQDog4KlXO5+BwxSt+Hknx1pJjprFEyyUCXqA9GExzI8vAXngpNRG8drjFRp
	fs7gFfAF9VvxY2cFP9uFqHqCVSgpWyHaEmRBQ==
X-Received: by 2002:a05:6820:1f06:b0:67b:c5ef:abbf with SMTP id 006d021491bc7-67c22eea5a0mr4039066eaf.29.1774105019014;
        Sat, 21 Mar 2026 07:56:59 -0700 (PDT)
X-Received: by 2002:a05:6820:1f06:b0:67b:c5ef:abbf with SMTP id
 006d021491bc7-67c22eea5a0mr4039055eaf.29.1774105018620; Sat, 21 Mar 2026
 07:56:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260320-iris-platform-data-v9-0-3939967f4752@oss.qualcomm.com> <20260320-iris-platform-data-v9-10-3939967f4752@oss.qualcomm.com>
In-Reply-To: <20260320-iris-platform-data-v9-10-3939967f4752@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sat, 21 Mar 2026 07:56:47 -0700
X-Gm-Features: AaiRm51fSVtvwDhwEggxITuKsX0LnCSkrAF0Vsy3jEOVrP53K9Zbb24FkFwFkoM
Message-ID: <CACSVV00Es3dGirfe9aHKwvaZog=DtEx9-ZPz1YeuStKobcpT7A@mail.gmail.com>
Subject: Re: [PATCH v9 10/11] media: qcom: iris: use new firmware name for SM8250
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 615G36Ycna0LHfYe0us9op3v9mRM11r6
X-Authority-Analysis: v=2.4 cv=Q63fIo2a c=1 sm=1 tr=0 ts=69beb1bb cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=m9s-f9MSkVwDBwkCJOoA:9
 a=QEXdDO2ut3YA:10 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-ORIG-GUID: 615G36Ycna0LHfYe0us9op3v9mRM11r6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIxMDEyNSBTYWx0ZWRfX0bMGomI+Sgbc
 gvlm214bICC7YUU/U/Yi5SITtWKOJZDLzlfC+FQXOxVNDEQ37LWO1pDgp6OfpAzlJHmZ0Z4TzYg
 2oWmv7eQLWoHjSHEhmAyXntfZkS+cdhBSEMbCBqa03yUUv2tISEiwav09eJTwfGzbIY7iD8tF0s
 623Yhv66lOFmz6id8lBooobonoXJqLJP4bQAttdnX12esJ7vTLNbGv8k7mfjMeahUi03CqpWW0Y
 L3J/LaWN0FMvQ8dsMw9AYuWJZlzEKmvThnQXjnoMjefOuVcjhTgUUwSRST2P7k++jNFUKX66fHq
 Y0hV3RUhcacdIx+CT8BJTMtgK7B1vBfhzn8DFE6hBetSRy3t52yjoqbC2gyEB2srqKbbVOk0qau
 yQ0+oiwO/eCBKDb/cYqg0Suap1wGxSOdaqccX6dsW+PYaKtBprPXrbjBDdrp/Yb5h9xJCZW9zLY
 LRK8o4AuO1LekoUZX4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-21_04,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603210125
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56602-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	RCVD_COUNT_FIVE(0.00)[6];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5E70F2E5E9B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 21, 2026 at 7:45=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> The linux-firmware is providing the vpuNN_pM.mbn firmware for SM8250
> since August of 2024. Stop using the legacy firmware name
> (vpu-1.0/venus.mbn) and switch to the standard firmware name schema
> (vpu/vpu20_p4.mbn).

drive-by... how useful is it at all to list signed fw name in the
driver, when it's going to have to be overridden by dts for basically
everyone that isnt' a qc employee?  On the GPU side, we stopped
listing zap fw names for this reason.

BR,
-R

> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_platform_vpu2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/driv=
ers/media/platform/qcom/iris/iris_platform_vpu2.c
> index ab2a19aa9c36..692fbc2aab56 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> @@ -111,7 +111,7 @@ const struct iris_platform_data sm8250_data =3D {
>         .opp_clk_tbl =3D sm8250_opp_clk_table,
>         /* Upper bound of DMA address range */
>         .dma_mask =3D 0xe0000000 - 1,
> -       .fwname =3D "qcom/vpu-1.0/venus.mbn",
> +       .fwname =3D "qcom/vpu/vpu20_p4.mbn",
>         .inst_iris_fmts =3D iris_fmts_vpu2_dec,
>         .inst_iris_fmts_size =3D ARRAY_SIZE(iris_fmts_vpu2_dec),
>         .inst_caps =3D &platform_inst_cap_vpu2,
>
> --
> 2.47.3
>
>

