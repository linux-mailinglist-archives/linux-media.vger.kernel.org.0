Return-Path: <linux-media+bounces-52723-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFkwEIETj2k8HwEAu9opvQ
	(envelope-from <linux-media+bounces-52723-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 13:05:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C9905135EF3
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 13:05:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 72F1D301C13C
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 12:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C6BC35EDB2;
	Fri, 13 Feb 2026 12:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wr5KmwU0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Oi02igeW"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBB43570CC
	for <linux-media@vger.kernel.org>; Fri, 13 Feb 2026 12:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770984300; cv=none; b=tyTQe0sUmIzw7H8JOzp5ry9iF4GLnFKB46JBbf22RH8dwROEmSud6VhfVmAlcn1kSrlXUFlaOOPzFbwQUzRM1rX6B6kplDIYRzx47mypjKYhxrbi+wF9FG95mbi4NRNJu6kq4Q6ru0LcxCwcwR8A5To1yWPiXSeIp3CW5nNi78s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770984300; c=relaxed/simple;
	bh=N4hnCcBGEBNNb0q0uAlmNq0D2/SAMk1tcGCyGMC9L7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LzVb1oLz+VM9hdjMMftDP0zP52hYE3RSIjaCBGW6BnEd/HVJflD4xjlEAu8TAeDuducI9WRIqszb9xvx3FSOwMH4+9CPtoFLXs8v6WP+PVUXONhUbA+fF7zF+74AuiGHEgvLPPDNKHfNTDQMrELvXkFsx7My8plrOWAzMDeijgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wr5KmwU0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oi02igeW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61DBpRGU1756673
	for <linux-media@vger.kernel.org>; Fri, 13 Feb 2026 12:04:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wWQK31BCqZyp7A50GZvyP0Ap32S/BzA5MMR0p9yqlzM=; b=Wr5KmwU0Khx15Hif
	1kY9r8iqn1zgr1R5ZY91W57S5lMl9G9QaHam6xFkReRLD2MO6QcPqihaP6xQPY2o
	tUdKlAa9JIotWrr0JHAzYk+EzmRz4ZQfk/dy2FVBoV+Tjm2Q/G2cuj9NsyRq5P+9
	BP+486J3AtvDcGSEBq8KOTeglBbMwJsfTjyLefunZX342AUXKba6eNjFvHRDzvD4
	g/+EMBT9sZOsHieeqY26jR9GSDWlazxhUa++ohv1ARb4UhVgNjaFDx7CpGYHlyyZ
	nUbhVYHchjNBNoxa7PS54YGVqx0M+4kYzwPID+Z0dTmYlFAlbMOJeFv8UKmVhU8a
	5Mq62Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9mb13a04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Feb 2026 12:04:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70ef98116so355163985a.1
        for <linux-media@vger.kernel.org>; Fri, 13 Feb 2026 04:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770984297; x=1771589097; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wWQK31BCqZyp7A50GZvyP0Ap32S/BzA5MMR0p9yqlzM=;
        b=Oi02igeWrKN/NQ0ijpFF1sPOWPNQ0TIP9Y/69aU/NXfGBLMVQg93SAnpAfZWy7VCJB
         hMGYlqUteSG6ktnxFW0OpvL1xN8LkdtVBb3AvgU9YXDNeMZ2OyC3SYYUPn1o4KrP1wMB
         h4iYZsY9O/K1OEtCErGJNRw36sm+IpNLgWMJc5Yp/kWCYNcKb/oLbEY03oNN0yzs4Swy
         gMWdK75uzgMS+ml7r45qG5HjZhw9WMUw69kvqMD6rXF9vxSd92NupbHGKZDrpnSp0n4M
         GG0hjsQdFOUh6kfCsYHnwfkHKHWM1H/51excuQOD6R0ZSMoLAH9oWDNCvYscj36DeY51
         i55A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770984297; x=1771589097;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wWQK31BCqZyp7A50GZvyP0Ap32S/BzA5MMR0p9yqlzM=;
        b=jpeoppksC3PRBWFhoRoEXFDd/qP3uiJqrxKZxGBAosLYaMd1cyZ9WsaSGmTghxvNu8
         5TabdAkwowvSRcC0kfpistlHiPYRwy71IYAIhiw6NdfvoBb+BXMZ+haDcS1hqtXSWuEF
         tatvYG/60Koyv4EDkGVsinf6E0aExTGEruFBzz3pCojFfmYc4wKaA3p4Is4QNHx/gPLE
         pB+e6E8oCebMuTcTtwYwcyNIbmyFi7Lrg5hj6T0AGDOat+1OK2Cizt6dxha9K65hE51d
         m/r/ahD52lQTptSbNsMEg8UJ9kMCCtMDzaECutFfWdIFuIVoVkji2CnhQqVbofg2US86
         o5ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTS/wWX4TiXksgKCmXWMh23QAdEB1Uu32BGUBrwLwyR2hlb/cTvlsrjMJJ61vZ1K1GHUQM8H2zwCyAWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNoPq27tS6eVk/OrnuG+cX+HMmNS24pYaiz5fy9PnSi+6zk4Zq
	wkuXfvYlBF7ePfgyvZU/ye2NAEbK5oc9hNL59ha1txw6gS363+2yr8LYwYkmkEqeHP0e6EZvx/3
	CU7ma93w2WPa+eTN68tQNvb+G0trfuduFLE+M0JzSqa3vdO0UXdba/LAPoa8DDWLJyg==
X-Gm-Gg: AZuq6aKq09DJ/nwHj/KlqUdAnTaYhV/hcMYKnccZ2kO1aeY2ybLANtgtMNJ6CB88pBf
	zgFV/HZM24cF7gRqMTqSbG5/MF6Np+MBMT6tgnHwlDSemzu2dnHqRWf/U5Q85ksVMk1jR9Q8CqC
	8oCbB7pDzB5uc9DOI/8uzBxC6ABQEVk0coW+Rrphw6oI9U5eshB5iTbgslHRyZI6Yzq+6Bqacau
	5m8lHXdANXLLwyUSLrjwUDjrVOt+EvfTcMe2kmGVmRVW6hgbrz9WFjT7Pud28qiplqSgPHZmNIK
	llMEOfP3QGUjcDpFYccsVaWRsLlzEXYx1dFqPRMS8Ra0SHULfpm4W+VNQBSrFRGCGwFdOPftHgH
	D1rq4IatualF1w7mfHFAEjV3RddsfddY20KIg+tm7Qq+u4q6+v/x9P61OQzBMnI6bJyf0KXoQAh
	4Zs62imPgJKBLgy7oYaYSrtsZUpoKJ6ztXSr8=
X-Received: by 2002:a05:620a:28d3:b0:8b6:134e:22f8 with SMTP id af79cd13be357-8cb42497dddmr169574385a.60.1770984296838;
        Fri, 13 Feb 2026 04:04:56 -0800 (PST)
X-Received: by 2002:a05:620a:28d3:b0:8b6:134e:22f8 with SMTP id af79cd13be357-8cb42497dddmr169570085a.60.1770984296337;
        Fri, 13 Feb 2026 04:04:56 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-387069067a1sm12251601fa.34.2026.02.13.04.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 04:04:54 -0800 (PST)
Date: Fri, 13 Feb 2026 14:04:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: iris: Enable Gen2 HFI on SC7280
Message-ID: <nb576n2risxl5mabotlu3idmoztedrblur4gbvdlk4cu3mtiqq@ecezsux4w7jz>
References: <20260209-iris_sc7280_gen2_support-v1-0-390000a4fa39@oss.qualcomm.com>
 <20260209-iris_sc7280_gen2_support-v1-2-390000a4fa39@oss.qualcomm.com>
 <0da582a6-5bba-4450-99ec-cf57b67915e6@oss.qualcomm.com>
 <0a324898-092b-3e44-c35c-15de20b50f40@oss.qualcomm.com>
 <2uih6xdzarkwnvhlhv5kznmdwo4jorqvsrb7xxrxgr6vprx3ey@4kx45k5i3c4y>
 <6b9042c8-767e-0fdb-9012-f3790899509e@oss.qualcomm.com>
 <f9f40ac7-e6fe-41eb-92e4-311913567ef0@oss.qualcomm.com>
 <b759fb04-22b7-cd5c-9e53-f4ffe9f37dc5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b759fb04-22b7-cd5c-9e53-f4ffe9f37dc5@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDA5MiBTYWx0ZWRfXycFXSpKOz5OC
 Zw1ls4Vr+S/wAtv6Hiyij4Rp0V9nUkjDZUyBFa6lixI2YwMVpnYIOAnOf7z0sZISz5UTxKznmoH
 KgbFCg3wCRAKHLoaJHnR/w8JmjWQeBsttuoXnlsl1RgQs+BHW0a/IlDHTw1cCLCH1AxNIArUxYs
 GTDd6rePc9EiLLJ7D8Tj6xmAw5rQm5q8UggxVWClRA8Of5PWl1ZMsjyjz5TIR78z8+BQPoKtPzp
 MT7htsul7mR86jXTwSxMC8zWKa8kGQkJTRXLHA/npiOnZ10Vg6XWItcAtpXmNtu306EubiZizVS
 Tee7d49LnO4QwLAex4BzwVDS9KIJcIeaB1VVXbJHMxvY4n/+LJ1iEcPKtAKkTEsaOgPgddPf1VO
 +txOr6lqdyNFAmudOpx3Wx//2aALK5B65ypUy0BNeub4u1KMoaT2EWLwhkD0p/J+42ftCPm4s2y
 UWsOl2dNl5hCxnI1NFQ==
X-Proofpoint-ORIG-GUID: WcVPNwga_1WgZvxGE4DH6CJyPh1DDFeu
X-Authority-Analysis: v=2.4 cv=asC/yCZV c=1 sm=1 tr=0 ts=698f1369 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=-RKkGvyx_SuP3FtDFEcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: WcVPNwga_1WgZvxGE4DH6CJyPh1DDFeu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_02,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130092
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52723-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C9905135EF3
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 06:35:19PM +0530, Dikshita Agarwal wrote:
> 
> 
> On 2/12/2026 5:13 PM, Konrad Dybcio wrote:
> > On 2/12/26 12:16 PM, Dikshita Agarwal wrote:
> >>
> >>
> >> On 2/9/2026 6:05 PM, Dmitry Baryshkov wrote:
> >>> On Mon, Feb 09, 2026 at 05:04:48PM +0530, Dikshita Agarwal wrote:
> >>>>
> >>>>
> >>>> On 2/9/2026 3:32 PM, Konrad Dybcio wrote:
> >>>>> On 2/9/26 10:45 AM, Dikshita Agarwal wrote:
> >>>>>> SC7280 supports both Gen1 and Gen2 HFI firmware. The driver continues to
> >>>>>> use Gen1 by default, but boards that intend to use Gen2 firmware can
> >>>>>> opt‑in by specifying a Gen2 image through the Device Tree
> >>>>>> 'firmware-name' property.
> >>>>>>
> >>>>>> Based on this property and the availability of the referenced
> >>>>>> firmware binary, the driver selects the appropriate HFI generation and
> >>>>>> updates its platform data accordingly. Boards that do not
> >>>>>> specify a Gen2 firmware, or where the firmware is not present,
> >>>>>> automatically fall back to Gen1.
> >>>>>>
> >>>>>> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> >>>>>> ---
> > 
> > [...]
> > 
> >>>> To avoid accidental matches, I can switch to an exact filename match
> >>>> instead. That way, only the specific Gen2 image (for example
> >>>> "qcom/vpu/vpu20_p1_gen2.mbn") will trigger the Gen2 path, and boards that
> >>>
> >>> How do you detect that for the OEM-signed firmware, which can have
> >>> random name?
> >>>
> >>>> want to use Gen2 can opt in by naming the firmware accordingly.
> >>
> >> I Explored on suggested alternative approaches and seeing some limitation
> >> with the both of them:
> >>
> >> 1. Detecting Gen1/Gen2 by scanning the firmware blob (fw->data)
> >> It is possible to parse QC_IMAGE_VERSION_STRING from the .mbn and  extract
> >> the version string. The issues with this approach :
> >>
> >> - the version string has no explicit marker that identifies Gen1 vs Gen2.
> >>
> >> - This prefix is not a formal ABI, and it is not consistent across SoCs.
> >> Each SoC family uses different naming patterns in the version string.
> >>
> >> Example : For SC7280 Gen1 we currently see:
> >> QC_IMAGE_VERSION_STRING=video-firmware.1.0-<hash> while SM8250 has
> >> QC_IMAGE_VERSION_STRING=VIDEO.VPU.1.0-00119-<>
> >>
> >> So the driver would need SoC‑specific string‑matching rules, which is hard
> >> to maintain if we are looking for a design to address all available SOCs.
> > 
> > The only SoC with such distinction today is kodiak. So we can simply check:
> > 
> > if (kodiak && strstr(fw->data, "VIDEO.VPU.1.0.")
> > 	hfi = gen2;
> 
> Agree, this works for Kodiak. However, Dmitry was also referring to other
> SoCs that may support both Gen1 and Gen2, and at the moment there isn’t a
> generic way to handle that check.
> 
> Also, please note that the Kodiak Gen1 firmware uses the string
> video-firmware.1.0, whereas Gen2 uses VIDEO.VPU.3.4.

This is not quite true. Kodiak Gen2 uses:

$ strings /lib/firmware/qcom/vpu/vpu20_p1_gen2.mbn | grep VERSION_S
QC_IMAGE_VERSION_STRING=video-firmware.2.4.2-d7a3d5386743efb16b828e08695bea7722cafadd

A collection of versions quickly captured from what I have here (for
different chips, but for the overall picture):

HFI Gen1:

[skipping prehistorical / museum data]
VIDEO.VE.5.2-00023-PROD-2
VIDEO.VE.5.4-00059-PROD-1
VIDEO.VE.6.0-00055-PROD-1
VIDEO.IR.1.0-00005-PROD-4
VIDEO.VPU.1.0-00119-PROD-2
video-firmware.1.0-6804c210603073037fb32640a3dd6a46fe04edd6
video-firmware.1.0-7da9db401e417a006ef915d6c4323f00cdbcf40a
video-firmware.1.0-ed457c183307eff1737608763ca0f23656c95b53
video-firmware.1.1-84a8080bf84fa9ab15b353bf03bea6e548d89d2f


HFI Gen2:
vfw-0:rel0095-d1a9e7c4a274aa13e4136500d19262f87ef2c921
vfw-3.1:rel0085-070fa3311d9ef968015fee7fea07198d7eb208a1
vfw-3.1:rel0093-7925621ff52ecb7b1565341042c4e5ffd4fc76ce
vfw-3.5:rel0040-1ded01d0e6dcaef08b8155fd5a02f5b57248d5ca
vfw-4.0:rel0045-25b39e81446baf48716df98dd37099a2103d36ee
video-firmware.2.4-48ec04082362ef1922fec5e20e22f7954b11d736
video-firmware.2.4.2-d7a3d5386743efb16b828e08695bea7722cafadd
video-firmware.3.1-e5aea20c64cb6df9a1c9be99e206053b36424939
video-firmware.3.4-e299f99ffcd086b43a2ccc7c3279ce5df404d693

It seems we can assume that Gen2 is:
- vfw-0
- vfw-N.M
- video-firmware.N.M where N >= 2

All other binaries are Gen1.

Also, we don't even have to query the binary firmware blob.
After the firmware is started, you can read the version string from
smem, saving us from strstr over the firmware image.

> 
> > 
> > 
> > Can we agree that VIDEO.VPU.x firmwares are hfigen2? If so, problem also
> > solved for <=8450
> > 
> 
> Nope. that's not true for all, SM8250 uses VIDEO.VPU.1.0 which is gen1.
> 
> Thanks,
> Dikshita
> 
> > Konrad

-- 
With best wishes
Dmitry

