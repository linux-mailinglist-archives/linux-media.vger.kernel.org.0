Return-Path: <linux-media+bounces-51701-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJF0OsPseGkCuAEAu9opvQ
	(envelope-from <linux-media+bounces-51701-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 17:50:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E6C97F5E
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 17:50:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A94F1302084D
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 16:50:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2456362141;
	Tue, 27 Jan 2026 16:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PFmZWdbd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J0RDVVPJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB80436165A
	for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 16:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769532596; cv=none; b=uIpdluykXUUvCLq6VZs8wk1fK1McnmIoVX5gdMZ8vyPRVYDqcV7yOd4g5PXG58Dhvg6+I98ftw5IWFARKYPkBopj+9pl/N/bPAHqmc/DReVX8HJKPaiohkgOXwyETtnDB1dbqbNyq3aNsWBoZwQkb5WSztKorDWJFKN9pPmhRnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769532596; c=relaxed/simple;
	bh=uI2HXAW17zYtOEMTXnjlUKn9NrrZpUIxt/eqbaiU+Ks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H2fcRHuh+ZrSASUByBDeGpyCVwjKttildJ31Q3f5kGokETXBD+huBmTempBE2vhbPv6EXHEstfpbheQXMAxhbYTmLvgDUaOsvF/fo86bLkThyJs8jhHmnz5xOfXS+p332YkaTau14m8SzRLldHlUdSY7F5UfWUdGVaTnBQRmm8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PFmZWdbd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J0RDVVPJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RF4Ljx2378873
	for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 16:49:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yQo6VrZHfmG9VNHQSAg9y8t7
	eLlTHj5DLIPChUOy9a4=; b=PFmZWdbdxzcBW9ca31lVQLc+xXMI3DzoFV0gl3zk
	7qw2Be+dAUUZiAMTyOM56y71ppPWLB53fgboIv6wgpgKDDMvUn2cmSk9qMZRgkiJ
	nx5yyrMVBZyXP+oMkBH5h/LQpNOCRF9mznreE1Uf8gr3JnenyWJr1x+69cuHmB3e
	NTFR+yNAazM+KDyLpd1srghzyUW0XogeDHz/X3RrX5NPQ8B6zkaUAfHP/4r3hUCd
	XN1vX0/AVVn/6PVDAhVfW7H7tAO9qcHOtI4t/MMA6jRYo7xH2B5NUNZpk+eic6Ct
	ndfhV5Ta/DYmn5C6gRf1IOQsPwAuRn7XOKlP2xtswWzwfw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxsjr9rvm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 16:49:53 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-93f65d0a94eso7884612241.2
        for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 08:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769532593; x=1770137393; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yQo6VrZHfmG9VNHQSAg9y8t7eLlTHj5DLIPChUOy9a4=;
        b=J0RDVVPJeUwXuFd59hnpSyl0SqQCqCw05KFsi5Smtape4ekgq9WxvVJMSPExuGQO5c
         zgq3c3OpNq/k3Mh983O6A0sGDKmJI7/fieWVlZnamfuvym1jXBsyBKFqIpLFqKixJ1De
         +PNVaciRFig88aAYJBC6aKF/EMg3lKd0OzGwqTgeBm3O3O2b04ZsKmO/+Ty0e+N2cfjQ
         aEbd8vY0K1vBcpySsEb/QOGdygSGBH6pGw8vvmvThE3/huEVfFZVu/Hjjh7CUg9abXVo
         KlOHiuj9pO/FYQJUIqe6n7yHnBlvdxzA1blNDhoniEBmQrAo7lnD0GkJ72oy33kr87uy
         koRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769532593; x=1770137393;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yQo6VrZHfmG9VNHQSAg9y8t7eLlTHj5DLIPChUOy9a4=;
        b=CBe6LZ+13yRvG4BO5tCmav/zZbOHQutTeY67Dh7xklem6Q9Mf2xMOJUSx2kBpyopdQ
         up97mQooB/wuOp1ihmKYsFrlquNFcuCIQpZi6I7pcsyuryjjOe1TKgtxvh77zQI5wYC9
         ImzH0F+rFMhrq7gFi6eVYHG8JNreIFyvKxlHO4i67IoeQII+sOcpJbPTqEP6eUZJfoQ1
         awWDIAAp7N1B4POQBYj5CWtptFRFZd9rZ0BOTF8qj+xhf7xp/nVbujM4nAwT/a4gu9A1
         PyrQ0IM0NfdPo6hd8loB0HrTlLkK0m8JdohHlhBHk5WzIc/BtYrokkoeLnv8pNdFaO7z
         oOHA==
X-Forwarded-Encrypted: i=1; AJvYcCUz9SnjaEPDS5y3tk90kE1swcRlRFD9BwpFLBSk9WFUrclvqsEyKP+dsWSu7InBKziBhhYsaf36MT1qfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqSSbGsXBRq30AlkepOffBsVlOZQskMYFdaZuJN54T/X8be9cz
	TejhLVmhtYHkWN5xYAY+VpXBNTslo6RAgkZPMLDPI1Dingo3MY/55GWRL9WMVgMx0aF9ONUHqXh
	F5wDPf2ZnQY4+uCovMVaZCmmjJQrtKhgIjB7PbnhxpUuKle4hnlb3inVqxPcHgG0roA==
X-Gm-Gg: AZuq6aIcBptWxKIoFomzrvNTcTpphEF/nOLdd6+s+WMxnZhja/w8ozKh9IjPUrgnKlE
	AOfV+RpfiFp7p6Pkzes+rkPaWjglXu5u3FcBOy79jTFOpar/Bd+NwmE/vUYCPjc559PcSmFJjDt
	un2Imd+6RtywXdkzW1qfWRLel7rIGQWPz/GZUN80NfAsUlAyiOijZvR08glc4u1moYmWP6qDNUR
	jSjEl1i8+TRkvNv2YG/pu9sawQh6DO7172Buhk9x/8M6rPu//8AABSMkhrSVpVS0ESQ83IoRTZY
	fKOTFmzhH/WkgSp/bqTzYSVEJStdy5D9gmRFPTP2YyV6OjFo+VgTh1oDSHCNx5zztq3ntullAz+
	ue7KXArL2YMYLbEV3gwa2m/NEU+UOf4LmeVIJwFDIzSWmTqWTQ/TC3S/74ylKHyZYucsWimFIKz
	vfb/iWvmMt39Lt8qoUotd6pFs=
X-Received: by 2002:a05:6102:41a6:b0:5ee:a1e5:6504 with SMTP id ada2fe7eead31-5f7238206afmr850570137.36.1769532592706;
        Tue, 27 Jan 2026 08:49:52 -0800 (PST)
X-Received: by 2002:a05:6102:41a6:b0:5ee:a1e5:6504 with SMTP id ada2fe7eead31-5f7238206afmr850558137.36.1769532592052;
        Tue, 27 Jan 2026 08:49:52 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074887desm46265e87.27.2026.01.27.08.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 08:49:51 -0800 (PST)
Date: Tue, 27 Jan 2026 18:49:49 +0200
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
Message-ID: <svmbjepmhjub2coqismesfjd7wgaenauawszjophmozntjohw3@566w2rnnycou>
References: <20260126-kaanapali-iris-v1-0-e2646246bfc1@oss.qualcomm.com>
 <lpgw6eodclsvfwgvtljfiorvjkpd5vd27yhxs7i3ijfibaqzuk@bak2lwbyh77f>
 <2d4632b2-916a-4eda-ad08-44af68461dc8@oss.qualcomm.com>
 <vv4stkmrrwdqmbnpv7pg5nd4immtqo5iplwbcia3oykycfmg2m@dsithotfy5ls>
 <eef542b8-2a1c-4941-8895-453a108634dd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eef542b8-2a1c-4941-8895-453a108634dd@oss.qualcomm.com>
X-Proofpoint-GUID: rB4Ju7kjbYS0N8iXDp9x6i6ENiuWw0iR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEzNyBTYWx0ZWRfX7rVFhdJQhKR7
 6/MHJ2NBvMGQgv270wxoiM/aa4tBVaf9JsKN+8caXCypzVFavnWhZsOXmxnhiC2YERPXHZ5qc4q
 OeGGvV9HKi7ISSqlx+hHRHhlpstsTiy9RXySk7GHeRDADPEfIUngw4wMtDlcrxt6QJmqvf+l0ED
 CWjXnspb028eiyOLS0utza2hqgY8M6hyukwgE5W5uYRLjhkAOK/OPjIq3twqUOxr6kWw65M+PM1
 u/FxrCljrdKAsBwMnrMmkDjzGkOjlInuUA7N8yHVHD7/5iTZ9i8bGPci1YDcOaMy3aZ2KdT9nno
 AW/UbXVl2qNyJk6jcsX3I3VJL9BQvcwFosgPBg0FvveEzUg8mwSKvK/xr2V878i3VeR1/kzdiqW
 WcqFQXHZUnGNU4EEEjFhdSaNLYHhg6ivNbKYNt+osjYpw0nPBXr9GOOi5DLtkBTcj21ihVvffq5
 xNuLFkMR4y90FwusJgw==
X-Authority-Analysis: v=2.4 cv=b+i/I9Gx c=1 sm=1 tr=0 ts=6978ecb1 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=e5mUnYsNAAAA:8 a=dHVBxyF5DYbF2fpzP9wA:9
 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: rB4Ju7kjbYS0N8iXDp9x6i6ENiuWw0iR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_03,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270137
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
	TAGGED_FROM(0.00)[bounces-51701-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: A1E6C97F5E
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 09:41:01PM +0530, Vikash Garodia wrote:
> 
> On 1/27/2026 5:22 PM, Dmitry Baryshkov wrote:
> > On Tue, Jan 27, 2026 at 04:56:34PM +0530, Vikash Garodia wrote:
> > > 
> > > On 1/26/2026 7:08 PM, Dmitry Baryshkov wrote:
> > > > On Mon, Jan 26, 2026 at 05:55:43PM +0530, Vikash Garodia wrote:
> > > > > Qualcomm kaanapali platform have a newer generation of video IP iris4.
> > > > > The hardware have evolved mostly with respect to higher number of power
> > > > > domains as well as multiple clock sources.
> > > > > 
> > > > > The series extends support for multiple iommu-map entries for the same
> > > > > input id. Considering iris as a client driver, it adds the handling for
> > > > > multiple stream ids from VPU via iommu-map.
> > > > > 
> > > > > This series is depend on the below series:
> > > > > Link: https://lore.kernel.org/all/20260121055400.937856-1-vijayanand.jitta@oss.qualcomm.com/
> > > > > 
> > > > > Following are the compliance and functional validation reports.
> > > > 
> > > > Please validate with fluster too. Having a "knowingly good" command line
> > > > is not a validation. It can't be reproduced by anybody else.
> > > > 
> > > 
> > > Below is the fluster result on kaanapali (will add in cover letter in next
> > > revision)
> > 
> > Nice, thanks!
> > 
> > > 
> > > H264:
> > > 77/135 while testing JVT-AVC_V1 with GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1.
> > 
> > What about the extension testsuites? Even if they are not supported,
> > they should not crash or cause the timeouts.
> > 
> > > - 52 test vectors failed due to interlaced clips - not supported
> > 
> > Yet or completely? Does "failed" mean "returned an error" or something
> > else?
> 
> completely. Driver returns error on firmware detecting the content as
> interlace.

Ok. I was more worried about timeouts or other kinds of failures.

> 
> > 
> > > - 3 test vectors failed due to unsupported bitstream.
> > > - 2 test vectors failed because SP_SLICE type - not supported by the
> > >    hardware.
> > > - 1 test vector failed due to unsupported profile
> > > 
> > > H265:
> > >   129/147 testcases passed while testing JCT-VC-HEVC_V1 with
> > >   GStreamer-H.265-V4L2-Gst1.0.
> > >   The failing test case:
> > >   - 10 testcases failed due to unsupported 10 bit format.
> > 
> > MAIN10? I was actually surprised, Venus driver supported them for the
> > Iris2 hardware. Is it somethething to be fixed in future?
> 
> 10bit would be added in iris. We are catching up with all the codecs, 10bit
> should be next from decoder side.

Thanks!

> > > > > gst-launch-1.0 multifilesrc location=<input_file.hevc> stop-index=0 !
> > > > > parsebin ! v4l2h265dec ! video/x-raw ! videoconvert dither=none !
> > > > > video/x-raw,format=I420 ! filesink location=<output_file.yuv>
> > > > > 
> > > > > gst-launch-1.0 filesrc location=<input_file.webm> stop-index=0 !
> > > > > parsebin ! vp9dec ! video/x-raw ! videoconvert dither=none !
> > > > > video/x-raw,format=I420 ! filesink location=<output_file.yuv>
> > > > > 
> > > > > Encoders validated with below commands:
> > > > > gst-launch-1.0 -v filesrc location=<input_file.yuv> ! rawvideoparse
> > > > > format=nv12 width=<width> height=<height> framerate=30/1 ! v4l2h264enc
> > > > > capture-io-mode=4 output-io-mode=4 ! filesink sync=true
> > > > > location=<output_file.h264>
> > > > 
> > > > At least these should use test sinks in order to be reproducible.
> > > 
> > > it is using filesink in the pipeline to generate the encoded bitstream
> > 
> > I should have been more explicit: test sinks to generate the image.
> > 
> 
> If you could suggest a gst pipeline for it, i can give it a try.

gst-launch-1.0 -v videotestsrc pattern=smpte '!' video/x-raw,width=1280,height=720 '!' xvimagesink

There are other patterns supported too:
https://gstreamer.freedesktop.org/documentation/videotestsrc/index.html?gi-language=c#GstVideoTestSrcMotionType

-- 
With best wishes
Dmitry

