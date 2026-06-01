Return-Path: <linux-media+bounces-63224-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id T4yaFqVJHWphYgkAu9opvQ
	(envelope-from <linux-media+bounces-63224-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 10:58:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 033F061BF0C
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 10:58:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2ED8E301480D
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 08:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AFEF345CD8;
	Mon,  1 Jun 2026 08:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jLs9MLm4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kaJvDMtn"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DC0349B1C
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 08:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780303889; cv=pass; b=j4rmb1iSagKa0/DurhSDbkNGDuWcY0LcVN/jjjDuFom4chRerY2tyN28xHmSHhB4BG3YI0NMpG9a1c/AYaoEmGp03HKCgzuDk0DeHhSQyC9XfnxWrNYOA1ZhYeMoh0uhGZvy4xpJCqP51L2TNfpDOtKldHj6NTmbdfH9aXoegVw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780303889; c=relaxed/simple;
	bh=Yj0+bDIHslFZBoh7x1guMw+QfFzlkuh2bTRcWjdeb2M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kzFAElVCYSCO5YUAGD+JtEXFQW1o5ePa6qBwlAAFJYIQJO8jSuO9pB1ax0DIEM78a3L4VqbBAVxPo/07UHETXnHP3Oxpsbif/ps+vVjUyuNA9YnxbyrPa7qnDt4ykFzaSFo6OjTeO8FZZMXvuJm+kRMfsfVDGXv99MMSA2JrMNI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jLs9MLm4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kaJvDMtn; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65174jOh3250706
	for <linux-media@vger.kernel.org>; Mon, 1 Jun 2026 08:51:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=792+f2ewCpvg7R7Bpq+I4fqO
	Idvr5TvlHI7UQNhizHQ=; b=jLs9MLm4f/5bQJtH6L/k+mq4GcALVUDuI1M7dH+l
	AVgSVR9mVuwlWoZ6NU8r85plilcA2Db+fFr4cpGlJB4B1ya0aNBTm2m6dUEXK0Q1
	3Yxu6+swzbA3fqT1AG9igN03RHey7wo7iNLzJp+4Fd4yThUiw9A02W/u+0ebxvVX
	OO+grtkBPHro7sbg2RuhrEp7Dv+jjlp+WqTMaja/mIzetc79s8PU9SDIIsOIrJJK
	9qXz++M/pGLdj5jTRO+rTlFdIRTiXm7aFubJbQ8sofy31UL4Pr0zH06jPszRI+hW
	QCG6qP2VmFM2LWyh3OMJDkN5gMuiRDoDZrHojBtZyqnCvw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efr98ejbb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 08:51:24 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0c272e532so13842235ad.1
        for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 01:51:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780303883; cv=none;
        d=google.com; s=arc-20240605;
        b=N7jvzmxTZDBfVB9gxEk3pQp1IhDHzjPlkUlS1bPvCbvzVoXC/Y9Vc0EgvfSaW0c4dL
         g1a0mfHypZrB1XvrAsjMx243A02OD65H7a55E91r//d4e2KejFoF4k3sQcVhdm+jrOou
         wIb2C9Zc/sYpuf7oOXa36SB29nronKFQLhFTrr2IQ7ccxXnFpIQNLHfreh6V2RMo+1NJ
         MSg+siWLGU7z3OfIcf4WOPQMvteHysBJIcDmEgk/rBY5ptuCc7HVXxBMc62phGXzGuI7
         58mwBxZfHewoQk3sZZ/+kcZXH9Z4kNakKYoWqU1LIVIhisU341ECG9XNbjmJaSXmarq9
         4NLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=792+f2ewCpvg7R7Bpq+I4fqOIdvr5TvlHI7UQNhizHQ=;
        fh=plMCu2bl41kJqo2vIH12MFu8xR54SA00aEWEpGXwoAA=;
        b=Ko2hjJzTu1dmsh4Le/AhnxiB23uzTKKQ7qLRYZzTy8/VUTkJTjFGn6UKXjBnRFlfJq
         gTY2dexSfgHu9K6rxgXUeeWl+rV+gFT0po/opEtS8flylB4Fhn1RvX5lrS4RAmJmFmZS
         olikfOQ28gqF1CxPjR717pFet0gUXOuZD0HhFFyMVKs5lifjZcn4544wLKU14aU0f9+f
         dJY/l9HUK8J+s/u4rWrpPryoRd+nm12I7iHCv/p8oerkFtTgeKqI3aNxvlpnNMe0lZAd
         I0fZ80FaeYB15LzaXuF+qsV2/hd94i0qN8+Lh210LFbHWhcQwt13if5ccN2oq3wh/q6c
         os+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780303883; x=1780908683; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=792+f2ewCpvg7R7Bpq+I4fqOIdvr5TvlHI7UQNhizHQ=;
        b=kaJvDMtn37n3LkA6sr2HGFuW/gWhH0hMHA0vkJImww0GWsUkDWrGnWRMT0k6UaeEdp
         ebpJWMd2TURoSw4yOsY3vo4Lc6jZSQZFAts5+ccTI2t/GBRvx++tqKwpdrcw3Yj0OJEo
         j7S5SXbtQXQhT0mujyL3oS2Za2lZZAqiDXJWIMZwqSl7z5Gig9WMkOeUro5CcikXFc8a
         gH1bkCu1N+WOGzdsZsO4655J5v8BWYgq2S+HXBsq0SCe1v6jU0oy0NFwtX3uwBYMvRNu
         hLEgvo/oBihxcj2ydx6MM7JVNGb1uMGFCPexVlQMTdFXIKrsUcFeOVvxt8xb7653bk/n
         X70Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303883; x=1780908683;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=792+f2ewCpvg7R7Bpq+I4fqOIdvr5TvlHI7UQNhizHQ=;
        b=rKB2o5zGlObnxlEr8hKs6gAFJdLJsLN1fXjrFHxgYrnVExqttPgcdaZWpUwQxZr4yH
         oqadxJBbKXxSmnmV256yo8S5qf5+g4USB2HrTnKkEQUZdaDmYGCOTL8zSH6yzviIb6dE
         ZYCdZb2KS1GDaInwptPDIIzxgx8YgeY65WWWVknqZR1/M7+ZoXYgI1fbaaxeX0qsX3fK
         4oGOe1RcVY+zUPScWqC9K3p3W9PralNZywjNlYn1ZzgPl//N2HcL+7SKVAXzEP8iUVCN
         ZL+ylbfg8fsMdAxRX96BDUpsE13lp3lJTQXO8XyVgRlFyB6wJdAQJ0roXibrmWGzzCkM
         0h/w==
X-Forwarded-Encrypted: i=1; AFNElJ/i1Y/IhWuk75Tgh4o+DtxlXFuNW9FAYaHwR9xEKuq8xs5PD38MZRnFwLXx4y3Efnf+4Pnc+kTWuJrBbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdf5XtbbhintBJwF+yGjiVLexsxcfixnNCUCU2qrufST5zQDZZ
	INIFmR1DgvYQl2173bOltrgMlphx8dP3i0rlOym3GltwNCz1qxE8T2L6OA5+1FmwYFqGJXPAc3u
	s5gxF5MsVUbLC5JatxhkKbDDmpyEI2xphSGM3nsp+oNMfmSBPNwXZhc3Pw0XhVug4RsdhWG/WUp
	irYblUv2wPeKZJViI69gMQ8pEiZEGA/mPVvWcMjQB1
X-Gm-Gg: Acq92OF6gEyUULoIAam/Yac1r034XMok2goDsR1g6PRm80WZIWYn58AIN4N5AuNmwUQ
	qQFXr68ztsnfwHsuoq+5FS4LAH4NxecE3wdFAM1eNFGX9sqnXtIGD8Vsi3NC2RYQ/OiIVkeZ5Mn
	JVnfb3Upxi7nJYYXX8RhDETvFzJPUXJaq0EyL4yPh3FB+IqzZtGvNJml+Qw+JPOrAcSdtQNlDUb
	mBIZ/EHCifsQXN3V8UtTmVz7jtRVEEnX2Wl9VenPfslUUOjlg==
X-Received: by 2002:a17:903:2305:b0:2ba:7881:948d with SMTP id d9443c01a7336-2bf367b214fmr112124775ad.1.1780303883143;
        Mon, 01 Jun 2026 01:51:23 -0700 (PDT)
X-Received: by 2002:a17:903:2305:b0:2ba:7881:948d with SMTP id
 d9443c01a7336-2bf367b214fmr112124435ad.1.1780303882500; Mon, 01 Jun 2026
 01:51:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAO9ioeW5mv9bQjKbd3KOx6V4GB2xKgmDcLrbLowc=j0agwWMag@mail.gmail.com>
 <2d1e7167-2cf4-4998-9005-5d18a45c0144@kernel.org> <20260601102127.625ed568@foz.lan>
In-Reply-To: <20260601102127.625ed568@foz.lan>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 10:51:11 +0200
X-Gm-Features: AVHnY4Kllyl02t9s1Pu--UcHlD3cdZ4jvxU5xntH3UNhIukD84_EV27Q9DA3EMQ
Message-ID: <CAO9ioeVPX_KWh4Pgh94o3P+tuwBsBsbBNxds3ERVQo3r5iMVQA@mail.gmail.com>
Subject: Re: media-comitters next vs fixes trees
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org,
        media-committers@linuxtv.org, "Bryan O'Donoghue" <bod@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=BaDoFLt2 c=1 sm=1 tr=0 ts=6a1d480c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=YdmwErIQQhaOtTcJ1PEA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: K5RfAXFObKcPcnTcEh4znjC2ej52vcuT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA4OCBTYWx0ZWRfX+EGYZxkcTkxp
 +DSPwXIkdq0Gen9CWkfXHyvX5HNGm5MDILYr422zdyTXBkefWWeIBToFnDKMRCGzlyEv4GK03ON
 RMK5O5M25CXxZXsITsK+8V17SASuBKB8ipWfN9Lq+VHA2MJaA7q5XlC8y4LjcxVmQ+uhz7LTZWo
 7+QaIeCz51tMw6Hg1Y0+R8Y9kBpJIcpHA9TO7zWcPT9Ton6BfPOzM2okbOBCY/9JSIw7nolzD14
 uA/8cMbDXJwAoBmqbZMGtX+59HQrLzCB86cpllo8/CN1y2OG5BpRDL8ro3Ev4lJJtjR7dS9bGE0
 pDNk4qZ1+RiAwZwdfetpTcRPunqT3E2IvTu5FmOJIJ5+xJ9CqwpmT9YxuU3Faq0qHTpQc5337Pc
 UvoWgVkpQ/UrSP+6/6alLovt8b2z+zXlDTluBvkB+WD5hVloVkpRkBakKF4d2MFs9QsjWq/DSB/
 qpRuwSjZWwtuBAKyCvw==
X-Proofpoint-ORIG-GUID: K5RfAXFObKcPcnTcEh4znjC2ej52vcuT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010088
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63224-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,huawei,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 033F061BF0C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 1 Jun 2026 at 10:21, Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> On Sun, 31 May 2026 15:24:48 +0200
> Hans Verkuil <hverkuil+cisco@kernel.org> wrote:
>
> > Hi Dmitry,
> >
> > On 31/05/2026 11:13, Dmitry Baryshkov wrote:
> > > Hi,
> > >
> > > Is there any current rule or plan about submerging the fixes branch of
> > > media-comitters to the enxt branch? For example, I have several
> > > patchsets which apply perfectly to the linux-next, but fail to apply
> > > (and function correctly) on top of media-comitters/next because it
> > > depends on the commits which are only a part of -fixes.
> > >
> >
> > By default we (and with 'we' I mean Mauro and myself as media maintainers) do
> > not merge the patches in the fixes branch into the next branch, unless we are
> > asked to.
> >
> > Most of the time the fixes are independent of work in the -next branch, so we
> > do this only if there is a good reason for it.
>
> Please also notice that we only merge upstream tags into "next" branch (e.g.,
> currently we only merge from a 7.x-rc? tag).

I'd be happy if this was actually happening. Should this become a rule
for media-committers/next, to merge -rc tags? Or to merge -rc tags
after there was a medai-related fix merged into Linus's tree?

> > It's a bit late in the cycle to do something like that, though. In the meantime,
> > just mention in your cover letter that the series depends on patches in the
> > -fixes branch.
>
> A "good reason" means that you need to submit a patch that will be merged
> in time for the next merge window which depends on a fix already merged
> upstream.
>
> Just to give you a concrete example: we're now at 7.1-rc6, which is a
> late -rc, as this is the last week where media subsystem is opened for
> non-critical merges. We usually don't expect big/complex patches anymore
> on a late -rc kernel cycle. Most of patches on this time are supposed to
> be fixing issues.
>
> So, on this specific case, a "good reason" means that you have a fix that
> must go to 7.2-rc, but depends on merging fixes from 7.1-rc6.
>
> If this is not the case, better to just wait for 7.2-rc1.

Yes, I agree. At this point it is really late. A part of the problem
was that there were no patches picked for drivers/platform/media/qcom
to media-committers/next between February and May 9th, with several
patches being picked to -fixes also around end of April. I can only
hope that it will work better during the next release.

-- 
With best wishes
Dmitry

