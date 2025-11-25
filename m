Return-Path: <linux-media+bounces-47721-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 17123C8735C
	for <lists+linux-media@lfdr.de>; Tue, 25 Nov 2025 22:19:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F05923AB476
	for <lists+linux-media@lfdr.de>; Tue, 25 Nov 2025 21:19:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D5252FD7D3;
	Tue, 25 Nov 2025 21:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lJ+g6qcG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O9+Hnj3w"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5E72FB0BA
	for <linux-media@vger.kernel.org>; Tue, 25 Nov 2025 21:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764105562; cv=none; b=djfg1jVIIj7IvAO0Yw/56wytf/j2ItHbP27Hh31YqhcR8O7g9Nt6oJL1EcNJc5ojZO4d1Guzk5e3PpuYewzYzey5l8hklreQT5KKTNkdCwepriONbdFkZvm5kRaEyRirsGp/WoRFgALAU7paW+y21nrkSVeWby0VifhrZ0xjFko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764105562; c=relaxed/simple;
	bh=s6oxw1XWGB4I9jqKvVZTebVhKAgC5EJsIirvx8Y4I9k=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dVDZ8wi8URzg2VvOHSad+imab8B1Bd8xIQ5uPVCc7+Anf3RWcWmifwFqMldVyDdVcQsy9jNSxTHS+F4rEhTwXiimvwxZaWqKZifNVdyPBSr2VaLrX2eT4lqIL0Ej5Qu98OfhC+au4PoRPwsTiK5nGltVKQ7aOQO8dkqSWTa9VUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lJ+g6qcG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O9+Hnj3w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APD88MQ3317751
	for <linux-media@vger.kernel.org>; Tue, 25 Nov 2025 21:19:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yLTPkC95YrE7y35XKu51MBDh
	XlQiAda3t/Tfz4Ry+2Y=; b=lJ+g6qcG4jkD6M+q24L6QxTnfVAwanik7pa5DbFY
	OxXASjIDibsH0tJb3c2KAYfGbrSp1C7G2Ak79iM13nDs3ZZ6nV9Ru9ia+FBjX+Ke
	N2jXeMAfHjan4vNnHL4u1H3H7VUJMfDzR+NYzeYgeKNcJMhEFOsbu8kdNIm4s63S
	W4AcHnP5eguh2WPRQGjp/7rXxrd3Wyz6TamYn8TPy+hce/jx+BDDDYg7dbr6ly1w
	3O1Rq+KQyEgtNmF/VYGVnqwS6aFImIjsPWsE/Mcsu7zfXv+eQmGyp/hxf8X3hJ1A
	dKCCgb11dCm+6rm2ikYAZYaNWFH2UVYXue6AfW49Tahkrw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4and2qhc64-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 25 Nov 2025 21:19:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b286006ffaso1442754985a.2
        for <linux-media@vger.kernel.org>; Tue, 25 Nov 2025 13:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764105558; x=1764710358; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yLTPkC95YrE7y35XKu51MBDhXlQiAda3t/Tfz4Ry+2Y=;
        b=O9+Hnj3wZNpuP7/Fso+1K8Bm14FjHoqNlEwbeo0eLZrunml8f+tgB8JD+FD6D53DGN
         4bWAmU1Nm4qpVvrZ1l1EY7G0URLKn6SwUj5Y6Tn/LhCk5+BmrwLnYAowzKshXGPnX3n2
         RY/SGvNBDewcm3nFszMI7MUnKA2yIUXyoUfLa5ZzOj4Sn1PhrRq4Y045l6g79rUnQWJa
         dn14KfQ4Kzm3kLxQxuRhSqSike6aodi3UdFDdvsqNl9fqrRUaTpf3H8IbxGElTMCW9Ca
         a41wFaemu9p1NxRPHBshbPn2uON+RzE4P9vOBOylhc0/0NhP+lVotQnqyBpp6jbOBoiC
         DZiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764105558; x=1764710358;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yLTPkC95YrE7y35XKu51MBDhXlQiAda3t/Tfz4Ry+2Y=;
        b=SRLbdITfo08HY0dFO0cXFN3WdVVB1z/vdDoSbko7B07bwJohFrueZYhDx0Iqm7RDZO
         6X1AV6t8sZHIJNXwtLwGlpO4bM8Vt2VYmsEL5Hm5BpJCqqMfP0/7JsQtDu8ZYuWTGcCI
         hbtPl35+rO3W8edFi1O3QDn2Xn0lcdXdjZ/JVVWRE6I/+oW5p3TI5vFuoQIEawByMkWq
         2c1r4Evy3aORw5M5qORHgbIOS1VuQurYb/lUMd2UOYMQPZP24jXavtvgRXTKM22uwF8I
         4Hn+gEvqa5kjfFjHwqD8RMDQGEJcO6aYyXUu/4m8CWsMhZHIVk8dnF1ADvYFQIi/smf4
         C8Cw==
