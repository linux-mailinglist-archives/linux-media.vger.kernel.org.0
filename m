Return-Path: <linux-media+bounces-60999-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JqLBA1J/2kZ4QAAu9opvQ
	(envelope-from <linux-media+bounces-60999-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 09 May 2026 16:47:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED711500253
	for <lists+linux-media@lfdr.de>; Sat, 09 May 2026 16:47:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 537883005995
	for <lists+linux-media@lfdr.de>; Sat,  9 May 2026 14:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6D3A229B12;
	Sat,  9 May 2026 14:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iJozb2yH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U4wS2VGs"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30C82571C7
	for <linux-media@vger.kernel.org>; Sat,  9 May 2026 14:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778338058; cv=pass; b=vAyF2M7d4B6Am1CBDEyuxZ0GhyYhzwr5kfzD8WM2VA1pTlQL06Mt1KP4XJ+ObcBWWaJA21VouLD15ihhTOh6nybg2LaafqpMfVT11dhTMH5zrCxGfW4jcuGsHXvZLk4SSMPg1soKfcdj3WXGxKXqyWUmaw8w2e5/mKRPFufIGPc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778338058; c=relaxed/simple;
	bh=jBVo2t6J+YaU7d0WqCTZn/YK+PK1uQ9DS2xi85AzFOQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gLklPy3GJZgk51MVRD5xeuxTUw2TIMaHUhVOAjDNz36B9emkZsp8+v52YLlclIjOV6SdCT0y74QVd1CW8u4ZZOYa2EK6hZYJbCdNNBoyU7pQsc9i5CqnzCBxUr0CdifvnHro6dMpVuT469U0jW8B/LFf1QO7Z74RCTUsvLA8sP4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iJozb2yH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U4wS2VGs; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 649BN2LN3844607
	for <linux-media@vger.kernel.org>; Sat, 9 May 2026 14:47:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	27C2/Rl3KFni2vfVGZkQu6bndldr2xFN3AQbTDjKonk=; b=iJozb2yHyqY02BDD
	6FeGs+r+I0kL7W9HHk9vlyvm1dl7BBB/dgpyERGTUgp9U7+o5zLwiAdC1ld/R7KU
	KqBlZundHpk7YvXPRTZHkWsBobuSXcELNk42Kc13Vg/UoY6Q61aUnd93SzjZTweb
	0zKY54sY8DIz4sFaZqFUFykUiZFdVib40m970KcJC2gFNlMm2AVBMzM5jzhuSUZK
	lm6cFxUAkEqorqcF7GuwEv92VVYoW8DppXJAoQpXedg8uCYkHez1hZKyxdlcsQv4
	nSePXMtfIHLvuqcTN+orDGQ3eyMhzlj99T72fJqGV/YS2m6wAcKKiWCk5Q6LVQOn
	iLc5ZQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e240h0as0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 09 May 2026 14:47:35 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8b1f39c5827so29581156d6.1
        for <linux-media@vger.kernel.org>; Sat, 09 May 2026 07:47:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778338055; cv=none;
        d=google.com; s=arc-20240605;
        b=OETFOHKl5PoPQHpRABrMguNn2Lv1wPtG1Q5kB4R+XXz+TqbBGLyRTY8CLd9tnPpITw
         MQbDos/XIYyzNz+J+1WcwUH5t7Z4Pnmv7R+f/3NgY71crFYxUvV+9nTX3oc0gQMKZAVf
         UR4Rw1h3J9xvTyLOPNwE8Q0p8Iu/EzzGB1qbV97scb5czO/LAhkEdpx1h5ZcebY40rdj
         QaWGVyDuC+dlcMzOLY7SMRv79h7Rbg1IqUeQescBreoL1iXUPoEyHnpdfzNdLKgwgVid
         dO5Hxj66Eaakcqx0O96zCIFlelwc2WE+raCoPADiZJu2g6Zfhe8ljG+FdN2f9m6Zj8Dn
         a4cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=27C2/Rl3KFni2vfVGZkQu6bndldr2xFN3AQbTDjKonk=;
        fh=oIjZdYdL8zZrEwE0aoObH29zjtjP6f0VdIxyVruxEkw=;
        b=QnaWrHvXBgOmzectwDsfBMXPbYxeOqruLG+Dj0CPxU8urifKGoGpdUi5UukhCWfnh8
         4gyyC05Cg4cY+zJfr6xajJ0cd+WS6wtVROG/FGz/ljQe/PbLd+EWHF+vShw25j6HGYXg
         YrJurj2mws0hL796/gFBHEf0MS2t07D7Zvp7MRAA8hlIjMf8+s7c8u9OH3K97/Ud0tzr
         06C09IeXMMboIEgpx2Z3B/q2IqRgYIEq7VraJSupcmJSszVm7NS9PkBSPrG5fxm5THH+
         m+s2Gs0EgKFTJihlttGR+NIEyE7eOVHo/Z0cSCXsSzSV/j70RLfqerZi0IrjMJVSK+gf
         A6Nw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778338055; x=1778942855; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=27C2/Rl3KFni2vfVGZkQu6bndldr2xFN3AQbTDjKonk=;
        b=U4wS2VGsZlrd8TcXF2xmeTmWxL0WYAXceKNMRJQYiNThSXeJeBkkVXUv5nK4sWGsSn
         DMJKsY/s4uPcM2k6wY35AOgmqwIUOy09MAWazq7yfeg2FtyQ3CsuLg3iJWofzpF7vmAP
         mA2mbtkY0d2APZnFHD7+7I6uTBMBBVOYpLrx/t9oKEFjRp1lc2JiP8VBEOpG1/Q8JC9K
         0dYpkldFHfa2ZbXzFozQtv07JGKLqgLu0gNB6sLxjHVrLNxsEQWu1AwbUAlviy4fAO3e
         XB9d8wwUm/Ed5IroVOjzqRphbMiQ7pN/tc+k5FxE3x9AZLW7FhmdmVcfxCmOVpySeYfG
         AFFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778338055; x=1778942855;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=27C2/Rl3KFni2vfVGZkQu6bndldr2xFN3AQbTDjKonk=;
        b=HdzoCYEGe5sqBvw5znPu+96HctYTf+7/jFXSrqjNhmhekqL5oNz5+Z77tLrRg+LmaA
         l+4vMliz9i6jdbdNpAUweyQ206yq61291fhfD9WJRbBk//HdBcgNoQLXcnSW4NwqhLtv
         w8iC8xhMZZMWnni5Tix66VEYW6NKWGJweT4uIIKmX676Pq698Xc+pktRmpJ+gni6gQln
         4wn1RGk9akGEtdOCViP+n0BIArTHy0gPoD0I/VEoc7Zh644lsecdE7Uut9ULQUVl6C83
         fkXo6fLXnSbiGYYCQVwDrN2JKuHvbn7pk8wtUmfkIBVpT2WRjLDnrfZBZx3LXa5WxiO8
         cZyA==
X-Forwarded-Encrypted: i=1; AFNElJ/uxR7jLAM+fOMpJ5F236F8BJ9AU2BQU+CsS1dpRriPPuYn2ebZY6sUKJSCGh2GMrV3DtJA/o5VWuuJ9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YygbSKgUo4BEGcxBXrRhp7jBiohizF1ybzYTni9tx69Hk1dvn8K
	cx1fbHqVm/3ntlkDUVqdNGOQkevtqP8RgFtdQM43B6k4oc8EVVPjkt65+gmvIHSkPEdzLGvCmJE
	xR5GA1lsTsJ3WJ66MZB+Dd690J5Wb8KtGYeY0OywaFveXA/Foby3x2vY+0CiR9b7BJV35aY6sQa
	qbs2KUUm2UbmQTnukI99r3Kbh6BJRN2/7wu+iNacjJ
X-Gm-Gg: Acq92OHGfGQ0xRgepcpG5MI++RZIkmRC1fKjHcpoS4Xw1BfbVkHEgOPg413neC42epM
	6JBsCstUotTFbdgy5BgL3GoqRyV5LUfQ5xRxrxXKpjUPl75dqU6LKfWMKz2grooYs3dYJFZCgCR
	r8G62ZZsDLxUTK1E6BlcCHS0AOloHBIj0QFOz76wbQF8rf1Il6xmHC/YKpQFl15OjvBMYCB6k3q
	EM7xQNlHziUGiZzwSRwCpAh2A87XxQxVY67uNt5
X-Received: by 2002:a05:6214:2262:b0:8b1:f297:a54b with SMTP id 6a1803df08f44-8c1a30d0af2mr40303016d6.18.1778338055228;
        Sat, 09 May 2026 07:47:35 -0700 (PDT)
X-Received: by 2002:a05:6214:2262:b0:8b1:f297:a54b with SMTP id
 6a1803df08f44-8c1a30d0af2mr40302706d6.18.1778338054781; Sat, 09 May 2026
 07:47:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
 <20260508-camss-isp-ope-v3-5-bb1055274603@oss.qualcomm.com> <f6121050-3b27-4651-9fa9-9300ad299df7@linaro.org>
In-Reply-To: <f6121050-3b27-4651-9fa9-9300ad299df7@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Sat, 9 May 2026 16:47:23 +0200
X-Gm-Features: AVHnY4IkAq7SY7Hp6OxCQcJXDEy8UMWZq8MP9OmoTi2x5Wfx0FQsfdjxEJtkApY
Message-ID: <CAFEp6-3oTtRXk__bnZ2xFRJ=ijnep1arhekeJkOoRBr+P6A_bQ@mail.gmail.com>
Subject: Re: [PATCH v3 05/15] media: qcom: camss: Add camss-isp-sched helper
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
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
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com,
        johannes.goede@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA5MDE2MCBTYWx0ZWRfX6v6W65KgJl5d
 zv6//h5sN/aI2u5xM5BkWd5vBfyBUAj66fn7LBmm+yQpcMUjU51r6ZrFB4SFDZTYRxnNsSZwxKY
 dErKb9Pdml8jncRXVxZ3OpaQAsHA7i+NWStNBCqKM7bYHifpXG5m6KVSDju7TTmOZMwqBsos4Na
 vmIVESv+1a8ZNy6mL63mCyrVbcLX3Ajm/IA20drmNUfPbKikSP3/1wwwVnFlF/WFBBDz447cfqH
 j6I2+Lgb3x2ziVHf6MNl5N1nPChWj5BuRWEV+VQyNOiPtndZ+OhTUgxViKwejyCIB2wWbzk/YiR
 iInvcRZ1rFjp+yJp0D1BHHt8c1byZyXytsLvvRX4oKNrYdwDBZJi807z1gYnBiALI0GnkZmshaL
 YHdmmT0h0IzrNt0MoRqaPS/eHuVl6RnF5YV6sHI9e+Tz96eZfgjItgTZi53WRQDeirxVUTNBMf0
 7zWB8YdCyBCgxcDIoBQ==
X-Proofpoint-GUID: pPMtV195J9Bx4IThFOWJgPp7iQSuidMG
X-Authority-Analysis: v=2.4 cv=X5Bi7mTe c=1 sm=1 tr=0 ts=69ff4907 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=P1BnusSwAAAA:8 a=KKAkSRfTAAAA:8
 a=5yXcwO-DJp0L547LFbcA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=D0XLA9XvdZm18NrgonBM:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: pPMtV195J9Bx4IThFOWJgPp7iQSuidMG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-09_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605090160
X-Rspamd-Queue-Id: ED711500253
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60999-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,mail.gmail.com:mid,oss.qualcomm.com:dkim,linaro.org:email]
X-Rspamd-Action: no action

