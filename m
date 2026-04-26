Return-Path: <linux-media+bounces-59626-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPbiGxkC7mnVpwAAu9opvQ
	(envelope-from <linux-media+bounces-59626-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2026 14:16:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E079D469C59
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2026 14:16:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D45EB300C25B
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2026 12:16:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E98C735F18A;
	Sun, 26 Apr 2026 12:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eBbizPPP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D3OT+idH"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA372264C7
	for <linux-media@vger.kernel.org>; Sun, 26 Apr 2026 12:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777205769; cv=none; b=KeGiYMaVpP1tweLkn6Gcf3/dj8FLQRor1gKt8T3Zp80FkejntM7g9K8O1FljBDeqs1svt2V53nBjE9NMAYiXCPGzAExsSAHYiydLBHKl2wbjYaiv4UbxOPP6+Yx9LCheeNlEV1yu2TD/4VuD3xFJLjw9Uu2w8c82T49bToFXaOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777205769; c=relaxed/simple;
	bh=sTH6zrHiQgzJ2dn9yyu9ZpKb/zzGMOU6idxjmTf2X0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mZaNWcMQpv6k5Tm1HrVPBSbHXf98YxfjfpwNl7Khw2aQB3lz1iTCmHS4HWA4Hwe+C/h1/Dv+Mbzivr+RkAxSxOddHaurTtpwg3vJVWs/gxvecifFMMzBcTm9SMn1IvhaqAuN20ZabxZpHUEu9kPenvgEUxaOjMmSN7EcpiB4o80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eBbizPPP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D3OT+idH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63Q4dHsU2240194
	for <linux-media@vger.kernel.org>; Sun, 26 Apr 2026 12:16:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Eu9oH6bIm++6Uod9f6mbJENn
	f42CEvq9lNDJEscrW7U=; b=eBbizPPPtjcY6DIrYbD6qYZQ/8+0igrIAyTfcwSC
	2yLd3BCGUJpCMiKlxy6zams0+3OjqFHBp0aJjN33GRaonbx/5ebBPOzM+6SzH0Aw
	GMwo/fZHT7+NbrFqpRPXJ9vdPQwqOa9NDGIMFenynmAgcuqgrZJ2YB+/EzpYloN8
	ldDQhuRtuxGtRWGbST7ny9qWjUaTWIi9KYCFCENx1i5M911mk2ig4aYJoy3uWZDp
	6OEm3uysW64A8vJFyXbz1ssVSD7ubC8zOvTikyMqDvt5Zd8gkqa2GExmeVtJrbj0
	Hdkd+dRKBDngFXPSJlkB0z5Ng1h8QTm1Su7eQ85XiJn1kA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnqrjs4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 26 Apr 2026 12:16:06 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fcdd579e1so62106531cf.1
        for <linux-media@vger.kernel.org>; Sun, 26 Apr 2026 05:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777205766; x=1777810566; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Eu9oH6bIm++6Uod9f6mbJENnf42CEvq9lNDJEscrW7U=;
        b=D3OT+idHBAxyfW5zXjkvqe6vijS34m8/J4evv0uYu9S+YRS2ThybQrUXsEUI/G7Sdi
         Un5/OJesTN5+Knm5H9S3KatmtCJvy8ynUFR2NSzFvRi4Z6m6V8Il5xZG2t8eqC6Mr/Af
         6x2S+GsQZpsaYmdgiSWtxGLOG9hDw8MDvtW/6LtvCvuT3WgjJw+S8onBdFRRUijmngRQ
         USEGsdYhSjVkb5aER1aV7E+uvbFYSQuPQeNP/o/CKova4SP3EWRN+5xuLnthnVSVJhEy
         Ps1NWtGb4+suHYDpNSQ/ESTb+yXxPeOpVfBqMLvSlu87+Kyqkczn1dmbZB0pkt/VB8pt
         9Wjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777205766; x=1777810566;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eu9oH6bIm++6Uod9f6mbJENnf42CEvq9lNDJEscrW7U=;
        b=KZN61RaItRAMgGzj3J1HctPMGQZ1zTerqP6eRNgzb8yn9Wu43fwSfHz5Yc5Xf2Fq7O
         iss1g6zFPtneWlYDL6/TQLMQ/AwjKbohW4AELawLAEfHn8fkLMjyD3Zd8stP6nHqUnKx
         TXT5R2Qkkm3KHUmfywwg8CnWzWBT7kjAwyMrUsr3xhxMaHYrEhKcIpxJSYNjygT7nfkB
         qIoV6GN5Uh6xN/WDk+429QkK6uZrxVyYHv36g+l/u7VpXxpHNMx3pSAZwRiUzBP9A9vj
         zjziUx9jHaVauOk3yHT2SZQPGglsDirttOkGOGboc07H94s8anw17+Qv1GwhyP5fT6Ri
         SkUA==
X-Forwarded-Encrypted: i=1; AFNElJ9e8zeekWuRq7On+RXtLKvLMlrXaVM8xJueg6WOpD0aLs92F5qAWvQUYPEekB+Ln0zesXzExkDBpKBsDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxD0H2fHXvDsCSg10Av/ivWg8TtpXFhb4yNOVjxLwiw7zIfeZYX
	V0TSm/THMaKZWrFzSyK+4LV+U57+j0Ys5jmUvaj5hp/BtXlnoX3V2KNr7pTqxMJ8rLCLVRduW+R
	abR+L0J6juRCqiaRnMqY7s786aJ1TFUeUqS/dQTlLjb8suEB7dRTOLvmYZhuuD+mszw==
X-Gm-Gg: AeBDiesdwDCDNmHZo1Q1bl75/Ug7s/wffJOeNR0bGTl/LvmJTuZe2TNwhOmwQytNXfN
	oSu+qdIG+3wXhopeuiLcufRDhmM/5BAkbJaU7XZfrS2KzrwViUdZleQeOgHpVTwAdshcC2lvZD0
	32S0gtX2mIziHXIikvy7c5BTO4uF2F0X5aMilGz2Zx4wYZyBWCEaBFBa8+FPMIsahnvP5W1YXIV
	v05K0km25m1YS1THXlCk5lOWW/9HIjW0BUUKiqtj+WdIYC6lnqN6GfwOqujYWwlINmH1mMdgf2U
	Xg6OoN/r7aR+YZK0q+GGIae41YqCn6gM7Q8FBD19D+qxn2EfRREA+z/rhBIUJfShPWwmAWZUep2
	m+nphzHg1rTHvWfbxLFKfLLwNscaG0UPbCPNTek2k2uTK+/NwadlNkFRxVv+ZrWnPACs1vi1Rd4
	91fZiE+esyF7Sp/RZWKAvk1liLQ6XyUAMBTE3WZy/0iLJrWQ==
X-Received: by 2002:a05:622a:698f:b0:50e:5de8:6458 with SMTP id d75a77b69052e-50e5de873a3mr285408401cf.57.1777205765925;
        Sun, 26 Apr 2026 05:16:05 -0700 (PDT)
X-Received: by 2002:a05:622a:698f:b0:50e:5de8:6458 with SMTP id d75a77b69052e-50e5de873a3mr285408211cf.57.1777205765441;
        Sun, 26 Apr 2026 05:16:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187ebfd6sm7326187e87.78.2026.04.26.05.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 05:16:04 -0700 (PDT)
Date: Sun, 26 Apr 2026 15:16:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        driver-core@lists.linux.dev, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 11/13] media: iris: Select DMA_CONTEXT_BUS to create
 firmware device
