Return-Path: <linux-media+bounces-53217-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yN6PFJqnnGklJwQAu9opvQ
	(envelope-from <linux-media+bounces-53217-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 20:16:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B0D17C32E
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 20:16:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0208E303AF3A
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 19:12:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF63C374162;
	Mon, 23 Feb 2026 19:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PIS0rMcE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AJNM2Kgr"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C916372B55
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 19:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771873878; cv=none; b=ml4jB4EkKleG66waMihcm4Fsx1kmVlKMHKyZ456uk3jOiBxTMNYnR/5TpZsU+EIz9u1FIwlpicdwgUl9HvYLl2KrseTh75MfVcY9OOWIT9gsYCvTZAyGXZLCGAME1+UqOwim4hGs5wdUY7zG9CWzjd0/I43nG4N0KQfBo73LkDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771873878; c=relaxed/simple;
	bh=rXImOerPPCRcLM/PrX4s5yCQxV6omJBtcCXYYEPRUAw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tkhyaalFVCusMqG4rbcmLkO+waNavvwg5W7X7qArvKXJzEP7E1JDiz0I+mJr2XpM17GOOy/VQD3CRrY4Lp29bIiCV3SZlBQnB+oKCkXi7ArJNfZljISAcEM9yHpOBv8dsF+iJWbxuJYnJGAiw0TxRqnE6bFxkjimlCGwl6QEjCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PIS0rMcE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AJNM2Kgr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NC2ga13151767
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 19:11:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/8fFZehduIFTGd4qCuwHVKAUzJ2Ctw4RrkqPCbZ/59E=; b=PIS0rMcEGxe9OCe/
	61zEZ5Yss1GD9dMG7fC9eNOvlee47iCkm7vyqfLTMhW03EILhyUfzHBT50Ez/Wdh
	rT+yy0E82JueK+JezRaao6MP6LQBqN9OSzydfaKSlFWTr67hnSgpJo95j41tLnUZ
	pdtsHAXIEDjqwNsdksr7UQ6eHb5RQXtfQs0Gvk491eE9dGnCr1aAVvQFb8QCQZwQ
	+ZP3jq4ki4hygXRZnh8xL1Yh50iNQrKTNDWyl9YXeg7MVMVP4JV3ESXtEtauivoe
	LX5yDiyaWcpNH2r+NarxMqF80yZtv+XEPZdN2c6s3Dk5yhHuwIkAx8BzPX4PBe36
	zxNDDw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgpj89c3y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 19:11:15 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ab0b2e804cso55451215ad.3
        for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 11:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771873874; x=1772478674; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/8fFZehduIFTGd4qCuwHVKAUzJ2Ctw4RrkqPCbZ/59E=;
        b=AJNM2KgrRMW7TOD7j0TM9u6cf/vemIJZHvkQCN7LXnt4LxWXkAjc4Z2igYEEBPPeR3
         bdASliIxDv467HCNwQJIXWPBHN2Rr+dzkn8GRDp7kNKQaZvKxFBjTZ75uFX74SfK0A9C
         +v/jnNugSx36izfiSbGt48K+OWagTbDfp/s+OS6jsn1k7KzIAJrD6I9lnz/l6KYFyoiw
         G9V6lTuh5VCBUwaO1IFrA3q97tuYLCNUXopqbG2ZqrHAq0pUREyfTswKkDYORFxcazKV
         DJL7oSfkQYfYmNoWdYWb9XlEieOJRf221rjGbJ6Pw4M7rmnjZse4q4vjn8HiPQ8veGbB
         k7CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771873874; x=1772478674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/8fFZehduIFTGd4qCuwHVKAUzJ2Ctw4RrkqPCbZ/59E=;
        b=AkUGU8ajcsRDD9mIxlFT84BswOW6t1BKCk5BcJ3izS1gMzWZTuvVmN5QS4cOgC6728
         t9WlZ5b4upa5+Hc7zU7v61+TOc5KFl7Xfi1/m9bxXFlhqoRDgW70dFesdNjGxEwPRZTh
         UgcNSpX3Vl9czieQWhBIYQhw/E6vozNdRrcsbK+MMNJqxQLm8qjIadoT93pgmISUDPp2
         m5DmPy6ALsnJ3c8pKbZyUnROD1CcEmW/L8fB86FiaElYJjqImkPcQy5VBEECxoE5/b+z
         O0Gpw8/WR5sFG3pr3Nz+ZDbPJGOh8mnw0pdxQoUK3jOikshG65MzL+tLmPrJZ4W691W1
         j5IQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMUPE/irMooyqOKtf5ILqbMYvYxkdch6tFMgrdCq2oWCLZhfPK5NB/FlAA0DRGlaC9RdEtO05G3M7Mgg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxor13liBD7CZ1irF+SHN6El/Um3NGdTN7U9hMDCDoIUrc4/8Cf
	hTCw/kmDbgOwXolk0r8mpsuNSr8cWhCEhLKELv811tw4dLoMRZpoLl4MVo7NUWzfHCeHIaZPeKZ
	jZxm7tdLKGy8gOiGxaDUlghd9PI3dymM5FH0OUos9TLohEz1sRiyXLTEOOjmQydyPhQ==
X-Gm-Gg: ATEYQzxGu8+Ak54GKOD8B5c6Xx23Gb1wtlhK+XP2CFrp2XI+IsaTM46N6uw+YRm+Jq8
	TRlo6NOM9dkO1KJoM8CUP+V9p9oGcIjkLvpo/7DPdSfGu3Z295gRp1NPBgMc6VpxNozRDpcCzg8
	C4w6Y2rYD+nNRXAwqLKLtpRU30z4NhLTF/O97UHTQ19jdWuUmsygY/za4Wpzr/pVzgOaYZmABoz
	Kz3TqPK9go11r/qotI1s1e9LtdPap6knt5DX0/MQxBUWScv7PSvT+bG7iSG1/oreI/3HnaJeGmq
	zqVR59jsy7AJfL49Ybp1c+3kQ08BGBKVg/FnUeDFrTnISHHjdWpjZiqFde8mUyd1L/drO1s1yf/
	lLQ+OqPw+dW9T/LxFSTtaVMb283BVOsyg0qecWIuaQT5f0GemaqVuiQ==
X-Received: by 2002:a17:903:2a8f:b0:2aa:d630:cd5d with SMTP id d9443c01a7336-2ad74549302mr83071475ad.44.1771873873989;
        Mon, 23 Feb 2026 11:11:13 -0800 (PST)
X-Received: by 2002:a17:903:2a8f:b0:2aa:d630:cd5d with SMTP id d9443c01a7336-2ad74549302mr83070975ad.44.1771873873320;
        Mon, 23 Feb 2026 11:11:13 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74e34e18sm83501505ad.10.2026.02.23.11.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 11:11:12 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 00:39:09 +0530
Subject: [PATCH RFC 15/18] accel/qda: Add FastRPC DSP process creation
 support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-qda-firstpost-v1-15-fe46a9c1a046@oss.qualcomm.com>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
In-Reply-To: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
To: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771873753; l=13841;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=rXImOerPPCRcLM/PrX4s5yCQxV6omJBtcCXYYEPRUAw=;
 b=K7TZp9Cqi+95pJ85mje+lWbGWCgDb+g/W1Zyj12HTTRexDM7MxAocuPC2VOxk30Og47ocX6mS
 FtJZjOrluUrDFYpfSmz3UrDnIo7y4y9US8jertx7oWmO6X5WLOb1d5E
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE2NiBTYWx0ZWRfX+nC7kfQFP+DY
 btQbzRF+/PmRydyAb70uOk8bCnxd4Njn6bYhiXjEHUf4W1XZHpB8niVBVswoQ8avqnZFoj82lHz
 Zk8e9qciNAX5Et540Ak7ghYLAfyB9ssfO9cZQbCDgKLMeh0TCLNSN9AgfX718R3qLG6p3OB6d11
 e6JB612W5pJhnCU1VcfZZxmtxt2tonvPJFXKp1foozEpKcRB4+IsA1XVT2qt+tFtXETTLbrf922
 N4rtd5oE0RIe4Gs/nmjUHqykw0YPa8DuaGQ5G+rhlUFqpUvxMZIWG1yU1RB4ZE5OEW0rcdaMW1i
 iEZamtaeivFgFf+j6tzi3sFGfr/49fL81u1Mp3mrNJ79k+bIFUJIJKjUKCzhbFXmQ5ReoV2/mGw
 C7UkhL4C875BL6jmKAeDrgw89XXvgvytNnp94/HU4STnKkJa9h4a9/E7mu1aipYizaOd40oKEbC
 ZSUZYQ6WB/f+yVY+rNQ==
X-Proofpoint-GUID: mTIK905cVoA1KWvDpbs9NAAqBEfZ0MIh
X-Authority-Analysis: v=2.4 cv=Z5Lh3XRA c=1 sm=1 tr=0 ts=699ca653 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=AEM1BfxD9CAojFsgHjQA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: mTIK905cVoA1KWvDpbs9NAAqBEfZ0MIh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_04,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230166
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53217-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 79B0D17C32E
X-Rspamd-Action: no action

Add support for creating a DSP process through the QDA FastRPC
interface. A new DRM_QDA_INIT_CREATE ioctl accepts a qda_init_create
structure describing the executable image, process attributes and
optional signature. The driver allocates a GEM-backed initialization
buffer, prepares a fastrpc_create_process_inbuf and a single
fastrpc_phy_page entry pointing to the initialization memory and
packages these into a set of FastRPC arguments.

The FastRPC core gains FASTRPC_RMID_INIT_CREATE and
FASTRPC_RMID_INIT_CREATE_ATTR method identifiers along with a
fastrpc_prepare_args_init_create() helper that reads the
qda_init_create parameters from user space, validates the ELF length,
optionally verifies a GEM handle for the image and fills a
FASTRPC_CREATE_PROCESS_NARGS-sized fastrpc_invoke_args array. The
scalars value is built from the FastRPC method id and buffer counts
so that the existing overlap and packing logic can treat process
creation like any other call.

On the IOCTL side qda_ioctl_create() forwards requests to
fastrpc_invoke() with the INIT_CREATE method id, ensuring that the
message buffer, per-process initialization memory and RPMsg
transport are reused for process creation in the same way as attach,
release and dynamic invocation. This patch lays the groundwork for
loading and running DSP user PDs under the QDA driver.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/accel/qda/qda_drv.c     |   1 +
 drivers/accel/qda/qda_drv.h     |   2 +
 drivers/accel/qda/qda_fastrpc.c | 109 ++++++++++++++++++++++++++++++++++++++++
 drivers/accel/qda/qda_fastrpc.h |  31 ++++++++++++
 drivers/accel/qda/qda_ioctl.c   |  28 ++++++++++-
 drivers/accel/qda/qda_ioctl.h   |  13 +++++
 include/uapi/drm/qda_accel.h    |  29 ++++++++++-
 7 files changed, 211 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
index f94f780ea50a..2b080d5d51c5 100644
--- a/drivers/accel/qda/qda_drv.c
+++ b/drivers/accel/qda/qda_drv.c
@@ -162,6 +162,7 @@ static const struct drm_ioctl_desc qda_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(QDA_GEM_CREATE, qda_ioctl_gem_create, 0),
 	DRM_IOCTL_DEF_DRV(QDA_GEM_MMAP_OFFSET, qda_ioctl_gem_mmap_offset, 0),
 	DRM_IOCTL_DEF_DRV(QDA_INIT_ATTACH, qda_ioctl_attach, 0),
+	DRM_IOCTL_DEF_DRV(QDA_INIT_CREATE, qda_ioctl_create, 0),
 	DRM_IOCTL_DEF_DRV(QDA_INVOKE, qda_ioctl_invoke, 0),
 };
 
