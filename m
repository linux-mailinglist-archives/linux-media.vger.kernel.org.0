Return-Path: <linux-media+bounces-63596-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JokRCYAuIGoVyQAAu9opvQ
	(envelope-from <linux-media+bounces-63596-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 15:39:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC7B63824E
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 15:39:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=gwfdrQC8;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ceWVHw2K;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63596-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-63596-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1D6E2311806E
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 13:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F8482DC76A;
	Wed,  3 Jun 2026 13:26:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB332BEC2B
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 13:26:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780493204; cv=none; b=errECU9eofZH5UNAkW4qpI2jyOj6KhSF50vaLX3+7xj7SHToY4kW1RvmrfPeagL+6B38a4fJyJ7CLEIeU3/32g7nF4r2MjPrdGY+hFEbrBA1NXv416b7uvJ/96Bd/y0vfypfNv40kqy1vopHpfn7CWNz6l96WBjO5RECc2uNzLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780493204; c=relaxed/simple;
	bh=T/tEolCSMDWiK1ElWJnUQfM0lMP/lYha3xE84ovma+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=udBipMhfrqQ8dXrSIP4obdJPUsBz2DAVUEfuB/Kn+qvN72TSsVnogVNKjMq1KJ5HTNZJaw15rt024ZM2WLuk8SsyJO3QMH72Kyf1G+tKtj4nv9OyLwid5YcOGrzTDZkdTQ1+KGACt0N1iFIcSLkHkJQojYV9FbMiMEgGG+Gamx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gwfdrQC8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ceWVHw2K; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6536vJtA1755684
	for <linux-media@vger.kernel.org>; Wed, 3 Jun 2026 13:26:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FBhsg7FwzuMrC2Y5faSGRrZu
	R8DY6M4ytXCJ9V4SUKo=; b=gwfdrQC8QGxcPEM1JdkngF2f7SVaf4tWQ4Ar3/Z2
	6Ayhs4s0EPnkY365ytZbRhJr5pZ2Ia0SCCTCAjv8Dbl8NTmB4HeesLWg5ze+/sWx
	TbJcRPE3fn3biZkvNM1w3nSUGg1ZJKlJVM1FYegh6rsP/G/2hwrATp873oFuKgfj
	RvZupct1n2aWYUOfGIbS+nTL/f9ub4gaaiJm67n2bX/LW77XFx5QZNmy1ZIFRr71
	uH5X6GoBc3xC/fiJxNk3Hi9qxlRKkJtAjnpLvT/a0udBzmyrHG9DmQLaQSP/yiJF
	3et4YpPyFT+THy+MgCOz4wiuWpJyvsI6UXbRlDQhUCOuDQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejff01h34-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 13:26:42 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-59ebb69acadso2758579e0c.1
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 06:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780493202; x=1781098002; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FBhsg7FwzuMrC2Y5faSGRrZuR8DY6M4ytXCJ9V4SUKo=;
        b=ceWVHw2KQGLyex9UXmZ5/JNZ2bii61ny0GF+QyC1BQIPtMcJlAGHREnqXaYyKMLXnF
         +MtW8r/pScL7qmLWLiZvHTYDtHE+JkU/ANApeUmfnNlLTMuCWJ5V46+F2H4WV7ZVKvII
         FmRTZTPVzOH+TrtMuBjDib8LczauN3JW9k/xOCXY4DjE9tKMHKX5+S8NyMBc8Nl1Eu3g
         INiN1a7gskKErRJooKnCTqZFoJGIKjfX/D9tvVxU4De43FtY4eCd9qvqc+Gjzc00Ox/i
         D6b5pOYiojMgxMZ4r4Lpl5zlAyXHnPLnEmcrppPeLMk+erGa2w6pG0DWn2nG51DaOunA
         DGPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780493202; x=1781098002;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FBhsg7FwzuMrC2Y5faSGRrZuR8DY6M4ytXCJ9V4SUKo=;
        b=l7+trfZkrvSgt5HAvTLYbfwSOqcPggQPzAUJbIFHWaKT6Q/veabEm19fUtKDdDR9al
         TDXvG1y73EoG1qfiUXj4kYbkAfEJlMuzd54gSV0b8tv3jyp1jQtwUk3OkHVWuCPYRQKf
         QyfuKy4oonn/pHRwrgeQk7GV9nBDILc1EWkj26xO+cA7REg3cLHUWPTT7uwTBs8nfYyi
         HZcGEGx+9FHpemaCJCIRhYF3LCowQTs0FpgEnFLreLiBFh7Dj0YbKlvP1ZHUwOPJeAfn
         uhZspztaAlO2EOvSQA8QfX2iHLhXQje38DUzTtkiaOvtCNGuUGbgg1jyxMVasdP8UXW+
         eCwA==
X-Forwarded-Encrypted: i=1; AFNElJ/alTKCQ4K4OYQtFFYsw8hf2/AbTc9RWYRdD3RksIhaAK2Y3mZWIGyGzFev9sWZ3dgErdxBS355BdHiUg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5XBfCeT0QotN7+1/Q4XZdogbgIP5C/UuBZM0lEdsfmyd183qs
	j0JDaLswN+Nf0JVQNnL2osAqSduUQmW4UjWFu1FOZLwJnz6j4pNGOcHDp2JYl/L8gTh8AP5Bew6
	noMsVV4mHPlF/2ct++vi5IQqLhJZ2mzSSk4VT70aRmzkNiERa9BGW2fZZQjq74pM9iw==
X-Gm-Gg: Acq92OEkXgp5KMR28RUjT2rHnQ8DUTIXiqAMk56dMZ7vmXIWIMPCxs3tJ2nydFQPWGn
	d8jxUO8S24iSGDAjpVklArhqQvdKs3B0c79PXYUM+OC62lMoZHXKfrO/DxsiuYY3GxCKgr07xc0
	YBUUDmMnMoLxqtvACTM4qYGyrn3G8Og8l4se1IdS7+s2Sf83DhO5mb+xbcXXo4meWmMXJ5gvFcw
	DWiEU2SMWqHyoOJbkG+3WJrz13cZYPbW6jvIro4+qXT1idxdpQtGvEmplVQ1v/2uRvHjIWZwatP
	3/EaMzY52V36oift8TdUmeBV8E26xOr2nNIjOJ6RB5piqzrqmoP9hVX2uXBCqWxS4m2BZpZbfVN
	Icsszss9C1fkgJDdWunkl0Oi+9eEefhfb1UGysqz3ubzhcYe+Uwpbq4OI77fn2jKojqhYt2oWVp
	iaq6Q0iRV2IViXoVU63Zp9eONsYHp2QizLLskBq5eN8jLIAw==
X-Received: by 2002:a05:6122:1da9:b0:5a4:ac74:f5ba with SMTP id 71dfb90a1353d-5a6e86256ecmr1670770e0c.11.1780493201652;
        Wed, 03 Jun 2026 06:26:41 -0700 (PDT)
X-Received: by 2002:a05:6122:1da9:b0:5a4:ac74:f5ba with SMTP id 71dfb90a1353d-5a6e86256ecmr1670719e0c.11.1780493201199;
        Wed, 03 Jun 2026 06:26:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b97b04esm665779e87.40.2026.06.03.06.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:26:39 -0700 (PDT)
Date: Wed, 3 Jun 2026 16:26:38 +0300
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
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>, srini@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        robin.clark@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 06/15] accel/qda: Create compute context bank devices on
 QDA compute bus
