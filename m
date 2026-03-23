Return-Path: <linux-media+bounces-56685-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4EERDhQPwWk7QQQAu9opvQ
	(envelope-from <linux-media+bounces-56685-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 10:59:48 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CA92EF85D
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 10:59:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D8D2B302961C
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 09:58:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 108113876A3;
	Mon, 23 Mar 2026 09:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MKftpxX8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eHbKLfdH"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E11A38837C
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 09:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774259887; cv=none; b=eoGKdvLzPGHjz6pvX/ozxwgQO3xBQddCerFq3CefA9jmUhpGqSIVW2jBKwNcyEmOPmPSPEcqSlb/ugDOvIotC+qleGnbukoJ8xa7wwfp5jO4d6cnqZItt3x+iMd4vxkpU+JQPsSi+1KVuiZuUisAlniWZ2k3s+zhAx8IFyX6GRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774259887; c=relaxed/simple;
	bh=HXNzsj0LVrw02guzdU/nRwSJ6cMnqIl9UkeuSeA9RTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QqC3debU3sFU8H5FHlZJCdViHwEM9o+jbi20ZQ0QQ0TJb1+OsE2p3we//x8Xx5eIiX5aMMjbrBDOFd7tc8AgLA1K5PGYmZ0kQDWs1rhkhLwg9GDDS63ad4RlyfS/SDvOT5VCZRtj1nHMyYWRjJnms1hKsT15ccLZ+sQ7ygqD/m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MKftpxX8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eHbKLfdH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N9jQYQ1772502
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 09:58:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OsFad9FOjsEjXLg3S1NAj7Zevr3pMv9IohcMrhz9SCA=; b=MKftpxX8Vxk5cYqF
	HMtGixe4sB/LljTwgolHqV2BAZzmdKBWY3AMph062firnTZEiM9GCsGJJgRxj9jL
	u69ZonKpqrpscnS+A3UoIUN1Lta4IVPW5Vk8szka3M2z8LY+BCHulNaZCiFWOp9I
	pLxaDnmDT7Yg/O44mDSmGLw8mse83RY4L7/HMzYLMeRLO5i3Yu5P0Li9llT/BBh6
	F+BXn1E+qxxMI/S9jcbB8fCQWpVEF6e+uzgQ0RvSARYl1QBPb6BGjytmXwljS6Bo
	oLM4g3584xfRcEdl9QU5qnW38yIuWFlafGgRS8EHk53IWh/ZahkzkTibrB8PgVYl
	o5U7dA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1jng4ukx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 09:58:04 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-509044f54aaso49928951cf.1
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 02:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774259884; x=1774864684; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OsFad9FOjsEjXLg3S1NAj7Zevr3pMv9IohcMrhz9SCA=;
        b=eHbKLfdHGn6VcDfkHFJMIPMNTawIsvFHPBchAcYhD80TLc//PgyE54qX0tnu4eVugp
         HA7h7V97jtIIbutqW3wC+r6oXHzV4KTtRI5TQNQ0C+a1ODdlMcM73welkopUuicjcYlM
         hGVlofGc83/guSQQY7cj76I1jrEpoBNIth5cS4EhJkgTPTz+NBsaGvGkePYklsw3mrys
         nQomeWnsvAoUgjI4X/2ArF8C0GqqJg94xmVTTOybrb6J/Z19FfdVWdkwkOg4hesTJFFD
         3149Mvn7PUGLA3byFrtJna5cZxiUA23aLJNgrpQ/q9qpSdXoVoJNBrf1quSund70YCkG
         2ujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774259884; x=1774864684;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OsFad9FOjsEjXLg3S1NAj7Zevr3pMv9IohcMrhz9SCA=;
        b=eC6pyC24CihSE5k4Je+IoUoOiaWdLr5uIE3pBemLXq+mfRDOcCd/xAfaPdcQ9MYkXp
         gCSXCey/9+m6PVftAOH74Rqwza/gT3VoLOQCT+KIiymUTmXogGxONsNWloYiwe7+hIet
         Ic3GzDtmoPNYKAkPffTuWj6tEA1fkXeV9ZvYLIg+asOM2mvATs+UQ8iSScEW67pKnjSQ
         a/arOBcZF3inVAo0H5oAnXqDPkrrR41KSDjrAfE7x5JYuOWFjv2r+zv04YC07skE0gT7
         12dsU77afmHJyY6X/Lt3/T9CKLa0kFlwTTy2gh0YSEcUya9BT+gq9UT5Cj5+KCfOYJ5U
         IZLw==
X-Forwarded-Encrypted: i=1; AJvYcCWSVuj2ey2MkWdUmtmw6Ps1SNEw5hYCibyoqOKySRvjtYNAe7+mbTzJYuKizPB7D2Syy6ImsxoV2tamQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfDF4oBZNpc+vUmbG5x0Il0qQu6p4J7awOC2GJQzyI38BTKPnX
	AouByW3vqP5JPm6ivxwfPxwuggSPBZWzWC9U/LtEcZs42EY4zsUO1l2sOMTAWmjAgT9oioiQbrS
	h/LkAoX8ZP4CmwV7qd/bFx8ffMA0RdT03MeyPTJfdAio5cyV+ODVwerIKjqjNPix0XQ==
X-Gm-Gg: ATEYQzyoXyHfT8Meac8f2sbCyX1fHidZXrcnLjrlbq9TbbFF0O6jwtNSqc88og9djK+
	ggcGxh0bjcJtZKZRfvwz8yq6boQ5LpxEASotEDdpHnK2VbJCMM2qgVVez+2rMJRmmGeMXFX1Kq+
	4GDDGrm08JewtolcSEWrJ+18r613rWvevg2Ho6PWdFqbfQt+kwx69EwWhVTyCaQNRHeCY93QHos
	hH+yVDT6ofN09BQLEvkry5A7CleV4376OU+LoirHD3IYEQRDEDXBO56cfWkacrNSlkWZkJ6FaOt
	nk1AExfb8tdEPlx+1vsUsEtEw7r5h9ElRJOVWOtrUwc+xobyq2f/Kk89vz9kHO1Vko70vu1lT5A
	/o0tpOUG8SmqYikLKcjfohtin25Ib+DpCSrJklCoOZ7T5NdVi5MBCtNNrR0uDek0hG8rqg5qnbp
	s3EXGLhpmjc7WS8w0DYUuwgEGEm35jWy+Wxrg=
X-Received: by 2002:a05:622a:14d:b0:50b:41bf:4ee5 with SMTP id d75a77b69052e-50b41bf660dmr156792531cf.57.1774259884312;
        Mon, 23 Mar 2026 02:58:04 -0700 (PDT)
X-Received: by 2002:a05:622a:14d:b0:50b:41bf:4ee5 with SMTP id d75a77b69052e-50b41bf660dmr156792331cf.57.1774259883879;
        Mon, 23 Mar 2026 02:58:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285207302sm2398937e87.46.2026.03.23.02.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 02:58:02 -0700 (PDT)
Date: Mon, 23 Mar 2026 11:58:00 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 11/11] media: qcom: iris: extract firmware description
 data
