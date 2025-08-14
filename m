Return-Path: <linux-media+bounces-39869-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDB4B25C9E
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 09:05:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF95B581709
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 07:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1969A2690F9;
	Thu, 14 Aug 2025 07:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bNNdrRpQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DE02641D8
	for <linux-media@vger.kernel.org>; Thu, 14 Aug 2025 07:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755155088; cv=none; b=C+gxIE018nwIYvNE0IjZ2P+byC5H//bQLdVfLuIRsmsj1ImI5Qm0Mt3CL25OBsboz+yci28Nu4UQLNmcm5+UENV1NdlMJcOlNH+8eALdLH2jQSVmPKsaGIvCwuN5liqQ7dgzuH/iKKlzTCN56TYPMAi1TBLCWQTpBGeS9ByrKsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755155088; c=relaxed/simple;
	bh=OPNvTv++d0Y1DCwMTZqTMCES5f0J/hlk6EFNeyS4hyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HZuXE+DTfmQVZH7xYzHwGc5J0PpXU/wqZRiJP38wZmtlUmydd0hx8kQuVhZH9iHiBAxfdB5TAdmNaQD/gmQd21CTdAVZb9zWMGWzBe0iMY2JI+xoL3lS1XcVWSVLlmYR/mmtlhhHV5D1KPRH4TmAxKxOBmQBP+GigLxnIEIyHOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bNNdrRpQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DMM2qP020811
	for <linux-media@vger.kernel.org>; Thu, 14 Aug 2025 07:04:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZmTgSJksSvRsRHlh4lCCGxN6
	MG1QDdCZK4fWrb5z4Xo=; b=bNNdrRpQzXYPs/ayMZz46oM2FkiixC5Y6AUFBN6+
	Kdm5eGANHD1XRmxt5Mxt06M6At9w1ezphHaBefnK4/CVWQPlL4VjNtTdDzevnpaW
	BsVtgQ+kpAgX1HpSb51ttdWyDiYIedwu09WV7DEVwWnW6q2wyV43XAGH51nwlkGh
	aAqTzsJi8hJv31PJybLHtZpbkU/S0HD0UDub0I34pGIo08kQ1gjUXV3JcHI/ISNm
	q7WgS77xRtdkfzdGvlkutBiV0B0jjClIgIhL4SJSx9iSxdAJ1U+/wWGcsZ+cD4B1
	7qJQ9PVKO+Qk1uAp+n7boW4xV8uh5WZ8Dtl1gJHHDZ9iPw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9sxwyv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 14 Aug 2025 07:04:45 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b109acac47so18595341cf.1
        for <linux-media@vger.kernel.org>; Thu, 14 Aug 2025 00:04:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755155084; x=1755759884;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZmTgSJksSvRsRHlh4lCCGxN6MG1QDdCZK4fWrb5z4Xo=;
        b=nIXRbrULqPyMQEFQHJQbcTwTozOVT8NWGSIl1KZrOnAXe5ldfpXEwZFCvP0rxUKuru
         EYnQy4iRW4UiahMYFd5ivgZsOEnICmnalZGCZj47d6EqoepszjGzuZ86BTEzYDcDfQIG
         O47ncBVsbXFhdvQaXt6IgCAFnjQPMCgpvH30z/hpjFvzVxEFRMjxyQsIosueG248+VJF
         ekqTJO348+t0X3ZpnB9iUOpsCFvZMIgZaW2Lhm+lKVMwpBg5eZBGobSWN19Fd+rI85OJ
         sl6rRxS0F4EJRNNB2BFPsGIHYN4DbQu/tHid8nbn9dqgkAs8MIZ6qwz6BM2AM9Cco35B
         8HKg==
X-Forwarded-Encrypted: i=1; AJvYcCXsg930oo4tjYoNgI9smadiprBRdS64sS3FF9wYzKNFVD/HLGuIi9EGTYmcbhKwgnyhUw6FQ7jj1TNdOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLE81AMcXhTbFcS+ZToIV7/dXoKUIQFNPszFZLxvxjEUpRQQ4U
	S+U1gSxOAhHvN2QsqoVML+CKUSyN16g9N9XZgBTJM9/owwQI6vE8mbgcxEln4rSSMiC5naJ10Nv
	DPs0dDREw/OmhX2PBjJcGAYS2hnZ3VzCYI+8Mql9zIWh92VUhuaGB2t/3l2WYEuhBew==
