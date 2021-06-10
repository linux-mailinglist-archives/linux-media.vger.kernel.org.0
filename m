Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6EF63A28C1
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 11:52:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230250AbhFJJx6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 05:53:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229778AbhFJJx4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 05:53:56 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 308F4C061574
        for <linux-media@vger.kernel.org>; Thu, 10 Jun 2021 02:51:59 -0700 (PDT)
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CF94B8D4;
        Thu, 10 Jun 2021 11:51:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623318718;
        bh=gT43eHRPeHONO5zMzdH0vRFy4WJi7/Qoyn+TKbnnc5o=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=KOoe+NImbSQVcoSQibYIc6IGtnrPqHxR0+qxK/Qv+3SaJB/phE62GxHbzipb2UOXz
         GwJNtXSnSQHVqhYJ1LJKvUyXijz2hnnscdeeL3CCv6VZXfhKaKWzYjMSejPzj+EaHi
         QDpPAu540bkEBQCWjU6opvnQMcd8lo/LPhEiHiOQ=
Subject: Re: [PATCH v3 0/1] media: v4l2-subdev: add subdev-wide state struct
To:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20210609100228.278798-1-tomi.valkeinen@ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <9545ec25-4fea-b7d6-b02c-5beb1242678b@ideasonboard.com>
Date:   Thu, 10 Jun 2021 12:51:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210609100228.278798-1-tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

On 09/06/2021 13:02, Tomi Valkeinen wrote:
> Hi,
> 
> v3 of the patch. I rebased on top of latest linux-media, and applied the
> semantic patch. I've addressed Laurent's comment (fix kfree, kernel doc
> fixes, return cleanup).
> 
> v2 can be found from:
> 
> https://lore.kernel.org/linux-media/20210527094244.617473-1-tomi.valkeinen@ideasonboard.com/
> 

I posted a few fixes to this as a continuation to the series (patches 
2/5 - 5/5) in an ad-hoc manner, to help reviewing and avoid sending the 
half-a-megabyte patch.

All those can be squashed to the original patch, or I can send a proper 
v4 after getting acks for the changes.

  Tomi
