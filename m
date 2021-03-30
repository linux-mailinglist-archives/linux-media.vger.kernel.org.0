Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12B8434E2FA
	for <lists+linux-media@lfdr.de>; Tue, 30 Mar 2021 10:18:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231310AbhC3ISW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Mar 2021 04:18:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231278AbhC3ISO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Mar 2021 04:18:14 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1F5AC061762
        for <linux-media@vger.kernel.org>; Tue, 30 Mar 2021 01:18:13 -0700 (PDT)
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E2DC5102;
        Tue, 30 Mar 2021 10:18:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1617092291;
        bh=6jzBzegITIdMEah9rjuCntI4YzhX9AGn95D+n6+EiEI=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=gIDE91UZREnp7RUKWAUUseUrXiDFrMpyUAJmthjxcAnX4l2r2oJXagiWr3vRLKET4
         jNLNhm7Z1gCnThgWMSbbPMfz0bpQcVCsf9W2MPrzkfXW9AUceDJkvmH0NjwJ9s9zrA
         H3ZSmA0WR0C5+M+zmXqJ1SZ6AXXocy3epUyM664c=
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
References: <b86d16cc-e3b1-0db3-f544-9f630572126c@ideasonboard.com>
 <67107267-69c8-d87d-6579-5e7dac0400fb@xs4all.nl>
 <a9325fd6-8f14-ced5-97c4-3d05dc7ab150@ideasonboard.com>
 <7abd695a-4a6d-e447-59d0-cf359c319a77@xs4all.nl>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: vb2_queue type question
Message-ID: <0cea2812-7f04-e081-728c-8b39308ff0f9@ideasonboard.com>
Date:   Tue, 30 Mar 2021 11:18:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <7abd695a-4a6d-e447-59d0-cf359c319a77@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 26/03/2021 12:18, Hans Verkuil wrote:

> The only thing that you do is update the queue type when you set the
> video or metadata format. When you start allocating buffers the queue type
> of the last set format is used. At that moment any attempt to set the format
> to another type will fail since vb2_is_busy(queue) will be true.
> 
> So only the s_fmt ioctl will change the type. The g/try_fmt ioctls just must
> keep working as-is.

I noticed that v4l2-compliance complains about this. It first tests the 
format ioctls for both video and metadata buffers, and the last s_fmt is 
for metadata. Then it tests buffer ioctls, and reqbufs for video buffers 
fails as the queue is in metadata mode, not video mode.

I added a custom .vidioc_reqbufs function to the driver which sets the 
queue type and then calls vb2_ioctl_reqbufs normally. This makes 
v4l2-compliance pass.

But is that correct change, or should v4l2-compliance be changed?

  Tomi