Hi Bryan,

On Fri, May 8, 2026 at 12:06=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 07/05/2026 23:49, Loic Poulain wrote:
> > +/**
> > + * struct camss_isp_job_ops - per-job operation callbacks
> > + *
> > + * @ready:  Optional; return %true if the job can be submitted to hard=
ware.
> > + *          Called outside the scheduler spinlock.  May be NULL (alway=
s ready).
> > + * @run:    Start the hardware for this job.  Called from workqueue co=
ntext.
> > + *          @ctx_changed is %true when this job differs from the previ=
ously
> > + *          run job (i.e. first run ever, or a different context took =
over).
> > + * @abort:  Optional; abort a running job (e.g. trigger a HW reset).
> > + *          Called from process context during camss_isp_sched_cancel(=
).
> > + *          May be NULL.
> > + */
> > +struct camss_isp_job_ops {
> > +     bool    (*ready)(void *priv);
> > +     void    (*run)(void *priv, bool ctx_changed);
> > +     void    (*abort)(void *priv);
> > +};
>
> I'll reiterate, I don't think this is needed and is overkill.
>
> v4l2_m2m_ops already has device_run(), job_abort() and job_ready().
>
> :g/ISP_SCHED_PAUSED/s//v4l2_m2m->suspend()/resume()/g
>
> This seems like codebomb of a parallel implementation, which can be
> largely covered by existing v4l2 stuff and if not then should be
> justified in v4l2 as a new design paradigm.

I could potentially reuse the v4l2_m2m_ops structure for these
operations, but not the full v4l2-m2m framework. The latter is quite
monolithic and handles everything, buffers, queues, job scheduling,
media topology, etc and is primarily designed for simple m2m devices
(i.e. a single video node with two queues). As such, it doesn=E2=80=99t
really fit ISP use case.

Instead, the approach here is to introduce smaller, focused helpers to
handle these orthogonal aspects (buffer management, scheduling, etc.),
which aligns with the direction suggested by Laurent [1].

The longer-term goal would be to generalize these concepts at the
V4L2/media framework level. At that point, drivers such as OPE or
mali-c55 could be adapted to use the common infrastructure.

[1] https://lore.kernel.org/all/20260414084259.GC4061@killaraus.ideasonboar=
d.com/

