Return-Path: <linux-media+bounces-61166-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLIVBaEdAmocoAEAu9opvQ
	(envelope-from <linux-media+bounces-61166-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 20:19:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B10C55143AD
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 20:19:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B06293135F64
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 17:58:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9691A46AF25;
	Mon, 11 May 2026 17:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PYmeYpeJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vyfv24g1"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117ED355F35
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 17:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778522279; cv=none; b=AtVE046eOlmeQIsZssL0XEbwdK6kk146DRpyrOa2fBqWausNv1QHY0iZikmgIvr24Qiyrshof+6lPParYYlouFUTKMQ1+LofgM6AMtdXUdqXDmjGSyLssTNMRwA7YcufMeuV7KFuonibQIHWMyV70hev/YPZP8Xk6n/FnCwUtqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778522279; c=relaxed/simple;
	bh=0YGp70VxaO91HxUJFbJnJ5F6HFDYP3i2GY/s4tb/z64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uYs+sO0cI2n+xKtOiOrpIZ4vajJgUd7A9OU825W2Vxp8zwaSi4+Gj2ha/8nRgxZo3WcCl9v8Db9h0NdMpqFTmr29/DLUAOH4Tv9irou/R1ewB7DBThT+bCpqiv+ZndoztiMNx3EEof+cz719FOt+2lebCRPHx4tAtMbda5evLAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PYmeYpeJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vyfv24g1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BBIYBQ1344945
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 17:57:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Qcv8qjr6fEiDbQpPSdJkFDL2
	ZBM50yz1nWeQcqgmxfo=; b=PYmeYpeJBuZK97ZYV446hAl1KADeJIk+uHpFuhpA
	/bm+VPkw9lMtidiAynOxByRt5o6jaukhZj2cJQgZ/lFUCz5y/U42jFRBfKbgumWa
	i5gbcB4BSXZTvV7pjja1Argky8ToxpKoKjSXo13M8/ijal2JTJ/o+V7d4pcpfnTg
	NUDhL5xuvLaBIQWQnEkHFCWynqMHLpW2NJk7YN2HTF1hSyKf6dlzq9CVNcrR4Hlq
	js6gPhtg/XWkKM0hlEjvvGRL6ja3mMnfCEvc+gjOv6njMSMeHVsR1kQCwZnYZGql
	WCcGVIOvyrLQxYTISqVs9foNprFggSclHreU/fE3qK7oBQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3e499nu8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 17:57:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5104b861649so132277941cf.1
        for <linux-media@vger.kernel.org>; Mon, 11 May 2026 10:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778522275; x=1779127075; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qcv8qjr6fEiDbQpPSdJkFDL2ZBM50yz1nWeQcqgmxfo=;
        b=Vyfv24g1gNUIP0gA01wve/I1Ig1HAK7JD1hotvcer0m6/Ukm01z771OI78Uuqzd+id
         PysoZ+1OBkEXmOMUhyp/HJtXnbp6EEsvFGsWlnAfvYxp2EfLzKOc8Pxbh0BABEFEVb9D
         9QCy4Espxam0CTGJclMfxGCWSDEte8meb3Mw7yyI5oavsTcp3VqoqoJVxcVIObt9tuwr
         V/YNOduwPM2XlWKrwidARTxEB/YkyXrM9VYjAEpyxq5y2g09eqnaS3gpt2YHhQ//d2pn
         zxLSB4qAwccGH23UI6n8Z2gyuqCE1+yRzaTvpZP46VnFeHX/SwSdt+JFelH32BaPl/rB
         zBzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778522275; x=1779127075;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qcv8qjr6fEiDbQpPSdJkFDL2ZBM50yz1nWeQcqgmxfo=;
        b=UlYCtIGrA9OyHv7nSTn0YKYIG1bFePgH7695pg4uZzfNExULp8uN6kXTL7Q3REsVH1
         Xz++C+899+y5agu2VSS3P94b4NdUjwvUi4CehpPAigAeHWhWNkIN9bfNm0iPrZeS2HHP
         32g8eY120FvtAKjF5S/j5aggdD8449uiBV5THRMmjJ68GL0SPoknvG6aHqrvJxDytikt
         QpFZFFtiExLxEqwiZS5OPAxQFRkN4y2yLGG4mx2o9NoLpY1UlzY08Q1G+oyXg4CJ5OQ7
         Uy6zwzqWcV0KTSIEOQTjaKXsB5eA00F1BU1J4P4RfOVISeHVEO4YMFYZPcRoJMWqxTwL
         E55A==
X-Forwarded-Encrypted: i=1; AFNElJ+EVt8LIi1KBAxqHX3lGNjfcv/ofcms1z9POu31fwGzGYtO0oZgRHMWfWF7QvV+czcpEqVfNcq5fEmVRg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yze6ZpOuUCqlOKvbpC2FoyDFuLNGammE9O0a6LDL9JLBSVfM8j6
	59yhwmOD7ala5v5EHYztLTnXZU1XSNWamDvSWWM61sswalGFIbKKk0AVdxztwPXRIIkjvoBkG5Y
	LY4XbWubOSRp8n45TLQmqSXYKIbW2uoL6tjrRIOa2KK0Y62ROd0bgh1qaEJ1yDBbm9Q==
X-Gm-Gg: Acq92OFniL38OcRQXNm/OXIlgUXGZ8ZSZTALkSWVNb8EaKfBuqvQOrUPNiVFHwzOS4B
	U9ALU6ub0eAsJcvbWfWsc+H5zAYcgfx6+HwABD/mH9tbCIwx94NVWJNn5SL7fFhNm1ZSh39fTXq
	B2z3g8RrtbTspOg7XHfSK3LoIf0TYNPxKNxPz/5MUYt98r4SkFNczjlsNiYrJeCCj/wRW1vWK+C
	//IMKF94yb04vQ25Jv/oZ9/L77pBOJfJGWz2nJQ5bvi6B0/GJs78N/ed+9nROhgU9u78nxg/4Sh
	EBniwC9dFfsJD429zt/Wz3r+WcajgMoiMfkTVgHYEdAzJEuzrVaKxGGbBWpCXTeeQ5Zs18fitYj
	o+Zi9IZKhOngbxZpdHj9eUTJybYARjR+0P6cZbYfStHUC94eJyLyMGfbXi32kyo00IuN4SjrORK
	Gwp1rC3R2uCSTLMTP/QIk1/QfJaT0xFLZR31w=
X-Received: by 2002:a05:622a:1985:b0:50d:7c4b:5c5b with SMTP id d75a77b69052e-51461bdb425mr364047061cf.5.1778522275320;
        Mon, 11 May 2026 10:57:55 -0700 (PDT)
X-Received: by 2002:a05:622a:1985:b0:50d:7c4b:5c5b with SMTP id d75a77b69052e-51461bdb425mr364046621cf.5.1778522274860;
        Mon, 11 May 2026 10:57:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a951cfb4sm2788709e87.20.2026.05.11.10.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 10:57:53 -0700 (PDT)
Date: Mon, 11 May 2026 20:57:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mohammed EL Kadiri <med08elkadiri@gmail.com>
Cc: quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com,
        bryan.odonoghue@linaro.org, mchehab@kernel.org, gustavoars@kernel.org,
        kees@kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: venus: Annotate flex arrays with __counted_by()
Message-ID: <vqcumtz4quxxbzg6gytx2wg5bhcawqjes7vra5nd5mirimmay6@k2pmiss5jlrw>
References: <20260511130538.33443-1-med08elkadiri@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511130538.33443-1-med08elkadiri@gmail.com>
X-Proofpoint-GUID: 0tUha2WViEDylYrcbPePzknTQppbu3xq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE5MSBTYWx0ZWRfX+26+/uidomvI
 YxU45k4Pw2bAFNr6++u5p0mjvYngcg3uArGtX64ZcauFoqL46z4iQUF6xBZrRPKSUBO3EcevQ9y
 8effGUE5zoJP7pRz+JsAeI6XQqHjllvsqlzKd7YnCoxy961t5JtaMUzeasl7Myu95ZATAQQnEb3
 MmLt1PZKxdYV011xkJw4GFRZl7RUHE0lcfR1Cf5ZUKzhoJBET8+Kd+Bs5Agf7PZW4vPGXDrsFBJ
 z4U62j8dr6cr7rV8sBdLYHrFJ7sO5WelDcpWpEdvvi8ULY8JUn7+GN9ZikzVwW8f/jH3+Zgt/Oc
 ZrbJLghGLXAUf5ZpOYByI6DFKFqfaPN8YSkSMlB3D1M3RCkRuW2SegPuK07yxVBb8vFYRIozJyZ
 FnbBaG95ttwseGlD72hP1iwTgScYYDChokILBsfHez7KJZdt9mdigqH9/JJBcgx8glt+k9W+ixj
 KFd6MuVsTeu68W+McFA==
X-Proofpoint-ORIG-GUID: 0tUha2WViEDylYrcbPePzknTQppbu3xq
X-Authority-Analysis: v=2.4 cv=Yr0/gYYX c=1 sm=1 tr=0 ts=6a0218a3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=dTTBFGv0oYrt8U5ceIUA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605110191
X-Rspamd-Queue-Id: B10C55143AD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61166-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 02:05:38PM +0100, Mohammed EL Kadiri wrote:
> Add __counted_by() annotations to flexible array members:
> 
> - hfi_capabilities::data, counted by num_capabilities
> - hfi_profile_level_supported::profile_level, counted by profile_count
> - hfi_resource_ocmem_requirement_info::requirements, counted by num_entries
> 
> This improves run-time bounds checking via CONFIG_UBSAN_BOUNDS and
> compile-time object size resolution via __builtin_dynamic_object_size().
> 
> Signed-off-by: Mohammed EL Kadiri <med08elkadiri@gmail.com>
> ---
>  drivers/media/platform/qcom/venus/hfi_helper.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

