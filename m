Return-Path: <linux-media+bounces-50566-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 021F2D1958A
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 15:15:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 20213307CA6F
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 14:12:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5938392B88;
	Tue, 13 Jan 2026 14:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UO0IAwys"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419782236EE;
	Tue, 13 Jan 2026 14:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768313532; cv=none; b=owE2AUEZL6xqlTAImVv4VgtchUTXiRt22lDJJbXn6TvxQlwbTVTBuVuOjG0GkKZtyDIRuUYA3LsZSeb+1Chk+FvkvZqjWq/3dFz6TTdsX9UZ1hQzkWF6FVMApmkoQxTNSdgb4RiZ2Of9SnvdpfZlttY/+JaFbKlc+CNdklnE5no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768313532; c=relaxed/simple;
	bh=pc/84db9ibTXoWvNpr+FrBU7auchS4A9b3XVeVy9fTc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VxZaT3JJhGnTjv+R7cwroiRaKlAPExoIox7JMFvVyEc6HbjCsendc4i06/bO5DwzQYBBwnnJM3LgPIs3GeOEfhL9DapFAY9u/yHhCUkrt8AgEu1NoMsXqFAnSWaDlZTFgzjnQAsPYrGOplFCmU3oiwTpQH6TmNMEMXlSIziLKHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UO0IAwys; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EB4BE50A;
	Tue, 13 Jan 2026 15:11:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768313503;
	bh=pc/84db9ibTXoWvNpr+FrBU7auchS4A9b3XVeVy9fTc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UO0IAwysRGhc/xC2y8jJlWhPlJkT08uBseZrDPu/RU9CK+6mmyKXFSQSKrkTQ9kfZ
	 Iw2O/DVB/maPXgdyfyVQlaIDY5ArgRgz70FgySAwwZ8pgsu9A4KVRtcXYJqzNgqg6r
	 6tNP/1uj9MTr83u4F3YwogSkngX9VcVwTfac5N3c=
Message-ID: <e48188b6-111f-45c0-a6a2-ce1bc1411878@ideasonboard.com>
Date: Tue, 13 Jan 2026 14:12:06 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: mali-c55: Fix NULL dev stream alert for tpg
 sub-device
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: "jempty.liang" <imntjempty@163.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, mchehab@kernel.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260113075722.143238-1-imntjempty@163.com>
 <aWYHPKMVFu_QC1Ow@zed> <aWYhGQcDVRDTyvxj@kekkonen.localdomain>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <aWYhGQcDVRDTyvxj@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 13/01/2026 10:40, Sakari Ailus wrote:
> Hi Jacopo,
> 
> On Tue, Jan 13, 2026 at 09:55:10AM +0100, Jacopo Mondi wrote:
>> I wonder if v4l2_device_register_subdev() shouldn't WARN or if return
>> an error if sd->dev is not initialized. Laurent, Sakari: opinions ?
> 
> I might even return an error but I wonder what would break. Perhaps indeed
> could start with a warning?
> 

It looks like it's only used for dev_*() printks, unless I'm missing something. Thanks Jempty for 
spotting the problem!

Dan

