Return-Path: <linux-media+bounces-54930-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJoULfaOrmnVGAIAu9opvQ
	(envelope-from <linux-media+bounces-54930-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 10:12:22 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FE3235F37
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 10:12:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3D1D83006231
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2026 09:12:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17C1637757B;
	Mon,  9 Mar 2026 09:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jHru3esd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G/+mXK6b"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B41377033
	for <linux-media@vger.kernel.org>; Mon,  9 Mar 2026 09:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773047534; cv=none; b=M+PPANw4s0DVqXxno9UfZDkyRfskNDLbX6USUwjo+sBBpFFlwf9rr8HTyQc2Sh7c7qJgdUKR6hpA2w7IGsrJRyZGoTqlqJwL4gJzXQjB6scW2Q8/gqoUk6PundUDOVvmBaU8ZPtaiDIbliTazRMH3NbQ3N09L+BWoW3Hv1ENUhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773047534; c=relaxed/simple;
	bh=Q2J+r2dSfTS2w9RcAxTqCjJw6if9TEPXLD0Hi1LfNcA=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FpU3BadAXDGyFYB39kl0qWSpxjBi2uvgHkJG0LgH7RXNcss6q1+aTHAUT+3MwCkKAKAgkJUxfJ//EXfOMbM+qJFGHZnzPKBuPmnvZpzho9xmT2Ita8HcHCyRokEU8p/9QcK09qKPwXYcFmH/IAmYcxSKTuGS6UEL/a3M+SU7QD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jHru3esd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G/+mXK6b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6297nMZo3540564
	for <linux-media@vger.kernel.org>; Mon, 9 Mar 2026 09:12:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xbMtvtdOfLDdatvp+5lzCch6
	oMIueR07h2NcUioWpFw=; b=jHru3esdNzuncTNwyW211a+aJdCkYiYxILsoZN+3
	1GwgTcHiMn/ymHOV08WINAfoWlfYw32mmtmF+Seo9nDBKL/8faTBqtOibVjY8T1b
	dgaY0uA7GYpKzy2BlixGrj6mN62goEwdjRuKoxo3BmtDppXIOIRCT3W6eZFhNujG
	NUVHihFT8lC0N4D4b9D4sUu9vqiYV7661k24lzZtWboU4mtxwP07+llelKSKDhOL
	XCCcln8fcMYU0Dbq9i5aXPPkIr1kAbbwT4ojrN+2XxrTTpUirMmL8EjgT/DODPGl
	DyxQTsHS6r2QOpA4ooTD4DOGq2QorD2Gt3YNLkNIxsnfsg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crayrmumq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 09 Mar 2026 09:12:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd7774be64so1054483885a.0
        for <linux-media@vger.kernel.org>; Mon, 09 Mar 2026 02:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773047531; x=1773652331; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xbMtvtdOfLDdatvp+5lzCch6oMIueR07h2NcUioWpFw=;
        b=G/+mXK6b4p/ttPLc96rKIpLQx0rVatRsBeSzjF6/+gelzgZLV8+rTlRRrKkr1lDudb
         x0XHory0GhLkH1EV4a5PpiAhY/TRwdi7lNPcuiJaJ+eroKu8I+pq8tKeZgoO9rnO8mAj
         3GPZSRLFlKEjh4bUiOLnU4Ym4fqojvyKGzTYir5jZPGDnijSdwEZ2I//IX31gXkKEP1s
         foFFG9rGEYwaClVPqGjcfc2PF6ChTLabjzpl33wxEpXkGgIb9BiIr8BItfX961bdKraS
         oWN7XpKgf9b1/RiiDTdP5u2dcwofel7MwuTc+xl6KxLC9uT0LhYultFFB/xZ4sey9DTv
         tyfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773047531; x=1773652331;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xbMtvtdOfLDdatvp+5lzCch6oMIueR07h2NcUioWpFw=;
        b=xE0K0eALpTd0vVm4wppHw2RtgO2lscKN0OWGhQIePH8ueu42Er5oZ4CB9KNLpC8eni
         48kEEQyoJXTg4KyiuDRRc6hAN2JaJZwOqaKZW99f5S56myqcFJQ+eOuFsdAlTa7X5LyV
         NL/TiECvlbZd5fB7o8LujU5pAOJC8bClKcn5D83LzP8n7k0Qx/i6iSpNgfI+dY7Fi7HG
         sJz+bVRySEksr9LWH7aXclffFu9Ih4rkojZQ7sQ1w027sveBQ+Fo4l7skR4sg9fjfF0j
         KrJIoXR0wej5TikoJBIiHZuU/Hpt7ARSmyqqXI/r1Y50AtaAr5Jh5LYKMEGRSqHoKca1
         zAaw==
X-Forwarded-Encrypted: i=1; AJvYcCXCFWD9t0RrR5Xn49uuRTEOV0L9oreJkNygJfntBzV91cqFXFjxbWbtnS/8uZ/B5f38sMgI8yJkUAeC+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzY1+mm1AuovQ8yncGEWe92D1LyQK9YEvIEsLQzuiVORmFGJbsZ
	J+NchK0QebDKOGLZ2nw3k01MuLQi2xMX8Low06RvYSDi13GmBkPsGHZ3wmg8NYNXzn05kNpRxR1
	VovyfCScrdlxOfO7LGSLkqv5vNgeUxoGpsnSuvNhhpiI5uG2Sn5Y35uxuIm9w3XxZqA==
X-Gm-Gg: ATEYQzz7EeJ0L9NqeT0PqzLcXYajn8aufFzrLaT3VFDWZAPZLRll+IxIhe7VUSpYcCw
	hzXS1qaG6TyMbdS3n+55DDRT9OwWjSrq4PnUXaYmCT3xqjSd6ij1B+gbLkkvUJQNHjRU2dUzP6V
	ca5Gi101+aI/bFZmBm66gmwIjKlchr2r2DnnWjYNTw3cQ2wxRVJzWWR1GiFJIhj2rW5P6W+Eixf
	ttFkjRh5SQuaIQEPvBgYuIuZbAOjHS5feFKhP8Qri2AJMjcUfyX5dprqhO7OPyzWiK6mWhbiNOq
	M+ss3rR2EMrHHo18wFrcqVEqOLTbZvV8NbqNXzn3olkhKwn7pcfIbibt5Q3myM93g6fwlowYq+c
	ULFVVRQrS2zljaRxdOQB5NuxEQwGu3j6OhWvVn9MUZs4WhhMxaxBCqw==
X-Received: by 2002:a05:620a:700a:b0:8c9:f9c1:5ed with SMTP id af79cd13be357-8cd6d4d541dmr1304569085a.63.1773047530899;
        Mon, 09 Mar 2026 02:12:10 -0700 (PDT)
X-Received: by 2002:a05:620a:700a:b0:8c9:f9c1:5ed with SMTP id af79cd13be357-8cd6d4d541dmr1304566385a.63.1773047530429;
        Mon, 09 Mar 2026 02:12:10 -0700 (PDT)
Received: from trex (110.red-81-38-138.dynamicip.rima-tde.net. [81.38.138.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae483desm23179497f8f.34.2026.03.09.02.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 02:12:09 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Mon, 9 Mar 2026 10:12:06 +0100
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        jjohnson@kernel.org, mathieu.poirier@linaro.org,
        trilokkumar.soni@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
        pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
        tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH 11/14] media: qcom: Switch to generic PAS TZ APIs
Message-ID: <aa6O5tir4kVIe0eZ@trex>
References: <20260306105027.290375-1-sumit.garg@kernel.org>
 <20260306105027.290375-12-sumit.garg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306105027.290375-12-sumit.garg@kernel.org>
X-Authority-Analysis: v=2.4 cv=U5qfzOru c=1 sm=1 tr=0 ts=69ae8eec cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=P2IcWdTxk7sEx2G8DnB30w==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=zah51VvIpe4vvf6E17kA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: O3kW0Xi137qM8WpwMDilGBfyUxlvwxoH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA4NCBTYWx0ZWRfX0PCwM2jrM1Bl
 U5P7GOCRj4pElOThW9VWt9FscsJLlSPc52ms5qb+07T0nEUceQs5aVrAH8verkxFpp3nokaXC+o
 RCH1pK8DhZazuNPV+7RQJ8rMBNreQuZktBfCLb/eCGFmcIK2L9aoHupY+1L42g/um7Mpk8ZK/eJ
 I0yqXHQE89oRgKJz+1euQs9S+IjhjzMhY4rtbhMofTR9OGODrgzRbeKpf6mHqPQ5eHKR4PbPGth
 yxHjvH4iTT1d0Lw0dbMjuD+uYLmBYGH4cTkN04DGROww97aF9E8uAJjVPu1aYVD2EdO6MBypIUr
 d9Q4jksPFsgCzCWVpTurhwQ8PI2IUoQTAwHa30Febxoj+rYI/D+90pYtckZTfZ6HUFA9qXpBxGj
 0YIWTNBlVsGTo33rPcwDdDqRYN/jH1O3rScxxjVDibk/GMIg5uowoA7+U0ZDSqGadS0Pgox3wa+
 1x1kZy6aGW49Af7Oszg==
X-Proofpoint-GUID: O3kW0Xi137qM8WpwMDilGBfyUxlvwxoH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090084
X-Rspamd-Queue-Id: B3FE3235F37
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54930-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,lists.infradead.org,kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,linaro.org,qti.qualcomm.com,lists.trustedfirmware.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jorge.ramirez@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.987];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,netdev];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 06/03/26 16:20:24, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Switch qcom media client drivers over to generic PAS TZ APIs. Generic PAS
> TZ service allows to support multiple TZ implementation backends like QTEE
> based SCM PAS service, OP-TEE based PAS service and any further future TZ
> backend service.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_firmware.c |  9 +++++----
>  drivers/media/platform/qcom/venus/firmware.c     | 11 ++++++-----
>  2 files changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> index 5f408024e967..b3c5281aea91 100644
> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <linux/firmware.h>
> +#include <linux/firmware/qcom/qcom_pas.h>
>  #include <linux/firmware/qcom/qcom_scm.h>
>  #include <linux/of_address.h>
>  #include <linux/of_reserved_mem.h>
> @@ -79,7 +80,7 @@ int iris_fw_load(struct iris_core *core)
>  		return -ENOMEM;
>  	}
>  
> -	ret = qcom_scm_pas_auth_and_reset(core->iris_platform_data->pas_id);
> +	ret = qcom_pas_auth_and_reset(core->iris_platform_data->pas_id);
>  	if (ret)  {
>  		dev_err(core->dev, "auth and reset failed: %d\n", ret);
>  		return ret;
> @@ -93,7 +94,7 @@ int iris_fw_load(struct iris_core *core)
>  						     cp_config->cp_nonpixel_size);
>  		if (ret) {
>  			dev_err(core->dev, "qcom_scm_mem_protect_video_var failed: %d\n", ret);
> -			qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
> +			qcom_pas_shutdown(core->iris_platform_data->pas_id);
>  			return ret;
>  		}
>  	}
> @@ -103,10 +104,10 @@ int iris_fw_load(struct iris_core *core)
>  
>  int iris_fw_unload(struct iris_core *core)
>  {
> -	return qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
> +	return qcom_pas_shutdown(core->iris_platform_data->pas_id);
>  }
>

