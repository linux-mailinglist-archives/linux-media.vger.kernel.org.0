Return-Path: <linux-media+bounces-58300-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOxsLKYD12mPKggAu9opvQ
	(envelope-from <linux-media+bounces-58300-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 03:40:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 173D13C54AE
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 03:40:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97FAD3021B3E
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 01:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D49931E847;
	Thu,  9 Apr 2026 01:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VxW69UC5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eu3S/Yax"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590B83191D8
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 01:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775698819; cv=none; b=sqDHuAIJ/7FQJu7a5lZ0RifE0PQEbg3m2hXCjVqHlsukmzLf83PlKDYmqgdGGBmwovZCJ7gvpjvuvNTkdR/+5S7RkWIqzcIsvr9Ws7lqyrB6JiJhKWkTGMikpWMZMhA37cU147Tdh/Bq+drCvaMKznK7vAoTLDhWUIAFtFjNFM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775698819; c=relaxed/simple;
	bh=+2aZZ869WlGCRtgMAja1BkIEi0HGtd6g5s9Pzw9/EXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qzAkTNMPr3ilHlKpInXuDlFDE8nlmK4duFPrbOXkevtquXiUrAIfTPLoYNzm7V6AzrC30kEjdlMy7Eb/7ILzzcqVIz/b8QXd93HfqdyE49VVzswSTN1C7bCcBwF1179iWJAOThX2pdCf7neK63b6uw2kfiNZHDxcF0Y2fEEo6Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VxW69UC5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eu3S/Yax; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638NbTb73781421
	for <linux-media@vger.kernel.org>; Thu, 9 Apr 2026 01:40:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wRtbd7Urf4Gyr3odzEwtzFI9pOzfpz8K5nRgUQHJHT8=; b=VxW69UC59AU6/RcH
	vhaJTe67pjZofbvaT8Ks4onK2M68+471Uac3JW5hZ0xEiHdzwNsr1iUdGnKKiyWQ
	csIXE6C6HlOdN72a/pZZDvhoneq0a0p6uOJhDLpmFw5Q8PhMbNXzxnazAM368qPG
	iks58X2ss6vfY6SFQyYGT+XwXTRpI3UqUqXVW0TAfBS7NyCP05wvxLbNv4Om2JcC
	WUX+7cjguKX1x6td14EKoe1+zxpAeWI4frECw1fKfW+23xybi1I4IGgGGLd+OnYq
	J6i3ipp5G+V9SkNdAeN18jSqQSqCPgL7S6+3IDzennD8y//DjlPJhNLPbvAftfdU
	63iewg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddt6y9ven-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 09 Apr 2026 01:40:17 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d63962d83so13921091cf.2
        for <linux-media@vger.kernel.org>; Wed, 08 Apr 2026 18:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775698816; x=1776303616; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wRtbd7Urf4Gyr3odzEwtzFI9pOzfpz8K5nRgUQHJHT8=;
        b=eu3S/YaxCtEDLTRxKFyhxkA4PnqmK2CG/r62NiCWLcvNhNHLv0Cg2nUQWqox1iMSzi
         1U5QPUJpB4syvPldLnrDZVZvvP/J6ACN8+99r1OPqWDZbV7cz7dNLEA7n9DqwYvId4bD
         MVEJEHFWmNXKiUSGuwuzd6HEJ3Mq6j4aDvzaWAPvegMPB1GYLePxZvNj6r6kcUcbkgch
         n25xe4cJhShATfh2yPsTyll0/iTCRdGfNwLOjtlyFhOHnCUa12dGTylk8e/qzLyQ4Y+C
         R8bTN77AyLf3wMayrnawnCbuhxbukKppUAJahExJHDuo0+4ZGNyIWsUY78NVJx4buabt
         /sHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775698816; x=1776303616;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wRtbd7Urf4Gyr3odzEwtzFI9pOzfpz8K5nRgUQHJHT8=;
        b=nlj4wrikcpYwnBq1NDE/6xIig4Og4tyjv8H5Q1dOrxkxUiF8o5WXJoyet9bqUz29YD
         fjVebe+K6ju+0vtTV5AelzatzHqU1jlkxp6rKKiBvDneJ9ZYIDrgfmimwFEbi3N71nJF
         G9PUZf4XMSJWuciAv+lAntAsBm3idt+ineFVFaCVvGH0mT7GOAmXQ+9dQi2ib2cxcoNV
         JVZWau8BRxKnT8uiMrHNa3yr0ntjuOPyMUJ3ocN1eERte0Ab6545yucYj+zhxkkFVAIG
         RLW7mYDlOxwcUdeNgYCkTMuQYI5iMK3FqD8bsUnNpXeoWm9cxtYaIgEYrhe/ASz4YTQ1
         FkkA==
X-Forwarded-Encrypted: i=1; AJvYcCWE1NISEGpLxNlbb+UOv+3SGRv1hoLkJVVMKY9kKPBbzCzMhWxouinVI0TTzPxkUCSG54vSS2YjjuGenQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9OGbXzKYQmLV+PahvW67mlhCYJxnFkBhE9kPx0H8xA54EmROU
	9GyQBHRc8jg44k4UM87nwlevuH33E3QmfKz8z8nXxFtSVRsc2f0wZcs4uG9bwFqv3zbEGZHTjJT
	YdoD6y+P7pE6W4IZzeoA0IytGx5yucdKDNRpudClBaRAisjIrY7XONXa6IoWtPGTrQw==
X-Gm-Gg: AeBDietJJ4AFN1llBFnTvXP0gOhxIxKcC2VOrpeYKZyvVESj7mPcBaO+3DIkVYzRdlF
	9/kha6E1Bz2Xck11lOKrI0qP9cq50b3vxJpDMih5KbLlIp0L7ufmYmtNrLbKzpYV1KT/EENvyKb
	5g/zfYd5RxcknS9TzevKqp0TEBgXbzrvfolFqWJeoveq0lHbItWm91YL1Nit2U+TyBtPUFqMnmX
	AagBHRSs2CsMsQKfOyHTWnZXeQ1Rtk8fV8P9aNk7Mm3Wzh955LYwSGLHaQAbDUW4Q+S1pgcR6Tw
	2XS3Mm+iwvt2NUNhc+wLStvKiJaF6jMSxqK0IqmbB2Rn5HyAfKfDbE0swOk5yOerHafAkZUVwgZ
	bRtEJGx++Gdfu7YWvS3u0frnFMYOVo1H/u54NNOnt848ra1NbzBlsq0n6ThUr0O6GFYzX4fbq5X
	RSBDjNVViY8Inp5gZN0k4JUgVCEVdx8hzxakw=
X-Received: by 2002:a05:622a:346:b0:509:1b76:e9b2 with SMTP id d75a77b69052e-50d62c8a0eamr336392911cf.55.1775698816572;
        Wed, 08 Apr 2026 18:40:16 -0700 (PDT)
X-Received: by 2002:a05:622a:346:b0:509:1b76:e9b2 with SMTP id d75a77b69052e-50d62c8a0eamr336392611cf.55.1775698816047;
        Wed, 08 Apr 2026 18:40:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd3cfa5e9sm46616401fa.11.2026.04.08.18.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 18:40:13 -0700 (PDT)
Date: Thu, 9 Apr 2026 04:40:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 0/7] media: qcom: iris: add support for decoding
 10bit formats
