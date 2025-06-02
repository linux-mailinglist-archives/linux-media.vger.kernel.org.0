Return-Path: <linux-media+bounces-33867-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2602DACA955
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 08:14:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D454F17A54B
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 06:14:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E706E194A44;
	Mon,  2 Jun 2025 06:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V7vtTMST"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07E02F24
	for <linux-media@vger.kernel.org>; Mon,  2 Jun 2025 06:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748844863; cv=none; b=R+Pf4Jej5FEaFmuQKlbZV+6Y15HebTM1z9Z8u2ONX+bKv31jNWu8Z6RQffVRsSLVOPpkh7rtx5oRWqkMBuRVwyriKF1tZTcm27SwlpoWhNFT2drFNCC70LEhVQeKtCY9EMKlEFwLK8rH6xPRU68ZQrKkFZcgWeUuYAQp2j2065U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748844863; c=relaxed/simple;
	bh=yfDMLKTywq1rgMhTpI3zIvk32bTPAbLabXGgDUmWeVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X+Qqxg/oN6TjJy2Eh1c6mf6VvjgbM4RSCwVhCZ4ur0t7iegR8L4kVHDNhvaBGNzBqLl6m9bTV3+Pa1EC4Di9wQ9X7Jx9CzxEQ+ZmoPMmRWTu/aRLzsPJ8CingGqV0X0/blDJ9qFAru5vKXxjQXo2T2Jy9ujZB3qKShRHF9UDDMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V7vtTMST; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 551NKmLI019787
	for <linux-media@vger.kernel.org>; Mon, 2 Jun 2025 06:14:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=flmDUdRzTSdQ3XB1WaSuNgXC
	/xzzeHQUFd3cOSxNmi8=; b=V7vtTMSTMwAUZ9hMvxn/zls9XMsTDaNXheuveFRg
	WJkaCRzloXG/wxQ8s4VNzQHIlkphpx1KZActvR3PnZxIBCLCNPpMGw3+gMENCnzK
	AhmVVBOgnVIL21Njy5kQfLH8dMgn+yXmK7OxEiJiLYzn2Ddwl+1UkzNUoq9CX3LI
	4RGEJEMdG5OBLRpS5CIIQ+jWvY0+35az3kdD7k6Uw9N0vInNQRG44CmEN2UCfyfm
	xv8X+JfxrTpWxvzN9EdWFfUR5YE6xrwEiQopf+bUSyQ9RLp/17Ty+f26wIP78kCO
	sCex+YDtanz0SwHxQXnWhrMzcLEyYuOcqa3/P42TkYKRPA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46yu2a3h7v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Jun 2025 06:14:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c790dc38b4so710259785a.0
        for <linux-media@vger.kernel.org>; Sun, 01 Jun 2025 23:14:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748844860; x=1749449660;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=flmDUdRzTSdQ3XB1WaSuNgXC/xzzeHQUFd3cOSxNmi8=;
        b=fUwukFBTNauKWS/Y05URMtQTd3V7eQFDX8HtkNjhdaV6dOXBcfut2rQCr4Luxl4rjz
         rRUOtcFXvXEjy4ihxYnbvItBhNwJtTsn9LcCwGWuPSLeYqs73Q83tV8hgc4i22AmANaq
         V+NsxRLy2bQBOAlId4Y9zvrYd+M7UcGh969NIhD3JQds57Vg96dr9YbPUgOjpn83Y59b
         2Ly5ihtdLK6AEOIj7cbfmelWHTEfcqrF8B/UwRRt6fz0vYIRVsUOA6y4dQ/fpV34ccAH
         BH5ADqV4OAnwSreQuOPcB7tuusw/RilDxSwFADLkvZCunxTE75GuDWBUfxFQDKBpwylO
         QiYg==
X-Forwarded-Encrypted: i=1; AJvYcCUzZeId5nYo73NE4QadbJbP+W+g72asq+Bek+HLjaxVIh6GlMC9gxMDnlbNJXecIVblQsHRc3GNalLN4w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8bN7hpFBave0J74Kt533nr6XJo1cCnrRZBEKy8iJsQIaPWVmc
	kmcONHxFiKB8HgkoLFWPofN6OqD8SriD+Wt2aFJ8VgUoxRb657c0xESKFiKSVjlAo+1DzKsVWwW
	pLeE10/mVrAxOdaFp7EI7NmEZus4xs4y818ypTfOBHRAqdwjTyxqgDuecxAcj6N+rvA==
X-Gm-Gg: ASbGncvvvgiQG1KOc0IwDRQA4GZcLx4gx5n9UiJZUTfqi0fRDZHSbONi4u/sASrf42z
	lIO4qcSWPJ4HNFfutWa73Z1VxCFKHP9Fea6zUXv/ApVHXbauxlcuqesIp7/Wx8Pkq3Zv/NFqDSO
	r68+VCV3I8sf3+xMzhxvuFR6b64VaxmYGH1/f8s13G8YZlgF8VGwLk3XZcxecHasuMf2GNqwohg
	pqtI+zQ03CPqm43YKYC/9LNc7wmGpsI1Mo1ho0TjuXbWu8knW8V3nad7H4QmBQvYxcU7+UtfqrM
	F+K4sOcDZXa4dMqZYmQysdveo4erEWIepkRvO1fl3+IZXaPLRDihRLcLpJV5mdqLx8c6vrT6Zpm
	iyZZX94tlbA==
