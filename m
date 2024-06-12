Return-Path: <linux-media+bounces-12993-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 84093904BD5
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 08:47:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2A1BCB22216
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 06:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1CC416B737;
	Wed, 12 Jun 2024 06:46:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7933A13B5A6
	for <linux-media@vger.kernel.org>; Wed, 12 Jun 2024 06:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718174814; cv=none; b=gzOWHQQ9qS6A6y9lwWAjzMryNtdbakPV23Zt5nwGMbP2UMho4IJu1VX9LCKlwpD1ZeCVNZ2At3LwaNGDDUTmf79gbq6GixUJalDgmDup0h4aAbQexHY9X42XHPIkW5kqWdySyKBdWg/3FqF/OCWl52EGodTgUlk2tCuFp2ADkoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718174814; c=relaxed/simple;
	bh=Vj/QtnkqKUAWqFlZz7J6nV6TvzsbFZeBenfemnh+PSA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dKihaiGNDaOSKCG2csgdF5aX6zEZWUw2aLuUN8TKUtUuG2+7C8tCG+Hm9tQqy6TSBItBud+1BeaAGjhQ6VP0ZUHZXVR02wX5gokCTjDXUe4/bQgmPIz6amviO4SU5exSmFDRPhQeBpEiWHDHTAN7YQitKkkhggsPQCCJ5tjC3uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 052BFC32786;
	Wed, 12 Jun 2024 06:46:51 +0000 (UTC)
Message-ID: <2326f490-d9dc-4fa9-a9dd-86e56d7ba6d2@xs4all.nl>
Date: Wed, 12 Jun 2024 08:46:50 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ANN] Request for Topics and registration for a Media Summit
 September 16th
Content-Language: en-US
To: Tomasz Figa <tfiga@chromium.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Hidenori Kobayashi <hidenorik@chromium.org>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sean Young <sean@mess.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <ae3b6b11-c3ec-4a3d-8fa1-c91ef2f8e151@xs4all.nl>
 <7CB6738E-DADE-4F4D-9501-C701B2F3F2B7@collabora.com>
 <CAAFQd5Ae7ctMiPWw1=ugeVCFhTJYbNQ_G2xnoOoc-EYRqp4B2A@mail.gmail.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <CAAFQd5Ae7ctMiPWw1=ugeVCFhTJYbNQ_G2xnoOoc-EYRqp4B2A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 6/12/24 06:12, Tomasz Figa wrote:
> On Wed, May 15, 2024 at 1:19 AM Daniel Almeida
> <daniel.almeida@collabora.com> wrote:
>>
>> Hi Hans, all,
>>
>> I’d like to attend in person and discuss the use of Rust in the subsystem, especially in light of [0] and [1].
>>
>> Please note that these are new submissions that are unrelated with what was discussed last year.
>>
>> 30 minutes will do.
>>
>> [0] https://lwn.net/ml/linux-media/20240227215146.46487-1-daniel.almeida@collabora.com/
>> [1] https://lwn.net/Articles/970565
> 
> Somewhat related to the topic: I see potential for a quite big
> redesign of the videobuf2 framework going forward and recently with
> more Rust adoption I'm starting to think it could benefit from being
> implemented in Rust, since we would have to rewrite it quite a bit
> anyway. Especially since it's a part of the subsystem that has to deal
> with memory management, object lifetime and asynchronousness quite a
> lot and we had a history of issues there. So it could be interesting
> to hear everyone's thoughts.

I think it is far too soon to write a framework like that in Rust. To be
honest, I won't even consider it until Linus officially accepts Rust as a
second language in the kernel, instead of as an experiment.

The vb2 framework can certainly use some more work, and esp. better support
for codecs, since that's where the main pain is at the moment.

But I would need to see a proper proposal first. I assume that's what you
plan to present?

> That said, I wouldn't be able to travel this time unfortunately, so it
> would be nice if we could arrange this topic in a time slot friendly
> for remote attendance from Japan. Also +Hidenori Kobayashi from my
> team who would also be interested in joining remotely.

That would mean a slot in the morning, right? Since Japan is 7 hours ahead
of CEST.

Regards,

	Hans

> 
> Best,
> Tomasz


