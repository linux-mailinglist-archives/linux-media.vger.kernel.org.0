Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B79D1CB255
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2020 16:54:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727099AbgEHOy0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 May 2020 10:54:26 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:39083 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726913AbgEHOyZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 8 May 2020 10:54:25 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id X4OJj1O8U8hmdX4OMjIbHK; Fri, 08 May 2020 16:54:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1588949663; bh=yVOPQ3qP/k7xm+iKzAlbta7A3DZ+wSwDBcfvxjdGl2U=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=RvWdeaDWiAs81u4qnROp0Fc7PtbA3Avkx/UGDVMSGovYvxW4+MAxvgcoLqkz/G88i
         rXfxW9dpf0VfxPqVRzfR2Yqi4YHw8HPkYbcGhwqQuIQmDPjiJJXLf6NtO8GBDgjnf6
         YVw/8DiO4Y4zQNLMB0V16KOYCLjtrVaAszZ35kjDBtN/gP475/JyruNjOpnvc9Rw+i
         N8x3F6j1ry+5BqoaHOF2c0l+tkJHJGgcai+1BqNfA6Bf/+nHTfOIaJtKwRj48/2vRM
         q0nWU/m4dpMbIf8ZhKscJaWMU43Y5AE1cNvS/b6M+uIXaf5O432hx1Htc8BTTXS6BP
         t9xEzVNcULqUg==
Subject: Re: [PATCH v9 3/5] media: docs: add glossary.rst with common terms
 used at V4L2 spec
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
References: <cover.1588943181.git.mchehab+huawei@kernel.org>
 <03ae8cfd780924080f48154569c7fa26b6e92ab3.1588943181.git.mchehab+huawei@kernel.org>
 <cf9f5a08-4c32-febe-52e9-56d2233c387a@xs4all.nl>
 <20200508162556.048a7868@coco.lan>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <a386a8a4-4340-ea19-2e9f-44e90e8949d9@xs4all.nl>
Date:   Fri, 8 May 2020 16:54:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200508162556.048a7868@coco.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfKFWbfZleCwGd2nr2/TEyDCrDWkLtSBoKTbg3y6I4BS9rPxr4MarhK1dZtxHGBwmDtrnVYKa+igSiY+7AEsQLvRIKBX1SXUtP8Km1vLiphr5nVIRJSxo
 Q62kJW4SD6LKYEaNwHBT689M9VAajwlZ8fF5Kf/pH7rvct4ojaTwVWKEVsR7EQrWcnXMp5i7WsaHeAg8XyPqMvXeGIb98PSZ18KtxvI83jPCgzEgHR1fGv08
 bF3rdM1HehP7PZspZtWymOcoyuyq/4PQ/Q8azRf7oIYsXVZCfVU3Ki0cfaj12AP+FBF/IpAoOKF/P4fhT61iqg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 08/05/2020 16:25, Mauro Carvalho Chehab wrote:
