Return-Path: <linux-media+bounces-47638-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7651EC7EDF6
	for <lists+linux-media@lfdr.de>; Mon, 24 Nov 2025 04:08:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E5E583448CE
	for <lists+linux-media@lfdr.de>; Mon, 24 Nov 2025 03:08:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33B152882D6;
	Mon, 24 Nov 2025 03:08:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A692AE99;
	Mon, 24 Nov 2025 03:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763953689; cv=none; b=myyt2zSWHvU8974z2cCe+avtBUOtNrbCOVzQBrChLneMmpmaPKf9K6bWabXZEVZDOkxUJPHPybBRB86M9+uyaKZwu24MJGE6pi1jFtirSeFg+jQoV2w87WCim7jjGdgrJFCFwwHjqf2KuAgul5HF55x1REPQnIcQl3wQFqESxSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763953689; c=relaxed/simple;
	bh=WBJBraH7ij9f0E8GbN1wQmQwBY1CtOewIEqOf2BhQm8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d6p0m6H4i3dzjKbtbimy2sw8t5XdgHKP/Easr6e/H4D/A7tk+ViKKnfIMC/rI3+i9p2bzMQVDL6ifp/2lxzFGMr7N9EeaRJKnMi81jvY+2DMqdpDW5MVT/MccFiFD0r0IhQEXvYWthJLO5/n0RwVOjLodiNVKCJatQI0lPubkjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: c1818594c8e211f0a38c85956e01ac42-20251124
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:d257366e-b160-43ca-a251-d85b8d18a924,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:8c217c8d7ce7a578902d021e2b06887c,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|898,TC:nil,Content:0|15|
	52,EDM:-3,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c1818594c8e211f0a38c85956e01ac42-20251124
X-User: dengjie03@kylinos.cn
Received: from [10.42.12.246] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <dengjie03@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 83680748; Mon, 24 Nov 2025 11:07:48 +0800
Message-ID: <65a0e74c-a9ee-4237-b8c9-9863e4de64b5@kylinos.cn>
Date: Mon, 24 Nov 2025 11:07:45 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: usb: uvc: Fix NULL pointer dereference during
 USB device hot-unplug
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: laurent.pinchart@ideasonboard.com, hansg@kernel.org, mchehab@kernel.org,
 kieran.bingham@ideasonboard.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251122072558.2604753-1-dengjie03@kylinos.cn>
 <CANiDSCuJZU9di2T_zQbk7NVr0--JyPUZkXGur11HKZF8qe3N2Q@mail.gmail.com>
From: Jie Deng <dengjie03@kylinos.cn>
In-Reply-To: <CANiDSCuJZU9di2T_zQbk7NVr0--JyPUZkXGur11HKZF8qe3N2Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Ricardo

Thank you for your reply

在 2025/11/22 16:17, Ricardo Ribalda 写道:
> Hi Jie
>
> On Sat, 22 Nov 2025 at 08:26, Jie Deng <dengjie03@kylinos.cn> wrote:
>> Add safety checks to prevent kernel panic during the race window in
>> USB device disconnection.
> Can you share the kernel version that you are using?
The kernel version I'm using is 5.4.18
>
> This patch
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c93d73c9c2cfa7658f7100d201a47c4856746222
> Should prevent the race that you are describing.
>
>
> In your trace you have a reference to uvc_queue_streamoff that was
> deleted by that patch

This patch may indeed eliminate the problem I described.

The 5.4 longterm version should not have synchronized this patch？


Thanks,

Jie Deng


