Return-Path: <linux-media+bounces-41706-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35637B423A7
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 16:28:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A45571BC0810
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 14:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E30D0312802;
	Wed,  3 Sep 2025 14:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C3a5ReiB"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3A92798FE
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 14:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756909692; cv=none; b=Ol8Qmh5s9bRwE5RvaG5HQTUO0b75jQf/bw39iwvzneSkEqJ1TxQMLSurXUVupydo3nfb99BXZg9BCoeC6uwbiWAlBKBtmRbbxHSkK8Llwm1uUCukDyfQf+8DwPqUrBoWKI0BEJn0MVM3cBeOEFXQsM0SdM3JyExObVClS7EF6v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756909692; c=relaxed/simple;
	bh=5NUgSP3WjLO6mB8O6hOC8kcnm9SKM1MNi4rpwYI8aGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JI0n/iidOq+YtWakuKjTQCcr0WWqX/byjQdKkoVElKPIeCNwZL5rPfUT1DbFXTRf9i6lAPFCWs4ALHnbfH7imzAVMO6sSlCYCs+dm8AqBrcekAZKj84evb2WFRh2YrgxJg+TxZoy/h1AGlcE5+bA6BhOLfmCNemBvx8ZCxsqyLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C3a5ReiB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583DwqNc016538
	for <linux-media@vger.kernel.org>; Wed, 3 Sep 2025 14:28:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L4ipgqdEgcAXkAp5KqyDjRVuxiPGqDPMl7pw6aWThFg=; b=C3a5ReiBCOLW45Gc
	HjTLXDz+uHmjYXpAGTUvy97HeadWf+ADlF7fCAGMTimG9UG6XKIqthGVtSAFHe6u
	B1KNG4GT2a5JGBdzr5IYJ+mIAsYLs+qwhnRHCODe54iyH+sCY+qlqCPldruc+qtv
	CR/SxEJ059yU1CxwDHEJ5MaZLVIq5QyTWG5IoMHbmdxqOtRkuOUjuy1HIskiMlZL
	CxXG6EHt+Ha8IaCPOSadBSq1YC7q62Lr20RJQuslSgewzmiNZYAKOrFmpcWn8hA2
	yqPZAnR2CscGnP+G8qwv0U2P5d5Uqev/PKxU8cFaOs2mOOVp05hmbu9F/rDMnSla
	LVbOGA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48xmxj0hvx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 03 Sep 2025 14:28:09 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b31bea5896so44148441cf.2
        for <linux-media@vger.kernel.org>; Wed, 03 Sep 2025 07:28:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756909688; x=1757514488;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L4ipgqdEgcAXkAp5KqyDjRVuxiPGqDPMl7pw6aWThFg=;
        b=FbxgFvwlI6F8HLwIJqrrnz+OUd0eZ/hQSydSzdJy8Ss8rHGxhw43u96YJ7orEnK0QM
         vV7428z4BzZL8JVhV084zRqmaBT3Rw++QNeDE2teT7IIDT2CoZ1u+1dT2TCjla9vWSLE
         ImJiK/PdPoPPaXQQECpM3M71KHc+O0uZcbljDt2NErN1qcDR8MceIPajOe7vaF3rTQKh
         x+WZBSsSc3aKxmKRaFKern1gSqeE+vhu+CYHrQOCMpzzKMRTsqjKZwMxngHH7c3Ep0mk
         WlNBAqkvv0JFiAqzzMVvXX80qXXEN1eJDo4MkY3YP3hrv2iQgzt5F+okw41+LomSMbaY
         N4pg==
X-Forwarded-Encrypted: i=1; AJvYcCV0OPCryrl+bnXgwguwVVVw5Zfsfmt1YaQUnI268yrwGnmg3dvYKIIrQaWpraYH5cjE+Ps7lY60F5g/BQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YydOywk4W+1tj6FNU+Z+ewarSqdY6blbHWolXLknAb1K3Lftn9D
	1Lik9/+duJK/IeCMuikaZfQuQNmui8f6cHvL/D9M1W1lRnNnEeffSF6BvLoRxcP1P04uxoIlzX8
	DWNIo3ZUvSbKoQjJS3DVPrPI0zLnrn1oBSyJ3zhwsKP3qhGbO8cF0PI4Lg5Wke10Tas5hfE3ATA
	==