Message-ID: <4ok65ttxij2yn4qyvbizgobfxsfikqmsaynz5c6lfbp2d3o2kt@iuqdma64k4w5>
References: <20260519-qda-series-v1-0-b2d984c297f8@oss.qualcomm.com>
 <20260519-qda-series-v1-6-b2d984c297f8@oss.qualcomm.com>
 <f527lflctqyqjrotd2qerlx4oikg6st6u2seqsjw6u5krkqrab@uhw33gnkp5c7>
 <37ae68ba-6639-4bd2-9483-5aa0156fd772@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37ae68ba-6639-4bd2-9483-5aa0156fd772@oss.qualcomm.com>
X-Proofpoint-GUID: a-y9p0YVFGHVRoKBdRTr8772jmTayrRI
X-Proofpoint-ORIG-GUID: a-y9p0YVFGHVRoKBdRTr8772jmTayrRI
X-Authority-Analysis: v=2.4 cv=LYwMLDfi c=1 sm=1 tr=0 ts=6a202b92 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=niLhY7D_osK6bJDgftoA:9 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEyOSBTYWx0ZWRfX0xQeNdfLsF04
 /Y4S2yxJb53gm7a4pfTsI9BpZd9lum+P4V8lejshTSRybBEnVgvqj7LAgRuz4O84zkMsNLG4NKi
 jicVBFoP4I3XCMN0Sp2EVjHFYah3TeDy7e4GWYUFNAc0o2iXiGOyDV3uUVVQIAEAgeSogpBhYLH
 +mlFTM457zJUSFIKVrcZSCOE5v+lgJZj6Vl+eu5p5deK21EdlSjnPoDeF4Nvrx9j6XlzOAavDGn
 OoFJgBftlQ/TySAs8JcWXxYUfo5hF9cdnOW7CY+H0yDHFKKp18CNiURK4WxQEoF7WVq2rtCvMv+
 Mmz9OplrrDBTuYl6QxxM91a9QEag+rifaRAX4xmAE6VpJCpD6y7h3DA9FlYHadh6XcQYrcavTGh
 fEN3dIwoiCdZKD+lZSAegmGMG8KUbNoYyHkpuz6BSQx5WHgKXfwPpKhtz+x6nGbQx0pa5BoBipS
 IPD11nvSUFQbZnCPwLw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030129
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-63596-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ekansh.gupta@oss.qualcomm.com,m:ogabbay@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:quic_bkumar@quicinc.com,m:quic_chennak@quicinc.com,m:srini@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-doc@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,quicinc.com,oss.qualcomm.com,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.linaro.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,iuqdma64k4w5:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8EC7B63824E

