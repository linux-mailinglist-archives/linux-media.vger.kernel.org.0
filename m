Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E670E2A7A4E
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 10:19:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730145AbgKEJTL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 04:19:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726371AbgKEJTL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Nov 2020 04:19:11 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C784CC0613CF
        for <linux-media@vger.kernel.org>; Thu,  5 Nov 2020 01:19:10 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 61530B93;
        Thu,  5 Nov 2020 10:19:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1604567946;
        bh=4SVIyNC7fF2x1a84grCvIts8TeUX6eJZdxFQa4KTXE4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lHGJ5M2PDYC4jBNXvOXovPCbyleNip1W/gJ6odfjLxQxeLqhdEKkURgh59OlmfF3x
         FoHciN0d2E7fTAfLeOl7PfKmL9FJDhKYmK9wRG3b7pkpeh7RmEmh0oalG7QSrYNOw9
         O+bwJCIks16dOP39AfD0tadloVAi713ShhniFryc=
Date:   Thu, 5 Nov 2020 11:19:05 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Gregor Hlawacek <g.hlawacek@hzdr.de>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: Philips Monitor with webcam
Message-ID: <20201105091905.GD3988@pendragon.ideasonboard.com>
References: <51207fd712e3c1001b80c6642021b1a5d5763ade.camel@hzdr.de>
 <20201104170233.0d405dff@coco.lan>
 <59f848e83354ad72c11dacaf571f20a8084baf58.camel@hzdr.de>
 <20201104174554.4bbec36a@coco.lan>
 <b8fcc03ed79873f9e55ab394b4b95140ab8b215b.camel@hzdr.de>
 <20201104210155.353a0d6a@coco.lan>
 <40a643d5fd9b6dd387d9cbde3e5ba1796b282f6a.camel@hzdr.de>
 <20201104221148.4d5c644d@coco.lan>
 <20201104212454.GF29958@pendragon.ideasonboard.com>
 <73b62785d882113351d0e69e3b552f0f271e4f2d.camel@hzdr.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <73b62785d882113351d0e69e3b552f0f271e4f2d.camel@hzdr.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Gregor,

On Thu, Nov 05, 2020 at 08:41:27AM +0100, Gregor Hlawacek wrote:

[snip]

> Hi Mauro and Laurent
> 
> @Mauro:
> 
> I think there is a confusion, which might be my fault as I talked about
> a chicony cam in the external monitor. The chicony cam that shows up as
> video0/1 is my internal laptop camera which is working fine. The
> problematic one is the sunplusIT camera which has a chicony usb
> identifier (0412). This is connected to video2-5 and also the one for
> which I reported the above information.
> 
> @Laurent:
> 
> lsusb -v -d 0412:612b:

[snip]

Thank for the information. Nothing strikes me as weird. Could you

- Set the uvcvideo trace parameter to 0xffff:

  sudo echo 0xffff > /sys/module/uvcvideo/parameters/trace

- Unplug and replug the monitor
- Open the video devices in turn with v4l2-ctl (use the video device
  nodes /dev/video* directly, not the by-id links)
- Send send the output of 'sudo dmesg'

You can clear the kernel log with 'sudo dmesg -c' before doing so to
avoid including unrelated data (or just strip it from the dmesg output
manually when copying it to an e-mail).

-- 
Regards,

Laurent Pinchart
