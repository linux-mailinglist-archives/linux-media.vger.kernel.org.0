Return-Path: <linux-media+bounces-64336-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nYM5EOGTKGrqGQMAu9opvQ
	(envelope-from <linux-media+bounces-64336-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 00:29:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBD3664946
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 00:29:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=R4w17Bkm;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OcsBswTt;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64336-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-64336-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 86D04302D4DC
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2026 22:26:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61F354C8FED;
	Tue,  9 Jun 2026 22:26:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60483F5BF1
	for <linux-media@vger.kernel.org>; Tue,  9 Jun 2026 22:26:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781043996; cv=none; b=Wb0taRmo6YhnOqDkIKzWF4s0k69fmVM6ablvJboqlihNVTgbrVdvMP3HIRQIx3eZUb6J0MQ1F8GTiBYROK7o8NYm/w6UKZXfAK4AZ1uXigw+H8dj34PlrZTQiwN2kic9x8fDDpQwxRLLNQX9rYvi/G7h4B6iPbbfEsA603290Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781043996; c=relaxed/simple;
	bh=wSmbSWrh4KvndShnDN5RVVAgjW/hDF2yEiEk/WtBayM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lf7bCIVetS1p6ODpoqenZ8wj3+5ZODfYnERrUUqs+cVcWjZiiFuMX1RJpuXFdltYDHFh8Qn+ZHhRl6VWGIwQWCpZ8GcrJWQzAslBQuksPh7wttFFCMjsd2k/EDNoozhhWklu3MqQQkoNYBAMgA12tzcCBHnWm1kIl8Fql33zNg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R4w17Bkm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OcsBswTt; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659MECfb3503296
	for <linux-media@vger.kernel.org>; Tue, 9 Jun 2026 22:26:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ts2sevuY/m2ocPH0TCVwzt2i
	P8IL8X/SqRKJ5vz6HlU=; b=R4w17Bkmge5qDosiuQAK+xx/ZLtvJfXFo9EZbqQu
	HOlsa/dPENsSfV5XLXzL6FDo84JTTyoxyTO6pcG3akeZFkXiSmdizbAbNgZVo1P8
	CVOWSpftquonnW879bQKb0rJDKcmqXGuwlaeJlKZQ5RbDqlnHq23kyIveT0MWb0g
	sY5NLb+i2O6qzwnAezhlTO+BOVAEIo4W4tqS5HVkBGObfRsFFCINIkAeXKVSEUv1
	q5nE8Iiq1BHTnmn+LBhalhGycpgWgi1RHR0gM670J8Sql9tdsSmubsA+ruhOB7OK
	Vn0XJ7hBIjRDy/sGGW07JuCHPZiFBKuM0GQXUH2mwY+iGw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeqgm2pt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 09 Jun 2026 22:26:35 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-517dadd84f8so963631cf.0
        for <linux-media@vger.kernel.org>; Tue, 09 Jun 2026 15:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781043994; x=1781648794; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ts2sevuY/m2ocPH0TCVwzt2iP8IL8X/SqRKJ5vz6HlU=;
        b=OcsBswTtvHO0RvtT8mFWT5bOwmlsEuQ11sCckLngj/UDU694E+9M9N+YCxGwWpUrOW
         783TyedAU1iaxwZYsMTB63u7vZfkJ8wqk+jmqWmQ8uMqKhFOEU5wmpLaDcf0C+uzKxUT
         2z2Mw6yTu2Yqhvriu6WtWY3JRwsfLy+IuzuV6qyTmTyRTOWosHIW02WeR3nEcYrn6wEm
         M6Sy/YQPtU39+tF1a0PPM+K2evwsw9A4i6rnysnzmkIPWxi616T6jrJByYjGX+S0e9mU
         k+NmMSSWWIsqeAWOF3yohAeHHkzDZWNBJGy3tfEaigcvgOWNVriBSDzXL3ui9kb7d5/T
         LpjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781043994; x=1781648794;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ts2sevuY/m2ocPH0TCVwzt2iP8IL8X/SqRKJ5vz6HlU=;
        b=qSHb/VBfWxmWkOV/hYLoYa6qrqmJEXvjxUvd40aLtQdtFelGiQYiqIm4F8jTCUMc2Y
         fqgWd8LRuMs13YpG++6vPH5hX5CtRtHzJYKcmZmSWA4pzLgHXwqDCxLqx+8Yll183BFp
         8lY4GFUwTnPTK3q/0W+JFOY1Iolq5Ngz3Iz8RMmfKoB9Q4aPmUDzVgohK/Fzu9X21J3n
         hLctm5wVP5U5grooDVE/3ecaf+Z2KH8zpbZTf/9nPpGJy//bw7i7rAUnUjbkFHGj+aQF
         f02g3067iXq3fGgwuDWL9RVU2L4Bc5W6ovCJdaMatSFRu83eB1QW1rZFTVLUxR5Tk1v7
         1ZHQ==
X-Forwarded-Encrypted: i=1; AFNElJ9QqmAn5BFUji7k61sGWIzC0j0eTpga+0xZtZwJZWepb09rOA2BrJB3DXtGscbw5bwHBowBuUW+09R8Rg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAy5L2QsTEv8knE10Nb3BSUUEwPtmb2Xn2deRY16jr5dBXI3Os
	l83zP4AnDalSJ7KHn3XmZzi7vW7ychaW7Iq4uFvgn7NaSBiMFSsZd0B3U79tnHtf432KaE3pU60
	LMztElxDFFM/1CR9hlVWntwNzI//n64kmGBlxlT4BurkLuLdytc4pQy2XyUwJ2oqfqg==
X-Gm-Gg: Acq92OGa5cpIO2rWK8il25P/XAZG/AfOsSWkfRy1Z/XzrXD2TAcf98O+3OuG3WBG+I2
	Z3mLKaDSa0qLBh0FY/QDeYh6LSuMCubMB4dIF++qZmp83R1K/PN4dTVDzKUoDfvAmupU/VzTh++
	3eQXJXgaFek+GhhBwk2WGWW77KI21+RgX5cVeu9vrtt5BHzDK8Dl6Xg0HbIGFCCW6ukQAeBqRQO
	SG7kcfuAPHV0nK60EfoLkHaE1HClW9Wim/ozj3+Asw5tkJb5VANv21qNolvfytsX3/Ivn8mdUPf
	pupaDFwZI8tjcnGkrVMzXwssjXxaDwVmr/MAHLQctfWt2tsjTI/y2mR+OMhqyoViIFraGjKbN3v
	G6qgGMAfF8jnImzYXHec4nDFU7oUBn6qSRM5OAsFqmU/dp0JAub4iTI46EnE9og8NpxTWqDpCXJ
	81k3lvl3Ow/g87ql282eNVlXByvQBaY3ZGmSIQX047v4ds3g==
X-Received: by 2002:a05:622a:987:b0:516:e00e:6868 with SMTP id d75a77b69052e-517ca5fbb44mr62865391cf.46.1781043994102;
        Tue, 09 Jun 2026 15:26:34 -0700 (PDT)
X-Received: by 2002:a05:622a:987:b0:516:e00e:6868 with SMTP id d75a77b69052e-517ca5fbb44mr62865141cf.46.1781043993726;
        Tue, 09 Jun 2026 15:26:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b906a83sm4906345e87.33.2026.06.09.15.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 15:26:32 -0700 (PDT)
Date: Wed, 10 Jun 2026 01:26:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: shikra-evk: Enable Iris core
Message-ID: <fg4oncrltunkvfgdca2ol6sx4tduvewuk3y6zw4bscgr42cmqu@noojvhygjwhq>
References: <20260609-shikra_vpu-v1-0-3a32bb38b080@oss.qualcomm.com>
 <20260609-shikra_vpu-v1-3-3a32bb38b080@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609-shikra_vpu-v1-3-3a32bb38b080@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDIxMSBTYWx0ZWRfXwsy6ppcYVKWu
 apis59pxIiawRPdAPtOXfwnOZWchGiynYHPFQC+7Zmy/qreEDI11CjFyUwu7liOWUzhlSd2b/+A
 SDY9kCjQJVD9I5Z77ux2nEaJg89v9uOoNGrB+u81BtJOkhJQDNBuBu/s6GQcWkGX6DaPOpuqDKw
 Lk2ASONlgCmkSZexqTvnLxbstLvaDQo1CUTLDxxgZbkt8jCpDGAJ7Uu2EkFCQbgbZ4myXtC/Q9k
 ht/wIbkcbY4u90aS35YfvdZSLCokiZ09/7Ine8Ovxm69eXtwxJCttLjHu9eNCahcIJ5Je1cculG
 t6fsO3N5ansIlz3ADZvxbM5Tv9uvTDhncwqZT13N95vhX/omz7y/Ql0m1DhCTM9lFZq2ajJFetW
 +IhZibgEkCLMVpAMZUDRk7JwKLR2Ui5GKLqU63gwMdHYPVsSpJiH9GWnQncDFxnTacABA4v2SqQ
 y/KE3GEHkdDMgoMQXtQ==
X-Proofpoint-ORIG-GUID: Rz2X_HReR-YiXl_U16MXSL0SGHSWBxAX
X-Authority-Analysis: v=2.4 cv=KdHidwYD c=1 sm=1 tr=0 ts=6a28931b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=JNbnNDg-RtrLR9FoxugA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: Rz2X_HReR-YiXl_U16MXSL0SGHSWBxAX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_04,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090211
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64336-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,noojvhygjwhq:mid];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:bod@kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jorge.ramirez@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DDBD3664946

On Tue, Jun 09, 2026 at 09:45:42PM +0530, Vikash Garodia wrote:
> Enable video en/decoder on the Shikra EVK board.
> 
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-evk.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

