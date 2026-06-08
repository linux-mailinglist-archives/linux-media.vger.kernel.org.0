Return-Path: <linux-media+bounces-64157-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3BY7HtmAJmp6XgIAu9opvQ
	(envelope-from <linux-media+bounces-64157-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 10:44:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E9C6542B9
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 10:44:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="jkl0d/FL";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HkAuP1lK;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64157-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-64157-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3E6FC300B9DC
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 08:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5C3F3B71C3;
	Mon,  8 Jun 2026 08:38:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D213B6377
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 08:38:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780907917; cv=none; b=D9tNx1K6YdqFPXngZ0ZjxUlgvyFgqPs+I40ubg5dj1BpDkuqJ+HC1btt1+d1rI18M9xkbOCtFemmC9kHcqpx50boca5NnAF/en9NLxssQK0DkstB/Ljgw2Q+P6FqWlvJvWefYnvzw5hMzURXKL2+Ctov+gC1MrIWlEgmxijN3hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780907917; c=relaxed/simple;
	bh=p3WyaW/McooesC8HpQvG3yzAwgUk99nHm0k9Y0inxG8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G3ObyFHk7BJ7mn1tagw6AUweUOd6K/stfb7bby5rOY97xQ+yoZXisM/qqqoRYhM5GL4sEAEfmEMtpFTPI41L2gxwOI6sF0uV3lgmlqcgLjUNnZNOEzBtLYucAlrf++fxMKaK2NPvTueKNj+oLn5PM3aa/3IKd76oSkena68gUVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jkl0d/FL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HkAuP1lK; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586P21W2802607
	for <linux-media@vger.kernel.org>; Mon, 8 Jun 2026 08:38:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gqI3+snHdQMiEGmkjgaNFJ1BkilYs+V0SMwydlenRvo=; b=jkl0d/FLD7wrA6jN
	G4uDNBfwcxdLFvYXr/MwUk3QlErHRo8TtK8LtT3Y6FB0bJANRBlY7+PnKlBP2wzc
	lQUv5tkf+ISsbcF7f1AANDNEAp7s7ORz/3yvIKmQBiLYvyA4SbHkp/XPxLOTEX34
	qNFWhHhETOviR94y9kERig8e8bgWJDajpCSLgxuie7ucY72bV2EaUsPO6Tltlb3h
	QvhKbfv1DI3OvRO5wiQ1DItuDK7ebhIwGeTBSOaFoebZGoO1yVSuOe02hNhL7hkS
	a8wJ1rh9ivthOOEMEAVvG9j2T+CXnySlu3rXOnVHNqiO+51Fq1uxUrZBfye/2V2y
	BtRCrQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em9k3q84u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 08 Jun 2026 08:38:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5177f07eb05so76360891cf.3
        for <linux-media@vger.kernel.org>; Mon, 08 Jun 2026 01:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780907912; x=1781512712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gqI3+snHdQMiEGmkjgaNFJ1BkilYs+V0SMwydlenRvo=;
        b=HkAuP1lKosMVoECm3J3r3bt+gT29HVLSnSnpzE2iFywyVSGu3ikpk4fWm2ESOZz0h1
         ThS+X9HP2HU745bpB4fH5fXiathLCRDfnlhW5JEvl90AlLlAn5wafhfBo+I2Qta6h7kq
         fCPSA8cJHFzbi8aSXpyombtli01PfN/uQu4NX11CTesg5sjxmGQ+TQyWvtxTY4wRfYdU
         4g42hPNOLzbpsU6D9DQ6jNXkX57NKbTQtzB1TefsDAuo92j9/etpaQg2cT2F6rRKVv8Z
         IrbGebXXKUZILtd2o/u3qHocVtU0t4X+XnN2/y5HBGZt+Bms5i3hAgWoyrmtyemu6hM1
         3WGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780907912; x=1781512712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gqI3+snHdQMiEGmkjgaNFJ1BkilYs+V0SMwydlenRvo=;
        b=jglHVTKKiiMQQgW1qNUI0y5nrHUN2nqZZc+9Xge8nVs99yXjhPUvIcxkHi8qf2vgjQ
         dWQspdrwrLuy+COXMmOLDfx20uHk05Db0fzObocohMDRYlyS110rWFVwBh/xT7KER+Ne
         BLCC58DBFzkQr2ESLiErRhVXsdWZ3iflkmOZAJwWaD0AnCe9YbkFxL8Vir3/cuz/p7I7
         msJfFqH39/7zfMAiSEMUv5BcSfsZdx98h748/k7aydGvBZfhW5hs3vCaMpSFrL+f9DyH
         1m2KC2iL8NehpGcpNNlXU7oxJnvVYSTobrVjz1PdvXD/MT4hKOsOcVzD2ybMiWx+0+fv
         rZpA==
X-Forwarded-Encrypted: i=1; AFNElJ9Fz9qJ2IcOl2bAiFRa3EOTefct64SmRdTfti+BrRY+s8VJy093MdgMz2N+OAuBsm7DnyvloKdmKRc5LQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtCZnNmnby2PnDBPcO2r/Razjon8OdWxnK/WBPAgGD6z0Jryvo
	0f7I7aK7r9rLMkEd3yJO1UYQbGAR/yaDhCODb8J10hYqslRi0N50YC/hTcp57/sDZ+NJst/zvw4
	sTK3mJmkoGGPQkNn/IjxigRhuZjGnkfb8dCLmePHbo1uHb+3NHxWoWjHfMS7AaX026g==
X-Gm-Gg: Acq92OGAOBzJ3S09aYtt0316BNWpnJ0sjHYK8A6ylEk3v1N7AHWddwPj2lKR3SRFXaU
	mxWmH//xSndJHuZlm0tyPKGvz65pHjZyosYQqG5JK+g0xDdBYdzOogOZRLXPcmJBqENgD9agqMp
	zWmc+vt5x4ir6FOwYTaB6xu2uYiYmpVvQ2cy60lA4OhWW1BMq+6Is0wMWNjD9Z6X3KxgCKq+YjN
	qMpxul9ojjq/Owq0PEW0din7/pWXggJzoi56hrPAW/xA06rYF5SbejoMRuBaX3psmUY2Q8mEu1z
	481wHXZcXPVrIR3mdnAHhppOTU83FJNkN91gJ1Xaw4wS6BSB8N47dM/7CpYQwx9Cyrrsvf7w5ZE
	5OgX4PdrFm2FhSWxqYKRRy7NryrfSPae7VSolr4Lsga8rgIx/xoxoo2oe9e0=
X-Received: by 2002:ac8:7f01:0:b0:517:82a1:351f with SMTP id d75a77b69052e-51795ad2ae6mr205703461cf.16.1780907912200;
        Mon, 08 Jun 2026 01:38:32 -0700 (PDT)
X-Received: by 2002:ac8:7f01:0:b0:517:82a1:351f with SMTP id d75a77b69052e-51795ad2ae6mr205703321cf.16.1780907911807;
        Mon, 08 Jun 2026 01:38:31 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:4904:8660:26f:8b6a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3cbfe4sm383420465e9.7.2026.06.08.01.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 01:38:31 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: brgl@kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: media: max96712: drop unneeded dependency on OF_GPIO
Date: Mon,  8 Jun 2026 10:38:24 +0200
Message-ID: <178090789590.45152.18367074599789636516.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260506082211.5624-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20260506082211.5624-1-bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA4MCBTYWx0ZWRfX2Ydfwl1O3H8q
 W7+37WZPQFJuvGiDePaasVORlAtyqLJxkkpFYfGMHSw1oXnxzrX2FGz1//8bPr0h4Rd8bDeAF13
 XITpbTWEKGt8HqVNwlc5N8B7XL8Hz47+g62rTFT4kUO4OjMTEL+PzxqISgqX3Nh9DV4jmGeX1wn
 C/fqVJjSCbr3ICp9IHhmEmn6u7qCeAKSCdzNd7MYMSoGzYCmZySLb5ROmNGUkF0bKrAJIgedUYw
 LtiJ6g2FJyAGWRcnSXH0SVJc2yY+T2OsksvmCi0BQ5C9V6o8P6hFxLTawZZsRDByroC0Smv4rmA
 IvW5VhI7ik5/YkIwWePHmCMkJpC1tC6yEWxS8+35IJuX/qyLIE/a9tQE0lhmzSzh6B949vraRRl
 rXsr42G+AkMemUEbJM/g3yjqqDfoMUw54AXz2IJbi3DJE6Y3Kx4rq+dS1289aXAYVbyLEmeIyYH
 F2sVhGtWlTNOQ9ww2eg==
X-Proofpoint-ORIG-GUID: mXNLJDVz-6zhvZo3Nw2yXtc7LwAptdG8
X-Proofpoint-GUID: mXNLJDVz-6zhvZo3Nw2yXtc7LwAptdG8
X-Authority-Analysis: v=2.4 cv=TIB1jVla c=1 sm=1 tr=0 ts=6a267f88 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ktJ3iEGJLOSoepKj1K4A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1011 adultscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080080
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-64157-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:bartosz.golaszewski@oss.qualcomm.com,m:brgl@kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 16E9C6542B9


On Wed, 06 May 2026 10:22:11 +0200, Bartosz Golaszewski wrote:
> OF_GPIO is selected automatically on all OF systems. Any symbols it
> controls also provide stubs and are private to GPIOLIB anyway so there's
> really no reason to select it explicitly.
> 
> 

Applied, thanks!

[1/1] staging: media: max96712: drop unneeded dependency on OF_GPIO
      https://git.kernel.org/brgl/c/b8840c4f640e07562f15e5fc477ddaf1b2efb241

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

