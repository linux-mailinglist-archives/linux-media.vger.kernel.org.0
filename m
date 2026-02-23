Return-Path: <linux-media+bounces-53244-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MWkNXDWnGkJLAQAu9opvQ
	(envelope-from <linux-media+bounces-53244-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 23:36:32 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B24917E6E2
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 23:36:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EA2353015EE2
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 22:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C768237B417;
	Mon, 23 Feb 2026 22:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KLSV95VB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UrCWuhS+"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468ED37AA78
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 22:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771886173; cv=none; b=iLzI0rsTX3uAfm47oLSHykpLwIX3lL7iLfvCwAKzmMBTdqwcKFNLTPVXYmNkQ3S+sJEfr1dYLCpbgKecDNqdiFCwW/uUn4nU7sBagJvbrAQCj9oFo2rXdgx6yF6g/Cc07VO0AFf0kolIL9NSENG+Nu5hwsWFlUsXAbGAl6T0xKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771886173; c=relaxed/simple;
	bh=Mz//1H2xyzoItFeXUMt4OcYByC7TS8c+Gl2mWG0R8V8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CDv4dfasenTprbKTYX/WDE8IlgCB5tJ/LxLlxX/x6JIuDFUFN9M24tNoyNXywVXHYF3/QseZu26JBNKj4Zv/Ssf1eAUsbSodMYQh+p6Y4Qr9jTR9V8uW8Bd95XKF0BEQKje9EbekMU6OtH/xAgDqq+T/PiBGtntlt72/VE2OAvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KLSV95VB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UrCWuhS+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NI4ISA1298512
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 22:36:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yEs9Z1PemjjoC0qJIiE/gZVS
	cI8Uh11i1ReozZLCUig=; b=KLSV95VBf2LAhbJNYxuD9I+Xe3cRuIoHTi5JDVEe
	ZDgNyUpvcxRNo1qPh8trJcpEFhWyILbJH/eATceg18JkM6nmM22P/3z3LASyJAcc
	J8xrUp5djLlmZj6HMAsYakr/UNLKZHM2M6ZaWb6oAaY03z8tSv1qOv3dy2hJVdIN
	vRVCJzy1N6BA/LODIF2E4XjQoPLB71deuPn2vx/6cV/Q69EiJgvcM/9GM5hg+3h6
	Zphg6GLcqO6ujxcdGV6/kHW4M8RFw5nwIv3aDwjzWWH81L/LNpaVcHKiL6Jm/EQ1
	8JaugrqInqWzL3vdWn1nZJxbpUsZiMnIJUvUAyJOnkJ08Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8y23x0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 22:36:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb42f56c4aso4801375985a.3
        for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 14:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771886169; x=1772490969; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yEs9Z1PemjjoC0qJIiE/gZVScI8Uh11i1ReozZLCUig=;
        b=UrCWuhS+gVui9+hnnwCPuBxhU5EFB4ZH0zRV0M94LW+cAdGPh0rUE06jmxNMlhQSCd
         25z4ClVZkimEFATx6mKVLePmzs3v/cH9LkH2VCeotoiFZLb3izkXFqw54jgEA2nfLRgN
         ZSQRNMlhXFYRWkOfAE962sRRiAumWH/cxx1bAectPCja2VGI/nkf5HM0U/NhmookQD45
         4otz4MxxRpS7EzAskUZ8Ut6R88y0qrhi/+iFKLIxVYEn3MOhcM/fXHh+ncAUJXbEGxYX
         KSN+SmvbAwxPBSnEFb6S/RNd+6H/Ef5karu5LI1hFQMiz/HWUQflEddShXAYBKZjP4Ox
         1CAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771886169; x=1772490969;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yEs9Z1PemjjoC0qJIiE/gZVScI8Uh11i1ReozZLCUig=;
        b=wHlt7ZgVNvH6hkoE/VDmy05edsCduOXqg27iunk0v4oq1z7bzOUzntHHmVugeNzhK2
         +13kALHYFpWpR5z4M2yMycZ5GnfzsD+oVjnlFlvxAmrf3p8ouoZqjH6zw095zXiyEWzh
         EnokmHIho2g1fKSg3Md84jrL3U6LGJSAZjNmHXpfDciHyC+1EPSuJ9toVcgwxyuW8wxm
         8wWWPOQ1+iAI/UXGptGkOsCsK/GCUF4jDHIB8DrouLDACXJAnTEBI3S5pqBM1gbCWbhj
         cF/a5BJ+kAi+aK70bsGn+kjalAlwVGaxRi/lYNGISsZuwep1zrtGnk0u7KIPzu0bLL+F
         8QCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXh/ksnwDnv3G+3NxteRtLYk8wBm89SFYLKoJ/X4y+60wknDinMKTWIPYqji6qqsb5+Uep14INAU794Kw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzedsO43So6Xl3i1qN/cliZFXdLRbOBTRCrjwh5y2Ac82Bg71T0
	YFAHCrYKPUXUWBAEgcraUoXbPGzXsVzFEsMa7o1jAeJsqcZOYioC16fS2RxRgZSXK1a5BEKJ0oU
	8KK+WIlluRR1TDVvs2LX/s4xOj4LyqHaIvmFglBkZanBzRhjC31+JcfYJJ9+F15eOuxDUIzst6g
	==
X-Gm-Gg: AZuq6aIJnK8BcfQ96SHvjJInBzLUrVkPBywxfeaxnWUE0Vx2AfZ6CF94w7MzwCPdOR9
	7OjDU6I+y67BwCps/9KYLLEbyttVs0sabpx24zJp2YqDHvEHMtdy3TWLIQpOLutjb/hIVeXLHXx
	lgaDhgq1iS5yfDOXOpQaAl+u+m/thFxyAU5HjqMwCbziceMjXRrtAP8NCqF5FsASDxy6kTcI2gl
	WmBRr28Me1o2Kk3aF4cxbgRCYORLxVfnOP9jBEO22FrcrxI3Bfji9KkL5VpRbilVJymEqdJmSIx
	ylfhV24UQGPsA3SZx2tqEBW+Bl3ddt+2/uKyGdYZAeGxdlV38oi0JhHBA7PXgByeOAL6fP4/Uol
	9YKuzvNtW4lGKmT/q5oIrG0aryKtE/uaO2fu3/vhVokBjeEoJhAi96DICIHD777yaJfYXKxh7X6
	p8CQRlyKcfAnmFqh51HKcxFW/+donwMHaNCq0=
X-Received: by 2002:a05:620a:d86:b0:8c6:a5c7:a7ee with SMTP id af79cd13be357-8cb8ca67456mr1315630785a.53.1771886168783;
        Mon, 23 Feb 2026 14:36:08 -0800 (PST)
X-Received: by 2002:a05:620a:d86:b0:8c6:a5c7:a7ee with SMTP id af79cd13be357-8cb8ca67456mr1315624385a.53.1771886168003;
        Mon, 23 Feb 2026 14:36:08 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389a7878d7csm17093061fa.7.2026.02.23.14.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 14:36:07 -0800 (PST)
Date: Tue, 24 Feb 2026 00:36:05 +0200
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
Subject: Re: [PATCH RFC 10/18] accel/qda: Add DMA-backed GEM objects and
 memory manager integration
Message-ID: <hhy4355j7udb753cbvunbagfqiyhcktipyl2ufw2x24gm2rtam@3x3utkfzjjnw>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-10-fe46a9c1a046@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224-qda-firstpost-v1-10-fe46a9c1a046@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE5NiBTYWx0ZWRfX3B9J+ssYa22G
 toXrlf+T1O1gHwh2thDQTVuC2JZkxkUDhEyk8O3Ij2KjWF05XTAYGabaONiH82zb1Wkt7Qpmt2r
 rtgvRjr3y2vOP3fQcYkgCXbDE2BDn5ojYudwG5wu7rCoQO3RKYcKRqzVxmEbNS6ST3SVKlpARbR
 yEdBIPno9588V0s4iz7dYyKhKBWIxl0NUAGT3WuiZX/EX8OZ8BQibgbEONOc9EzEF+WF056pV2+
 Sr6VzUEgoxYt7dDzHLI8BJYmHQLP2qSCK63mJI2rsbn1WBP2FXw+61AE7Xb+PVmCuWutKnL5Zzr
 M962w8uklybBBkUkAgVX/D0zNVG4R6hYvmsFMKezdzPRcY8CdHMl2BLI4/CgO1dQzgpCmBij+8l
 qLbVQZcyjCHNs62G97xJBp0KZG5mkVEUsMYwW5rwI/iMPT2CJ4Wl+Hsh0FvyKE1aDAC+qoo5nSA
 J1SuT9HNYi0ECNF5Vfw==
X-Authority-Analysis: v=2.4 cv=edYwvrEH c=1 sm=1 tr=0 ts=699cd65a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=lpSFajXHXQaPWZsiSh4A:9 a=CodIZPt08EU6SVwj:21 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: -dqR3rOl7DQPOpVnXZVUpQ7B5I9IMQUI
X-Proofpoint-ORIG-GUID: -dqR3rOl7DQPOpVnXZVUpQ7B5I9IMQUI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_05,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230196
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
	TAGGED_FROM(0.00)[bounces-53244-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.linaro.org,oss.qualcomm.com,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0B24917E6E2
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 12:39:04AM +0530, Ekansh Gupta wrote:
> Introduce DMA-backed GEM buffer objects for the QDA accelerator
> driver and integrate them with the existing memory manager and IOMMU
> device abstraction.
> 
> A new qda_gem_obj structure wraps drm_gem_object and tracks the
> kernel virtual address, DMA address, size and owning qda_iommu_device.
> qda_gem_create_object() allocates a GEM object, aligns the requested
> size, and uses qda_memory_manager_alloc() to obtain DMA-coherent
> memory from a per-process IOMMU device. The GEM object implements
> a .mmap callback that validates the VMA offset and calls into
> qda_dma_mmap(), which maps the DMA memory into userspace and sets
> appropriate VMA flags.
> 
> The DMA backend is implemented in qda_memory_dma.c, which allocates
> and frees coherent memory via dma_alloc_coherent() and
> dma_free_coherent(), while storing a SID-prefixed DMA address in
> the GEM object for later use by DSP firmware. The memory manager
> is extended to maintain a mapping from processes to IOMMU devices
> using qda_file_priv and a process_assignment_lock, and provides
> qda_memory_manager_alloc() and qda_memory_manager_free() helpers
> for GEM allocations.

Why are you not using drm_gem_dma_helper?

> 
> This patch lays the groundwork for GEM allocation and mmap IOCTLs
> as well as future PRIME and job submission support for QDA buffers.

Documentation/process/submitting-patches.rst, "This patch"

> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/accel/qda/Makefile             |   2 +
>  drivers/accel/qda/qda_drv.c            |  23 +++-
>  drivers/accel/qda/qda_drv.h            |   7 ++
>  drivers/accel/qda/qda_gem.c            | 187 +++++++++++++++++++++++++++++++
>  drivers/accel/qda/qda_gem.h            |  63 +++++++++++
>  drivers/accel/qda/qda_memory_dma.c     |  91 ++++++++++++++++
>  drivers/accel/qda/qda_memory_dma.h     |  46 ++++++++
>  drivers/accel/qda/qda_memory_manager.c | 194 +++++++++++++++++++++++++++++++++
>  drivers/accel/qda/qda_memory_manager.h |  33 ++++++
>  9 files changed, 645 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
> index f547398e1a72..88c324fa382c 100644
> --- a/drivers/accel/qda/Makefile
> +++ b/drivers/accel/qda/Makefile
> @@ -11,5 +11,7 @@ qda-y := \
>  	qda_cb.o \
>  	qda_memory_manager.o \
>  	qda_ioctl.o \
> +	qda_gem.o \
> +	qda_memory_dma.o \
>  
>  obj-$(CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS) += qda_compute_bus.o
> diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
> index 86758a9cd982..19798359b14e 100644
> --- a/drivers/accel/qda/qda_drv.c
> +++ b/drivers/accel/qda/qda_drv.c
> @@ -15,7 +15,7 @@
>  #include "qda_ioctl.h"
>  #include "qda_rpmsg.h"
>  
> -static struct qda_drm_priv *get_drm_priv_from_device(struct drm_device *dev)
> +struct qda_drm_priv *get_drm_priv_from_device(struct drm_device *dev)

And this is a namespace leak. Please name all your functions in a
selected style (qda_foo()).

>  {
>  	if (!dev)
>  		return NULL;
> @@ -88,6 +88,7 @@ static int qda_open(struct drm_device *dev, struct drm_file *file)
>  		return -ENOMEM;
>  
>  	qda_file_priv->pid = current->pid;
> +	qda_file_priv->assigned_iommu_dev = NULL; /* Will be assigned on first allocation */

Why?  Also, isn't qda_file_priv zero-filled?

>  
>  	qda_user = alloc_qda_user(qdev);
>  	if (!qda_user) {
> @@ -118,6 +119,26 @@ static void qda_postclose(struct drm_device *dev, struct drm_file *file)
>  
>  	qda_file_priv = (struct qda_file_priv *)file->driver_priv;
>  	if (qda_file_priv) {

Cant it be NULL? When?

> +		if (qda_file_priv->assigned_iommu_dev) {
> +			struct qda_iommu_device *iommu_dev = qda_file_priv->assigned_iommu_dev;
> +			unsigned long flags;
> +
> +			/* Decrement reference count - if it reaches 0, reset PID assignment */
> +			if (refcount_dec_and_test(&iommu_dev->refcount)) {
> +				/* Last reference released - reset PID assignment */
> +				spin_lock_irqsave(&iommu_dev->lock, flags);
> +				iommu_dev->assigned_pid = 0;

This is the part that needs to be discussed in the commit message
instead of a generic description of the patch. What is assigned_pid /
assigned_iommu_dev? Why do they need to be assigned?

> +				iommu_dev->assigned_file_priv = NULL;
> +				spin_unlock_irqrestore(&iommu_dev->lock, flags);
> +
> +				qda_dbg(qdev, "Reset PID assignment for IOMMU device %u (process %d exited)\n",
> +					iommu_dev->id, qda_file_priv->pid);
> +			} else {
> +				qda_dbg(qdev, "Decremented reference for IOMMU device %u from process %d\n",
> +					iommu_dev->id, qda_file_priv->pid);
> +			}
> +		}
> +
>  		qda_user = qda_file_priv->qda_user;
>  		if (qda_user)
>  			free_qda_user(qda_user);
> diff --git a/drivers/accel/qda/qda_drv.h b/drivers/accel/qda/qda_drv.h
> index e0ba37702a86..8a2cd474958b 100644
> --- a/drivers/accel/qda/qda_drv.h
> +++ b/drivers/accel/qda/qda_drv.h
> @@ -33,6 +33,8 @@ struct qda_file_priv {
>  	pid_t pid;
>  	/* Pointer to qda_user structure for backward compatibility */
>  	struct qda_user *qda_user;
> +	/* IOMMU device assigned to this process */
> +	struct qda_iommu_device *assigned_iommu_dev;
>  };
>  
>  /**
> @@ -153,4 +155,9 @@ void qda_deinit_device(struct qda_dev *qdev);
>  int qda_register_device(struct qda_dev *qdev);
>  void qda_unregister_device(struct qda_dev *qdev);
>  
> +/*
> + * Utility function to get DRM private data from DRM device
> + */
> +struct qda_drm_priv *get_drm_priv_from_device(struct drm_device *dev);
> +
>  #endif /* __QDA_DRV_H__ */
> diff --git a/drivers/accel/qda/qda_gem.c b/drivers/accel/qda/qda_gem.c
> new file mode 100644
> index 000000000000..bbd54e2502d3
> --- /dev/null
> +++ b/drivers/accel/qda/qda_gem.c
> @@ -0,0 +1,187 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> +#include <drm/drm_gem.h>
> +#include <drm/drm_prime.h>
> +#include <linux/slab.h>
> +#include <linux/dma-mapping.h>
> +#include "qda_drv.h"
> +#include "qda_gem.h"
> +#include "qda_memory_manager.h"
> +#include "qda_memory_dma.h"
> +
> +static int validate_gem_obj_for_mmap(struct qda_gem_obj *qda_gem_obj)
> +{
> +	if (qda_gem_obj->size == 0) {
> +		qda_err(NULL, "Invalid GEM object size\n");
> +		return -EINVAL;
> +	}
> +	if (!qda_gem_obj->iommu_dev || !qda_gem_obj->iommu_dev->dev) {
> +		qda_err(NULL, "Allocated buffer missing IOMMU device\n");
> +		return -EINVAL;
> +	}
> +	if (!qda_gem_obj->iommu_dev->dev) {
> +		qda_err(NULL, "Allocated buffer missing IOMMU device\n");
> +		return -EINVAL;
> +	}
> +	if (!qda_gem_obj->virt) {
> +		qda_err(NULL, "Allocated buffer missing virtual address\n");
> +		return -EINVAL;
> +	}
> +	if (qda_gem_obj->dma_addr == 0) {
> +		qda_err(NULL, "Allocated buffer missing DMA address\n");
> +		return -EINVAL;
> +	}

Is any of these conditions real?

> +
> +	return 0;
> +}
> +
> +static int validate_vma_offset(struct drm_gem_object *drm_obj, struct vm_area_struct *vma)
> +{
> +	u64 expected_offset = drm_vma_node_offset_addr(&drm_obj->vma_node);
> +	u64 actual_offset = vma->vm_pgoff << PAGE_SHIFT;
> +
> +	if (actual_offset != expected_offset) {

What??

> +		qda_err(NULL, "VMA offset mismatch: expected=0x%llx, actual=0x%llx\n",
> +			expected_offset, actual_offset);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static void setup_vma_flags(struct vm_area_struct *vma)
> +{
> +	vm_flags_set(vma, VM_DONTEXPAND);
> +	vm_flags_set(vma, VM_DONTDUMP);
> +}
> +
> +void qda_gem_free_object(struct drm_gem_object *gem_obj)
> +{
> +	struct qda_gem_obj *qda_gem_obj = to_qda_gem_obj(gem_obj);
> +	struct qda_drm_priv *drm_priv = get_drm_priv_from_device(gem_obj->dev);
> +
> +	if (qda_gem_obj->virt) {
> +		if (drm_priv && drm_priv->iommu_mgr)
> +			qda_memory_manager_free(drm_priv->iommu_mgr, qda_gem_obj);
> +	}
> +
> +	drm_gem_object_release(gem_obj);
> +	kfree(qda_gem_obj);
> +}
> +
> +int qda_gem_mmap_obj(struct drm_gem_object *drm_obj, struct vm_area_struct *vma)
> +{
> +	struct qda_gem_obj *qda_gem_obj = to_qda_gem_obj(drm_obj);
> +	int ret;
> +
> +	ret = validate_gem_obj_for_mmap(qda_gem_obj);
> +	if (ret) {
> +		qda_err(NULL, "GEM object validation failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = validate_vma_offset(drm_obj, vma);
> +	if (ret) {
> +		qda_err(NULL, "VMA offset validation failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* Reset vm_pgoff for DMA mmap */
> +	vma->vm_pgoff = 0;
> +
> +	ret = qda_dma_mmap(qda_gem_obj, vma);
> +
> +	if (ret == 0) {
> +		setup_vma_flags(vma);
> +		qda_dbg(NULL, "GEM object mapped successfully\n");
> +	} else {
> +		qda_err(NULL, "GEM object mmap failed: %d\n", ret);
> +	}
> +
> +	return ret;
> +}
> +
> +static const struct drm_gem_object_funcs qda_gem_object_funcs = {
> +	.free = qda_gem_free_object,
> +	.mmap = qda_gem_mmap_obj,
> +};
> +
> +struct qda_gem_obj *qda_gem_alloc_object(struct drm_device *drm_dev, size_t aligned_size)
> +{
> +	struct qda_gem_obj *qda_gem_obj;
> +	int ret;
> +
> +	qda_gem_obj = kzalloc_obj(*qda_gem_obj, GFP_KERNEL);
> +	if (!qda_gem_obj)
> +		return ERR_PTR(-ENOMEM);
> +
> +	ret = drm_gem_object_init(drm_dev, &qda_gem_obj->base, aligned_size);
> +	if (ret) {
> +		qda_err(NULL, "Failed to initialize GEM object: %d\n", ret);
> +		kfree(qda_gem_obj);
> +		return ERR_PTR(ret);
> +	}
> +
> +	qda_gem_obj->base.funcs = &qda_gem_object_funcs;
> +	qda_gem_obj->size = aligned_size;
> +
> +	qda_dbg(NULL, "Allocated GEM object size=%zu\n", aligned_size);
> +	return qda_gem_obj;
> +}
> +
> +void qda_gem_cleanup_object(struct qda_gem_obj *qda_gem_obj)
> +{
> +	drm_gem_object_release(&qda_gem_obj->base);
> +	kfree(qda_gem_obj);
> +}
> +
> +struct drm_gem_object *qda_gem_lookup_object(struct drm_file *file_priv, u32 handle)
> +{
> +	struct drm_gem_object *gem_obj;
> +
> +	gem_obj = drm_gem_object_lookup(file_priv, handle);
> +	if (!gem_obj)
> +		return ERR_PTR(-ENOENT);
> +
> +	return gem_obj;
> +}
> +
> +int qda_gem_create_handle(struct drm_file *file_priv, struct drm_gem_object *gem_obj, u32 *handle)
> +{
> +	int ret;
> +
> +	ret = drm_gem_handle_create(file_priv, gem_obj, handle);
> +	drm_gem_object_put(gem_obj);
> +
> +	return ret;
> +}
> +
> +struct drm_gem_object *qda_gem_create_object(struct drm_device *drm_dev,
> +					     struct qda_memory_manager *iommu_mgr, size_t size,
> +					     struct drm_file *file_priv)
> +{
> +	struct qda_gem_obj *qda_gem_obj;
> +	size_t aligned_size;
> +	int ret;
> +
> +	if (size == 0) {
> +		qda_err(NULL, "Invalid size for GEM object creation\n");
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	aligned_size = PAGE_ALIGN(size);
> +
> +	qda_gem_obj = qda_gem_alloc_object(drm_dev, aligned_size);
> +	if (IS_ERR(qda_gem_obj))
> +		return (struct drm_gem_object *)qda_gem_obj;
> +
> +	ret = qda_memory_manager_alloc(iommu_mgr, qda_gem_obj, file_priv);
> +	if (ret) {
> +		qda_err(NULL, "Memory manager allocation failed: %d\n", ret);
> +		qda_gem_cleanup_object(qda_gem_obj);
> +		return ERR_PTR(ret);
> +	}
> +
> +	qda_dbg(NULL, "GEM object created successfully size=%zu\n", aligned_size);
> +	return &qda_gem_obj->base;
> +}
> diff --git a/drivers/accel/qda/qda_gem.h b/drivers/accel/qda/qda_gem.h
> new file mode 100644
> index 000000000000..caae9cda5363
> --- /dev/null
> +++ b/drivers/accel/qda/qda_gem.h
> @@ -0,0 +1,63 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +#ifndef _QDA_GEM_H
> +#define _QDA_GEM_H
> +
> +#include <linux/xarray.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_gem.h>
> +#include <linux/dma-mapping.h>
> +
> +/* Forward declarations */
> +struct qda_memory_manager;
> +struct qda_iommu_device;
> +
> +/**
> + * struct qda_gem_obj - QDA GEM buffer object
> + *
> + * This structure represents a GEM buffer object that can be either
> + * allocated by the driver or imported from another driver via dma-buf.
> + */
> +struct qda_gem_obj {
> +	/* DRM GEM object base structure */
> +	struct drm_gem_object base;
> +	/* Kernel virtual address of allocated memory */
> +	void *virt;
> +	/* DMA address for allocated buffers */
> +	dma_addr_t dma_addr;
> +	/* Size of the buffer in bytes */
> +	size_t size;
> +	/* IOMMU device that performed the allocation */
> +	struct qda_iommu_device *iommu_dev;
> +};
> +
> +/*
> + * Helper macro to cast a drm_gem_object to qda_gem_obj
> + */
> +#define to_qda_gem_obj(gem_obj) container_of(gem_obj, struct qda_gem_obj, base)
> +
> +/*
> + * GEM object lifecycle management
> + */
> +struct drm_gem_object *qda_gem_create_object(struct drm_device *drm_dev,
> +					     struct qda_memory_manager *iommu_mgr,
> +					     size_t size, struct drm_file *file_priv);
> +void qda_gem_free_object(struct drm_gem_object *gem_obj);
> +int qda_gem_mmap_obj(struct drm_gem_object *gem_obj, struct vm_area_struct *vma);
> +
> +/*
> + * Helper functions for GEM object allocation and cleanup
> + * These are used internally and by the PRIME import code
> + */
> +struct qda_gem_obj *qda_gem_alloc_object(struct drm_device *drm_dev, size_t aligned_size);
> +void qda_gem_cleanup_object(struct qda_gem_obj *qda_gem_obj);
> +
> +/*
> + * Utility functions for GEM operations
> + */
> +struct drm_gem_object *qda_gem_lookup_object(struct drm_file *file_priv, u32 handle);
> +int qda_gem_create_handle(struct drm_file *file_priv, struct drm_gem_object *gem_obj, u32 *handle);
> +
> +#endif /* _QDA_GEM_H */
> diff --git a/drivers/accel/qda/qda_memory_dma.c b/drivers/accel/qda/qda_memory_dma.c
> new file mode 100644
> index 000000000000..ffdd5423c88c
> --- /dev/null
> +++ b/drivers/accel/qda/qda_memory_dma.c
> @@ -0,0 +1,91 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> +#include <linux/slab.h>
> +#include <linux/dma-mapping.h>
> +#include "qda_drv.h"
> +#include "qda_memory_dma.h"
> +
> +static dma_addr_t get_actual_dma_addr(struct qda_gem_obj *gem_obj)
> +{
> +	return gem_obj->dma_addr - ((u64)gem_obj->iommu_dev->sid << 32);
> +}
> +
> +static void setup_gem_object(struct qda_gem_obj *gem_obj, void *virt,
> +			     dma_addr_t dma_addr, struct qda_iommu_device *iommu_dev)
> +{
> +	gem_obj->virt = virt;
> +	gem_obj->dma_addr = dma_addr;
> +	gem_obj->iommu_dev = iommu_dev;
> +}
> +
> +static void cleanup_gem_object_fields(struct qda_gem_obj *gem_obj)
> +{
> +	gem_obj->virt = NULL;
> +	gem_obj->dma_addr = 0;
> +	gem_obj->iommu_dev = NULL;
> +}
> +
> +int qda_dma_alloc(struct qda_iommu_device *iommu_dev,
> +		  struct qda_gem_obj *gem_obj, size_t size)
> +{
> +	void *virt;
> +	dma_addr_t dma_addr;
> +
> +	if (!iommu_dev || !iommu_dev->dev) {
> +		qda_err(NULL, "Invalid iommu_dev or device for DMA allocation\n");
> +		return -EINVAL;
> +	}
> +
> +	virt = dma_alloc_coherent(iommu_dev->dev, size, &dma_addr, GFP_KERNEL);
> +	if (!virt)
> +		return -ENOMEM;
> +
> +	dma_addr += ((u64)iommu_dev->sid << 32);
> +
> +	qda_dbg(NULL, "DMA address with SID prefix: 0x%llx (sid=%u)\n",
> +		(u64)dma_addr, iommu_dev->sid);
> +
> +	setup_gem_object(gem_obj, virt, dma_addr, iommu_dev);
> +
> +	return 0;
> +}
> +
> +void qda_dma_free(struct qda_gem_obj *gem_obj)
> +{
> +	if (!gem_obj || !gem_obj->iommu_dev) {
> +		qda_dbg(NULL, "Invalid gem_obj or iommu_dev for DMA free\n");
> +		return;
> +	}
> +
> +	qda_dbg(NULL, "DMA freeing: size=%zu, device_id=%u, dma_addr=0x%llx\n",
> +		gem_obj->size, gem_obj->iommu_dev->id, gem_obj->dma_addr);
> +
> +	dma_free_coherent(gem_obj->iommu_dev->dev, gem_obj->size,
> +			  gem_obj->virt, get_actual_dma_addr(gem_obj));
> +
> +	cleanup_gem_object_fields(gem_obj);
> +}
> +
> +int qda_dma_mmap(struct qda_gem_obj *gem_obj, struct vm_area_struct *vma)
> +{
> +	struct qda_iommu_device *iommu_dev;
> +	int ret;
> +
> +	if (!gem_obj || !gem_obj->virt || !gem_obj->iommu_dev || !gem_obj->iommu_dev->dev) {
> +		qda_err(NULL, "Invalid parameters for DMA mmap\n");
> +		return -EINVAL;
> +	}
> +
> +	iommu_dev = gem_obj->iommu_dev;
> +
> +	ret = dma_mmap_coherent(iommu_dev->dev, vma, gem_obj->virt,
> +				get_actual_dma_addr(gem_obj), gem_obj->size);
> +
> +	if (ret)
> +		qda_err(NULL, "DMA mmap failed: size=%zu, device_id=%u, ret=%d\n",
> +			gem_obj->size, iommu_dev->id, ret);

if (ret) {
	qda_err();
	return ret;
	// or goto err_foo;
}

return 0;


> +	else
> +		qda_dbg(NULL, "DMA mmap successful: size=%zu\n", gem_obj->size);

It feels like the driver is over-verbose if debugging is enabled.

> +
> +	return ret;
> +}
> diff --git a/drivers/accel/qda/qda_memory_dma.h b/drivers/accel/qda/qda_memory_dma.h
> new file mode 100644
> index 000000000000..79b3c4053a82
> --- /dev/null
> +++ b/drivers/accel/qda/qda_memory_dma.h
> @@ -0,0 +1,46 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef _QDA_MEMORY_DMA_H
> +#define _QDA_MEMORY_DMA_H
> +
> +#include <linux/dma-mapping.h>
> +#include "qda_memory_manager.h"
> +
> +/**
> + * qda_dma_alloc() - Allocate DMA coherent memory for a GEM object
> + * @iommu_dev: Pointer to the QDA IOMMU device structure
> + * @gem_obj: Pointer to GEM object to allocate memory for
> + * @size: Size of memory to allocate in bytes
> + *
> + * Allocates DMA-coherent memory and sets up the GEM object with the
> + * allocated memory details including virtual and DMA addresses.
> + *
> + * Return: 0 on success, negative error code on failure
> + */

Move the kerneldoc from the headers to the driver code, otherwise they
are mostly ignored by the automatic validators.

> +int qda_dma_alloc(struct qda_iommu_device *iommu_dev,
> +		  struct qda_gem_obj *gem_obj, size_t size);
> +
> +/**
> + * qda_dma_free() - Free DMA coherent memory for a GEM object
> + * @gem_obj: Pointer to GEM object to free memory for
> + *
> + * Frees DMA-coherent memory previously allocated for the GEM object
> + * and cleans up the GEM object fields.
> + */
> +void qda_dma_free(struct qda_gem_obj *gem_obj);
> +
> +/**
> + * qda_dma_mmap() - Map DMA memory into userspace
> + * @gem_obj: Pointer to GEM object containing DMA memory
> + * @vma: Virtual memory area to map into
> + *
> + * Maps DMA-coherent memory into userspace virtual address space.
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +int qda_dma_mmap(struct qda_gem_obj *gem_obj, struct vm_area_struct *vma);
> +
> +#endif /* _QDA_MEMORY_DMA_H */
> diff --git a/drivers/accel/qda/qda_memory_manager.c b/drivers/accel/qda/qda_memory_manager.c
> index b4c7047a89d4..e225667557ee 100644
> --- a/drivers/accel/qda/qda_memory_manager.c
> +++ b/drivers/accel/qda/qda_memory_manager.c
> @@ -6,8 +6,11 @@
>  #include <linux/spinlock.h>
>  #include <linux/workqueue.h>
>  #include <linux/xarray.h>
> +#include <drm/drm_file.h>
>  #include "qda_drv.h"
> +#include "qda_gem.h"
>  #include "qda_memory_manager.h"
> +#include "qda_memory_dma.h"
>  
>  static void cleanup_all_memory_devices(struct qda_memory_manager *mem_mgr)
>  {
> @@ -55,6 +58,8 @@ static void init_iommu_device_fields(struct qda_iommu_device *iommu_dev,
>  	spin_lock_init(&iommu_dev->lock);
>  	refcount_set(&iommu_dev->refcount, 0);
>  	INIT_WORK(&iommu_dev->remove_work, qda_memory_manager_remove_work);
> +	iommu_dev->assigned_pid = 0;
> +	iommu_dev->assigned_file_priv = NULL;
>  }
>  
>  static int allocate_device_id(struct qda_memory_manager *mem_mgr,
> @@ -78,6 +83,194 @@ static int allocate_device_id(struct qda_memory_manager *mem_mgr,
>  	return ret;
>  }
>  
> +static struct qda_iommu_device *find_device_for_pid(struct qda_memory_manager *mem_mgr,
> +						    pid_t pid)
> +{
> +	unsigned long index;
> +	void *entry;
> +	struct qda_iommu_device *found_dev = NULL;
> +	unsigned long flags;
> +
> +	xa_lock(&mem_mgr->device_xa);
> +	xa_for_each(&mem_mgr->device_xa, index, entry) {
> +		struct qda_iommu_device *iommu_dev = entry;
> +
> +		spin_lock_irqsave(&iommu_dev->lock, flags);
> +		if (iommu_dev->assigned_pid == pid) {
> +			found_dev = iommu_dev;
> +			refcount_inc(&found_dev->refcount);
> +			qda_dbg(NULL, "Reusing device id=%u for PID=%d (refcount=%u)\n",
> +				found_dev->id, pid, refcount_read(&found_dev->refcount));

And what if there are two different FastRPC sessions within the same
PID?

> +			spin_unlock_irqrestore(&iommu_dev->lock, flags);
> +			break;
> +		}
> +		spin_unlock_irqrestore(&iommu_dev->lock, flags);
> +	}
> +	xa_unlock(&mem_mgr->device_xa);
> +
> +	return found_dev;
> +}
> +
> +static struct qda_iommu_device *assign_available_device_to_pid(struct qda_memory_manager *mem_mgr,
> +							       pid_t pid,
> +							       struct drm_file *file_priv)
> +{
> +	unsigned long index;
> +	void *entry;
> +	struct qda_iommu_device *selected_dev = NULL;
> +	unsigned long flags;
> +
> +	xa_lock(&mem_mgr->device_xa);
> +	xa_for_each(&mem_mgr->device_xa, index, entry) {
> +		struct qda_iommu_device *iommu_dev = entry;
> +
> +		spin_lock_irqsave(&iommu_dev->lock, flags);
> +		if (iommu_dev->assigned_pid == 0) {
> +			iommu_dev->assigned_pid = pid;
> +			iommu_dev->assigned_file_priv = file_priv;
> +			selected_dev = iommu_dev;
> +			refcount_set(&selected_dev->refcount, 1);
> +			qda_dbg(NULL, "Assigned device id=%u to PID=%d\n",
> +				selected_dev->id, pid);
> +			spin_unlock_irqrestore(&iommu_dev->lock, flags);
> +			break;
> +		}
> +		spin_unlock_irqrestore(&iommu_dev->lock, flags);
> +	}
> +	xa_unlock(&mem_mgr->device_xa);
> +
> +	return selected_dev;
> +}
> +
> +static struct qda_iommu_device *get_process_iommu_device(struct qda_memory_manager *mem_mgr,
> +							 struct drm_file *file_priv)
> +{
> +	struct qda_file_priv *qda_priv;
> +
> +	if (!file_priv || !file_priv->driver_priv)
> +		return NULL;
> +
> +	qda_priv = (struct qda_file_priv *)file_priv->driver_priv;
> +	return qda_priv->assigned_iommu_dev;
> +}
> +
> +static int qda_memory_manager_assign_device(struct qda_memory_manager *mem_mgr,
> +					    struct drm_file *file_priv)
> +{
> +	struct qda_file_priv *qda_priv;
> +	struct qda_iommu_device *selected_dev = NULL;
> +	int ret = 0;
> +	pid_t current_pid;
> +
> +	if (!file_priv || !file_priv->driver_priv) {
> +		qda_err(NULL, "Invalid file_priv or driver_priv\n");
> +		return -EINVAL;
> +	}
> +
> +	qda_priv = (struct qda_file_priv *)file_priv->driver_priv;
> +	current_pid = qda_priv->pid;
> +
> +	mutex_lock(&mem_mgr->process_assignment_lock);
> +
> +	if (qda_priv->assigned_iommu_dev) {
> +		qda_dbg(NULL, "PID=%d already has device id=%u assigned\n",
> +			current_pid, qda_priv->assigned_iommu_dev->id);
> +		ret = 0;
> +		goto unlock_and_return;
> +	}
> +
> +	selected_dev = find_device_for_pid(mem_mgr, current_pid);
> +
> +	if (selected_dev) {
> +		qda_priv->assigned_iommu_dev = selected_dev;
> +		goto unlock_and_return;
> +	}
> +
> +	selected_dev = assign_available_device_to_pid(mem_mgr, current_pid, file_priv);
> +
> +	if (!selected_dev) {
> +		qda_err(NULL, "No available device for PID=%d\n", current_pid);
> +		ret = -ENOMEM;
> +		goto unlock_and_return;
> +	}
> +
> +	qda_priv->assigned_iommu_dev = selected_dev;
> +
> +unlock_and_return:
> +	mutex_unlock(&mem_mgr->process_assignment_lock);
> +	return ret;
> +}
> +
> +static struct qda_iommu_device *get_or_assign_iommu_device(struct qda_memory_manager *mem_mgr,
> +							   struct drm_file *file_priv,
> +							   size_t size)
> +{
> +	struct qda_iommu_device *iommu_dev;
> +	int ret;
> +
> +	iommu_dev = get_process_iommu_device(mem_mgr, file_priv);
> +	if (iommu_dev)
> +		return iommu_dev;
> +
> +	ret = qda_memory_manager_assign_device(mem_mgr, file_priv);
> +	if (ret)
> +		return NULL;
> +
> +	iommu_dev = get_process_iommu_device(mem_mgr, file_priv);
> +	if (iommu_dev)
> +		return iommu_dev;
> +
> +	return NULL;
> +}
> +
> +int qda_memory_manager_alloc(struct qda_memory_manager *mem_mgr, struct qda_gem_obj *gem_obj,
> +			     struct drm_file *file_priv)
> +{
> +	struct qda_iommu_device *selected_dev;
> +	size_t size;
> +	int ret;
> +
> +	if (!mem_mgr || !gem_obj || !file_priv) {
> +		qda_err(NULL, "Invalid parameters for memory allocation\n");
> +		return -EINVAL;
> +	}
> +
> +	size = gem_obj->size;
> +	if (size == 0) {
> +		qda_err(NULL, "Invalid allocation size: 0\n");
> +		return -EINVAL;
> +	}
> +
> +	selected_dev = get_or_assign_iommu_device(mem_mgr, file_priv, size);
> +
> +	if (!selected_dev) {
> +		qda_err(NULL, "Failed to get/assign device for allocation (size=%zu)\n", size);
> +		return -ENOMEM;
> +	}
> +
> +	ret = qda_dma_alloc(selected_dev, gem_obj, size);
> +
> +	if (ret) {
> +		qda_err(NULL, "Allocation failed: size=%zu, device_id=%u, ret=%d\n",
> +			size, selected_dev->id, ret);
> +		return ret;
> +	}
> +
> +	qda_dbg(NULL, "Successfully allocated: size=%zu, device_id=%u, dma_addr=0x%llx\n",
> +		size, selected_dev->id, gem_obj->dma_addr);
> +	return 0;
> +}
> +
> +void qda_memory_manager_free(struct qda_memory_manager *mem_mgr, struct qda_gem_obj *gem_obj)
> +{
> +	if (!gem_obj || !gem_obj->iommu_dev) {
> +		qda_dbg(NULL, "Invalid gem_obj or iommu_dev for free\n");
> +		return;
> +	}
> +
> +	qda_dma_free(gem_obj);
> +}
> +
>  int qda_memory_manager_register_device(struct qda_memory_manager *mem_mgr,
>  				       struct qda_iommu_device *iommu_dev)
>  {
> @@ -134,6 +327,7 @@ int qda_memory_manager_init(struct qda_memory_manager *mem_mgr)
>  
>  	xa_init_flags(&mem_mgr->device_xa, XA_FLAGS_ALLOC);
>  	atomic_set(&mem_mgr->next_id, 0);
> +	mutex_init(&mem_mgr->process_assignment_lock);
>  	mem_mgr->wq = create_workqueue("memory_manager_wq");
>  	if (!mem_mgr->wq) {
>  		qda_err(NULL, "Failed to create memory manager workqueue\n");
> diff --git a/drivers/accel/qda/qda_memory_manager.h b/drivers/accel/qda/qda_memory_manager.h
> index 3bf4cd529909..bac44284ef98 100644
> --- a/drivers/accel/qda/qda_memory_manager.h
> +++ b/drivers/accel/qda/qda_memory_manager.h
> @@ -11,6 +11,8 @@
>  #include <linux/spinlock.h>
>  #include <linux/workqueue.h>
>  #include <linux/xarray.h>
> +#include <drm/drm_file.h>
> +#include "qda_gem.h"
>  
>  /**
>   * struct qda_iommu_device - IOMMU device instance for memory management
> @@ -35,6 +37,10 @@ struct qda_iommu_device {
>  	u32 sid;
>  	/* Pointer to parent memory manager */
>  	struct qda_memory_manager *manager;
> +	/* Process ID of the process assigned to this device */
> +	pid_t assigned_pid;
> +	/* DRM file private data for the assigned process */
> +	struct drm_file *assigned_file_priv;
>  };
>  
>  /**
> @@ -51,6 +57,8 @@ struct qda_memory_manager {
>  	atomic_t next_id;
>  	/* Workqueue for asynchronous device operations */
>  	struct workqueue_struct *wq;
> +	/* Mutex protecting process-to-device assignments */
> +	struct mutex process_assignment_lock;
>  };
>  
>  /**
> @@ -98,4 +106,29 @@ int qda_memory_manager_register_device(struct qda_memory_manager *mem_mgr,
>  void qda_memory_manager_unregister_device(struct qda_memory_manager *mem_mgr,
>  					  struct qda_iommu_device *iommu_dev);
>  
> +/**
> + * qda_memory_manager_alloc() - Allocate memory for a GEM object
> + * @mem_mgr: Pointer to memory manager
> + * @gem_obj: Pointer to GEM object to allocate memory for
> + * @file_priv: DRM file private data for process association
> + *
> + * Allocates memory for the specified GEM object using an appropriate IOMMU
> + * device. The allocation is associated with the calling process via
> + * file_priv.
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +int qda_memory_manager_alloc(struct qda_memory_manager *mem_mgr, struct qda_gem_obj *gem_obj,
> +			     struct drm_file *file_priv);
> +
> +/**
> + * qda_memory_manager_free() - Free memory for a GEM object
> + * @mem_mgr: Pointer to memory manager
> + * @gem_obj: Pointer to GEM object to free memory for
> + *
> + * Releases memory previously allocated for the specified GEM object and
> + * removes any associated IOMMU mappings.
> + */
> +void qda_memory_manager_free(struct qda_memory_manager *mem_mgr, struct qda_gem_obj *gem_obj);
> +
>  #endif /* _QDA_MEMORY_MANAGER_H */
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

