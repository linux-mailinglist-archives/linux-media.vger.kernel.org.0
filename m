Return-Path: <linux-media+bounces-51572-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OkuNdhud2m8gAEAu9opvQ
	(envelope-from <linux-media+bounces-51572-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 14:40:40 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D0388FDA
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 14:40:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 199413018C00
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 13:38:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C42F333A9C4;
	Mon, 26 Jan 2026 13:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BTGbgHR2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dw1xBCC/"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D633C33A6F1
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 13:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769434728; cv=none; b=sRZvvSZsCRFwpzQVjxyocuy0V4anizsErDDVgXVbvDEKPpx/gTAk6u8q6tsGqG5Dq9XieaIQbZZmDAMCLzAmLN4sbUf/I9FfMdVtYT1M7NMMixLS01uI/ToSwFanv//rehuGOxRiUSjUEooIuyulAMcVge556CNci7O+kb+mHZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769434728; c=relaxed/simple;
	bh=pwjK4+pdWgeLe/K3hHRuwqqM/os1WVoxjKEALfiTNTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RidxFjQTihYAshJ75c1wZxcund2XltO22PZkwCUBN2bQdU3Ps5UJJj2wzABh5stREKmhiVuhJNoG9aU2FxcjHa1ulx8vc07gKBobW2h+1CQM2e6jk2+9Sy5DxRjnZ3iHew349tlgTOMqX1+UkRsgBRGmQPsoqTO7F5iidc96pc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BTGbgHR2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dw1xBCC/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q7ulT21861729
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 13:38:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YskG73YSaDPdLYLxN7gxrpSE
	dUjoPZzx6h1RXNJhXkg=; b=BTGbgHR2c7gbWeI6uKP/KPuMP13PAUsT5cpdAu27
	aTiZUVZVX8dxkgYQCXk8W0rd22yRb+SgIj2x0lIOeSLC91k7+eIg53FH011wJ8PW
	FT75ffvo4WLGUn7RYv7TcbAGESVC563nUgkDr0pjbfy1Mm9OnBnRMkRE3fOtm89E
	FZHZzOnh34tAX5lFyADUtVJ5YsNx17lLpiE7wO8Tso+wAbwA3M3HN1OyxNVjHkep
	Ig0eNKk0ZDh7UkmubwY2/nBXM3yWecBE96K1fksSfByDQZJztn+AsLM49VuHJjYR
	P+x3YxEY/XWnvHhqbpwakA3uZJmLEFxmkA2uYaE9t1BZnA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq8dmpj4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 13:38:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6a289856eso1412127985a.0
        for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 05:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769434725; x=1770039525; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YskG73YSaDPdLYLxN7gxrpSEdUjoPZzx6h1RXNJhXkg=;
        b=dw1xBCC/0MTEEe88HApc69uhPnNiv0zhA42CXuVHg3ssRhJxevUzUCorSlZjIqdUP0
         GRXuNNdUIC3ZnP/EQEZOLh90SFkSBczU4mo6xQym81mkR5DJ/onMFwr0dk0EZhIAN7aj
         /9VpgarBU5tr0c+dwzljzmQWnC14JPf6TB/LLD7w0zrMwCcIF0rhZ+N/KrYupDdWLCKC
         lafbksMjPvxIVj/bJszJumA+0Tv7tpRNGKE4E1qB3T1WxTHOzNVXffjDZtfpqUag69Iy
         abGKXT/41j5jUnlFITjzWwgZXuA4KZAksYRBbq7a6M2lCOPZNXk64uj9RizBPjJKGRKF
         gUYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769434725; x=1770039525;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YskG73YSaDPdLYLxN7gxrpSEdUjoPZzx6h1RXNJhXkg=;
        b=nIUfqEwwENxQ4Tv83DyOUa5rWwM/Pq6RGmCdTBAEK59AvF7EPqVfqvMb0SZ2A9LiNP
         6O5DpYUzHhp3R08dlTeHIOv9QCgfpRx7qhkUZmGlGie1jG8X1FYCUrSOU8EymC4ZV7ms
         RNJnrRkgsHZHKFm8Su9kt+1ZTC++rCgyKahUM29QX1KUNlZtEmXEMZrfpBbPUd4i7FNx
         28eGlfgn+VWQjc63YCximZc3SblJRfNd9UeaPx+SX6KkGk9uJXmQx2IO6gQpi27HGyyW
         YVYXlWQ4bMOhTkILj95sNz6Yfb0bzpnoEHU8mDOnRw1w7zOsA4QSVKSdh6l257H94DBz
         KGcQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9O6zwu+mNImAtc5GLy77FN00gpwg59ZN74DsEVWmhr9juv2MDGy+1gV8AjZxyXhp4f6bDb39TrmfhjA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl9XI3SgDHc/zm5i4oMy5y1g/hk2h51zP6LZBmgJL6ZIw6X0rG
	5hUvjeFK7SIdTvA3Q/EmGLhcQiB+QCyzRTJbKRgesP7BVS1oeMSwjp3s5fMn+NZ/8QabK9s2wlx
	k6VcmegHRUmt8WvqPYV+benGflmQVG07FdYOIWyYxntdL8vC7VZvGQ6x9oI8L3gkm9Q==
X-Gm-Gg: AZuq6aLDWMN1coqW8dm8iJlR4gtrVKEiwGXJs/3TBPkYTkcJGG1jOyPMfNgov2RzRCx
	xudZptvSpGXI50TnPCavnriWDLVuS/lUrb3/hjRZnzZ8LbbwjcjtNtUOto0P6b16lrpJBpQKjNb
	45Zpokw1E7evLTufyddjYAf874VY31tvQgDkwUjdsE0REL2x/AfJAHyDGwLfH8S5nXouBSVFxzG
	nnI1EaVOYMU+Qxkof4cBwu32iYx7dsN/EJ+EjRwVPnjCvc5Du3xZH5wuPQNbmSG1++66HOHTSb4
	wtsCxD4pDNtf2829tNuyA1WmberLNfpe+132depkDL4zxZTTpKqzYua9ZSKYzCOBY5Le+9ZhUSd
	ylwYHYY6zt3hMvTcTZeFJkw37kRkjXliedBSyplpoSiQEFlRSe9LgzAf1LfZPhrfN1Ic8wSsdUc
	vepSLEk+OS0FFiePHmEAsp9Ow=
X-Received: by 2002:a05:620a:1aa2:b0:8b2:63ae:6343 with SMTP id af79cd13be357-8c6f987646amr480076885a.28.1769434724708;
        Mon, 26 Jan 2026 05:38:44 -0800 (PST)
X-Received: by 2002:a05:620a:1aa2:b0:8b2:63ae:6343 with SMTP id af79cd13be357-8c6f987646amr480073185a.28.1769434724156;
        Mon, 26 Jan 2026 05:38:44 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385da017b5esm27709771fa.19.2026.01.26.05.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 05:38:41 -0800 (PST)
Date: Mon, 26 Jan 2026 15:38:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>,
        Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Subject: Re: [PATCH 0/7] media: iris: add support for kaanapali platform
Message-ID: <lpgw6eodclsvfwgvtljfiorvjkpd5vd27yhxs7i3ijfibaqzuk@bak2lwbyh77f>
References: <20260126-kaanapali-iris-v1-0-e2646246bfc1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126-kaanapali-iris-v1-0-e2646246bfc1@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDExNiBTYWx0ZWRfX9hNHBopjS4JB
 /W8t/Vgs4vD6h+cj9EHXFB4FGimZatIEewWkv9XNMjtGsse1jmt1u0OaMEgz36VJ633H2X1jF1E
 7GM2s7VisYV5HE5qDGkOGiZy/io+Imuwhw/sf3CcpQUDpy+YHC7OYPO6jH/zjO888cCDrNPJwkz
 J2qNYLeIbIu7VPr+u4a4Jm9H4bK5AkJVZhsAVGpaKVqdmWf9SJdZGBy7SF4sweV+KkxJoWU1jNI
 4L1NGatmgneUrcNTVANiEIl6gbmx1ldyNrJoyALp1AAQ0j5kFxu9X6CSBupgRUIHjgeTVPJkbOp
 Gd6giddsWd+LubOUij8B2nbUial0CToC4RyUKKMFgvWd+b7WN13R4gcGAqKn4pQYdXecyQsFX4n
 neaODPrDhBNJrKe5sIi00aYfx3jzIXdDBmb1+tPyP0mGDJYpX8eDAgRUMkb3CP6IVfMJcsyR8F0
 /r72kNl+9iLv5p4V08w==
X-Authority-Analysis: v=2.4 cv=RIq+3oi+ c=1 sm=1 tr=0 ts=69776e65 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=WVDdUWqqhAlxm7gINyEA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: NuJwf0LAXyHvfzTJB4lWfTqbpZbJPhCN
X-Proofpoint-GUID: NuJwf0LAXyHvfzTJB4lWfTqbpZbJPhCN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_03,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260116
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51572-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim];
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
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 53D0388FDA
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 05:55:43PM +0530, Vikash Garodia wrote:
> Qualcomm kaanapali platform have a newer generation of video IP iris4. 
> The hardware have evolved mostly with respect to higher number of power 
> domains as well as multiple clock sources.
> 
> The series extends support for multiple iommu-map entries for the same 
> input id. Considering iris as a client driver, it adds the handling for 
> multiple stream ids from VPU via iommu-map.
> 
> This series is depend on the below series:
> Link: https://lore.kernel.org/all/20260121055400.937856-1-vijayanand.jitta@oss.qualcomm.com/
> 
> Following are the compliance and functional validation reports.

