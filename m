Return-Path: <linux-media+bounces-59724-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BsZEJzC72kxFwEAu9opvQ
	(envelope-from <linux-media+bounces-59724-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 22:10:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9850A479B87
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 22:10:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C86AB3019B8B
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 20:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A866C2F12D4;
	Mon, 27 Apr 2026 20:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NUwUd2Ck";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h6oetvM+"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EF72DECC2
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 20:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777320554; cv=pass; b=qyJXO/ac7ZLtX1eZ2j7lmNJ+rLSxOtJEYz2tCSGTbudXLGtLKbHsBzE14ZaISbWO3F+dUofM6f9FzLv/lzYZH1JL8AWm8eHSUa17uD7nEDeUEQVOsKyRu0tXejwB4MUFhlJgqNVv4DyCqHC7sZDzzhtPkaihqyMNTtKTDuzWfDM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777320554; c=relaxed/simple;
	bh=zJf6itPcif0oS4I2opQ1ZeZHwhSjUSFKoJJMf+zZal4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KgQJIj3dogfeeEpajL1TwEZhDalzxy2ZbvtdVgAX7nvvAMdV69u+Wcl/08jD67DllzjTdXzJ+GNo3S0um+n2EMKNoIK4mF1Zh54ugCVfoE0X7+hDduvNf+VKNyZHNiwWHDKhoyfvFnnlhTWsQ46tWNUOaLI2Qv7GUGEE8yIo3u0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NUwUd2Ck; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h6oetvM+; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RK0mVx2383087
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 20:09:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K2HnqUmhHcbUyD58GB7XPc0QpK+OT1yUlEKIPYYo7QQ=; b=NUwUd2Ckcp6eQcr3
	wjTRb6FPXg5tcMtTN2yu8UL2bS2zGf/Em6YqtiyEnlJj6Yk2dGodyuNgS9UGpG+B
	LjWJugW+aBMwe0xaBWSIDK6tmE0menmih1aGaTk+sUHYEEcyXsM2ffIFPaB1koEx
	sc9eBnL1YYESQltWqWn7PK/SQB/4eRg1JKVUtTplcjikjZ+YUCOpmWV6ts618dpZ
	vwG5Woiwp46nGW5yd9HXXNrYo4pRalp3n9DrMpGse+s6MHswQJ3PhfqvlZqaZ2lF
	SvaDPXUGfjXZ4GTZtAU1C4LYoH+6bSkSIctobnRf3MyrG/MXXBT6/BO3hJy//ZQg
	TcMBxA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt85xspfa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 20:09:12 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ac9609d3d6so266150676d6.0
        for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 13:09:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777320551; cv=none;
        d=google.com; s=arc-20240605;
        b=DGBIiRUtm2LbdkvFzeujnDQlFNZe5EBFU86nlUbldrBZ71ahvkwRtYNFmlxRcidu3J
         Z8WdQ+ozWI1cqxtYlFdsQdoI9KZrFd/H0/Ygmr6ClNGz2eauq5Tk3jqYEsBztYTLrDP2
         0nj9jieu+RBeIugcNGihbBe5//uIZTY+xLQDrGBZIOwo0SCDYvXVtaJkXF5j22iC1xZ8
         4YdTTXFFPE8c1PIb8791Xg0ZZo+KrGylprrc6P7ZIQA3nloPkqj2bgpO+UHUEtBoByTq
         DaMnOFeeTgfxJ6aHUlfkBXNqpvQzne6snrCtzP7AKW526fgl9JCLUtcZPo1aA789K0fW
         +3OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K2HnqUmhHcbUyD58GB7XPc0QpK+OT1yUlEKIPYYo7QQ=;
        fh=iosx4csgrrVkDfhO/O5CHlnPiH1OI9uRs3Uq9a9Qo1E=;
        b=TDQVRC6+cDV86kf2ulndAxEtjhj/qFCD3s8z7KVgGsIvt/yRx3a5lSiHKfheKCQSAD
         J+A0+HWtEPiERR6UKv7gpjC/3MsgBjaQprPZk7m/1iBakz27c31RvarOWOl62sq4pu/c
         m+t5mG2YA4QMkjZznL6F3erDkbUW+WdDBoFbaTWGz0ZIOGQpbZlbkzDTxs25skmrVC68
         mHJ65J1SNabj8J9iYyi5H0m2Bvmq2tbNe4HTwNVPGoGdbzLd/HvTcaTv2KsMo/w4vs3t
         tTL5UgyRr0N+gc8Z3lcc4zv2GcP9itXbdPTfcIsgQgA6cBcoMzUgDHxvST0+lepPCjRc
         D+tQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777320551; x=1777925351; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K2HnqUmhHcbUyD58GB7XPc0QpK+OT1yUlEKIPYYo7QQ=;
        b=h6oetvM+pp9+S/xwnBzKR1jBNK7mGsrYc6Q0nhBAptd80K68zcVo9VLIjf06ZSjQxk
         QsozJwDRg3jB2M6AHbPU7+BIRnyPaUwH2KISec4BIbHY4eMRGOiQUFtmLCSoV9/8ktzn
         4IKrwBP5LxnWtI3pXHwVsuniSqBoD0X05odQBUFVJNUns4Ksk/ICyJFpZJ2oqAbvVkwS
         bVdFUGAyz6wpp/fhWen2He7Fw1n8HiRrb1wDWIXHZKXZrS2iyNmsH1xea4JtJq/dZyz+
         PRRp8DhXFUzIhRxWKQX3/bf25scYX4587NolzEKHuzO71ehHdIpWrORUb8G6T7hP8Ho7
         fOYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777320551; x=1777925351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K2HnqUmhHcbUyD58GB7XPc0QpK+OT1yUlEKIPYYo7QQ=;
        b=W/oNUpo5QyRg04CYzzP5SsYG1+qtD0l97OqIwGEIlmAObqDPRnJPEvyXLTz8KTjuPt
         83Rxtp8CS7fAFjovFmnhH2VgWnZcI5N0cUTSvYrs/1WEFLHjyzI/QPM3ZFdgHuu+gD8J
         vrvAn9fuOIA8SKUbdi2WxpeHMeNVVZOUbNFccI0R3WPqXeu9hyyk0kKBth6PWAAHxc23
         pSlneMkxPhoCQy23nbhFpxITnTRwnJ8cNDnqZrRzUnIT7s9inuTpAOGbuFhYmoKIbqvO
         z9epHkvVwaxFaVYulY6lVwc6kOJzyvQxOZusvAS5LeOzeZjdS5s5jiSe1X/6v5M8insl
         I1dQ==
X-Forwarded-Encrypted: i=1; AFNElJ/35vYRHkaUkPn+hf6074Y2pIX66iSWthDSsJSO3TfuRzVPxewCid5NshHnNuB0gj1nm5jNz8MOTJny2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJW5s+p6DGo02ssJTa1rpm8mMifQQfVvs0AEEIt9zgs6GqaP8m
	t7aF5AkINUZXk/UMvHkwqUtw5tb2uy9ukvNQnhdJ9f8kYtAjFU9xUeSA239z2/wBPEH/sOVf0HT
	4OW5+vUmiFwdeuDzMeVL3Y9ty6oPjASiN2Bc3onxCB1B4ozo/OdgIjyYHdqKoJomZtS84VcqUsX
	guYTk2GLTOKmBT1qx34hWHUd/MMbbseTgTvlrUjhwc
X-Gm-Gg: AeBDietJ7gZiVJiIhw+jQIFrnDKsoysn8RZ1L2Di5vl6g3Wq/F30JDbl/bkQLk1baf6
	PM6ezINKmVc8U1wl4a1SUbtkXVTodcp41rxGAE5UbAXXfYo3mW4f1B5bgeD3//2MXo86QsNRPg/
	zn7zrRDaoAeWVmhbCTBwROqFXV5TNiXAP5TJASEAwZJdmN4EQEvopON91FwUZypL7ei6ejy3Ddr
	vwk+ffT8Wso8EV7Q0zGw+Qw/wzhnY3Hu3vOkaRFddATVfWz6U8=
X-Received: by 2002:ad4:5e8b:0:b0:8ac:b619:5ec3 with SMTP id 6a1803df08f44-8b3e31fca48mr5277986d6.50.1777320551068;
        Mon, 27 Apr 2026 13:09:11 -0700 (PDT)
X-Received: by 2002:ad4:5e8b:0:b0:8ac:b619:5ec3 with SMTP id
 6a1803df08f44-8b3e31fca48mr5277336d6.50.1777320550568; Mon, 27 Apr 2026
 13:09:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
 <20260427-camss-isp-ope-v2-12-f430e7485009@oss.qualcomm.com> <3e72d17c-e46c-42d3-9b17-54627f6e5e28@oss.qualcomm.com>
In-Reply-To: <3e72d17c-e46c-42d3-9b17-54627f6e5e28@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 22:08:59 +0200
X-Gm-Features: AVHnY4KEu3qZJsaEgSW3oDVV1djoe7ePu-gt-mc0PBpeJhQ4prv1LHNjDVdgtGI
Message-ID: <CAFEp6-20MzQh55iJzyhn=htFZxN1yq9o+EJJAX0CWG3O6_KSyA@mail.gmail.com>
Subject: Re: [PATCH v2 12/14] media: uapi: Add CAMSS ISP configuration definition
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "Bryan O'Donoghue" <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, devicetree@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Zs3d7d7G c=1 sm=1 tr=0 ts=69efc268 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=NNFLuuOXt9NZh06aAH4A:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: XH9LaiNf96fyalatuAhSisiWd49IixKt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDIxNCBTYWx0ZWRfX8P8izfPO1G5g
 v06TslbZQftsJj9QvlXgdcDaoxcXILcW1KA/fsJkAi/PUuCGyPs2VRic0nIHUyeXWATimRlB7bS
 1C44WnNeEreM7kI5RaFGomLtScEKSuQMmSE3YilbhMYzUeKE6205CztLQRI3SKv31tPUkqfjynP
 euaoQ6ccoQm/gmxX4bKe+mflTBWBxjrjKr03OgDKp12rQQ/NBA708vUR6Op+ggQJKyTOPO27noY
 D32+bH6apgc0Cb7fkOykOsW/GEjvr9jwcmn0U3W1mU/Ja4ws+HgTa7duE+e1V85b7O2/mkw3U2/
 jjmUFUybE1JA0yrFwG+34hc7AhFtDEJFuPmcF6v5z6kYO/8fvZKXYOi5ImDIjGL8rMVcqpaq89m
 rbpkPMsT0s3+y/iwwjDEc/DPAQ3DYBL5q25raA/DZaGwvzpfJIOywI+ZgmCnmOLS36RQouFjLip
 B4n7Yi6EJdyU0s+lsMw==
X-Proofpoint-GUID: XH9LaiNf96fyalatuAhSisiWd49IixKt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270214
X-Rspamd-Queue-Id: 9850A479B87
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59724-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Mon, Apr 27, 2026 at 2:56=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 4/27/26 2:43 PM, Loic Poulain wrote:
> > Add the uapi header camss-config.h defining the ISP parameter
> > structures used by the CAMSS Offline Processing Engine (OPE) driver.
> > This includes structures for white balance, chroma enhancement and
> > color correction configuration.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
>
> [...]
>
>
> > +/**
> > + * struct camss_params_wb_gain - White Balance gains
> > + *
> > + * @header:   generic block header; @header.type =3D CAMSS_PARAMS_WB_G=
AIN
> > + * @g_gain:   green channel gain (15uQ10)
> > + * @b_gain:   blue channel gain (15uQ10)
> > + * @r_gain:   red channel gain (15uQ10)
> > + */
> > +struct camss_params_wb_gain {
> > +     struct v4l2_isp_params_block_header header;
> > +     __u16 g_gain;
> > +     __u16 b_gain;
> > +     __u16 r_gain;
> > +     __u16 _pad;
> > +} __attribute__((aligned(8)));
>
> Should this be __le for all of the related types?

At the moment, this is purely a UAPI, the values are not dumped
directly to hardware as-is. Instead, each field is translated into one
or more register writes, with the appropriate math, masking and
shifting applied. Adding explicit endianness in the definition would
therefore require special handling on both user and kernel side
(to_le16, from_le16).

On the other side, there are scenarios, such as platforms that rely on
ICP (firmware-driven processing), where we may want to forward these
structures directly within an HFI packet to the ICP MCU. In that
context, explicitly defining the endianness could make some sense...

Regards,
Loic