X-Gm-Gg: ASbGncs6lpCzYA4JSSFkrw1Qm08QQz4wcINbSXn7o5aennwx/30GuX8GXK7KLaP3AV/
	J6ogcNrv1r5khWzbDK7rm/hse8Av6PRBAYs1ZvwsluYg0pEN71XjWoa+/Eysz22Yj5BNp09oW1c
	oX7zZ3eAnbAVnK3rdRllva4Oxfdzd7CWaVjB5cRYoVXVhYHmVkl6BUlXE0LZZGI55cxfWU2mZXa
	VJyuRos/BJKSYgx1wD+9iwGZ6PT1v1pEqN3lS44IkxpgiO8318/9u6oTGXpFndS4MDfeqOiaz26
	kG8V62ayyRpGJqYyuGjlYxG5ZjGDFXVFHa2jujgmq6N6DpDSy/5xpOxn+C//abGtwLVs9ugk273
	38AauPunSiXYVc2fABa3tFm6hHyj6oUe93VZ9bweAmJBWGU237lfQ
X-Received: by 2002:a05:622a:1b21:b0:4b2:f784:f84a with SMTP id d75a77b69052e-4b31d853312mr177413371cf.34.1756909687574;
        Wed, 03 Sep 2025 07:28:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkb2TvZ0ILCgVrpH6pEb2ofnVtveugEN/WrUGyfbDS8L/ffVoWw0w7K8WMrbPeBg7z4t3u2Q==
X-Received: by 2002:a05:622a:1b21:b0:4b2:f784:f84a with SMTP id d75a77b69052e-4b31d853312mr177412541cf.34.1756909686735;
        Wed, 03 Sep 2025 07:28:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ad523b3sm545534e87.151.2025.09.03.07.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 07:28:05 -0700 (PDT)
Date: Wed, 3 Sep 2025 17:28:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 00/11] Peripheral Image Loader support for Qualcomm
 SoCs running Linux host at EL2
Message-ID: <fbwey76fzidnwni6nqh7qhtw6fsybyivraa7dmow47ga6tbvts@pqkwvoyfkwb6>
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <660c2594-9a93-450e-9a2e-17ef6b4c696d@linaro.org>
 <20250820112242.usd4sdd3avxdlcas@hu-mojha-hyd.qualcomm.com>
 <f5582304-8f55-4c3b-b752-9cefa1e4df96@oss.qualcomm.com>
 <b5a0ad0d-ceba-40d3-a111-0831c4538cea@linaro.org>
 <2g3iwc2en6wh2ucrsth5ontzdwqr7tr6oplxjnfdjsy3lwyyfe@l76frwiadgru>
 <7a7c122f-50e1-476a-939e-9d76e34b1d6a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7a7c122f-50e1-476a-939e-9d76e34b1d6a@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAzMDExNyBTYWx0ZWRfX/2ons+oCkF03
 fvhxxXkkEOyRmTxu966zGKbWSYOKZG7j+8DaI2MZ+ORCiBS/4kJ6ZE+nyGJ/CTNaobC9Ibki5mk
 K8DOtBpYcKBeIJuxI3Nnz0ToeoaE0F9UEU+QdWLMzCxzCY86yLAcPY8OOLTwNZWwD7EKUdDR41X
 dDRhw449j5P3efkl9pQjMMbyKl+wP3maXv1aI2ymO0NHzjMxlJiY9VizcN04N7PTthLk//Kqp5F
 x9A3KWw0M07QE+YGNzcxrdCK6jV83YbQNJs2tX0x2XKg+KP2GvEgJAivmboQjeVQb8oOXOQbZmd
 qSJAmPhZXJtn6Y4QLOJnm/DLWcWoZ3+xmRboVvB8yGxbvGTCVN6zUd7obAhAC87KSusoel4M52P
 t2j+cn39
