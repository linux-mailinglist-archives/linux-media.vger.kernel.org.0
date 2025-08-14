Return-Path: <linux-media+bounces-39868-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3F0B25C8A
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 09:04:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9AA1720215
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 07:03:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49983263F43;
	Thu, 14 Aug 2025 07:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n1cxzIob"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD6322DA08
	for <linux-media@vger.kernel.org>; Thu, 14 Aug 2025 07:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755155029; cv=none; b=ONH+hV2QOE1AB4tyCUT6KARx/lO3ZIw8i/jOVPNLfeDz+853WmecbmfNLhjVp/oI+tDk5c/1+VR9Iz0gfzSdeRMgHXQ9JQbOjvDQfGd1rOwRe6NBNSDseFCwqn9eikZQwT+qDBpw13JrK/mUx4b9M3d3oPpKkUsR1hHigm+DD7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755155029; c=relaxed/simple;
	bh=c07bFBd3mXLkwBPutavl3gY6ldyjnpLHHq/cXaQN2Zc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c1OauVRbXOcNmRBnkMayhQfi/lLbnVoQ7743pl5Jo2qEjg0CURE173pACnALvwBMc8JU6lZ7iwKp4IaDq9r6Pvq58DZDaSLL/iYkNB5rV6r5rn4vTws7Yt32l6DohaeZdQL7BKX349JRNjjoM3uhIuIYkywr+t5sum9tdKP6wxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n1cxzIob; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DLZIOA012188
	for <linux-media@vger.kernel.org>; Thu, 14 Aug 2025 07:03:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LF4IE+UwqtQfgx5vOm9pwD60
	Wb8Rm7zswbtxjHM+xig=; b=n1cxzIob5U5KJR2OWy/pE3dMoARe+ewMjBiKHBbx
	SzWOvMOscxaJTezwTN4nlDLQWVJab1jOhoNFyuaknnh8vT+ZvKNLQLo6fVIJCjtC
	SP0VN19y+Bo4SoM8ig2Fw/2K8OB8T/UAng0+68LGzVFUK0cGDYj5yBk21RY5jQT4
	4sTEfSB1wAdFhMW7GVTzXHm98SdGPe0c08yxa+NUMAO02QFLdSzhLLB/ImqKQuy1
	D7ZSqUiH/3o0az8ItkSnpOUTP2Q6HJIuR69ttfj9u39kIFoFcjjZAJgaMcyp3EG/
	fgDjsXv4u3fDWQmpmQXReqMNm5F0ztFcgP2uONlTJOIeQw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhxcuta-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 14 Aug 2025 07:03:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b10ab0062aso14658281cf.1
        for <linux-media@vger.kernel.org>; Thu, 14 Aug 2025 00:03:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755155026; x=1755759826;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LF4IE+UwqtQfgx5vOm9pwD60Wb8Rm7zswbtxjHM+xig=;
        b=AdB2fZadRhxsNkOMVro2kRt5W65xVBw3EXWCwAZnDXyVXomJmFs4MuEATTZ3TUUMgq
         lehJYXqB/XBbezUXmF0OKieCDzJsgIVLIWJnlWlelybfgo/bX0O00YwrO9yKdyeCwL0p
         B59FzGKEsbgtO1JTjBQmEszI5rsZin4+8icKBN5TTAn50BYzYc2t24cgp1fqpRuELIGO
         Y7XkMp7lI3tR0995olSdvzUkyGMQ0x3cX1AhrN9CgPXA7lZwA+fx7NHc3RlZSqKIQjR5
         41ZLyi2WKHrIWqOKmGLgZtAjAWvHlLpyfxAPwcj5p4JpT0jhyE9gkhCHHrj/8LxkGc2E
         FT/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVHyLVvzN6q2tPJ1oYLo9D+MxpZAGL9mYN5M3F6bc+mPQTHu6iV3MnkjQy0Kz/YbYMtZPPPColcYBJZuA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9+Od6kNaqZw9M6jw8Ya2zhDBtiW4MP6wjyilW8B/rknnSncEG
	wi7i4tiTzvmAIUYatreHs8Hm6hfykvWv7QqBAAo8x8Ec+PeijpaO7XJSOi4aAdmvZmEsVWo+zKd
	DAte2gK2XOm2KqJHh+eediUlk8pvxJyPEWoHHmMI5GeWwUADEHAHuYGELX9EJanMqgg==