Message-ID: <av5hvd2qc3g6qddicdobtdprmaexk4b2cisgmq27sdvfvmcnkv@lmr2dwhngljb>
References: <20260319-iris-platform-data-v8-0-55a9566ebf60@oss.qualcomm.com>
 <20260319-iris-platform-data-v8-11-55a9566ebf60@oss.qualcomm.com>
 <14610f07-52c2-465c-d407-fff1974429ea@oss.qualcomm.com>
 <839d9dc8-30ef-a2ed-42a5-106923b4065a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <839d9dc8-30ef-a2ed-42a5-106923b4065a@oss.qualcomm.com>
X-Proofpoint-GUID: NzOpsV7_ZwU6Pajvr2QRYaYBYMS0VBCv
X-Authority-Analysis: v=2.4 cv=Q63fIo2a c=1 sm=1 tr=0 ts=69c10ead cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=k3VbfXO1dvbp11TfyXsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: NzOpsV7_ZwU6Pajvr2QRYaYBYMS0VBCv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3NiBTYWx0ZWRfX567ROTtS32fv
 tqdrJXfXvk6jzIJ7U4sFdmPY3zEGDi8QJ5eWwdO/kNIDkAay9IgmeMQ3DJEAUcVcFE+M4lDoZXz
 zGQGf5B3+t/xWL3cdMFcckwAjn/PLBnJFvtsxqghbLApHffgfg3xISZtthyEO8Jg7bItS0ZkoI6
 +RGPxFlt3DJy1KmO1FbtVESFqTziAJpSL0Ca5jYQ39UtEJA4O0caNRwDrRwMiTHmyhtI32xOlpo
 I5OI2ExDuu6iuLofS0Xq/DB/SzGaIk0hByA+1yC6vOMvZ+kSiKUrY1ZTsszOLuQ+j4LcQOjcDE+
 U+jr/V2jj25yKkYk++ji6ViBbmKhkCZbpr6XaTWe0u2d1ggAaGh61hMGU/qHb1010qvd2Km7xVA
 BlFlhQheKsbQYsxWDZ/RPIz7gWLapZzrw4aKwM4J2d3Ve36YNUbrKYE0kSnBm6HRhtvECZmi9sO
 n8zLO+opsj+H0ow477A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230076
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56685-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A3CA92EF85D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 01:41:36PM +0530, Dikshita Agarwal wrote:
> 
> 
> On 3/23/2026 12:50 PM, Dikshita Agarwal wrote:
> > 
> > 
> > On 3/19/2026 11:29 AM, Dmitry Baryshkov wrote:
> >> In preparation to adding support for several firmware revisions to be
> >> used for a platform, extract the firmware description data. It
> >> incorporates firmware name, HFI ops and buffer requirements of the
> >> particular firmware build.
> >>
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >> ---
> >>  drivers/media/platform/qcom/iris/iris_buffer.c     |  2 +-
> >>  drivers/media/platform/qcom/iris/iris_core.h       |  1 +
> >>  drivers/media/platform/qcom/iris/iris_firmware.c   |  2 +-
> >>  .../platform/qcom/iris/iris_hfi_gen1_command.c     |  2 +-
> >>  .../platform/qcom/iris/iris_platform_common.h      | 15 ++++----
> >>  .../media/platform/qcom/iris/iris_platform_vpu2.c  | 20 +++++++----
> >>  .../media/platform/qcom/iris/iris_platform_vpu3x.c | 41 +++++++++++++++-------
> >>  drivers/media/platform/qcom/iris/iris_probe.c      |  3 +-
> >>  8 files changed, 57 insertions(+), 29 deletions(-)
> >>
> >> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
> >> index fbe136360aa1..ef7f6f931557 100644
> >> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> >> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> >> @@ -295,7 +295,7 @@ static void iris_fill_internal_buf_info(struct iris_inst *inst,
> >>  {
> >>  	struct iris_buffers *buffers = &inst->buffers[buffer_type];
> >>  
> >> -	buffers->size = inst->core->iris_platform_data->get_vpu_buffer_size(inst, buffer_type);
> >> +	buffers->size = inst->core->iris_firmware_desc->get_vpu_buffer_size(inst, buffer_type);
> >>  	buffers->min_count = iris_vpu_buf_count(inst, buffer_type);
> >>  }
> >>  
> >> diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> >> index e0ca245c8c63..7f36eb65dcbf 100644
> >> --- a/drivers/media/platform/qcom/iris/iris_core.h
> >> +++ b/drivers/media/platform/qcom/iris/iris_core.h
> >> @@ -99,6 +99,7 @@ struct iris_core {
> >>  	struct reset_control_bulk_data		*controller_resets;
> >>  	const struct iris_platform_data		*iris_platform_data;
> >>  	const struct iris_firmware_data		*iris_firmware_data;
> >> +	const struct iris_firmware_desc		*iris_firmware_desc;
> > 
> > Missing documentation.
> > 
> >>  	const struct qcom_ubwc_cfg_data		*ubwc_cfg;
> >>  	enum iris_core_state			state;
> >>  	dma_addr_t				iface_q_table_daddr;
> > 
> > <snip>
> > 
> >> index dd87504c2e67..d36f0c0e785b 100644
> >> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> >> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> >> @@ -251,7 +251,8 @@ static int iris_probe(struct platform_device *pdev)
> >>  		return core->irq;
> >>  
> >>  	core->iris_platform_data = of_device_get_match_data(core->dev);
> >> -	core->iris_firmware_data = core->iris_platform_data->firmware_data;
> >> +	core->iris_firmware_desc = core->iris_platform_data->firmware_desc;
> > 
> > How will iris_firmware_desc be selected once a SoC supports both Gen1 and
> > Gen2 firmware?
> > Today it’s fixed in platform_data, but eventually probe would need to
> > choose between firmware_desc_gen1 / firmware_desc_gen2 based on the generation.
> 
> something like this would be okay?
> 
> if (core->iris_platform_data->firmware_desc_gen2)
>   core->iris_firmware_desc = core->iris_platform_data->firmware_desc_gen2;
> else
>   core->iris_firmware_desc = core->iris_platform_data->firmware_desc_gen1;

Yes :-)

-- 
With best wishes
Dmitry

