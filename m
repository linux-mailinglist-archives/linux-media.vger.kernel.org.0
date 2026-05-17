Return-Path: <linux-media+bounces-61858-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEyLIEn7CWpPvwQAu9opvQ
	(envelope-from <linux-media+bounces-61858-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 19:30:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A2B5628FA
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 19:30:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 391093025D17
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 17:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 790EE3C8713;
	Sun, 17 May 2026 17:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a2zaxeiV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J4sJ6gmH"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3183B52E2
	for <linux-media@vger.kernel.org>; Sun, 17 May 2026 17:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779039001; cv=none; b=VIkDBLkTVcrCD6So9vCJl9nUCqNjinnU3QbtYhD+0U5oGOb8VcMLFdKXIDUy/XJnG2NEjPhVeZV5jp3PWKADLbR0xvKEBxzcRoCSpeLuGfJnU/aKX0cC9uyeRHYd/oIJ2wTghu0Rm80acWqnPrQq24G8O0qtJGULfPaG1dLYPYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779039001; c=relaxed/simple;
	bh=6py1zoHaVdRk/ukIHqAdD7V61Ikdrr3sm0apl9nG3Fk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EITntXqioutG0tN2z+xmn/1QfCPS6U40fNcTmS82NuKqZCN3dzTAoDJvxMUjvM65qVfqOG2IY09slfsEKlZ1yWjsiSREjaQweUPBDInB+xx0kBAb983BnxwVNmE//1SOBsIxgtZs9e78G+Oy/1ESRhq1924A3oF5KUl+gYhixTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a2zaxeiV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J4sJ6gmH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H4bkVu3732307
	for <linux-media@vger.kernel.org>; Sun, 17 May 2026 17:29:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JpdeiS1uA+pl00HV/TMDS+WW
	ayMzmhtr2xGT+L36+54=; b=a2zaxeiVGVoq4L/MfYoLpjoCw8rrZVrcuElfi8G4
	ZPiOY9VgXyJAAtkRo0RXWEk/6IcJuerIyGVgycOF7bkTaYBUqRrS8B6xab2MYQO0
	+o/Tvg5gLaE3cd5d616BX0HBzo8TSFV7/klc1j6cWjoP3ogVWVPxE0dmRkGqnQDh
	CG+AqgeZqzE6Wvif5h/Mu9wREMoemT3V2TKxVBs3MCuLzrNHYgVo7ofLsVDyNf5n
	yYNqLXqc/+mU3QoWIQ9bxcQZJwo+QyiojF9HK8lYGVq+GEC1pF0rPmBMZRhLS1Vb
	fVHd5DOmWDWql7Um+Dwrmw4Z7As9t3zr0DtTWb8y7cxjdg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6hbcb7k6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 17 May 2026 17:29:59 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51009190feeso54356421cf.2
        for <linux-media@vger.kernel.org>; Sun, 17 May 2026 10:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779038998; x=1779643798; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JpdeiS1uA+pl00HV/TMDS+WWayMzmhtr2xGT+L36+54=;
        b=J4sJ6gmHM6v+w/CKOElgTF/RFsvztbXrrDv3bR7HSNaqBA17aHQl01kv+tYe0IbrV2
         d9IKHbDKnxrZXjC/aZSaBENKt0ffYBUNoxAMXmvDqTH1j/931z7kiwwHgWqWQjNZVW8D
         TIU+qZ1eRPggG3CxHAmlZliNw3+/yf0rnJvHCqdxCRG2avB8HUV6oaRsvn10V9FrcY6c
         FJxFak25gwcMSzSX7xutVB0CberTmpVLqME2leXO6wmvf7LWlEdarGYG7TqPnY1Ewty1
         i40cd1n45TCu6BYmjej9Dnom+bFZS4Esv6MdoteImktqcGQyikyDbbn/mVxljtCvShDg
         VS8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779038998; x=1779643798;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JpdeiS1uA+pl00HV/TMDS+WWayMzmhtr2xGT+L36+54=;
        b=ZIhC0ynuI6FoQ518v9A4kcNFH9ylNrwvIIbBEuenahpSi5+DAbnjnzr6vzZi7JVAyx
         6Bz1deiLaQfVe7dryuw/BgkaUSDLMEHNjQ+UZ30Pqs+sdk+mNErjXGlBlP668RDE3SvE
         FQJ9RIto7lKvJAguH+Hgjp65+Wi5E5AEOCj0Ry/L9J5lYTkPTrX/NmaKJp11KK+1MN9V
         Of7Uo8BA3kZjWqDM1ZOQ9o1OUQGntkCcroczdBhAexey3+TVpiuCptRG2cOXJDLDAUEe
         H9ofxkJFxOIPtEuC9zWt+SAcfuKB5AblXh/R7Y4itrNnvKSR8Sn/GK5xF+wPWuoGKJ1F
         LSmg==
X-Forwarded-Encrypted: i=1; AFNElJ9deZKDD7EX37ontQOZMcjtwbB9R6xvAZ13Wvx3zYf8/GjIcFNu6fMcB/NOWhLSNpMY/K0B0OCgaLEy9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs21v06WZsDU/XPg+HmshTHK15YEJnWuKaibmIghiz9wAbvG/f
	XueMJIxuX0LItSIZbkguynBiJgsxUQraTvrhgM2YQrAh1i4SmG7wScBwHef1UfrxMP9iKCGYNPm
	d2AC8poIuDI2l93Au1T/soKAVaQ0CABXHrws1eMQFBNKRxrFdmWPIZ6EU6WYuUHoQWA==
X-Gm-Gg: Acq92OHt2xEwQsbYvpMMowK6O+XkLvcZkoTUCOFrp5gL3/Gx/qLXmF7HkIBqcMw1MhO
	k7S0NM8Y2OpVSkNESYlzx30pZY2TyRAX7kcDGIkzesNng9B/bbRxY8DB7pJGu+TL5/2BMumdRkj
	vJckFG0osNnyTBxw6e24YBndzwXi8e7ofTIhg4JKbU5JtNOmvCQAtyF7pWRFK9zsEzEmfbd4hQW
	wFnkYgUZEfVgLTgIMVBQFI6HYyJQRaVg1OSw/0S+tJUJeiThepAvI48HE1Ssvl8SvE/WsToN/j4
	0k4AeFebmIH1lNR6ZyRTelxE7suZ9u3AXMq97rTYQinFgyRBPxZu97LwrNbapU79/Ptpxkkp1qo
	hLO780c/ee/O+7/P3YtZWw74q69ro9Yblv/ppJ751CKAU0my6GX+t1Q0oQT1LlrGslKe1Z1GQaj
	WylnXOi0RmVkC6FNL4VWT3HPM0WwGXSZ+mqhA=
X-Received: by 2002:a05:622a:6bc6:b0:50f:b3d2:6ee1 with SMTP id d75a77b69052e-5165a1eadf4mr127697131cf.31.1779038998112;
        Sun, 17 May 2026 10:29:58 -0700 (PDT)
X-Received: by 2002:a05:622a:6bc6:b0:50f:b3d2:6ee1 with SMTP id d75a77b69052e-5165a1eadf4mr127696841cf.31.1779038997655;
        Sun, 17 May 2026 10:29:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395882c4683sm6281841fa.13.2026.05.17.10.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 10:29:55 -0700 (PDT)
Date: Sun, 17 May 2026 20:29:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v5 03/14] media: iris: Fix VM count passed to firmware
Message-ID: <izj6zy7c4ec2cjbsznkaxa4q3hupwteqprjzpajjquwchwa227@mplk7d7uccz7>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-3-7fbb340c5dbd@oss.qualcomm.com>
 <zfh3hb4gowxejxeip3l24jub2z3xh26pzl5xmjhjos634c6e3u@y26yubeb7v33>
 <11c63862-5e8b-9f3a-5479-706e672879a5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <11c63862-5e8b-9f3a-5479-706e672879a5@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=cuSrVV4i c=1 sm=1 tr=0 ts=6a09fb17 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=oM8CjG1BZR9KsnUa8EkA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE4OCBTYWx0ZWRfXwEdFdD+7RnKV
 YDZSDHT86AbbLxnX9dZ9NZPJ415CwCainpul/g4qqpUOIvZIA8QRzQqPeujR0FSIOdbmBcQa3+5
 YuEXITZavXYLJ6Eg1YIrhT+gwkvImb7WhueCZq3bilSV1lbjH2uLzIMtzzhkcf1GgFRQ/Z4mj7F
 P9/fM7pR+Pk1XQFf+VZv82Qe/V1kbK1/ilmpwtF3F4GzcBTVSfjDDBA+TMU+ZNFr+2WWpKSBzv0
 X+CgpLMif8ASGpYVBTtkzey7yRk0ChZMmmChDk17qB5F+vSrfeiOsN5AJqyty3VyyDpF4IfaDwa
 n0tj2EW865htxzSPkOTrJi6Lmrwwib9CDI8b4Ijeu6g7giEMXamexO3xQxYLr6YdkIz8SSII5+n
 WSQKiq7bY/LPqN8bIM+L6JfGHZvBQiLWqmNbJgMDldrrI9xc9lOcya0ExtK47p/Jz34iO1bUFlV
 LNbq2FDd1ds3aQXPNvg==
