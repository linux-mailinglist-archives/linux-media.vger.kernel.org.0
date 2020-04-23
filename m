Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C48EE1B5879
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2020 11:46:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726335AbgDWJqO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 05:46:14 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:53097 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725884AbgDWJqN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 05:46:13 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id RYQojLSRU7xncRYQtjQ1zr; Thu, 23 Apr 2020 11:46:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1587635171; bh=QsewHpIjPEisPh99R52bN7rAGArXGmEBXKBCKCULK4I=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=V7qkaFrEc0rhNL6u3iKenChjolfpgPXRjwxQmxdBHSe6IPVU3tgCe6aW1dnEkXA25
         9eFGZTXIwZOTLUDsLdx7ZWek4l91Sp53d+bBKJY1/5SwXB1KMM1VMS5mwBjBI6ojWk
         sT19Dx1/u3i6wTRJSK7NsExJkGnUANqg/T2BzD4yV+Zv9R6mdkg7WtLppfT0Ufs+jd
         v8leiJiLqoLSKRxjecjTWjm57GOmTysBJbZyrK2xEqlFE0JAMTdDaWYtqfLf0jrNI+
         kElgUdhnUzXAPS8yNC1lZQbMHs3dSvKzhrluNB/ELnf3oso5+Yoy97HASrKEtaFOJl
         DNK9qajATZDOw==
Subject: Re: [PATCH v8 0/6] v4l2-dev/ioctl: Add V4L2_CAP_IO_MC
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Helen Koike <helen.koike@collabora.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20200421135743.1381930-1-niklas.soderlund+renesas@ragnatech.se>
 <20200422172242.GA18075@pendragon.ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <86fd12d1-e69f-fb7a-55e5-254ca4dfc923@xs4all.nl>
Date:   Thu, 23 Apr 2020 11:46:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200422172242.GA18075@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfA2wOu1XA6xI76JGa1rhdAcuoGQv6qsPZBnMV28PMAvmcyXflhLJlxZ4pQ2rN9Pbelweiwy2qz1kdGsnI7LatWmpyfBCg+L0yquFMetxUIcyAn6ItdZB
 fUOBF5xaf5N6WQswnlVH6QQwZNHtBoIdFwuUl1qVomY0axg4kbaaqNs126DN256IEhZQkYb9gjp47jqzx1E9PaZiQRiPAIjRvDXHG1B4iDJ6grgFyCfgA5mI
 JHQCXJ/CLLthWR5bLMuLA/VO/K4qzC1c6N/kcGeVJNLTOc66EWhDQlxzNHt8o1Je3wVbMXa5S1vvF7THaXBjEGR9/+WxgP1+BOszPWtnA8mtX9TI2qI83FdC
 Nql5gkCyviy9fEHLOD9e6mfT6T55OXDGrR55H7ZmoyTvo5ikJ9J0iW7hOs3hi/DvqhbUgGpm
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22/04/2020 19:22, Laurent Pinchart wrote:
> Hi Niklas,
> 
> (With a question for Hans below)
> 
> Thank you for the patches.
> 
> On Tue, Apr 21, 2020 at 03:57:37PM +0200, Niklas Söderlund wrote:
>> Hi,
>>
>> This series aims to reduce the amount of boiler plate code in video
>> device drivers who's inputs and/or outputs are controlled by the Media
>> Controller instead of the V4L2 API.
>>
>> Patch 1/6 adds a new video device capability flag V4L2_CAP_IO_MC which
>> if set provides helper implementations for the enum inputs and outputs
>> ioctls freeing the video device driver from the need to implement them.
>>
>> Patch 2/6 fix initialization of reserved fields in the cx18 and ivtv 
>> drivers which becomes a problem in 3/6 where Laurent adds mbus filters to
>> VIDIOC_ENUM_FMT.
>>
>> Patch 4/6, 5/6 and 6/6 converts the R-Car VIN, Intel IPU3 and VIMC
>> drivers to use the new default handlers and capability flag and delete
>> the now redundant boiler plate code. I'm sure more video device drivers
>> can make use of this new flag but as I can only test on these two
>> platforms I have limited my changes to those.
>>
>> A separate patch to v4l-utils have been posted as [1] to add a
>> test for this feature in v4l2-compliance.
>>
>> This version have been rebased to latest media-tree to account for the 
>> large shuffles of files. It has also replaced patch 2/6 with a different 
>> version that addresses both cx18 and ivtv instead of only ivtv.
> 
> It looks like everything has been reviewed. Hans, do you see any
> remaining blocker, or will you take it in your tree and send a pull
> request ?

Hmm, I'm getting v4l2-compliance errors when testing with vivid et al.
Looking into that now.

Regards,

	Hans

> 
>> 1. [PATCH 0/2] v4l2-compliance: add tests for V4L2_CAP_IO_MC
>>
>> Laurent Pinchart (2):
>>   media: pci: Fill v4l2_fmtdesc with designated initializers
>>   media: v4l2: Extend VIDIOC_ENUM_FMT to support MC-centric devices
>>
>> Niklas Söderlund (4):
>>   v4l2-dev/ioctl: Add V4L2_CAP_IO_MC
>>   rcar-vin: Make use of V4L2_CAP_IO_MC
>>   staging/intel-ipu3: Make use of V4L2_CAP_IO_MC
>>   vimc: Make use of V4L2_CAP_IO_MC
>>
>>  .../media/v4l/vidioc-enum-fmt.rst             | 16 ++++-
>>  .../media/v4l/vidioc-querycap.rst             |  6 ++
>>  .../media/videodev2.h.rst.exceptions          |  1 +
>>  drivers/media/pci/cx18/cx18-ioctl.c           | 22 ++++--
>>  drivers/media/pci/ivtv/ivtv-ioctl.c           | 26 +++----
>>  drivers/media/platform/rcar-vin/rcar-v4l2.c   | 40 ++++++-----
>>  .../media/test-drivers/vimc/vimc-capture.c    | 14 +++-
>>  drivers/media/v4l2-core/v4l2-dev.c            | 25 +++++--
>>  drivers/media/v4l2-core/v4l2-ioctl.c          | 70 +++++++++++++++++--
>>  drivers/staging/media/ipu3/ipu3-v4l2.c        | 64 ++---------------
>>  include/uapi/linux/videodev2.h                |  5 +-
>>  11 files changed, 180 insertions(+), 109 deletions(-)
>>
> 

