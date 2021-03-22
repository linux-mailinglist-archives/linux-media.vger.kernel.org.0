Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04035343C81
	for <lists+linux-media@lfdr.de>; Mon, 22 Mar 2021 10:18:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229865AbhCVJS1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Mar 2021 05:18:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229846AbhCVJSW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Mar 2021 05:18:22 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C80ECC061574
        for <linux-media@vger.kernel.org>; Mon, 22 Mar 2021 02:18:21 -0700 (PDT)
Received: from [192.168.1.136] (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 38E76AD6;
        Mon, 22 Mar 2021 10:18:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1616404699;
        bh=oIuOjnb9uXYybsuFSU0ACMrMg6BFEb4Uicoc8BYLmeo=;
        h=To:Cc:From:Subject:Date:From;
        b=apBxhoVDL+C2JGQf/fgQ1j3kQvs1QVbuTgBCavXy/o/f9a/9LQmFvWjxH/1/47lXt
         ZjOqwffVrCwgsHGC/Fp0snKzbH8Sr3JZcsi8cDHeanFzGcOte27wXdq/E2fdaSLuvo
         7X/qOZV7mIvK4h/t658h/q9eNhZQDu7jmhR8hs8U=
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: vb2_queue type question
Message-ID: <b86d16cc-e3b1-0db3-f544-9f630572126c@ideasonboard.com>
Date:   Mon, 22 Mar 2021 11:18:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

We were discussing this with Laurent and Sakari, I thought I'd ask if 
you have any feedback on this.

struct vb2_queue has 'type' field, so you can only use a queue for 
buffers of a single type. struct video_device has 'queue' field, so you 
can only use a single queue for a video_device instance.

TI's SoCs have a CSI-2 receiver, with a bunch of DMA engines. The HW 
doesn't care if we are currently capturing pixel buffers or metadata 
buffers (I don't have experience with other HW, but I imagine this 
shouldn't be a rare case). However, due to vb2_queue, the driver needs 
to decide which one to support, which limits the possible use cases.

I was browsing the code, and afaics the type field doesn't do much. It 
is, of course, used to reject queuing buffers of wrong type, and also 
(mostly in mem-2-mem code) to find out if functions are called in input 
or output context.

The latter one could be easily removed by just comparing the given queue 
pointer to a stored pointer (e.g. queue == priv->input_queue).

Do you see any problems if we were to change the type field to 
type_mask, allowing multiple buffer types per queue? Or even remove the 
vb2_queue->type. This raises some questions, like should a queue contain 
only buffers of a single type or can it contain a mix of buffers (I 
think it shouldn't contain a mix of buffers), or can a queue's type_mask 
contain both input and output types (I don't see why not).

An alternate which I tried was creating two vb2_queues, and switching 
the video_device->queue at runtime based on set_format. It kind of 
works, but I think the behavior is a bit unclear, and it might be 
difficult to catch all the corner cases.

  Tomi
