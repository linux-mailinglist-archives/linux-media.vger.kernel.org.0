Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0EBFBB1AD
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2019 11:50:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407328AbfIWJuw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Sep 2019 05:50:52 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:45959 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2405498AbfIWJuv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Sep 2019 05:50:51 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id CKzUiw0AsKKNGCKzYikswP; Mon, 23 Sep 2019 11:50:48 +0200
Subject: Re: [PATCH 2/5] docs: media: vimc: Documenting vimc topology
 configuration using configfs
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, helen.koike@collabora.com,
        ezequiel@collabora.com, andre.almeida@collabora.com,
        skhan@linuxfoundation.org, kernel@collabora.com, dafna3@gmail.com
References: <20190919203208.12515-1-dafna.hirschfeld@collabora.com>
 <20190919203208.12515-3-dafna.hirschfeld@collabora.com>
 <3cb0359d-aca7-ee79-350c-1065651ad245@xs4all.nl>
 <22a9898032dac2031a9b38b876957a71727b1b49.camel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <6f1ca1e8-5998-8aea-ccb6-ea25f0b36417@xs4all.nl>
Date:   Mon, 23 Sep 2019 11:50:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <22a9898032dac2031a9b38b876957a71727b1b49.camel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfMHVn6GZ5cK6wMiWHBs2BpChat8roFsUKFu6SCic7CkoXFg2Klcyi1ldcDIPv398WTOQIjBaIwlODzmQr69NxO7NgUS53aEbKJibYMuMKY9M/wrEXPyf
 j1H10bj5bjSGTQ1XtuprlsbsceBrgFDL8GxzRzwERaLGtRNqTmkkYoeOn8hE9TwWTKZBNtTaIxPrsQSmV7T3c5wB/+cIfkVnJX9hI8xsbPMZ13rqWyTt6cmR
 042kjPJ61vxqFv7J+T9NS2uYbZKzknCaxKYRRB4kYiLvTXjyPmM8xvxzqtvkSoOby67B6X1B1IkIh1kll5vuMOAooOZ6uR+xc6YVCxJNE7BQm2I/7bs7Ru/D
 5zWcIU4iuuvxM2iB8bdz1EiJ9RNF7r0PfL9tHiW/myXlHjHobw8N6+H3jRBkN6FpKSXx+62ut6puTS/WKSes2H9klNHFq+95NAtMGJGDL4HuOeMHQLbFno23
 CFg71lCOeNBox5/C
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/23/19 11:29 AM, Dafna Hirschfeld wrote:
> On Fri, 2019-09-20 at 15:39 +0200, Hans Verkuil wrote:
>> On 9/19/19 10:32 PM, Dafna Hirschfeld wrote:
>>> Add explanation of how to use configfs in order to create a
>>> vimc device with a given topology.
>>>
>>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>>> ---
>>>  Documentation/media/v4l-drivers/vimc.dot |  28 ++-
>>>  Documentation/media/v4l-drivers/vimc.rst | 240 ++++++++++++++++++++---
>>>  2 files changed, 220 insertions(+), 48 deletions(-)
>>>
>>> diff --git a/Documentation/media/v4l-drivers/vimc.dot b/Documentation/media/v4l-drivers/vimc.dot
>>> index 57863a13fa39..e3b41ac2bc46 100644
>>> --- a/Documentation/media/v4l-drivers/vimc.dot
>>> +++ b/Documentation/media/v4l-drivers/vimc.dot
>>> @@ -2,21 +2,15 @@
>>>  
>>>  digraph board {
>>>  	rankdir=TB
>>> -	n00000001 [label="{{} | Sensor A\n/dev/v4l-subdev0 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
>>> -	n00000001:port0 -> n00000005:port0 [style=bold]
>>> -	n00000001:port0 -> n0000000b [style=bold]
>>> -	n00000003 [label="{{} | Sensor B\n/dev/v4l-subdev1 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
>>> -	n00000003:port0 -> n00000008:port0 [style=bold]
>>> -	n00000003:port0 -> n0000000f [style=bold]
>>> -	n00000005 [label="{{<port0> 0} | Debayer A\n/dev/v4l-subdev2 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>>> -	n00000005:port1 -> n00000017:port0
>>> -	n00000008 [label="{{<port0> 0} | Debayer B\n/dev/v4l-subdev3 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>>> -	n00000008:port1 -> n00000017:port0 [style=dashed]
>>> -	n0000000b [label="Raw Capture 0\n/dev/video0", shape=box, style=filled, fillcolor=yellow]
>>> -	n0000000f [label="Raw Capture 1\n/dev/video1", shape=box, style=filled, fillcolor=yellow]
>>> -	n00000013 [label="RGB/YUV Input\n/dev/video2", shape=box, style=filled, fillcolor=yellow]
>>> -	n00000013 -> n00000017:port0 [style=dashed]
>>> -	n00000017 [label="{{<port0> 0} | Scaler\n/dev/v4l-subdev4 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>>> -	n00000017:port1 -> n0000001a [style=bold]
>>> -	n0000001a [label="RGB/YUV Capture\n/dev/video3", shape=box, style=filled, fillcolor=yellow]
>>> +	n00000001 [label="cap-deb\n/dev/video0", shape=box, style=filled, fillcolor=yellow]
>>> +	n00000005 [label="cap-sen\n/dev/video1", shape=box, style=filled, fillcolor=yellow]
>>> +	n00000009 [label="cap-sca\n/dev/video2", shape=box, style=filled, fillcolor=yellow]
>>> +	n0000000d [label="{{<port0> 0} | sca\n/dev/v4l-subdev0 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>>> +	n0000000d:port1 -> n00000009 [style=bold]
>>> +	n00000010 [label="{{<port0> 0} | deb\n/dev/v4l-subdev1 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>>> +	n00000010:port1 -> n00000001 [style=bold]
>>> +	n00000010:port1 -> n0000000d:port0 [style=bold]
>>> +	n00000013 [label="{{} | sen\n/dev/v4l-subdev2 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
>>> +	n00000013:port0 -> n00000005 [style=bold]
>>> +	n00000013:port0 -> n00000010:port0 [style=bold]
>>>  }
>>> diff --git a/Documentation/media/v4l-drivers/vimc.rst b/Documentation/media/v4l-drivers/vimc.rst
>>> index a582af0509ee..e5636883545f 100644
>>> --- a/Documentation/media/v4l-drivers/vimc.rst
>>> +++ b/Documentation/media/v4l-drivers/vimc.rst
>>> @@ -1,45 +1,225 @@
>>>  .. SPDX-License-Identifier: GPL-2.0
>>>  
>>> +==========================================
>>>  The Virtual Media Controller Driver (vimc)
>>>  ==========================================
>>>  
>>> -The vimc driver emulates complex video hardware using the V4L2 API and the Media
>>> -API. It has a capture device and three subdevices: sensor, debayer and scaler.
>>> +The vimc driver emulates complex video hardware topologies using the V4L2 API
>>> +and the Media API. It has a capture device and three subdevices:
>>> +sensor, debayer and scaler. It exposes media devices through /dev/mediaX nodes,
>>> +video capture devices through /dev/videoX and sub-devices through /dev/v4l-subdevX.
>>> +
>>> +
>>> +To configure a media device of a given topology, a ConfigFS API is provided.
>>> +
>>> +Configuring a topology through ConfigFS (Experimental)
>>> +======================================================
>>> +
>>> +.. note:: This API is under development and might change in the future.
>>> +
>>> +Mount configfs:
>>> +::
>>> +
>>> +	$ mkdir /configfs
>>> +	$ mount -t configfs none /configfs
>>> +
>>> +When loading the module, you will see a folder named vimc
>>> +::
>>> +
>>> +	$ tree /configfs/
>>> +	/configfs/
>>> +	`-- vimc
>>> +
>>> +Creating a media device
>>> +-----------------------
>>> +
>>> +To create a media device create a new folder under /configfs/vimc/
>>> +
>>> +Example:
>>> +::
>>> +
>>> +	$ mkdir /configfs/vimc/mdev
>>> +	$ tree /configfs/vimc/mdev
>>> +	/configfs/
>>> +	`-- vimc
>>> +	    `-- mdev
>>> +	        `-- hotplug
>>> +
>>> +Creating entities
>>> +-----------------
>>> +
>>> +To create an entity in the media device's topology, create a folder under
>>> +``/configfs/vimc/<mdev-name>/`` with the following format:
>>> +
>>> +	<entity-type>:<entity-name>
>>
>> I suspect that there are restrictions to the characters that can be used in
>> these names. For one the use of ':' in the entity-name is probably a bad idea.
>> Also the entity name should be unique, i.e. you can't have a sensor and a scaler
>> with the same entity name.
>>
> Why is the use of ':' bad idea?
> To which char you suggest to replace it?

You are right, ':' is allowed in the entity-name. So ignore that comment.

But entity-name must be unique within the mdev directory. That's a MC requirement.

> 
>> Such restrictions should be documented here and also tested in the driver!
>>
>>> +
>>> +Where <entity-type> is one of the following:
>>> +
>>> +- vimc-sensor
>>> +- vimc-scaler
>>> +- vimc-debayer
>>> +- vimc-capture
>>> +
>>> +Example:
>>> +::
>>> +
>>> +	$ mkdir /configfs/vimc/mdev/vimc-sensor:sen
>>> +	$ mkdir /configfs/vimc/mdev/vimc-capture:cap-sen
>>> +	$ tree /configfs/
>>> +	/configfs/
>>> +	`-- vimc
>>> +	    `-- mdev
>>> +		|-- hotplug
>>> +		|-- vimc-capture:cap-sen
>>> +		|   `-- pad:sink:0
>>> +		`-- vimc-sensor:sen
>>> +                    `-- pad:source:0
>>
>> Do we need the 'pad:' prefix here? Isn't 'sink:' or 'source:' sufficient?
>> I think pad:sink:0 is rather cumbersome.
>>
>>> +
>>> +Default folders are created under the entity directory for each pad of the entity.
>>> +
>>> +Creating links
>>> +--------------
>>> +
>>> +To create a link between two entities, you should create a directory for the link
>>> +under the source pad of the link and then set it to be a symbolic link to the sink pad:
>>>  
>>> -Topology
>>> ---------
>>> +Example:
>>> +::
>>> +
>>> +	$ mkdir "/configfs/vimc/mdev/vimc-sensor:sen/pad:source:0/to-cap"
>>
>> I'd call the directory 'to-cap-sen': it's clearer that this points to the
>> cap-sen entity. It makes the example easier to understand.
>>
>>> +	$ ln -s "/configfs/vimc/mdev/vimc-capture:cap-sen/pad:sink:0" "/configfs/vimc/mdev/vimc-sensor:sen/pad:source:0/to-cap"
>>> +	$ tree /configfs
>>> +	/configfs
>>> +	`-- vimc
>>> +	    `-- mdev
>>> +	        |-- hotplug
>>> +	        |-- vimc-capture:cap-sen
>>> +	        |   `-- pad:sink:0
>>> +	        `-- vimc-sensor:sen
>>> +	            `-- pad:source:0
>>> +	                `-- to-cap
>>> +	                    |-- enabled
>>> +	                    |-- immutable
>>> +	                    `-- pad:sink:0 -> ../../../../../vimc/mdev/vimc-capture:cap-sen/pad:sink:0
>>> +
>>> +The `enabled` and `immutable` are two boolean attributes of the link corresponding to the link flags
>>> +
>>> +
>>> +Flag values are described in :ref:`Documentation/media/uapi/mediactl/media-types.rst <media-link-flag>`
>>> +( seek for ``MEDIA_LNK_FL_*``)
>>> +
>>> +1 - Enabled
>>> +	Indicates that the link will be enabled when the media device is created.
>>> +
>>> +3 - Enabled and Immutable
>>> +	Indicates that the link enabled state can't be modified at runtime.
>>> +
>>> +Change an attribute of the link by writing "on" or "1" to set it on , and "off" or "0" to set it off
>>> +
>>> +Example:
>>> +::
>>> +
>>> +	$ echo "on" > /configfs/vimc/mdev/vimc-sensor:sen/pad:source:0/to-cap/immutable
>>> +
>>> +Activating/Deactivating device
>>> +------------------------------
>>> +
>>> +To activate the device, write one of "plugged", "plug" or "1" to the file
>>> +``/configfs/vimc/<mdev-name>/hotplug``
>>> +
>>> +Example:
>>> +::
>>> +
>>> +	$ echo 1 > /configfs/vimc/mdev/hotplug
>>> +
>>> +You should see a new node ``/dev/mediaX`` in your devfs.
>>> +
>>> +To deactivate the device, write one of "unplugged", "unplug" or "0" to the file
>>> +``/configfs/vimc/<ndev-name>/hotplug``
>>> +
>>> +Example:
>>> +::
>>> +
>>> +	$ echo unplugged > /configfs/vimc/mdev/hotplug
>>> +
>>> +Topology Configuration - Full Example
>>> +-------------------------------------
>>> +
>>> +Here is a full example of a simple topology configuration:
>>> +
>>> +.. code-block:: bash
>>> +
>>> +    # Creating the entities
>>> +    mkdir "/configfs/vimc/mdev"
>>> +    mkdir "/configfs/vimc/mdev/vimc-sensor:sen"
>>> +    mkdir "/configfs/vimc/mdev/vimc-debayer:deb"
>>> +    mkdir "/configfs/vimc/mdev/vimc-scaler:sca"
>>> +    mkdir "/configfs/vimc/mdev/vimc-capture:cap-sca" #/dev/video2
>>> +    mkdir "/configfs/vimc/mdev/vimc-capture:cap-sen" #/dev/video1
>>> +    mkdir "/configfs/vimc/mdev/vimc-capture:cap-deb" #/dev/video0
>>> +
>>> +    # Creating the links
>>> +    #sen -> deb
>>> +    mkdir "/configfs/vimc/mdev/vimc-sensor:sen/pad:source:0/to-deb"
>>> +    ln -s "/configfs/vimc/mdev/vimc-debayer:deb/pad:sink:0" "/configfs/vimc/mdev/vimc-sensor:sen/pad:source:0/to-deb"
>>> +    echo on > "/configfs/vimc/mdev/vimc-sensor:sen/pad:source:0/to-deb/immutable"
>>
>> If you set immutable to on, then it should automatically set enabled to on as well,
>> so no need for the next line.
> 
> Andrzej Pietrasiewicz suggested not to allow setting the 'immutable' to on if 'enabled' is off
> and not to allow setting 'enabled' to off if 'immutable' it on.
> He says this is better than an interface where a change in one file cause a change in another file.

I wonder if this shouldn't be changed to just a single file called 'type'. And it
can be set to 'immutable', 'enabled'/'on' and 'disabled'/'off'. It defaults to
'off'.

That way you don't have this dependency between two properties.

It feels cleaner that way.

> 
>>
>>> +    echo on > "/configfs/vimc/mdev/vimc-sensor:sen/pad:source:0/to-deb/enabled"
>>> +
>>> +    #deb -> sca
>>> +    mkdir "/configfs/vimc/mdev/vimc-debayer:deb/pad:source:1/to-sca"
>>> +    ln -s "/configfs/vimc/mdev/vimc-scaler:sca/pad:sink:0" "/configfs/vimc/mdev/vimc-debayer:deb/pad:source:1/to-sca"
>>> +    echo on > "/configfs/vimc/mdev/vimc-debayer:deb/pad:source:1/to-sca/immutable"
>>> +    echo on > "/configfs/vimc/mdev/vimc-debayer:deb/pad:source:1/to-sca/enabled"
>>> +
>>> +    #sca -> cap-sca
>>> +    mkdir "/configfs/vimc/mdev/vimc-scaler:sca/pad:source:1/to-cap"
>>
>> Same in this example: use to-cap-sca
>>
>>> +    ln -s "/configfs/vimc/mdev/vimc-capture:cap-sca/pad:sink:0" "/configfs/vimc/mdev/vimc-scaler:sca/pad:source:1/to-cap"
>>> +    echo on > "/configfs/vimc/mdev/vimc-scaler:sca/pad:source:1/to-cap/immutable"
>>> +    echo on > "/configfs/vimc/mdev/vimc-scaler:sca/pad:source:1/to-cap/enabled"
>>> +
>>> +    #sen -> cap-sen
>>> +    mkdir "/configfs/vimc/mdev/vimc-sensor:sen/pad:source:0/to-cap"
>>> +    ln -s "/configfs/vimc/mdev/vimc-capture:cap-sen/pad:sink:0" "/configfs/vimc/mdev/vimc-sensor:sen/pad:source:0/to-cap"
>>> +    echo on > "/configfs/vimc/mdev/vimc-sensor:sen/pad:source:0/to-cap/immutable"
>>> +    echo on > "/configfs/vimc/mdev/vimc-sensor:sen/pad:source:0/to-cap/enabled"
>>> +
>>> +    #deb -> cap-deb
>>> +    mkdir "/configfs/vimc/mdev/vimc-debayer:deb/pad:source:1/to-cap"
>>> +    ln -s "/configfs/vimc/mdev/vimc-capture:cap-deb/pad:sink:0" "/configfs/vimc/mdev/vimc-debayer:deb/pad:source:1/to-cap"
>>> +    echo on > "/configfs/vimc/mdev/vimc-debayer:deb/pad:source:1/to-cap/immutable"
>>> +    echo on > "/configfs/vimc/mdev/vimc-debayer:deb/pad:source:1/to-cap/enabled"
>>>  
>>> -The topology is hardcoded, although you could modify it in vimc-core and
>>> -recompile the driver to achieve your own topology. This is the default topology:
>>>  
>>>  .. _vimc_topology_graph:
>>>  
>>>  .. kernel-figure:: vimc.dot
>>> -    :alt:   Diagram of the default media pipeline topology
>>> +    :alt:   Diagram of the configured simple topology in the example
>>>      :align: center
>>>  
>>> -    Media pipeline graph on vimc
>>> +    Simple Media pipeline graph on vimc configured through configfs
>>>  
>>> -Configuring the topology
>>> -~~~~~~~~~~~~~~~~~~~~~~~~
>>> +Configuring the pipeline formats
>>> +================================
>>>  
>>> -Each subdevice will come with its default configuration (pixelformat, height,
>>> -width, ...). One needs to configure the topology in order to match the
>>> +Each subdevice has a default format configuration (pixelformat, height,
>>> +width, ...). You should configure the formats in order to match the
>>>  configuration on each linked subdevice to stream frames through the pipeline.
>>> -If the configuration doesn't match, the stream will fail. The ``v4l-utils``
>>> +If the configuration doesn't match, streaming will fail. The ``v4l-utils``
>>>  package is a bundle of user-space applications, that comes with ``media-ctl`` and
>>> -``v4l2-ctl`` that can be used to configure the vimc configuration. This sequence
>>> -of commands fits for the default topology:
>>> +``v4l2-ctl`` that can be used to configure the formats of the entities. This sequence
>>> +of commands fits the simple topology created in the full example of topology configuration:
>>>  
>>>  .. code-block:: bash
>>>  
>>> -        media-ctl -d platform:vimc -V '"Sensor A":0[fmt:SBGGR8_1X8/640x480]'
>>> -        media-ctl -d platform:vimc -V '"Debayer A":0[fmt:SBGGR8_1X8/640x480]'
>>> -        media-ctl -d platform:vimc -V '"Sensor B":0[fmt:SBGGR8_1X8/640x480]'
>>> -        media-ctl -d platform:vimc -V '"Debayer B":0[fmt:SBGGR8_1X8/640x480]'
>>> -        v4l2-ctl -z platform:vimc -d "RGB/YUV Capture" -v width=1920,height=1440
>>> -        v4l2-ctl -z platform:vimc -d "Raw Capture 0" -v pixelformat=BA81
>>> -        v4l2-ctl -z platform:vimc -d "Raw Capture 1" -v pixelformat=BA81
>>> +	media-ctl -d platform:vimc-000 -V '"sen":0[fmt:SBGGR8_1X8/640x480]'
>>> +	media-ctl -d platform:vimc-000 -V '"deb":0[fmt:SBGGR8_1X8/640x480]'
>>> +	media-ctl -d platform:vimc-000 -V '"deb":1[fmt:RGB888_1X24/640x480]'
>>> +	media-ctl -d platform:vimc-000 -V '"sca":0[fmt:RGB888_1X24/640x480]'
>>> +	media-ctl -d platform:vimc-000 -V '"sca":1[fmt:RGB888_1X24/640x480]'
>>> +	v4l2-ctl -z platform:vimc-000 -d "cap-sen" -v pixelformat=BA81
>>> +	v4l2-ctl -z platform:vimc-000 -d "cap-deb" -v pixelformat=RGB3
>>> +	# The default scaling value of the scaler is 3, so need to set its capture accordingly
>>> +	v4l2-ctl -z platform:vimc -d "cap-sca" -v pixelformat=RGB3,width=1920,height=1440
>>>  
>>>  Subdevices
>>>  ----------
>>> @@ -61,8 +241,8 @@ vimc-debayer:
>>>  	* 1 Pad source
>>>  
>>>  vimc-scaler:
>>> -	Scale up the image by a factor of 3. E.g.: a 640x480 image becomes a
>>> -        1920x1440 image. (this value can be configured, see at
>>> +	Scales up the image by a factor of 3. E.g.: a 640x480 image becomes a
>>> +        1920x1440 image. (this value can be configured, see
>>
>> Note that this might change with this patch:
>>
>> https://patchwork.kernel.org/patch/11146175/
>>
>> Just so you are aware of this.
>>
>>>          `Module options`_).
>>>  	Exposes:
>>>  
>>> @@ -77,12 +257,10 @@ vimc-capture:
>>>  	* 1 Pad source
>>>  
>>>  
>>> -        Module options
>>> ----------------
>>> -
>>> -Vimc has a few module parameters to configure the driver.
>>> +Module options
>>> +==============
>>>  
>>> -        param=value
>>> +Vimc has 2 module parameters to configure the driver.
>>>  
>>>  * ``sca_mult=<unsigned int>``
>>>  
>>> @@ -98,10 +276,10 @@ Vimc has a few module parameters to configure the driver.
>>>          otherwise the next odd number is considered (the default value is 3).
>>>  
>>>  Source code documentation
>>> --------------------------
>>> +=========================
>>>  
>>>  vimc-streamer
>>> -~~~~~~~~~~~~~
>>> +-------------
>>>  
>>>  .. kernel-doc:: drivers/media/platform/vimc/vimc-streamer.h
>>>     :internal:
>>>
>>
>> Regards,
>>
>> 	Hans
> 
> Thanks,
> 
> Dafna
> 

Regards,

	Hans