diff --git a/drivers/accel/qda/qda_drv.h b/drivers/accel/qda/qda_drv.h
index bb1d1e82036a..950e8d44995d 100644
--- a/drivers/accel/qda/qda_drv.h
+++ b/drivers/accel/qda/qda_drv.h
@@ -48,6 +48,8 @@ struct qda_user {
 	u32 client_id;
 	/* Back-pointer to device structure */
 	struct qda_dev *qda_dev;
+	/* GEM object for PD initialization memory */
+	struct qda_gem_obj *init_mem_gem_obj;
 };
 
 /**
diff --git a/drivers/accel/qda/qda_fastrpc.c b/drivers/accel/qda/qda_fastrpc.c
index a48b255ffb1b..f03dcf7e21e4 100644
--- a/drivers/accel/qda/qda_fastrpc.c
+++ b/drivers/accel/qda/qda_fastrpc.c
@@ -487,6 +487,36 @@ int fastrpc_internal_invoke_unpack(struct fastrpc_invoke_context *ctx,
 	return err;
 }
 
+static void setup_create_process_args(struct fastrpc_invoke_args *args,
+				      struct fastrpc_create_process_inbuf *inbuf,
+				      struct qda_init_create *init,
+				      struct fastrpc_phy_page *pages)
+{
+	args[0].ptr = (u64)(uintptr_t)inbuf;
+	args[0].length = sizeof(*inbuf);
+	args[0].fd = -1;
+
+	args[1].ptr = (u64)(uintptr_t)current->comm;
+	args[1].length = inbuf->namelen;
+	args[1].fd = -1;
+
+	args[2].ptr = (u64)init->file;
+	args[2].length = inbuf->filelen;
+	args[2].fd = init->filefd;
+
+	args[3].ptr = (u64)(uintptr_t)pages;
+	args[3].length = 1 * sizeof(*pages);
+	args[3].fd = -1;
+
+	args[4].ptr = (u64)(uintptr_t)&inbuf->attrs;
+	args[4].length = sizeof(inbuf->attrs);
+	args[4].fd = -1;
+
+	args[5].ptr = (u64)(uintptr_t)&inbuf->siglen;
+	args[5].length = sizeof(inbuf->siglen);
+	args[5].fd = -1;
+}
+
 static int fastrpc_prepare_args_init_attach(struct fastrpc_invoke_context *ctx)
 {
 	struct fastrpc_invoke_args *args;
@@ -554,6 +584,80 @@ static int fastrpc_prepare_args_invoke(struct fastrpc_invoke_context *ctx, char
 	return 0;
 }
 
+static int fastrpc_prepare_args_init_create(struct fastrpc_invoke_context *ctx, char __user *argp)
+{
+	struct qda_init_create init;
+	struct fastrpc_invoke_args *args;
+	struct fastrpc_create_process_inbuf *inbuf;
+	int err;
+	u32 sc;
+	struct drm_gem_object *file_gem_obj = NULL;
+
+	args = kcalloc(FASTRPC_CREATE_PROCESS_NARGS, sizeof(*args), GFP_KERNEL);
+	if (!args)
+		return -ENOMEM;
+
+	ctx->input_pages = kcalloc(1, sizeof(*ctx->input_pages), GFP_KERNEL);
+	if (!ctx->input_pages) {
+		err = -ENOMEM;
+		goto err_free_args;
+	}
+
+	ctx->inbuf =  kcalloc(1, sizeof(*inbuf), GFP_KERNEL);
+	if (!ctx->inbuf) {
+		err = -ENOMEM;
+		goto err_free_input_pages;
+	}
+	inbuf = ctx->inbuf;
+
+	err = copy_from_user_or_kernel(&init, argp, sizeof(init));
+	if (err)
+		goto err_free_inbuf;
+
+	if (init.filelen > INIT_FILELEN_MAX) {
+		err = -EINVAL;
+		goto err_free_inbuf;
+	}
+	inbuf->client_id = ctx->client_id;
+	inbuf->namelen = strlen(current->comm) + 1;
+	inbuf->filelen = init.filelen;
+	inbuf->pageslen = 1;
+	inbuf->attrs = init.attrs;
+	inbuf->siglen = init.siglen;
+
+	setup_pages_from_gem_obj(ctx->init_mem_gem_obj, &ctx->input_pages[0]);
+
+	if (init.filelen && init.filefd) {
+		err = get_gem_obj_from_handle(ctx->file_priv, init.filefd, &file_gem_obj);
+		if (err) {
+			err = -EINVAL;
+			goto err_free_inbuf;
+		}
+		drm_gem_object_put(file_gem_obj);
+	}
+
+	setup_create_process_args(args, inbuf, &init, ctx->input_pages);
+
+	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_CREATE, 4, 0);
+	if (init.attrs)
+		sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_CREATE_ATTR, 4, 0);
+	ctx->sc = sc;
+	ctx->args = args;
+	ctx->handle = FASTRPC_INIT_HANDLE;
+
+	return 0;
+
+err_free_inbuf:
+	kfree(ctx->inbuf);
+	ctx->inbuf = NULL;
+err_free_input_pages:
+	kfree(ctx->input_pages);
+	ctx->input_pages = NULL;
+err_free_args:
+	kfree(args);
+	return err;
+}
+
 int fastrpc_prepare_args(struct fastrpc_invoke_context *ctx, char __user *argp)
 {
 	int err;
@@ -569,6 +673,11 @@ int fastrpc_prepare_args(struct fastrpc_invoke_context *ctx, char __user *argp)
 	case FASTRPC_RMID_INVOKE_DYNAMIC:
 		err = fastrpc_prepare_args_invoke(ctx, argp);
 		break;
+	case FASTRPC_RMID_INIT_CREATE:
+	case FASTRPC_RMID_INIT_CREATE_ATTR:
+		ctx->pd = USER_PD;
+		err = fastrpc_prepare_args_init_create(ctx, argp);
+		break;
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/accel/qda/qda_fastrpc.h b/drivers/accel/qda/qda_fastrpc.h
index bcadf9437a36..a8deb7efec86 100644
--- a/drivers/accel/qda/qda_fastrpc.h
+++ b/drivers/accel/qda/qda_fastrpc.h
@@ -122,6 +122,27 @@ struct fastrpc_invoke_buf {
 	u32 pgidx;
 };
 
+/**
+ * struct fastrpc_create_process_inbuf - Input buffer for process creation
+ *
+ * This structure defines the input buffer format for creating a new
+ * process on the remote DSP.
+ */
+struct fastrpc_create_process_inbuf {
+	/* Client identifier for the session */
+	int client_id;
+	/* Length of the process name string */
+	u32 namelen;
+	/* Length of the shell file */
+	u32 filelen;
+	/* Length of the pages list */
+	u32 pageslen;
+	/* Process attributes flags */
+	u32 attrs;
+	/* Length of the signature data */
+	u32 siglen;
+};
+
 /**
  * struct qda_msg - Message structure for FastRPC communication
  *
@@ -226,6 +247,8 @@ struct fastrpc_invoke_context {
 	struct qda_gem_obj *msg_gem_obj;
 	/* DRM file private data */
 	struct drm_file *file_priv;