X-Proofpoint-GUID: lRgRP5-e4_Gyj8fN1Bco6IlY2FiyQ_5V
X-Proofpoint-ORIG-GUID: lRgRP5-e4_Gyj8fN1Bco6IlY2FiyQ_5V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605170188
X-Rspamd-Queue-Id: C6A2B5628FA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61858-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 04:48:44PM +0530, Vishnu Reddy wrote:
> 
> On 5/9/2026 12:50 AM, Dmitry Baryshkov wrote:
> > On Sat, May 09, 2026 at 12:29:52AM +0530, Vishnu Reddy wrote:
> >> On Glymur, firmware interprets the value written to CPU_CS_SCIACMDARG3 as
> >> the number of virtual machines (VMs) and internally adds 1 to it. Writing
> >> 1 causes firmware to treat it as 2 VMs. Since only one VM is required,
> >> remove this write to leave the register at its reset value of 0. This does
> >> not affect other platforms as only Glymur firmware uses this register,
> >> earlier platform firmwares ignore it.
> > The explanation is pretty suspicious. I can see this write in venus
> > sources too and it was added in the initial submission, dating 2017. The
> > driver targeted two platforms, MSM8916 and MSM8996, so this write
> > predates Glymur pretty much.
> 
> Thank you for the historical context! I checked with the firmware team and
> confirmed that this register is not read by any of the platform firmwares
> currently supported in the Iris driver. Regarding MSM8916 and MSM8996, those
> are not supported in the Iris driver.

So, which platforms actually needed that register? The "currently
supported" is not strong enough. We are bringing in Agatti support and
support for SM8150 and SDM845 is in discussion. I would not be surprised
if we end up porting other older platforms too. So, you are changing the
historical behaviour. You need to document the applicability of the
change.

> 
> >> Fixes: abf5bac63f68 ("media: iris: implement the boot sequence of the firmware")
> >> Cc: stable@vger.kernel.org
> >> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> >> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> >> ---
> >>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 1 -
> >>  1 file changed, 1 deletion(-)
> >>

-- 
With best wishes
Dmitry

