Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3CDD326ABC
	for <lists+linux-media@lfdr.de>; Sat, 27 Feb 2021 01:25:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229949AbhB0AYo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Feb 2021 19:24:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229618AbhB0AYn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Feb 2021 19:24:43 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06EA5C061574;
        Fri, 26 Feb 2021 16:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=MiXuw9pY4dNQm+8S7V4mY3M5EpoJSQlwICOeG/t1UDI=; b=ZzUs2f6eEWMkEmCQD41C7Lgh+b
        GFGp2YdavOPxNworB6WnzcTQH7rqry8TAXJozyX7BWoVON3TmdTOziLw1DT1ait8mbvt4QCCDw0d4
        DIT6+EqMQpGsD6RpyzKfWEH6LyBJf0PYQSicsoJK1iNQ1SL83cxqR2ADanMjZIROYtlL5jFmHc+h/
        Y1TRF1ACwWjQK6Mzk/92s4PBq9myDt8vKooaCYLwMo8Jhr3yHy+i23sNQiqqjSvjEhFlPEIOeD8u4
        uUGyyCax3KyZC/6O5B0/u1k83h3974Lrnd9i9ifXAlMcRgmqpKaFcr17h92S6sN77NPoK2i9fZkBX
        zU8L7NUw==;
Received: from [2601:1c0:6280:3f0::3ba4]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1lFnOq-0001oE-J3; Sat, 27 Feb 2021 00:24:00 +0000
Subject: Re: [PATCH v2] media: add a subsystem profile documentation
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Jonathan Corbet <corbet@lwn.net>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <67c1aa1e5f29ef0cb4127e6303a5ffa1a391afc2.1614260439.git.mchehab+huawei@kernel.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <bb836e27-82e8-f86b-c89b-a8937eb9ca62@infradead.org>
Date:   Fri, 26 Feb 2021 16:23:55 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <67c1aa1e5f29ef0cb4127e6303a5ffa1a391afc2.1614260439.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro-


