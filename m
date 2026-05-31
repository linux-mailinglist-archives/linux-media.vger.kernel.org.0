Return-Path: <linux-media+bounces-63172-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBtPER78G2rFIAkAu9opvQ
	(envelope-from <linux-media+bounces-63172-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 11:15:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2FD6154A6
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 11:15:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BA992301FD49
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 09:14:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DCA534E744;
	Sun, 31 May 2026 09:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WNowJXA2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G3jFsHU+"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CCA34B1A6
	for <linux-media@vger.kernel.org>; Sun, 31 May 2026 09:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780218837; cv=pass; b=DepPYvgwh6bPT2nJIaaY6V5Rsf15EtAEiuVlA9UWLmI7yCwTqGQTaAtZxQxaqtR2Y6tUpA94hvHwHIxT6vT2Yw85/pDWFcvyf720DT4j+p72/45bjpfP2/eRm3c5I3MjInRk8sTBFryRPaJ03BZAwLqMD8e3lN91+JIF3PeCWhY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780218837; c=relaxed/simple;
	bh=D/t0/JnpQnieh5hAxihMMEGdpsjYAAym84N7UtIRqrE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=chQCRrUCSU8knpeh++U+4TLUErYnVVCT8rp5BKUSI0SxwgjTqkhDewUFFEhKxVpsDzd7OOpRF23WZ+7qTiNR7/pnhSA8LAmuLp/G794LghjRwbNVX6oDqrLZWFrJflvNekv56fMEMp9GLxZj1X23PfS2lcoSiqKKba3TOkFFUts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WNowJXA2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G3jFsHU+; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64ULZEw91121970
	for <linux-media@vger.kernel.org>; Sun, 31 May 2026 09:13:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=0ifcRa4jj7zzfL7l3AVKDnNRQYNpXqrhNYrAKB9AqAA=; b=WN
	owJXA2PzjbU+SpUOIwwpkJE4M76DLw9EyRPb2cBXDMaIWJeoOMk6BpYRYJxWrDbj
	34H2aBhiWrKP26ziMSoM8t/SfPNNN0/sw4M8IATqHyPtR5Atd6PX+6Op+ew9QVKR
	ZlN6QRvEiiGfvUJD+5RKj3G6nFbqAPhD3QF7ackD/OtOcMgR+nJSRyqlbLk7uy6V
	2f2m93SMoSOhjNJxfTTZMZP83yNbYU0loQb4cHHd5dXXCCrFwKbJ4eELr+hNLWA6
	hRV/p6DvbMVAQc9FMmEciY4JZHLnD7iiWfXJavDSo5TWxeHzz7rl/uXZFpTjkPBk
	RZ+78Wqf6+swA4ZDWT/A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efux52rg3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 31 May 2026 09:13:55 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8423f544944so268497b3a.3
        for <linux-media@vger.kernel.org>; Sun, 31 May 2026 02:13:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780218835; cv=none;
        d=google.com; s=arc-20240605;
        b=iUEnqILio2k20B49Nmp5J8nQLEGn7UX08VUYbREu6jFQ3/wzhNUs1JtxM5tFoRzcLL
         1MLwdXqbNhpSA0Yebpvlyw02VzAkMsG0/955x4ZyMJ+VyFbzLbtdnPQCX07PJyu2yGet
         hV1RDjLXew//5b6AEbnxx9RS/nBECilgZ1FZaTbFUYpDi9/d/jqVMmBj8fI1dgcoE0Mp
         /yin+5jwWdGHhB67NSH6m7jPsHeFuvzUsxmWWjErqZ1XIXcHoFMDbkLxJ9NOpCbOeDiS
         6pJKIDAbH2WYzOvMUq5xDRy7w5Y6K/e9v4aS2Ds1BbErleUNCaikyaU7euwBrjdj9nEB
         cTuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=0ifcRa4jj7zzfL7l3AVKDnNRQYNpXqrhNYrAKB9AqAA=;
        fh=/8d1H00VOcfWi30U35LwnUKT/SXca9Pyt4pkXzT8Xo4=;
        b=S3MKS9fLGUDM2b6XTJB9LMEMQKYBduCahT3L0vODjqeUvgfTTFRhhgi+Tfh0iLDqlY
         TL1H7NmxmkbMk4IooiLzbxrD4cGDgi1oMLC/E+lXOwzsqlO7RMjHPJMK7InZiIP3G6X1
         vao5IUKtUHth5y7X3BS215hHhmRl4ZhrJpIYnWU+ywsXCR0O4V2pFSjvwj6P6MubbS6w
         A1s3WgIceKFpfP9bIwyjOMoemDa9MTB9QWDPNeVaax+IORRhou5xNBFl+K08vuWb4HMs
         m/boYeXovxIIeLJAZtZrpVFSsYcIuCN8nhXD+AZaPvCLTtjZ/duqc2ZU0qOWAHsTiHGn
         Bw1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780218835; x=1780823635; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0ifcRa4jj7zzfL7l3AVKDnNRQYNpXqrhNYrAKB9AqAA=;
        b=G3jFsHU+OGvrfWKKF26anZbffGeUv9/8hT/5dSiXDAz3W4I/6G6jJ6Nnz2Xcm3FmHZ
         84iv7mSKOmKP+4Gt+kh/v61wo8mN5qyvlpnPFrL13GxG3tXRWrWbtxlxrVmKH8zmsq6Y
         GRCWKPPKEfpKHmy8q8V8B08WxHo4TvBfwkRlC9D3Ru9DcUdpcwHdTGZYD87y2mZtQ0nb
         Moqe5Eojjfj7DEsm71bEpC4Rs9YsXBoPIDqTgwGqRDkI4NMQNcbkia810Z66LaunCzfe
         DtXLAButW+s5XUsF+qkYjyUOJ3Hb81co/Srd3w0Q1efSEO7MydSrs6DyxWarTtQuMpT0
         CSEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780218835; x=1780823635;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0ifcRa4jj7zzfL7l3AVKDnNRQYNpXqrhNYrAKB9AqAA=;
        b=btj7VJCnGCoNmmm3b79zMvToVfrsq7btq00u4WlP7jSPDlmOseWu+AHJcbSngaw+OZ
         efTdZEnDF34jV+SEIaFJhrGdO2fvrPvAYnPtiVfxw2+eIsZVV7fWf8+6CiLC9py5MUu7
         IMBxqD+SZ4w9pa4jGM7Kz20jMzlQxYeRP7R2DjtweKW5yFtD6kzsTpZ5mW6+zeWBIghM
         L1IYk3gD6ri8XiDN5y9EjovIeQcK3mVEp8GtoZ5ZK7b2xHP6QduuUzheQTutWcCtc23h
         4BZnxLv9Ozyhz5VLiY1wvcWJ9tT+coK56HbO8B8KIGaZ6kQAHYc5Tvua1Z+1ZIM1DnBy
         7Eyg==
X-Gm-Message-State: AOJu0Yx2/+lLSG2UQkXYlbAU3IJZAib3j92YB+kLNewHh1z4x04qsL5y
	Gb61Z6cVgUPeRuZohu6ogJC+oOLF7aPNBeaqnIhPgHwivzYofCB0MnAMCVWoa6stRV4fTm33Saq
	Nns623XyoKdoyGhwzpIiCdDV3xKwm03HbSDW72BO4Dk9urSoYwjx0DPEpGg2T9vBNjWNqvYdvla
	3qb6QASx/zBliO877KUvJoHCRHT+pNGnB49jXVsu3uojbwB6XPvH0=
X-Gm-Gg: Acq92OEKhAx3t1jcNcp4bbDHKIkU6DLevslLZkBfeqfyeIWh8VXMLbOxA3xww8K1eRq
	hKjppqEWzhRDc9+RdVtSrcnswX+y42s+nDf/5y8ggT82RWAFI9j83/Y0oT+pYBGvhCH4J1qSgUn
	gFHZSvdmG0CTqlW8nRXLtuV5UvA+FyYSOB1gIBOJaAkTet6/ighsTYVweXNS+hpm5E1drAmIVAf
	/0d3zZZKEfzz0FE
X-Received: by 2002:a05:6a00:1815:b0:842:4b4c:8a85 with SMTP id d2e1a72fcca58-8424b4c8d1dmr444469b3a.45.1780218835152;
        Sun, 31 May 2026 02:13:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:1815:b0:842:4b4c:8a85 with SMTP id
 d2e1a72fcca58-8424b4c8d1dmr444443b3a.45.1780218834608; Sun, 31 May 2026
 02:13:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 31 May 2026 11:13:41 +0200
X-Gm-Features: AVHnY4K6MoUAkY9jNgg-IFErI7xo9FhUrYxRGrlP0I_TXHg2v1xuOafe7sXvARI
Message-ID: <CAO9ioeW5mv9bQjKbd3KOx6V4GB2xKgmDcLrbLowc=j0agwWMag@mail.gmail.com>
Subject: media-comitters next vs fixes trees
To: linux-media@vger.kernel.org, media-committers@linuxtv.org
Cc: "Bryan O'Donoghue" <bod@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: oA_VkD_eJU7MPI-qHj3QEDYE1A44GGdY
X-Proofpoint-ORIG-GUID: oA_VkD_eJU7MPI-qHj3QEDYE1A44GGdY
X-Authority-Analysis: v=2.4 cv=BdnoFLt2 c=1 sm=1 tr=0 ts=6a1bfbd3 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=YLSM4YbRGjaWMt0YXTQA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMxMDEwMSBTYWx0ZWRfXzqrnnsbRzWNB
 pVcRdwWBjm9ANkr6agSmMODM8OwAwc41Kru0YZWk9j6xhp6JM/QZnj1sdQPzmAfXYLcUZN8qaaQ
 F7Eh9yXvGowbL6hM8huIiFKwXu+atrUBfRssRXu21fx1hIMdueUTInhqIdxDCqfU+Q9QeWjiV44
 +YUWD/LUpqJJj11FJmBbvji+OL8rM9nfUuf2IFQfBWR2eWSPVosY0GcqKV22xOSlokOXtCNDJ5B
 H8Iy0rbdQkPgrdMVhJdAjQgFJfxiuYRqPAx/E/WC+tkal7DuY2lhJZQvebdkZH5vG699JUouSci
 7JirpTx29JQDmV6lMPvbD93ozKoPpEozNGhGPnRy/Ubre3N6XWZSrm9oAEO8X3xxGAlhbeXDLxs
 wZ0LbFJjtnwwIflz6zjm7MuIKCzWe2trTrqDQSARt+Nf7GMd6ZPvQTZfNNa0/oq4wjDO3/I6n89
 pPKZfvbrRg8MwlGyc/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-31_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605310101
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-63172-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: AF2FD6154A6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

Is there any current rule or plan about submerging the fixes branch of
media-comitters to the enxt branch? For example, I have several
patchsets which apply perfectly to the linux-next, but fail to apply
(and function correctly) on top of media-comitters/next because it
depends on the commits which are only a part of -fixes.

-- 
With best wishes
Dmitry

