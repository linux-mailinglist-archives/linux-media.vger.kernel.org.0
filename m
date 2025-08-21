Return-Path: <linux-media+bounces-40647-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 263E7B3014B
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 19:42:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E0433A080A
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 17:42:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05A6D33A006;
	Thu, 21 Aug 2025 17:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V0Dvt41u"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C32933A00A
	for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 17:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755798120; cv=none; b=jm5J66KIX9rIMmd6M5v7Q+QZ+8glgdptYdtmw3MeF1n1SFiv2wATTiNsz2Rd05W4fMRGcEJ+hJh6fyWy8Sbc8RMkQnIWwKW1cda8VBGZJUYdfr0/Uo4vjP+yg1z6WhUZmbOsIDUu2Kk1P/pUVfTVcDnzWz0KjxY3WH2mT6sPcH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755798120; c=relaxed/simple;
	bh=XBftF9vVc+3tI637KCJfSWq0zNEkjwcRWENx/cHOE2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kyuOE6+2HD6ayubfJIumqmAI93naSTamUUsz4AeBkQekCD0GeALxWFCN2oen+V+ZTkzXG85o8XSWkkf89KOzNc98w5rd6SWOT3gjddF0Z0Cd66WgCo6A2Bflaj/jvkfNTrzyKE/mFWtO/W//QCg3CBpyb3SWkoNJB2+UORQMtvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V0Dvt41u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9b6Mw024138
	for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 17:41:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vnEqxJRQCtDvyZhU8tZMvU5d
	wwDJJ2c4l8Yh2cwd+34=; b=V0Dvt41uAXkDUDCxunJOHnebnpVu9uq2hh6nCdhb
	pWT9TCfCpRbXlfb+KNubBSXwayz+EHjSbF3N1jYZofM9GCbY59/jqCbWGj5DtcR1
	EF52rn/TimZTwqEn6fiiQuCCKY2zhASfgtlV2saMXPI5VTIrVMXZmufVsmHX0eW4
	5Ri3m0XD5I1+aAan/gu78y+2ELeVn2hXgysWoFeqea9/pdy3+GdEzWqyB8RT737x
	ywyK7YighTfrdFKHuUStCB1m8LLYYq+BLV6ih5gdb3vn7ND79xDa9SBahWMr3QmI
	bHtIQF/9JNYajuNjtwc0i716U050zswGujdij0YyX2UT9w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52aec8r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 17:41:58 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-76e2e614c60so1144949b3a.0
        for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 10:41:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755798117; x=1756402917;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vnEqxJRQCtDvyZhU8tZMvU5dwwDJJ2c4l8Yh2cwd+34=;
        b=j5RGvqL/qIywznyh341ZlCITHUPKwwpH5fWR+uRf8cG/bR0ISxBOas6r4UMRn1lXbh
         eYcdanWAukS+l0OMeudHJYL1VmxbOo4NgAqIdqZlXRznJnQyWH5x9HMBdL4LWoUpnwoZ
         88Zw/QQm5mWdzAD86CoprNESmQgv3Td8FxX3S+MxwigNOt6e6XqWDwkMZRaelpUsSB7A
         7gUr+w48xipu3/hNbidKPAx+/Wb4imiVnQe6jh57wRednrzFyol8f5UifbD6x7eHH/gF
         nFBuEOoAfNbibZCX9X+NlDVnPbd7wgyIG7KOewjFqOdzBqFYyhRAkvNqn5GcX1ri743J
         6KGg==
X-Forwarded-Encrypted: i=1; AJvYcCVaTJ0K41547p81URBM/cNBkqPvVkJNC6Rg8OAqhOFIUnrYgaSqRB4jvTbQVAQcnnAqbZar9wHHXs5VyA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu9lttMfk/lcx+EbvwVPs7E7dCGMeQH1DudzUCfZ12fbzxxreo
	p5LoO25drS3nucuws0/u0lcsWIxirGie/F8v7O2dAscEHy6+8Z5WFlxeuvzgCxYMLFhYTyspyrk
	4SuKDM89GDet2MeehCwqsrmJYpCYci8NQJN4IUE+5FWbQwbR5F5eSp9Gj0BfcvB0TEQ==
X-Gm-Gg: ASbGncs3bpW/rM9YkwOVm1Hv4aE0SjOz4vr5nKsjnR1lF41SRFqLlMJoBVyS+T32yxG
	xQhrtCGViR6zaB3+cxUaF6tlEwiwA6C6/Bi34wGfZfzCnm5eH5RrHZaLIgCIclVPuG0oDXBck9X
	nRibSw81vfQNkqCUbK0HME3mVQsuMDP94gixIcaQrwRz3oldwdD7gZRda29irWnMbrvHcU2N8H2
	FrBqEBZuNalau2jdOP4latgSR/psy1VBBIfFR9Pg2zDR/FoUfyM7/4GDvS8O60U+vrocI0v9QC+
	Nm7eZzNF8GhDR9F2NnXV0B8+m28KvIA+FmYTaxUe9C5iGux8Nfe9D0g//mjsgvGjuDo=
