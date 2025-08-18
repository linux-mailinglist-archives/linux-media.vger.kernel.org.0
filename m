Return-Path: <linux-media+bounces-40092-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D74DAB29AD9
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 09:33:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB02317BCE9
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 07:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F66F27A92E;
	Mon, 18 Aug 2025 07:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nSsl649V"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746FB2741A6;
	Mon, 18 Aug 2025 07:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755502375; cv=none; b=X2QihWWLfBv5eQIKnaBWGvK+FXkDxVPBizCxI1cI1pQ6/ut2pXnCi64A+ayaOc+EZq87vDillsNsNoSY2VXVFRIo7j+r3ZphRTEIhGZs/FAxTU4Q4hu1bAX6qKBIBvaAjvjH0cRjkh3PUtb9KnxIhJrwqI32asx1Gqos8eFxyWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755502375; c=relaxed/simple;
	bh=mb+jmgXxuUsGZoPu6J4hblXRb6DHR1QmCBYGXQUZoSA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D/mzxFWyCgAEP3NWSYZH3iTaNuq2ucA06sSuPShjf5zvuZzm1tQ0WrzpGdEbs3TlsPm9895C19Zv4wRnGpM6sPRVrng6bM/8810Voc55A4BH5azEPZo3deJRmIu4HBcfsAouXbaPqclJ5WvR150aPVSZIbl75A1GGtPjtbsZsAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nSsl649V; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755502373; x=1787038373;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=mb+jmgXxuUsGZoPu6J4hblXRb6DHR1QmCBYGXQUZoSA=;
  b=nSsl649VSYAdwZnFP34GNB9MKGfZ4jLcnHSIEYoGfBexG3vmBH5ef3Sn
   Cu1CplDAvkb7IpVu0fSnzYtAmPpMTBdHzTuprHuZ4FHSsJQHFj00gnVFB
   C69rqO4VatUjM+TBbdZBey6nCsRc/z3B2P9AC/qSkYTGPh6eH0LwGbI08
   iUeKOWgDC+eCYWD58ZkonoTaSJIIQO/QKRboymSyq7iLkA9frGTyoxu7R
   vBroFJML79/Gk0dS73OEldDJA/9VLkOq3q7y2rFhJVAK3wl+lhVwC93wQ
   DmUo7l/1pIgT8PPJf+ALAt2cB9UFNunHMts8OeCvZKDedEUMwAbNPVJ5J
   w==;
X-CSE-ConnectionGUID: NCqDX3+PRAGW+F8vqfe/qQ==
X-CSE-MsgGUID: fibOA5XeSwyL3DdxSOegvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="67985650"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="67985650"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 00:32:53 -0700
X-CSE-ConnectionGUID: clguvibfRXGI/SrVOA7mOw==
X-CSE-MsgGUID: Z4kXXwG/Q+Ov4rOwFcoFjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="166685740"
Received: from mnyman-desk.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orviesa006.jf.intel.com with ESMTP; 18 Aug 2025 00:32:50 -0700
Message-ID: <767ac1c3-f09c-47cf-947d-968ae574e577@linux.intel.com>
Date: Mon, 18 Aug 2025 10:32:48 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] USB: Add a function to obtain USB version
 independent maximum bpi value
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
 gregkh@linuxfoundation.org, laurent.pinchart@ideasonboard.com,
 hdegoede@redhat.com, Thinh.Nguyen@synopsys.com,
 Amardeep Rai <amardeep.rai@intel.com>, Kannappan R <r.kannappan@intel.com>,
 Alan Stern <stern@rowland.harvard.edu>
References: <20250812132445.3185026-1-sakari.ailus@linux.intel.com>
 <20250812132445.3185026-4-sakari.ailus@linux.intel.com>
 <20250813164958.6c6c34a4@foxbook> <aKLDXCchS20kaq20@kekkonen.localdomain>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <aKLDXCchS20kaq20@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi

On 18.8.2025 9.08, Sakari Ailus wrote:
> Hi Michał,
> 
> Thank you for the review.
> 
> On Wed, Aug 13, 2025 at 04:49:58PM +0200, Michał Pecio wrote:
>> On Tue, 12 Aug 2025 16:24:44 +0300, Sakari Ailus wrote:
>>> From: "Rai, Amardeep" <amardeep.rai@intel.com>
>>>
>>> Add usb_endpoint_max_isoc_bpi() to obtain maximum bytes per interval for
>>> isochronous endpoints in a USB version independent way.
>>>
>>> Signed-off-by: Rai, Amardeep <amardeep.rai@intel.com>
>>> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
>>> Co-developed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>>> Reviewed-by: Hans de Goede <hansg@kernel.org>
>>
>> Hi,
>>
>> This is practically identical to xhci_get_max_esit_payload().
>>
>> Couldn't xhci also use this helper now, to reduce duplication and
>> ensure that it has the same idea of ESIT payload as class drivers?
>>
>> Note that this here would need to also accept interrupt EPs:
>>> +{
>>> +	if (usb_endpoint_type(&ep->desc) != USB_ENDPOINT_XFER_ISOC)
>>> +		return 0;
> 
> Sounds reasonable, I'll see how to best take that into account in v5.
> 
> I wonder if I should adopt the name from the xHCI variant as the function
> would be also used for interrupt endpoints.
> 

I think the "ESIT" acronym (Endpoint Service Interval Time) is very xHCI spec
specific. Usb spec usually refers to isoc and interrupt endpoints as "periodic"

how about one of these:
usb_endpoint_max_periodic_bytes()
usb_endpoint_max_periodic_payload()
usb_endpoint_max_periodic_bpi()

Thanks
Mathias