X-Forwarded-Encrypted: i=1; AJvYcCV0I2l9sBy3DM6ZNff8/2mPUqkkYGl9vXo8YB5Ebpkrfnh8U8VUhNUks0KETZ/x6bpfkvuovYHM3QyXqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNM3tV0EWZ8EksQGiIH3OIwBbNQdIs+KsqGJTYqbiLXG0EreRe
	4RE8jPuGWHjofQMs88VXB11Xc1+QDVe/tD65l9Q4COygIFoJU2BMtUwCCvj4d7y8eNLdSUaJMYD
	kwgmbYgQd9mVg0mki6KGC4qR4vDScWvCJN0N51HxGxCIWn963Kk51sVvxwJ27Aez9Qg==
X-Gm-Gg: ASbGncudI/ibFbM98sjeY9fwZA4TgvPdvFk6z/plIJYMIZxB2l8iIl1wOuW5gStvo13
	nonZbv2yZquzf+7nixqoBhwdylaT7gf3dYD+jkn3WxnoYfv/YIOy6iPBphBFzHsPdUCTxZinN8Z
	zeFXLPDygizPwzjFsfs/srVceTDVJDHxPgj4RHWZNWKvyyaJUZFQu2wIU4yYO+1P/dpySCQrTZR
	OLAinQfSeI8rU6iGcGgrKURKla/5flW+PdJv0svMvpAyuboYumXJhBRdx9zHz9vV08EOXVJomKi
	c2wgI81XD9UlTa/dRAgfN4uB+xqbR/c+QhTFPj0VfwxlLZio/a+resObL9g2wn83jOeuYPFyPF3
	62zzvX57IeE7cWWuEyEobwl+v85O+yWcjAPkRLYl7JpEO
X-Received: by 2002:a05:620a:28d4:b0:8b2:7224:b25b with SMTP id af79cd13be357-8b33d1b3473mr2215372685a.16.1764105558105;
        Tue, 25 Nov 2025 13:19:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4F7F27ZWBnL7RYAn4cYaKbiarUuuQz14/G2GedWKvgXvvzElsQHBYyMfyKSvJPr1Lt4Clqg==
X-Received: by 2002:a05:620a:28d4:b0:8b2:7224:b25b with SMTP id af79cd13be357-8b33d1b3473mr2215369685a.16.1764105557657;
        Tue, 25 Nov 2025 13:19:17 -0800 (PST)