+	/* GEM object for PD initialization memory */
+	struct qda_gem_obj *init_mem_gem_obj;
 	/* Pointer to request buffer */
 	void *req;
 	/* Pointer to response buffer */
@@ -237,6 +260,8 @@ struct fastrpc_invoke_context {
 /* Remote Method ID table - identifies initialization and control operations */
 #define FASTRPC_RMID_INIT_ATTACH	0	/* Attach to DSP session */
 #define FASTRPC_RMID_INIT_RELEASE	1	/* Release DSP session */
+#define FASTRPC_RMID_INIT_CREATE	6	/* Create DSP process */
+#define FASTRPC_RMID_INIT_CREATE_ATTR	7	/* Create DSP process with attributes */
 #define FASTRPC_RMID_INVOKE_DYNAMIC	0xFFFFFFFF	/* Dynamic method invocation */
 
 /* Common handle for initialization operations */
@@ -244,6 +269,12 @@ struct fastrpc_invoke_context {
 
 /* Protection Domain(PD) ids */
 #define ROOT_PD		(0)
+#define USER_PD		(1)
+
+/* Number of arguments for process creation */
+#define FASTRPC_CREATE_PROCESS_NARGS	6
+/* Maximum initialization file size (4MB) */
+#define INIT_FILELEN_MAX		(4 * 1024 * 1024)
 
 /**
  * fastrpc_context_free - Free an invocation context
diff --git a/drivers/accel/qda/qda_ioctl.c b/drivers/accel/qda/qda_ioctl.c
index e90aceabd30d..477112ad6664 100644
--- a/drivers/accel/qda/qda_ioctl.c
+++ b/drivers/accel/qda/qda_ioctl.c
@@ -122,7 +122,7 @@ static int fastrpc_invoke(int type, struct drm_device *dev, void *data,
 	struct fastrpc_invoke_context *ctx;
 	struct drm_gem_object *gem_obj;
 	int err;
-	size_t hdr_size;
+	size_t hdr_size, initmem_size = 4 * 1024 * 1024;
 
 	err = qda_validate_and_get_context(dev, file_priv, &qdev, &qda_user);
 	if (err)
@@ -142,6 +142,22 @@ static int fastrpc_invoke(int type, struct drm_device *dev, void *data,
 	ctx->file_priv = file_priv;
 	ctx->client_id = qda_user->client_id;
 
+	if (type == FASTRPC_RMID_INIT_CREATE) {
+		struct drm_gem_object *gem_obj;
+
+		gem_obj = qda_gem_create_object(qdev->drm_dev, qdev->drm_priv->iommu_mgr,
+						initmem_size, file_priv);
+		if (IS_ERR(gem_obj)) {
+			err = PTR_ERR(gem_obj);
+			goto err_context_free;
+		}
+
+		ctx->init_mem_gem_obj = to_qda_gem_obj(gem_obj);
+		qda_user->init_mem_gem_obj = ctx->init_mem_gem_obj;
+	} else if (type == FASTRPC_RMID_INIT_RELEASE) {
+		ctx->init_mem_gem_obj = qda_user->init_mem_gem_obj;
+	}
+
 	err = fastrpc_prepare_args(ctx, (char __user *)data);
 	if (err)
 		goto err_context_free;
@@ -177,6 +193,11 @@ static int fastrpc_invoke(int type, struct drm_device *dev, void *data,
 		goto err_context_free;
 
 err_context_free:
+	if (type == FASTRPC_RMID_INIT_RELEASE && qda_user->init_mem_gem_obj) {
+		drm_gem_object_put(&qda_user->init_mem_gem_obj->base);
+		qda_user->init_mem_gem_obj = NULL;
+	}
+
 	fastrpc_context_put_id(ctx, qdev);
 	kref_put(&ctx->refcount, fastrpc_context_free);
 
@@ -197,3 +218,8 @@ int qda_ioctl_invoke(struct drm_device *dev, void *data, struct drm_file *file_p
 {
 	return fastrpc_invoke(FASTRPC_RMID_INVOKE_DYNAMIC, dev, data, file_priv);
 }
+
+int qda_ioctl_create(struct drm_device *dev, void *data, struct drm_file *file_priv)
+{
+	return fastrpc_invoke(FASTRPC_RMID_INIT_CREATE, dev, data, file_priv);
+}
diff --git a/drivers/accel/qda/qda_ioctl.h b/drivers/accel/qda/qda_ioctl.h
index e186c5183171..181ed50b19dc 100644
--- a/drivers/accel/qda/qda_ioctl.h
+++ b/drivers/accel/qda/qda_ioctl.h
@@ -76,4 +76,17 @@ int fastrpc_release_current_dsp_process(struct qda_dev *qdev, struct drm_file *f
  */
 int qda_ioctl_invoke(struct drm_device *dev, void *data, struct drm_file *file_priv);
 
+/**
+ * qda_ioctl_create - Create a DSP process
+ * @dev: DRM device structure
+ * @data: User-space data containing process creation parameters
+ * @file_priv: DRM file private data
+ *
+ * This IOCTL handler creates a new process on the DSP, loading the
+ * specified executable and initializing its runtime environment.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int qda_ioctl_create(struct drm_device *dev, void *data, struct drm_file *file_priv);
+
 #endif /* _QDA_IOCTL_H */
diff --git a/include/uapi/drm/qda_accel.h b/include/uapi/drm/qda_accel.h
index 01072a9d0a91..2b7f500db52c 100644
--- a/include/uapi/drm/qda_accel.h
+++ b/include/uapi/drm/qda_accel.h
@@ -22,7 +22,8 @@ extern "C" {
 #define DRM_QDA_GEM_CREATE		0x01
 #define DRM_QDA_GEM_MMAP_OFFSET	0x02
 #define DRM_QDA_INIT_ATTACH		0x03
-/* Indexes 0x04 to 0x06 are reserved for other requests */
+#define DRM_QDA_INIT_CREATE		0x04
+/* Indexes 0x05-0x06 are reserved for other requests */
 #define DRM_QDA_INVOKE			0x07
 
 /*
@@ -38,6 +39,8 @@ extern "C" {
 #define DRM_IOCTL_QDA_GEM_MMAP_OFFSET	DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_GEM_MMAP_OFFSET, \
 						 struct drm_qda_gem_mmap_offset)
 #define DRM_IOCTL_QDA_INIT_ATTACH	DRM_IO(DRM_COMMAND_BASE + DRM_QDA_INIT_ATTACH)
+#define DRM_IOCTL_QDA_INIT_CREATE	DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_INIT_CREATE, \
+						 struct qda_init_create)
 #define DRM_IOCTL_QDA_INVOKE		DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_INVOKE, \
 						 struct qda_invoke_args)
 
@@ -116,6 +119,30 @@ struct qda_invoke_args {
 	__u64 args;
 };
 
+/**
+ * struct qda_init_create - Accelerator process initialization parameters
+ * @filelen: Length of the ELF file in bytes
+ * @filefd: File descriptor containing the ELF file
+ * @attrs: Process attributes flags
+ * @siglen: Length of signature data in bytes
+ * @file: Pointer to ELF file data if not using filefd
+ *
+ * This structure is used with DRM_IOCTL_QDA_INIT_CREATE to initialize
+ * a new process on the accelerator. The process code is provided either
+ * via a file descriptor (filefd, typically a GEM object) or a direct
+ * pointer (file). Set file to 0 if using filefd.
+ *
+ * The attrs field contains bit flags for debug mode, privileged execution,
+ * and other process attributes.
+ */
+struct qda_init_create {
+	__u32 filelen;
+	__s32 filefd;
+	__u32 attrs;
+	__u32 siglen;
+	__u64 file;
+};
+
 #if defined(__cplusplus)
 }
 #endif

-- 
2.34.1


