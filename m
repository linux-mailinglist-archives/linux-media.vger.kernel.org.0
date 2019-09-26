Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE6D9BF9B6
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2019 20:59:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728387AbfIZS7v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Sep 2019 14:59:51 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:36086 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728241AbfIZS7u (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Sep 2019 14:59:50 -0400
Received: by mail-io1-f65.google.com with SMTP id b136so9416989iof.3
        for <linux-media@vger.kernel.org>; Thu, 26 Sep 2019 11:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=iV62GtEq2ahl1ms4SbZAYufi9w9mr3d4Dtrs0FUiPNU=;
        b=CrKH1yuXeu9gm2Tfzli24lBCIwh9VddcZ6W1n62tvZfmSf0KjjU2J1QIit5I6YdD6v
         aeVK9U2hsBAymXKtpMv6yH7cfnT9rm6vI9SB5Pe4cygfaJnP+Uep4h9uHAxVIecKbxeH
         H6fRlvCaXKCCDpOlKkAyQnpiUEqyYh7DsGbqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iV62GtEq2ahl1ms4SbZAYufi9w9mr3d4Dtrs0FUiPNU=;
        b=IIeFR0h+D38WJe11EwAc62HTEHILZemjNlLlZF3U0IsEn0MM4O+1H8YeGV+mEmxasX
         27XIpKuOOdpv26Ak0zxqs1ACubIhkuREWtIZeOIFcjB3Pl5FTntpxduJMGgXfJfGbaME
         W6Go1Af2mcmk6VIsYt12Pl8gy0Cy+dfNIExaTnhaeP256/19A+zVfnKXVhaODYdQAyZq
         qtg8Kb0fgIH+X19SM/pRbFLotGrYH5+ZtI7E7kUvyFaRR4jghe1U+3DAo8CiH0VEVOy3
         KdB+/JvJmhlBpV5TXRjk1qUNxquaWWTMDJsC+OwmBYRIPGD+bRv8PHU9jTxjaur9oKBe
         GAcg==
X-Gm-Message-State: APjAAAXPjGkzWEX58w3M0J45qQ0HG5QRacuDaSNlMX/iTpr+Y9fUpyCt
        3XN8BlLzX+65H1Aca6lx67eRtg==
X-Google-Smtp-Source: APXvYqzhikX1iFlLchn8LxCtR8YdBw90Cph/n3Lm69KjbMBj5YbbqfTypvGThSZXi0NK4fkgqRtxsQ==
X-Received: by 2002:a02:ce2b:: with SMTP id v11mr4834069jar.134.1569524389435;
        Thu, 26 Sep 2019 11:59:49 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id d197sm1349003iog.15.2019.09.26.11.59.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Sep 2019 11:59:48 -0700 (PDT)
Subject: Re: [PATCH 2/5] docs: media: vimc: Documenting vimc topology
 configuration using configfs
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, helen.koike@collabora.com,
        ezequiel@collabora.com, andre.almeida@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20190919203208.12515-1-dafna.hirschfeld@collabora.com>
 <20190919203208.12515-3-dafna.hirschfeld@collabora.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <780d4bc9-b7a3-10c9-2123-df53376f7c7c@linuxfoundation.org>
Date:   Thu, 26 Sep 2019 12:59:47 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190919203208.12515-3-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/19/19 2:32 PM, Dafna Hirschfeld wrote:
> Add explanation of how to use configfs in order to create a
> vimc device with a given topology.
> 

Can you add more detail on the problem configfs solves and what
value it adds.

> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>   Documentation/media/v4l-drivers/vimc.dot |  28 ++-
>   Documentation/media/v4l-drivers/vimc.rst | 240 ++++++++++++++++++++---
>   2 files changed, 220 insertions(+), 48 deletions(-)
> 
> diff --git a/Documentation/media/v4l-drivers/vimc.dot b/Documentation/media/v4l-drivers/vimc.dot
> index 57863a13fa39..e3b41ac2bc46 100644
> --- a/Documentation/media/v4l-drivers/vimc.dot
> +++ b/Documentation/media/v4l-drivers/vimc.dot
> @@ -2,21 +2,15 @@
>   
>   digraph board {
>   	rankdir=TB
> -	n00000001 [label="{{} | Sensor A\n/dev/v4l-subdev0 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
> -	n00000001:port0 -> n00000005:port0 [style=bold]
> -	n00000001:port0 -> n0000000b [style=bold]
> -	n00000003 [label="{{} | Sensor B\n/dev/v4l-subdev1 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
> -	n00000003:port0 -> n00000008:port0 [style=bold]
> -	n00000003:port0 -> n0000000f [style=bold]
> -	n00000005 [label="{{<port0> 0} | Debayer A\n/dev/v4l-subdev2 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> -	n00000005:port1 -> n00000017:port0
> -	n00000008 [label="{{<port0> 0} | Debayer B\n/dev/v4l-subdev3 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> -	n00000008:port1 -> n00000017:port0 [style=dashed]
> -	n0000000b [label="Raw Capture 0\n/dev/video0", shape=box, style=filled, fillcolor=yellow]
> -	n0000000f [label="Raw Capture 1\n/dev/video1", shape=box, style=filled, fillcolor=yellow]
> -	n00000013 [label="RGB/YUV Input\n/dev/video2", shape=box, style=filled, fillcolor=yellow]
> -	n00000013 -> n00000017:port0 [style=dashed]
> -	n00000017 [label="{{<port0> 0} | Scaler\n/dev/v4l-subdev4 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> -	n00000017:port1 -> n0000001a [style=bold]
> -	n0000001a [label="RGB/YUV Capture\n/dev/video3", shape=box, style=filled, fillcolor=yellow]
> +	n00000001 [label="cap-deb\n/dev/video0", shape=box, style=filled, fillcolor=yellow]
> +	n00000005 [label="cap-sen\n/dev/video1", shape=box, style=filled, fillcolor=yellow]
> +	n00000009 [label="cap-sca\n/dev/video2", shape=box, style=filled, fillcolor=yellow]
> +	n0000000d [label="{{<port0> 0} | sca\n/dev/v4l-subdev0 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> +	n0000000d:port1 -> n00000009 [style=bold]
> +	n00000010 [label="{{<port0> 0} | deb\n/dev/v4l-subdev1 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> +	n00000010:port1 -> n00000001 [style=bold]
> +	n00000010:port1 -> n0000000d:port0 [style=bold]
> +	n00000013 [label="{{} | sen\n/dev/v4l-subdev2 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
> +	n00000013:port0 -> n00000005 [style=bold]
> +	n00000013:port0 -> n00000010:port0 [style=bold]
>   }
> diff --git a/Documentation/media/v4l-drivers/vimc.rst b/Documentation/media/v4l-drivers/vimc.rst
> index a582af0509ee..e5636883545f 100644
> --- a/Documentation/media/v4l-drivers/vimc.rst
> +++ b/Documentation/media/v4l-drivers/vimc.rst
> @@ -1,45 +1,225 @@
>   .. SPDX-License-Identifier: GPL-2.0
>   
> +==========================================
>   The Virtual Media Controller Driver (vimc)
>   ==========================================
>   
> -The vimc driver emulates complex video hardware using the V4L2 API and the Media
> -API. It has a capture device and three subdevices: sensor, debayer and scaler.
> +The vimc driver emulates complex video hardware topologies using the V4L2 API
> +and the Media API. It has a capture device and three subdevices:

Add blank line in between - helps with readability

> +sensor, debayer and scaler. It exposes media devices through /dev/mediaX nodes,
> +video capture devices through /dev/videoX and sub-devices through /dev/v4l-subdevX.
> +
> +
> +To configure a media device of a given topology, a ConfigFS API is provided.

ConfigFS API enables the ability dynamically configure a media device
and its topology. This will help customize topology for specific testing
needs (?)

Assuming that is the goal for this work.

> +
> +Configuring a topology through ConfigFS (Experimental)
> +======================================================
> +
> +.. note:: This API is under development and might change in the future. > +
> +Mount configfs:
> +::
> +
> +	$ mkdir /configfs
> +	$ mount -t configfs none /configfs
> +
> +When loading the module, you will see a folder named vimc
> +::
> +
> +	$ tree /configfs/
> +	/configfs/
> +	`-- vimc
> +
> +Creating a media device
> +-----------------------
> +
> +To create a media device create a new folder under /configfs/vimc/
Change this to:

How to create a media device or flip the sentence around:

Create a folder under /configfs/vimc/ to create media device.

> +
> +Example:
> +::
> +
> +	$ mkdir /configfs/vimc/mdev
> +	$ tree /configfs/vimc/mdev
> +	/configfs/
> +	`-- vimc
> +	    `-- mdev
> +	        `-- hotplug
> +
> +Creating entities
> +-----------------
> +
> +To create an entity in the media device's topology, create a folder under

Same comment as above.

> +``/configfs/vimc/<mdev-name>/`` with the following format:
> +
> +	<entity-type>:<entity-name>
> +
> +Where <entity-type> is one of the following:
> +
> +- vimc-sensor
> +- vimc-scaler
> +- vimc-debayer
> +- vimc-capture
> +
> +Example:
> +::
> +
> +	$ mkdir /configfs/vimc/mdev/vimc-sensor:sen
> +	$ mkdir /configfs/vimc/mdev/vimc-capture:cap-sen
> +	$ tree /configfs/
> +	/configfs/
> +	`-- vimc
> +	    `-- mdev
> +		|-- hotplug
> +		|-- vimc-capture:cap-sen
> +		|   `-- pad:sink:0
> +		`-- vimc-sensor:sen
> +                    `-- pad:source:0
> +
> +Default folders are created under the entity directory for each pad of the entity.
> +
> +Creating links
> +--------------
> +
> +To create a link between two entities, you should create a directory for the link
> +under the source pad of the link and then set it to be a symbolic link to the sink pad:

Same comment as above.

>   
> -Topology
> ---------
> +Example:
> +::
> +
> +	$ mkdir "/configfs/vimc/mdev/vimc-sensor:sen/pad:source:0/to-cap"
> +	$ ln -s "/configfs/vimc/mdev/vimc-capture:cap-sen/pad:sink:0" "/configfs/vimc/mdev/vimc-sensor:sen/pad:source:0/to-cap"
> +	$ tree /configfs
> +	/configfs
> +	`-- vimc
> +	    `-- mdev
> +	        |-- hotplug
> +	        |-- vimc-capture:cap-sen
> +	        |   `-- pad:sink:0
> +	        `-- vimc-sensor:sen
> +	            `-- pad:source:0
> +	                `-- to-cap
> +	                    |-- enabled
> +	                    |-- immutable
> +	                    `-- pad:sink:0 -> ../../../../../vimc/mdev/vimc-capture:cap-sen/pad:sink:0
> +
> +The `enabled` and `immutable` are two boolean attributes of the link corresponding to the link flags
> +
> +
> +Flag values are described in :ref:`Documentation/media/uapi/mediactl/media-types.rst <media-link-flag>`
> +( seek for ``MEDIA_LNK_FL_*``)
> +
> +1 - Enabled
> +	Indicates that the link will be enabled when the media device is created.
> +
> +3 - Enabled and Immutable
> +	Indicates that the link enabled state can't be modified at runtime.
> +
> +Change an attribute of the link by writing "on" or "1" to set it on , and "off" or "0" to set it off

You can change

> +
> +Example:
> +::
> +
> +	$ echo "on" > /configfs/vimc/mdev/vimc-sensor:sen/pad:source:0/to-cap/immutable
> +
> +Activating/Deactivating device
> +------------------------------
> +
> +To activate the device, write one of "plugged", "plug" or "1" to the file

Same comment as above.

> +``/configfs/vimc/<mdev-name>/hotplug``
> +
> +Example:
> +::
> +
> +	$ echo 1 > /configfs/vimc/mdev/hotplug
> +
> +You should see a new node ``/dev/mediaX`` in your devfs.
> +
> +To deactivate the device, write one of "unplugged", "unplug" or "0" to the file
> +``/configfs/vimc/<ndev-name>/hotplug``

Same comment as above. In general don't start sentence with "To"

> +
> +Example:
> +::
> +
> +	$ echo unplugged > /configfs/vimc/mdev/hotplug
> +
> +Topology Configuration - Full Example
> +-------------------------------------
> +
> +Here is a full example of a simple topology configuration:
> +
> +.. code-block:: bash
> +
> +    # Creating the entities
> +    mkdir "/configfs/vimc/mdev"
> +    mkdir "/configfs/vimc/mdev/vimc-sensor:sen"
> +    mkdir "/configfs/vimc/mdev/vimc-debayer:deb"
> +    mkdir "/configfs/vimc/mdev/vimc-scaler:sca"
> +    mkdir "/configfs/vimc/mdev/vimc-capture:cap-sca" #/dev/video2
> +    mkdir "/configfs/vimc/mdev/vimc-capture:cap-sen" #/dev/video1
> +    mkdir "/configfs/vimc/mdev/vimc-capture:cap-deb" #/dev/video0
> +
> +    # Creating the links
> +    #sen -> deb
> +    mkdir "/configfs/vimc/mdev/vimc-sensor:sen/pad:source:0/to-deb"
> +    ln -s "/configfs/vimc/mdev/vimc-debayer:deb/pad:sink:0" "/configfs/vimc/mdev/vimc-sensor:sen/pad:source:0/to-deb"
> +    echo on > "/configfs/vimc/mdev/vimc-sensor:sen/pad:source:0/to-deb/immutable"
> +    echo on > "/configfs/vimc/mdev/vimc-sensor:sen/pad:source:0/to-deb/enabled"
> +
> +    #deb -> sca
> +    mkdir "/configfs/vimc/mdev/vimc-debayer:deb/pad:source:1/to-sca"
> +    ln -s "/configfs/vimc/mdev/vimc-scaler:sca/pad:sink:0" "/configfs/vimc/mdev/vimc-debayer:deb/pad:source:1/to-sca"
> +    echo on > "/configfs/vimc/mdev/vimc-debayer:deb/pad:source:1/to-sca/immutable"
> +    echo on > "/configfs/vimc/mdev/vimc-debayer:deb/pad:source:1/to-sca/enabled"
> +
> +    #sca -> cap-sca
> +    mkdir "/configfs/vimc/mdev/vimc-scaler:sca/pad:source:1/to-cap"
> +    ln -s "/configfs/vimc/mdev/vimc-capture:cap-sca/pad:sink:0" "/configfs/vimc/mdev/vimc-scaler:sca/pad:source:1/to-cap"
> +    echo on > "/configfs/vimc/mdev/vimc-scaler:sca/pad:source:1/to-cap/immutable"
> +    echo on > "/configfs/vimc/mdev/vimc-scaler:sca/pad:source:1/to-cap/enabled"
> +
> +    #sen -> cap-sen
> +    mkdir "/configfs/vimc/mdev/vimc-sensor:sen/pad:source:0/to-cap"
> +    ln -s "/configfs/vimc/mdev/vimc-capture:cap-sen/pad:sink:0" "/configfs/vimc/mdev/vimc-sensor:sen/pad:source:0/to-cap"
> +    echo on > "/configfs/vimc/mdev/vimc-sensor:sen/pad:source:0/to-cap/immutable"
> +    echo on > "/configfs/vimc/mdev/vimc-sensor:sen/pad:source:0/to-cap/enabled"
> +
> +    #deb -> cap-deb
> +    mkdir "/configfs/vimc/mdev/vimc-debayer:deb/pad:source:1/to-cap"
> +    ln -s "/configfs/vimc/mdev/vimc-capture:cap-deb/pad:sink:0" "/configfs/vimc/mdev/vimc-debayer:deb/pad:source:1/to-cap"
> +    echo on > "/configfs/vimc/mdev/vimc-debayer:deb/pad:source:1/to-cap/immutable"
> +    echo on > "/configfs/vimc/mdev/vimc-debayer:deb/pad:source:1/to-cap/enabled"
>   
> -The topology is hardcoded, although you could modify it in vimc-core and
> -recompile the driver to achieve your own topology. This is the default topology:

Does this mean, there is no default topology. I think default topology
should still be an option even if it is a module option.

>   
>   .. _vimc_topology_graph:
>   
>   .. kernel-figure:: vimc.dot
> -    :alt:   Diagram of the default media pipeline topology
> +    :alt:   Diagram of the configured simple topology in the example
>       :align: center
>   
> -    Media pipeline graph on vimc
> +    Simple Media pipeline graph on vimc configured through configfs
>   
> -Configuring the topology
> -~~~~~~~~~~~~~~~~~~~~~~~~
> +Configuring the pipeline formats
> +================================
>   
> -Each subdevice will come with its default configuration (pixelformat, height,
> -width, ...). One needs to configure the topology in order to match the
> +Each subdevice has a default format configuration (pixelformat, height,
> +width, ...). You should configure the formats in order to match the
>   configuration on each linked subdevice to stream frames through the pipeline.
> -If the configuration doesn't match, the stream will fail. The ``v4l-utils``
> +If the configuration doesn't match, streaming will fail. The ``v4l-utils``
>   package is a bundle of user-space applications, that comes with ``media-ctl`` and

replace "that comes with" with "which includes"

> -``v4l2-ctl`` that can be used to configure the vimc configuration. This sequence
> -of commands fits for the default topology:
> +``v4l2-ctl`` that can be used to configure the formats of the entities. This sequence
> +of commands fits the simple topology created in the full example of topology configuration:
>   
>   .. code-block:: bash
>   
> -        media-ctl -d platform:vimc -V '"Sensor A":0[fmt:SBGGR8_1X8/640x480]'
> -        media-ctl -d platform:vimc -V '"Debayer A":0[fmt:SBGGR8_1X8/640x480]'
> -        media-ctl -d platform:vimc -V '"Sensor B":0[fmt:SBGGR8_1X8/640x480]'
> -        media-ctl -d platform:vimc -V '"Debayer B":0[fmt:SBGGR8_1X8/640x480]'
> -        v4l2-ctl -z platform:vimc -d "RGB/YUV Capture" -v width=1920,height=1440
> -        v4l2-ctl -z platform:vimc -d "Raw Capture 0" -v pixelformat=BA81
> -        v4l2-ctl -z platform:vimc -d "Raw Capture 1" -v pixelformat=BA81
> +	media-ctl -d platform:vimc-000 -V '"sen":0[fmt:SBGGR8_1X8/640x480]'
> +	media-ctl -d platform:vimc-000 -V '"deb":0[fmt:SBGGR8_1X8/640x480]'
> +	media-ctl -d platform:vimc-000 -V '"deb":1[fmt:RGB888_1X24/640x480]'
> +	media-ctl -d platform:vimc-000 -V '"sca":0[fmt:RGB888_1X24/640x480]'
> +	media-ctl -d platform:vimc-000 -V '"sca":1[fmt:RGB888_1X24/640x480]'
> +	v4l2-ctl -z platform:vimc-000 -d "cap-sen" -v pixelformat=BA81
> +	v4l2-ctl -z platform:vimc-000 -d "cap-deb" -v pixelformat=RGB3
> +	# The default scaling value of the scaler is 3, so need to set its capture accordingly
> +	v4l2-ctl -z platform:vimc -d "cap-sca" -v pixelformat=RGB3,width=1920,height=1440
>   
>   Subdevices
>   ----------
> @@ -61,8 +241,8 @@ vimc-debayer:
>   	* 1 Pad source
>   
>   vimc-scaler:
> -	Scale up the image by a factor of 3. E.g.: a 640x480 image becomes a
> -        1920x1440 image. (this value can be configured, see at
> +	Scales up the image by a factor of 3. E.g.: a 640x480 image becomes a
> +        1920x1440 image. (this value can be configured, see
>           `Module options`_).
>   	Exposes:
>   
> @@ -77,12 +257,10 @@ vimc-capture:
>   	* 1 Pad source
>   
>   
> -        Module options
> ----------------
> -
> -Vimc has a few module parameters to configure the driver.
> +Module options
> +==============
>   
> -        param=value
> +Vimc has 2 module parameters to configure the driver.
>   
>   * ``sca_mult=<unsigned int>``
>   
> @@ -98,10 +276,10 @@ Vimc has a few module parameters to configure the driver.
>           otherwise the next odd number is considered (the default value is 3).
>   

Keep this close to the top of the file and then add the configfs stuff.

>   Source code documentation
> --------------------------
> +=========================
>   
>   vimc-streamer
> -~~~~~~~~~~~~~
> +-------------
>   
>   .. kernel-doc:: drivers/media/platform/vimc/vimc-streamer.h
>      :internal:
> 

thanks,
-- Shuah
