Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 862141A6BF8
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2020 20:16:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387678AbgDMSQP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Apr 2020 14:16:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2387623AbgDMSQO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Apr 2020 14:16:14 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AE35C0A3BDC
        for <linux-media@vger.kernel.org>; Mon, 13 Apr 2020 11:16:12 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id g12so3043719wmh.3
        for <linux-media@vger.kernel.org>; Mon, 13 Apr 2020 11:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=ULsG7F8uaB8tfjIVUCHILBjlbKNa8z5qRsR43jfQh1M=;
        b=YYXLg1E71G+WNTB9bpwYYndCmfifwIaXYIwvt0t4xbZ54W2ZOJWbf37fLvFzfWKigy
         dBO7Uk8t04Ks/qrs+/gB+d3I7da+Orgmhs/yA/P/sQEWnBPM6P+QPyN+PZi0oKaf9ug8
         zkXKlAXZ8ebPiCQEMBZVX/Rhr6lhV2vBZo07GcLr9OOGEilZMu8caEUhLaGwFAlsy4zN
         oCBHcfHPYyTnZizZWWTE4ywWKTgXy8v8F7BJgMnNv50+K+Nr/apwIztjof36UKjitcbT
         bONRBHgNXJ52ZEcCicxbxTenl/9jAAZTgNmLPVf8xMzEzagTkP2A2iSVb90qFsyz6o/b
         NV6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=ULsG7F8uaB8tfjIVUCHILBjlbKNa8z5qRsR43jfQh1M=;
        b=JORu3eQUzBRsfkYCVAiSbcaqx1H5SUJXrvDdisJH3AnN2H9leKReVs9HpYluiWOmoD
         M0P9KTw8U42USNkH48WVDFGcBP9WrfOxT80Ce5BMUJuXAVtnpv2UVFC6HhJy1BJEzST0
         0iUflr7+8gh2cEpeLTzcY+yhcMcXsnI/9fVgw+eTqQlKqOb3BTF4AyuUWyFgt3aN6axw
         03swSqbJIFVdqgweLew3Mi1cMuN6aHX/cI8Lviarq8GpGfmgc3hdD6EXlcvwTY5XyvHI
         9pb/JLjjpqGKqrH0V7z6rSzWK/StkewL6FIeQ5gaFz9DH7SsAbFj9BvCrJkv0wGIv6Di
         irJQ==
X-Gm-Message-State: AGi0Pua8l1JnvlPrikqnU7Q/B3ud31hogx6oqtgm8jdrK+mruX8/EHRb
        yAwy/McBI69fC6jMFO3SIwD7Rv5tars=
X-Google-Smtp-Source: APiQypKE788u+741KrhE6SvuhjhpOQwYZmwDGD1epVrjq6EvBDpv2CzWguhg756zvYftNzRMUPvUEQ==
X-Received: by 2002:a7b:c1d4:: with SMTP id a20mr20457984wmj.111.1586801771100;
        Mon, 13 Apr 2020 11:16:11 -0700 (PDT)
Received: from [172.30.88.42] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id r3sm16341261wrm.35.2020.04.13.11.16.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2020 11:16:10 -0700 (PDT)
Subject: Re: [PATCH 0/2] media: imx6: Support complex external topologies
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Philipp Zabel <p.zabel@pengutronix.de>
References: <20200413011416.2355-1-laurent.pinchart@ideasonboard.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <073c445b-30e7-9ba9-9163-9e7615449e7d@gmail.com>
Date:   Mon, 13 Apr 2020 11:16:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200413011416.2355-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

I've already done this work, see [1]. The fwnode related changes are 
awaiting an ack from Sakari.

It fixes this stuff the right way in my opinion. The patchset relies on 
the subdevs to create links to their discovered upstream subdevs, via 
the subdev notifier's bound callbacks. In other words it comprehensively 
accomplishes the distributed link creation that you're partially doing here.

If you were to implement .get_fwnode_pad in the smiapp driver, and use 
patchset [1], I think it should resolve the issues with smiapp subdev, 
or any other subdevs with complex internal topologies (another example I 
can think of is the adv748x). Specifically see [2] which will create the 
link to smiapp in the mipi csi-2 receiver's bound callback with the help 
of a new helper function imx_media_create_fwnode_pad_link().

Steve

[1] https://patchwork.linuxtv.org/patch/61927/
[2] https://patchwork.linuxtv.org/patch/61936/


On 4/12/20 6:14 PM, Laurent Pinchart wrote:
> Hello,
>
> This small patch series adds support to the i.MX6 IPU CSI driver for
> external (on-board) devices that exhibit complex topologies. My use case
> is a CSI-2 camera sensor that has a single DT node (as an I2C device)
> and creates two V4L2 subdevs. "Complex" may thus be a bit of an
> exageration, but the series nonetheless makes such a sensor usable with
> the driver.
>
> There are two issues, fixed by two patches. Patch 1/2 removes the
> assumption that OF port ids and pad indices are equivalent. This holds
> true in many cases, but is incorrect in my case, with the topology being
>
> +------------+       +--------------+       +---------------------+
> |  Sensor   _|       |_   Sensor   _|       |_                    |
> | Subdev A |0| ----> |0| Subdev B |1| ----> |0| imx6-mipi-csi2 ...|
> |           ¯|       |¯            ¯|       |¯                    |
> +------------+       +--------------+       +---------------------+
>
> while the sensor has a single DT node with a single port. The IPU CSI
> driver then tries to connect 'Sensor Subdev B':0 to 'imx6-mipi-csi2':0,
> which isn't right.
>
> The fix isn't perfect, as we ideally need media entity operations to
> handle the translation between port ids and pad indices. Nonetheless,
> the heuristic in patch 1/2 should cover most, if not all, use cases and
> is in my opinion a good way forward.
>
> Patch 2/2 then stops creating links between external entities. The IPU
> CSI driver iterates over the list of subdevs registered with the V4L2
> device, and creates links based on the OF graph for all of them. That's
> fine for devices internal to the i.MX6, but is oversteps the driver's
> responsibility as links between external entities are supposed to be
> handled by their respective driver. In my use case, the driver attempts
> to link 'Sensor Subdev A' by checking OF graph connections in DT, which
> results in 'Sensor Subdev A':0 being linked to 'imx6-mipi-csi2':0. The
> patch skips external entities for link creation, which fixes the issue.
> The link between the closest external entities and the internal entities
> are still created by the IPU CSI driver as part of link creation for all
> internal entities.
>
> Laurent Pinchart (2):
>    media: staging/imx: Don't assume OF port id equals pad index
>    media: staging/imx: Don't create links between external entities
>
>   drivers/staging/media/imx/imx-media-csi.c     | 29 ++++++++++-
>   .../staging/media/imx/imx-media-dev-common.c  |  7 +--
>   drivers/staging/media/imx/imx-media-of.c      | 52 ++++++++++++++++---
>   drivers/staging/media/imx/imx-media.h         |  1 +
>   4 files changed, 75 insertions(+), 14 deletions(-)
>

