Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64FF556478
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2019 10:24:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbfFZIYK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jun 2019 04:24:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:56834 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725876AbfFZIYJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jun 2019 04:24:09 -0400
Received: from localhost (unknown [116.247.127.123])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 69668208E3;
        Wed, 26 Jun 2019 08:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561537449;
        bh=1WdsFgJikFAYl4u2CkYUfSLxKdsbmM1t90h/alaycC0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mTq9qe2E8PKXYVMAk9K2o7KAfuiqPs1UXXOTR694JsjD7Y0PjWa3RyCjXhApn1Qnh
         gtG2F6KRLmCUToMk977VYGp9Trm5yjt031PMGri4oLMTMLuiPK/4GZHVDMZiRgmSMO
         jp+lIuib30jsOcRx6uM7gYWJE44SAR9+2ubFPVVU=
Date:   Wed, 26 Jun 2019 16:19:42 +0800
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Andrey Shvetsov <andrey.shvetsov@k2l.de>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH] staging/most/video: set device_caps in struct
 video_device
Message-ID: <20190626081942.GA4605@kroah.com>
References: <bf6e19b5-095c-ecac-fddb-91a1a65a2dee@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf6e19b5-095c-ecac-fddb-91a1a65a2dee@xs4all.nl>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 26, 2019 at 09:52:49AM +0200, Hans Verkuil wrote:
> Instead of filling in the struct v4l2_capability device_caps
> field, fill in the struct video_device device_caps field.
> 
> That way the V4L2 core knows what the capabilities of the
> video device are.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
> Hi Andrey,
> 
> I noticed this new staging V4L2 driver. FYI, please CC any future patches to
> this driver to the linux-media@vger.kernel.org mailinglist as well so we can
> review it. I'll post a review of this driver later today as well. In the
> meantime, I'd like to get this patch in since during the upcoming 5.4 cycle
> we will require that the device_caps field of struct video_device is set
> correctly.
> 
> Greg, do you want to take this patch? After Andrey Acks it, of course.

Yes, I will be glad to take it.

thanks,

greg k-h
