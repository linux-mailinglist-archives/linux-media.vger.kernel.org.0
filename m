Return-Path: <linux-media+bounces-14191-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E63918798
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 18:40:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F19828A5BD
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 16:39:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9D2018F2FD;
	Wed, 26 Jun 2024 16:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="a4Z5JZV/"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE6A18FC6C;
	Wed, 26 Jun 2024 16:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719419958; cv=none; b=LPZH/bDgphMrFRdsvk4FiUIgR3Z9xA2tLjwfVnVKWU3pPW2p3iGtJQSTk27GDeMiW5uOH2vUZrA9Lpwkl4jgowkIvbS+3ScelAnE2nAik2oah4jCIuHSfh2VyVEtg7bhk28oKwPCelElmsd2ZBnve/z1O1HbnA5+eesGOIimXnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719419958; c=relaxed/simple;
	bh=yOlDxBZu3pWz8NnSvstlkkupmt0K7U89lTu4e4ns5ds=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=utRrDBaIHLtaU1SAvo10cwdgVImexjVLxwqzSC/GBlKvMOi2UWnF/YzOg7xVYY3qucS1VOnVm0JeCZypkr4zH2eB20PMsbA8i678tU5JCxWskLisMCmRmZUOjjZexLIQMdAVuD1xv/PlZGoC0EF7P82SpL+MKF9Ckc+m0ZaoU1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=a4Z5JZV/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QAfUG2023737;
	Wed, 26 Jun 2024 16:39:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	53BRxXB+20bEEGJgP9JLStrQZG51nI9iZGonm6T2Zms=; b=a4Z5JZV/gJIVCwSc
	K2n4yo2Hmhr7BLu5/lwp7q0x53s+YUBPgOkFaDVSdvvMCRdcNRcMhaiITsfsSYgU
	DodA1mEZ56eNw8VDaMURRRQo1dmWUMzy6vksIuRzPhhj/L8JsvZnLNdPQZtdhH/A
	et1+YmvWOFau4vGeJ15hXhXySaySaktC/yz1I7AuP4Ph4yzl3yQ3+rPGMuNCrM1n
	xcZg2SrSmkCGDIBjGqzGtkvxqp8z0tWAWtWocj/PICe5KmaQMfYogQuhBOo1IMhn
	YVCcapwO9V3M6pNNJpDYGk6voE+rbWGO+QMOPODQrE2dEBQ6VIg2e4TjcAaM2X7u
	LKKxUA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywp6yt4tg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 16:39:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45QGdCOS024087
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 16:39:12 GMT
Received: from [10.48.244.230] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 26 Jun
 2024 09:39:11 -0700
Message-ID: <8bd4fa77-a7f7-41eb-bf2f-7f21dc15856c@quicinc.com>
Date: Wed, 26 Jun 2024 09:39:11 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: dvb-frontends: add missing MODULE_DESCRIPTION()
 macros
Content-Language: en-US
To: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
References: <20240611-md-drivers-media-dvb-frontends-v1-1-a378ed102f69@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240611-md-drivers-media-dvb-frontends-v1-1-a378ed102f69@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: LpzqAaSJMV-S1T0EuJB2RFLCOU2jeWI3
X-Proofpoint-ORIG-GUID: LpzqAaSJMV-S1T0EuJB2RFLCOU2jeWI3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_07,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 phishscore=0 adultscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406260122

On 6/11/2024 8:21 PM, Jeff Johnson wrote:
> With ARCH=x86, make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/dvb-frontends/au8522_decoder.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/dvb-frontends/mb86a16.o
> 
> Add the missing invocations of the MODULE_DESCRIPTION() macro.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
>  drivers/media/dvb-frontends/au8522_decoder.c | 1 +
>  drivers/media/dvb-frontends/mb86a16.c        | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/media/dvb-frontends/au8522_decoder.c b/drivers/media/dvb-frontends/au8522_decoder.c
> index acc27376c246..d02a92a81c60 100644
> --- a/drivers/media/dvb-frontends/au8522_decoder.c
> +++ b/drivers/media/dvb-frontends/au8522_decoder.c
> @@ -25,6 +25,7 @@
>  #include "au8522_priv.h"
>  
>  MODULE_AUTHOR("Devin Heitmueller");
> +MODULE_DESCRIPTION("Auvitek AU8522 QAM/8VSB demodulator driver and video decoder");
>  MODULE_LICENSE("GPL");
>  
>  static int au8522_analog_debug;
> diff --git a/drivers/media/dvb-frontends/mb86a16.c b/drivers/media/dvb-frontends/mb86a16.c
> index 0fc45896e7b8..9033e39d75f4 100644
> --- a/drivers/media/dvb-frontends/mb86a16.c
> +++ b/drivers/media/dvb-frontends/mb86a16.c
> @@ -1854,5 +1854,6 @@ struct dvb_frontend *mb86a16_attach(const struct mb86a16_config *config,
>  	return NULL;
>  }
>  EXPORT_SYMBOL_GPL(mb86a16_attach);
> +MODULE_DESCRIPTION("Fujitsu MB86A16 DVB-S/DSS DC Receiver driver");
>  MODULE_LICENSE("GPL");
>  MODULE_AUTHOR("Manu Abraham");
> 
> ---
> base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
> change-id: 20240611-md-drivers-media-dvb-frontends-ed357c23fc53
> 
Following up to see if anything else is needed from me. Hoping to see this in
linux-next so I can remove it from my tracking spreadsheet :)

/jeff

