Return-Path: <linux-media+bounces-44107-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C927BC99C8
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 16:49:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2380B19E0018
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 14:49:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 133C82EA753;
	Thu,  9 Oct 2025 14:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AMPjiVY1"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E7419B5A7
	for <linux-media@vger.kernel.org>; Thu,  9 Oct 2025 14:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760021336; cv=none; b=pyfNRPVwWUGZW8vcnRkx2hd65SiEb2uQeCDAytUB0AZkZjUmSCc1wervBWL2L5ILnscAezALZnSuQzbWJLr/uDsEFaU89wesMdyUWXhAE+A1LNiWVs6wNDbI/D7GtIdvmU3gJZjvPq7tamS1fB2n6yfNEaO5J/VvIC85wbgmlwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760021336; c=relaxed/simple;
	bh=PDfS/sMvB68vOw3mL+A49DJwYJqE6CQQsVYqnK7PdBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IjVVBOS665BZYFok0oqwCh3jhuOvnkVItD0fgopglgbW5iDMR5qnq/YIcIQN4pV3guRI/BwqCFBxKuc2xFQN6kn2tDIJ6GsP1De58WMc4E0zFFQdl39Cua9u7fssHPSNglLk71BpBCG2U/Fpk4TB3OFBWkSrt+WFl07582kqA+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AMPjiVY1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599ELlDQ004359
	for <linux-media@vger.kernel.org>; Thu, 9 Oct 2025 14:48:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sdcvidYHKOiMcWY+FA80ilvZ
	boR7i7iogh2OGbNmJCQ=; b=AMPjiVY1N0EVgRPHTsnWKg58k4BFh2Mr9Cj+taSB
	y5OcnYvbL0Xry4sWUiKQyjZYe6Px9XIyCh/fFjdwhieyk1gGwuZRZ5VG6VCbIJLF
	HSrIC7GPa6ZHCLx6OQTWodRBRfPwNe2uPUZGnaRylLLNY0F/i8Dj6VTfoZHVZLxH
	8lqVOSmVyd5pD/CRptQH1vpvn6SegTMh364IWLgoVAVkpt5PpTxOajqgl7vHgCGm
	cLyb2iKrZm46dkLpe05ww4goFBO8H7XX/n6EeOlQy+kVE2drB+edrCz0NbiXm+2+
	CCYinpvj6x5h2TORtqeVh83NYA7VGemgxDZ7vpJ7GgQfJQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4j391w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 09 Oct 2025 14:48:54 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-54aa7b50e26so528162e0c.0
        for <linux-media@vger.kernel.org>; Thu, 09 Oct 2025 07:48:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760021333; x=1760626133;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sdcvidYHKOiMcWY+FA80ilvZboR7i7iogh2OGbNmJCQ=;
        b=uEoVffsteaqcoT1KYdLNF6DKFCnIbql/yz9lFf6haPZRgCIRfJY7nY3TkCMW9f22sv
         mFiyFvIWFHnYDd2ZybPiOi3Bv5XaPdHMdAwGqJwLAlEQoe+ikoDfJBuq9iQcYJp50Caw
         mimG6qrG6zP8Bu0uX4YFqk6dcmX70iRPkf620708lMa0Q5C5/HaE0HmJh0LVLHVmUYfo
         MxclM4dILp7weYmd5p+yUNmlslN+uDj52r/juaYYdoNOL7BRzgz7XP9kmXL1cLdtDZ0W
         w80Sl1/YQA0fCB4m7O+QGe7KhvOkP6GA9ZTjaNHh2FLOUfD3w19q72Yv0lz5f/3VNM0/
         bUpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPr7ZMTgbtGzGOcXyW1Huu64sjyPo66Kpxr7ONpCIjQ0Ttp2Ma40ZJCxsIaE9p/J+Jzc1h1HUO8jqnfg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlCLlHJVKJ84Q+PqW2lX6AyNyFU8YqPEcEH+w7dr45Au6AuQlQ
	zW8sCUYhTVBUSgS+lGexpixHaK8ueJzlNDUiLMWctgTHXfd5r8PbqytdSaYNl8mDaziEJ9B3c6s
	6UrcjrAca/ZiMXH/vnR4VDnEjI9kc3Ui3h6s0wnGEc0eQBHsddyojmuUgWumm+BINSg==