Received: from trex (125.red-79-144-189.dynamicip.rima-tde.net. [79.144.189.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f34ff3sm37293579f8f.16.2025.11.25.13.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 13:19:16 -0800 (PST)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Tue, 25 Nov 2025 22:19:15 +0100
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>,
        vikash.garodia@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: venus: assign unique bus_info strings for encoder
 and decoder
Message-ID: <aSYdUzpqX38xxywI@trex>
References: <20251121184306.218169-1-jorge.ramirez@oss.qualcomm.com>
 <e409f318-cd50-5a7d-7f46-a928ea544597@oss.qualcomm.com>
 <aSWmeZHmeUWs1NwY@trex>
 <35d86818-8b50-1c0e-40a0-5f80c4b24a32@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35d86818-8b50-1c0e-40a0-5f80c4b24a32@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDE3NyBTYWx0ZWRfX32fb9rIDpw7u
 6pE8VYjyyty8wxKKVgQl4kaQcsrux/5o8PTS3rYEwbaDTuO4RqBH1XVPpAvEaBUe1NoUOVRn4DH
 VGb6IpzgV0P/04JY15zvmvH6gUicUZX4rc1pm1ICigw2ENUAHu35+YfL9m36aacKkDv9mk2UKpC
 gzmxG0Oq3K/3wkJwYx6LzT9giPVVJw5S8RPk8MZ5KvFuopcuB3ybE/VbS1dJ8zCHxDtbtnGWeNB
 /QGFBcgxB+6HnLUdyqKab8etl0d4hMTUxE5//NND6dM7yoKv9i7W1XCIMD4v+j0LTv3TNivUUr+
 xtg1Dg0JsZTghMZ2BFFY4l8EGiy96nCxMwCEHNeyoF2Bo/61PTKMLmpV1//ZUv/1heXGlQFH5ze
 PPW8Ukznl/g72GlgQzDnGb3x2Rm2pQ==
X-Authority-Analysis: v=2.4 cv=dZyNHHXe c=1 sm=1 tr=0 ts=69261d56 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=QCpOfKHlYVe8AePir1+hrw==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=xOd6jRPJAAAA:8 a=EUspDBNiAAAA:8
 a=LunTiXMjpaI1IbjBSeoA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: qjT_ThBD6E64gQr685J4OSy-KfqDqW_9
X-Proofpoint-GUID: qjT_ThBD6E64gQr685J4OSy-KfqDqW_9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511250177

On 25/11/25 18:39:14, Dikshita Agarwal wrote:
> 
> 
> On 11/25/2025 6:22 PM, Jorge Ramirez wrote:
> > On 25/11/25 13:59:56, Dikshita Agarwal wrote:
> >>
> >>
> >> On 11/22/2025 12:13 AM, Jorge Ramirez-Ortiz wrote:
> >>> The Venus encoder and decoder video devices currently report the same
> >>> bus_info string ("platform:qcom-venus").
> >>>
> >>> Assign unique bus_info identifiers by appending ":dec" and ":enc" to the
> >>> parent device name. With this change v4l2-ctl will display two separate
> >>> logical devices
> >>>
> >>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> >>> ---
> >>>  drivers/media/platform/qcom/venus/vdec.c | 5 +++++
> >>>  drivers/media/platform/qcom/venus/venc.c | 5 +++++
> >>>  2 files changed, 10 insertions(+)
> >>>
> >>> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> >>> index 4a6641fdffcf..63f6ae1ff6ac 100644
> >>> --- a/drivers/media/platform/qcom/venus/vdec.c
> >>> +++ b/drivers/media/platform/qcom/venus/vdec.c
> >>> @@ -433,9 +433,14 @@ vdec_g_selection(struct file *file, void *fh, struct v4l2_selection *s)
> >>>  static int
> >>>  vdec_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
> >>>  {
> >>> +	struct venus_inst *inst = to_inst(file);
> >>> +	struct venus_core *core = inst->core;
> >>> +
> >>>  	strscpy(cap->driver, "qcom-venus", sizeof(cap->driver));
> >>>  	strscpy(cap->card, "Qualcomm Venus video decoder", sizeof(cap->card));
> >>>  	strscpy(cap->bus_info, "platform:qcom-venus", sizeof(cap->bus_info));
> >>> +	snprintf(cap->bus_info, sizeof(cap->bus_info),
> >>> +		 "platform:%s:dec", dev_name(core->dev));
> >>
> >> Is there a reason to keep both strscpy() and snprintf() for cap->bus_info?
> >> The second call to snprintf() seems to overwrite the value set by
> >> strscpy(), making the first assignment redundant. Would it be cleaner to
> >> remove the strscpy() line and rely solely on snprintf()?
> > 
> > argh, my bad, you are right. will fix.
> > 
> > perhaps we should just have instead
> > 
> > decoder:
> > strscpy(cap->bus_info,"platform:qcom-venus-dec", sizeof(cap->bus_info));
> > 
> > encoder:
> > strscpy(cap->bus_info, "platform:qcom-venus-enc",sizeof(cap->bus_info)); on the encoder
> > 
> > I suppose the additional info provided by the dev_name is not really
> > important to consumers.
> 
> In-fact, we don't even need to fill the bus_info, received a similar
> comment on iris [1]
> [1]:
> https://lore.kernel.org/linux-media/c4350128-a05c-47af-a7e7-2810171cd311@xs4all.nl/


Nope, that is wrong. 

if we dont fill bus_info we will end up with the following again:

root@qrb2210-rb1-core-kit:~# v4l2-ctl --list-devices
Qualcomm Venus video encoder (platform:5a00000.video-codec):
	 /dev/video0
	 /dev/video1  

instead of something like this:

root@qrb2210-rb1-core-kit:~# v4l2-ctl --list-devices
Qualcomm Venus video decoder (platform:qcom-venus_dec):
	 /dev/video1

Qualcomm Venus video encoder (platform:qcom-venus_enc):
	 /dev/video0

