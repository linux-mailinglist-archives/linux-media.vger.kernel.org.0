Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 676C523D822
	for <lists+linux-media@lfdr.de>; Thu,  6 Aug 2020 10:46:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728975AbgHFIqC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Aug 2020 04:46:02 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:57897 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727768AbgHFIqA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 Aug 2020 04:46:00 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 3bXBk7SenuuXO3bXCknWKQ; Thu, 06 Aug 2020 10:45:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1596703558; bh=NEeQ+N4YiFuwV4PKVUfGdW0UoeZMiT4orXCYUBnDfNM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=vAzjBOZgnSj+u2vJdvE0tDmp0kGo924Hu7gyuey+r31ifY8XqPdbGvWAklfXJYkBO
         D65aA/2bsccXE6kZRC//1uLiYqQueHtCv32s6HViNEndK7yy0/xcgv1+JRS+5JVqPc
         Q6ScCvCxkRBoX4bhJLT5fS9aa5B76032a2j2Heg353FO6J0Ekd/5OuzYls71301Bjb
         Yj9S4hcap1ytAAeqTbl/T1TUYz4Sm5P8H/YweFvVLnWbY/U1XLmD5JUwF9ZKZq8f91
         U53otuJBUHxgJL2OCc+PzkQ6vAKge/Aw5F95GF1wWlaSQjFwoBkux4ioCTU6A5bj7l
         UsWWug++z1F5g==
Subject: Re: [PATCH 3/4] media: docs: USe SUBDEV_G_SELECTION for sensor
 properties
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
        libcamera-devel@lists.libcamera.org
References: <20200805105721.15445-1-jacopo@jmondi.org>
 <20200805105721.15445-4-jacopo@jmondi.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <b2f528d6-b83e-2ed8-40cb-9fa27d677bf1@xs4all.nl>
Date:   Thu, 6 Aug 2020 10:45:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200805105721.15445-4-jacopo@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfPojsb4yxFGtcOTwTm6MTWgVMuKXdA5A6h89oAT9C8rwItPv8nUqioneArKjR1kfiJWZ+o3ZSkJzfFDspQr56GmW1vgC55BQCgZmX4sAxwTPFUYhZxij
 JnEALvXzdGwRS8mbG//L5D/ABn5p+v8dPUXMa7W1zpL1xKwwZhzFJ59gI2NVgiCx8Wl2d4W7OJP/dWItAAMIKkCC+tqzdP37psiH4bYyvFhxbw4nHq5ffPCh
 MGgvosg7BO/dMEPoYXDaLDhuLrvOrhlVqDAQvzbDgVqrS1a+J4228/wBQflfzz6WLfB7bpbgMygZl5lDWqN7eSgqHvHAZRdw5rqQ5P1/EJV74FPRp9V5RUrW
 e0CF1P9pOE0mgd9oVjWw8XSgQJ8b4QvLzxy0TfpHefNhuAhepnpwONz0yFksK3TkYXsXIvDb7LuPxACRRaLcuzDMVEXXUP9TjqMhLZs1UN0qjCjeCVwsgytD
 aTSYWdl2c786zEehymZp9Xqr/ETXKGu0CkgIbkQOQupJQtdyqNrvzImsM38=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05/08/2020 12:57, Jacopo Mondi wrote:
> Add a small note to the VIDIOC_SUBDEV_G_SELECTION IOCTL documentation
> to report that the API can be used to access an image sensor pixel array

an -> the

> properties.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  .../userspace-api/media/v4l/vidioc-subdev-g-selection.rst     | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-selection.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-selection.rst
> index 06c9553ac48f5..05539f5deace2 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-selection.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-selection.rst
> @@ -46,6 +46,10 @@ The selections are used to configure various image processing
>  functionality performed by the subdevs which affect the image size. This
>  currently includes cropping, scaling and composition.
>  
> +This API can also be used to retrieve immutable properties of the device
> +represented by the subdev, such as the pixel matrix properties of an image
> +sensor.
> +
>  The selection API replaces
>  :ref:`the old subdev crop API <VIDIOC_SUBDEV_G_CROP>`. All the
>  function of the crop API, and more, are supported by the selections API.
> 

