Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 492A96A92BE
	for <lists+linux-media@lfdr.de>; Fri,  3 Mar 2023 09:41:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229831AbjCCIle (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Mar 2023 03:41:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbjCCIle (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Mar 2023 03:41:34 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5071933462
        for <linux-media@vger.kernel.org>; Fri,  3 Mar 2023 00:41:33 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E6E61735;
        Fri,  3 Mar 2023 09:41:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1677832891;
        bh=G6KnivOfMupW94IBYZaO1a9ZiuBjOFRgqh750u38K3k=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=LxsE9UmpZCjhVBXVYiAplRmjQQiXcWyjQZCrLmthX6baw26Fc2TepkhsKQilooLGB
         8dzMSZmKNiSdRKdnQREIIUdkRA1Fo8k53mdLs0JpVuki/Fk4Mw/aZGarF2052hjwAq
         AKeRm1iueaY/Sh1+x5SLyJPIe/Kwg3lQ47+AsZe4=
Message-ID: <12e3fcc5-1a54-1313-8d52-5618b87f09d1@ideasonboard.com>
Date:   Fri, 3 Mar 2023 10:41:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/1] media: v4l: subdev: Make link validation safer
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, hdegoede@redhat.com
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Kate Hsuan <hpa@redhat.com>
References: <441f2951-402b-0f3c-5ea6-8d6df3f3e894@redhat.com>
 <20230302202219.846011-1-sakari.ailus@linux.intel.com>
Content-Language: en-US
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230302202219.846011-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 02/03/2023 22:22, Sakari Ailus wrote:
> Link validation currently accesses invalid pointers if the link passed to it
> is not between two sub-devices. This is of course a driver bug.
> 
> Ignore the error but print a debug message, as this is how it used to work
> previously.
> 
> Fixes: a6b995ed03ff ("media: subdev: use streams in v4l2_subdev_link_validate()")
> Reported-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> Hi Hans,
> 
> Could you test this?
> 
> The bug is of course in the ImgU driver and this reverts to the old
> pre-streams behaviour. It silently fails instead of oopsing. The ImgU driver
> needs to be fixed and I think we could make this return an error at the same
> time. Right now I can't be sure the ImgU driver is the only one suffering
> from this, but if so, it's likely to be broken anyway.

Maybe it should be at least a warn? How do we catch other broken drivers 
otherwise?

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

