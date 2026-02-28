Return-Path: <linux-media+bounces-53856-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIrpNuBto2kwDAUAu9opvQ
	(envelope-from <linux-media+bounces-53856-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 23:36:16 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BA01C9863
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 23:36:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 813423058097
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 22:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 569633D646E;
	Sat, 28 Feb 2026 22:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aE+KlMLG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MHYS95To"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0B43D3CFD
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 22:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772318165; cv=none; b=euTE7EeieD6KCSKCaEXL35d5R+uOO59NVb8V00Fk5VOy1ll6+mlfWNClqSdRSb3Q+etzEflIrmjnG385635hdPcrqVyzZVDUmYD4TJdlFL7GdPuvu2wXOBKs1x7bWk85/oNFbORcru8wv57OwGAgsPnfvS+qTgaehV6vKBe++Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772318165; c=relaxed/simple;
	bh=Qjx2enmiIeqVS7ZDCv7tX0sl3R0stZJQ8VCaO/XeN0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LfFae8Adede14qKZTraWZGNpLjv+O/DZz/jhdSxxhji33OKv75zuTX8TnMTR+LdbE8P3o/cXvBcoq6vO+2R0dH/UhcZjRfByxHw7z649umyflo/BM94Xckv5AUKH8mHcZYnFb841+oWP8dRcZW2zgFw2LQlDTTVuQ5Tl/j72Zdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aE+KlMLG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MHYS95To; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61SKsuEZ3561498
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 22:35:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JSVXXdhiklAbM2yFXSxjzuNnDZHhdYtA0NflTFJMpr0=; b=aE+KlMLGdWoxhdxp
	meFgURc80UHtoYAnDU9tXNg9dsZ+G2NF9AT84WiQcEvEOiTmK1iB6vjTf22ceM/t
	yzzdjlHs2MQeNurjtUdmqoNTXYWqCemhTKD9TOsbRb8AL6xzAFVq+fR6DMYoB24O
	ySygX81DqaegbPB4m9F+p9Em9MIo9J4Oc3w+D4fDAtboZ5Q+5T/ZXE4CuMPwll3v
	vIYmZbz/DMgszlLxBlvCg7wAq+0L/NoPn1lwIeUKI9gUnSMsBQZNFQpwOQoGz3Jr
	tgdOXT2GTIQ08h4kwSb4whRphvZYFFa214FQ8ZlwUu7leyT3xNldhiehKD4ssjOf
	xL4OHQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksgq1sm2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 22:35:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c71655aa11so4058139685a.3
        for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 14:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772318157; x=1772922957; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JSVXXdhiklAbM2yFXSxjzuNnDZHhdYtA0NflTFJMpr0=;
        b=MHYS95Toc9a2a2xuTW3Tz1zPTYgOwslvcfpEJpK52T+uBKbuzdGbSjy/jv6JmQoU4I
         YluZrcfmgJ8DGFgZaTVEwffqmW1cAOG/C4bG8OUwtJPpPzgzkWAFKM8cOTjG6/uFXpAv
         2QlNSOeq4kBQDy4cHPqlqq5lAX2x+jtvepDINDBhorYwv1/EpvA81TWC43x6xkv7kGJ9
         GA4cTYk9Q8CfQ72PuPX+G26nOCTQATbj3pwOYtRSPQAbwVOuZngJU2Xk2oRyFCWty2Fl
         HkyulZhmmopfyGt4WzIdj5ijodSHbJZPd703TMJQodOg2nk8lk96VipMuCwCOR7CnoK1
         /VjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772318157; x=1772922957;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JSVXXdhiklAbM2yFXSxjzuNnDZHhdYtA0NflTFJMpr0=;
        b=gE5fpTxUMSfGXncRFxRNx0CTYDPbDHLuICCX9NPuPdxDh3rtQ92Bvu6yzfwnlp5oxH
         7JA5kqvVlStDKjqv7raby1VF18+hXl/lOS0gvvA5monV1gOvzrIjFDSLFKt9aUpMMLzX
         RrwJHA+vMa6OZD1dpoNqrhK90TDrjAGR9u7NjIjX3NBJJRnf6QC2KtDgtowfywrky2ht
         C2Bad5EQrnlTbaX4pi2lv3WCjSJDoRTzkFnm+zWSGmthnH18jPmoT8voqNZoHl+MeHcy
         9xgZd0ZTlUdIyn6LAl9/lHNayF4+GLjgktQmeBW6NfYUuOgQSf0N5104AaCQZ6qChmpd
         HBAA==
X-Forwarded-Encrypted: i=1; AJvYcCX9lBIgC2mPsA52mQndpReBEYta7kgGtDuASmHNOauxItyFXxVoAeqUAfcuedU7p8TWuZ4riPbILE7mRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2cTWd9aexDG57CN4o0a4a2Mu0Wgpumihl1GWpyrXeP2Gefa2h
	K8QoQDpkYvVAdQ74mo7Q4OC3Xyu2X+opZrJSDldQHV1nepF1ecaEHLQTi9BugDNgRdHlRiJ8cQn
	gviwfcvVkVB64cfOAiz45nU1vrIvQnUTD3DJZdmsXZVzTlAZ00clzbkKNWRRLwxAfxg==
X-Gm-Gg: ATEYQzziHAWr8jnG8W5Vb4O4wiU3JJNTgUs6bK7AWX8xESXA1LevAT+24EM99Iaq/kl
	Y4pc5PNHMcNhGL9sq5zBGF/OuKtMhWn8uAGMXqx8QgwqH1LaBQ9bL94KwkhGIv05k5t2buanGk0
	zq7L1i+jfHRbLisUGlq/GUZw2X5sa7qBDR1+BHCeDt0kSum9RokTNuFjcFs3nflWTrpg4rEJThk
	b4xzRY0+k5SfvokSQpHSmdul4DLjAky1P9OGJhtpXf3ej7cp552hgAfmrvsuCohWwJLBzbPltiK
	5J1dWJW0KTx6WckIM024RIM0zZYxn34DeeZgIlW9R986cBdOaAHzyPt3pyuNAgw2bOTx9muxXgD
	CgFE76RxWlIeCiqAHkaAeptqE2Xl0QVhBLBg24CVO0wUvkjZo8A1rLRcbnKBYhCgofBr5vBt/jQ
	1WDVSpQ4JqGTxLqNp9TyefzW2gQvBE/EwI8sY=
X-Received: by 2002:a05:620a:c55:b0:8c7:1afd:a535 with SMTP id af79cd13be357-8cbc8deb5a6mr874742785a.25.1772318156889;
        Sat, 28 Feb 2026 14:35:56 -0800 (PST)
X-Received: by 2002:a05:620a:c55:b0:8c7:1afd:a535 with SMTP id af79cd13be357-8cbc8deb5a6mr874740285a.25.1772318156332;
        Sat, 28 Feb 2026 14:35:56 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f2ffe126sm20763411fa.23.2026.02.28.14.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 14:35:55 -0800 (PST)
Date: Sun, 1 Mar 2026 00:35:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: venus: allow interlaced video streams
Message-ID: <goqowrvdp4uwbakbp5cztujh5q5z3jroql7m7dumlp64lj4yph@4n3mjqsj5n7i>
References: <20260228-venus-mpeg2-v1-1-c13aa7cb6e93@oss.qualcomm.com>
 <4CA1838F-504D-4EEA-99F4-B3CC5EB10EDA@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4CA1838F-504D-4EEA-99F4-B3CC5EB10EDA@gmail.com>
X-Proofpoint-GUID: _dstxB3nIIDhkkNvYkEiqUG2J6VdAM2b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDIxMSBTYWx0ZWRfX4mszOaQ6Rdit
 cPZemu10JEA0nveq2xZ3boC338LuApglSjYldo7yoHF66/g7np/roIABnPwEAYHpxlkJgwCpS0V
 Ig7bJNc9y6Nm+UoECIZTRJhl/4U2kLlmDi9DwShObE32wx5Ppp010+PzLD4HOcyV057xm1UN04s
 tan/JJCDp59NKFcRDh8G6YN4o4ZxPpn9B6wu0OY2xb0p7TevKxYtn+8B3LD0fLXAVAIrSAN1QJc
 eoMWP4P1XjoTFbuWKsgaJpwrSTB8YO49chzGiFSErv/jSXYtJGTpVv4QeSGp8Tavyn3TkFjV7fQ
 dLN8Cmc1wxxu8fLpCGfHivRQNUGTrDwsKfKTanv/LaC9CbhLIrL2eHMccpw4qr1dPiobYmwbBlj
 wZ6o9mzd7tKjKQ+XduhHY1hcV5HEfVzJjmSzOoZCFB9GfxMCR4QrMC3LWAX/eox0vmFu/fs+w34
 rEQuMOIy2UUOSowZgXA==
X-Authority-Analysis: v=2.4 cv=bdRmkePB c=1 sm=1 tr=0 ts=69a36dce cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=bpn6vdTzkl7E8uVklXUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: _dstxB3nIIDhkkNvYkEiqUG2J6VdAM2b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_07,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602280211
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53856-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-media,samsung];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 32BA01C9863
X-Rspamd-Action: no action