On 2/25/21 5:41 AM, Mauro Carvalho Chehab wrote:
> Document the basic policies of the media subsystem profile.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
> 
> v2: fix the Documentation/*/media directories
> 
> 
>  Documentation/driver-api/media/index.rst      |   2 +
>  .../media/maintainer-entry-profile.rst        | 161 ++++++++++++++++++
>  .../maintainer/maintainer-entry-profile.rst   |   1 +
>  3 files changed, 164 insertions(+)
>  create mode 100644 Documentation/driver-api/media/maintainer-entry-profile.rst
> 

> diff --git a/Documentation/driver-api/media/maintainer-entry-profile.rst b/Documentation/driver-api/media/maintainer-entry-profile.rst
> new file mode 100644
> index 000000000000..6318be833bfb
> --- /dev/null
> +++ b/Documentation/driver-api/media/maintainer-entry-profile.rst
> @@ -0,0 +1,161 @@
> +Media Subsystem Profile
> +=======================
> +
> +Overview
> +--------
> +
> +The media subsystem covers support for a variety of devices: stream
> +capture, analog and digital TV, cameras, remote controllers, HDMI CEC
> +and media pipeline control.
> +
> +It covers, mainly, the contents of those directories:
> +
> +  - drivers/media
> +  - drivers/staging/media
> +  - Documentation/admin-guide/media
> +  - Documentation/driver-api/media
> +  - Documentation/userspace-api/media
> +  - include/media
> +
> +Both media userspace and Kernel APIs are documented and should be kept in
> +sync with the API changes. It means that all patches that add new
> +features to the subsystem should also bring changes to the corresponding
> +API files.
> +
> +Due to the size and wide scope of the media subsystem, media's
> +maintainership model is to have sub-maintainers that have a broad
> +knowledge of a specific aspect of the subsystem. It is the sub-maintainers'
> +task to review the patches, providing feedback to users if the patches are
> +following the subsystem rules and are properly using the media kernel and
> +userspace APIs.
> +
> +Patches for the media subsystem should be sent to the media mailing list
> +at linux-media@vger.kernel.org as plain text only e-mail. Emails with
> +HTML will be automatically rejected by the mail server. It could be wise
> +to also copy the sub-maintainer(s).
> +
> +Media's workflow is heavily based on Patchwork, meaning that, once a patch
> +is submitted, it should appear at:
> +
> +   - https://patchwork.linuxtv.org/project/linux-media/list/
> +
> +If it doesn't automatically appear there after a few minutes, then
> +probably something got wrong on your submission. Please check if the
> +email is in plain text only and if your emailer is not mangling with
> +whitespaces before complaining or submitting them again.
> +
> +Sub-maintainers
> ++++++++++++++++
> +
> +At the media subsystem, we have a group of experienced developers that
> +are responsible for doing the code reviews at the drivers (called
> +sub-maintainers), and another senior developer responsible for the
> +subsystem as a hole. For core changes, whenever possible, multiple
> +media (sub-)maintainers do the review.
> +
> +The sub-maintainers work on specific areas of the subsystem, as
> +described below:
> +
> +Digital TV:
> +  Sean Young <sean@mess.org>
> +
> +HDMI CEC:
> +  Hans Verkuil <hverkuil@xs4all.nl>
> +
> +Media controller drivers:
> +  Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> +
> +Remote Controllers:
> +  Sean Young <sean@mess.org>
> +
> +Sensor drivers:
> +  Sakari Ailus <sakari.ailus@linux.intel.com>
> +
> +V4L2 drivers:
> +  Hans Verkuil <hverkuil@xs4all.nl>
> +
> +Submit Checklist Addendum
> +-------------------------
> +
> +Patches that change the Open Firmware/Device Tree bindings should be
> +reviewed by the Device Tree maintainers. So, DT maintainers should be
> +c/c when those are submitted.

   Cc:ed

> +
> +There is a set of compliance tools at https://git.linuxtv.org/v4l-utils.git/
> +that should be used in order to check if the drivers are properly
> +implementing the media APIs.
> +
> +Those tests need to pass before the patches go upstream.
> +
> +Also, please notice that we build the Kernel with::
> +
> +	make CF=-D__CHECK_ENDIAN__ CONFIG_DEBUG_SECTION_MISMATCH=y C=1 W=1 CHECK=check_script
> +
> +Where the check script is::
> +
> +	#!/bin/bash
> +	/devel/smatch/smatch -p=kernel $@ >&2
> +	/devel/sparse/sparse $@ >&2
> +
> +Be sure to not introduce new warnings on your patches without a
> +very good reason.
> +
> +Style Cleanup Patches
> ++++++++++++++++++++++
> +
> +Style-cleanups are welcome when they come together with other changes

   Style cleanups

> +at the files where the style changes will affect.
> +
> +We may accept pure standalone style-cleanups, but they should ideally

                                 style cleanups,

> +be one patch for the hole subsystem (if the cleanup is low volume),

                        whole (or entire)

> +or at least be grouped per directory. So, for example, if you're doing

                                                                    doing a

> +big cleanup change set at drivers under drivers/media, please send a single
> +patch for all drivers under drivers/media/pci, another one for
> +drivers/media/usb and so on.
> +
> +Coding Style Addendum
> ++++++++++++++++++++++
> +
> +Media development uses checkpatch on strict mode to verify the code style,
> +e. g.::

usually no space (in the kernel source tree)
   e.g.::

> +
> +	$ ./script/checkpatch.pl --strict
> +
> +Please notice that the goal here is to improve code readability. On a few
> +cases, checkpatch may actually point to something that would look worse.
> +
> +So, you should use good send sense here, being prepared to justify any
> +coding style decision.
> +
> +Please also notice that, on some cases, when you fix one issue, you may
> +receive warnings about lines longer than 80 columns. It is fine to have
> +longer lines if this means that other warnings will be fixed by that.
> +
> +Yet, if you're having more than 80 columns on a line, please consider
> +simplifying the code - if too indented - or to use shorter names for
> +variables.
> +
> +Key Cycle Dates
> +---------------
> +
> +New submissions can be sent at any time, but if they intend to hit the
> +next merge window they should be sent before -rc5, and ideally stabilized
> +in the linux-media branch by -rc6.
> +
> +Review Cadence
> +--------------
> +
> +Provided that your patch is at https://patchwork.linuxtv.org, it should
> +be sooner or later handled, so you don't need to re-submit a patch.
> +
> +Except for bug fixes, we don't usually add new patches to the development
> +tree between -rc6 and the next -rc1.
> +
> +Please notice that the media subsystem is a high traffic one, so it
> +could take a while for us to be able to review your patches. Feel free
> +to ping if you don't get a feedback in a couple of weeks or to ask
> +other developers to publicly add Reviewed-by and, more importantly,
> +Tested-by tags.
> +
> +Please note that we expect a detailed description for Tested-by,
> +identifying what boards were used at the test and what it was tested.

Good info here.
Thanks.

-- 
~Randy

