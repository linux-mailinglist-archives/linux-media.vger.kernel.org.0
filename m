Return-Path: <linux-media+bounces-53189-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oIEoC2BonGmsFwQAu9opvQ
	(envelope-from <linux-media+bounces-53189-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 15:46:56 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9B3178392
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 15:46:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 15FF23049454
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 14:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E7ED2080C1;
	Mon, 23 Feb 2026 14:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H8qDC/dV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A6mhYbDC"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF251E515
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 14:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771858008; cv=pass; b=kCIuYtS1UYb0sR9MGKf5diJgW082A4zeZbaWJAr8qRKBE81JC8BqPlDTeEsMSSsGFRTaxD1qu3TVHS+TZyU6kmlwmVJnjHZsQzWZ9lNzqvuxlJwBNAK0WulaKAa0nO3MVc8X0fdGZR57jqGfYxFjCcey7ajQL1oM2nUm80yU67U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771858008; c=relaxed/simple;
	bh=qg91zdLq7qsLmamE1qtR+DobQ99+gMm3iZTp682hH+E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hpJfkCEH95pzX1bbvSmM8MXUdBAaxNOmMkxN8GxScureb7HW+WRI8x6ED0kDnRFJr74WIG6l695eQ94pOBEfmGcDmKqeqfkXgvKcLl47mlogewqSPO2udA3wPbEyQ/TpS5yDCCprJgw7io24BAMz6HYDyQDMKqKUV30VRAHHMfY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H8qDC/dV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A6mhYbDC; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N8M3Aj331517
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 14:46:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bKfHG8a6WOAKsVs6p8iftf0Vvn6XVQlGVDLYpN0CYfU=; b=H8qDC/dVtA1KcRcl
	/AGh0w8TtRwxUr+I2cPzMnySinbDrfxkXahOpOTXOQ9KdfnRYiZFqRBJbCLkum+F
	J8WD/m3EK0uTMr/9/xUSIE1i0LoRYE3oVbMy0636tvppUHF+NSx9VCvtHOvogGB9
	0y5lQhXKJ7mzNtVJDmbe1LAOEJ6c4Il0BpUZi8kCNccuasgIAzAyLj5KxWg1RftK
	rYuj4185J1nl7VNoawh5Id7gjU+DRm3DbMGpoY+CO8WHdtlTXEQIuL3DUntbnqIt
	epVymi0bN7AzQY+T7Ark3nfWNB1HL2RyR5PbO+7eU7T1IL19BfczjAZd9NjuIZVs
	mNmNIQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf603n4jd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 14:46:46 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89471437f64so505068846d6.3
        for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 06:46:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771858006; cv=none;
        d=google.com; s=arc-20240605;
        b=WLqbflg+iSck4aXn/RjZ0gaAHqgOlV+RpQD7sj2L2rI5fWT2hPiRgW27R70kKYYkh/
         CyVUrnfxgwhrQ+de2c4ojYGqP11dFFoW72QZkjAet3CX1IYgXx34GZEq0HIgskZK+j8N
         mf3fH9OXWMVZA823Y6dre5kQagORZliyxh1QV3P9C8rCXwdXgFAquYx7KzHvkMLH/3fS
         vvDq1ix65qodT2lvlSrlUu3jEFp2HzSc1HtPo0J+JICuibSkIXKPMc2/+V2osvQ2Usuo
         /B7hvT1XDXsl1CTl1eU8YBpvIO/qQ9zFDcC25lJKWTKjzoBoUOy1uEX+TE6O8S1D+IoZ
         icBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bKfHG8a6WOAKsVs6p8iftf0Vvn6XVQlGVDLYpN0CYfU=;
        fh=lKN4EQxvnOdUl7NQjSj9RpsL4UQxG6r6P87tkr8Omq0=;
        b=L8CARAWCxWwk9ySi0NY91Eq+GiR2UnUQlg9/twT9JqT4S6LKBGqTP5r9sJirQK1v46
         N50VzWXGSWg9CTjkUuLwwm5S0DE+iswyNBqoZBHKwTbCRZu5lV8zGuhMOCTcCxAD7WrH
         MYW9IOF1c93gQRN0onH0yHT1wIzPbYZk8FQE94Rr+Psz2hFS3QfJ3qjW0bU+garMitfY
         bfbHo46j+m8M3rGSKp5gcZFKEa0Umf9JVk9pwz2DHB7C4/TMufn8YzmD6bjQZdgwAPnd
         g2t+h7V/r4g1IKScGcY48neipQ5fERzxiJHZUc4JE7a2XQAhg1sWKyv5+bi4YND4waCk
         Us4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771858006; x=1772462806; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bKfHG8a6WOAKsVs6p8iftf0Vvn6XVQlGVDLYpN0CYfU=;
        b=A6mhYbDCoTlDxQa/rl+xtIM7qKubxeNH7tn7cmE8MFQfwgQ4nqxj6PBlOgUqNf2Uy8
         zNklrCHaKfAxHAwCLIgIsEy0xGNt/EKQlM1ShsEFSrZ/c1RY51DQKfGZSWIQCL2ED1PS
         9DgUu/FMOT8wiJZA4NfxSz4vqTWx2lZaZQ+SlANgFS4QH02zyi25zohpZuVkphUCzZF+
         XBowGa88CD1iwMdeFXBWD/Ih4FNd2in0sS+btTbC+t4iGmTYI5TdNCwARHdE87KKDnTF
         KpQejpXZFAGWTw9zV58XoABsWvnTHA/hSByhPEeELUjjYw3frWD+DmZXkQTi0Cs5pbHU
         DiEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771858006; x=1772462806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bKfHG8a6WOAKsVs6p8iftf0Vvn6XVQlGVDLYpN0CYfU=;
        b=nqxKNYi0MNLKX2btDoQ4nMYoadwTbzDnvNKDH5h15UMpS0XuPkPpevXRPhcu07ZiY1
         bJr/rD4THbj6X9zp9a81jGmZCYfrgNPmwnoO5kR8LZJPkJpEzr1p9F5T0qbE1P7lOqjS
         XNteKKFleITFrItVlBc7MtXh1b7vkf9WaDaAkYVxywCt752KAlCjrfQ7ERK35o554QbQ
         o8TA8suBOxgWkZZyEaXWkA2Zj8AEVikS9nZLQP3Lycr8xGpKfA8wy3CTxNsiwG0KInQa
         HhkIGwjAWGTh0j8MVuFdTDB9sXMH0fJ2WpFqQUVK/LX/pYGxQBn3SiMcqZu/Prol9aym
         mH3w==
X-Forwarded-Encrypted: i=1; AJvYcCVkM7YFRBUtuUXJPlJ1vzJoh+dlpQgdr/E0zJXMZ6oT6cdW6J92csmvcvwmhpY3VKYZy6FwGHPEQV6ZmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq2ki7teTLBEiz9qkxSTexvT7SplMTjyf4HIbSN7XA2Md5pzTF
	1bU4WvftBN4RopbfVagS+tB4DdiWH6iTp8CXyk+8PFPoxpR5pHgErJ83ti3z9WEzo8q5RyKDFT9
	4dFMv0vWb+hxOSaUBIHZyzFWNcPowVXMjvOlLAKvL7FrVuHvrVqNCb5UOLYm4hxs43n5bbqL/Pm
	pndQcCf8m6980ScJUYLMdebVmWKcGffcECo8M7MdWN
X-Gm-Gg: ATEYQzz8IZJW/PsOZKj6BbFG3yRlBUT/9qytYjLdiNc/YBXsTwxlFrkQ015+i+jHE/p
	heBBX6mJrR74NnsfQ1Pba0ybWHAFxoOQvrarIPORRU7f9yLaBa9arviBQg3KhQm8OmvCXZzvbvg
	UGjKZJIW/4GThKHMR9VDT+cN27Gdt5BYSnjnYliSTkldbc9lUH9PpPN+qGIan8DVafK9j2nL3ii
	ifCMhKaAKpn0NhJJ/zpHqKB+jse6eW9jlL7Un3m
X-Received: by 2002:a05:6214:e49:b0:888:57f3:ac07 with SMTP id 6a1803df08f44-89979d6301amr121873006d6.54.1771858005754;
        Mon, 23 Feb 2026 06:46:45 -0800 (PST)
X-Received: by 2002:a05:6214:e49:b0:888:57f3:ac07 with SMTP id
 6a1803df08f44-89979d6301amr121872686d6.54.1771858005320; Mon, 23 Feb 2026
 06:46:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260219152737.728106-1-loic.poulain@oss.qualcomm.com>
 <20260219152737.728106-4-loic.poulain@oss.qualcomm.com> <01804171-a9f2-4509-afed-d222c5d06251@oss.qualcomm.com>
In-Reply-To: <01804171-a9f2-4509-afed-d222c5d06251@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 15:46:34 +0100
X-Gm-Features: AaiRm511JEkWulNdfOn2-5mzgw7Pi0Vh_ef8p_SR-hXHE1nYpmvPAZcMnEaxnzQ
Message-ID: <CAFEp6-0+RKYLJ9pGzP1f9rbHNFNG+cXhwCr+=fwDAghrbB5Bjg@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: qcom: camss: vfe-340: Support for PIX client
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: bryan.odonoghue@linaro.org, rfoss@kernel.org, todor.too@gmail.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, vladimir.zapolskiy@linaro.org,
        johannes.goede@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=XbWEDY55 c=1 sm=1 tr=0 ts=699c6856 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=YJuqGnECvhMJ3ga0x1wA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDEyNiBTYWx0ZWRfX8gXpV/wEg5tC
 1pJGP/JdHKbWg8h5xOWsUq19dNwXlfaJ4cJCrnYh+B1ilkdV/2zkIAbtm+RzAvCvzuXjnsYtjrJ
 48kREDsHl+RnlfV69+qUGTQ/SkLoBpzgf3DvDgdIpn73ll+0vUY8R9c3fPCUj1l6k+OCKrGPR7V
 cFLT+pE+3FbOxfdHlYPdn45hF97ypYuaU6wCqrBaX8SfQSQizyqwuUY6Z/Pv52Z6gohI0HeGQaZ
 KY0J14rJzsukVvMiJY15LJujjMcSsyrMOFX8QNZxmNKZKe+UE0gWsoF2GB7C5u7Kz+2stqJ3T93
 SjKRvTaN42vjoR4Z7kKXLGuoPIkNrOs4bzxAoVxCyH9jc8hufNWEx5F3O/xsXmXWsRuCmnsjdt2
 b0qAyIcQGVhdi+ZkguUtQxzeXFg6pML7cX4fmTrRHqpaXxLCF59gzRp+U8KP+4U4XtabI9CUVco
 hjf0Vw/8iULAYiFgqvg==
X-Proofpoint-ORIG-GUID: L-IUveJGpF63EoVufKLoMXIVn_GrsgNW
X-Proofpoint-GUID: L-IUveJGpF63EoVufKLoMXIVn_GrsgNW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_03,2026-02-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230126
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,gmail.com,vger.kernel.org,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-53189-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9B9B3178392
X-Rspamd-Action: no action

Hi Konrad,

On Thu, Feb 19, 2026 at 4:46=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 2/19/26 4:27 PM, Loic Poulain wrote:
> > Add support for VFE PIX write engine, allowing to capture frames
> > via the PIX video device (e.g. msm_vfe0_pix).
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
> > media-ctl -d /dev/media0 -V '"msm_vfe0_pix":0[fmt:SRGGB10_1X10/640x480 =
field:none]'
> > yavta -B capture-mplane --capture=3D30 -n 3 -f SRGGB10P -s 640x480 /dev=
/video3
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
>
> [...]
>
> > +     if (client =3D=3D TFE_CLI_BAYER) { /* PIX */
> > +             writel_relaxed(pix->width + (pix->height << 16),
> > +                            vfe->base + TFE_BUS_IMAGE_CFG_0(client));
> > +             writel_relaxed(0u, vfe->base + TFE_BUS_IMAGE_CFG_1(client=
));
> > +             writel_relaxed(stride, vfe->base + TFE_BUS_IMAGE_CFG_2(cl=
ient));
> > +             writel_relaxed(stride * pix->height, vfe->base + TFE_BUS_=
FRAME_INCR(client));
> > +             writel_relaxed(vfe_packer_format(vfe, pix->pixelformat),
> > +                            vfe->base + TFE_BUS_PACKER_CFG(client));
> > +     } else { /* RDI */
> > +             writel_relaxed(TFE_BUS_IMAGE_CFG_0_DEFAULT,
> > +                            vfe->base + TFE_BUS_IMAGE_CFG_0(client));
> > +             writel_relaxed(0u, vfe->base + TFE_BUS_IMAGE_CFG_1(client=
));
>
> Were these default settings (prebumably "dont care" or "always max") vali=
d
> for RDI? Would the ones you set up for PIX work/make more sense indiscrim=
ately?

That's a good question, the configuration above is the typical setup
used for RDI paths, and it matches what other drivers generally do...
The RDI path traditionally uses very loose or =E2=80=9Cdon=E2=80=99t care=
=E2=80=9D format
settings, and simply 'raw' dumps everything between the CSI Frame
Start and Frame End packets as an opaque byte sequence.
On the PIX path, however, we expect at least some level of processing
(even minimal), such as cropping, plus later statistics... For that,
we need a 'description' of the frame format.

So theoretically we could describe the frame more precisely for RDI as
well, but that would diverge from what existing drivers typically do,
and the benefit is limited since RDI does not really consume most of
that information.
Also, I think we may end up dumping content that has no line
delimiters at all via RDI, such as sensor=E2=80=91generated metadata blocks
that don=E2=80=99t follow the usual LS/LE framing.

Regards,
Loic

