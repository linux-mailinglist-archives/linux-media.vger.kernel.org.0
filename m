Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54961327B93
	for <lists+linux-media@lfdr.de>; Mon,  1 Mar 2021 11:08:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232201AbhCAKHc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Mar 2021 05:07:32 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:37626 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232078AbhCAKGt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Mar 2021 05:06:49 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 964DF332;
        Mon,  1 Mar 2021 11:06:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1614593164;
        bh=Wl3I0u50wgmq9rNWez5p4p+g9yNqDYwUoJfOG5klfMs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hMDcDsNEPSFfK/6awVNYCOK+OFyexWHqL3oH/1ZfiltTko0557iW6lImidttrAoNW
         RDNLYVOV20j5z0WqXtc8puibZ0wv4eYncUW9XD3I/pHRv4WGlsrv/bD+ZL1uHvaY0i
         PpjNOhqKzFgHB+gfr/tuDti18TIPNiyNOimf9pQc=
Date:   Mon, 1 Mar 2021 12:05:37 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        linuxarm@huawei.com, mauro.chehab@huawei.com,
        Jonathan Corbet <corbet@lwn.net>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] media: add a subsystem profile documentation
Message-ID: <YDy8cdNPHkKsvx0J@pendragon.ideasonboard.com>
References: <bbe8dc3119b21317616535b7062811968a89b85e.1614591312.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bbe8dc3119b21317616535b7062811968a89b85e.1614591312.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Thank you for the patch.

On Mon, Mar 01, 2021 at 10:35:54AM +0100, Mauro Carvalho Chehab wrote:
> Document the basic policies of the media subsystem profile.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
> v3: address a few nitpicks from Randy and Lukas
> v2: fix the Documentation/*/media directories
> 
> 
>  Documentation/driver-api/media/index.rst      |   2 +
>  .../media/maintainer-entry-profile.rst        | 161 ++++++++++++++++++
>  .../maintainer/maintainer-entry-profile.rst   |   1 +
>  3 files changed, 164 insertions(+)
>  create mode 100644 Documentation/driver-api/media/maintainer-entry-profile.rst
> 
> diff --git a/Documentation/driver-api/media/index.rst b/Documentation/driver-api/media/index.rst
> index c140692454b1..2ad71dfa8828 100644
> --- a/Documentation/driver-api/media/index.rst
> +++ b/Documentation/driver-api/media/index.rst
> @@ -28,6 +28,8 @@ Please see:
>      :maxdepth: 5
>      :numbered:
>  
> +    maintainer-entry-profile
> +
>      v4l2-core
>      dtv-core
>      rc-core
> diff --git a/Documentation/driver-api/media/maintainer-entry-profile.rst b/Documentation/driver-api/media/maintainer-entry-profile.rst
> new file mode 100644
> index 000000000000..b3c4effbb1cf
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

maybe "analog and digital TV capture and output" ? I don't think we
support TVs themselves :-)

> +and media pipeline control.
> +
> +It covers, mainly, the contents of those directories:
> +
> +  - drivers/media
> +  - drivers/staging/media
> +  - Documentation/admin-guide/media

And Documentation/devicetree/bindings/media/ ?

> +  - Documentation/driver-api/media
> +  - Documentation/userspace-api/media
> +  - include/media
> +
> +Both media userspace and Kernel APIs are documented and should be kept in

s/and should be kept/and the documentation should be kept/ ?

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

Should me mention checking lore.kernel.org to see if the mail has been
delivered ?

> +
> +Sub-maintainers
> ++++++++++++++++

Not something to be addressed now, but I'd like some day to rename
"sub-maintainer" to something that has less of an underling note to it.

> +
> +At the media subsystem, we have a group of experienced developers that
> +are responsible for doing the code reviews at the drivers (called
> +sub-maintainers), and another senior developer responsible for the
> +subsystem as a hole. For core changes, whenever possible, multiple

s/hole/whole/

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
> +Cc:ed when those are submitted.

I may have moved this to the overview section as it's not really
specific to the media subsystem, but I won't insist.

> +There is a set of compliance tools at https://git.linuxtv.org/v4l-utils.git/
> +that should be used in order to check if the drivers are properly
> +implementing the media APIs.

Should we list and name the tools explicitly ?

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
> +Style cleanups are welcome when they come together with other changes
> +at the files where the style changes will affect.
> +
> +We may accept pure standalone style cleanups, but they should ideally
> +be one patch for the whole subsystem (if the cleanup is low volume),
> +or at least be grouped per directory. So, for example, if you're doing a
> +big cleanup change set at drivers under drivers/media, please send a single
> +patch for all drivers under drivers/media/pci, another one for
> +drivers/media/usb and so on.
> +
> +Coding Style Addendum
> ++++++++++++++++++++++
> +
> +Media development uses checkpatch on strict mode to verify the code style,
> +e.g.::
> +
> +	$ ./scripts/checkpatch.pl --strict
> +
> +Please notice that the goal here is to improve code readability. On a few
> +cases, checkpatch may actually point to something that would look worse.
> +
> +So, you should use good send sense here, being prepared to justify any

s/send sense/sense/ ? Or common sense ?

> +coding style decision.

The last part of the sentence is a bit harsh, it makes it sound
submitters will go through a court trial :-) Maybe the following would
be better ?

So, you should use common sense here, and can depart from the rules
enforced by checkstyle.pl if you have good reasons to do so.

> +
> +Please also notice that, on some cases, when you fix one issue, you may
> +receive warnings about lines longer than 80 columns. It is fine to have
> +longer lines if this means that other warnings will be fixed by that.

The kernel now allows longer lines. I'm not advocating going routinely
over the 80 columns limit, but this paragraph is a bit outdated.

With these issues fixed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

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
> diff --git a/Documentation/maintainer/maintainer-entry-profile.rst b/Documentation/maintainer/maintainer-entry-profile.rst
> index b7a627d6c97d..5d5cc3acdf85 100644
> --- a/Documentation/maintainer/maintainer-entry-profile.rst
> +++ b/Documentation/maintainer/maintainer-entry-profile.rst
> @@ -102,3 +102,4 @@ to do something different in the near future.
>     ../doc-guide/maintainer-profile
>     ../nvdimm/maintainer-entry-profile
>     ../riscv/patch-acceptance
> +   ../driver-api/media/maintainer-entry-profile

-- 
Regards,

Laurent Pinchart
