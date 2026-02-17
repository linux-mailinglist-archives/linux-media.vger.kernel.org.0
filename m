Return-Path: <linux-media+bounces-52986-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBwOJlCUlGm+FgIAu9opvQ
	(envelope-from <linux-media+bounces-52986-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 17:16:16 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4D514DF90
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 17:16:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 48070303F052
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 16:16:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1479B36C592;
	Tue, 17 Feb 2026 16:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oTSWZ7N6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SGGJSg9R"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A128B27A462
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 16:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771344961; cv=none; b=G65X/275lN0ZfFTWllniHU5rqsWhieM7lL7aBftmOvsncclbRhMH/swo0A/4u3CSO0iaCwEvs7PNwLVAfoScvhxd5nXH8hJlBszJoz+XWhwwKrPbB019pe2CvZa3r3XRZpZGgyqg0BrSU6naXxzinlZuSOT8wBkllNcFhxD+7ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771344961; c=relaxed/simple;
	bh=HX0J+uoRNH2k8/RPp9EGYanY5BLz37kOfXHBhLzdSDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b2M1ZUrzJ0s/QWsYNwvYAgUl7DnFw4weYcW14GJRZys8aNFnlK3VL19lVcE0uxZyepa95WsgIu/bqbRrAonO7NwRu9Yr8wlEFITtf3FT3/lUgtaWZKd4qaKA+unII6bPnK+0EuxoNf3/P8MU3HJ1OirCmlYkWF41B+AATgEaHY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oTSWZ7N6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SGGJSg9R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HAkMBu597031
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 16:15:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7EaOk0UZuef/7ty3iD0mim+S
	VVJ5a6pNLO6sSAstrvk=; b=oTSWZ7N6hVFdOte5Mxy2tF0I5cRe2HGmgFJNm9rm
	3BhTr5otrNCswm3QHCwHPqG8IkgX1U22EdXRbSNpt5S8Yy1iQVx4LtUMNRDFcb7F
	ug2DhcGcBkwLm4RMimspKzOae7lflrylSM+DdjSUnDXQ+sXFptsl59exOh/qzgNB
	pfIIZtmeMHuciw+fDR9lgQlfgsnBq27q+e2gWyM9+WvtxH3x61r/35Yg+cM6Ct2+
	snj6FPWLGT/NuJR/H+2V2dzC5esuDQNOvWBpLdcwRj89LR9JlXeh9yxF6dOvwxMs
	YQ6du10pwwB4MA3OwPPQJNrwejazndrtbbRgQeyOH0gYOg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cca362gx1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 16:15:58 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5670e5d30f0so50773524e0c.0
        for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 08:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771344958; x=1771949758; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7EaOk0UZuef/7ty3iD0mim+SVVJ5a6pNLO6sSAstrvk=;
        b=SGGJSg9R9HhKMIM96yDKtTPWenoTJXaRvBlYoUsVwgJfIybwfXOQCcL8ivDbYW0xEH
         8FxtF/mEsVz5sREyW5e4ge6E3mkU+kj4TeSCckcts8qqo5nm9b/Zvya3PubSZuYSjo9L
         7FgAZ3rV0NWTSbnPe0+c9pPy3btZ0Y9rGlvBOw0lGHCOthRwxdVG5VyvR5vBMJoNwCS2
         ktOsM2ax/d0vMwDZKnfVfl11SokvjofObEmNY5NcJv5JGjgdQpTRSDoFsg1bTczj63a+
         /gggAjb72VbgpvWGcM/twCL31V18JLcdGaGL96Vb6+JWS83RI0dvY5GDeVIK5HRwitXe
         CA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771344958; x=1771949758;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7EaOk0UZuef/7ty3iD0mim+SVVJ5a6pNLO6sSAstrvk=;
        b=bHTCZRa/oT3KMmaqeAunSlT1UF6d/ABdThrwObdH8FE34olXOEIv/DSMFGB8VjFlBK
         3HcRzuX0v4BsaOgeQcI/Pgg8P6Ez+85UDQ5LP4I9GFF8EFRS7kIrVylKMlNJpUoETyBu
         ETotQNNJL1vf9N7Zreaz7mJIfJxz9Cen/ypLqWEtD1AsnGHF272ATElZfKuMFdyh1pQB
         Fv1xRgBZb1qh2SzaobGK0wP53+wLW7R1lSeMKTn51+0SLJ8RBViCsg/ZozuAWC34byrY
         EV1dHZy8hw7UoDsslDsn+cMbdtR8wqhO3F7EJ3UJAwpEzxasz4MgFxApTtC/iDDPfhbB
         Ms1A==
X-Forwarded-Encrypted: i=1; AJvYcCW0lI2eloCdWtXVnBhYvtEnFrv+0dNIGTsOTqvWozZMxSxLwqpczNQgKGOhD6Q9Hcv2TQCGhNhCtW6UoA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwU1D2y5qxQRIZB1aCazMhE+/aavdx/pn37CBxgoAnHx6xWV23N
	u5nepkQ9hNdacnvFs9ERup5iby9Zq3MxgQYGMwB53lHG/s4nMS9umDDp46PYfhBKlw7OV/8qFvb
	oWwOYYX4FlxWvP9nbXjerUw6U4K/b5dV2SKTgAqGA5WuvXnxOV3ouZJqHw/bY9oqQlg==
X-Gm-Gg: AZuq6aJyfjKJ/8ZJMb09eW0obAjq8aRIlVjsKnACHzehONMBL8mZLSbNk4Qp44lXyTJ
	z64EPExgmWwy6m22tJGOqG0NO4cXUZhT3Qpfb/1bftPDPjsK0mUL+GswalHi95yteF8fIo8Swym
	J7ugpAseSUoB4DiBEI7v4rfXYJdCUM9MC/rm8LyOHo73x/AP5P2mu+JsjxL9z0R8PNzsOMJrwhM
	/9bKOI14N0LLOWkiKr/z5yKjhXnWWZnHXkDe5IZVaVAOlSKAif6K9YpnUHzPUyjt2RXnFcraEUe
	6XTr4Q/3eHjoLQH4SBRZ8Kf39ypickIs861FwhAsQEq9kgYpetzJfl5H0dKwEOutxEPa+ZBzlO4
	E+VZ5BjB/zNr9EL6DibzaLZdGdIV+RABNqO8BYvCweXB5GPbJFmFkHPx4fKrpgqN7tQUXYuP5vA
	p45S8sgSNBmHDvSLMcyzSWhqkD6h2WKQBcDUs=
X-Received: by 2002:a05:6122:1313:b0:567:2200:a6d6 with SMTP id 71dfb90a1353d-567cda4b676mr4349340e0c.7.1771344957708;
        Tue, 17 Feb 2026 08:15:57 -0800 (PST)
X-Received: by 2002:a05:6122:1313:b0:567:2200:a6d6 with SMTP id 71dfb90a1353d-567cda4b676mr4349214e0c.7.1771344955719;
        Tue, 17 Feb 2026 08:15:55 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e64cf63eesm3295556e87.18.2026.02.17.08.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 08:15:54 -0800 (PST)
Date: Tue, 17 Feb 2026 18:15:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH 1/7] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
Message-ID: <logrdwafmqpfjoxyk7aqs3ahb2qhgqrtcxjkvtclxopkxqvrbh@q5zq46wxyrsq>
References: <20260126-kaanapali-iris-v1-0-e2646246bfc1@oss.qualcomm.com>
 <20260126-kaanapali-iris-v1-1-e2646246bfc1@oss.qualcomm.com>
 <r642meaclfme7thmb6spkna6xiuhbjuqw6x32jndjqhwqjtbbr@qkcziz3cyxb6>
 <b5ac0ab7-2540-4691-99b8-18d67ac63717@oss.qualcomm.com>
 <dhcsnc6y2r2bcjlc54ebo2hakc4tufub6f4oluqq6etjzdlas2@ggwzwoz24kjc>
 <5170c5df-e22e-46c0-9713-3c4e7bbdbf63@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5170c5df-e22e-46c0-9713-3c4e7bbdbf63@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDEzMiBTYWx0ZWRfX5EiWYbtF1CFI
 +azaemYz4lc+HjlbdoJYruyrMf4YJ+3u7Qy4Nhn0mkOYG6DMPLFVm3iQ8OOyVRquk7fhYTgBdLH
 iQzy6smnbuhUDqBZ4mDwHshaJyRICJJ803CRM9Cxgm/rx2Q3FvOuY1zkhDW25YEhwzwcP8at6Xn
 Mw4gIShhRtEjXn6x91qO2fUIkhrkeBquwQBn/rXhf/x0oasgNqDhGt1Df4SMoSYlZFXUYkBtoir
 LDpjJjLW4ygb3cYo24XaiRkPhTYAK9lAfAqMMyPAPx4FGXXVyQm8nRLkwZ3JviBQLyM8/hdNIWe
 xlJ594hqpryLVcwZhvRR6zr8XJyxL0XOwbG3hRUuMo/D3kuTwcDX9RBo8IwaExhjd0fvOUBavSN
 k7dFk3u4So8ISuWSYQWfC2qyKXVmvNisuNHKLNDwEmgUMowxWsT9+ImPxlerluT32A8GaSo/WMH
 W+6Y5kLqKtXSDHcfvqw==