X-Received: by 2002:a05:620a:4488:b0:7ce:eb40:5abc with SMTP id af79cd13be357-7d0987d73f0mr2372748085a.21.1748844859760;
        Sun, 01 Jun 2025 23:14:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfa/HyjwuKIFtyqKUXOSM36DThgJJlHokJlZLC6wMsaXWoh8NnPBLRYAhqMEAaUk+Mohp66w==
X-Received: by 2002:a05:620a:4488:b0:7ce:eb40:5abc with SMTP id af79cd13be357-7d0987d73f0mr2372745685a.21.1748844859380;
        Sun, 01 Jun 2025 23:14:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533787d1d2sm1480413e87.7.2025.06.01.23.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 23:14:17 -0700 (PDT)
Date: Mon, 2 Jun 2025 09:14:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Renjiang Han <quic_renjiang@quicinc.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [PATCH v8 3/3] arm64: dts: qcom: qcs615-ride: enable venus node
 to initialize video codec
Message-ID: <x27shu4eaqa4qc4mld5xryelyvhic7vneq4tetxy5j7zrxll6m@ssxg4jehdsyy>
References: <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
 <20250530-add-venus-for-qcs615-v8-3-c0092ac616d0@quicinc.com>
 <qeuxv2mpnnsieygdwvsb63k4n53tnc6yekiv2wels4jjwwpxf3@wutnfkefi7yj>
 <05ccb3ce-1954-4a6c-8cfc-edc8313e9875@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <05ccb3ce-1954-4a6c-8cfc-edc8313e9875@quicinc.com>
X-Proofpoint-GUID: 06XswNMhxJD2OHehXfzbR5LaH1fg0STE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAyMDA1MiBTYWx0ZWRfX1GXkG+pvhZHt
 2lRahe95+/Ea45BSz7zVdxtbogD6UWw1vOHi2dallgtxHqgDYM4bihC/vwGhLYVj/V5YaikQasV
 ThU8lnHpbihFeQl9bAkGB8Ezpypa65WbjLeLk0rZvLsy84aAbkR35RN8uO/mXhagCuKPAzFObPt
 pxz9QOInY1t5U1zMTocrxjF1Ycf44WGTxDfA8wV9R0TPz180pRPflTH79QTQqe/AAAXDqMTvM3T
 SFHaaQhvRhen10S4boZiIiE1iwX6RdXB3/d0wCHZOLCm8+wlOF241kCGPeYiREkYRrEORuqx5Tu
 vP+audr6qRIC4cYfHHZ0epocOKJO6+pVlAy7rFD2BSYk8BUK+1NUSgwdp7CsF7FFFGRSaNf5ehx
 nY3meMqkGI3v9HgZ2zlqblnFVN8wn1cX8+SLUTP8OyEbbTDQt8GKKpwb4KNmbobQALUNBUWd
X-Proofpoint-ORIG-GUID: 06XswNMhxJD2OHehXfzbR5LaH1fg0STE
X-Authority-Analysis: v=2.4 cv=WYIMa1hX c=1 sm=1 tr=0 ts=683d413d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=QX4gbG5DAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=2kupvtxIihpKMtcpfgAA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=AbAUZ8qAyYyZVLSsDulk:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_02,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 spamscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2506020052

On Sat, May 31, 2025 at 08:07:06AM +0800, Renjiang Han wrote:
> 
> On 5/31/2025 4:31 AM, Dmitry Baryshkov wrote:
> > On Fri, May 30, 2025 at 09:32:15AM +0530, Renjiang Han wrote:
> > > Enable the venus node to allow the video codec to start working properly
> > > by setting its status to "okay".
> > > 
> > > Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > > Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/qcs615-ride.dts | 4 ++++
> > >   1 file changed, 4 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> > > index 2b5aa3c66867676bda59ff82b902b6e4974126f8..0686f5c10bdaf7ba3f522e16acd2107d25742dd9 100644
> > > --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> > > +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> > > @@ -338,6 +338,10 @@ &ufs_mem_phy {
> > >   	status = "okay";
> > >   };
> > > +&venus {
> > > +	status = "okay";
> > Does QCS615 work with existing qcom/venus-5.4/venus.mbn or does it need
> > another VPU firmware?
> yes, QCS615 works with existing qcom/venus-5.4/venus.mbn.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> > 
> > > +};
> > > +
> > >   &watchdog {
> > >   	clocks = <&sleep_clk>;
> > >   };
> > > 
> > > -- 
> > > 2.34.1
> > > 
> -- 
> Best Regards,
> Renjiang
> 

-- 
With best wishes
Dmitry

