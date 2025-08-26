Return-Path: <linux-media+bounces-41086-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B61A1B364F4
	for <lists+linux-media@lfdr.de>; Tue, 26 Aug 2025 15:43:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 08395466DD3
	for <lists+linux-media@lfdr.de>; Tue, 26 Aug 2025 13:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 084433277A4;
	Tue, 26 Aug 2025 13:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gsv2LqOV"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFAC196C7C;
	Tue, 26 Aug 2025 13:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756214912; cv=none; b=BCScPsu6hi6bKukPGtjSBd6lBMMyGLJBLivKhp49JwpcCPsDCpCdlGGrP9tg0WwAbO7QnniTWmr2Crw2H8Mwdndj0Z+jXzhF4C0V3Bh7r7pZvSu1yVyRK23ErVjyIDPvUO3H6JYdGRWtHw+6m9cCbGSNxzRUgpmc/8Wd/BqiPYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756214912; c=relaxed/simple;
	bh=37a8LAHXzTg6IWIz/YV4jPKUZg0+8vEej2K94q6CR68=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bhYQoAsS06jPCRAaa8oWseAQKwniBKil/KoMp1p3feOeE6qS5dqAjXvk/TqLURf7ljYHgEF/wFkrEyxF6TPtCzpUE56Bv2d1lor2mFktJtbAQ4Yz3NlqKUNRV8Vl65juT/93+Rkjt98AJlJ4+ae2al4nK2IDLXiCnzDaR3h66fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gsv2LqOV; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756214910; x=1787750910;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=37a8LAHXzTg6IWIz/YV4jPKUZg0+8vEej2K94q6CR68=;
  b=Gsv2LqOVtpNMAG4zBXR2zEDKAFbElGKvo4ZMFs+u5EXLLoVUAxa6ONwn
   vNGtFE9DV1Z7Og8/e2oX4LwKRvSZ5+49frjTElycAxgq0INBVgS1I3UnJ
   L/ZvA/wSAWgnN7GEkFTAPAtNAr1wzggpceDYGFzhLH060UGib4iAdQu0d
   ZGIGX8fl2NyPZweP1qGIpcYAfz1C6STquHU+ZKTtolGN+kq6nHjOZwFPw
   agqrxoPo1bl/gQVkZFm7rDDOJedWnVkd7+MeM1Wj02Tq946ZkQ1aDlPpy
   YkH8JekvwIthH2w+MaNOzeA955DwIJdVucRwjzQf+0AcUO7GCv4/OlaIm
   w==;
X-CSE-ConnectionGUID: pUbG4VdISxmyPEKxZ/BBDw==
X-CSE-MsgGUID: pVr90eQ0SCmNHHjIIwPi/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58506368"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58506368"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 06:28:29 -0700
X-CSE-ConnectionGUID: 8UGtDv7cREih42E+7uUz+w==
X-CSE-MsgGUID: E82XdXJsTf63uN3rJlicGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="169187681"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.245.218]) ([10.245.245.218])
  by orviesa009.jf.intel.com with ESMTP; 26 Aug 2025 06:28:26 -0700
Message-ID: <ef2689c0-b814-4338-bf8d-d96ef4483e3b@linux.intel.com>
Date: Tue, 26 Aug 2025 16:28:24 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/9] eUSB2 Double Isochronous IN Bandwidth support
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-usb@vger.kernel.org
Cc: linux-media@vger.kernel.org, gregkh@linuxfoundation.org,
 laurent.pinchart@ideasonboard.com, hdegoede@redhat.com,
 Thinh.Nguyen@synopsys.com, Amardeep Rai <amardeep.rai@intel.com>,
 Kannappan R <r.kannappan@intel.com>, Alan Stern <stern@rowland.harvard.edu>,
 =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
References: <20250820143824.551777-1-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20250820143824.551777-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20.8.2025 17.38, Sakari Ailus wrote:
> Hi all,
> 
> This series enables support for eUSB2 Double Isochronous IN Bandwidth UVC
> devices specified in 'USB 2.0 Double Isochronous IN Bandwidth' ECN. In
> short, it adds support for new integrated USB2 webcams that can send twice
> the data compared to conventional USB2 webcams.
> 
> These devices are identified by the device descriptor bcdUSB 0x0220 value.
> They have an additional eUSB2 Isochronous Endpoint Companion Descriptor,
> and a zero max packet size in regular isoc endpoint descriptor. Support
> for parsing that new descriptor was added in commit
> 
> c749f058b437 ("USB: core: Add eUSB2 descriptor and parsing in USB core")
> 
> This series adds support to UVC, USB core, and xHCI to identify eUSB2
> double isoc devices, and allow and set proper max packet, iso frame desc
> sizes, bytes per interval, and other values in URBs and xHCI endpoint
> contexts needed to support the double data rates for eUSB2 double isoc
> devices.
> 

Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>

The v5 of this series looks good to me, and could from my perspective be
picked directly to usb-next

Thanks
Mathias