X-Gm-Gg: ASbGncv33Og2MA+stHVtyhFPDdJG6ZszHz3AhQGG9qn5OwxtwtKIsbRbcFEV5JkLPIn
	8fagXKCJOX1FcXQPCFYEIqB0LDoAqfqnBDysDdbb4pnudCyiQbstn/ZdS/JKxxgf20mAxXmQNtV
	DpjzND1uOLQp9ZGu5sxUV/q5fpUHhlpJ7p5ANqD/ollxKPfMA0MJEPPcR8BPa8kVI84VkM5PnzC
	zUPPy7UKJ7uUz6iLuT91xo9qBxfbFMmOCdQWHaw67g6mHmPtiF9VNRsfAdSLEun/Cu5Q0+fljJr
	Z5vdN8Nrrnpad/Xh1dqoeTD5VpsRZTU9gus1LgIqzUjNjCdOIVQKGMtFRWI/wqNdK+7jcL7l1bP
	ddKNTm0N7gvTKhXhkh/04IqNpE9dEt2OibqV59E+hZ9pqAloIMfrs
X-Received: by 2002:ac8:7e95:0:b0:4ab:b1d5:3b77 with SMTP id d75a77b69052e-4b10ac12fb0mr31956351cf.45.1755155026246;
        Thu, 14 Aug 2025 00:03:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGb9AznY1bE/2T3os5xRxJ28Ngs1U0GfsgKPw61bINS+BdKmMzoT7z6J2yBVZFHfwcAp5+2vg==
X-Received: by 2002:ac8:7e95:0:b0:4ab:b1d5:3b77 with SMTP id d75a77b69052e-4b10ac12fb0mr31955861cf.45.1755155025816;
        Thu, 14 Aug 2025 00:03:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cca1ae1acsm2393274e87.4.2025.08.14.00.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 00:03:44 -0700 (PDT)
Date: Thu, 14 Aug 2025 10:03:43 +0300
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
Subject: Re: [PATCH v3 4/4] misc: fastrpc: Skip reference for DMA handles
Message-ID: <eyqm52g3oymidbylo2jp4uihp7luwhoet2sj5oxoz52bcsnhhx@vusta6qaws3t>
References: <20250807100420.1163967-1-quic_lxu5@quicinc.com>
 <20250807100420.1163967-5-quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250807100420.1163967-5-quic_lxu5@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfX89FrpgTMvjMA
 KKfj5FmCkt68ikVulB/9Zr8Io7jszOnW56w17Y2Ug45DSf3uDoxTRmHnFfBY9C0NNClaSuHd1LX
 3f9Z6FIrIAZP6xTZe2gJhkGtCBiXYVhe5UXx2X1EQZbc4eSkxIz4AZxGLJlJXl51UArKEPXix2K
 Ve4IKbtu2YbGm6Moq5T+kQdmd46QZRVcSM3Uah/J8M0nIjQgQcgQJmOLMoWhSUpxltCsxX/xual
 nviJvl9Ztx2FzXLGNy6Nm46ge78aNrfDh7R6HiMY25W+dg0ShTE6HfG9mfOJFpH42ukJRJqhjJI
 DPdQhk0W5Gy9cPmSgU03f2yk3OPV3gKsqfivrqfBS9vrzXd5zlm2lydXqXM2qDbqonD86RJg3sF
 N9r51bOM
X-Proofpoint-GUID: 5LfNui_2Bxmgh_7W8NDVPdKYyBGuXyDb
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=689d8a53 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=7U_eyDcXjddG1dUirncA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 5LfNui_2Bxmgh_7W8NDVPdKYyBGuXyDb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057

On Thu, Aug 07, 2025 at 03:34:20PM +0530, Ling Xu wrote:
> If multiple dma handles are passed with same fd over a remote call
> the kernel driver takes a reference and expects that put for the
> map will be called as many times to free the map. But DSP only
> updates the fd one time in the fd list when the DSP refcount
> goes to zero and hence kernel make put call only once for the
> fd. This can cause SMMU fault issue as the same fd can be used
> in future for some other call.
> 
> Fixes: 35a82b87135d ("misc: fastrpc: Add dma handle implementation")
> Cc: stable@kernel.org
> Co-developed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 45 +++++++++++++++++++++++++-----------------
>  1 file changed, 27 insertions(+), 18 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

