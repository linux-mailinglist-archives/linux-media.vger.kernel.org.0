Return-Path: <linux-media+bounces-12078-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 398FE8D1891
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 12:27:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1F68281D20
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 10:27:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C38AD16B73D;
	Tue, 28 May 2024 10:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="qo0ABDpD"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA57A161314;
	Tue, 28 May 2024 10:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716892021; cv=none; b=uLZpZnlUj1RKx1hJP7BrW1RJgEEXRZ60udykJQsRtDLnVpKHwwug3gn6gQI9KSYRN8fVoBDh/eDycx52vMBrevGMDpKRNgw+6GJsa7gpAjGOp+pGAG5z91q5E48nDiTHO8yMzARcO1rHvpCnkzNZ8Rm9rPkHQu+BlIIlIizIUDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716892021; c=relaxed/simple;
	bh=ShbB0egsqc+viF42q6rsRBuCb+8DgZ4kwsWT9hgU0u8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NRuqkaqr36ZiQJ81r5aqPORTMbHb1PDRoPRmwF8u2Vd2UBcIz91B4jvOJoUbuH/LYiVo8hHX9riN8BbpsuK1qH0NW2XP9KblSQXmbzj1ybZg/baqffglImG1pATip/5xzX9XqBV011Nm8do5oQkBB0sEE9OGGEXMiDTATkCICVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=qo0ABDpD; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716892018;
	bh=ShbB0egsqc+viF42q6rsRBuCb+8DgZ4kwsWT9hgU0u8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qo0ABDpDeGyeb5AM6CvxMAHNti9En+O5JJ7JH2bf5Kz7yu4heP+HUSyNzNLBu9l4v
	 r6G+r6Xjl5Q34vGGu+TXIib93qalmPg7v5r7lyS330vgVmLB7adu2KP8H+lX7rrfIu
	 zJzxuXF37jfduvnRfRK/e8nQU1J25bdFgPMWSPOB7M3qUfMJFNBYvZoUeVe2eDL7OI
	 IhiyY4tRqs1ePuvCQhmrTEcAjzVzMjtN3LeaZzlImY/eHCHvRfjLs4jdpNhm0HiC1L
	 MeJYVO6vs3cdX8W6jVn4un+D6X7h+XF5EW/FG6J2SfjzNJDaYpsv4bglD9wNkfq/7P
	 tdkzEA4zshBBg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D4030378215E;
	Tue, 28 May 2024 10:26:56 +0000 (UTC)
Message-ID: <430cf0a6-4d8c-4819-8a95-d436eb044eec@collabora.com>
Date: Tue, 28 May 2024 12:26:56 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: mailbox: Add mediatek,gce-props.yaml
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 =?UTF-8?B?Sm9obnNvbiBXYW5nICjnjovogZbpkasp?= <Johnson.Wang@mediatek.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?=
 <Jason-ch.Chen@mediatek.com>, =?UTF-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?=
 <Shawn.Sung@mediatek.com>, =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?=
 <Nancy.Lin@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "fshao@chromium.org" <fshao@chromium.org>
References: <20240124011459.12204-1-jason-jh.lin@mediatek.com>
 <20240124011459.12204-2-jason-jh.lin@mediatek.com>
 <f91d3ac1-0a7d-4ca2-bf0f-c5e471c2f6bb@collabora.com>
 <2a2a939c9cb56de0383ec3e42db9bcf8e8518775.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <2a2a939c9cb56de0383ec3e42db9bcf8e8518775.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 26/05/24 17:04, Jason-JH Lin (林睿祥) ha scritto:
> Hi Angelo, Jassi,
> 
> Could you help me apply this series?
> Thanks!
> 

That's not me, it's Jassi - green light from me, btw.

Cheers,
Angelo

> Regards,
> Jason-JH.Lin
> 
> On Wed, 2024-01-24 at 09:57 +0100, AngeloGioacchino Del Regno wrote:
>> Il 24/01/24 02:14, Jason-JH.Lin ha scritto:
>>> Add mediatek,gce-props.yaml for common GCE properties that is used
>>> for
>>> both mailbox providers and consumers. We place the common property
>>> "mediatek,gce-events" in this binding currently.
>>>
>>> The property "mediatek,gce-events" is used for GCE event ID
>>> corresponding
>>> to a hardware event signal sent by the hardware or a software
>>> driver.
>>> If the mailbox providers or consumers want to manipulate the value
>>> of
>>> the event ID, they need to know the specific event ID.
>>>
>>> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
>>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>>
>> Reviewed-by: AngeloGioacchino Del Regno <
>> angelogioacchino.delregno@collabora.com>
>>
> 



