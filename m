Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6EAF17E103
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2020 14:25:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726477AbgCINZQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Mar 2020 09:25:16 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:45549 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726384AbgCINZP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 9 Mar 2020 09:25:15 -0400
Received: from [192.168.2.10] ([46.9.234.233])
        by smtp-cloud9.xs4all.net with ESMTPA
        id BIP7jBFEY9Im2BIPAjRvs4; Mon, 09 Mar 2020 14:25:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1583760314; bh=hKDy+C3Ikv9R1QZiwzp9SkY9D3GxxOgw1R/Gu2iW8Ww=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=S6YEJ7B23ZoYOsthXYcWlLoaBrKhDOLBdqJiNr6W1ROkgnX5WTeVtlvrAM8Vje4MR
         gtfjsfCzlDkEbgSb1gPTH3aS0aUgPrhNHfDOBUmxpzC+/jo9Qf8hiwD4ZPQYHsgigB
         mQKFv8GgYIvPYqY4KNq7R8dD1Z4GpH0JGirwyW2kAKNayYrVH3lLfgqWSZWXcB4DXQ
         B39SHV5YJbatbFOg9F0MviUPG4JnJcAsHxO/ZMemry+6z3Uhivu8+7uk9KVhzFDE0W
         R7RRPFSfeuk5xKIKmUZwUbDtWjwuSmkAUTdoYfZj2+8fie0zL9WMiw2gbpfi+sLvp9
         zX4rHULkHPTDA==
Subject: Re: [PATCH v4 0/3] v4l2-dev/ioctl: Add V4L2_CAP_IO_MC
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Helen Koike <helen.koike@collabora.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
References: <20200306163935.805333-1-niklas.soderlund@ragnatech.se>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <30dd9788-707d-cb49-b61a-d499fee2d477@xs4all.nl>
Date:   Mon, 9 Mar 2020 14:25:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200306163935.805333-1-niklas.soderlund@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfBYZ6WWAwA9lLBC3PKJ8LkpEuRakzd2M72gQLv3CYXLxiKj60vtxTWXb9RygZX/M2GHT/+4X8nTrL5/kSjb9P6eRpzUoW/ikIQzOpdgPOoKdZFNhHHo5
 wtBYqabNVTUhUJuP2dXxR414uIS9MhzAUXrMonFjXoubVZjt9EviJ7K2977dKuqaAGYHhmqYXIXzMk0zPGyPL1iJ9FRP5EYhxLnBthyiEJwsAneZwJ/OS30i
 0e3Yvw4nkse5pDQD0M1Exe+Zfao/AwL3C5a+fJBLGiXus0AN/q2Y6Zo+9U+RYGyqmY8s4tNuB144xnIBjWZWtprEmqPHobuClqHzJPVDBpQo5W6nT7MgDIJ/
 6p1ZRDYZ0TobrXx+mwurP0NNqUCIFoRwoOqLH6xc3kUaw4M8Diw=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 3/6/20 5:39 PM, Niklas Söderlund wrote:
> Hi,
> 
> This series aims to reduce the amount of boiler plate code in video
> device drivers who's inputs and/or outputs are controlled by the Media
> Controller instead of the V4L2 API.
> 
> Patch 1/3 adds a new video device capability flag V4L2_CAP_IO_MC which
> if set provides helper implementations for the enum inputs and outputs
> ioctrls freeing the video device driver from the need to implement them.
> 
> Patch 2/3 and 3/3 converts the R-Car VIN and Intel IPU3 drivers to use 
> the new default handlers and capability flag and delete the now  
> redundant boiler plate code. I'm sure more video device drivers
> can make use of this new flag but as I can only test on these two
> platforms I have limited my changes to those.

Can you add a patch that sets this for vimc as well? That's easy to test,
and helps adding compliance tests for this to v4l2-compliance.

Regards,

	Hans

> 
> Niklas Söderlund (3):
>   v4l2-dev/ioctl: Add V4L2_CAP_IO_MC
>   rcar-vin: Make use of V4L2_CAP_IO_MC
>   staging/intel-ipu3: Make use of V4L2_CAP_IO_MC
> 
>  .../media/uapi/v4l/vidioc-querycap.rst        |  6 ++
>  .../media/videodev2.h.rst.exceptions          |  1 +
>  drivers/media/platform/rcar-vin/rcar-v4l2.c   | 17 +-----
>  drivers/media/v4l2-core/v4l2-dev.c            | 25 ++++++--
>  drivers/media/v4l2-core/v4l2-ioctl.c          | 57 ++++++++++++++++--
>  drivers/staging/media/ipu3/ipu3-v4l2.c        | 60 +------------------
>  include/uapi/linux/videodev2.h                |  2 +
>  7 files changed, 84 insertions(+), 84 deletions(-)
> 

