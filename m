Return-Path: <linux-media+bounces-54401-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMOhLZVgp2lvhAAAu9opvQ
	(envelope-from <linux-media+bounces-54401-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 23:28:37 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D42E1F7FC1
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 23:28:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1A5C330405FD
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 22:28:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71704372676;
	Tue,  3 Mar 2026 22:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YNkaXJvm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K7R7+f/J"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31C53932EE
	for <linux-media@vger.kernel.org>; Tue,  3 Mar 2026 22:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772576908; cv=none; b=nLJOIyWUfkAiIp3fGrHVSnQhtc5AVlPKthKuuSFin7Qdu47Eye5mingRN415fSvbmMNn4monr+onEIuR8C7iavzucxqqkHvbT1/v3NUXXloJMNsfvdZ4REDVbQ+Leq780BPHcKv/sO6ireEOddIAr8oAIs/t5h1sWcnFJOHD4MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772576908; c=relaxed/simple;
	bh=43ODfSZcUzBQTYKiiCeti8jxSCEV0BXnx0H9eW8/Hls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ow1Nnj8JucQarvMeiRdl+qhoBlBf5FmgLetwiagZLCkxZYIffj86qaSf+0KSJa/M+Eu4QXyckgaINV+sUhQZZem/fLyfvJUNcaJi57qJkwc+PE/627+kKlbctMfKAQnzW2YJwFzdYsfRxVjLKem4iEeCeH9IL5gVm0zl6BCRGmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YNkaXJvm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K7R7+f/J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 623H0TNg3670007
	for <linux-media@vger.kernel.org>; Tue, 3 Mar 2026 22:28:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=P3sf8FAqqEmrZ3kQlF0AcrpG
	0JzllvKYNW2tsVeXgps=; b=YNkaXJvmnUGbWafXGXjdQMr5vwNDktlZkKxbb6o1
	hUKXbEhT/mB5rZw0N3QUQb7/aUJmEpBInMbdafacN+09i5/Pyj1g5HL1GDpJvQTt
	C4WBz6V/e/7DWsm5rajLO4QIsmDP/1cjx7g58N9IOEKVQ7Xk77eFi2BtO59dFw7m
	DpQvhoYNUBbGjJJKG8udmEDe0YjUbkFI/8ebTIZcMs1ioJ9EK7l7eqioMZYdwfPY
	8VBf0lj3naEGfu2BGfp/zR8sH2tI8XTuPHjtTsKxoB+5HeGtmZJPVayTpWCEvUqW
	Fzvia3AdNApZ7jYqIG8Po+HBApGqG2zvO/yiTr+rfq1WqQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnswe38nu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 22:28:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cbb8040f48so4537974385a.0
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 14:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772576906; x=1773181706; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P3sf8FAqqEmrZ3kQlF0AcrpG0JzllvKYNW2tsVeXgps=;
        b=K7R7+f/JATOLO8v/w42BdTvH5ZgwMl38v14nTRD7fhqGgEzAaJrkJhI1lIwR5oJCjZ
         UZRzSr3HqLvG4a4AsGuc5QRYmFowWPiy3S2iKnR5q/EDF5ev9HUmdPEVyG4PUROMuVs6
         S4X5uSVUKTTHOiiqus9S46FGG3lt92ZWq30tdSgGTrigR83epIG2sqlt7a6s1WyNHV1H
         lTHJJzkxcc+l0jV868UjFI1n81mG6nOqScQjal6piH3aTBXass+4zTYh+nqwTyME1uN3
         bIiVVMqjxTzsFgD6ySPQQzszmbkRCJ3PQ/Dhoq0iiC5OflbYM4MeMr0g64Q34Y9SWq8U
         G4Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772576906; x=1773181706;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P3sf8FAqqEmrZ3kQlF0AcrpG0JzllvKYNW2tsVeXgps=;
        b=xPJeZbEF/Fk4bw2Upr2cXhruQyjMaSI0DfX/jH0RwqvLCySBadKm1RCExHP04Ubjon
         xppflLdhJ2ULxWFGG1QLVbStu7iH+fz2Tu7sW9B/zhCa6zpmBukNPuFQvh+P5WLmJId6
         X7lOOogC275ZhSVr/hrmgk0K25hQNNqDPhr8dWw53k/CTJmXbEeXMpVPIIv0X31YRBXa
         /XsmHu/Q2z7Ps+z3/SPCYHavrj8JTZJMHlrPQVWtbreLN7CvB+nANsUIvehzSY94s+oY
         XMUjDRjmZA57LhnkRORMsVfBYy5m6E8k9z+HThxM0PEXN6t+vy7bOKnpj3XcJKmUVPJA
         LCaQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+eAG2aXHlv0cKup6rIqGrT+8Xlpyw9CJClVaUApSsVLfJsnIN0tmA2uHlt++7VofZVQrFp+Oh4Gi5tg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZJGjApqslGHwBAtVO9bMruTaRcADZbGm+bxafxKdc4YKgXEEW
	X7IcCKETGjde2+Ae/qDVejwhQzDUdlA5XySxYbI+3ranU7yUeYdcCxrj+bNp+s8pvWL47FQXYw2
	CgFcnIiGF079c922d8KhOyUg6eEAlFhRi/4JzII9y19a8dGN5Ez/r6VLnmC0lPK2hoA==
X-Gm-Gg: ATEYQzyhnwlRTuMR9KWJQcGrC0MfNyJmt8QktlfKZfqGZYnAbK+hcqSQQhCNN0GpJ7r
	bA/3npPpZ2gNr6hgQKUCdUxRrmpFVih026/zfyipSQbR4j9PavgOLbDVkOb5JO0PI3ukTYfqCRU
	tHGF/EHJs6ErfKiFQWK9QUrs08ZpAGE3HXoai+Gn+hIK0684wJrqIkowf2hQTZmu8Vx8yIHbgzy
	+EaYyh335zuX+9iwF41SF6ieVp7hQk/LKxW1eSAiCCu2cIHe149vaIW+dGqFTKimiJNnbI77+qn
	3zZVJjfX6WfGulPMXitf5YEC4D9cE7wupISE56IXcZzBkb7n9nbP5wmmaDozfyU9retF/tE/Hs3
	roW3ZHF/ZftXH6INznttqBFll9O5j4TYIlXlKb7OMj/opYvHBT8RASz9yeb7SzzhbI92nBBKdYT
	vfyfsxjMNkCgKtkLi+lHFvTa75LJS3BlRZjw8=
X-Received: by 2002:a05:620a:199f:b0:8c5:3256:2f47 with SMTP id af79cd13be357-8cbc8e7885cmr2266681785a.68.1772576906179;
        Tue, 03 Mar 2026 14:28:26 -0800 (PST)
X-Received: by 2002:a05:620a:199f:b0:8c5:3256:2f47 with SMTP id af79cd13be357-8cbc8e7885cmr2266678585a.68.1772576905724;
        Tue, 03 Mar 2026 14:28:25 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a12356ff44sm847928e87.87.2026.03.03.14.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 14:28:25 -0800 (PST)
Date: Wed, 4 Mar 2026 00:28:23 +0200
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
Subject: Re: [PATCH v2 6/7] media: iris: add iris4 specific H265 line buffer
 calculation
Message-ID: <hrjwyqz4r6usqvxhnsvtap4byfu2zvumji6whudda55vuym5yk@u6s4heswm4rc>
References: <20260227-kaanapali-iris-v2-0-850043ac3933@oss.qualcomm.com>
 <20260227-kaanapali-iris-v2-6-850043ac3933@oss.qualcomm.com>
 <cbwz5wtd55enswdi2zvvy3d66nsxlemyzdypheibvljnewmkax@kybx63aveepn>
 <ce80e60e-90ca-415d-83af-4fe2e86ffd91@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ce80e60e-90ca-415d-83af-4fe2e86ffd91@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 8YL-Dn2Kfo3mKXxFJ_QdIENnOBRoYZFC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDE4NSBTYWx0ZWRfX2ggwwLanXb2e
 PR92Gb6IEPJeYznYTJQIgYaeqgJOEr/7OtBuDco6DwNt14iPtcRcsdAXVee05RIvcEyI6Z3Rf6L
 cSM6UsEon8LAyzJAoU+DX6iXZClhtwtM8cpYAL5GsoHegtVQUBfw4W0nRN2xBVaUr1E2AWJGcoo
 TcMo+b8SS6brBWNDAK2yNAOfBPaw/Jsn2AqvzEiKoXMIwSelu4ZdBE9IeeAmXCxi3amFSl0L7GY
 XaDL45AwYvRB/6zLbwNiVsfxqk05paX9yEP5BqXK0NBiOMAVENlLOLADpF10aumllEdVCN5yacZ
 AyO0Za/i8o8BMG9vcv5cN1RX2LQpXDr0R8Yml78+9EgaV5reAx8scJ3fgFbTi96g2OWyrXTz0Rm
 q+YbfflSXgLlhM0xm/phdZLHYOy7avq+kDTmY3B53K04Jr+dFzP43mvsRGwwNQvV6z8isWj8jw5
 cXuvcJxkc2T6K0Yb1Ww==
X-Authority-Analysis: v=2.4 cv=TtHrRTXh c=1 sm=1 tr=0 ts=69a7608b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=l8RJfLSqy8S6moWSJ7UA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 8YL-Dn2Kfo3mKXxFJ_QdIENnOBRoYZFC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-03_03,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030185
X-Rspamd-Queue-Id: 6D42E1F7FC1
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
	TAGGED_FROM(0.00)[bounces-54401-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	SURBL_MULTI_FAIL(0.00)[qualcomm.com:query timed out];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 12:18:58AM +0530, Vikash Garodia wrote:
> 
> On 2/28/2026 1:58 AM, Dmitry Baryshkov wrote:
> > On Fri, Feb 27, 2026 at 07:41:22PM +0530, Vikash Garodia wrote:
> > > The H265 decoder line buffer size calculation for iris4 (VPU4) was
> > > previously reusing the iris3 formula. While this works for most
> > > resolutions, certain configurations require a larger buffer size on
> > > iris4, causing firmware errors during decode. This resolves firmware
> > > failures seen with specific test vectors on kaanapali (iris4), and fixes
> > > the following failing fluster tests
> > > - PICSIZE_C_Bossen_1
> > > - WPP_E_ericsson_MAIN_2
> > 
> > This reminds me of the commit fixing SC7280 support. Should SC7280 or
> > all VPU2.0 platforms also use separate formula?
> > 
> for vpu2, there is already a separate formula

It was more of "do we need separate formulas within vpu2".

> 
> > > 
> > > Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > > Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > > Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > > ---
> > >   drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 51 +++++++++++++++++++++-
> > >   1 file changed, 50 insertions(+), 1 deletion(-)
> > > 

-- 
With best wishes
Dmitry

