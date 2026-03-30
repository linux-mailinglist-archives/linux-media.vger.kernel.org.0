Return-Path: <linux-media+bounces-57605-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGVwOLNiymn27gUAu9opvQ
	(envelope-from <linux-media+bounces-57605-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 13:46:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7B935A7E5
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 13:46:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3591D302BB9B
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 11:37:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB95E3C5559;
	Mon, 30 Mar 2026 11:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="psJYxnZj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BmjkC3WV"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28383277C9D
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 11:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774870655; cv=none; b=Hrynv07CsENHhR5cJxM4dFD1h1JBmv0A/hvSVQMLoU4E3u+6TmPnBrzmfU89FghhtoGV2xO3FeM2h4pZUqbaLO0BU/B6tG36XHvM/MtM9qCYxZjYHkTYmDTFhIavXOAaTlLwQtqKsT5o0A/T50f2cojYH1yqfU8rz/3jiWWT8Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774870655; c=relaxed/simple;
	bh=NXem4svfbugmXnGLpNgej43KjDUANeET2Fbk+sNr+zg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gys59yVQRXJVW71YYXzvF1bvUyZGGIFChAOisIDbCrZ2m74TWf5fMpSJt5X1xcHixCYgUFawVnUO4zgqHVaFbf1IGiIbozlr4e6ljf+Y6Xry/ArmCWhu5KAXwiImnE+aHo1Cwb9Oz2W/vgaDn5CTto0ibDKuxiv1m+2PK7AdtmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=psJYxnZj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BmjkC3WV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UB3Uac2765461
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 11:37:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=p/ruGGNRKU0g5yns10YX0dig
	SpCelxxQ4SEexeWqaZU=; b=psJYxnZjOYQ1zY2ieQeXs8bGDS4mK7sGo/bkNJaA
	Nqz55XKh0v+uI95NvgXZGXUrfmw7Q5P+0F3/0S6oA6ceXMaSt/53gDZwL+gJSGaw
	jhz1w3X/wU0WlcCKhv10q/Q/xseT1fy9BU9b+xB52MYBx7Ekai8pJ77f59b/D875
	07Mv6YjyrhX8xaPQEOR4jdzVpxKna8jSvyhw1oYq2SFN7inCm1jGRvQd6+d9HB2p
	Pkhk15wthTv+zPTLbDUpkaZlFXpx+8QSZGS5K62tJ+PGhGGoB7opeT/NKg+G6jLM
	MJdDlXOa69TSRdxwmj+g/mCQoM/T0hg07A8IQjD5vbKXUQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6v9c3vvp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 11:37:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4fe4ff7bso179326401cf.0
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 04:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774870652; x=1775475452; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p/ruGGNRKU0g5yns10YX0digSpCelxxQ4SEexeWqaZU=;
        b=BmjkC3WV3PgGKFkyllwKyab0BIY+inmSvE+l/VxCkYdBUmOYOI5okWAUs6J6MnO8iV
         YdpQj8z0iRu0fZv6oZay+WAkFa8MqzfxrDZdlcw5Ehpbqs1IhKLzb/c2q0GQiB16P9A5
         FM79Pm4i++qL01EXMQS/4cZ+G5kr6JnR2/l90nTw/EWLHlrluS3F0gQ7SPfze211kd5K
         //nmtCSW082dv7jvZQSALiMwb3OXH+bWHBVTIag+ZujXj5aiKfUvKmVY/xDP2O/SnvxW
         3LitQVgPw4SeNBTY+hI5Yx1MKEZcesF/ZUXXT/ljhk9u8yIlwvwmjMxAw0MNpo1vC5Yz
         q79A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774870652; x=1775475452;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p/ruGGNRKU0g5yns10YX0digSpCelxxQ4SEexeWqaZU=;
        b=R6ClMNbG11EDl5z/lVcNRZPolpOGaMiB+Y9zxaDEO6vSqWBgwz/Wy7dX/nWlwM1chG
         jbd2RZJQMsqeAgBp0TBjgjJpqXwPDXXPv4rsq7tx79DKYV2nN93GDdQug+rW+vbG2ua5
         tSSw2AaV0aKJ0YQYHOMYQggmcJCHQoAvFYkc9swCD10t70IbQ4Xlbrciq7KfS6XijOpF
         YveEPBuggRLVBmO8/KBZm96SD8nXKW9Opu7d/lIvm8OXvig0kzw+tavhcqVMkxhfxmpU
         jp+SMS0Vg1VKv5uyebvgJ3vznw+Li1VqQbVikfYb29hUyPFykt3vDM/ogdW4Dr4ZnSJo
         X9eQ==
X-Forwarded-Encrypted: i=1; AJvYcCWf4oiPklOY0JR4OY12eQTdlvVt44RyFsragQR2xndqIsJf1vgh5g1jWG5yXBxDIxN+lSRkeZ75lvmrWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwA2Uq++s5ijvMUX3hnyMI1NaLshExKTFU2zs8F5Ia8owq/genk
	IFoBBGl0iX8PFTbvyaOpaZ0yuNOuDTLzrvbQSrES8kmN4PGmSSjVzmUgLdRxfxFgyRKGyCFjnts
	y95UAVm742ljess8Zep3ZcGWadYaclALTOvGsa91msv4Z6Qh/t9bPAcXjedhQZ2zokA==
X-Gm-Gg: ATEYQzwL/mNd4HGcWVVMABjvWJB+FwHzaZTQUOuSOBkR8xRkJ1HKmGkF4WpjKQRsA+h
	YfqJ3xZCwOhJeZ6EAq2wOPrerhFVtk66xU+wqx9oM8s5wlpbU2UKQI/x+pWwvJTG4A7+VIu33PG
	TbqXq6HkU6RT/T+wdfRhKFKuFvlGIzeMe490CXVgFnEgrjsr4RHMgiNO7FZZke2tcNCEq6ouljV
	91YEkx+L7+WfbN65H9nXF6uZz0Ue2qfi3kVbmpi5tbntdTltmc8oix9OzqYkF/ZrXj82hLgcjlj
	qhQs6LsqhQypIq+RO1lfKyRhbJrrNOLGjFcWImVWuZJevBWy60yoEBtQtsuPMIgd0QPEzMhDIUx
	cmN56jjT8fn22/bBSX/sORkjNljOAGz3FwBYQiMLIKC/GQAHj490PAnOvJyZ5IUfzzB7LpaRDgu
	mVUIp1Rhsk2K5bQJaubfkw3X8YawwfPxaNuKg=
X-Received: by 2002:a05:622a:9008:b0:50b:6fbe:62b9 with SMTP id d75a77b69052e-50b994fa11bmr184972151cf.28.1774870652458;
        Mon, 30 Mar 2026 04:37:32 -0700 (PDT)
X-Received: by 2002:a05:622a:9008:b0:50b:6fbe:62b9 with SMTP id d75a77b69052e-50b994fa11bmr184971711cf.28.1774870651876;
        Mon, 30 Mar 2026 04:37:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c838da25dsm15165881fa.31.2026.03.30.04.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 04:37:30 -0700 (PDT)
Date: Mon, 30 Mar 2026 14:37:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: johannes.goede@oss.qualcomm.com
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        vladimir.zapolskiy@linaro.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, robh@kernel.org, krzk+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mchehab@kernel.org
Subject: Re: [RFC PATCH 2/3] media: qcom: camss: Add CAMSS Offline Processing
 Engine driver
Message-ID: <qq43xl3lsv2nq4ngn2hojleddxjmkgwclb2ajek5gvdtgyjltl@3tqg5ydhsxia>
References: <20260323125824.211615-1-loic.poulain@oss.qualcomm.com>
 <m61yNNvSrw6AIq7_-g2h7VQLmGJ_5iCLg5JTlfQDcL5LlBq37ifAeXw-K3AlRBck5Mb4uVQq0pzeBNAybQNk4w==@protonmail.internalid>
 <20260323125824.211615-3-loic.poulain@oss.qualcomm.com>
 <1ba54ec0-be51-4694-a79b-f272e76303d2@kernel.org>
 <X-Lw_zi1o015-V1Cv4dY_ik6SfTB8TTcLmn1l-Ta7UviYTJ6gwMBn4B4ulYwjd_Aetul5xUt0T6ln9E-Hl5h4g==@protonmail.internalid>
 <CAFEp6-3ziXJTYADOFj--rZL5TumroXuW+=SnUQ9XakRxHT-ypg@mail.gmail.com>
 <12194cc0-0960-486c-be7e-1a22d95de340@kernel.org>
 <rj2vb725he4yzfvjifzyxqpbqk5oztfaafp7sg2qes4qz3mlaz@z5dyoqod56d7>
 <7fc31426-3157-49c7-a30d-dcd7b181fcc6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7fc31426-3157-49c7-a30d-dcd7b181fcc6@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA5MSBTYWx0ZWRfX0Wo8r7jRaAsX
 5KXRJMJqEMldFSybdYAXD1sPBYAZ2MCB42J59bUZK5O8vFyq3iwQdY0EsGSCSc/DW3ai0sS94Xj
 oBVeBs3KGL364wxexfiKm3ZSEQ1PJVLsr2+Vve4Ui8q0AAYKK8SIHH5MYnKTjw4ibqeXPRoP9WP
 QN1XmQ+GKDkYU6MCxyH7lpzBtj8yPGqn+TSMT/O8PPwWTOQEgrS1V+luulKi/tuAZe5QjdZ/eIV
 dfKyV914+I4XqmDqK28Jd+yWxLy1F/EbIKOphbjrVeSzOtIYkRNzhmzuXemOoo1LkltGxnKh4cd
 30O8L2aYuPTnImJ7bUZO/Zpc6SG19lorlLFSbp6vJnR6YRFLGLsX9VprW1YUKX4lJcvRdWAB20/
 cchfYklRgIb0OPyFIW7EBGWc5VM30a6H+eJzTfEepsK1igcIp8KJgvKeMSzw4A7vJASUPM48mEW
 S3aPVdlOHcRIDfyy1ZQ==
X-Authority-Analysis: v=2.4 cv=EIQLElZC c=1 sm=1 tr=0 ts=69ca607d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Etol3jrWs0JhqEB7xPMA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: dC2sWtTBlu9rqtXK5j0NcQcHFmmhYbO5
X-Proofpoint-ORIG-GUID: dC2sWtTBlu9rqtXK5j0NcQcHFmmhYbO5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300091
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57605-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6A7B935A7E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 01:06:59PM +0100, johannes.goede@oss.qualcomm.com wrote:
> Hi Dmitry,
> 
> On 24-Mar-26 22:27, Dmitry Baryshkov wrote:
> > On Tue, Mar 24, 2026 at 11:00:21AM +0000, Bryan O'Donoghue wrote:
> >> On 23/03/2026 15:31, Loic Poulain wrote:
> 
> <snip>
> 
> >>> As far as I understand, CDM could also be implemented in a generic way
> >>> within CAMSS, since other CAMSS blocks make use of CDM as well.
> >>> This is something we should discuss further.
> >> My concern is even conservatively if each module adds another 10 ? writes by
> >> the time we get to denoising, sharpening, lens shade correction, those
> >> writes could easily look more like 100.
> >>
> >> What user-space should submit is well documented data-structures which then
> >> get translated into CDM buffers by the OPE and IFE for the various bits of
> >> the pipeline.
> > 
> > I hope here you have accent on the well-documented (ideally some kind of
> > the vendor-independent ABI).
> 
> The plan is to use the new extensible generic v4l2 ISP parameters
> API for this:
> 
> https://docs.kernel.org/6.19/driver-api/media/v4l2-isp.html
> 
> What this does is basically divide the parameter buffer (which
> is just a mmap-able bunch of bytes) into variable sized packets/
> blocks with each block having a small header, with a type field.
> 
> And then we can have say CCMv1 type for the CCM on the OPE and
> if with some future hardware the format of the CCM (say different
> fixpoint format) ever changes we can simply define a new CCMv2
> and then the parameter buffer can be filled with different
> versions of different parameter blocks depending on the hw.
> 
> And on the kernel side there are helpers to parse this, you
> simply pass a list of the types the current hw supports
> + per type data-callback functions.
> 
> And then your CCMv1 or CCMv2 helper will get called with
> the matching parameter-data.

This leads to userspace having to know exact format for each hardware
version, which is not nice. At the very least it should be possible to
accept CCMv1 buffers and covert them to CCMv2 when required.

> 
> So this way we can easily add new hw support without needing
> to change the existing API, we can simply extend the list
> of parameter types as needed.
> 
> Regards,
> 
> Hans
> 

-- 
With best wishes
Dmitry