On Wed, Jun 03, 2026 at 11:09:31AM +0530, Ekansh Gupta wrote:
> On 20-05-2026 19:53, Dmitry Baryshkov wrote:
> > On Tue, May 19, 2026 at 11:45:56AM +0530, Ekansh Gupta via B4 Relay wrote:
> >> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> >>
> >> Introduce the CB (compute context bank) device management layer for the
> >> QDA driver. Each DSP domain node in the device tree may contain child
> >> nodes with compatible "qcom,fastrpc-compute-cb", each representing one
> >> IOMMU context bank. The driver enumerates those child nodes during
> >> RPMsg probe and creates a corresponding device on the qda-compute-cb
> >> bus for each one.
> >>
> >> The CB devices are created via create_qda_cb_device(), which registers
> >> them on the qda-compute-cb bus so that the IOMMU subsystem assigns each
> >> device its own IOMMU domain, enabling per-session address space
> >> isolation for DSP buffer mapping.
> >>
> >> The new qda_cb.c file provides two functions:
> >>
> >>   qda_create_cb_device()
> >>     Reads the "reg" property from the DT child node to obtain the
> >>     stream ID, constructs a unique device name of the form
> >>     "qda-cb-<dsp>-<sid>", and registers the device on the compute bus.
> >>     A qda_cb_dev entry is allocated and appended to qdev->cb_devs so
> >>     that the list can be walked during teardown.
> >>
> >>   qda_destroy_cb_device()
> >>     Removes the device from its IOMMU group before calling
> >>     device_unregister(), ensuring the IOMMU domain is released cleanly.
> >>
> >> CB devices are populated before the DRM device is registered and
> >> destroyed before it is unplugged, so no DRM operation can race with
> >> CB teardown. On probe failure after population, qda_cb_unpopulate()
> >> is called to clean up any CBs that were successfully created before
> >> the error.
> >>
> >> Assisted-by: Claude:claude-4-6-sonnet
> >> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> >> ---
> >>  drivers/accel/qda/Makefile    |  1 +
> >>  drivers/accel/qda/qda_cb.c    | 99 +++++++++++++++++++++++++++++++++++++++++++
> >>  drivers/accel/qda/qda_cb.h    | 32 ++++++++++++++
> >>  drivers/accel/qda/qda_drv.c   |  1 +
> >>  drivers/accel/qda/qda_drv.h   |  3 ++
> >>  drivers/accel/qda/qda_rpmsg.c | 12 +++++-
> >>  6 files changed, 147 insertions(+), 1 deletion(-)
> >> @@ -59,9 +61,17 @@ static int qda_rpmsg_probe(struct rpmsg_device *rpdev)
> >>  	}
> >>  	qdev->dsp_name = label;
> >>  
> >> +	ret = qda_cb_populate(qdev, rpdev->dev.of_node);
> >> +	if (ret) {
> >> +		dev_err(qdev->dev, "Failed to populate child devices: %d\n", ret);
> >> +		return ret;
> >> +	}
> >> +
> >>  	ret = qda_register_device(qdev);
> >> -	if (ret)
> >> +	if (ret) {
> >> +		qda_cb_unpopulate(qdev);
> >>  		return ret;
> > 
> > Unwinding registration?
> did I miss something here? The intention to free up the CB devices in
> case the device registration fails.>

Don't you need to unwind anything else?

> >> +	}
> >>  
> >>  	drm_info(&qdev->drm_dev, "QDA RPMsg probe complete for %s\n", qdev->dsp_name);
> >>  	return 0;
> >>
> >> -- 
> >> 2.34.1
> >>
> >>
> > 
> 

-- 
With best wishes
Dmitry

