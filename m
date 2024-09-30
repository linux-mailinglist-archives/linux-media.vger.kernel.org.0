Return-Path: <linux-media+bounces-18752-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 900079898F1
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 03:19:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02F9B284EA4
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 01:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 442928F62;
	Mon, 30 Sep 2024 01:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="B+lDR0rE"
X-Original-To: linux-media@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9648C137E;
	Mon, 30 Sep 2024 01:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727659155; cv=none; b=KMwsc1190IWFRG1q/o0u3EibGGE/bUPa+6jt+z2RXl7uQZL1zwsqXru9jSARDMyhwBpstibSxNaVJjp3hSPiovVUoC+aJM/1yppa6k4/ZB0qI9Nc2W8uQt4YZcK68k3AMb2slqWRetT5ILExmvTa6esQpdhFCxKCdbc1QBxtWZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727659155; c=relaxed/simple;
	bh=tZQzrKVzETh1J2Qe2bPKOKRVYDkKpapUxu/uICsTvmU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sLr8QYx6VuaikHeK7kMeOPphLWKQs+fxGHp/dhvVB/bJdEFVQWBIE9MNTZlBUJ5cYdXh0GTePfXBBZ0+q+go10MS6/kL9hlqI0V9iSN4IxdsmBVEJU4T37rkKua77QlxGpEr22kjlNKvQW216nhNxbq+4y+QJLh6ytBNc1zy3PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=B+lDR0rE; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=XVccFwntIwGBot0bIyb243qoyiqLnKzfjEB3b3z4NJw=; b=B+lDR0rEjnDvDIseihIucVxlsM
	bEOlRLaw/MYIdBG1rFqjC1LXN9V6Xkscg6BbMcQpVpKP73Zb3y7VK6rBFkW//1b0+TatIwrtPrjIK
	MkSyz0UT1i2Oy6uKOf9KqfQBdqCRgseAtx1mbN1D8Lb6OOzyh5uHHxVzS9CnM0ZcQgEv3c0wnXPXg
	DHocaofjI5FWT+Dy9/ag9LCN5N3WopnyfOZ5RyRYX6PzWGkU8tmwh/oYCw+nLjskHHSNgR4JL89Xr
	fR1LfKBjI/sTgdluZTd9M4s32CEs8Ln5fWX4bUnBQnqx8do7sPAu37i9vozhB+dXEa+zwxB4NN3Fe
	zt8+AbMQ==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1sv53p-00000002jgO-43X8;
	Mon, 30 Sep 2024 01:18:50 +0000
Message-ID: <a604f707-83ba-49e0-b90a-db357f8d7cce@infradead.org>
Date: Sun, 29 Sep 2024 18:18:40 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] math.h: Add macros for rounding to the closest
 value
To: Jiri Slaby <jirislaby@kernel.org>, Jani Nikula <jani.nikula@intel.com>,
 Devarsh Thakkar <devarsht@ti.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 sebastian.fricke@collabora.com, linux-doc@vger.kernel.org, praneeth@ti.com,
 nm@ti.com, vigneshr@ti.com, s-jain1@ti.com, r-donadkar@ti.com,
 b-brnich@ti.com, detheridge@ti.com, p-mantena@ti.com, vijayp@ti.com,
 andi.shyti@linux.intel.com, nicolas@ndufresne.ca, davidgow@google.com,
 dlatypov@google.com, corbet@lwn.net, broonie@kernel.org,
 nik.borisov@suse.com, Dave.Martin@arm.com
References: <20240826150822.4057164-1-devarsht@ti.com>
 <20240826150822.4057164-2-devarsht@ti.com>
 <Zsy-8xXQ01-JhL0m@smile.fi.intel.com>
 <9c41f6b7-6b06-cd5b-74bd-24873c4beaf7@ti.com> <87frqqyw9r.fsf@intel.com>
 <0b06794b-34c5-ec0d-59c6-8412a8789eaf@ti.com> <878qwfy9cg.fsf@intel.com>
 <8bcddd10-6699-4e76-9eaf-8768f1c1ae66@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <8bcddd10-6699-4e76-9eaf-8768f1c1ae66@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/29/24 2:54 AM, Jiri Slaby wrote:
> On 29. 08. 24, 11:19, Jani Nikula wrote:
>> The stupid thing here is, I still don't remember which one is the
>> generic thing, rounddown() or round_down(). I have to look it up every
>> single time to be sure. I refuse to believe I'd be the only one.
>>
>> It's okay to accidentally use the generic version, no harm done. It's
>> definitely not okay to accidentally use the special pow-2 version, so it
>> should have a special name. I think _pow2() or _pow_2() is a fine
>> suffix.
> 
> Concur.
> 

Ack here also. I prefer _pow2().


