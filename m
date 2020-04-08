Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9298C1A2940
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2020 21:16:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728321AbgDHTQ2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Apr 2020 15:16:28 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:33767 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728209AbgDHTQ2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Apr 2020 15:16:28 -0400
Received: by mail-wm1-f67.google.com with SMTP id v8so723849wma.0
        for <linux-media@vger.kernel.org>; Wed, 08 Apr 2020 12:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=gOEESxtaQiD0IRRWM2FOpUuRRgo0wUifuQ6M0t+6b4A=;
        b=T5TFNViGexm+n1COL7WqB8dMi7GkihPJDSyhO1OZtdXv0Gc38TaZyr7TpCuTT1gMpX
         okEOdbXYzG3pQ38M/4Dqil4lbr0YnTZJzoQXXi8xGPynzeEuOhP3gLeZpkGEvRWo1ZgG
         xG0QEofPX22bgC0pjMZniIGAfTHqPEi3vrL+IHsttTte17QgMo3mrPhVF3F7hNHAX+Qr
         yxoncVIduecn9ieIBE5wodsEtFGWxmAjKrFX39ZUcfhMTXIsbjUK4P7wC3BMuGj0RHvY
         SfldmuWsvuRuy5h4y1rVBaeVi0t3/lKrXnm86Lo0GOY3oHTTlxvQ0w5p0LGeDCHRVkMd
         wgHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=gOEESxtaQiD0IRRWM2FOpUuRRgo0wUifuQ6M0t+6b4A=;
        b=PnhzcLivX3ofjTQaV0eLcqFuMacpvEgi7SFrSGpgsG5B1/f9ELEXOoBSxkk24eubjI
         iiELZPz7gjYYahgckSBifDt/2yev/o4RhVeiep9f8sf3Ys+2HF2B4P7YbIkeFzBMtNDF
         4/66QaZXb4KPqdEWOBtpACb2AeR2d2WPYULzoaTO8LwOoaNMzk8Cgw7ezFT26nGntfDh
         Z0yI4Me93TB8k59FBj9603yihPnmY038Q8iB+v6N3Wh1hcGFy4tagovvK4RomPpolRo7
         nO0LSSAch68MOTw9P6GEkIqR8y/hB8JDL952Iu4Eby6w+dj4xZGHbswP60AmP+MQT7R5
         Vl2w==
X-Gm-Message-State: AGi0Puakqn52CC9/jRFCxKA5Fys6+XwH9bD+Klfseujfdiw3vtKDcAP0
        F7YU8tLAK2zr7mVAtfMIg+ZQ+4UIywk=
X-Google-Smtp-Source: APiQypJlGLCz4vc7mjgAwOR5Omgs7gzpWqNJYWebgGMUPX9DmxF4VwIiBVLDVyZk0vIZsqxrIBCMcw==
X-Received: by 2002:a7b:cfc9:: with SMTP id f9mr6358105wmm.137.1586373386256;
        Wed, 08 Apr 2020 12:16:26 -0700 (PDT)
Received: from [172.30.89.26] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id 145sm681420wma.1.2020.04.08.12.16.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2020 12:16:25 -0700 (PDT)
Subject: Re: [PATCH 1/4] media: imx.rst: Fix the MIPI CSI-2 virtual channel
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>
References: <20200408123215.2531-1-festevam@gmail.com>
 <c069af02-af3c-9527-eed4-839681c73ce6@gmail.com>
 <CAOMZO5BN6igxVGRnOnftv=PGZWi=2Qb2Th0fhBon93Fk-zWj+w@mail.gmail.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <a23d2559-5498-75bb-0bce-3bc11bb6b5ae@gmail.com>