> Em Fri, 8 May 2020 15:40:25 +0200
> Hans Verkuil <hverkuil-cisco@xs4all.nl> escreveu:
> 
>> On 08/05/2020 15:10, Mauro Carvalho Chehab wrote:
>>> Add a glossary of terms used within the media userspace API
>>> documentation, as several concepts are complex enough to cause
>>> misunderstandings.
>>>
>>> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>>> ---
>>>  .../userspace-api/media/glossary.rst          | 182 ++++++++++++++++++
>>>  Documentation/userspace-api/media/index.rst   |   3 +
>>>  2 files changed, 185 insertions(+)
>>>  create mode 100644 Documentation/userspace-api/media/glossary.rst
>>>
>>> diff --git a/Documentation/userspace-api/media/glossary.rst b/Documentation/userspace-api/media/glossary.rst
>>> new file mode 100644
>>> index 000000000000..18a1ace00159
>>> --- /dev/null
>>> +++ b/Documentation/userspace-api/media/glossary.rst
>>> @@ -0,0 +1,182 @@
>>> +.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-or-later
>>> +
>>> +.. For GPL-2.0, see LICENSES/preferred/GPL-2.0
>>> +..
>>> +.. For GFDL-1.1-or-later, see:
>>> +..
>>> +.. Permission is granted to copy, distribute and/or modify this document
>>> +.. under the terms of the GNU Free Documentation License, Version 1.1 or
>>> +.. any later version published by the Free Software Foundation, with no
>>> +.. Invariant Sections, no Front-Cover Texts and no Back-Cover Texts.
>>> +.. A copy of the license is included at
>>> +.. Documentation/userspace-api/media/fdl-appendix.rst.
>>> +
>>> +========
>>> +Glossary
>>> +========
>>> +
>>> +.. note::
>>> +
>>> +   This goal of this section is to standardize the terms used within the media  
>>
>> This -> The
>>
>>> +   userspace API documentation. It is written incrementally as they are
>>> +   standardized in the media documentation.
>>> +
>>> +   So, it is a Work In Progress.  
>>
>> I'd just say:
>>
>> userspace API documentation. This is Work in Progress.
>>
>>> +
>>> +.. Please keep the glossary entries in alphabetical order
>>> +
>>> +.. glossary::
>>> +
>>> +    Bridge Driver
>>> +	A :term:`device driver` that implements the main logic to talk with
>>> +	media hardware.
>>> +
>>> +    CEC API
>>> +	**Consumer Electronics Control API**
>>> +
>>> +	An API designed to receive and transmit data via an HDMI
>>> +	CEC interface.
>>> +
>>> +	See :ref:`cec`.
>>> +
>>> +    Device Driver
>>> +	Part of the Linux Kernel that implements support for a hardware
>>> +	component.
>>> +
>>> +    Device Node
>>> +	A character device node in the file system used to control and
>>> +	ransfer data in and out of a Kernel driver.  
>>
>> ransfer -> transfer
>>
>>> +
>>> +    Digital TV API
>>> +	**Previously known as DVB API**
>>> +
>>> +	An API designed to control a subset of the :term:`Media Hardware`
>>> +	that implements	digital TV.  
>>
>> I think it will help to provide some examples, e.g.:
>>
>> that implements digital TV (e.g. DVB, ATSC, etc.).
> 
> For the above: Ok!
> 
>>
>>> +
>>> +	See :ref:`dvbapi`.
>>> +
>>> +    DSP
>>> +        **Digital Signal Processor**
>>> +
>>> +	A specialized :term:`Microprocessor`, with its architecture
>>> +	optimized for the operational needs of digital signal processing.
>>> +
>>> +    FPGA
>>> +	**Field-programmable Gate Array**
>>> +
>>> +	An :term:`IC` circuit designed to be configured by a customer or
>>> +	a designer after manufacturing.
>>> +
>>> +	See https://en.wikipedia.org/wiki/Field-programmable_gate_array.
>>> +
>>> +    I²C
>>> +	**Inter-Integrated Circuit**
>>> +
>>> +	A  multi-master, multi-slave, packet switched, single-ended,
>>> +	serial computer bus used to control some hardware components
>>> +	like sub-device hardware components.
>>> +
>>> +	See http://www.nxp.com/docs/en/user-guide/UM10204.pdf.
>>> +
>>> +    IC
>>> +	**Integrated circuit**
>>> +
>>> +	A set of electronic circuits on one small flat piece of
>>> +	semiconductor material, normally silicon.
>>> +
>>> +	Also known as chip.
>>> +
>>> +    IP Block
>>> +	**Intellectual property core**
>>> +
>>> +	In electronic design a semiconductor intellectual property core,
>>> +	is a reusable unit of logic, cell, or integrated circuit layout
>>> +	design that is the intellectual property of one party.
>>> +	IP Blocks may be licensed to another party or can be owned
>>> +	and used by a single party alone.
>>> +
>>> +	See https://en.wikipedia.org/wiki/Semiconductor_intellectual_property_core).
>>> +
>>> +    ISP
>>> +	**Image Signal Processor**
>>> +
>>> +	A specialized processor that implements a set of algorithms for
>>> +	processing image data. ISPs may implement algorithms for lens
>>> +	shading correction, demosaicing, scaling and pixel format conversion
>>> +	as well as produce statistics for the use of the control
>>> +	algorithms (e.g. automatic exposure, white balance and focus).
>>> +
>>> +    Media API
>>> +	A set of userspace APIs used to control the media hardware. It is
>>> +	composed by:
>>> +
>>> +	  - :term:`CEC API`;
>>> +	  - :term:`Digital TV API`;
>>> +	  - :term:`MC API`;
>>> +	  - :term:`RC API`; and
>>> +	  - :term:`V4L2 API`.
>>> +
>>> +	See :doc:`v4l/v4l2`.  
>>
>> Is that the right reference? I'd expect that v4l/v4l2 refers to the V4L2 API
>> and not the whole media API.
> 
> That's the right reference: userspace-api/media/v4l/v4l2.rst file has
> just the V4L2 API.

That's what I mean: This is the glossary entry for 'Media API', so why have a reference
to the V4L2 API? I expect to see a reference to the top-level media API.

> 
> The entire API file is now at userspace-api/media/index.html.
> 
>>
>>> +
>>> +    MC API
>>> +	**Media Controller API**
>>> +
>>> +	An API designed to expose and control the relationships between
>>> +	devices and sub-devices.  
>>
>> I'd say 'media devices and sub-devices'. Otherwise it would suggest that
>> the MC API also supports non-media devices.
> 
> Yeah, it sounds too generic, but MC is currently used also by audio
> devices.>
> Ok, "audio" is "media", but not covered by this spec. 
> 
> We might use "multimedia" or some similar word. What do you think?

Multimedia is fine. Or audio/video.

Regards,

	Hans

> 
> Thanks,
> Mauro
> 