are the calls to set_remote_state required?
0 is not the IRIS/VENUS remote processor.

If it is legacy, maybe they can be phased out?


>  int iris_set_hw_state(struct iris_core *core, bool resume)
>  {
> -	return qcom_scm_set_remote_state(resume, 0);
> +	return qcom_pas_set_remote_state(resume, 0);
>  }
> diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
> index 1de7436713ed..3a38ff985822 100644
> --- a/drivers/media/platform/qcom/venus/firmware.c
> +++ b/drivers/media/platform/qcom/venus/firmware.c
> @@ -12,6 +12,7 @@
>  #include <linux/of_reserved_mem.h>
>  #include <linux/platform_device.h>
>  #include <linux/of_device.h>
> +#include <linux/firmware/qcom/qcom_pas.h>
>  #include <linux/firmware/qcom/qcom_scm.h>
>  #include <linux/sizes.h>
>  #include <linux/soc/qcom/mdt_loader.h>
> @@ -58,7 +59,7 @@ int venus_set_hw_state(struct venus_core *core, bool resume)
>  	int ret;
>  
>  	if (core->use_tz) {
> -		ret = qcom_scm_set_remote_state(resume, 0);
> +		ret = qcom_pas_set_remote_state(resume, 0);
>  		if (resume && ret == -EINVAL)
>  			ret = 0;
>  		return ret;

