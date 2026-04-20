Return-Path: <linux-media+bounces-59131-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIx9KmUd5mlurwEAu9opvQ
	(envelope-from <linux-media+bounces-59131-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 14:34:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C9842ACBC
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 14:34:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6DD3D3029B35
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 12:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8825B39F19E;
	Mon, 20 Apr 2026 12:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lhVwzEAz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jEyA5Pay"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861ED30C343
	for <linux-media@vger.kernel.org>; Mon, 20 Apr 2026 12:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776688299; cv=none; b=qs1iEk6BD7x1/q+t0s0lMjvtDHV6Ua0+BTAvD3P9/fSFW7sY4GlxS/xJTh8JP9r8+j0pvoo0zXeyQkhZiL4loXxhaOIdpM40Sr7TF+Ag22AMv3WiAOnzgkvNJd6jxYteETiMv/3i+q1mx1Z71TR0LV/Xb0W9lq4izx1AIYzUIck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776688299; c=relaxed/simple;
	bh=QyGU+JtrD+xfoAqSO/a6JhIRG4Nj15cSg+hd4z8eLWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JNfT+ZykoWPObBtLv4pru0hSa+4skCf5cbKWP3TM/l8+xM3cd51o2eqUDooiDyZeXc5C5iHzK2JcnQoFGNJhXW6RATc0qY9d3iIVW43Lb3kFTfLkwDRmtJgmO9Cpx0yPys+CikmjwK9bLcvxHxuaigqomhYvgR1owlVoyQ7CVQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lhVwzEAz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jEyA5Pay; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KBnv8v3212117
	for <linux-media@vger.kernel.org>; Mon, 20 Apr 2026 12:31:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M1mHBiu2kyCdwn8vgppYE+gc92gcm7L8eP2WtHeZFDk=; b=lhVwzEAzfHqo9aGe
	atEILuZcF3EqA7ImomSmqrJJaLnmSwnHX2ol2nDReWzhCnvB/ZnUBsaczHV7Sqqn
	UCXC2W12Y95QD2fFm4W4FTJ9tSjcUwmP+xH+bcDBBhirltmDd7Pc21luCz+xb5M5
	jdEWtEcIVJOdyjeeaGWkpASC84ZCeh+IkVNX4dBSzymTPbHjji5HWWLsC6W9hFBR
	CZ9UVCfZPRaqqFvgrEcOGjWcU3hBDzXcH8NsCYYkA7UdOroYYwkR2TEKQV2JwA1I
	rtWJnuSCwaKQBmPfJYbZkej1GF4/bqYtJ+WyLAyY2iOpWxf23B7se3NFnUmY5Udq
	zBsaMA==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfcfhd7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 20 Apr 2026 12:31:37 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-479d605705cso169464b6e.1
        for <linux-media@vger.kernel.org>; Mon, 20 Apr 2026 05:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776688297; x=1777293097; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M1mHBiu2kyCdwn8vgppYE+gc92gcm7L8eP2WtHeZFDk=;
        b=jEyA5Paylk5AkOJM9yndesbST3nP5/ec9pVa0v2KuGTlRKrQinBkjYNOR7nE5dBSSD
         ICQciD7QnStJQ92E5G+doyThsv6xZPO2db7dfhX5h7A2Ss9PE0VqRReG9q25ayUx+0ul
         4OR8YX8X/s9ttJIAGqX4MHXaTWBXK6o3SCMSF5HTfcCyh723NBRf2ZM/Rc5DciyswRct
         chvqVrwyDSFDG947nfJs3Mp1ebkxWBAniCkPF6l7qjw3moYtyR6N0c5s/pCd+q02tJTS
         /5YQymnJDZTRn1j3u7cbqkfmSbULFXpm+AuvlelWjtUUIJkCNN10uF1fFbmZejnHQF4X
         aDig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776688297; x=1777293097;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M1mHBiu2kyCdwn8vgppYE+gc92gcm7L8eP2WtHeZFDk=;
        b=Be3/Ekmg0SOsM4zYS80+VhJorYHVlOkJ6hSYfs3pj/XyhFLlSFj9ULbQ1QrJG8i2rY
         dBBWGIqGgpJLj2kUyX5EkmbfdqGmolcf2w1lBMR7H2bYJJkcY7oANaTFRBMlfyXO6YkM
         Byy6j79ChriymotZ2ji1BjBGppautRtg3cvWIaIbt5WSl4Yhstf+H9oqIyeMXatuPees
         gV7/4vaaCoKvpLIgj8Rm+otS7qFPgYFRV8Vu+I/YqKzE9kL18hXMzFUJPIMp0EY3KqbM
         PDMXoDJ9pyDQ8IrHFwAeX5jfC99oeMsGGRkZ8suZOnuBtjNCUMzlXGgjkVU5GMeXr9fX
         jQgQ==
X-Forwarded-Encrypted: i=1; AFNElJ+d6zOIjOddDgWGzeebOLDFHqd5SNhqtD9Il7U8SCH6DR1N5+K9MZD/BATvQjxy9ezu3mq7TeC/tQ4dfA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOhuckPRQA3gXpXD8hUoAjC32QdrJX9Ke9ZySZ11pKFQQvrh9q
	0x4d1LjcN5SsyGr8jxSdWiGcBbNBjfyE3D5c56rmRqWasgvhHhnH2UQVGGOmKN6hPCNMEy+GqyJ
	Olqy04aep1cvJkzAfvt74aRyr8HcnRmJWnvZW6UlcvvGgcSz8w/fRHPndi4DLR+F4ug==
X-Gm-Gg: AeBDievfGkMqbtfElT+kaWXAvUhLPFF51wEe6YC8LlU8qKYM0DOeQyupihP8pw7QBwr
	KutH25mwzj14yoAVHWlTL5m+Z0XhWDyJeh+xuacP9UmI+qgnL7yPC+Se/xgpXvv781f1KpDwREl
	s3+zmMMC4p5K+yYHmmjO0ieAiYlq7dLPDcCzpvR7+A8ZK1RXAVLYfaz/il6hW04SXk8AV6RbVCm
	VTnx4tfOKXI+n8bnDQJ8OeLVnvmdfURiTMnJNZLu6aCv6nRMLStJhe8Ed8I8OEM1o98eWPmiSzV
	LPnyWLaXbYEkPKbri0BqJ5EFVt+dgWmGsJCpt9eN2M7aioxHUQUWGQ+b6221X13L2Is1rQSPaSP
	ck4kxPl5oEj0CR+lUntBLh6rZdnmURap1jAH+CNj21XA0EdmiNyJtMv3kBglyK8rWZnR4UWTrZG
	jL0rW6KOMC6lvkEFfFPPBVfabjfwCX/Q2/9DaD3vuKhjC/xQ==
X-Received: by 2002:a05:6808:4fec:b0:467:2509:c20a with SMTP id 5614622812f47-4799cb50f32mr6675089b6e.47.1776688296799;
        Mon, 20 Apr 2026 05:31:36 -0700 (PDT)
X-Received: by 2002:a05:6808:4fec:b0:467:2509:c20a with SMTP id 5614622812f47-4799cb50f32mr6675055b6e.47.1776688296347;
        Mon, 20 Apr 2026 05:31:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187ec0c2sm2925137e87.82.2026.04.20.05.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 05:31:35 -0700 (PDT)
Date: Mon, 20 Apr 2026 15:31:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>
Cc: Erikas Bitovtas <xerikasxx@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH RFC 06/10] arm64: dts: qcom: msm8939-asus-z00t: add Venus
Message-ID: <aktvbu6ckco2zfmt5pxyij52q2w6olwwlg4ziuqbdya7vrtxmg@w2rizg5zymhq>
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
 <20260416-msm8939-venus-rfc-v1-6-a09fcf2c23df@gmail.com>
 <0a5f9bd6-d3ea-4819-8be3-cc5a06ec0339@oss.qualcomm.com>
 <ad482bdd-2fb5-432f-be1d-dec25d9cbf5b@gmail.com>
 <37poakqgqhsuavvrm2dyzwk36syyq44o4cfdsylkzwsupbh2yt@ycdvyrxgnrcs>
 <a09485c54946b754741259540257393734b518c3.camel@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a09485c54946b754741259540257393734b518c3.camel@apitzsch.eu>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDEyMyBTYWx0ZWRfX3inYVN3mRSkw
 F5+lylp2hYHnyEorj0gz07Ij8Exd4f82EH1e7Eyz5NeE+HPKABd+IMJkle7sxlkPO9uigw5+pb0
 vlUOJImxxccC5xOM50TLgyeplXqpTBE4DM478BI2w43202srCjEvbNIc5IMMnWyxR5VJ2+nvzZD
 +xzdfRPPSGvSL/jrxqIds0UI2czk2xCJ0mZMEh7HsSx2+Gp5SKsGWCwIZzeeZnq7MLcuxckHncQ
 FVRSQKWP12X4H5xzjRMaBuInq37NAukDhbSlbG5xCGhgRUIfgiW77cs2sYvgWWs63YFKl4jCUPm
 qsOj8Teg/ZH3Wx4yMntplo5hFBzX6bsYYdHwwisaqbFE59Zy/GMYma32y0GOZ6BS5D+/KpRF5JM
 s3iROxf973r8FT2T0F+BA4PZp2O0Jk6gBYACUmnhcQ/kzcjO3uolvFYSguB7mW2tSistbGG0up6
 CzoiG9OZtjyUfeg9cVw==