X-Authority-Analysis: v=2.4 cv=a5cw9VSF c=1 sm=1 tr=0 ts=68b85079 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=gVesVhWOi32bg9pDB_oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=Vxmtnl_E_bksehYqCbjh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: jGaVMkj2LYedJ7rYTIwcwl9m6s-E9ICl
X-Proofpoint-ORIG-GUID: jGaVMkj2LYedJ7rYTIwcwl9m6s-E9ICl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509030117

On Wed, Sep 03, 2025 at 03:13:18PM +0100, Bryan O'Donoghue wrote:
> On 03/09/2025 15:02, Dmitry Baryshkov wrote:
> > On Wed, Sep 03, 2025 at 02:31:55PM +0100, Bryan O'Donoghue wrote:
> > > On 03/09/2025 12:56, Konrad Dybcio wrote:
> > > > > Can you try with this next-20250814 tag ?
> > > > You sent it on the 19th, so it's in your best interest to run a quick
> > > > 
> > > > git rebase --onto linux-next/master $(git describe --abbrev=0)
> > > > 
> > > > and giving the series a prompt re-test before sending, because there might have
> > > > been incompatible changes, whether ones that would prevent applying, or break
> > > > things functionally
> > > 
> > > I can't even find that tag next-20250814 closets thing is
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tag/?h=next-20250814
> > 
> > > 
> > > | * \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \   00062ea01d35e - Merge tag
> > > 'drm-xe-fixes-2025-08-14' of https://gitlab.freedesktop.org/drm/xe/kernel
> > > into drm-fixes (3 weeks ago)
> > > 
> > > but patch #9 in this series stubbornly won't apply to any SHA I've tried.
> > > 
> > > meh
> > > 
> > > ---
> > > bod
> > 
> 
> Unfortunately that's not the right SHA though

Then let's wait for Mukesh to switch to b4 (and use b4 --edit-deps) or
to use a proper git format-patch arguments.