Message-ID: <atmot2aw26hrystaxpnjtc6fmep2lsjdbarlfocysghl7db5gc@yrdyk6i6zd2p>
References: <20260423-glymur-v2-0-0296bccb9f4e@oss.qualcomm.com>
 <20260423-glymur-v2-11-0296bccb9f4e@oss.qualcomm.com>
 <2026042305-pungent-urban-c681@gregkh>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026042305-pungent-urban-c681@gregkh>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI2MDEzMyBTYWx0ZWRfX9H0z75QXj0Sx
 CYEC2E39rhJJcPxDPwnJaRUKzjkW7AOvcP19XgdHDACUZiR5igAhITnGVOC90/Q0FgIMajNucPD
 9wCoULPpWa0z5azkjLeA0UWgMgpDZDqSmDsGNIfs8hqLNXQ9p91cT8gm6wKyeSKDANxlFu0i7Ms
 8jwYi6vfNWHTY+obKzARGzQd0h+5wp1r7z6M/qUpEB+RrWQDJeASi8PsP8LWACoE7J7oUgGKCGV
 orWuI8a5UOtG3rvNUBkA9vcCGTM63sqSXGWgijGtJITsNmsv5fbKeaq8PNRbnzQ14sayb4zc/sz
 ttpBznoMju/TSMvmqaWJSP6vRF50k5FoNWMRwShe9HiN78YTZu4E0/gOXW7E49sJL406WH52EJx
 ZuiRvy9BJmR66nEEZxy9djXkYnbZTKhqAGG/ndylrhKW7CtZbWTk/5gZtl769UhmziOxC+LbO63
 8L8yoth+Mz6Ynjvjy+w==
X-Proofpoint-ORIG-GUID: JHp4WJMLMpcmiSFreG526pHagtOeXRh_
X-Proofpoint-GUID: JHp4WJMLMpcmiSFreG526pHagtOeXRh_
X-Authority-Analysis: v=2.4 cv=UcthjqSN c=1 sm=1 tr=0 ts=69ee0206 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=FZe96GFAMPEOsOiVEGMA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604260133
X-Rspamd-Queue-Id: E079D469C59
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59626-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,8bytes.org,arm.com,linaro.org,nvidia.com,gmail.com,ffwll.ch,vger.kernel.org,lists.linux.dev,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

On Thu, Apr 23, 2026 at 03:38:25PM +0200, Greg Kroah-Hartman wrote:
> On Thu, Apr 23, 2026 at 06:59:40PM +0530, Vishnu Reddy wrote:
> > Iris need a firmware device to enable secure PAS (peripheral
> > authentication service) support in case of non-Gunyah.
> 
> As gunyah isn't ever going upstream, why is this an issue here for us at
> all?

Vishnu, this is a nice example of why we are always asking for the
complete commit message, describing the problem that you are solving.
You gave zero context for people outside of your group who don't have
a knowledge of your issue.

Please start thinking from the reviewers point of view. Or consider
yourself being an engineer in 5 years wishing to change that code and
trying to understand, would you break something if you do this or that.
You need to explain, explain and explain things.

For example (please correct it, it is based on my incomplete
understanding):

If Linux is run under the Gunyah control, the hypervisor will set up the
SMMU SID for loading the firware (and protect it from being touched by
te OS). If Linux is running in EL2 without Gunyah in play, it needs to
take care of that setup. Since loading the firmware requires separate
address mapping, corresponding SID is describing in DT as one of the
functions inside the iommu-map property. Create the child device that
will be used for allocating DMA buffers for the firmware and mapping
them to the correct SID.

Please review all your commit messages from this position and adjust /
rewrite them as necessary.

-- 
With best wishes
Dmitry