X-Received: by 2002:a05:6a00:1954:b0:76e:885a:c344 with SMTP id d2e1a72fcca58-7702fad491bmr269145b3a.26.1755798117294;
        Thu, 21 Aug 2025 10:41:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfoEcLMlYe+1GtBuuKraB9VKo/91uiHzpZAtRimt8UXekxp8zN/Lsk57SdrJhUm494lfaFIQ==
X-Received: by 2002:a05:6a00:1954:b0:76e:885a:c344 with SMTP id d2e1a72fcca58-7702fad491bmr269125b3a.26.1755798116849;
        Thu, 21 Aug 2025 10:41:56 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e830d3558sm8032826b3a.75.2025.08.21.10.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 10:41:56 -0700 (PDT)
Date: Thu, 21 Aug 2025 23:11:49 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 09/11] remoteproc: pas: Extend parse_fw callback to
 parse resource table
Message-ID: <20250821174149.d2iktj5tovw5d3ku@hu-mojha-hyd.qualcomm.com>
Mail-Followup-To: Krzysztof Kozlowski <krzk@kernel.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <20250819165447.4149674-10-mukesh.ojha@oss.qualcomm.com>
 <aKWI-izL5BooL61p@linaro.org>
 <da22b26a-99da-4dae-9c46-2f871e45faa6@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da22b26a-99da-4dae-9c46-2f871e45faa6@kernel.org>
X-Proofpoint-ORIG-GUID: RqxHXyqeyd_psyORfecKdGeqVsWJJs40
X-Authority-Analysis: v=2.4 cv=B83gEOtM c=1 sm=1 tr=0 ts=68a75a66 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=Zwf0W_gy_zjNHVC9GZEA:9
 a=CjuIK1q_8ugA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: RqxHXyqeyd_psyORfecKdGeqVsWJJs40
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX3QHFB0fNAej9
 cXde8QTd8xPsXYUXnGPiJDRTRcM60drbsW32xV9MxMt/GxMaBUBvKORAKXgbY9XEb2hdQyeiVsW
 sTXsRqlniWdoZP3MgmxXLJ9vOL6mZfoW/wsOLi/7v/YXU5K8/DBAYpYPoa+ZxjiJHVrBx3atZrN
 bENenxHw5zwTfZgREZ4tAoBkriRUuu3yoxaXGhpc1r9SkP5/e6THlyWoShCtHnUXPaXldkRnaqU
 G+/g5JYXtsdJHawLv7NYkUTgJKpaSd+NUrjK+AcUM18PECocQctnlNbdbi5BR8M4uzEy4u/rJ/F
 ewyTFAvqNKz40tJtythkkFklZUrYYq8ElWjxCcJwEUWEtr8ROgL2y83tA1JSliOsDjjy6fdWdZb
 Xr1Va5ylLLra5wUp5JhCgvYKocwlHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Thu, Aug 21, 2025 at 04:49:39PM +0200, Krzysztof Kozlowski wrote:
> On 20/08/2025 10:36, Stephan Gerhold wrote:
> >>  #include <linux/slab.h>
> >>  #include <linux/soc/qcom/mdt_loader.h>
> >>  
> >> -#define MAX_RSCTABLE_SIZE	SZ_16K;
> > 
> > I'm confused why there is a semicolon here suddenly. Did you edit this
> > patch by hand?
> > 
> > Applying: remoteproc: pas: Extend parse_fw callback to parse resource table
> > Patch failed at 0009 remoteproc: pas: Extend parse_fw callback to parse resource table
> > error: patch failed: drivers/soc/qcom/mdt_loader.c:22
> > error: drivers/soc/qcom/mdt_loader.c: patch does not apply
> 
> 
> This is very, very odd process. Editing patches POST format-patch or
> post b4 (wut?) is a serious warning sign.
> 
> Few commit msgs also bring attention to possibility of AI, therefore
> please clarify:
> 
> Did you use AI tools (qcom internal, external, any LLM/AI related tools)
> when writing that code, formatting it or creating this patchset?
> 
> This is very important, as it create might create legal risk and
> everyone should be aware of it.

Again, I already accepted my mistakes of editing(removing ;) 8/11 patch
once I checked minor checkpatch warning on it and will not do it again.

And again, I don't use any of such tools, and hopeful it clarifies.

> 
> Best regards,
> Krzysztof
> 

-- 
-Mukesh Ojha

