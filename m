Return-Path: <linux-media+bounces-34296-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 953B6AD0E6A
	for <lists+linux-media@lfdr.de>; Sat,  7 Jun 2025 18:06:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 124F21891D58
	for <lists+linux-media@lfdr.de>; Sat,  7 Jun 2025 16:06:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C52871DDC2A;
	Sat,  7 Jun 2025 16:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VSIYQz0T"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DFB184F
	for <linux-media@vger.kernel.org>; Sat,  7 Jun 2025 16:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749312361; cv=none; b=ATXUo6m2Y77EWF2tkZItLYpTc+EIdzfrVMQ8gDGBCIfN/qQZQMFDD3gfWzs/XB52RBsZR1BOMWuFerA6nX72MuYzmiz1Hl7YSp83G2NBnzyz2jU8q/DfwwS7rv+I6TVCAlSEgSZz0PxGqhAm/7g+5ZF7jO5mnBDFPJGZcwDU65o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749312361; c=relaxed/simple;
	bh=TLO30A98EMfr0Ez2dXrUZwP1ircZXXaV4+4ewn/pbPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sX3X4h3zk5H1hqAZSlRsq/5cqOQoExv1VzlwgEcLZr2dyi0bibpcZf+dXh3/AmuxKxMJkXjxMg88RXBKKc/D3jbhGR40dJR0S1jJKZUauGTZMnnzb/gD/jLUAjTilSOWwD3+GgohGCeeHPAQkfeKjkmhWyQRhs7agUa2rNI5PCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VSIYQz0T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C090DC4CEE4;
	Sat,  7 Jun 2025 16:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749312360;
	bh=TLO30A98EMfr0Ez2dXrUZwP1ircZXXaV4+4ewn/pbPI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VSIYQz0Tx83zWFy4gSBv4JcKSb8BAZgnhcboomEehLR+fndO+5OsiBdIJtJOLRvQp
	 FA5yaqr08ywe8P3MkfB8tme4B+w9LXoND+cPmKTdRkYGK41zSe0Iw5wjMLuv6yOFN8
	 yooKxdW0/PtkZSFVu5WuW5vapsPt4bOnFLDSOSUaApU38Y2borXHxvSoJjFOLLFY7g
	 MjydMCIQNooOYIIFtSxEuyFtYx3OjwCpIDOeMPlHTFdTmhYCyygIJW73wSLiUNLrMU
	 CL6sqBWSNZhEbE2MLCbkqfacLKoLzje9EzgZ8IZqBO60OmY2zSzSgKKUbCPJ8FTu/e
	 WYQjnM6Y3sUFQ==
Message-ID: <18df2aa5-d96f-4326-96ee-1f2aaa595ef1@kernel.org>
Date: Sat, 7 Jun 2025 18:05:57 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: hi556: Support full range of power rails
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20250531190534.94684-1-hansg@kernel.org>
 <20250531190534.94684-3-hansg@kernel.org>
 <aEKWHMAAevtfaAqb@kekkonen.localdomain>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <aEKWHMAAevtfaAqb@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sakari,

On 6-Jun-25 9:17 AM, Sakari Ailus wrote:
> Hi Hans,
> 
> On Sat, May 31, 2025 at 09:05:34PM +0200, Hans de Goede wrote:
>> From: Hans de Goede <hdegoede@redhat.com>
>>
>> Use regulator_bulk_* to get the array of potential power rails for
>> the hi556.
>>
>> Previously the driver only supported avdd as only avdd is used on IPU6
>> designs. But other designs may also need the driver to control the other
>> power rails and the new INT3472 handshake support also makes use of
>> dvdd on IPU6 designs.
>>
>> Link: https://bugzilla.redhat.com/show_bug.cgi?id=2368506
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/media/i2c/hi556.c | 40 +++++++++++++++++++++------------------
>>  1 file changed, 22 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/media/i2c/hi556.c b/drivers/media/i2c/hi556.c
>> index d3cc65b67855..110dd00c51ae 100644
>> --- a/drivers/media/i2c/hi556.c
>> +++ b/drivers/media/i2c/hi556.c
>> @@ -624,6 +624,12 @@ static const struct hi556_mode supported_modes[] = {
>>  	},
>>  };
>>  
>> +static const char * const hi556_supply_names[] = {
>> +	"dovdd",	/* Digital I/O power */
>> +	"avdd",		/* Analog power */
>> +	"dvdd",		/* Digital core power */
>> +};
> 
> As the need to have these regulators is not related to a proper firmware
> API, I think we should have at least DT bindings that document them.

The hi556 driver does not support DT binding atm, only ACPI binding
and the DT maintainers have been very clear in the past that they
do NOT want any DT bindings for things which are not actually used
by DT platforms.

I've checked a HI556 datasheet I found on the net and the HI556
has the usual 3 power rails, called VDDD + VDDIO + VDDA in the datasheet,
so I believe that this patch is correct.

Regards,

Hans



