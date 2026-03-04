Return-Path: <linux-media+bounces-54420-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLkzAYqzp2k6jQAAu9opvQ
	(envelope-from <linux-media+bounces-54420-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 05:22:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 532631FAAC7
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 05:22:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 88F53308DDB4
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2026 04:22:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A224237F74C;
	Wed,  4 Mar 2026 04:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c/Z5n66U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iVwFXDr2"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E295937EFFD
	for <linux-media@vger.kernel.org>; Wed,  4 Mar 2026 04:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772598135; cv=none; b=pjtMliGd4Kn7shaWPG0azGcQGFrvz8L8SihEAGBNqk0wxShAamY86jGDJbV0fodEUW6AqFPD7+G5yKzxRcS0gaPK91/YIHZf1HXDSZhJvJubrl8oCXMTKKm50EEYijoEtQ0H6Uu61uOKzeUAA+nWKmIFtfhSz7kB+06uqdnZw2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772598135; c=relaxed/simple;
	bh=vfZ4Fm1illYeYZxI8bJ8e1HWahncA/1F2Qj57ZqkvyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LMjPqYC39dO28I9XtdwO/kptnDiFFeODZJZ6PLGsi/BOzCSeHhhGQH9rxjxJ5XMfNA7V7YctURv1Z3TXTzJ8KDh9bi9sPxibvWmhZeTAGr3Hn9lyg1XoVq//KVIvTLz0Rsxls0lyDM08UhpW+pIEzXOluatkuWZ+eTvbNBZF+I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c/Z5n66U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iVwFXDr2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6244IdtU795406
	for <linux-media@vger.kernel.org>; Wed, 4 Mar 2026 04:22:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tlbeDGjUP0JSGoux2wklhzIf
	NMznEwVoyK8emBv6LqI=; b=c/Z5n66UUeyIGhW6V3AS80qPffCne7OeN24B8uqj
	dnBn9Vc/Kq1CVFKJFUDn9HSKvsrJUA+EOnZV179NYpUMjZECKSE8wvJzsJKVB7XH
	K4EPD3iBaCNSxGR9t/QtdYgR7U/L9GtcpsonFi0FGsWk9PYuirNMLIQXIM5Y2gv4
	PKJjYeF58AYRdVqSOSu5nbb2syGAGqCyLhceytWPICAby7BPXIN4ujlNNd994q4k
	4Iai0zouxtO767KHYoRxXctKM1sAoOyoKg8n7filX7iHVT3tKkCRTGFX72Eva6ka
	m5n++swUkhl0cSLxAYG6RIDoiNNZmkJ2PYJvof08wJHT9w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnvxfbgbh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 04 Mar 2026 04:22:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb4d191ef1so809827485a.0
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 20:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772598132; x=1773202932; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tlbeDGjUP0JSGoux2wklhzIfNMznEwVoyK8emBv6LqI=;
        b=iVwFXDr28B+dHTgHu6ymmd1jkyis9H/i0a/+MV2C53gZGLKDhs72hcdTbFS2RACpXF
         UV3TnnfhAxQlYSA0usQu6Xc1oXA2M1rY5pmnBi44U2XZoFCzAoINhCJQD9ltvuVgInC+
         hVnvUZ0uhFzGfN+VTIoYc21HOHUIdf5oqbrkBGJUSmqz9ch2b4PR2Zfa40Jqovrao6aS
         9W0sOPns8Xd02gXUUwDSbRRViCzuyy3z04YYlm1cZuLGxXp2/LCYnsLuK5yaLW2l+FAs
         c6tgqal9ycCrn3ieBN2apsqO/PCSvU91P8H9SDHKYRqc/c58C+x7SqlJ1M+Hiv9kPPRX
         XsXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772598132; x=1773202932;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tlbeDGjUP0JSGoux2wklhzIfNMznEwVoyK8emBv6LqI=;
        b=DpXCC8JFdc0hefhoBgVi1IHEIrNzJq96/oKlyZBtmsgCtwZuaFHgoqIhroMl3CQd/I
         w5hGeWOz11Ck0ZAQ+iFT5Xtb/86YcrG0urK5xQIgsF3qD5H9675rYKgmoHphPTmWZVKc
         QgjX6wNQmCV1ZGDWwQq9NClqjxqLSL1iqUZDtsd8YnAgBXU57tdvgjpiC5wYgVAuaZRt
         xKVevHyEk0EjvS79MSQPmRRMNjaxWNpYGxLMv9XQ8YtCKYJzRb5zrqmbc1X3205uk8LP
         6R+sbmgb7YVt+G8bRmABBlrsjzVuCr+UYnv5vWwiMSClBpWbiePqPK52tmmgXUE2/UFL
         igwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXToO576yNKrs8JbYpH20oUYKOTys8IvAZIg9cZAOzx9zV5jehCOv7W5NdCz0jXYmXHQfYu5hxc6Dd2Hw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPlEdldSJQIaoNUUDNY0l5vDwUqGvMEyd0yJa9/2CH0fpJgxCq
	/c2/w4xMZCOoblGSQhHZGlToOfNijhSIc1F/g4Pd/KEdN5iqNgqZEMO2dUDyl+AnA7S+idn/7l0
	jcyanq57oslIXoQGif9o0CjBpzLDEo/KA4Sxei3ltnveVXtH+6dz3MecIeYNr7FjKjw==
X-Gm-Gg: ATEYQzxajt6PcXNxsIy2fw/j1fFSY2tGF5HIU1j/K1uF35XrahzEEUuVnMspxjN4GDD
	QuN5cA34EwhYIsx8DzeiwtAHh/tRDpf4ONxu2fI/IWn8o3dpczICVxOlABf48UJ6UuH0xhAh7kf
	+AzQjdFzg5+vaK9zJ0S/R+/G/JAEnNE0h3uK5NxUjI2MZvrEUEu6t4PfGqJTSa7gXxR38r7Q8aE
	dTmldS63oOQTpEoa2/n78Ns7JBvKtLZucmBObiP6mVjw6CSr2Gy+WLy/3gxkEyRy/sV+j6PBVJH
	iTRUmqn8WSvV46aUsQp8t0ubxnN45YaHbrJsgxnCYePWJXCXIYrXq8FZchP7pRoYtxm2Dx/DE1u
	ztNtArBdHzPdij7oN4Q7GC1xIqSWoCfu/7uIRE4UQSU+bryF3F/zWBgtBbZdSJ1ZqXsCCmEIeM9
	TEuyyxOoV5l7Vx3HQUzg1i3I311aqUSBMxJoI=
X-Received: by 2002:a05:620a:4609:b0:8c9:fc46:235c with SMTP id af79cd13be357-8cd5afc1082mr91775785a.71.1772598132174;
        Tue, 03 Mar 2026 20:22:12 -0800 (PST)
X-Received: by 2002:a05:620a:4609:b0:8c9:fc46:235c with SMTP id af79cd13be357-8cd5afc1082mr91772185a.71.1772598131614;
        Tue, 03 Mar 2026 20:22:11 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a12a6e4c0csm227636e87.2.2026.03.03.20.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 20:22:10 -0800 (PST)
Date: Wed, 4 Mar 2026 06:22:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
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
Subject: Re: [PATCH RFC 06/18] accel/qda: Add memory manager for CB devices
Message-ID: <wubjsfz2ijtqvwwqc6y2bawinpdwvvke6vh4owytcxjdmbfjji@ybmz23zic5dn>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-6-fe46a9c1a046@oss.qualcomm.com>
 <d7s4e7xzfqfbcf5o3grc6xqm74dzwpck6ge7hyrwewmyacpuez@lcd6nhzyjr55>
 <5448e807-2435-42f4-b98e-2beb6b66a6f4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5448e807-2435-42f4-b98e-2beb6b66a6f4@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDAzMyBTYWx0ZWRfXy/81ffpWOXX5
 xzLAR53AfzpJ8tLtj424M6JhHxFPWF9UQCX3yOa/bg3szMQrmLoVjFSB6Tf6q0F/i6GrR6gVwn0
 NIcKf+tCy7+MdqVjWa2MO1L2mUCrrNLBkMS1tlY4LYjZ3cshG0AYnFrb7iipsyAPIva2dPlA9S2
 Pb1QbrKs5DMz4S25S/aIAcWNW0IevspliMi2mLSaxqV9FMhY0cRPnlzy2xr8DxrhRfAOmkN8AtC
 2YxAZEOr2OI+N86wgZn1tRcok7LOU9pV7GotazzULrL+gPjg9xGtBR5CxqB6GmIBeOaR54BnOrs
 8KE2F5Z5L50+SOI1KRXN/+G3MgwfdPg4YJ505jRfsR8aiaF9xlBkCAQ+gFuPw431SGyS93PLGbE
 f4TpFPxRkwLT93yeN3nkaUE4RgGsZiymE0Am+TgzwsVyYwW4IMecgsMHpjzp+ikIeD7NlxOhKCV
 JjQDungF7Ul6ybi2TCQ==
X-Proofpoint-ORIG-GUID: al3cpb3cc1R6HrkEG0DjNT8kTgwKJe0i
X-Authority-Analysis: v=2.4 cv=S+HUAYsP c=1 sm=1 tr=0 ts=69a7b374 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=LbhuFg2odiTRP-zraWgA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: al3cpb3cc1R6HrkEG0DjNT8kTgwKJe0i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_02,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040033
X-Rspamd-Queue-Id: 532631FAAC7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54420-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.linaro.org,oss.qualcomm.com,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 01:45:09PM +0530, Ekansh Gupta wrote:
> 
> 
> On 2/24/2026 4:20 AM, Dmitry Baryshkov wrote:
> > On Tue, Feb 24, 2026 at 12:39:00AM +0530, Ekansh Gupta wrote:
> >> Introduce a per-device memory manager for the QDA driver that tracks
> >> IOMMU-capable compute context-bank (CB) devices. Each CB device is
> >> represented by a qda_iommu_device and registered with a central
> >> qda_memory_manager instance owned by qda_dev.
> >>
> >> The memory manager maintains an xarray of devices and assigns a
> >> unique ID to each CB. It also provides basic lifetime management
> > Sounds like IDR.
> I was planning to stick with xarray accross QDA as IDR gives checkpatch warnings.

Ack.

> >
> >> and a workqueue for deferred device removal. qda_cb_setup_device()
> > What is deferred device removal? Why do you need it?
> This is not needed, I was trying some experiment in my initial design(CB aggregation),
> but it's not needed now, I'll remove this.

Ack

> >
> >> now allocates a qda_iommu_device for each CB and registers it with
> >> the memory manager after DMA configuration succeeds.
> >>
> >> qda_init_device() is extended to allocate and initialize the memory
> >> manager, while qda_deinit_device() will tear it down in later
> >> patches. This prepares the QDA driver for fine-grained memory and
> >> IOMMU domain management tied to individual CB devices.
> >>
> >> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> >> ---
> >>  drivers/accel/qda/Makefile             |   1 +
> >>  drivers/accel/qda/qda_cb.c             |  32 +++++++
> >>  drivers/accel/qda/qda_drv.c            |  46 ++++++++++
> >>  drivers/accel/qda/qda_drv.h            |   3 +
> >>  drivers/accel/qda/qda_memory_manager.c | 152 +++++++++++++++++++++++++++++++++
> >>  drivers/accel/qda/qda_memory_manager.h | 101 ++++++++++++++++++++++
> >>  6 files changed, 335 insertions(+)
> >>
> 

-- 
With best wishes
Dmitry

