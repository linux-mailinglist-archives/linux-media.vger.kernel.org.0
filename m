Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2AE730A3CA
	for <lists+linux-media@lfdr.de>; Mon,  1 Feb 2021 09:58:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232573AbhBAI5u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Feb 2021 03:57:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232549AbhBAI5r (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Feb 2021 03:57:47 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37126C061573
        for <linux-media@vger.kernel.org>; Mon,  1 Feb 2021 00:57:07 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id a1so15667007wrq.6
        for <linux-media@vger.kernel.org>; Mon, 01 Feb 2021 00:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastree3d-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=OA3N2t3Ohb9z6URPlOCtegUcqeV/Q8fY1vkYAtr9Iuc=;
        b=cmbqadwH2TUvtscMIrVy4Pf3RyO3nHvTb2RBAcxt6oTIUh5hybTzWeU135/iQmPFML
         mUAlx5BvNNUD6dRkQ47juRC6AEnK3999YAqNE6qbuLBb1Ign7HR2E34ghQS0eM/gXjZH
         U/I3JKcL/qZYRzSueQ3SsnBo4/KuIc6XM0Zzm/tTleDmU2S3rJ2LtFZE9cAobbnQruB5
         CGwzVice58TyvGKUP7NVzV69koFTyivrr4TxBRm2f+d3dbX8G+VdRAUHIIsQYuORaoqT
         8Hb3J/MVjlfqmrc6V5XZzAaQnIp0gbc3BDWDucF1yaIZD425vbQvQrzYtzPoisW/Ovf+
         cIXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=OA3N2t3Ohb9z6URPlOCtegUcqeV/Q8fY1vkYAtr9Iuc=;
        b=romBUGqKQ3rz/WYMi/zLlcPh8c9dNJLPg/5XfgU7vV0XIng9yqmE0pPm7rK3YxeUnp
         eN7kGAN1nrfTQFweOb2cE8o41Nr7GHJxeVuGshR1K/bppWP2nS8HDIaVF0rLtiCTOYj8
         6AhAyVb5hLVDuCeOS0fyB8XfqtRL8gQA6nhOWfZiKIozF8coPzoJ7agXWKwow1HKrLfG
         th5BRIAiGeWgYJHJRx3Pr9H5tr8YIq75FjKJwCLHXcji89/08wQd6bSttzybwwqXm6eM
         XOhQc3FbWG5Oru9ohjkQ6qxPyxtHbXEB4FLROhsUjjWqk9etaaiAkaSTfG7EnV27e5KO
         Dfkw==
X-Gm-Message-State: AOAM530QtYNqJz+P0mA6T/3q2QjEE0v9+swbDr9wDyV1C9ez87wEB4zx
        XrutXmYu1YuKpW7p1dpdOm7QSFRMsheF
X-Google-Smtp-Source: ABdhPJxCl/DXNeQiTu5YmJMCE+8XtWrSlaPpZv8tS1FtkKEJ2yZi6rf6KkPd52xezAY46yKKRilUgQ==
X-Received: by 2002:a05:6000:1374:: with SMTP id q20mr16337774wrz.44.1612169825933;
        Mon, 01 Feb 2021 00:57:05 -0800 (PST)
Received: from [192.168.2.101] (72.233.197.178.dynamic.wless.lssmb00p-cgnat.res.cust.swisscom.ch. [178.197.233.72])
        by smtp.gmail.com with ESMTPSA id s203sm2343058wms.25.2021.02.01.00.57.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Feb 2021 00:57:05 -0800 (PST)
Subject: Re: v4l: status of 'add support for multiplexed streams' patch
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     niklas.soderlund+renesas@ragnatech.se, linux-media@vger.kernel.org,
        vishal.sagar@xilinx.com
References: <ad1f038f-f067-89f6-9dc6-4b423d719fc5@fastree3d.com>
 <20210129222654.GL32460@paasikivi.fi.intel.com>
 <YBdZJpTfgiipt3IK@pendragon.ideasonboard.com>
From:   Adrian Fiergolski <adrian.fiergolski@fastree3d.com>
Message-ID: <b0b2ce9e-50f9-4a01-8a07-0bf71e53abf4@fastree3d.com>
Date:   Mon, 1 Feb 2021 09:57:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YBdZJpTfgiipt3IK@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Thank you for all the feedback.

I have patched linux-xlnx [1] kernel and media-xlnx [2] such I can
continue my project.

From Niklas I learned that video routing activities in the upstream
kernel have been somehow halted. It's a pity. As a fresh guy in this
particular topic one week ago, I was surprised: I found on Internet
patches from last 2-3 years, the work seemed to be quite advanced, but
it hasn't been merged to the upstream yet. From my side, I think video
routing is important for targets processing heavily video streams, like
FPGA accelerators. Unfortunately, due to my time constraints these days,
I can't help in pushing the changes.

Regards,

Adrian

[1] https://github.com/Xilinx/linux-xlnx
[2] https://github.com/Xilinx/meta-xilinx/pull/32

On 01.02.2021 at 02:28, Laurent Pinchart wrote:
> Hello,
>
> On Sat, Jan 30, 2021 at 12:26:54AM +0200, Sakari Ailus wrote:
>> On Mon, Jan 25, 2021 at 03:08:56PM +0100, Adrian Fiergolski wrote:
>>> Dear Niklas,
>>>
>>> Thank you for your 'v4l: add support for multiplexed streams' patch [1].
>>>
>>> What is the status of merging your development with v4l-utils? Version
>>> 1.16.5 doesn't provide --get/set-routing options. Also in the master of
>>> v4l-utils I haven't found your code.
>>>
>>> What is the current way of changing routing the video switches (e.g.
>>> xilinx-axis-swtich which is not yet in the mainstream kernel)?
>>>
>>> [1] https://lwn.net/Articles/782479/
>> I seem to have something here:
>>
>> <URL:https://git.retiisi.eu/?p=~sailus/v4l-utils.git;a=shortlog;h=refs/heads/routing>
>>
>> It hasn't been tested for some time though. The header update patches need
>> to be reworked but the media-ctl + libv4l2subdev patches probably rebase
>> just fine.
> I've recently rebased the latest version of the patches (exclusing the
> changes to the Renesas drivers) that was posted to the linux-media
> mailing list, and have pushed the result to 
>
> 	git://linuxtv.org/pinchartl/media.git muxed-streams
>
> This has only been compile-tested so far, and I hope to test it on real
> hardware soon.
>