> 
> git checkout -b next-20250814-test next-20250814
> 
> Switched to a new branch 'next-20250814-test'
> 
> b4 shazam 20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-7-ce7a1a774803@oss.qualcomm.com
> Grabbing thread from lore.kernel.org/all/20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-7-ce7a1a774803@oss.qualcomm.com/t.mbox.gz
> Checking for newer revisions
> Grabbing search results from lore.kernel.org
>   Added from v8: 12 patches
>   Added from v9: 12 patches
> Analyzing 60 messages in the thread
> Analyzing 163 code-review messages
> Will use the latest revision: v9
> You can pick other revisions using the -vN flag
> Checking attestation on all messages, may take a moment...
> ---
>   ✓ [PATCH v9 1/11] tee: allow a driver to allocate a tee_device without a
> pool
>   ✓ [PATCH v9 2/11] tee: add close_context to TEE driver operation
>   ✓ [PATCH v9 3/11] tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
>   ✓ [PATCH v9 4/11] tee: add TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF
>   ✓ [PATCH v9 5/11] tee: increase TEE_MAX_ARG_SIZE to 4096
>   ✓ [PATCH v9 6/11] firmware: qcom: scm: add support for object invocation
>   ✓ [PATCH v9 7/11] firmware: qcom: tzmem: export shm_bridge create/delete
>   ✓ [PATCH v9 8/11] tee: add Qualcomm TEE driver
>   ✓ [PATCH v9 9/11] tee: qcom: add primordial object
>   ✓ [PATCH v9 10/11] tee: qcom: enable TEE_IOC_SHM_ALLOC ioctl
>   ✓ [PATCH v9 11/11] Documentation: tee: Add Qualcomm TEE driver
>   ---
>   ✓ Signed: DKIM/qualcomm.com (From: amirreza.zarrabi@oss.qualcomm.com)
> ---
> Total patches: 11
> ---
>  Base: using specified base-commit 33bcf93b9a6b028758105680f8b538a31bc563cf
> Applying: tee: allow a driver to allocate a tee_device without a pool
> Applying: tee: add close_context to TEE driver operation
> Applying: tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
> Applying: tee: add TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF
> Applying: tee: increase TEE_MAX_ARG_SIZE to 4096
> Applying: firmware: qcom: scm: add support for object invocation
> Applying: firmware: qcom: tzmem: export shm_bridge create/delete
> Applying: tee: add Qualcomm TEE driver
> Applying: tee: qcom: add primordial object
> Applying: tee: qcom: enable TEE_IOC_SHM_ALLOC ioctl
> Applying: Documentation: tee: Add Qualcomm TEE driver
> 
> b4 shazam 20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com
> Grabbing thread from lore.kernel.org/all/20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com/t.mbox.gz
> Checking for newer revisions
> Grabbing search results from lore.kernel.org
> Analyzing 70 messages in the thread
> Looking for additional code-review trailers on lore.kernel.org
> Analyzing 0 code-review messages
> Checking attestation on all messages, may take a moment...
> ---
>   ✓ [PATCH v2 1/11] firmware: qcom_scm: Introduce PAS context initialization
> helper
>   ✓ [PATCH v2 2/11] soc: qcom: mdtloader: Add context aware
> qcom_mdt_pas_load() helper
>   ✓ [PATCH v2 3/11] firmware: qcom_scm: Add a prep version of auth_and_reset
> function
>   ✓ [PATCH v2 4/11] firmware: qcom_scm: Simplify qcom_scm_pas_init_image()
>     + Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> (✗
> DKIM/linaro.org)
>   ✓ [PATCH v2 5/11] firmware: qcom_scm: Add shmbridge support to
> pas_init/release function
>   ✓ [PATCH v2 6/11] remoteproc: Move resource table data structure to its
> own header
>   ✓ [PATCH v2 7/11] firmware: qcom_scm: Add qcom_scm_pas_get_rsc_table() to
> get resource table
>   ✓ [PATCH v2 8/11] soc: qcom: mdt_loader: Add helper functions to map and
> unmap resources
>   ✓ [PATCH v2 9/11] remoteproc: pas: Extend parse_fw callback to parse
> resource table
>   ✓ [PATCH v2 10/11] remoteproc: qcom: pas: Enable Secure PAS support with
> IOMMU managed by Linux
>   ✓ [PATCH v2 11/11] media: iris: Enable Secure PAS support with IOMMU
> managed by Linux
>   ---
>   ✓ Signed: DKIM/qualcomm.com (From: mukesh.ojha@oss.qualcomm.com)
> ---
> Total patches: 11
> ---
> Applying: firmware: qcom_scm: Introduce PAS context initialization helper
> Applying: soc: qcom: mdtloader: Add context aware qcom_mdt_pas_load() helper
> Applying: firmware: qcom_scm: Add a prep version of auth_and_reset function
> Applying: firmware: qcom_scm: Simplify qcom_scm_pas_init_image()
> Applying: firmware: qcom_scm: Add shmbridge support to pas_init/release
> function
> Applying: remoteproc: Move resource table data structure to its own header
> Applying: firmware: qcom_scm: Add qcom_scm_pas_get_rsc_table() to get
> resource table
> Applying: soc: qcom: mdt_loader: Add helper functions to map and unmap
> resources
> Applying: remoteproc: pas: Extend parse_fw callback to parse resource table
> Patch failed at 0009 remoteproc: pas: Extend parse_fw callback to parse
> resource table
> error: patch failed: drivers/soc/qcom/mdt_loader.c:22
> error: drivers/soc/qcom/mdt_loader.c: patch does not apply
> hint: Use 'git am --show-current-patch=diff' to see the failed patch
> hint: When you have resolved this problem, run "git am --continue".
> hint: If you prefer to skip this patch, run "git am --skip" instead.
> hint: To restore the original branch and stop patching, run "git am
> --abort".
> hint: Disable this message with "git config set advice.mergeConflict false"
> 

-- 
With best wishes
Dmitry

