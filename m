Return-Path: <linux-media+bounces-23249-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C329EE033
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 08:24:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4909C16633F
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 07:24:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 618DF20ADF7;
	Thu, 12 Dec 2024 07:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fjr44KBh"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2416345027
	for <linux-media@vger.kernel.org>; Thu, 12 Dec 2024 07:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733988266; cv=none; b=mKdchDc0j3DZuG2+owl6Gh8h0jZnNSWV5T9QQnlahF1Vl1WXx7Eet7q52KXye392KyG1HIyB85jpNJHPePOsCTp9M1qNJ+IT9s1Y3TIoY0OlhgCNzObQFdkMyqPDAKwjlaCbOPBFv/Naa5eAgVvh9+ikyd68qC2+cnXlKwTsLzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733988266; c=relaxed/simple;
	bh=OZ+MwECLNiOy76P0togNllWUpKxw1/IP/KWizlW3xg0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n7R7qxRfA1z5HmTDan6GCmyZ+wWr/cwwmkGQKAR9O+RtfGqm0H2Ela2IX5x1Pqj4sbt/qBO11ztREso9aV6O6rq8Fw9VaX+UsIKS9ixZaMaq6fa2J88SoI+vEiFZlfyosnG2vCtb4npXzajupM2pbP9RicswNeZvT7IuTH0+YhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fjr44KBh; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733988265; x=1765524265;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=OZ+MwECLNiOy76P0togNllWUpKxw1/IP/KWizlW3xg0=;
  b=fjr44KBhUDNsPOeX6cNMQaHiaO/cjbE6RBr9OeqXV9txhMDeun21wiHf
   AQ6CqdnGNtkyr0O3DzPLDiuT/VIhyBU1KJ2YFOFSwwhzKMozYuj2P9SCi
   RSCd2CfWt/xX8drY8N4R7sO81CT4U0rSJ/mUluNrnwMXMonRRwy9ubROH
   Djid0QoeMOZIT7FkeRYXAtisRA7KLrOe4tTnpVYtVixjoSGDRV59MVPMq
   6sHDAWnIX8HvfYdTnVZvwJ5rV2dsIMSk83N9XwW/epipXrkJOwLXofeXq
   QBP1Qlckeamu0lGEtYSiTrbkZlX0ZYpoylSuciXF9A7ryJ3VLLb9m6BLO
   A==;
X-CSE-ConnectionGUID: ZNHym9YBTfC4uW9p3Tv7/g==
X-CSE-MsgGUID: 0tuuyrj3SRKSS/MhHP5tRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34299797"
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; 
   d="scan'208";a="34299797"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 23:24:25 -0800
X-CSE-ConnectionGUID: 96o5N9hoT1+Yl4zEeTh9bA==
X-CSE-MsgGUID: VgmWIXxARhyQ80ODrY2TSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; 
   d="scan'208";a="96383384"
Received: from unknown (HELO [10.238.225.22]) ([10.238.225.22])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 23:24:21 -0800
Message-ID: <e48e0778-7911-47ec-b8f2-d4b6e95484c1@intel.com>
Date: Thu, 12 Dec 2024 15:24:16 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] media: i2c: add lt6911uxe hdmi bridge driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 hverkuil@xs4all.nl, ricardo.ribalda@gmail.com, bingbu.cao@linux.intel.com,
 tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
 daxing.li@intel.com, dongcheng.yan@linux.intel.com, ong.hock.yu@intel.com,
 balamurugan.c@intel.com, wei.a.fu@intel.com
References: <20241129061546.2237511-1-dongcheng.yan@intel.com>
 <Z1hOBpwLfB_wfRwL@kekkonen.localdomain>
 <66e2d69c-9413-48dc-9dcc-1df7576ddf2d@intel.com>
 <Z1oAGfRs28hgo-sc@kekkonen.localdomain>
Content-Language: en-US
From: "Yan, Dongcheng" <dongcheng.yan@intel.com>
In-Reply-To: <Z1oAGfRs28hgo-sc@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Sakari,

Since you are planning to PR this patch, I will continue to use 
CUR_LINK_FREQ to initialize the link_freq v4l2_ctl.

Besides, I see your patch in intel/ipu6 that obtains the link frequency 
from the sub-device instead of a control handler.

Maybe I don't need init link_freq v4l2_ctl anymore?

Thanks,
Dongcheng

On 12/12/2024 5:12 AM, Sakari Ailus wrote:
> Hi Dongcheng,
>
> On Wed, Dec 11, 2024 at 10:39:53PM +0800, Yan, Dongcheng wrote:
>>>> +static int lt6911uxe_init_controls(struct lt6911uxe *lt6911uxe)
>>>> +{
>>>> +	struct v4l2_ctrl_handler *ctrl_hdlr;
>>>> +	s64 pixel_rate;
>>>> +	int ret;
>>>> +
>>>> +	ctrl_hdlr = &lt6911uxe->ctrl_handler;
>>>> +	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 8);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	lt6911uxe->link_freq =
>>>> +		v4l2_ctrl_new_int_menu(ctrl_hdlr, NULL, V4L2_CID_LINK_FREQ,
>>>> +				       sizeof(lt6911uxe->cur_mode.link_freq),
>>> There's just a single entry in the array. sizeof() will get the size in
>>> bytes, which is 8! Use 1 here instead.
>> Hi Sakari, I used CUR_LINK_FREQ before, which refers to your patch:
>>
>> <URL:https://lore.kernel.org/linux-media/20240426145538.654212-1-sakari.ailus@linux.intel.com/>.
> There were a few iterations of the set and this is
> where it eventually ended:
>
> <URL:https://lore.kernel.org/linux-media/20241210075906.609490-1-sakari.ailus@linux.intel.com/T/#t>
>
> I intend to include that in a PR soonish.
>
>> But I am worried about the progress of this patch.
>>
>> If you have expectations for it, I can modify it to CUR_LINK_FREQ.

