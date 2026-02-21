Return-Path: <linux-media+bounces-53138-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AIxTESNxmWkfUAMAu9opvQ
	(envelope-from <linux-media+bounces-53138-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 21 Feb 2026 09:47:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D427616C6D4
	for <lists+linux-media@lfdr.de>; Sat, 21 Feb 2026 09:47:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2120A300493C
	for <lists+linux-media@lfdr.de>; Sat, 21 Feb 2026 08:47:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 177442F3618;
	Sat, 21 Feb 2026 08:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CuA5cpqR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c11BnIqW"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5165B21771B
	for <linux-media@vger.kernel.org>; Sat, 21 Feb 2026 08:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771663648; cv=none; b=FpMYiQ1CKGuqVBzIZmxqSq6hVRyQD3tTOsyDKcOqJMHlNmoHKEj4dVMNKi096Zydzd//AdlEjmcXZb8NDY46DVr2yiG2+d4Y3Vta/1ZmR4Tc0ZzmISdm0uPtaM9bXGxx5vxM9kwYYcbYqDH4klWLWIf4dRETx61eLJTIClaHhc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771663648; c=relaxed/simple;
	bh=tRn0DThSLflcJMZTji8S2/jDXpqEAqTNUUFl+3gSkNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E8p8WmyrCfPJ514M0wC++9/Fm2nnemUtg/JfuLNphs5CZ0NXYrx9hauFn2soPEVxxF/PNzifqfSwITB+JSVwkJznLEWRV10jkcQaEa0+Ek5r0Tadqx5rW0QTObcDTP51mT4hU2HoV4DXzMIcF1ncVzjrGWiWx0PS9zxSnYCzOvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CuA5cpqR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c11BnIqW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61L5CNiE1559988
	for <linux-media@vger.kernel.org>; Sat, 21 Feb 2026 08:47:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fhS9S5/58016Vf/YXfH8VAqj
	s0j11zRsRAHbqbywpcw=; b=CuA5cpqRYIvCvzHrmidfdX8YflKf/kvNmstqXYCm
	45M42bEFBl7uYEm56U0uQomI6qFVAwEMb230dXu/nxr4rhAso2RcK7L2srAgfypW
	98lMG21aphALCPSO5Cp2miTkW2j2/1kPNuDIq6rYl2cK0jxCDXUBE4ptN55fJAwc
	gIL+eOcIBDRzN1RS258FNXy11KduyuY3z/EXsQOO8mJq5vCycSX/QX2lv63NzBzv
	0gIqD48A1wQzvb4r8+s0woXo9xdE9TIrWKgm+8n20Dqx6UZIymnuoXrN3d+WX/Yh
	X9pSN8DXoUkUKpsandO58AfKMEKtn51+0n8ZfVjE1k48ag==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5v3r9r6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 21 Feb 2026 08:47:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb4b8e9112so265357985a.2
        for <linux-media@vger.kernel.org>; Sat, 21 Feb 2026 00:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771663645; x=1772268445; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fhS9S5/58016Vf/YXfH8VAqjs0j11zRsRAHbqbywpcw=;
        b=c11BnIqWmEsAJrwkzW/0O9Qz+D+Rh2LK1YtAKfVVzm4eJXJbRBY8IAM+JJdoXTpSFn
         ByiWxmDNfH+H2nK2J34g/OQ4ZZGQtdABRNvST4h/Y7KaedYDcD0jJe7ETK4VEEONf05X
         iP1yqrE7zRLFOrmVbg3dBSKc6EtO6w98+2sN+ucYVl4oUgdUaBtV4l+9fu9BD/PhTxTt
         ln4k0MmwMXztMqsXM3kjPO9SqjTOoa2ZW/VC2DFXr5XXKFLNcNrp1uWNHJtRr9hsTlCs
         1AFZtCfIo14lwnW6pQEwMsMVZFRVtOdsjNvnmVqdTOKFAqoGvfAkYAbzm2J0QoFZUhyG
         ZyQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771663645; x=1772268445;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fhS9S5/58016Vf/YXfH8VAqjs0j11zRsRAHbqbywpcw=;
        b=VgZussQIF0726MZmGz4byOYvc8LAzw9gvy5a7M+jsT3MqSf+YrzRudM0OfVMoQYRST
         ggOTc2O17RdWPEELOMTTPjJWPSd7f78cznHW6IcsB8Nbfar73jGlt0H8ZHcRu6tDuXoe
         vf0YHlEj2p54C8/SWwJUiVWidd3wikB53DZK6/ofuvYnM6ixZZdlNDWVZYZRx9pygjRv
         rFtjA+WHwpIs9iW6dqJ+4+Ak7vkaQaffWflhU/3cNO/lnBT77EcRtjlF4AVVCLzGW/3Y
         L8njsujyuyZW1ylYMjlpDzasVYSbaFpNzFLqS9U4ae+A+OgGBGZW3MIuZXfSRqgYjz6z
         Eaeg==
X-Forwarded-Encrypted: i=1; AJvYcCWstU0nKs8kqiPJf5R50AlJAEDKufzYN/Gwz2URMmr2McRu/JPeArA2XwmTRdh7L3xPtEAcGM7p3xqjyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfKDiztCJgkPHIpMPYazhtyr1TcZ+YlICblWBraNqaA0xmgolv
	zpTNKK241BfrBb8Gm0afvEHtkhBgHhhfhAAN9X9JOCSpZowxBxTg/eVVVZZxggFSSHFRl5x+QeI
	CsuR68xpAZ7V426DOy6IuUNNKFfDxI7fqRN/plUI5+niD/ofIzKxYzxyqcuvTW/nA8A==
X-Gm-Gg: AZuq6aJQbO/XeXGUvXg/aOt6YZP1nP6C7oRSOoJobdfzXrrCLKxkb8Wq5garSh7a/Ut
	+LDQGCOV1QQR7zFmi54kvoxLJrngcjJjyTVnOfP5JhqsieLVQAF9itcyxyZpo3a3BAXwWaFLZHM
	ciQrPHpDBwQ8ce/JUK+lpjjbKPu2grKPqqcUo0ccH7mvtq1alROLjH60wXASsjVL0//KGAR6gjs
	SPVqspfy1PPt1NO1TPSSXr6QA2MXWhz190PsOiGuMqPLMNsTsZnFtEM7eXao7VLD1/PeS5DEKY6
	/Uxztl3Q5GNBiZ8mPOeeN7cj/bQ23WPelnz9t4ClFGc3z2n7EoZ9eKkA8xwMSUflEfcQKQ0vBgN
	dLcJZyuqbQu8xbVXhFeGx9xdlSPhxRb96/RFRBnUS7xuK3sIQeh0/8j+q34B9FB6pBLnwuq0/h8
	tDaGjz9aIf3ViArpKbZN2z3PfxkHhFrqBrycY=
X-Received: by 2002:a05:620a:25ca:b0:8c6:b315:1452 with SMTP id af79cd13be357-8cb8c9d042emr264772485a.7.1771663645462;
        Sat, 21 Feb 2026 00:47:25 -0800 (PST)
X-Received: by 2002:a05:620a:25ca:b0:8c6:b315:1452 with SMTP id af79cd13be357-8cb8c9d042emr264770785a.7.1771663644978;
        Sat, 21 Feb 2026 00:47:24 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389a78cd8d1sm3096311fa.14.2026.02.21.00.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 00:47:23 -0800 (PST)
Date: Sat, 21 Feb 2026 10:47:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: bryan.odonoghue@linaro.org, rfoss@kernel.org, todor.too@gmail.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, vladimir.zapolskiy@linaro.org,
        johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH 3/3] media: qcom: camss: vfe-340: Support for PIX client
