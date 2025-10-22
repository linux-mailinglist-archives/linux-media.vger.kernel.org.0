Return-Path: <linux-media+bounces-45178-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7D3BF9D2D
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 05:25:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9570F4EB9E3
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 03:25:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E3F6272810;
	Wed, 22 Oct 2025 03:25:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84D7271458;
	Wed, 22 Oct 2025 03:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761103506; cv=none; b=DJnvTcZBrdzdk+7oPIulEm/urpw7e8adgpxf36h2nSwrtbdMR14seJY0p3w9gxtRizVINgqHuYIUXZmOdefznwsJeO4fssagSX/tu12gac7dJUQboaiXJlSVvnZN2H9IblYpxTm0a6Yk/6evwIOpW6PTnIs5iJ8yezjWajDLJ8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761103506; c=relaxed/simple;
	bh=nq1BmCZzwaI9iWfYthh/XYVEhOkI38BNR+gxJIGpmlk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nojR+yZIetHy96vCWaxiE3e6Z6yZvshYZ6gpodZvIXQjgWKax7ji1uuhH7EIc/hYU3uXzzcCdu8LGo7RNXe5nRGHCeqqidhjmz1YSJot45DmBkRNCoYWB9aPeeabVC5SY/Y0mLM9kO0G6k8+DT4q+UAUHS0TyYIe4I1UQt+xHm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: af66b34eaef611f0a38c85956e01ac42-20251022
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:f19686ca-8295-4d86-acf9-8f41c45aa5bc,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:a9d874c,CLOUDID:8386071e5ffd10f2470400b41dcad4d5,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|52,EDM:
	-3,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: af66b34eaef611f0a38c85956e01ac42-20251022
X-User: tanze@kylinos.cn
Received: from [10.42.20.57] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <tanze@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 480093162; Wed, 22 Oct 2025 11:24:57 +0800
Message-ID: <5d9f8a49-1188-40db-9c1b-be0e71ea7d60@kylinos.cn>
Date: Wed, 22 Oct 2025 11:24:55 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] media: Optimize the code using vmalloc_array
To: mchehab@kernel.org, mingo@kernel.org, hverkuil@kernel.org,
 tskd08@gmail.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251021143122.268730-1-tanze@kylinos.cn>
Content-Language: en-US
From: tanze <tanze@kylinos.cn>
In-Reply-To: <20251021143122.268730-1-tanze@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi, dear maintainer

These patches have had their v2 versions sent because the CI robot 
detected some issues.

https://lore.kernel.org/all/20251022032038.422230-1-tanze@kylinos.cn/


在 2025/10/21 22:31, tanze 写道:
> Change array_size() to vmalloc_array(), Due to vmalloc_array() is optimized better,
> uses fewer instructions, and handles overflow more concisely
> 
> 
> tanze (3):
>    media: dvb-core: Optimize the code using vmalloc_array
>    media: vivid: Optimize the code using vmalloc_array
>    media: pt1: Optimize the code using vmalloc_array
> 
>   drivers/media/dvb-core/dmxdev.c               | 4 ++--
>   drivers/media/dvb-core/dvb_demux.c            | 9 +++++----
>   drivers/media/pci/pt1/pt1.c                   | 2 +-
>   drivers/media/test-drivers/vivid/vivid-core.c | 2 +-
>   4 files changed, 9 insertions(+), 8 deletions(-)
> 

-- 
--
Thanks,
Ze Tan