Date:   Wed, 8 Apr 2020 12:16:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAOMZO5BN6igxVGRnOnftv=PGZWi=2Qb2Th0fhBon93Fk-zWj+w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 4/8/20 10:24 AM, Fabio Estevam wrote:
> Hi Steve,
>
> On Wed, Apr 8, 2020 at 1:35 PM Steve Longerbeam <slongerbeam@gmail.com> wrote:
>
>> change to:
>>
>> media-ctl -V "'ipu1_ic_prpenc':1 [fmt:ARGB8888_1X32/800x600]"
> If I make this change I get:
>
> # v4l2-ctl --stream-mmap -d /dev/video1
> [  501.143012] ipu1_ic_prpenc: capture format not valid
>                  VIDIOC_STREAMON returned -1 (Invalid argument)
>
> Going back to the original example:
>
> #  media-ctl -V "'ipu1_ic_prpenc':1 [fmt:AYUV32/640x480]"
> # v4l2-ctl --stream-mmap -d /dev/video1
> <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 30.03 fps
>
> Changing only the resolution:
>
> #  media-ctl -V "'ipu1_ic_prpenc':1 [fmt:AYUV32/800x600]"
> # v4l2-ctl --stream-mmap -d /dev/video1
> [  658.358246] ipu1_ic_prpenc: capture format not valid
>                  VIDIOC_STREAMON returned -1 (Invalid argument)
>
> Any ideas?

You have to set a format at the capture interface as the last step 
before streaming can start:

# v4l2-ctl -d /dev/video1 --set-fmt-video=pixelformat=RGB3


or whatever RGB format is supported. It's enough to sinmply set one parameter, such as width or height or pixelformat. The driver will propagate the reset from the source subdev ipu1_ic_prpenc.

The capture interface used to be automatically propagated from the source subdev, but now it must be done by userland.

Steve

>
> These are the lines I am currently using as per your feedback:
>
>     # Setup links
>     media-ctl -l "'ov5640 1-003c':0 -> 'imx6-mipi-csi2':0[1]"
>     media-ctl -l "'imx6-mipi-csi2':1 -> 'ipu1_csi0_mux':0[1]"
>     media-ctl -l "'ipu1_csi0_mux':2 -> 'ipu1_csi0':0[1]"
>     media-ctl -l "'ipu1_csi0':1 -> 'ipu1_ic_prp':0[1]"
>     media-ctl -l "'ipu1_ic_prp':1 -> 'ipu1_ic_prpenc':0[1]"
>     media-ctl -l "'ipu1_ic_prpenc':1 -> 'ipu1_ic_prpenc capture':0[1]"
>     # Configure pads
>     media-ctl -V "'ov5640 1-003c':0 [fmt:UYVY2X8/640x480]"
>     media-ctl -V "'imx6-mipi-csi2':1 [fmt:UYVY2X8/640x480]"
>     media-ctl -V "'ipu1_csi0_mux':2 [fmt:UYVY2X8/640x480]"
>     media-ctl -V "'ipu1_csi0':1 [fmt:AYUV32/640x480]"
>     media-ctl -V "'ipu1_ic_prp':1 [fmt:AYUV32/640x480]"
>     media-ctl -V "'ipu1_ic_prpenc':1 [fmt:ARGB8888_1X32/800x600]"
>
> Thanks,
>
> Fabio Estevam
>
>     # Setup links
>     media-ctl -l "'ov5640 1-003c':0 -> 'imx6-mipi-csi2':0[1]"
>     media-ctl -l "'imx6-mipi-csi2':1 -> 'ipu1_csi0_mux':0[1]"
>     media-ctl -l "'ipu1_csi0_mux':2 -> 'ipu1_csi0':0[1]"
>     media-ctl -l "'ipu1_csi0':1 -> 'ipu1_ic_prp':0[1]"
>     media-ctl -l "'ipu1_ic_prp':1 -> 'ipu1_ic_prpenc':0[1]"
>     media-ctl -l "'ipu1_ic_prpenc':1 -> 'ipu1_ic_prpenc capture':0[1]"
>     # Configure pads
>     media-ctl -V "'ov5640 1-003c':0 [fmt:UYVY2X8/640x480]"
>     media-ctl -V "'imx6-mipi-csi2':1 [fmt:UYVY2X8/640x480]"
>     media-ctl -V "'ipu1_csi0_mux':2 [fmt:UYVY2X8/640x480]"
>     media-ctl -V "'ipu1_csi0':1 [fmt:AYUV32/640x480]"
>     media-ctl -V "'ipu1_ic_prp':1 [fmt:AYUV32/640x480]"
>     media-ctl -V "'ipu1_ic_prpenc':1 [fmt:ARGB8888_1X32/800x600]"

