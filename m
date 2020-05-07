Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D4451C8DDA
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2020 16:11:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726683AbgEGOJ2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 May 2020 10:09:28 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:34105 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728348AbgEGOJ1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 May 2020 10:09:27 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id WhDFjvEgs8hmdWhDIjFl8j; Thu, 07 May 2020 16:09:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1588860565; bh=lLmr+AD5eotjWpiEMpcgSEGCJpCEHy7KCO1D7jiFKl0=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=tPNTOCcvntbnLaO2xPBwU5fXUOFUyRyWsloVEHbnWxa6UQg2ATQ5gzoq805wRoRPd
         ZSsEs1PJkVgCNwZp9MerPRoFEnKqr/UUUb8z3L6YPMNbdriYe4fdZTGIu3WIivvXyn
         SU9pon0zlLuuy5t0t14Pfn/NLl8FamU5ZzBpggxvKO1SXnHoMX2GrKEO/ciCYmEUTN
         O7CHlfm/Cf++6qAXXOV/XgpARgXSBf56pZyl1XyShceEIH6WG9ujTB+hFmfaCr1Jr2
         aT/LzprS9as6RT/csQkexRk3DKOe13x7EdvYs30P0P9V8Vn1DgBOY2kJ8GszbKzoN7
         JiMAep/WmKhZQ==
Subject: Re: [PATCH v9 02/11] media: v4l2-ctrl: Document
 V4L2_CID_CAMERA_SENSOR_LOCATION
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com, pavel@ucw.cz, linux-media@vger.kernel.org,
        libcamera-devel@lists.libcamera.org
References: <20200417124110.72313-1-jacopo@jmondi.org>
 <20200417124110.72313-3-jacopo@jmondi.org> <20200505140206.589f54ae@coco.lan>
 <a5d77790-5f98-650e-cfb9-a97b8701454d@xs4all.nl>
 <20200505165826.1ce8bb0d@coco.lan>
 <b3e211da-b9f6-a65c-4453-c11b05bced45@xs4all.nl>
 <20200506113909.1489bd1e@coco.lan>
 <20200506110730.rvhxoh74u3rmemtw@uno.localdomain>
 <20200506132847.03860fce@coco.lan>
 <20200507123649.q3ecciyxulzisn62@uno.localdomain>
 <20200507160530.21cf5922@coco.lan>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <ed714d0b-fc92-72a4-91df-c8fa62321e9b@xs4all.nl>
Date:   Thu, 7 May 2020 16:09:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200507160530.21cf5922@coco.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfM3DOzZjUNu0tKgWV5ag7IFciT/xB/yn8j1RAE947PHPVMXO3kMS+FtQ0vPBoKLpbYxngFIam8phUyPkfX13182ooV8f/24beVAl5GjFzHo9DjUzoeUM
 YPWlSb1NnFPfSOsgrFmoqwkJ/Y2zvAOnShRw5NuTiprzs4l/ofT4VwxIIUJB0QPHoN0aJtLL90fA64oBkSGKERE4DjcRRN3kK/p5BGZeTmExgWmloeQzCiYq
 javEZ7Yi9DoqrT2mnlfJJGrIuNODwNVw2YJme4PPqkzC66sLn1B6elw1wft/0fnrhLuUarjqdOkZ/1U/G2HVWZmCyPqwR3WUSWdgPK3RBlz4/WkYWifdubmK
 e2a+0khQjBCd2GxGxGR5gi4gwCYT9Xlpw+qeU5Rfafk9H1B5JcNPwJB2+iwmTD0Tqs75JjufMSQF+mKhteK0jEVBmFa5kA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 07/05/2020 16:05, Mauro Carvalho Chehab wrote:
> Em Thu, 7 May 2020 14:36:49 +0200
> Jacopo Mondi <jacopo@jmondi.org> escreveu:
> 
>> Hi Mauro,
>>
>> On Wed, May 06, 2020 at 01:28:47PM +0200, Mauro Carvalho Chehab wrote:
>>> Em Wed, 6 May 2020 13:07:30 +0200
>>> Jacopo Mondi <jacopo@jmondi.org> escreveu:
>>>  
>>>>> So, if that would be ok for you, I can live with a
>>>>>
>>>>> V4L2_CID_CAMERA_VIEWING_ANGLE (or some similar name) that will
>>>>> specify the angle where the sensor is mounted (for fixed sensors),
>>>>> or the current angle, in case of movable ones, being RO for fixed
>>>>> sensors and RW for movable ones.
>>>>>
>>>>> Let's postpone discussions for a LOCATION control once this
>>>>> would be needed by some driver.  
>>>>
>>>> Would V4L2_CID_CAMERA_ORIENTATION work ?  
>>>
>>> Yeah, either V4L2_CID_CAMERA_ORIENTATION or CID_LENS_FACING would
>>> equally work (although I would prefer the one with a shorter name).
>>>  
>>
>> Yeah, CID_LENS_FACING is nice and shorter, but I would refrain from
>> polluting the LENS_ namespace, this control applies to the whole camera
>> module, so I would keep it in the CAMERA_ namespace... And
>> 'orientation' gives a nice match with the DT property, which I would
>> not call 'facing' or 'facing_side' as 'orientation' seems more
>> appropriate as a dt-property name to me..
> 
> Ok. V4L2_CID_CAMERA_ORIENTATION works for me.

For me as well.

Regards,

	Hans