X-Authority-Analysis: v=2.4 cv=b+G/I9Gx c=1 sm=1 tr=0 ts=6994943e cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=rnrFY7iE3EE6iVj7r28A:9 a=CjuIK1q_8ugA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: k44PQ0D51DbwL9lzkBUjP9eIb3RaU_qm
X-Proofpoint-ORIG-GUID: k44PQ0D51DbwL9lzkBUjP9eIb3RaU_qm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_02,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170132
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52986-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EF4D514DF90
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 09:04:52PM +0530, Vikash Garodia wrote:
> 
> On 2/17/2026 8:06 PM, Dmitry Baryshkov wrote:
> > On Tue, Feb 17, 2026 at 07:13:39PM +0530, Vikash Garodia wrote:
> > > 
> > > On 1/27/2026 8:39 PM, Dmitry Baryshkov wrote:
> > > > On Mon, Jan 26, 2026 at 05:55:44PM +0530, Vikash Garodia wrote:
> > > > > Kaanapali SOC brings in the new generation of video IP i.e iris4. When
> > > > > compared to previous generation, iris3x, it has,
> > > > > - separate power domains for stream and pixel processing hardware blocks
> > > > >     (bse and vpp).
> > > > > - additional power domain for apv codec.
> > > > > - power domains for individual pipes (VPPx).
> > > > > - different clocks and reset lines.
> > > > > 
> > > > > iommu-map include all the different stream-ids which can be possibly
> > > > > generated by vpu4 hardware.
> > > > 
> > > > It's not how it can be defined.
> > > 
> > > Do you mean to elaborate the different entries within iommu-map or to
> > > elaborate the different stream ids and how they are grouped into different
> > > functions ?
> > 
> > The comment was sent three weeks ago.
> 
> yeah, if you could still recollect, you can comment.

