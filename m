Return-Path: <linux-media+bounces-13494-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF6C90C389
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 08:27:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4069DB220D9
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 06:27:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B0BF4206E;
	Tue, 18 Jun 2024 06:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K6FVuznr"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519673FBA5
	for <linux-media@vger.kernel.org>; Tue, 18 Jun 2024 06:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718692053; cv=none; b=ZUOGz77i8bnNf6Tp3Fp2kIjsVhUuAgRKnBARz7ifdom+v8u8gBh9IkcdEKjmKfM9TnDYGcoX6lDGvbbe5gUqJrPDvgMtcQSLUCGMcp1vGHqJchWXNeQxfieEejp0J3oG5dbBtIJGGIrks45zklwC/LnSMt2fkSMW2CdDcg+LpHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718692053; c=relaxed/simple;
	bh=get0jSDzaO9DTf8IEOHeoWeIlwTAJvffwfKbXGVLZaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tMxc3/MehhAxYoR3wJgJBTcwXqBbZgh4ZnSnrorxkSR0I5Z1++vS5a82G9/uBoXOHtthFlQrPmSVjCSauTgXIDDOMRxyIKykfJljdW1P0k/Bj4ntQ9oNCQcTS1gcOxnzd6r0pPJ5Pjs/yC/sO6NLKmY/+9j40VQUiGnqZd72mI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K6FVuznr; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718692052; x=1750228052;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=get0jSDzaO9DTf8IEOHeoWeIlwTAJvffwfKbXGVLZaw=;
  b=K6FVuznreW2de1laNff7JjUkYL3lq6Yfk5+jCfnXlxOb3KscYfC5f1ie
   Vau0pc95UuN9d4hmF4NIbFm6xWOa7Frb4SVTyZLKGpp3iIsPe7+Ajr9jj
   2v+DcMU58QAA9mFoeE5Em+LV9GmV+K50eMlC6kThZdwEO82ePpUraVxy4
   iIXvcXLc1NNJVFIbNWuC9ohlEpZ8hmMYaV5GkI/OGujPYUq0Wu7BX/NkE
   yhr/n9VtCU3EhC7BsKNFrYmKDTL4zJJ2sklbhgVmeUb1cuW9xTYjRyePD
   7SRFofwaxVf3FtAhKykiHgEqwH/ZzqroxtDuiK0/QsmS8P87RinPlZRJ5
   A==;
X-CSE-ConnectionGUID: 8OcEAkDrSSyTkaC+R5deqA==
X-CSE-MsgGUID: +J1ahiruSGGXJpfOncqyXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="15782152"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="15782152"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 23:27:32 -0700
X-CSE-ConnectionGUID: ME95noTQRASHgS2XzM4UQg==
X-CSE-MsgGUID: oqalFW7CR9yZbOatnPYCnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="46558947"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 23:27:31 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 119CD11F7E1;
	Tue, 18 Jun 2024 09:27:28 +0300 (EEST)
Date: Tue, 18 Jun 2024 06:27:28 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v4 22/26] media: mc: Maintain a list of open file handles
 in a media device
Message-ID: <ZnEo0Lxp5d7K2ln2@kekkonen.localdomain>
References: <20240610100530.1107771-1-sakari.ailus@linux.intel.com>
 <20240610100530.1107771-23-sakari.ailus@linux.intel.com>
 <20c3243e-9bd4-457a-9b1d-d6c65cf31a58@xs4all.nl>
 <ZnB2Xu5AD-qUDj20@kekkonen.localdomain>
 <514558db-64de-47e4-8de2-b9cef5972bb2@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <514558db-64de-47e4-8de2-b9cef5972bb2@xs4all.nl>

Hi Hans,

On Tue, Jun 18, 2024 at 07:35:45AM +0200, Hans Verkuil wrote:
> On 17/06/2024 19:46, Sakari Ailus wrote:
> > Hi Hans,
> > 
> > On Mon, Jun 17, 2024 at 11:57:20AM +0200, Hans Verkuil wrote:
> >> On 10/06/2024 12:05, Sakari Ailus wrote:
> >>> @@ -830,6 +843,10 @@ void media_device_unregister(struct media_device *mdev)
> >>>  	if (!media_devnode_is_registered(&mdev->devnode))
> >>>  		return;
> >>>  
> >>> +	spin_lock_irq(&mdev->fh_list_lock);
> >>> +	list_del_init(&mdev->fh_list);
> >>> +	spin_unlock_irq(&mdev->fh_list_lock);
> >>
> >> Huh? This doesn't make sense to me. Unregistering the media device
> >> makes no difference to the list of open filehandles.
> > 
> > Right, I agree with that.
> > 
> > Presumably the list will be empty at release time. I think I'll drop this
> > and add a sanity check for the list.
> 
> Why would it be empty? You can have multiple fhs open when
> media_device_unregister is called. But that's fine, eventually all fhs
> will be closed.

By "release" I meant device's (memory) release callback, i.e. no file
handles to the device would remain open by that time.

-- 
Regards,

Sakari Ailus

