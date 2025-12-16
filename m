Return-Path: <linux-media+bounces-48875-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E9DCC3555
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 14:48:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8A730300C255
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 13:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0620037C114;
	Tue, 16 Dec 2025 12:36:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82E837C0E0;
	Tue, 16 Dec 2025 12:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765888592; cv=none; b=kg9GUuq/omggr+XW31RkD911Cx7e8gJavEhDDbO9CcmNQxfhBnxPSY55bBRcwDY/9gn8vX6WgbMG74w9tEB4bxGGm6d67AOJmgqXPSGq6mBf8twqPEXXt4Weh6mCTzuO0rqLWF++oRGwks7BRa56+kDGFsA5JhpoFOLpkrjQo0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765888592; c=relaxed/simple;
	bh=XR37Y/AtXTrzX5Db2to1BzjbHGl6T0Srq9Bx2SKhCZs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t1k5cSGQwAuXKAVWtlTJ+UjC8yGC9g+FRqCA+SEQGfSlCkC3IdUeGBUbSm0LtSZKqArXCf+PihYeHzki0FemPB2dSllHacOI5pqeasRhfPkUPnANtxdOAi4ycMpGQIaDIGOEyIZxNJcVACrShc3BR8+0NQxGYhc3j9ujvUeHIfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FF47C4CEF1;
	Tue, 16 Dec 2025 12:36:31 +0000 (UTC)
Message-ID: <ed294ad7-258f-4338-a8e1-b6b2207891c7@nxsw.ie>
Date: Tue, 16 Dec 2025 12:36:29 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: dvb-core: fix style violation issues
To: Nikhil S <nikhilsunilkumar@gmail.com>, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <hYg92vKOILESyOQVF3JIEerEzLerDl85OacgAZi7UelxM4oIOogwRtoNhxgHUiiAPNHyMDWBYp0Sa3zf74sJog==@protonmail.internalid>
 <20251215175639.19377-1-nikhilsunilkumar@gmail.com>
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Content-Language: en-US
In-Reply-To: <20251215175639.19377-1-nikhilsunilkumar@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/12/2025 17:56, Nikhil S wrote:
> Fix multiple checkpatch-reported style issues.
> 
> Signed-off-by: Nikhil S <nikhilsunilkumar@gmail.com>
For a patch like this you should make clear in the commit log that you 
are fixing whitespace formatting and not changing logic.

---
bod

