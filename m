Return-Path: <linux-media+bounces-66226-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eEkrBjgdRWrt7AoAu9opvQ
	(envelope-from <linux-media+bounces-66226-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 15:59:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 060286EE738
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 15:59:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=QC4cQ4Ma;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jqx8YrXY;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66226-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66226-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6C3C1305CA59
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 13:25:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2638E481FA2;
	Wed,  1 Jul 2026 13:25:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AED048A2B4
	for <linux-media@vger.kernel.org>; Wed,  1 Jul 2026 13:25:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782912345; cv=none; b=jDO54F3uQKcjXGcUznjA4nhGwaLJMW6X+OfHAOz+yJs/66Li/1z7ChSGonxPSmhftpb4seCt0dXe2EGaVyCV+RgbLnK+l1RhQ8nXCM4HRUT2KiswpfWaFCM0LtVz1ga9OWRtoi9pJCf8ZQLX5qYxwR5h2vCLdPPEcql3JVf+BAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782912345; c=relaxed/simple;
	bh=F7xPlX5Up0dNlN3O/LVJt1+uOSHUlkhvPzH88oAA5BY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NWc+ydAkpYNB0NpnoUa161F2fjglUwmtnnt6CizaLQbYDQ/X61jf1ZzoNEWoSNfOmN0E/oLP85KxxnmZBpyR95JiiV92ViLbadSb8CDL5v2XUoDCDAhI/M1ib34VSyRxE8x/ukiu0/5bUz1Ajq10NEnVqSiInOVOnGbd1DIfrGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QC4cQ4Ma; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jqx8YrXY; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661DLAeP1080548
	for <linux-media@vger.kernel.org>; Wed, 1 Jul 2026 13:25:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OEHtM9VnNMryK1PFmC2g6kaA
	Km+UjqsYWUcgciyfgN0=; b=QC4cQ4MaRmKJKpK06C50ldxbl0RezQ1k/DwY82s0
	V8jZjd5cSAbWLUuKj8J3MMxNzRRyIJbDUYim/rMImHN8CXwn/e3nsBHGZaj6uHMp
	S2ypriDeZoVk+WbrPT1yKyq+zUxhdnst4yd+Vy1jkZI8pyHsSbVcxgmWlCzG68sl
	vXyk3PEoMIQy+XsKR+n8Z2WqmP5kl9ab64Mk7DR8Pk7LhVPLuVwfOJxr7BUjqItR
	QiOJT7bWklTlC6ND5HXyZ9fVvSFbvEJqDcrkmYTMsP0yXYhsZDlRuXJM4NgXkp1v
	WSjCMupU8uJs+GxFAjVTIRbqHT4B1rhJRS6taVnQMnqmAQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f53q080ty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 01 Jul 2026 13:25:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e663c29f2so82030385a.0
        for <linux-media@vger.kernel.org>; Wed, 01 Jul 2026 06:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782912343; x=1783517143; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OEHtM9VnNMryK1PFmC2g6kaAKm+UjqsYWUcgciyfgN0=;
        b=jqx8YrXYQVFC+nuSN8qgd/TseIW3t+X9/+cUOY18EnF8LmnowilP4hB7uylRDCgIh3
         iOQjK31XI+D1AuFdJhcK1qWTzPIkIf+nuk9ZmMy08iMoIytDBTBlPORA39zWHF6pH0Zr
         FiG6jAXvxx4fEcvWowLAAIGVZ+kNvmO/FCtepS3brNjmBBG3uqBALgQWt1B/TmFGf5me
         Shy7yHEZWTM17a88+52w1/i8u8dZX4DH3D7Vu5psLw5t20m2c/WRWG3b18H7HpNpwwX1
         ezFdSZr+jiP5bNP+NQFQAQIFEyntK1O9ERmSk+d9L8GDYI3oUskJlOyf6HM+jMykrNR7
         QihA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782912343; x=1783517143;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OEHtM9VnNMryK1PFmC2g6kaAKm+UjqsYWUcgciyfgN0=;
        b=YLP2Va9NcJUYcD/E6cXcsTk1x/7yU6/ZXh/LT5XfDi70O4C79lbCeBWxKrYedlz2s1
         jPawpqpHXcdPGwa/V6z5QBEebOpRMxEMNOmeUwBWJaSzyLWcFODZwLVw6SOkP1qngdBx
         sKSnzSBR78DRUPzfLcTQOqKZkfcKJIean4I3LBcH1obPd1WqQGR+5YTx61F5qtbKX759
         i0CGRWXeHvFckBx/2Buw72Vf8gbTJ4EYI7FbxdkrEqmM0FmAPTl1JOXMwAfwYANUaEPx
         KPREpZQRZtAx7J05Vs24knDTFW15/wDeRVyLWX6cgdsHCCkAXmYsVVVb6gNERrCkopZD
         mqoA==
X-Forwarded-Encrypted: i=1; AFNElJ8eBsOTKyJ0+FNkyaC1VUUK00q7PMcd3rfjg6KfcYJq3Gs6ikOcU3GCN/rOSdRY0ZB1DmUwf1MlXq/7ww==@vger.kernel.org
X-Gm-Message-State: AOJu0YymdhjqstY71cSLwhRMBcflFCRkpzN3EyDI4tarLyeNGUM3+bhj
	V44ii999MZKu+TMasYJKg5roKfoJfF8QtvhYS6+5vtevOzjgGmMHN+swylfjRUju5a8ZeT4l75t
	Bg4pn8/fhwp3z+WK3Yb4u58CCB30p9gEFuHO0V4BVKi+mA0OuF8R0kVEw++5OpSFGjw==
X-Gm-Gg: AfdE7cm5N6j4FGxEDKWAATFdcmUeI4SYeZjTf/9RMp5cHgN4tVnQOPIULWSeGrEKFRl
	XCUF+sSkaqgWIH/BB+blYXbeUK8H4QMmPwLgRvIOKb/QrCnzhJ8GkEUWBPeDWNJdoer707Blh8W
	NlUJgDJel1F2Aj+ASkeWbL+z4n7xZk3sz8NO5q48QtnjJCS3cC/U55ncvT7QOovp+smu6hWGXZb
	jtNirOOvlr3SIwK6u46pyhMcwmdBHICdt5t4i92J9+i7UvS8Bv+UOT0agoLVH3PnvRUAiR8pVVY
	x0ggJihBYTw442ohRL648vnhRtxDsRbBrftg8m7lZrjaWOdMdAGplVJXbB3WaRerauuNAcMTAhT
	VjHYUsI6ElXy6EXLg1c9lHzcuh21v/m6ds5HVUVaeStUwGXvIvw47CnqzYiwjRxkfsViOtSKGi1
	DEZxjMSeoSMP/O6RP8JBKIW38i
X-Received: by 2002:a05:620a:17a5:b0:92e:5949:3563 with SMTP id af79cd13be357-92e696e9158mr824508185a.15.1782912342655;
        Wed, 01 Jul 2026 06:25:42 -0700 (PDT)
X-Received: by 2002:a05:620a:17a5:b0:92e:5949:3563 with SMTP id af79cd13be357-92e696e9158mr824502985a.15.1782912342141;
        Wed, 01 Jul 2026 06:25:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b2f70e51dsm4422291fa.16.2026.07.01.06.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 06:25:40 -0700 (PDT)
Date: Wed, 1 Jul 2026 16:25:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Subject: Re: [PATCH v5 11/16] media: iris: update buffer requirements based
 on received info
Message-ID: <cxlhuzzvst3joilbhglxogx5hedqx6esbo3j4o3qzkeevqkrt2@47aaykt6z7yc>
References: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
 <20260616-iris-ar50lt-v5-11-583b42770b6a@oss.qualcomm.com>
 <6f7622c5-2bfe-49f1-ac05-81e33c8bd66a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f7622c5-2bfe-49f1-ac05-81e33c8bd66a@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=dtnrzVg4 c=1 sm=1 tr=0 ts=6a451557 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=3EHR-On4ZTnEfFEao4MA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: XdFun8U4xRRF1lVBYmMw6I0IJDN6HRC_
X-Proofpoint-GUID: XdFun8U4xRRF1lVBYmMw6I0IJDN6HRC_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDEzOSBTYWx0ZWRfX5E6INZA4VhDS
 uUPA9b8pWNjLD0wl0UUrjS+maFh85dQy0bgrLpVLUUG9RyBDkpRcI/KXPcXCLb6d+Os/2Tp/JYa
 V3lmyd58EfT19zgg4W1kl0MzTWfRLIx609j7uil/AyDYmI7rwKkdPszIWcUnXt+rEf0Flyn9vb4
 Zcu7/fecGVNr6E8VtZgLTwwQ0vi+6R+/LLnrFSvfkLkK2Pg+A7YPNuCn2PzIuSNanipxxOuE4C+
 mhFRPaDjJe0eyU3sqyPAXugbgcjhRUTzudwjI4xCZLrcKGPDvT9CEjI1uukEoq0GHXFXQjCGMRD
 tFjZHSbh4aHvjDeX9+7SquRbbZQQAn2DXZ3PjdRZ7m9hB+8NAMP4KfWi28GmS0tUB1Vql2KpsPo
 8U/OTg56HB6DjIMsv51zIIWDWn8rohuQZWtwC8scgw7XqcGwefHZBMeVWqNbETxB5U63vcFT/cO
 bvqcwz/7uw1fU3tqa7g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDEzOSBTYWx0ZWRfX7jYnglHm+mP3
 PEh+MOdoEJetJZsBvosK4Rkfo7DnFgCMOA4b2TAeJpEsKzCMwsB2uVsiTneSk8xmzNLdg7FB/y3
 0FlPc7Ay0GGKwIie5oLtw+PCp10cGvg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010139
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66226-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,47aaykt6z7yc:mid,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 060286EE738

On Wed, Jun 24, 2026 at 01:37:12PM +0530, Vikash Garodia wrote:
> 
> On 6/16/2026 5:34 AM, Dmitry Baryshkov wrote:
> > Upon receiving data for HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS the
> > driver should update buffer sizes and counts from the received data.
> > Implement corresponding functionality updating buffers data. This will
> > be used for upcoming support of AR50Lt platforms with Gen1 firmware.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >   .../platform/qcom/iris/iris_hfi_gen1_response.c    | 75 +++++++++++++++++++++-
> >   1 file changed, 74 insertions(+), 1 deletion(-)

> > +static void iris_hfi_gen1_session_property_info(struct iris_inst *inst, void *packet)
> > +{
> > +	struct hfi_msg_session_property_info_pkt *pkt = packet;
> > +
> > +	if (!pkt->num_properties) {
> > +		dev_err(inst->core->dev, "error, no properties\n");
> > +		goto out;
> > +	}
> > +
> > +	switch (pkt->property) {
> > +	case HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS:
> 
> If i check the venus message parsing logic, it loops through the packet till
> it hits the case.

It doesn't, see hfi_session_prop_info()

> Here, we are assuming the first packet type, in the pkt to
> be the property "HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS". There can be
> multiple properties in the packet, and if
> "HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS" is not the first one, the usecase
> would break with incorrect buffer sizes.
> 
> > +		iris_hfi_gen1_session_buffer_requirements(inst, pkt->data,
> > +							  pkt->shdr.hdr.size - sizeof(*pkt));
> > +		break;
> > +	default:
> > +		dev_warn(inst->core->dev, "unknown property id: %x\n", pkt->property);
> > +	}
> > +
> > +out:
> > +	complete(&inst->completion);
> > +}
> > +
> >   struct iris_hfi_gen1_response_pkt_info {
> >   	u32 pkt;
> >   	u32 pkt_sz;

-- 
With best wishes
Dmitry

