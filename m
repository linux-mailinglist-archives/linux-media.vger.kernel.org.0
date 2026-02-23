Return-Path: <linux-media+bounces-53247-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BjlErrYnGkFLwQAu9opvQ
	(envelope-from <linux-media+bounces-53247-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 23:46:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A12C017E8C0
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 23:46:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D59F315E3E7
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 22:41:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C13837BE64;
	Mon, 23 Feb 2026 22:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UqxJBeZr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L7u8ZpNA"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D3537BE68
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 22:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771886513; cv=none; b=lC8VNkfh7L9Oqgz7qkzxlm0MA3TgpI9sMSmia7nKOQLiLpiXvGP+GUsfrQQTW/l4g1TeqFDW5svJ0jlRPy32g03rXU3Ecb2w7y5jVi5gt38ilado0DiFXb19pkGUcqScRnmEK3atNnGzcWRma3JxtuM3DrB/3vECIioYdZ1QQt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771886513; c=relaxed/simple;
	bh=PDnJPTRLUiPMHSkXqn9tuBvAQ1ylJXUzFUE4GbH7Hqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FwA+11SfA6dtkJ6AsbeVdkB2QOltlintqSPq0SsIVUQVxRjDz5F9uto1j1gmXImNFgqosO7mp6hNLGgXNALDXG/H03FV8ltlgmfIQ5hK/BLdK+IotbAfh2VLT6aM3QBjX0M1H5DJh8qT4s6o+IfYlTr9ZWAyy5nh7XJ1bjCpyqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UqxJBeZr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L7u8ZpNA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NH0qt5109852
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 22:41:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AyHH7QcVrx7/d/Pc5HmpEFyc
	TB7iy4eLl8RPthi6BKQ=; b=UqxJBeZrdU/+HWoz57Jsz5OGQVVAWwhBjkkReBnM
	znYBmNaTaRZGpuZhz7FyFz+WMKoWazbntOR+ec/5k/EJVTBMqgTMcgo7rFv0h8Iw
	XdOhutI9faQnvYCkm6mP+1Kd6PUqlMPkM8s8XwwBmRVS4g5u5yQUOdKMmQtYMgzi
	ZFyxbQT2h5UlRY/O5RUWPPxnMKT7wj4bAzCzT5ovcR01y2uay4wfuENWyM56LLaB
	HewbVsGgnFFTIQHaCasjtePqb0Ad+WJthHI8w3QeISWAww3VujFiKji1G4ot6uw0
	1yteuL+sy6paHYOY5NXaN6D4btbz4lVrj3tv6Ix0oKOFsA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgtx08y5x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 22:41:49 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-504888a2a1dso480012361cf.0
        for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 14:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771886509; x=1772491309; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AyHH7QcVrx7/d/Pc5HmpEFycTB7iy4eLl8RPthi6BKQ=;
        b=L7u8ZpNAsKVx+4aEQh/qmM4mheUmua/6k0naFFdOUtEA6ft7uC3tw7L1nD2lbegEPY
         ZA4f/HY9aRj3+xcfB0UR21LMmm/F1XB1GQmBykHnKSJi5UMX3HhwPuYpljTT+xHZkzAz
         u+gy8ftM30nh5eQtcvZfN3l7e6s3w2O3Tez9N6n2t2LPwkaTN2vmTuUmS9kpCvpsL2zJ
         xyID/4KPdHyQXzLRHZGclZBKRlMDqJdgqV1PXXlXr5PFmfMjOZlypJDCEVB94NodrUCl
         aAtX3TcAopRc81fnGZBCdWbKQJuTNJXDpkNJQBdqkSyLs3jwfhB1YVMece+n7tgWQSAh
         5Juw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771886509; x=1772491309;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AyHH7QcVrx7/d/Pc5HmpEFycTB7iy4eLl8RPthi6BKQ=;
        b=FaRXnNOi+EG9LKP/7YB13pPWDm7d6OyKQ4z86rkQnbZoYVjsGjzlgT0pM/2fp+fqZF
         ZZ5Hf2LHPz3zd2h/s5t0HLtFGs2a2cxb7OefT2adBx998X1IALVj0XxAIUzd69XLsVmK
         GIwHz2ag3DFv/CJeee9p+JBgGJZj3eHjBLAWrukD/A9VA0PX5/jh/dbPp6571Xbw08Uz
         CNo1DYnlHoV5JHpOmxtMhjlC9NjTClr9Q9JynfMf0S2ftLUY+1R6BEFlA0Uqqm6a9nLK
         DskWQtXsNw1SIMyUykK+5q4vH9j/Sgtd6Zd03FL4xhusKaux3fzX+tqxsjIpQyFMwG76
         wAig==
X-Forwarded-Encrypted: i=1; AJvYcCXe1CrEwgYgr3hpx36ELm2L715lBqqWriFwBqo2K5c0X78O6yEDy1NSe/T3SGCM+7HIPFybHwGsaE/1pQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YztBRSNGFbXq2ZM02FssfGDB9AccOfhKTC4dvouKI340MRkU2E9
	+9kjZNL+2vb+TWbSIXg0zpt9siL4r7NEwFiszQJeXY/Fw4Br5ljorlw9ttwcd33K7uQUG8C+CfH
	K8k8A2aZ3hQE/QTWNDxNRpu3VOBDjWlsLBRJXUrA/1yjW01Mpu8w8YSWqzxUSw7Bq/w==
X-Gm-Gg: AZuq6aIIU394K8veUSnpIoaiRwGXl9XQflKfcjJl9x319M4oKtfPoyoIaqGXGLB8bYe
	X2A8j8CxZrPnbhFBH9Z7MOEImfWmDwvTrSP1giF9uw+uCTX+lrvsbrVBWHSFVzPt/3ngFOJi3bc
	hUlz013GQ8hc52SKUiw3wuuVrrpd7TMYHofVlOl4Z8QZGHzcpfoGJbRMpF0ZzU/rz6vPAMmkYrM
	dnppytA5uMC2ahDa1H5yGSHwGfi91NiaOc6jsXZy7S4LYuaFxO1Z6/SsnvlB4Jpof15nECK7tS5
	r4MAosjWGDvib7/3JCbSS+aX1m6cUaac+PL2wiV10TRZbr0k4MEySG0sf4s9jVVxlt9EsTeMcbl
	LnlLjRlWQLeyQEwyY00/2IvQFU2wYRtv66gB9zTtPQptMnUN5bsIKcDw9NpdPstvsf+kAVaqQuY
	pbaNxTxyjrREPnUimeVsd7HLF42HszvVhrilk=
X-Received: by 2002:a05:620a:440f:b0:8b2:d72d:e41c with SMTP id af79cd13be357-8cb8c9d2d25mr1211393685a.5.1771886508706;
        Mon, 23 Feb 2026 14:41:48 -0800 (PST)
X-Received: by 2002:a05:620a:440f:b0:8b2:d72d:e41c with SMTP id af79cd13be357-8cb8c9d2d25mr1211390585a.5.1771886508209;
        Mon, 23 Feb 2026 14:41:48 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb4cbf5sm1818985e87.91.2026.02.23.14.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 14:41:47 -0800 (PST)
Date: Tue, 24 Feb 2026 00:41:44 +0200
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
Message-ID: <x3ebegi74hx3a2okxnjipgsrgkbncmtwnusxtv7mc66nfih2qu@jdxc4ry2n2gb>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-3-fe46a9c1a046@oss.qualcomm.com>
 <tqsdbijgjomrn7fq3sdz7v2axwxqvbccpjh4fmvod4kbrq7pod@af3igw5dx66p>
 <lyco6vkfjlerri55ldyn6fbhihbkhnuolifddcnscevybsztq7@ljhjln2ynmid>
 <r7eko65ua2ofyejqf6ipnh6jm4s76f4mqy6a4msgmlraz4xuec@uymfzc65dbng>
 <oe4ho45dxtwjjjsqj6nd4op3gh7dz2pqwsuuhgqpdbf5hym645@smg3g4evqmge>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <oe4ho45dxtwjjjsqj6nd4op3gh7dz2pqwsuuhgqpdbf5hym645@smg3g4evqmge>
X-Proofpoint-ORIG-GUID: KI98p5mgVo_2yB2ly57Yp89Q_kq04qA9
X-Authority-Analysis: v=2.4 cv=euvSD4pX c=1 sm=1 tr=0 ts=699cd7ad cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=-Sm6rUxn0lnaPTpFYlgA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: KI98p5mgVo_2yB2ly57Yp89Q_kq04qA9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE5NyBTYWx0ZWRfX66AgukTUxj2a
 Q43+Yc8h+VSDfQxR/jq0vH5NUpHZ5WSlnQU1eRtMa22+vB15osNj07/ME6U5GErREh3Mobg9g3k
 FPP+O9nkSbHWQc+DuDb+MTzWE6xwBNNWsJPCLStq3tWOYI+xLOwW8Ht4o8uHjGYBDXvGKrYzcMS
 WqMnEVA/cF9FhktLRpMBPr1gBhgwcHNuKGfYfAYfhjztxYjzVHdlebrYAbqeqRj6GWKjboEX+gy
 VdRTSGryFbCKMtq6UCa5yBQofQf3rPHjBJ3mHOSKIN5oilShttlzxiLXZPUKpoJfx1jnUwUSZdN
 DLIS5jAragXKCdQ2a+WvbDPZ04jZdQEbepPueB3f9D4FIm1ibqesXs6CgSz4YvVDOCSL9Zi+ALa
 foI0bR4IrYAoE4zMBRkQ9sOzTEG8YjLgeaKb3BycI+cvjYOSJXGzKQ3WhjZwWfaLyy13PAtxBwt
 q1ggCRh061tGjDTIA1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_05,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230197
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
	TAGGED_FROM(0.00)[bounces-53247-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.linaro.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A12C017E8C0
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 04:25:08PM -0600, Bjorn Andersson wrote:
> On Tue, Feb 24, 2026 at 12:12:32AM +0200, Dmitry Baryshkov wrote:
> > On Mon, Feb 23, 2026 at 03:50:32PM -0600, Bjorn Andersson wrote:
> > > On Mon, Feb 23, 2026 at 11:23:13PM +0200, Dmitry Baryshkov wrote:
> > > > On Tue, Feb 24, 2026 at 12:38:57AM +0530, Ekansh Gupta wrote:
> > > [..]
> > > > > diff --git a/drivers/accel/qda/qda_drv.h b/drivers/accel/qda/qda_drv.h
> > > [..]
> > > > > +/* Error logging - always logs and tracks errors */
> > > > > +#define qda_err(qdev, fmt, ...) do { \
> > > > > +	struct device *__dev = qda_get_log_device(qdev); \
> > > > > +	if (__dev) \
> > > > > +		dev_err(__dev, "[%s] " fmt, __func__, ##__VA_ARGS__); \
> > > > > +	else \
> > > > > +		pr_err(DRIVER_NAME ": [%s] " fmt, __func__, ##__VA_ARGS__); \
> > > > 
> > > > What /why? You are under drm, so you can use drm_* helpers instead.
> > > > 
> > > 
> > > In particular, rather than rolling our own wrappers around standard
> > > functions, just use dev_err() whenever you have a struct device. And for
> > > something like fastrpc - life starts at some probe() and ends at some
> > > remove() so that should be always.
> > 
> > I'd say differently. For the DRM devices the life cycle is centered
> > around the DRM device (which can outlive platform device for multiple
> > reasons). So, please start by registering the DRM accel device and using
> > it for all the logging (and btw for private data management too).
> > 
> 
> There are no platform_devices here, but tomato tomato... What defines
> the life cycle of the DRM device then? Might it linger because clients
> are holding open handles to it?

Yes.

> 
> Note that the fastrpc service is coming and going, as the remoteproc
> starts and stops.

Even one more reason to use drm_device for life cycle management
instead of manually inventing the wheel.

> 
> Regards,
> Bjorn
> 
> > > 
> > > Regards,
> > > Bjorn
> > 
> > -- 
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