I think it was more about 'stream IDs for pixel, secure, no-pixel,
firmware, buffers, non-buffers and direct insight into the VPU memory'
(pure example, as you can guess).

> 
> > 
> > > 
> > > > 
> > > > > 
> > > > > Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > > > > ---
> > > > >    .../bindings/media/qcom,kaanapali-iris.yaml        | 234 +++++++++++++++++++++
> > > > >    1 file changed, 234 insertions(+)
> > > > > 
> > > > > +
> > > > > +  iommu-map: true
> > > > 
> > > > This is totally underspecifified.
> > > 
> > > oneof would be a better approach describing the possible stream-ids.
> > 
> > oneOf of what? It is items with the definition of each item.
> 
> something like below,
> 
> properties:
>   iommu-map:
>     description: |
>       List of IOMMU stream IDs corresponding to hardware function IDs.
>       The number of entries depends on the SoC variant.

Do we again have a story of variable number of entries for the single
Kaanapali platform?

>     type: array
>     oneOf:
>       - minItems: 8
>         maxItems: 8
>         items:
>           type: integer
>           description: IOMMU stream IDs
> 
>       - minItems: 9
>         maxItems: 9
>         items:
>           type: integer
>           description: IOMMU stream IDs
> > 
> > > 
> > > > 
> > > > > +
> > > > > +  memory-region:
> > > > > +    maxItems: 1
> > > > > +
> > > > 
> > > > > +
> > > > > +        iommu-map = <0x100 &apps_smmu 0x1940 0x0 0x1>,
> > > > > +                    <0x100 &apps_smmu 0x1a20 0x0 0x1>,
> > > > > +                    <0x100 &apps_smmu 0x1944 0x0 0x1>,
> > > > > +                    <0x101 &apps_smmu 0x1943 0x0 0x1>,
> > > > > +                    <0x200 &apps_smmu 0x1941 0x0 0x1>,
> > > > > +                    <0x200 &apps_smmu 0x1a21 0x0 0x1>,
> > > > > +                    <0x201 &apps_smmu 0x1945 0x0 0x1>,
> > > > > +                    <0x202 &apps_smmu 0x1946 0x0 0x1>,
> > > > > +                    <0x300 &apps_smmu 0x1a22 0x0 0x1>;
> > > > 
> > > > #define the functions in the ABI, provide them in the bindings.
> > > 
> > > Ack. will introduce a new header at [1] and define these functions
> > > 
> > > [1] https://github.com/torvalds/linux/tree/master/include/dt-bindings/media
> > > 
> > > Regards,
> > > Vikash
> > > 
> > > > 
> > > > > +
> > > > 
> > > 
> > 
> 

-- 
With best wishes
Dmitry

