Return-Path: <linux-media+bounces-42308-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B33D2B52ED4
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 12:43:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 62B8B7BAD92
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 10:42:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4E0F310631;
	Thu, 11 Sep 2025 10:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M2kPrLt2"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2382C30FF3F;
	Thu, 11 Sep 2025 10:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757587406; cv=none; b=mmPDvnwQ++j9l7LYeTTZ1sxEprzoyEfu7cXcxe90PqYhdld+p78lHd4sZ/sh2pK1Kt8OUylUir5e+kYZbZLoYyOGjH52OeIcVjXNNQ4FXSsr3Ez1PSawyjYBJ2NAU6zu2nwWFmYO+I4Rjul+Bk+S5lBS7hBXnhK8gO1hjStA8OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757587406; c=relaxed/simple;
	bh=v2/fiXRKGCGisxfYUO9xCJsu7Yyo2X78SQnINwM17zw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IZXT1qwnZSFoPVO2OPowKVdo0NilsObzTmVqIKIo+pAv3ikYSe0mBdbWFycx44KRBl1XJ4Y47k6OmKw0tB4MVavYnLVsnp7EjqT+y5O97ALKKzjq9BuG4uVbH57FgIY03TUwcWg5ykJTNMBxuK5fR0YhIg0G8TGRWqY5z9a3Qa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M2kPrLt2; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757587405; x=1789123405;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=v2/fiXRKGCGisxfYUO9xCJsu7Yyo2X78SQnINwM17zw=;
  b=M2kPrLt2i554OsubVunuzWP6i9EcyGBgRKL7hikDLpsoVekZSDaH18QC
   JXdqQVyckqQrszXv63GDolGOTccV7+1x5xd7bvGYGl1bfGc+ZT7dw86wz
   I4PnpREBhWPomZc4KksEATLJ0ZzcYY7VHuxXbKvFUDwf8aKgi1/AoQzfQ
   idklxbfTmzIaj42tN+FSAIQsVMPrJ8H4PAo932cl8P3ZG78P4Hsh5yLgQ
   E8EQ2+BnCjksLd9188w6CyvgOvr1wf5zntdavatALEW5MJNTe/y/wyZC/
   S9ED1AzbLrIct3DWS3lVNRY33KRgK+sRM5q74GvJo3GVtXndEsVkyMQD5
   Q==;
X-CSE-ConnectionGUID: TIBjqwjaQdixn4QqvPv5aw==
X-CSE-MsgGUID: 4tUGMP+NTvmuq8nKFWuvaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59860673"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="59860673"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2025 03:43:24 -0700
X-CSE-ConnectionGUID: 9nOXyxQKSdCHClEC2g3abg==
X-CSE-MsgGUID: avBgIAJJSQ6PHmEyKVpVow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; 
   d="scan'208";a="173725818"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.3])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2025 03:43:21 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2DEC61201BB;
	Thu, 11 Sep 2025 13:43:17 +0300 (EEST)
Date: Thu, 11 Sep 2025 13:43:17 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Edward Adam Davis <eadavis@qq.com>
Cc: laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, mchehab@kernel.org,
	syzbot+031d0cfd7c362817963f@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH Next V2] media: mc: Clear minor number before put device
Message-ID: <aMKnxavyXHFJdwuq@kekkonen.localdomain>
References: <20250910092233.GA20904@pendragon.ideasonboard.com>
 <tencent_3DA367CA06CB92C5C64C49A4AED42ECA4C06@qq.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_3DA367CA06CB92C5C64C49A4AED42ECA4C06@qq.com>

Hi Edward,

On Wed, Sep 10, 2025 at 06:31:45PM +0800, Edward Adam Davis wrote:
> syzbot report a slab-use-after-free in media_devnode_unregister.
> 
> The following calltrace shows the entire process of UAF generation:
> 
> hub_event()->
>   port_event()->
>     hub_port_connect_change()->
>       hub_port_connect()->
>         usb_disconnect()->
> 	  usb_disable_device()->
> 	    device_del()->
> 	      bus_remove_device()->
> 	        device_release_driver_internal()->
> 		  __device_release_driver()->
> 		    device_remove()->
> 		      usb_unbind_interface()->
> 		        em28xx_usb_disconnect()->
> 			  em28xx_release_resources()->
> 			    em28xx_unregister_media_device()->
> 			      media_device_unregister()->
> 			        media_devnode_unregister()->
> 				  put_device()->
> 				    media_devnode_release()->
> 				      kfree(devnode)
> 				  clear_bit(devnode->minor, media_devnode_nums) 
> 
> [1] kfree(devnode), after this code is executed, devnode is released.
> [2] clear_bit(devnode->minor, media_devnode_nums), this accesses the
> freed devnode, trigger uaf
> 
> We clear the device's minor num before freeing devnode to avoid a UAF.
> 
> Fixes: 9e14868dc952 ("media: mc: Clear minor number reservation at unregistration time")
> Reported-by: syzbot+031d0cfd7c362817963f@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=031d0cfd7c362817963f
> Tested-by: syzbot+031d0cfd7c362817963f@syzkaller.appspotmail.com
> Signed-off-by: Edward Adam Davis <eadavis@qq.com>

Thanks for the update. However, v1 was already merged. I'll mark this as
"not applicable".

-- 
Kind regards,

Sakari Ailus

