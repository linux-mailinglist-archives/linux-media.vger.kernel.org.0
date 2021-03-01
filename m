Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51218327AFC
	for <lists+linux-media@lfdr.de>; Mon,  1 Mar 2021 10:40:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234046AbhCAJkV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Mar 2021 04:40:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:48924 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234043AbhCAJjw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Mar 2021 04:39:52 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8A00664E40;
        Mon,  1 Mar 2021 09:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614591550;
        bh=PggmM8usi4rkUxemmD0zHVsTxHP7kL5+0OThmxC+H5M=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=kko4+bFoP1VYHV4bEAVjaaLNS+ot4v9d+KuRW1LL16lrmvUrTsm/UNwX78fUXc8rn
         1cyjOTHTE5CbvpfKOiSRMsZa+m1bEnEB0wKDq0bpHaF56EOLmbHQLYJaH/oW3mWJ3l
         31aGgeVs9d9DkN3BqL+pn4gdt9b2CttPeIWzH74+DqJUgDFAaBavEamO6H2v8+buji
         l3Z9MSiRGueVoJVvULduTZe6/xOcIhZPcua4ba2m0200ttUYeSf7EVdrIhueNkYB7g
         BlL1+8WEK0DPTKolVoNqtj+dwkxUvtnr+NhG77zHODresLQryZ4HbBfxJElsVDzo+0
         L3y5uH5YkA87g==
Date:   Mon, 1 Mar 2021 10:39:04 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        linuxarm@huawei.com, mauro.chehab@huawei.com,
        Jonathan Corbet <corbet@lwn.net>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: add a subsystem profile documentation
Message-ID: <20210301103904.24493e19@coco.lan>
In-Reply-To: <bb836e27-82e8-f86b-c89b-a8937eb9ca62@infradead.org>
References: <67c1aa1e5f29ef0cb4127e6303a5ffa1a391afc2.1614260439.git.mchehab+huawei@kernel.org>
        <bb836e27-82e8-f86b-c89b-a8937eb9ca62@infradead.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 26 Feb 2021 16:23:55 -0800
Randy Dunlap <rdunlap@infradead.org> escreveu:

> Hi Mauro-

Thanks for the review! Just sent a v3 today that should address
the pointed issues.

Regards,
Mauro

