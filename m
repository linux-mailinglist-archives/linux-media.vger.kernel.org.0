Return-Path: <linux-media+bounces-53472-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GhrJFwdoGmzfgQAu9opvQ
	(envelope-from <linux-media+bounces-53472-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 11:15:56 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E84711A41C2
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 11:15:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 134343014C23
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 10:15:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64F6431AA80;
	Thu, 26 Feb 2026 10:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xg7Kv22q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cXFQSIcK"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A1439B48D
	for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 10:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772100930; cv=pass; b=u3XQ8XnHyD5jU3UD24wj+J7/S8ruPXrHl571PpKdt97snnrKgETAY3upwG/CULeRk6X2gEZF9C0bI6DGbiydfEYVpYw2DXRrOoBSaxF4RXUp3QkeV5HaXr4pjrg7uLVXo6Sgkhlx/nPgHNNqEBLzOftlV0TJSBrnPnsuHnWWbe8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772100930; c=relaxed/simple;
	bh=vuzVksNtpyEzrrJAYrDWC5LrnpvjHYNfDeodFaiQLh0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZrDfNOlnejeIsHVm/iQRpJkP4ga/NQdPqy4nivF95U7xtoI4CvPq7zFpkzGHtYbPfZ0L+AvXUPzNLDgvBZz4BX/7G6zhRHs7ut7uMUb0P5QZGb2sYzwwxVep56DDhaPy/6qKgSdH1MFRDHElcuMgj9ZCoktkCEXuJHs7Oue2CBc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xg7Kv22q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cXFQSIcK; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61Q4VAQo350356
	for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 10:15:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vuzVksNtpyEzrrJAYrDWC5LrnpvjHYNfDeodFaiQLh0=; b=Xg7Kv22q4DYcJW8l
	x+rSoTCSnEuMvFBYPM+i7DikLv21RqNMMt4eafwJlOuEgAQAFjUNu/vTs+ZKVQsv
	dQQAX6ucODJqiGWWIHKZYtncnCnGx7y1hEu6GrQOq+MOjtrxClLAfR3EyF6UI3u3
	Cr2fH9VSJ5gkoFmyPZsUmTlUGmkk2lAeXEC7uZH1Du1QTllXNNgMNobH3wYN3+a7
	n6WEN/VvlB0wKZXqs2S8xPP0hGooW0qa3K/wOK/cgLiv+MlvfYXo4jOVxwVfehel
	9wcZPS0EVwHpgZJhjlTdgZi0Sh269bSf9nj0T4wHmGw0V2cToCoYQIb4F3WwuLnA
	ssJjoA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj54patyh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 10:15:28 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89546cbb998so64073746d6.0
        for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 02:15:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772100928; cv=none;
        d=google.com; s=arc-20240605;
        b=FLSfIfPDc0slUH93D4MRoHPq2kZxMnY+qzb3Fn7sa/6/AYpY41dJWydEt23NdSEWnJ
         fgAPOc7qbtvKUhwxBF2oUNW36eJlFLLOCZDmAC/BpGwbmIh5dO9HVm/tbiVuyzi7anPg
         GXv5FCG3E67Zlh2+IZnBY/L9NZUXdDO1ba52EQbsaRzuO9ZzdWhZNjU3Zh+/4Uwmz/nx
         /2W7U7IDy7WdZ+DIGjGgo0VU+gJONz61d3opcBSfUumk/amNiF95RAaIzfodqzaaGoE+
         Mw574dAvSaJiOcEDfwRMlrhs5W+FMYc8C9YKsdmqdEQPVcK2VuNg+Wefk9XW+dTozSPz
         es+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vuzVksNtpyEzrrJAYrDWC5LrnpvjHYNfDeodFaiQLh0=;
        fh=5bPz43jXKjpuiOugTl6pu7ueabbSvEsOZoa1hmGJklk=;
        b=Xq+NyTeCkM5BRX0c+sMYixpTSBH0CJG/M5H8ihyfcOzXf/CssltcVt3/VcFyXX7OzQ
         basEEfTWwjbgBOMHMoJOe2mbvkX0PVFpPLn0v5eOJXXT9BSXX6kaKkvljrZfK0xLVNPl
         HYuv5mm8BtJ9p70T6voNs4QyLoS5d7VICxE07IEdMoUuyh0jFZxG17sw2ioj4Bk/E4Uc
         uuYX7kQbEykqD/Qy5FfKYjCtI0Bd18A+Jnew+izWlgqt+cVyf47GDirYRYsoVEDrLKzV
         saUT3TwraMjkxKH3wG02bsNihasWFfeGkP5El3kfG/5/reQUc/jq1WKQ0BwYBo/FIcV0
         ZLGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772100928; x=1772705728; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vuzVksNtpyEzrrJAYrDWC5LrnpvjHYNfDeodFaiQLh0=;
        b=cXFQSIcKeeVISdyg4LEDoOufWUPME+1yfY8PdILeC6hBqajQzf5vw0nt2vFJFxjKmU
         C3F74pcZwAOES1MIoNr9NBscGjvMY3swzGLyLaQ8XZ7t3ZZZNXh5VK1pdoV3QPOeqguT
         ew3Uj8/0f9s6Einz5zVk0RE4fbNJhzkbsj1adofswsnTEFDRtjXWDgREA0bY/nik5glt
         itSo7FUxeg54ll28RwW8970nMD/8pGFMWbC3xkeiLWKVtCmtayRAjErm2ARgZvxlzjAY
         b/JSHX7Tq9MienelpwMjvEqYemPM4phmS2esAIVweQQzlIAL9S2tn4s3wsrk+19cJUp+
         68uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772100928; x=1772705728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vuzVksNtpyEzrrJAYrDWC5LrnpvjHYNfDeodFaiQLh0=;
        b=acE4JyVzaUi+FarMUstyDlAuxL13IJaXU+IWkI9RleGsn/dvPD5zM+Q7Q3xUPMTm+U
         iUXUdOisAa8cPGB9NbooMoGGo4kr8WdTFyPM9nGgAp3m85c+VFRzzzwZCk7Q/1BNIWoL
         D3KJBgSd7JrmfZkYeJGLlKO53DDOrj791+pPnwAlO3csRe2l/VIhdEL7jxH5vtW/0JSE
         8rIwfXijLjr3DIclD3Xg9ZSSrDpu49QdqVG7h7Dz9sDFKl71QzWGLc/jK+SQ05RlvJK3
         UErkE5XyuttS0JdkIC4WlW8B/YXDC5opE0+ewsdge13cB3NeNZg3cTPTwKBsQFsV4uQv
         jCLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUb5XqnhPyZwqE+Ap5k7goO7/kB75l4Yl39ntBxYymZUHuOe+CU9LKAepSEbZ9UXBRgeZnXAzubyxaaBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNqLUEJ55WDqxN2DU62bp9LhWfE2GgZ6+gRC7YsUPuauTGgURA
	KacsmlB6CAsCPIZqp/l/KWAhV2XObbYY+OTzHFXrWug7dkVUXcE6SsJD/oUkCJMgB+Nl7GPJpZq
	DAAYkPvB5dRaR0tVkd8qE7LToo5ag3Tb7zVdy31wHz7NivzVIec3zrcBxwb2kYu4h/VGTG02ZME
	DEPp4x/+qwn1gtpgKSYxDYReKYKXxzPZW8m930Yqxx
X-Gm-Gg: ATEYQzz+mi6jgGf97BTQR5HRIiv5MdLULvYGLr7l0W3u1bY8DYmsS7BYlbxivm+sVVG
	D61tk4FSnSYmbrJqVZJi3aNFYjbVGZAzDqeIevBQeYyUUonzeRSMF9IuURx9WPdZEi6udhYQ9SS
	O1djyJ71kjslhQoMylD/l0pxMSMyEs63tcw7Ovze03CqXiLLlzUR6Vz+flP6Bu5JPS2H2Ineug4
	4r1khpXA+MYEYwur+X+ow/a3Y6G+8COPf35K+tw
X-Received: by 2002:a05:6214:19cb:b0:899:cb60:d9d4 with SMTP id 6a1803df08f44-899cb60df02mr7392706d6.57.1772100927969;
        Thu, 26 Feb 2026 02:15:27 -0800 (PST)
X-Received: by 2002:a05:6214:19cb:b0:899:cb60:d9d4 with SMTP id
 6a1803df08f44-899cb60df02mr7392476d6.57.1772100927613; Thu, 26 Feb 2026
 02:15:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225150122.766220-1-loic.poulain@oss.qualcomm.com>
 <20260225150122.766220-3-loic.poulain@oss.qualcomm.com> <6js2jmzcbo2dmt3g2griookjt7kkrbukukzkv6ft6i6357g2x4@trpobakpysw5>
In-Reply-To: <6js2jmzcbo2dmt3g2griookjt7kkrbukukzkv6ft6i6357g2x4@trpobakpysw5>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 26 Feb 2026 11:15:16 +0100
X-Gm-Features: AaiRm53jdS8mwT4tqzlvDCVXXffYDOk2bj3rtFS-iR1LGt5EWqxNq2h_Al5-Tns
Message-ID: <CAFEp6-3KA5tztKscsaHn3=MVKfwC=gbCMNgZhi7SasxHXxttYg@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] media: camss: csid-340: Add VC-to-interface mapping
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: bryan.odonoghue@linaro.org, rfoss@kernel.org, todor.too@gmail.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, vladimir.zapolskiy@linaro.org,
        johannes.goede@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDA5MiBTYWx0ZWRfXz6Nh7BWq+iDL
 CoE+TxvuA11dn6rYUMCtXZIc7fKxsKMnGPoo2qUMnh+SmyFXzP/aqlKy80KJ8UtDKf5IRYX6UTz
 S57YhdXo9om0cRRUnPpkAZUzUFZ+iDPOwu++V5l+NKqdOuVJ850/0oZm4lp8AZkGw7rLUnF2F8b
 ZJjb8R6GoGYbfVoZLxiYchaMNhiDDl/dhxnrheGR33aVUnTNyHn8qpBTHCobvt1/3BbBcjJysRx
 TfEghPsmgWaFVggtLrdieTJ1qr9FwQN2Ei2lsFUBKmpulY6xZkyRFAMFx/XiYhgYa/nLT18Vrqc
 8FhhZLtQAGISpJarM+trlDEqD6IIIQVczHz6jNwIIB8a1KyXifyxDTt6EYK1nPZvEfq2rHmIV/r
 BEnSehiWmeXohxpxdNbLElSvXkg59H40pV6pqzeCU5u+/E6w6BNNAQ4NoKfY7z61gTZWK5mjvsg
 TMyG0ILOvvCr5HtWDpw==
X-Proofpoint-GUID: 8nY9mGkLIjau91l0F7TODcmSr9yqNUw0
X-Authority-Analysis: v=2.4 cv=I5Bohdgg c=1 sm=1 tr=0 ts=69a01d40 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=_5tTEtisqCDahmSd9ckA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: 8nY9mGkLIjau91l0F7TODcmSr9yqNUw0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260092
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,gmail.com,vger.kernel.org,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-53472-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: E84711A41C2
X-Rspamd-Action: no action

Hi Dmitry,

On Thu, Feb 26, 2026 at 1:16=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Wed, Feb 25, 2026 at 04:01:19PM +0100, Loic Poulain wrote:
> > The CSID=E2=80=91340 block uses different register offsets for the PIX =
and RDI
>
> So, what is PIX? I asked that question at v1.

I might be misunderstanding your point here, but yes you did ask this
in the v1 review, and I updated both the cover letter and the
subsequent commit messages in the series (mainly in 5/5) to clarify
what the PIX interface is. If this is still unclear, I=E2=80=99m happy to
expand the explanation further or add more context in this specific
commit message.

Regards,
Loic