Please validate with fluster too. Having a "knowingly good" command line
is not a validation. It can't be reproduced by anybody else.

> gstreamer test:
> Decoders validated with below commands, codec specific:
> gst-launch-1.0 multifilesrc location=<input_file.h264> stop-index=0 !
> parsebin ! v4l2h264dec ! video/x-raw ! videoconvert dither=none !
> video/x-raw,format=I420 ! filesink location=<output_file.yuv>

Neither of these commands specify, what exactly was validated. They
specify that you've validated _some_ videos. It's impossible to even
reproduce your results, because you don't specify which files you've
used.

> 
> gst-launch-1.0 multifilesrc location=<input_file.hevc> stop-index=0 !
> parsebin ! v4l2h265dec ! video/x-raw ! videoconvert dither=none !
> video/x-raw,format=I420 ! filesink location=<output_file.yuv>
> 
> gst-launch-1.0 filesrc location=<input_file.webm> stop-index=0 !
> parsebin ! vp9dec ! video/x-raw ! videoconvert dither=none !
> video/x-raw,format=I420 ! filesink location=<output_file.yuv>
> 
> Encoders validated with below commands:
> gst-launch-1.0 -v filesrc location=<input_file.yuv> ! rawvideoparse
> format=nv12 width=<width> height=<height> framerate=30/1 ! v4l2h264enc
> capture-io-mode=4 output-io-mode=4 ! filesink sync=true
> location=<output_file.h264>