On Sat, Feb 28, 2026 at 09:54:20PM +0100, Piotr Oniszczuk wrote:
> 
> 
> > Wiadomość napisana przez Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> w dniu 28 lut 2026, o godz. 10:49:
> > 
> > Venus driver errors out on the interlaced streams with the 'field isn't
> > supported' error message, which e.g. prevents decoding of the MPEG2
> > video streams. Don't error out if the buffer is set to contain
> > interlaced data.
> > 
> > Tested with the fluster enabled to handle MPEG2 through Gstreamer:
> > 
> > ./fluster.py r -d GStreamer-MPEG2_VIDEO-V4L2-Gst1.0 -s -so venus-mpeg2.md -j 1
> > 
> > GLOBAL SUMMARY
> > |TOTALS|GStreamer-MPEG2_VIDEO-V4L2-Gst1.0|
> > |-|-|
> > |TOTAL|30/52|
> > |TOTAL TIME|75.526s|
> > |-|-|
> > |Profile|GStreamer-MPEG2_VIDEO-V4L2-Gst1.0|
> > |MAIN|26/32|
> > |PROFILE_4_2_2|0/9|
> > |SIMPLE|4/11|
> > |-|-|
> > 
> > Fixes: 059790467bf4 ("media: venus: helpers: handle correctly vbuf field")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> > drivers/media/platform/qcom/venus/helpers.c | 5 -----
> > 1 file changed, 5 deletions(-)
> > 
> > diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
> > index 747c388fe25f..71e79093a4c7 100644
> > --- a/drivers/media/platform/qcom/venus/helpers.c
> > +++ b/drivers/media/platform/qcom/venus/helpers.c
> > @@ -1466,11 +1466,6 @@ int venus_helper_vb2_buf_prepare(struct vb2_buffer *vb)
> > if (V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type)) {
> > if (vbuf->field == V4L2_FIELD_ANY)
> > vbuf->field = V4L2_FIELD_NONE;
> > - if (vbuf->field != V4L2_FIELD_NONE) {
> > - dev_err(inst->core->dev, "%s field isn't supported\n",
> > - __func__);
> > - return -EINVAL;
> > - }
> > }
> > 
> > if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
> > 
> > ---
> > base-commit: 779cae956c8316aebc1946ef86ca001f99658270
> > change-id: 20260228-venus-mpeg2-495f9187a1ec
> > 
> > Best regards,
> > -- 
> > With best wishes
> > Dmitry
> > 
> > 
> 
> 
> Dmitry,
> I applied this on 6.19.4 mainline and give run with interlaced content (hd tv) on qcs6490 (radxa dragon sbc).
> Playback fails like this: https://gist.github.com/warpme/a368983678af0a76af85314808773076
> pls see a bootom kernel output showing venus failure.
> my sw stack plays ok on e.g rpi4 stateful v4l2m2m so i think root cause isn't in my userspace....
> pls let me know if anything extra is required to fix venus decoder issue.
> br 


Interesting. So, most likely, H.264 decoder can't cope with it and we
need to allow non-NONE fields only for MPEG2. Let's see if Vikash will
have any other ideas.

-- 
With best wishes
Dmitry

