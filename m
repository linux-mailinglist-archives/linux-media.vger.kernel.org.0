Return-Path: <linux-media+bounces-51634-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDv9DxiheGlQrgEAu9opvQ
	(envelope-from <linux-media+bounces-51634-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 12:27:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAD693943
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 12:27:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA77D303817F
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 11:26:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DC4B346E71;
	Tue, 27 Jan 2026 11:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZKmmWLW+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fC6cUgxF"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CD7346E5F
	for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 11:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769513213; cv=none; b=DK62RV3ZWsJCU+ta3O22mpYjpaDDprUQ5fN2IwmFXUrHhGWILXMBP57FgZjKqhrhEnkMANyJJtogqHdDgUPmJng5oF7J2PHc4mI0q2Ye96V4hftzluQsybxIkc3HKRVWzTbxYTmsLu5Mp4Y9733+5GAMFZ+1iuCCo3jZYjsh7HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769513213; c=relaxed/simple;
	bh=rgrYVjGNcBcrE9oeJPVBno8Lt/YAMWDEC79bWmIJR6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KDcgzz3vhxHfjFg4mkkWe4Z1EQKbdNsbbWEro5az2CEutmqwBxsWJBxhvm78DyglWZ8rrJQWHKekm9F+vgoJ4fje2w4y0yipRT+RUpZj+yRo35j/7B+qU7vEks77p4C8KWvxMr2/cmar3cXt0YwSCyLH2SA8BoYK9ZO3NTIJw+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZKmmWLW+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fC6cUgxF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R86pcn620856
	for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 11:26:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SSFWjKOmQdvYxWzHnlfk96Wt+02KeMlBMvjq2MCYtWk=; b=ZKmmWLW+NjXvcmhH
	688u6kvG4+P2ig6wsUHMtpXzyAYd+dDw7fSYg2tBmQMIrGMbhGajrP4FdxHF30cR
	Eib6w7hTc9Hr01MGu5Yv5GfduqH7rearqrcbPy3v6I5LuxQRECi54Qpl1/dgtkC5
	qPsVWXC5CqWBfpgTHT4+hsd0HauKRGVX+W2vMEC5q2F+r8enxgN4k5bZ+8Hk4bJn
	8DGJ0TCnAFLIy1PDyWNcVE8H3V09DSJ/1jG12Do6QI4CPBk17UoX6Juxb08pIdg1
	0OtOigvPzvk6u8b+fw7mw/tX9htYRPAgWtpL+8j5O0OHl9GSjXjW0EvvBalPQUUD
	M6vi+g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxsjegmv7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 11:26:50 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0b7eb0a56so50839635ad.1
        for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 03:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769513209; x=1770118009; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SSFWjKOmQdvYxWzHnlfk96Wt+02KeMlBMvjq2MCYtWk=;
        b=fC6cUgxFzIIMVKCzJ5efF3ST2kR85PDZCHiyd+cnCiF59WVr7UdOXV88ptNasW9dMR
         o8IyjevXqx+XYvw9hgSs98K/bLKXp/NvpyFPsVDoxOm0OFkyUjxwGJ01jEZFchy5GGS1
         01w1dTE9dZFSMMZ6JtophGtnp7Yz9AZXFp6GW/d7PHEFiv7F64UqJ71JRGZGSmJ+SiAC
         KUSkqtdO+Aa3Aup0V1xDy6B2zUDiamOVLEC3zNWDyLZ9PL6NweeeXmyPNFaw96w7X2Ft
         U6e5gqhY3eZEZCrRb13YErJD85ADH1NUHQ0YAFKW30QVubPpT/vlEI4wiazjA1CcGpdt
         eFwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769513209; x=1770118009;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SSFWjKOmQdvYxWzHnlfk96Wt+02KeMlBMvjq2MCYtWk=;
        b=NUs8L5unhrKEihNJU/SYRcPsP5cLB6ZQjp3aZ6hHVpB8aaw/Z7qM8iFHBuVL70tMJ1
         JuI2QSqwHE9TLMM7y89Gsri8DXiioXRNr6SS7NAot+BpKRS/JFe0/oKBiAvH8DLgPzDL
         6ifS+QUnM6T2aHXmi/We9M8UAnVEalssnTlQMGtRAjIqJkzdKRBc8mrIy4WFb4ptu6US
         C2Rkp4DI5kwAB8i42pq4CG1kU9ROLg2yavrHAjxG+4OOJssb8x1loIk8zRDjAuLVL6Z6
         QyffYo8SddoidgK4VeQXwgKaddbFTKgUHgeXmLfaUYd8ZTGbgjAyVxtJFLplAyVUSNmU
         +lPw==
X-Forwarded-Encrypted: i=1; AJvYcCUAya4k8pCfuHIjxyWjrp15As9uhfKRYUlOmungJjcR0QVyjh2lPyVtYfqZOKzKEfW77dA1vmLK+3qNfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8XtvxgeT3c4OPv5/KdLLnrh09alplpu644pWsr5czGaywMf3l
	YiBGYAjYvkllPqhgaTN3wSfwAq0HY/PvhVKth8dGxEu01/KwbcqWQUdd9o1jy65YNyRT3OvsgNm
	dF3YKXmvh8v4BY77TgHUW0TFGYbYKH1Hi0HyM40n85BFMFsp1B892V0b+aQ9gT38AQg==
X-Gm-Gg: AZuq6aJWVo2CKBWicqUXJprnlRXLhnLuw71VegeF8i31acHmqEuquyXG8YUdpUeery5
	oXL2gULwOlISdyz1DMt9dvOF4qPqo+u4L9LXyW2AKsfwKvZ+puX/DB8UCurbSmlHNHa8+8YkbNf
	HyuMJARmwvTrNks9x3yZyHcZHoznx9NR56qsJzdW5Lin8rT+Y9PEgTo5dVtl3Vu6WAKVFHDxPmN
	7FuHPxRtAa7SlgO8zIaRIXur7t41FPChualuFdoTF4D/yRa34d7G8tgfQc+kjweq4ujI/FZ4Mhv
	8hb7rWJRtyCTHr/aaSqesOwA5DKCxcFEWpxgcG0MXAu6NdVBLY8T5PBCwG25bldgNl4rvc9IGNu
	TnHCUzAYcVH76IhYZj7y9SDeB3z13KNZ+8QbjmmRCxA==
X-Received: by 2002:a17:902:e811:b0:2a7:c21e:398d with SMTP id d9443c01a7336-2a870e34ab9mr15010565ad.32.1769513209362;
        Tue, 27 Jan 2026 03:26:49 -0800 (PST)
X-Received: by 2002:a17:902:e811:b0:2a7:c21e:398d with SMTP id d9443c01a7336-2a870e34ab9mr15008695ad.32.1769513205241;
        Tue, 27 Jan 2026 03:26:45 -0800 (PST)
Received: from [10.206.101.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802fb063esm113820875ad.85.2026.01.27.03.26.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 03:26:44 -0800 (PST)
Message-ID: <2d4632b2-916a-4eda-ad08-44af68461dc8@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 16:56:34 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] media: iris: add support for kaanapali platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
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
References: <20260126-kaanapali-iris-v1-0-e2646246bfc1@oss.qualcomm.com>
 <lpgw6eodclsvfwgvtljfiorvjkpd5vd27yhxs7i3ijfibaqzuk@bak2lwbyh77f>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <lpgw6eodclsvfwgvtljfiorvjkpd5vd27yhxs7i3ijfibaqzuk@bak2lwbyh77f>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA5MyBTYWx0ZWRfX4hAmJyXTXwHF
 qTG7Jmht4EVFUnMZrHhE0nJvPEEhsJjHRWRc4WuQZvjRsbfpQME0lT4A2H1HzmwHM+j+TyW2VXN
 /jIvWA++LrnzyWFPWgBp9PyObTkyQg00KXnWiaXbmsF774ZI2BCyusBAlFPdUfj9H3QCmiZwO+g
 BMuv2Q8NxelSqmZwNhUGe7xyDV8/7zmf8nSfiRA4qbRXidXFftpfngPbVil+u63o6XT+hf/szJs
 G6zXCCYQy9QarjAF16VDeqQQ37mwNgbdACQuF0sv0MFRYeW/lFBBASB4a4y4NVDKJlFthP9vxKb
 HJ6dQcznMDzfsMs2U+B2bGzlNzmqM0DgPBxLQeu7lLEoqY1/0t/YBElwLQWRs+NGITtUkcb1JSn
 vMG52nRlBBSsxiALD3K3FvaO8OaQmBfd54Y9vEzNeRbRwJFsx/T9EqvLr4v+zIRqYcRD4mJGEPR
 naZGjGK5ighb4sKa/UA==
X-Authority-Analysis: v=2.4 cv=Qelrf8bv c=1 sm=1 tr=0 ts=6978a0fa cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=IkwSlwTgAPm3BNmR4DcA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: H7wFXwteynJtWx5ND9tw7hcebVNmf9y2
X-Proofpoint-GUID: H7wFXwteynJtWx5ND9tw7hcebVNmf9y2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270093
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51634-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9FAD693943
X-Rspamd-Action: no action


On 1/26/2026 7:08 PM, Dmitry Baryshkov wrote:
> On Mon, Jan 26, 2026 at 05:55:43PM +0530, Vikash Garodia wrote:
>> Qualcomm kaanapali platform have a newer generation of video IP iris4.
>> The hardware have evolved mostly with respect to higher number of power
>> domains as well as multiple clock sources.
>>
>> The series extends support for multiple iommu-map entries for the same
>> input id. Considering iris as a client driver, it adds the handling for
>> multiple stream ids from VPU via iommu-map.
>>
>> This series is depend on the below series:
>> Link: https://lore.kernel.org/all/20260121055400.937856-1-vijayanand.jitta@oss.qualcomm.com/
>>
>> Following are the compliance and functional validation reports.
> 
> Please validate with fluster too. Having a "knowingly good" command line
> is not a validation. It can't be reproduced by anybody else.
> 

Below is the fluster result on kaanapali (will add in cover letter in 
next revision)

H264:
77/135 while testing JVT-AVC_V1 with GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1.
- 52 test vectors failed due to interlaced clips - not supported
- 3 test vectors failed due to unsupported bitstream.
- 2 test vectors failed because SP_SLICE type - not supported by the
   hardware.
- 1 test vector failed due to unsupported profile

H265:
  129/147 testcases passed while testing JCT-VC-HEVC_V1 with
  GStreamer-H.265-V4L2-Gst1.0.
  The failing test case:
  - 10 testcases failed due to unsupported 10 bit format.
  - 4 testcase failed due to unsupported resolution
  - 2 testcase failed due to CRC mismatch
  - 2 test fails due to session error (under debug)
    - PICSIZE_C_Bossen_1
    - WPP_E_ericsson_MAIN_2

VP9:
235/305 testcases passed while testing VP9-TEST-VECTORS with
  GStreamer-VP9-V4L2-Gst1.0.
  The failing test case:
  - 64 testcases failed due to unsupported resolution
  - 2 testcases failed due to unsupported format
  - 1 testcase failed with CRC mismatch (fails with ref decoder as well)
  - 2 testcase failed due to unsupported resolution after sequence change
  - 1 testcase failed due to unsupported stream

>> gstreamer test:
>> Decoders validated with below commands, codec specific:
>> gst-launch-1.0 multifilesrc location=<input_file.h264> stop-index=0 !
>> parsebin ! v4l2h264dec ! video/x-raw ! videoconvert dither=none !
>> video/x-raw,format=I420 ! filesink location=<output_file.yuv>
> 
> Neither of these commands specify, what exactly was validated. They
> specify that you've validated _some_ videos. It's impossible to even
> reproduce your results, because you don't specify which files you've
> used.
> 

commands are shared indicating the pipeline used for validation for 
different codec plugins. These are some basic encode and decode 
commands, and shared for reference for anyone to pick input test files 
of their own.

>>
>> gst-launch-1.0 multifilesrc location=<input_file.hevc> stop-index=0 !
>> parsebin ! v4l2h265dec ! video/x-raw ! videoconvert dither=none !
>> video/x-raw,format=I420 ! filesink location=<output_file.yuv>
>>
>> gst-launch-1.0 filesrc location=<input_file.webm> stop-index=0 !
>> parsebin ! vp9dec ! video/x-raw ! videoconvert dither=none !
>> video/x-raw,format=I420 ! filesink location=<output_file.yuv>
>>
>> Encoders validated with below commands:
>> gst-launch-1.0 -v filesrc location=<input_file.yuv> ! rawvideoparse
>> format=nv12 width=<width> height=<height> framerate=30/1 ! v4l2h264enc
>> capture-io-mode=4 output-io-mode=4 ! filesink sync=true
>> location=<output_file.h264>
> 
> At least these should use test sinks in order to be reproducible.

it is using filesink in the pipeline to generate the encoded bitstream

Regards,
Vikash

