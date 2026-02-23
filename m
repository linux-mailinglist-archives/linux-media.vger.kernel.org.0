Return-Path: <linux-media+bounces-53238-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEH3MrvSnGkJLAQAu9opvQ
	(envelope-from <linux-media+bounces-53238-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 23:20:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E56417E35A
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 23:20:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3E714305336E
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 22:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA819379991;
	Mon, 23 Feb 2026 22:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l74upXwG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cXTHiZBN"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09242378D83
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 22:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771884760; cv=none; b=dZlLoIw/ZGKS/k8sVdgX2p4YCy0E6/FldASQ8l2iLMhmHZx1nJzSgwPUMJxTwBGtU8/XubV7cEPY1Z3JChGDTyoTQCCgyx8tmepNTDkYfjK5FZz/nMmOJUDtdhGCmI7wLpOGTh6FfnE0yE2OcyYE7tlxJbcEqB2TGjUIgDc+PBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771884760; c=relaxed/simple;
	bh=Xmv6AivAPcyN4oojDSQhWKjUpiZH47TkKPpC0QkmJxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nsg5NU9b7sbRnwcWAR4P0JJLKci4ozbIfSEA0IJJm30rKbnic/DvjhCRjsqQIaGKJz7UDUegTEIvKFh/AGnq20Gvu83rJxASEe1DYEnryszocEblUiSmiEyc+akFlnzmuViDgB29LAwQnzrPCcyrLd8B3W1Mm7DX8I8QLakAj1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l74upXwG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cXTHiZBN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NDsVHQ185750
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 22:12:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U8+99t2Q08+ketqYxwhfTfYr
	syyINxyz6SnBAR9Q/Mc=; b=l74upXwGKe5nvGSpUt5Sr+jvI1kN0EmQQJwIkT/f
	5rtolmxcSheWmP6r/BFNpA2OevUrbWJ+NAkmQcD4GHilDIXCkTUhHpz27O9z1yFC
	CBVYpIojePUWbaaugRyAZVBDVzIaLJN9nUYCw+bziNJV6OtlW+9iGCmq98a2W/ER
	NeBaHDaTESG+IjXV4SYxQKbS5e25zYOEnyIUu+lFeT7wKvY2JTB4pqTnN1Cb3IaB
	PqrL3bNhhZr7fM8R7W7/fXm16D96rajTYO7RSnV+Yqg/f+pfsHLHRjXOIwXac4Gg
	W9IkXjkizbIiNY7WGpfiVoICtOTDa1h7TAOVvkHQWdq2fQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgr69hff1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 22:12:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb413d0002so5282064985a.1
        for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 14:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771884756; x=1772489556; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U8+99t2Q08+ketqYxwhfTfYrsyyINxyz6SnBAR9Q/Mc=;
        b=cXTHiZBNDQ6gr3OaVBaPjDejL/cjg/L1LLkTZt+Bez1N1l+OujOWuEb7xZPmKD4A1x
         cuQKbmoHkQa3A4jA/4GSMO7T0UGvT446DAC7N35Fwn/ZmxBIbJ0VJ7XjfN43YGvgHqhY
         mZ/SI8iPHPKCy/bkEBi0MZzQPn75FigFgpRYWyE0PNU6GYW7Uy/ULqxA6vb2piXP7Ga4
         4DYjpMEq/0zjWtR/bYlRvoZZOaVA+x+zm4tOMBPfJiCdf53FGf0kYUA9vXaSZPCKtZYB
         LFp2LhQa8sJon0OctXr5mku+rHt1eRp7ioYBo2uxlB7NlcfkdRMVtZ01lhNgr205IeeQ
         A9/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771884756; x=1772489556;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U8+99t2Q08+ketqYxwhfTfYrsyyINxyz6SnBAR9Q/Mc=;
        b=nJfOyQ+89RAIzWWWkHlo4ZZ8UJz0YdaPIU+3DQDIKbQ4b47MvFxm3mbojco/8qLfUd
         WmpJyP0+UuR6n79ffYtLx98Z0i/ExcHWjGXYQ0y/SZPja4aFQTV8OFoGItxXnFlyj0eZ
         mzR/xLulDmgJQvVnpb0EnsTFaA2bBNb8NxHUJ9EYLAudSNSya7gs1vEZyLmzhaD5g4hv
         MwGEUP5JNScnJU8kcWSUbcUeshODAbxTmk84GWnGIBbxIEEgVd0+yyzl9Cq+NVzsyFrO
         yrIqcLTngpaeYVhLuNEw0C9PReW8ZJsls88C97YbnhI2EJMNIlXAAwsd/NXLfJef9Lbz
         E0eg==
X-Forwarded-Encrypted: i=1; AJvYcCUURnEbQMUnF/Ij3v7upqo/yFj4o/upsIbxrDnIXpgA/QybxXJ1wxXiSi4o/+l+0GWxVEAeh58cw++bPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzN2YVSJK+ll4Wx8W7YE5emK2wsztONw9dxXQxcmjLMRjDV1HS0
	94jNcsFwGB8XK8SDTM27LOQ5EjAft71zVpjjMSckvuwB9NVPxkuuSJXVtP0u6ttXNYJtt23My4T
	9MEf4DD4Lxgxup5pYbXP24iaUOVViR7OeGOmlXC0BA52WAN3M54KpKpY3cy40nWQv9w==
X-Gm-Gg: AZuq6aJngv0HzRFidhq+0xXJjnPZfDKAJu7vzUUJiw70TDFiLVsPtO91jIYDRjmyjrM
	K9R4CaoFvQsywk5Km084nwZAbRaK2QRPyQZNcys7XKUGroSq65ZEbEQ0qSGE/2mjGPihF484qBT
	e7WvgL5N59yspT15yxIA1DyyDWctOo32J7Pvf94nE4ObDK/NWVg5BhTQ5e7k9oqKOFX1SGReDxn
	O4I8dQd3TBKmZmg78cnPWvZRhkOmXOG1D7Lzp2eUVxi2X3nBHUT2ekouodqYkxNQ8aKdkJcDZkm
	03IEWsMCByVQubyH2oRkORBtvz3TF/gAq36Ax1vKq7nSp2p51KLj7SM048NHbvsfphEeOCWQeZH
	VFKF7mQ4iehcIOTNfiJp9XpPDaSNYtp04go5G5RZzPls1Q8Htj4QsD97kgWZv0wzKmyx8bt09lz
	4YR2WHF6YsfCyF+T1HmglYC3Mbf0yF2QIMeew=
X-Received: by 2002:a05:620a:4441:b0:828:faae:b444 with SMTP id af79cd13be357-8cb7bfc8d06mr1818108285a.20.1771884756274;
        Mon, 23 Feb 2026 14:12:36 -0800 (PST)
X-Received: by 2002:a05:620a:4441:b0:828:faae:b444 with SMTP id af79cd13be357-8cb7bfc8d06mr1818103585a.20.1771884755417;
        Mon, 23 Feb 2026 14:12:35 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389a7aaed3esm18805261fa.40.2026.02.23.14.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 14:12:34 -0800 (PST)
Date: Tue, 24 Feb 2026 00:12:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>
Subject: Re: [PATCH RFC 03/18] accel/qda: Add RPMsg transport for Qualcomm
 DSP accelerator
Message-ID: <r7eko65ua2ofyejqf6ipnh6jm4s76f4mqy6a4msgmlraz4xuec@uymfzc65dbng>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-3-fe46a9c1a046@oss.qualcomm.com>
 <tqsdbijgjomrn7fq3sdz7v2axwxqvbccpjh4fmvod4kbrq7pod@af3igw5dx66p>
 <lyco6vkfjlerri55ldyn6fbhihbkhnuolifddcnscevybsztq7@ljhjln2ynmid>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <lyco6vkfjlerri55ldyn6fbhihbkhnuolifddcnscevybsztq7@ljhjln2ynmid>
X-Authority-Analysis: v=2.4 cv=O6A0fR9W c=1 sm=1 tr=0 ts=699cd0d5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=WRMiGO0D-mV3MfwFjRkA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: lYJ6WhtbnL4y7eVO1lDceIhEJKdsQKHR
X-Proofpoint-GUID: lYJ6WhtbnL4y7eVO1lDceIhEJKdsQKHR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE5MyBTYWx0ZWRfX0oeaf5u7NbRR
 dLFIRNwxdfkFLlgRgNd/xTU/H4qeAqDwGY3h18RofgY5FdMoyEXz4FPPsemg2x7nPa/cGcKmVQ7
 OGWJ08rRVdpDUbUuCssLIxCgEZwzbn7dPYskXtYThCjSIo4XvokDw7sxjy7p+PtZwQn6D8qHSpm
 Z5tJ3LV+yKsEkowGQhoVwxczpCJ3LQcD24PRJOPV2SQ2kuiVpfJH6EdPAVzG9xUMEuHJoqmIBtT
 Spjfr+U7UBN6KUflQWfqHfPrQm828zz479mfY8x/mPo673+dfh++Das0ZusS1YcXu7i2x0b4L7G
 gdN8owuDUTsUzER1nKUIXzkS10pLbcmK1PepLuQeOUoRty8y8M/BP7x7oftCmORYOxGY/HdhjB8
 6DRGeA2uSG9jIFkf/8JmsLXBj3ElYxXAmMQv+EJJ8S1L3ImbC7goMoZSMTujIfHbomGrhepNe+E
 726TXvMIpgsz2Pb22WA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_05,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230193
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53238-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.linaro.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1E56417E35A
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 03:50:32PM -0600, Bjorn Andersson wrote:
> On Mon, Feb 23, 2026 at 11:23:13PM +0200, Dmitry Baryshkov wrote:
> > On Tue, Feb 24, 2026 at 12:38:57AM +0530, Ekansh Gupta wrote:
> [..]
> > > diff --git a/drivers/accel/qda/qda_drv.h b/drivers/accel/qda/qda_drv.h
> [..]
> > > +/* Error logging - always logs and tracks errors */
> > > +#define qda_err(qdev, fmt, ...) do { \
> > > +	struct device *__dev = qda_get_log_device(qdev); \
> > > +	if (__dev) \
> > > +		dev_err(__dev, "[%s] " fmt, __func__, ##__VA_ARGS__); \
> > > +	else \
> > > +		pr_err(DRIVER_NAME ": [%s] " fmt, __func__, ##__VA_ARGS__); \
> > 
> > What /why? You are under drm, so you can use drm_* helpers instead.
> > 
> 
> In particular, rather than rolling our own wrappers around standard
> functions, just use dev_err() whenever you have a struct device. And for
> something like fastrpc - life starts at some probe() and ends at some
> remove() so that should be always.

I'd say differently. For the DRM devices the life cycle is centered
around the DRM device (which can outlive platform device for multiple
reasons). So, please start by registering the DRM accel device and using
it for all the logging (and btw for private data management too).

> 
> Regards,
> Bjorn

-- 
With best wishes
Dmitry

