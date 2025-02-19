Return-Path: <linux-media+bounces-26394-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BD5A3C260
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 15:41:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 459DD1889621
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 14:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79E331F30B2;
	Wed, 19 Feb 2025 14:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dcP0jsSS"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0CE1E0E08;
	Wed, 19 Feb 2025 14:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739976090; cv=none; b=bW9h6WQP96ngc//OUFMPqchao3HClK6+ZEPldv1P8dAyegfcvjXi4OKUoh39wLiacnQeGaStmoto8/ZwZ5f+rkBTzvO+ie3L2yUAVvsilgcS/0N1VJ5pyM3MpdX3K7TvW4r7TqsuoDNHkd6AOcUrr1JfuVTH7HbqWNTCCaZrIw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739976090; c=relaxed/simple;
	bh=hGnFkAcDdQ1C1uvVGW2O6736dR+lsZE6iUo/uls6odc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RD+LBW6l/QHqmD3+j2WazCK78iQLwI1dZt+EPSHwjngDzzgsiMzbBhBjv1IEAoDiTwvqpRH08exf1eCyDfmhthb3nOjnfupYY4IQjEqYfFggKVmaTkTPunS+drkU61w62kYil1g7Ir1SdbysC4XWZEmIWNn+TMaydqOwc+zoFzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dcP0jsSS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 83011514;
	Wed, 19 Feb 2025 15:40:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739976005;
	bh=hGnFkAcDdQ1C1uvVGW2O6736dR+lsZE6iUo/uls6odc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dcP0jsSSh72MFRbsGSEJpwoLkerWarBH0KO35HOodXj+pXb3vOKOctT5kVQcX5A6n
	 wmNCUGB6OsNOHLwJSjuIGu+opvpt9Yn3ecFenE2M53Mpm7VIYl3ugKU80GyZzbUOJy
	 UqyO3qdtgvRxjSxCRRpQdlSpkV9ppboAgau8M6aA=
Message-ID: <f3795f3b-8d38-40cd-abcc-723b18d6dc70@ideasonboard.com>
Date: Wed, 19 Feb 2025 16:41:24 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/18] media: rcar: Streams support
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
References: <20250219-rcar-streams-v1-0-f1b93e370aab@ideasonboard.com>
 <20250219142256.GA512344@ragnatech.se>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <20250219142256.GA512344@ragnatech.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 19/02/2025 16:22, Niklas Söderlund wrote:
> Hi Tomi,
> 
> I'm happy to see this, nice work.
> 
> Unfortunately it does not apply to the media-tree. As this series is a

It should, if you apply the dependencies first. But one of the 
dependencies from you is a bit old and that doesn't apply without some 
conflicts resolved. So... Yes, doesn't apply =).

> mix of fixes and new features as well as covering multiple drivers. Do
> you think it would make sens to break out the fixes per driver which we
> could review and apply ASAP and the new features which we can review but
> need to wait until the dependencies are meet?

Yes. I think that's the RAW8 and RAW10 fixes. However, I can't test them 
without streams and GMSL2, so...

> If the new features depends on stuff that is hard to upport, maybe just
> focus on the fixes to get them out of the way?
> 
> On 2025-02-19 15:48:54 +0200, Tomi Valkeinen wrote:
>> Add streams support to Renesas rcar platform driver.
>>
>> The series attempts to keep compatibility with the current upstream.
>> However, in upstream there's some kind of custom multi-stream support
>> implemented to the rcar driver, which breaks at patch "media: rcar-csi2:
>> Simplify rcsi2_calc_mbps()".
> 
> I would not worry about breaking the make shift multi-stream, it was
> based on our first attempt to allow streams for GMSL many years ago and
> it was bonkers ;-) As long as it don't break a single streams, even from
> subdevs that do not themself support streams I'm happy.

Alright. Then you're happy with this series. I hope =). I don't have 
anything to test this with, and only the v4h board.

  Tomi