At least these should use test sinks in order to be reproducible.

> 
> gst-launch-1.0 -v filesrc location=<input_file.yuv> ! rawvideoparse
> format=nv12 width=<width> height=<height> framerate=30/1 ! v4l2h265enc
> capture-io-mode=4 output-io-mode=4 ! filesink sync=true
> location=<output_file.hevc>
> 
> ffmpeg test:
> Decoders validated with below commands:
> ffmpeg -vcodec h264_v4l2m2m -i <input_file.h264> -pix_fmt nv12 -vsync 0
> output_file.yuv -y
> ffmpeg -vcodec hevc_v4l2m2m -i <input_file.hevc> -pix_fmt nv12 -vsync 0
> output_file.yuv -y
> ffmpeg -vcodec vp9_v4l2m2m -i <input_file.webm> -pix_fmt nv12 -vsync 0
> output_file.yuv -y
> 
> v4l2-ctl test
> Decoders validated with below commands:
> v4l2-ctl --verbose --set-fmt-video-out=pixelformat=H264
> --set-fmt-video=pixelformat=NV12 --stream-mmap --stream-out-mmap
> --stream-from=<input_file.h264> --stream-to=<output_file.yuv>
> 
> v4l2-ctl --verbose --set-fmt-video-out=pixelformat=HEVC
> --set-fmt-video=pixelformat=NV12 --stream-mmap --stream-out-mmap
> --stream-from=input_file.bit --stream-to=<output_file.yuv>
> 
> v4l2-ctl --verbose --set-fmt-video-out=pixelformat=VP90
> --set-fmt-video=pixelformat=NV12 --stream-mmap --stream-out-mmap
> --stream-from-hdr=input_file.hdr  --stream-mmap
> --stream-to=<output_file.yuv>
> 
> Encoders validated with below commands:
> v4l2-ctl --verbose
> --set-fmt-video-out=width=<width>,height=<height>,pixelformat=NV12
> --set-selection-output
> target=crop,top=0,left=0,width=<width>,height=<height>
> --set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap
> --stream-from=<input_file.yuv> --stream-to=<output_file.h264> -d
> /dev/video1
> v4l2-ctl --verbose
> --set-fmt-video-out=width=<width>,height=<height>,pixelformat=NV12
> --set-selection-output
> target=crop,top=0,left=0,width=<width>,height=<height>
> --set-fmt-video=pixelformat=HEVC --stream-mmap --stream-out-mmap
> --stream-from=<input_file.yuv> --stream-to=<output_file.hevc> -d
> /dev/video1

-- 
With best wishes
Dmitry