X-Gm-Gg: ASbGncs/9e8Fh0OnIAXemnXl2xDzlaJvcwpl9SbGgrkGaNBctnJWjLWdg8vRgxCGI+n
	KG8PRGJrZ59hGfIFjy4rB6ms6iZ9ATLiSRcQiflKb4TFzYYk/DGbmfPk3PeD6wnCD4WsmzNU+i6
	C0srTSVTuavSU00Llo+VcIAyxdXDLs6bJmuKRAXiww8VEJI1neqilm/0hY6DceqdP4T2Od4YpD6
	smHSgBYvBKmt7Xfphuk138BVq724THQR7nGZgcvIcKZ92snO4wRa4Xw60eLLQ3Mzrj+OzCSKIDY
	zj10J8zmBKRVEF537ncfI4lf3JiEDMhmTUPR1SULm0dZ53dC1B9XRH5CXGE/rW9veo7rY4uD/Ik
	LMO5yKe1nfJiULWfy7oqHPLM+T3vobLKixSGGfbyIsGlUKxOb6J/L
X-Received: by 2002:a05:622a:50:b0:4b0:863b:f4e6 with SMTP id d75a77b69052e-4b10c3d1082mr18771021cf.14.1755155084568;
        Thu, 14 Aug 2025 00:04:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFf4GMEnU9+DKPNr9nEosmOJfrXRZRGgqiLTRtxITAX9r7U1qxrwlquD8TRJWARcRaI1vnUOw==
X-Received: by 2002:a05:622a:50:b0:4b0:863b:f4e6 with SMTP id d75a77b69052e-4b10c3d1082mr18770701cf.14.1755155084097;
        Thu, 14 Aug 2025 00:04:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cc8592678sm2433329e87.31.2025.08.14.00.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 00:04:43 -0700 (PDT)
Date: Thu, 14 Aug 2025 10:04:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, sumit.semwal@linaro.org,
        christian.koenig@amd.com, thierry.escande@linaro.org,
        quic_vgattupa@quicinc.com, quic_kuiw@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        stable@kernel.org
Subject: Re: [PATCH v3 2/4] misc: fastrpc: Fix fastrpc_map_lookup operation
Message-ID: <nmipsdulp2roagr5g2emrijonc4xkupoqm3vdelaiihy547qlk@yvg4qmg2qgwj>
References: <20250807100420.1163967-1-quic_lxu5@quicinc.com>
 <20250807100420.1163967-3-quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250807100420.1163967-3-quic_lxu5@quicinc.com>
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=689d8a8e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=4xMk_dLyLN26lIRFNMoA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: y0YHELLCoEoM5i24562NthqUEzVDM6NB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfX4rxm5aPAARFe
 0YsU8NtBKPl5Hj80t4uMTAHRoZv8G8s+0f4nFPiVo6TLwo1JQYH9CdHmIohGu1uAHEeQKm9npko
 Va8WewpBPKezCK03ReBUiF7Js1/eIQhNq8ZXukKWpWmXcvV1Qu5QYAmXHAdN3a/RvH/UjmxNsVw
 hBCT4bqtgX2FKjpmC9p18LiS8cup2q0Bf21T67iqvJpJCz9Ibe6pJhB6md0E7zW3DPItTZzVw4S
 ZRauBFfdViZy76iWy4EUKPBrzRSkRASWJHwSWCJnM0P7nyVuFGlAJkAKyzHckyhs9ECfmmkRkZx
 JrRR5Jz0avAQHgxpsk4uKMGXFo/OHokdquxZxrXfFqMRpRl01rmJyLEHnZYdSdjCi14rGZTGLQF
 8B6oEmJ/
X-Proofpoint-GUID: y0YHELLCoEoM5i24562NthqUEzVDM6NB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015

On Thu, Aug 07, 2025 at 03:34:18PM +0530, Ling Xu wrote:
> Fastrpc driver creates maps for user allocated fd buffers. Before
> creating a new map, the map list is checked for any already existing
> maps using map fd. Checking with just map fd is not sufficient as the
> user can pass offsetted buffer with less size when the map is created
> and then a larger size the next time which could result in memory
> issues. Check for dma_buf object also when looking up for the map.
> 
> Fixes: c68cfb718c8f ("misc: fastrpc: Add support for context Invoke method")
> Cc: stable@kernel.org
> Co-developed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

