Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F681B6356
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2019 14:36:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731159AbfIRMge (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Sep 2019 08:36:34 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35868 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725902AbfIRMge (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Sep 2019 08:36:34 -0400
Received: from pendragon.ideasonboard.com (126.92.103.87.rev.vodafone.pt [87.103.92.126])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 80CDB325;
        Wed, 18 Sep 2019 14:36:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1568810190;
        bh=NOVNl24Y7oM1bDK7i444lWq36V0g5k8mcsJROEDiqz4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Io2DbQQ6oM1EUCIuPh/CnBfsNMtdAKWvryZWDKanRPMT4ByQq1jEnjozM2Zn6OJxl
         BfnfNfpc6Xk12RN0KHE2g20q1PoI2rtMqDv79dQFxKXAEQQOH+Nuy1iHvlVa/DjuQC
         GJ0HBHkJODvxoYzX9UNJsuAGVQjAENFDflt1z18Y=
Date:   Wed, 18 Sep 2019 15:36:20 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        ksummit-discuss@lists.linuxfoundation.org
Subject: Re: [Ksummit-discuss] [PATCH] media: add a subsystem profile
 documentation
Message-ID: <20190918123620.GA6306@pendragon.ideasonboard.com>
References: <156821693963.2951081.11214256396118531359.stgit@dwillia2-desk3.amr.corp.intel.com>
 <434c05bddd2b364e607e565227487910a8dd9793.1568391461.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <434c05bddd2b364e607e565227487910a8dd9793.1568391461.git.mchehab+samsung@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On Fri, Sep 13, 2019 at 01:19:21PM -0300, Mauro Carvalho Chehab wrote:
> Document the basic policies of the media subsystem profile.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> ---
> 
> That's basically a modified version of:
>     https://patchwork.linuxtv.org/patch/52999/
> 
> Applied to the new template
> 
>  Documentation/media/index.rst                 |   1 +
>  .../media/maintainer-entry-profile.rst        | 140 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  3 files changed, 142 insertions(+)
>  create mode 100644 Documentation/media/maintainer-entry-profile.rst
> 
> diff --git a/Documentation/media/index.rst b/Documentation/media/index.rst
> index 0301c25ff887..ac94685b822a 100644
> --- a/Documentation/media/index.rst
> +++ b/Documentation/media/index.rst
> @@ -12,6 +12,7 @@ Linux Media Subsystem Documentation
>  .. toctree::
>     :maxdepth: 2
>  
> +   maintainer-entry-profile
>     media_uapi
>     media_kapi
>     dvb-drivers/index
> diff --git a/Documentation/media/maintainer-entry-profile.rst b/Documentation/media/maintainer-entry-profile.rst
> new file mode 100644
> index 000000000000..81d3b0f9c36a
> --- /dev/null
> +++ b/Documentation/media/maintainer-entry-profile.rst
> @@ -0,0 +1,140 @@
> +Media Subsystem Profile
> +=======================
> +
> +Overview
> +--------
> +
> +The media subsystem cover support for a variety of devices: stream

s/cover/covers/

> +capture, analog and digital TV, cameras, remote controllers, HDMI CEC
> +and media pipeline control.
> +
> +It covers, mainly, the contents of those directories:
> +
> +  - drivers/media
> +  - drivers/staging/media
> +  - Documentation/media
> +  - include/media
> +
> +Both media userspace and Kernel APIs are documented and should be kept in
> +sync with the API changes. It means that all patches that add new
> +features to the subsystem should also bring changes to the corresponding
> +API files.
> +
> +Also, patches for device drivers that changes the Open Firmware/Device
> +Tree bindings should be reviewed by the Device Tree maintainers.

You may want to make it clear that this covers bindings only, not driver
code that parses the DT. I would just remove "for device drivers", as
the rule should also apply to DT bindings documentation that is not
driver-specific.

> +Due to the size and wide scope of the media subsystem, media's
> +maintainership model is to have sub-maintainers that have a broad
> +knowledge of an specific aspect of the subsystem. It is a
> +sub-maintainers task to review the patches, providing feedback to users

s/sub-maintainers/sub-maintainer's/

> +if the patches are following the subsystem rules and are properly using
> +the media internal and external APIs.
> +
> +Patches for the media subsystem should be sent to the media mailing list
> +at linux-media@vger.kernel.org as plain text only e-mail. Emails with
> +HTML will be automatically rejected by the mail server. There's no need
> +to copy the maintainer or sub-maintainer(s).

There's too much traffic on mailing lists for me to follow everything, I
much prefer being CC'ed on patches.

> +Media's workflow is heavily based on Patchwork, meaning that, once a patch
> +is submitted, it should appear at:
> +
> +   - https://patchwork.linuxtv.org/project/linux-media/list/
> +
> +If it doesn't automatically appear there after a few minutes, then
> +probably something got wrong on your submission. Please check if the
> +email is in plain text only and if your emailer is not mangling with
> +whitespaces before complaining or submit it again.
> +
> +Sub-maintainers
> ++++++++++++++++
> +
> +At the media subsystem, we have a group of senior developers that are

How about "experienced" instead of "senior" ? Quality doesn't always
come with age, neither for people nor wine :-)

> +responsible for doing the code reviews at the drivers (called
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
> +There is a set of compliance tools at https://git.linuxtv.org/v4l-utils.git/
> +that should be used in order to check if the drivers are properly
> +implementing the media APIs.
> +
> +Those tests need to be passed before the patches go upstream.

s/need to be passed/need to pass/

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
> +Be sure to not introduce new warnings on your patches.

While static analysers deliver value, I fear this is a high barrier to
entry for new contributors.

> +
> +Key Cycle Dates
> +---------------
> +
> +New submissions can be sent at any time, but if they intend to hit the
> +next merge window they should be sent before -rc5, and ideally stabilized
> +in the linux-media branch by -rc6.
> +
> +Coding Style Addendum
> +---------------------
> +
> +Media development uses checkpatch on strict mode to verify the code style, e. g.::
> +
> +	$ ./script/checkpatch.pl --strict

But we still accept some warnings. I think this should be documented.

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
> +to ping if you don't get a feedback on a couple of weeks or to ask

s/on a/in a/

> +other developers to publicly add Reviewed-by and, more importantly,
> +Tested-by tags.
> +
> +Please notice that we expect a detailed description for Tested-by,

s/notice/note/

> +identifying what boards were used at the test and what it was tested.
> +
> +Style Cleanup Patches
> +---------------------
> +
> +Style-cleanups are welcome when they come together with other changes
> +at the files where the style changes will affect.
> +
> +We may accept pure standalone style-cleanups, but they should be grouped
> +per directory. So, for example, if you're doing a cleanup at drivers
> +under drivers/media, please send a single patch for all drivers under
> +drivers/media/pci, another one for drivers/media/usb and so on.

How about also stating that if the cleanup is low volume, a single patch
for the whole subsystem is preferred ? I think that should actually be
the rule, with a split to ease review only when the patch would be too
big.

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7c62b45201d7..e7f44ec05a42 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10077,6 +10077,7 @@ W:	https://linuxtv.org
>  Q:	http://patchwork.kernel.org/project/linux-media/list/
>  T:	git git://linuxtv.org/media_tree.git
>  S:	Maintained
> +P:	Documentation/media/maintainer-entry-profile.rst
>  F:	Documentation/devicetree/bindings/media/
>  F:	Documentation/media/
>  F:	drivers/media/

-- 
Regards,

Laurent Pinchart
