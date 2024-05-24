Return-Path: <linux-media+bounces-11845-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFF18CE418
	for <lists+linux-media@lfdr.de>; Fri, 24 May 2024 12:20:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E70D81F219D2
	for <lists+linux-media@lfdr.de>; Fri, 24 May 2024 10:20:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45D3385923;
	Fri, 24 May 2024 10:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="cw8aNbpS"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DA084DF5;
	Fri, 24 May 2024 10:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716545995; cv=none; b=s791TX6wjY+eu6jP1YmFIotzKpa5yhaDgQTZJUZ69bzfosWsnnz/Ge+I3Z9eRFuTfMUSlEzAP6ZuPBlKprTyJcoEhYjIDQFKeffqYOkBFnGa8NIRK8RLYGPMP9BVUyWdYCWfoexuWbarCZr1LF6vdHQ1G9bmgMuZ+E51wuzMDbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716545995; c=relaxed/simple;
	bh=xogr3RUT5pzYVnILbdgACmxQE4iSUwVxOwG2X9qy3e0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=khyrsewqGeq2G5+1CTxFm4ceg4onrrOH457zPxhPjxCXQEChNmnb0NDDeDFxrrw8TuL1FGC4Gc4aONoP8/OIkqnkqBl1unR+uSPOPnowdIPzwOf17cZ2I4K3FaQDeIdT4jooIcbSALqbFKpBSail5LulSKChZpSBBKxTGxBDoko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=cw8aNbpS; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716545992;
	bh=xogr3RUT5pzYVnILbdgACmxQE4iSUwVxOwG2X9qy3e0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cw8aNbpS3yzzhrPNx/eS2Wi8OogmPe6Bf9v9QKMUDq6p1hRI6DRXrb5X/NvZvURQF
	 WthEvGGU6J6lYxCTzh+P/+3VZARbiTaHzNN2SUFFGTG9UTvsV6/L10tJo4rkZf4wkW
	 TQTRcSGdxQJcodBSm3ZUc/rN5dBTEq31yT5ookllvQ+1YFdolvJgiTQTw0j7/EiHI9
	 cFMcCyW7CkwX1otEX218wF1VUzCYLl8SH5tygHAZ8FLqlfBKsdOqfxt2CSCcZkwPTB
	 CmpQxZBUV5iJvNm54DsQrZWWkWVYHvMXTKOkdMPiA5ZV71lBmlBxMszhCC1KXZzAV3
	 P7mWvg2rVmtUg==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E396C3782169;
	Fri, 24 May 2024 10:19:51 +0000 (UTC)
Date: Fri, 24 May 2024 12:19:50 +0200
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Ivan Bornyakov <brnkv.i1@gmail.com>
Cc: Nas Chung <nas.chung@chipsnmedia.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/5] Wave515 decoder IP support
Message-ID: <20240524101950.zhzenp3ilarwv5oc@basti-XPS-13-9310>
References: <20240415100726.19911-1-brnkv.i1@gmail.com>
 <mwgydgjstvedkatdvopt3wh4imhnzflr7ut3vejgl6fz3vbgzg@x4spldwklrm3>
 <20240503150721.qd6d7csev5452rss@basti-XPS-13-9310>
 <bliiovkmzwkd5ikvvhvuokiacdclinb5rx4fxbtufwqnvqypgw@uygv56l7a45c>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <bliiovkmzwkd5ikvvhvuokiacdclinb5rx4fxbtufwqnvqypgw@uygv56l7a45c>

Hey Ivan,

On 24.05.2024 12:09, Ivan Bornyakov wrote:
>Greetings,
>
>On Fri, May 03, 2024 at 05:07:21PM GMT, Sebastian Fricke wrote:
>> Hey Ivan,
>>
>> On 02.05.2024 09:40, Ivan Bornyakov wrote:
>> >
>> > Friendly ping.
>>
>> Sorry again for the delay, I was nearly finished with the patch set last
>> week but the time wasn't sufficient. And I sadly have to delay it again
>> a bit as I am on vacation until 13.05. I expect finishing it probably
>> until 17.05.
>>
>> Regards,
>> Sebastian
>
>Do you still intend to review the patch series?

Yes, sadly maintainer work isn't the highest priority work at my job
however.

>
>Also should I resend? Is there anything I can do to budge the process?

Nope no action required from your side, just my busy schedule that keeps
me from doing the work. If you want to you can help me get through my
shelf quicker however by for example reviewing:
https://patchwork.linuxtv.org/project/linux-media/list/?series=12848

Regards,
Sebastian