X-Gm-Gg: ASbGncspFRJiYdwnV66Tp7MnP4BaeO9Agvm+mSPsjD+HLBsxqLkxZXW+6+1KOMkLsP1
	ll/M5XCT11KF7IAMnT9KIHDo5NRGHjadSQOumfizstHDd4sDKmTlWOVAYy1VTZSvzT6iyKrFUcc
	YbTFtV0OS4g2gYNgkrev2HBAomo7NuDZ0OWw6+458luNjqjgnG22/0OxavhkbaQSQmx2qesVZuP
	6F7p362HA5IeUCY/jAX91WV/VjwHpK3hW6V0cjZzIeUh3MvmdZOyjRbgXxuFbd9RCpM1WUiVe8l
	5zqpIRXWJcECcP0IMjH8Vs4bYivdfFaqJqt1KKt96u3TDZpWu1+2kts+WrLm/KnVAB+kUPUuBmF
	zmta7WXI513sDAjq+lfoP7fMs4dqbFN5UQA+EP4jtrztDGukDBWoPr2cgdA==
X-Received: by 2002:a05:6122:8d3:b0:54a:8d5a:a678 with SMTP id 71dfb90a1353d-554b8a9ac98mr3185071e0c.6.1760021333020;
        Thu, 09 Oct 2025 07:48:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrYg2sJ1HiSErx/z+VUowsLWWSTFGC6kpcwvORUTnKFt4+Ob9OBYr9xOs/fUslXCVRuwIehg==
X-Received: by 2002:a05:6122:8d3:b0:54a:8d5a:a678 with SMTP id 71dfb90a1353d-554b8a9ac98mr3185029e0c.6.1760021332353;
        Thu, 09 Oct 2025 07:48:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-375f3b82334sm30008961fa.49.2025.10.09.07.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 07:48:51 -0700 (PDT)
Date: Thu, 9 Oct 2025 17:48:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/8] media: iris: move common register definitions to the
 header
Message-ID: <dzorzudzpjipvlkwik3uylomwi2dy5ticxromzegzgi2jhibot@reqv5ul5ifuc>
References: <20251008-iris-sc7280-v1-0-def050ba5e1f@oss.qualcomm.com>
 <20251008-iris-sc7280-v1-7-def050ba5e1f@oss.qualcomm.com>
 <b7eba4b5-1189-7506-4767-0ef3234fc6f2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7eba4b5-1189-7506-4767-0ef3234fc6f2@oss.qualcomm.com>
X-Proofpoint-GUID: 9sd-bhlUonXpOklwWI5rmYqm2SxjCbQl
X-Proofpoint-ORIG-GUID: 9sd-bhlUonXpOklwWI5rmYqm2SxjCbQl
X-Authority-Analysis: v=2.4 cv=f91FxeyM c=1 sm=1 tr=0 ts=68e7cb56 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Z5nuntwH4KBwj2E1mcEA:9
 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfXzrZg52EmgLXb
 e06SKlRFXutQ1yhM2kAFWZv+j8L8wWF8DE3beOPG1IROD30WMqQetGUmckoNt3lEsqmqGKv8/2m
 9c1qceogta4QUccpBqUMGIQveP5apTAmujijnEzYyKSd8c43Vl1ffmAXF7t5WGBtMkrelta6a0L
 QkRFXqJxzlxLlv4NhfKoLZE5LG+47q7ncYayajvs2scV+SYt/MKcCG5O1GXXwp/PNRV+TK2+rNX
 II5iRTIktLdiR2YbFHwkYra/1DFPaGDfiOBTvci5K41mqXhhJ4oet7W0wVo/pLxyk+iSK6eg+cg
 PtSB5nDr0bT3Dgs5BcQ8lYbKubkuN+cqZmgEQMEXf1aFMKFWW0mTf/RXAX5lDjXsq33JzRkFgR/
 iXlonWYwkY0Bw6gWXLYHaDBlJ1YKLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Thu, Oct 09, 2025 at 11:40:25AM +0530, Dikshita Agarwal wrote:
> 
> 
> On 10/8/2025 10:03 AM, Dmitry Baryshkov wrote:
> > Simplify adding new platforms by moving common registers definitions
> > from VPU 3.x and "common" file to the header with other register
> > defines.
> > 
> 
> Similar to
> https://lore.kernel.org/all/20250925-knp_video-v1-5-e323c0b3c0cd@oss.qualcomm.com/
> ?

Yes, but moving more registers. I can rebase on top of that series if it
lands first. Or I can just pick that patch into the series, to remove
the dependency. What would be yours / Bryan's preference?


-- 
With best wishes
Dmitry