Message-ID: <s4xcnk6zef7nzmozptjj24ngvpa5ntllykvt6ypn6sv4xem6bm@dpbhlqdgnkqx>
References: <20260219152737.728106-1-loic.poulain@oss.qualcomm.com>
 <20260219152737.728106-4-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260219152737.728106-4-loic.poulain@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=YL6SCBGx c=1 sm=1 tr=0 ts=6999711e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=8cErUUNgtVhzW7ovVb4A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: rudIfkKmJEKzyJxbZ82LoMj8R-LJ0KiT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIxMDA4NCBTYWx0ZWRfX8QJkH5pivIzz
 J+mo6ljOL1W7+zt7a76TKMQ1vd6STjctTCgITAo+RrvDRQ9otD34JXvCC6OOFkWMrVHVa3V62Lt
 EzpIpL34KpyWyXAfhtDNJciqVOX9w5vH/w9Xsr7Xk19ngpMEFUwtAUI7QOqTCWqHmK12pQf4fEQ
 a22O1jKGrWn89icQtKVQ2rpmtiQCqStqc8RN5kx/pG7zl9ldGFRQXJmRbQUBPBocgOz9P52Y2D8
 6mqyVZwHxotB+fJnxxy0itucZNrz2N4kC7kYIhz02VZOE3HKqC9JTnk2ZDQCMgepAH2nzwxJHjA
 +TylmYSRg2GbhooM7wURjjtWT4jumGNVBZxyk5VUgShLDCvu7ERXVJnYl42PjQ77xxs+5BbKCEh
 gRYEpzn9iv6R50oPhbUA128WNzyAYH/uUiZglFD8p3KP95ofb9b6Ess7vFyb9+nLRD8mRr3fyAE
 5Eah7LbUy4RErXoFGkg==
X-Proofpoint-GUID: rudIfkKmJEKzyJxbZ82LoMj8R-LJ0KiT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-21_02,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602210084
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,gmail.com,vger.kernel.org,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-53138-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D427616C6D4
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 04:27:37PM +0100, Loic Poulain wrote:
> Add support for VFE PIX write engine, allowing to capture frames
> via the PIX video device (e.g. msm_vfe0_pix).

And nothing specifies, what is PIX.

> 
> Tested on Agatti/Arduino-Uno-Q with:
> media-ctl -d /dev/media0 -l '"msm_csiphy0":1->"msm_csid0":0[1],"msm_csid0":4->"msm_vfe0_pix":0[1]'
> media-ctl -d /dev/media0 -V '"imx219 2-0010":0[fmt:SRGGB10_1X10/640x480 field:none]'
> media-ctl -d /dev/media0 -V '"msm_csiphy0":0[fmt:SRGGB10_1X10/640x480 field:none]'
> media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10_1X10/640x480 field:none]'
> media-ctl -d /dev/media0 -V '"msm_csid0":4[fmt:SRGGB10_1X10/640x480 field:none]'
> media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10_1X10/640x480 field:none]'

If we are using PIX, why do we need to setup RDI0 too? I thought that
they are two alternatives.

> media-ctl -d /dev/media0 -V '"msm_vfe0_pix":0[fmt:SRGGB10_1X10/640x480 field:none]'
> yavta -B capture-mplane --capture=30 -n 3 -f SRGGB10P -s 640x480 /dev/video3
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  .../media/platform/qcom/camss/camss-vfe-340.c | 64 +++++++++++++++----
>  1 file changed, 53 insertions(+), 11 deletions(-)
> 

-- 
With best wishes
Dmitry