Message-ID: <mdsl5mcgk734p2ypfdeete3ggfnmwizvbl2mulkxeoupm4kqz6@4z544eijvmqw>
References: <20260408-topic-sm8x50-iris-10bit-decoding-v1-0-428c1ec2e3f3@linaro.org>
 <b4uqpepf6caojxe463izkmnrlayrdrgce6jusak33ewcr5yd4w@ukwbo7zfphn2>
 <454f0f277cbaee5774c25d34a33fc3bc478fa756.camel@ndufresne.ca>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <454f0f277cbaee5774c25d34a33fc3bc478fa756.camel@ndufresne.ca>
X-Proofpoint-ORIG-GUID: A1HWuNO8Jk4bN1CqBQvahfudeYHxkHol
X-Proofpoint-GUID: A1HWuNO8Jk4bN1CqBQvahfudeYHxkHol
X-Authority-Analysis: v=2.4 cv=R9sz39RX c=1 sm=1 tr=0 ts=69d70381 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=e5mUnYsNAAAA:8
 a=7Fx9FSj3_RUGzSNVTe8A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDAxMiBTYWx0ZWRfX6pA3td97/v8T
 gW0u+4J5ZS0mIrioeYUjBLAfvoNstypZ/kCQ4xTY5f+e8HVmGyHXIwrWtxteZ/7QOpKmM8t94y9
 yyNudMFUAHHT7gGvtrjbMbLIbRXCBBS+y+dgch87sdYp9cmPgruZTmWts067aCfAHC8cuiNb9q/
 lEkKYsVrGrvuvoZ8XIBINon5q9A6hqdcnezJVxGfCbCGBl3DVIaINud/nGdoUXtJrxE0/x5Ei2X
 XVNBFnqvfDLLe6NvLLbWUhOtQskaynkNeR4bLzIuPVVzYo9O+myxcMGGye0FaWek4zB6FbH6zNp
 +8C1t3L6T4vR4b3D71wcZdguZsqFJLA7EJYiKYYuJCp130ZBa8bZ9n1lw1x3yQEm4KUsda9Yt8U
 PxCpjs5gPrgr2XlIVgg3jYaiiyR5++Hzy0v0mNUePwCLJpQyulKM5YRJFZNDLHrygMMIoVAlEJy
 JMbwFrzAEd/4WBNPUHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_07,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090012
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58300-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 173D13C54AE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 08, 2026 at 09:04:02PM -0400, Nicolas Dufresne wrote:
> Hi,
> 
> Le jeudi 09 avril 2026 à 03:02 +0300, Dmitry Baryshkov a écrit :
> > On Wed, Apr 08, 2026 at 06:43:53PM +0200, Neil Armstrong wrote:
> > > This adds the plumbing to support decoding HEVC and AV1
> > > streams into 10bit pixel formats, linear and compressed.
> > > 
> > > This has only been tested on SM8650 with HEVC, and was inspired by
> > > Venus and the downstream vidc driver for the buffer
> > > calculations and HFI messages.
> > > 
> > > I was unable to get 10bit decoding working with Gstreamer
> > > and ffmpeg, but v4l2-ctl works with:
> > 
> > Any particular errors? I assume Gstreamer needs to be taught about
> > Q10C. But P010 should (hopefully) work.
> 
> P010 should work for both Gst and FFMPEG, its probably a user error, or there is
> a hidden bug in the driver that make it fail, v4l2-ctl is very permissive as it
> simply dump to disk. You should provide an updated fluster score, so you have to
> use one of these.
> 
> For Q10C on GStreamer, it needs mapping [0] and you need some bugfix [1] and
> another that I will be sending tomorrow. We had never tested video compression
> with this module before.
> 
> [0] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8195
> [1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/11222
> 
> The last issue has to do with:
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/blob/38965e2d9c1119674a65dc437ee7e8ec95339f31/subprojects/gst-plugins-good/sys/v4l2/gstv4l2object.c#L4378
> 
> V4L2 format gives us the number of allocation, but not really the number of
> planes, and we forgot to initialize that number for the "opaque" format case. A
> tempory fix might be to add this after S_FMT:
> 
> if (GST_VIDEO_INFO_FORMAT (&info.vinfo) == GST_VIDEO_FORMAT_DMA_DRM)
>   n_v4l_planes = format.fmt.pix_mp.num_planes;
> 
> Works for AFBC and QC at leat, since both are unambiguously single plane, and so
> cannot have mplane variants.

Reading this made me realize another suggestion for Neil:

Please check that the data returned by Iris matches the display driver
expectations. See the comments in the _dpu_format_populate_addrs_ubwc().

> 
> Let me know how far you get! Please be aware that Robert and I are making these
> patches based on feedback, we don't have access to any boards capable of
> decoding to QC compressed formats.
> 
> > 
> > > v4l2-ctl --verbose --set-fmt-video-out=pixelformat=HEVC --set-fmt-video=pixelformat=P010 --stream-mmap --stream-out-mmap --stream-from-hdr Big_Buck_Bunny_1080_10s_30MB_main10.h265.hdr --stream-to out.P010
> > > v4l2-ctl --verbose --set-fmt-video-out=pixelformat=HEVC --set-fmt-video=pixelformat=Q10C --stream-mmap --stream-out-mmap --stream-from-hdr Big_Buck_Bunny_1080_10s_30MB_main10.h265.hdr --stream-to out.QC10
> > > 
> > > The non-10bit decoding still works as before.
> > > 
> > > With Big_Buck_Bunny_1080_10s_30MB reencoded in 10-bit profile
> > > and tranformed in v4l2 header format with [1]:
> > > ffmpeg -i Big_Buck_Bunny_1080_10s_30MB.h264 -pix_fmt yuv420p10le -c:v libx265 -crf 28 -x265-params profile=main10 Big_Buck_Bunny_1080_10s_30MB_main10.h265
> > > /path/to/mkhdr.sh Big_Buck_Bunny_1080_10s_30MB_main10.h265 raw Big_Buck_Bunny_1080_10s_30MB_main10.h265.hdr
> > > 
> > > The frames correctness has been verified buy displaying them
> > > via Vulkan DMA_BUF import, including QC10C and QC08C.
> 
> In GStreamer, once the video4linux plugin issues are fixed, you should be able
> to display the frames using glimagesink. GL only allow for RGB render, which
> damages the data, so its not good enough for conformance testing with
> compression enabled, but usually just doing visual inspection is acceptable.

Nice! Looking forward to testing Q08C aka NV12-UBWC on the display.
Maybe I should try rebuilding the plugins with the mentioned patches and
provide my r-b or report issues there.


-- 
With best wishes
Dmitry