X-Proofpoint-ORIG-GUID: spINQ8c5AMjGDHO3BXEsf-YMMqj-MiR8
X-Proofpoint-GUID: spINQ8c5AMjGDHO3BXEsf-YMMqj-MiR8
X-Authority-Analysis: v=2.4 cv=L+ItheT8 c=1 sm=1 tr=0 ts=69e61ca9 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=Jn2JxawGAmoOaafwVl4A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200123
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59131-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,oss.qualcomm.com,kernel.org,baylibre.com,vger.kernel.org,lists.sr.ht];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F1C9842ACBC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Apr 19, 2026 at 10:26:56PM +0200, André Apitzsch wrote:
> Hi Dmitry,
> 
> Am Samstag, dem 18.04.2026 um 02:40 +0300 schrieb Dmitry Baryshkov:
> > On Thu, Apr 16, 2026 at 07:57:30PM +0300, Erikas Bitovtas wrote:
> > > 
> > > 
> > > On 4/16/26 6:17 PM, Konrad Dybcio wrote:
> > > > On 4/16/26 3:43 PM, Erikas Bitovtas wrote:
> > > > > Enable Venus video encoder/decoder for Asus ZenFone 2
> > > > > Laser/Selfie.
> > > > > 
> > > > > Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> > > > > ---
> > > > >  arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 8 ++++++++
> > > > >  1 file changed, 8 insertions(+)
> > > > > 
> > > > > diff --git a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> > > > > b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> > > > > index 90e966242720..231a3e9c1929 100644
> > > > > --- a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> > > > > +++ b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> > > > > @@ -267,6 +267,14 @@ &usb_hs_phy {
> > > > >  	extcon = <&usb_id>;
> > > > >  };
> > > > >  
> > > > > +&venus {
> > > > > +	status = "okay";
> > > > 
> > > > You need a firmware path here
> > > 
> > > When I tested Venus on my device, it loaded without one specified -
> > > msm-firmware-loader creates a symbolic link from modem partition
> > > for firmware. Additionally, none of the MSM8916 devices seem to
> > > include a firmware name. Has something changed since then?
> > 
> > Us becoming more strict? Or more caring? The default file paths are
> > supposed to be used for unfused devices. So if they don't work with
> > yours (most likely they don't), please add firmware-name:
> > 
> > firmware-name = "qcom/msm8916/Asus/z00t/venus.mbn";
> 
> For BQ M5 (msm8939-longcheer-l9100), venus works with the firmware
> provided by linux-firmware [1] and the default path (here "qcom/venus-
> 1.8/venus.mbn").
> 
> Just to be clear, should the firmware-name still be added in this case,
> even if it is the default one?

No need to, but it would be nice to mention in the commit message.

> 
> Best regards,
> André
> 
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/qcom/venus-1.8

-- 
With best wishes
Dmitry

