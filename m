Return-Path: <linux-media+bounces-58725-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHqxJK0K3mnRmQkAu9opvQ
	(envelope-from <linux-media+bounces-58725-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 11:36:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D793F8039
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 11:36:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 999EF3053BF2
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 09:33:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73A043C455B;
	Tue, 14 Apr 2026 09:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YJKMVZ4A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PbRKnYhp"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66F23C2770
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 09:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776159217; cv=none; b=nyZ/OCYuZdmSadAHdkDReq7P53egfTfSXQKhQOLHLvT8+yxSYAwAWQGYCPyS5V/r3PsB3M31W7Fe1XJSY5pFKI7YR2KXWrMvv+wnY4t9xvjzSVQlsd0zuwJCagP2zhBfYHTZgOi+kM/Fudx/GNJM5vXbADTl6IYi3bgIX+9/HCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776159217; c=relaxed/simple;
	bh=0BPZxwyeCDxt/qQ3n1UlOe0NaqQe38QUBg+xfperdj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ue2Chpd5yN4LoX1XlaMILJRaPO8loJMLWkfEVwr0l9xmLmTDlLRyBzxuqn2OBnOq4joSLpWISGY4RnHxYKD5NWs89xXtZTBQiD8GvaLr2N0OAb7vcq1h8EBorE83qK0GJrZsMopOem2CAqaZ4DfT8JXzZeKdUDcQANvBPmzBtIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YJKMVZ4A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PbRKnYhp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6SvuU2633413
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 09:33:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mSbqfMc6xRfrir7P9sbbGiVO
	qRkXoiDCed3ZiNBf5fk=; b=YJKMVZ4Adyx6ojrbYHIw6Si593Z37yloSz8aGqg5
	DBEIwsJA+NOP0telQpGWfp1aVu4rf4qRteIHNVjnLk8laJVWRbv6DAQ+VAhJid0d
	dxWWxQg+o3VDoXlpUalH+ii5DSmddfXh2EDnCnex4X3ew5mS/MolJf2LnzOxvnx2
	KyF0LDdv51HTDtvrzjgfYapa3kijKH2fiDjsx0Hd7KMnwbQawoh+TKd67pgfypLT
	IqoYNFyav45qxmUeSEdKcWbNpWUbigULEGQHJ/Tlk3bl4oVKslueF1IE/667PURk
	JxkGxR3dpCIgZiVEfgukf3DlPZCR4zlZvltkD9VFuJcrhQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86ca3qm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 09:33:35 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35fbb57764aso1826377a91.1
        for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 02:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776159215; x=1776764015; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mSbqfMc6xRfrir7P9sbbGiVOqRkXoiDCed3ZiNBf5fk=;
        b=PbRKnYhpS7rvlFXBM7pQi6F3Qr4FuUq19DejxuQy+VtpeATlagjHtxMuHsN5nD+JQE
         0uhANXjeIJqZ0rLapt5e9Q7JyPpb791KnubKTScZgwDyoDhg5l5grLTYbE/2OElRBX5y
         r0viU/lGu0IhzW7kvF3kqmamlSjw1WMhJR/7nQsxAVq14HNi3DlzvFOqxiOy5DoPzA+B
         zfHzRDp2ZNtTPxMDPciLQ17SlTe+z1rdAhMjf3iA97XaUg34mG84JdpuBkxFz0q8GUdY
         pBTGH/c0ZVfiMwT2u0HRxIgAsPNt4j61vJBZLLOiZo1JoroFjUd6RJIFqd6qjKJCFYTR
         zotw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776159215; x=1776764015;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mSbqfMc6xRfrir7P9sbbGiVOqRkXoiDCed3ZiNBf5fk=;
        b=HO4hD2+2iPvPpb4whsr+p+7yGnS/OnK24KTO5qmsRds5CnCBslBtvrQQQd9GlZSJ47
         kiQV6fQmimAmPAQ7t2p5dJo2OcJpkN0/o6JzdUZD89p3sG5CRnvZ12587Wp3Y0wGCx1W
         7LC17z7zd/opE2GesEIZBFBnuHESND9hgZPdusaYcb0VFkwXM8c7ctPWQ1uJMcPG+5Gu
         YMr++tq5RrIcXsOXy7iFEterG7iQn5KTel2oenu4lsCHOxefZ8EDObOGh3mtnSGRtU9o
         9kEV+BR7aO3P7c2y4QO0SS38dAv9ysSW4dfS1KbnLBGHg21pClpMHu79O8RC5vFASMFV
         0V/w==
X-Forwarded-Encrypted: i=1; AFNElJ+8tE2v11YMyjM+27/YjZa15Lc0WB9i6KvRhtFFs36Ee9t3+KERgwTAWRCU+KaM+1BQo1NRHMDDHWScog==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7D57NMymMMLn348GWIuCDyGZtFXBsFs/CCtl6+8YtFIWCr4HV
	pZUCnPhyFjeOS8K4/Bay3eiQ/sL2C6ERLGWM5O7ppkUXntxO01jxKr77p8uWcY8k9WAjnQIQlsh
	eibYIcvVGpVoGzW4YB1fS3Lfx5L8eB137RDkaMxgCoqDn7I8wzezpQ49m0GJA8SMuBA==
X-Gm-Gg: AeBDietfGqmTr4EmKy840Lvm3QLC/qbkmztOnv6KIZIag7odxF+3HuMQWpM7gdn5lLz
	E2igKgKzKnO5uX5ctlaVDkYtgcVpesjLhxufi69qdTZA6rgKlt0V73Kcca17ByAmrZ60IsXvAEz
	EEGJD4ai4T73NWyeiloUXvIoQJMdAmusIhzZSzjDITKfLja0oq8f4+Ewc30UrlX6h0qxY1kPL7n
	Es+xZ8wuHgxNRlO8dY2O6W49+ZclyZYLTesg87c9jNH8BNyoriMGbZbvNWt8YfG4xIFKLeNfmGZ
	Ya9HQRtm4jvvqWQm1efkbWSXqVrYwttFar94Q/ymE3AY1WpbJPNVS/egRlJ9lH0QlwGqGmf69k/
	AbJz0bpX76fOMvUURq/4vNkQBO+S1AVBaMZrdUWAZbU7y8k7n
X-Received: by 2002:a17:903:3c6e:b0:2b0:6068:4c5f with SMTP id d9443c01a7336-2b2c7260fb9mr194441145ad.8.1776159215262;
        Tue, 14 Apr 2026 02:33:35 -0700 (PDT)
X-Received: by 2002:a17:903:3c6e:b0:2b0:6068:4c5f with SMTP id d9443c01a7336-2b2c7260fb9mr194440675ad.8.1776159214669;
        Tue, 14 Apr 2026 02:33:34 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b45e949464sm76959135ad.24.2026.04.14.02.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 02:33:34 -0700 (PDT)
Date: Tue, 14 Apr 2026 15:03:25 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [PATCH 05/11] media: iris: Enable Secure PAS support with IOMMU
 managed by Linux
Message-ID: <20260414093325.clafqgd367jrqpvq@hu-mojha-hyd.qualcomm.com>
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-5-7d3d1cf57b16@oss.qualcomm.com>
 <20260414063128.6ass64wfi7nmtzti@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414063128.6ass64wfi7nmtzti@hu-mojha-hyd.qualcomm.com>
X-Proofpoint-ORIG-GUID: OnxHT9DFQXDUwF6ndeG3Ia7ss_j4emDt
X-Authority-Analysis: v=2.4 cv=RoH16imK c=1 sm=1 tr=0 ts=69de09f0 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=TLljPvHKC21aDJODJdYA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA4OCBTYWx0ZWRfX8GwwNcKA5J1+
 h8sB0Wvzc0D0eKt1QgVY3Ula0D3Kv9khjah2xGfhUnYGieI1HV+vCtekWVAcaN64l62dwEaBBNh
 g7jM5Ef2j/gxaURIoujWc2mTSG2tjcJET8n9tZzzCDUpClmr17dk2Flpmu3DMBH1wKiR5u7VvOl
 R1q9ueJskSvnWSR9ypur4+SLKYTiY7UbuLIFpI3tbX3DhfOKy1LU1OODF7FBM834/NURLhhd1on
 XySs5sOB1+IpoQqmM6O/Sz8dcSwzZbmhBPBnnwunWrGAA2ZRNt7ITC65b6MzyKPGic+uvgSWtqj
 MjRWQNVNAUCGlNlg8i+DQK/slyJBXRAhScXUHH0hQnoNb2Ej0xJcCp28wafIy1SIFI95Ctmy1+B
 yXXLkI8ASP7e890MLb8WY9vt0zGWpmoq0sEXnn9kTC3ihBSb/88PyUflG8bn0ktQXenIfBtTpGo
 1Qs8TF+AP8UzzB+JdVQ==
X-Proofpoint-GUID: OnxHT9DFQXDUwF6ndeG3Ia7ss_j4emDt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140088
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58725-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 13D793F8039
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 14, 2026 at 12:01:28PM +0530, Mukesh Ojha wrote:
> On Tue, Apr 14, 2026 at 10:30:01AM +0530, Vishnu Reddy wrote:
> > From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > 
> > Most Qualcomm platforms feature a proprietary hypervisor (such as Gunyah
> > or QHEE), which typically handles IOMMU configuration. This includes
> > mapping memory regions and device memory resources for remote processors
> > by intercepting qcom_scm_pas_auth_and_reset() calls. These mappings are
> > later removed during teardown. Additionally, SHM bridge setup is required
> > to enable memory protection for both remoteproc metadata and its memory
> > regions.
> > 
> > When the hypervisor is absent, the operating system must perform these
> > configurations instead.
> > 
> > Support for handling IOMMU and SHM setup in the absence of a hypervisor
> > is now in place. Extend the Iris driver to enable this functionality on
> > platforms where IOMMU is managed by Linux (i.e., non-Gunyah, non-QHEE).
> > 
> > Additionally, the Iris driver must map the firmware and its required
> > resources to the firmware SID, which is now specified via iommu-map in
> > the device tree.
> > 
> > Co-developed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
This works as long as IRIS does not have optional resources. Once it
starts needing mandatory resources like some peripheral access mapped
before IRIS is brought out of reset, it will need a resource table SCM
call, which we currently added for remote processors like ADSP and CDSP.

Let me know if you have plans to add that. I have a few sets of changes
in the remoteproc resource table and an API which we added in the
initial series that I could bring in.

-Mukesh

