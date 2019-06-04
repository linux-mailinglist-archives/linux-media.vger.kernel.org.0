Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9505734742
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 14:50:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727704AbfFDMt7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 08:49:59 -0400
Received: from mga03.intel.com ([134.134.136.65]:1777 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727394AbfFDMt7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 4 Jun 2019 08:49:59 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Jun 2019 05:49:59 -0700
X-ExtLoop1: 1
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by fmsmga005.fm.intel.com with ESMTP; 04 Jun 2019 05:49:57 -0700
From:   Felipe Balbi <felipe.balbi@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH 4/7] usb/gadget/f_uvc: set device_caps in struct video_device
In-Reply-To: <20190604123042.GD7812@pendragon.ideasonboard.com>
References: <20190604111958.22331-1-hverkuil-cisco@xs4all.nl> <20190604111958.22331-5-hverkuil-cisco@xs4all.nl> <20190604123042.GD7812@pendragon.ideasonboard.com>
Date:   Tue, 04 Jun 2019 15:49:56 +0300
Message-ID: <87r289ikgb.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Hi,

Laurent Pinchart <laurent.pinchart@ideasonboard.com> writes:

> Hi Hans,
>
> Thank you for the patch.
>
> On Tue, Jun 04, 2019 at 01:19:55PM +0200, Hans Verkuil wrote:
>> Instead of filling in the struct v4l2_capability device_caps
>> field, fill in the struct video_device device_caps field.
>> 
>> That way the V4L2 core knows what the capabilities of the
>> video device are.
>> 
>> But this only really works if all drivers use this, so convert
>> this UVC gadget driver.
>> 
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> I have no patch for the UVC gadget driver for the next merge window, so
> feel free to merge this through the Linux media tree if Felipe is fine
> with this.

Fine by me:

Acked-by: Felipe Balbi <felipe.balbi@linux.intel.com>

cheers

-- 
balbi