> 
> 
> On 2/25/21 5:41 AM, Mauro Carvalho Chehab wrote:
> > Document the basic policies of the media subsystem profile.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> > 
> > v2: fix the Documentation/*/media directories
> > 
> > 
> >  Documentation/driver-api/media/index.rst      |   2 +
> >  .../media/maintainer-entry-profile.rst        | 161 ++++++++++++++++++
> >  .../maintainer/maintainer-entry-profile.rst   |   1 +
> >  3 files changed, 164 insertions(+)
> >  create mode 100644 Documentation/driver-api/media/maintainer-entry-profile.rst
> >   
> 
> > diff --git a/Documentation/driver-api/media/maintainer-entry-profile.rst b/Documentation/driver-api/media/maintainer-entry-profile.rst
> > new file mode 100644
> > index 000000000000..6318be833bfb
> > --- /dev/null
> > +++ b/Documentation/driver-api/media/maintainer-entry-profile.rst
> > @@ -0,0 +1,161 @@
> > +Media Subsystem Profile
> > +=======================
> > +
> > +Overview
> > +--------
> > +
> > +The media subsystem covers support for a variety of devices: stream
> > +capture, analog and digital TV, cameras, remote controllers, HDMI CEC
> > +and media pipeline control.
> > +
> > +It covers, mainly, the contents of those directories:
> > +
> > +  - drivers/media
> > +  - drivers/staging/media
> > +  - Documentation/admin-guide/media
> > +  - Documentation/driver-api/media
> > +  - Documentation/userspace-api/media
> > +  - include/media
> > +
> > +Both media userspace and Kernel APIs are documented and should be kept in
> > +sync with the API changes. It means that all patches that add new
> > +features to the subsystem should also bring changes to the corresponding
> > +API files.
> > +
> > +Due to the size and wide scope of the media subsystem, media's
> > +maintainership model is to have sub-maintainers that have a broad
> > +knowledge of a specific aspect of the subsystem. It is the sub-maintainers'
> > +task to review the patches, providing feedback to users if the patches are
> > +following the subsystem rules and are properly using the media kernel and
> > +userspace APIs.
> > +
> > +Patches for the media subsystem should be sent to the media mailing list
> > +at linux-media@vger.kernel.org as plain text only e-mail. Emails with
> > +HTML will be automatically rejected by the mail server. It could be wise
> > +to also copy the sub-maintainer(s).
> > +
> > +Media's workflow is heavily based on Patchwork, meaning that, once a patch
> > +is submitted, it should appear at:
> > +
> > +   - https://patchwork.linuxtv.org/project/linux-media/list/
> > +
> > +If it doesn't automatically appear there after a few minutes, then
> > +probably something got wrong on your submission. Please check if the
> > +email is in plain text only and if your emailer is not mangling with
> > +whitespaces before complaining or submitting them again.
> > +
> > +Sub-maintainers
> > ++++++++++++++++
> > +
> > +At the media subsystem, we have a group of experienced developers that
> > +are responsible for doing the code reviews at the drivers (called
> > +sub-maintainers), and another senior developer responsible for the
> > +subsystem as a hole. For core changes, whenever possible, multiple
> > +media (sub-)maintainers do the review.
> > +
> > +The sub-maintainers work on specific areas of the subsystem, as
> > +described below:
> > +
> > +Digital TV:
> > +  Sean Young <sean@mess.org>
> > +
> > +HDMI CEC:
> > +  Hans Verkuil <hverkuil@xs4all.nl>
> > +
> > +Media controller drivers:
> > +  Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > +
> > +Remote Controllers:
> > +  Sean Young <sean@mess.org>
> > +
> > +Sensor drivers:
> > +  Sakari Ailus <sakari.ailus@linux.intel.com>
> > +
> > +V4L2 drivers:
> > +  Hans Verkuil <hverkuil@xs4all.nl>
> > +
> > +Submit Checklist Addendum
> > +-------------------------
> > +
> > +Patches that change the Open Firmware/Device Tree bindings should be
> > +reviewed by the Device Tree maintainers. So, DT maintainers should be
> > +c/c when those are submitted.  
> 
>    Cc:ed
> 
> > +
> > +There is a set of compliance tools at https://git.linuxtv.org/v4l-utils.git/
> > +that should be used in order to check if the drivers are properly
> > +implementing the media APIs.
> > +
> > +Those tests need to pass before the patches go upstream.
> > +
> > +Also, please notice that we build the Kernel with::
> > +
> > +	make CF=-D__CHECK_ENDIAN__ CONFIG_DEBUG_SECTION_MISMATCH=y C=1 W=1 CHECK=check_script
> > +
> > +Where the check script is::
> > +
> > +	#!/bin/bash
> > +	/devel/smatch/smatch -p=kernel $@ >&2
> > +	/devel/sparse/sparse $@ >&2
> > +
> > +Be sure to not introduce new warnings on your patches without a
> > +very good reason.
> > +
> > +Style Cleanup Patches
> > ++++++++++++++++++++++
> > +
> > +Style-cleanups are welcome when they come together with other changes  
> 
>    Style cleanups
> 
> > +at the files where the style changes will affect.
> > +
> > +We may accept pure standalone style-cleanups, but they should ideally  
> 
>                                  style cleanups,
> 
> > +be one patch for the hole subsystem (if the cleanup is low volume),  
> 
>                         whole (or entire)
> 
> > +or at least be grouped per directory. So, for example, if you're doing  
> 
>                                                                     doing a
> 
> > +big cleanup change set at drivers under drivers/media, please send a single
> > +patch for all drivers under drivers/media/pci, another one for
> > +drivers/media/usb and so on.
> > +
> > +Coding Style Addendum
> > ++++++++++++++++++++++
> > +
> > +Media development uses checkpatch on strict mode to verify the code style,
> > +e. g.::  
> 
> usually no space (in the kernel source tree)
>    e.g.::
> 
> > +
> > +	$ ./script/checkpatch.pl --strict
> > +
> > +Please notice that the goal here is to improve code readability. On a few
> > +cases, checkpatch may actually point to something that would look worse.
> > +
> > +So, you should use good send sense here, being prepared to justify any
> > +coding style decision.
> > +
> > +Please also notice that, on some cases, when you fix one issue, you may
> > +receive warnings about lines longer than 80 columns. It is fine to have
> > +longer lines if this means that other warnings will be fixed by that.
> > +
> > +Yet, if you're having more than 80 columns on a line, please consider
> > +simplifying the code - if too indented - or to use shorter names for
> > +variables.
> > +
> > +Key Cycle Dates
> > +---------------
> > +
> > +New submissions can be sent at any time, but if they intend to hit the
> > +next merge window they should be sent before -rc5, and ideally stabilized
> > +in the linux-media branch by -rc6.
> > +
> > +Review Cadence
> > +--------------
> > +
> > +Provided that your patch is at https://patchwork.linuxtv.org, it should
> > +be sooner or later handled, so you don't need to re-submit a patch.
> > +
> > +Except for bug fixes, we don't usually add new patches to the development
> > +tree between -rc6 and the next -rc1.
> > +
> > +Please notice that the media subsystem is a high traffic one, so it
> > +could take a while for us to be able to review your patches. Feel free
> > +to ping if you don't get a feedback in a couple of weeks or to ask
> > +other developers to publicly add Reviewed-by and, more importantly,
> > +Tested-by tags.
> > +
> > +Please note that we expect a detailed description for Tested-by,
> > +identifying what boards were used at the test and what it was tested.  
> 
> Good info here.
> Thanks.
> 



Thanks,
Mauro
