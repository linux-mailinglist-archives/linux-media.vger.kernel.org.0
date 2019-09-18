Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26C91B6908
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2019 19:27:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729053AbfIRR1T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Sep 2019 13:27:19 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:40324 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726799AbfIRR1S (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Sep 2019 13:27:18 -0400
Received: from pendragon.ideasonboard.com (unknown [62.28.174.186])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7E2A1325;
        Wed, 18 Sep 2019 19:27:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1568827634;
        bh=bYvBbIYT68EmjsrFSdEGpIVQg/3JOMM3J1uCsKf6UFQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jw45SSEn95/tZJdlohm9zsZdynqtcn92L3hfrNgwU6tYwQdNBuWDyQX0DI0PlT3ey
         S7L3yKzhaUpO7Y7P63i68mon++s6/t7+LTZz4Bki8xgMVhtWfQXyEEHFZimFjSBUqH
         DzOUeDk/pFYxLqfFQgbJNDyHUSl9RJxNf8vwKKEM=
Date:   Wed, 18 Sep 2019 20:27:05 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        ksummit-discuss@lists.linuxfoundation.org
Subject: Re: [Ksummit-discuss] [PATCH] media: add a subsystem profile
 documentation
Message-ID: <20190918172705.GC4734@pendragon.ideasonboard.com>
References: <156821693963.2951081.11214256396118531359.stgit@dwillia2-desk3.amr.corp.intel.com>
 <434c05bddd2b364e607e565227487910a8dd9793.1568391461.git.mchehab+samsung@kernel.org>
 <20190918123620.GA6306@pendragon.ideasonboard.com>
 <20190918105728.24e7eb48@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190918105728.24e7eb48@coco.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On Wed, Sep 18, 2019 at 10:57:28AM -0300, Mauro Carvalho Chehab wrote:
> Em Wed, 18 Sep 2019 15:36:20 +0300 Laurent Pinchart escreveu:
> > On Fri, Sep 13, 2019 at 01:19:21PM -0300, Mauro Carvalho Chehab wrote:
> > > Document the basic policies of the media subsystem profile.
> > > 
> > > Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> > > ---
> > > 
> > > That's basically a modified version of:
> > >     https://patchwork.linuxtv.org/patch/52999/
> > > 
> > > Applied to the new template
> > > 
> > >  Documentation/media/index.rst                 |   1 +
> > >  .../media/maintainer-entry-profile.rst        | 140 ++++++++++++++++++
> > >  MAINTAINERS                                   |   1 +
> > >  3 files changed, 142 insertions(+)
> > >  create mode 100644 Documentation/media/maintainer-entry-profile.rst
> > > 
> > > diff --git a/Documentation/media/index.rst b/Documentation/media/index.rst
> > > index 0301c25ff887..ac94685b822a 100644
> > > --- a/Documentation/media/index.rst
> > > +++ b/Documentation/media/index.rst
> > > @@ -12,6 +12,7 @@ Linux Media Subsystem Documentation
> > >  .. toctree::
> > >     :maxdepth: 2
> > >  
> > > +   maintainer-entry-profile
> > >     media_uapi
> > >     media_kapi
> > >     dvb-drivers/index
> > > diff --git a/Documentation/media/maintainer-entry-profile.rst b/Documentation/media/maintainer-entry-profile.rst
> > > new file mode 100644
> > > index 000000000000..81d3b0f9c36a
> > > --- /dev/null
> > > +++ b/Documentation/media/maintainer-entry-profile.rst
> > > @@ -0,0 +1,140 @@
> > > +Media Subsystem Profile
> > > +=======================
> > > +
> > > +Overview
> > > +--------
> > > +
> > > +The media subsystem cover support for a variety of devices: stream  
> > 
> > s/cover/covers/
> > 
> > > +capture, analog and digital TV, cameras, remote controllers, HDMI CEC
> > > +and media pipeline control.
> > > +
> > > +It covers, mainly, the contents of those directories:
> > > +
> > > +  - drivers/media
> > > +  - drivers/staging/media
> > > +  - Documentation/media
> > > +  - include/media
> > > +
> > > +Both media userspace and Kernel APIs are documented and should be kept in
> > > +sync with the API changes. It means that all patches that add new
> > > +features to the subsystem should also bring changes to the corresponding
> > > +API files.
> > > +
> > > +Also, patches for device drivers that changes the Open Firmware/Device
> > > +Tree bindings should be reviewed by the Device Tree maintainers.  
> > 
> > You may want to make it clear that this covers bindings only, not driver
> > code that parses the DT. I would just remove "for device drivers", as
> > the rule should also apply to DT bindings documentation that is not
> > driver-specific.
> > 
> > > +Due to the size and wide scope of the media subsystem, media's
> > > +maintainership model is to have sub-maintainers that have a broad
> > > +knowledge of an specific aspect of the subsystem. It is a
> > > +sub-maintainers task to review the patches, providing feedback to users  
> > 
> > s/sub-maintainers/sub-maintainer's/
> > 
> > > +if the patches are following the subsystem rules and are properly using
> > > +the media internal and external APIs.
> > > +
> > > +Patches for the media subsystem should be sent to the media mailing list
> > > +at linux-media@vger.kernel.org as plain text only e-mail. Emails with
> > > +HTML will be automatically rejected by the mail server. There's no need
> > > +to copy the maintainer or sub-maintainer(s).  
> > 
> > There's too much traffic on mailing lists for me to follow everything, I
> > much prefer being CC'ed on patches.
> 
> Well, by using patchwork, the best is to take a look on it at least for
> the patches that you're interested. You could script something using
> pwclient in order to make it easier.
> 
> Anyway, not sure if the other sub-maintainers see the same way. From my side,
> I prefer not to be c/c, as this is just more noise, as I just rely on
> patchwork for media patches. What about changing this to:
> 
> 	Patches for the media subsystem should be sent to the media mailing list
> 	at linux-media@vger.kernel.org as plain text only e-mail. Emails with
> 	HTML will be automatically rejected by the mail server. It could be wise 
> 	to also copy the sub-maintainer(s).

That works for me. As this is really a personal preference, is there a
way it could be encoded in MAINTAINERS in a per-person fashion ?
Something that would allow you to opt-out from CC from linux-media (but
possibly opt-in for other parts of the kernel), and allow me to opt-in
for the drivers I maintain ?

> > > +Media's workflow is heavily based on Patchwork, meaning that, once a patch
> > > +is submitted, it should appear at:
> > > +
> > > +   - https://patchwork.linuxtv.org/project/linux-media/list/
> > > +
> > > +If it doesn't automatically appear there after a few minutes, then
> > > +probably something got wrong on your submission. Please check if the
> > > +email is in plain text only and if your emailer is not mangling with
> > > +whitespaces before complaining or submit it again.
> > > +
> > > +Sub-maintainers
> > > ++++++++++++++++
> > > +
> > > +At the media subsystem, we have a group of senior developers that are  
> > 
> > How about "experienced" instead of "senior" ? Quality doesn't always
> > come with age, neither for people nor wine :-)
> > 
> > > +responsible for doing the code reviews at the drivers (called
> > > +sub-maintainers), and another senior developer responsible for the
> > > +subsystem as a hole. For core changes, whenever possible, multiple
> > > +media (sub-)maintainers do the review.
> > > +
> > > +The sub-maintainers work on specific areas of the subsystem, as
> > > +described below:
> > > +
> > > +Digital TV:
> > > +  Sean Young <sean@mess.org>
> > > +
> > > +HDMI CEC:
> > > +  Hans Verkuil <hverkuil@xs4all.nl>
> > > +
> > > +Media controller drivers:
> > > +  Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > +
> > > +Remote Controllers:
> > > +  Sean Young <sean@mess.org>
> > > +
> > > +Sensor drivers:
> > > +  Sakari Ailus <sakari.ailus@linux.intel.com>
> > > +
> > > +V4L2 drivers:
> > > +  Hans Verkuil <hverkuil@xs4all.nl>
> > > +
> > > +Submit Checklist Addendum
> > > +-------------------------
> > > +
> > > +There is a set of compliance tools at https://git.linuxtv.org/v4l-utils.git/
> > > +that should be used in order to check if the drivers are properly
> > > +implementing the media APIs.
> > > +
> > > +Those tests need to be passed before the patches go upstream.  
> > 
> > s/need to be passed/need to pass/
> > 
> > > +
> > > +Also, please notice that we build the Kernel with::
> > > +
> > > +	make CF=-D__CHECK_ENDIAN__ CONFIG_DEBUG_SECTION_MISMATCH=y C=1 W=1 CHECK=check_script
> > > +
> > > +Where the check script is::
> > > +
> > > +	#!/bin/bash
> > > +	/devel/smatch/smatch -p=kernel $@ >&2
> > > +	/devel/sparse/sparse $@ >&2
> > > +
> > > +Be sure to not introduce new warnings on your patches.  
> > 
> > While static analysers deliver value, I fear this is a high barrier to
> > entry for new contributors.
> 
> Will change this to:
> 
> 	Be sure to not introduce new warnings on your patches without a 
> 	very good reason.
> 
> Especially for new contributors, I really expect patches to not introduce
> new warnings, as it is usually a lot more painful to fix them later than
> to ask devs to do things right at the first place.

I fully agree with the goal, but asking a drive-by contributor, who
usually has to go through issues with sending patches through e-mail
already, to install smatch and sparse and use them, is setting the bar
high. I think automating those checks is the way to go.

> > > +
> > > +Key Cycle Dates
> > > +---------------
> > > +
> > > +New submissions can be sent at any time, but if they intend to hit the
> > > +next merge window they should be sent before -rc5, and ideally stabilized
> > > +in the linux-media branch by -rc6.
> > > +
> > > +Coding Style Addendum
> > > +---------------------
> > > +
> > > +Media development uses checkpatch on strict mode to verify the code style, e. g.::
> > > +
> > > +	$ ./script/checkpatch.pl --strict  
> > 
> > But we still accept some warnings. I think this should be documented.
> 
> True, but not sure if we should enter into too specific details here.
> 
> What about adding something like:
> 
> 	Please notice that the goal here is to improve code readability. On a few 
> 	cases, checkpatch may actually point to	something that would look worse. 
> 
> 	So, you	should use good	send sense here, being prepared to justify any 

s/send sense/sense/

> 	coding style decision.

"being prepared to justify" sounds a bit harsh :-) But the general
message is good.

> 
> 	Please also notice that, on some cases,	when you fix one issue,	you may
> 	receive	warnings about lines longer than 80 columns. It	is fine	to have
> 	longer lines if	this means that	other warnings will be fixed by	that.
> 
> 	Yet, if	you're having more than	80 columns on a	line, please consider 
> 	simplifying the	code - if too idented -	or to use shorter names	for 
> 	variables.

That's already quite specific for my taste. We can keep it as-is if you
think it's fine, but we clearly shouldn't go into more details.

> > > +
> > > +Review Cadence
> > > +--------------
> > > +
> > > +Provided that your patch is at https://patchwork.linuxtv.org, it should
> > > +be sooner or later handled, so you don't need to re-submit a patch.
> > > +
> > > +Except for bug fixes, we don't usually add new patches to the development
> > > +tree between -rc6 and the next -rc1.
> > > +
> > > +Please notice that the media subsystem is a high traffic one, so it
> > > +could take a while for us to be able to review your patches. Feel free
> > > +to ping if you don't get a feedback on a couple of weeks or to ask  
> > 
> > s/on a/in a/
> > 
> > > +other developers to publicly add Reviewed-by and, more importantly,
> > > +Tested-by tags.
> > > +
> > > +Please notice that we expect a detailed description for Tested-by,  
> > 
> > s/notice/note/
> > 
> > > +identifying what boards were used at the test and what it was tested.
> > > +
> > > +Style Cleanup Patches
> > > +---------------------
> > > +
> > > +Style-cleanups are welcome when they come together with other changes
> > > +at the files where the style changes will affect.
> > > +
> > > +We may accept pure standalone style-cleanups, but they should be grouped
> > > +per directory. So, for example, if you're doing a cleanup at drivers
> > > +under drivers/media, please send a single patch for all drivers under
> > > +drivers/media/pci, another one for drivers/media/usb and so on.  
> > 
> > How about also stating that if the cleanup is low volume, a single patch
> > for the whole subsystem is preferred ? I think that should actually be
> > the rule, with a split to ease review only when the patch would be too
> > big.
> > 
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 7c62b45201d7..e7f44ec05a42 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -10077,6 +10077,7 @@ W:	https://linuxtv.org
> > >  Q:	http://patchwork.kernel.org/project/linux-media/list/
> > >  T:	git git://linuxtv.org/media_tree.git
> > >  S:	Maintained
> > > +P:	Documentation/media/maintainer-entry-profile.rst
> > >  F:	Documentation/devicetree/bindings/media/
> > >  F:	Documentation/media/
> > >  F:	drivers/media/  
> > 
> 
> I'm enclosing the diff against the past version. I'll send a final version
> once the profiles patchset arrives upstream.
> 
> diff --git a/Documentation/media/maintainer-entry-profile.rst b/Documentation/media/maintainer-entry-profile.rst
> index 81d3b0f9c36a..68d642abe2c1 100644
> --- a/Documentation/media/maintainer-entry-profile.rst
> +++ b/Documentation/media/maintainer-entry-profile.rst
> @@ -4,7 +4,7 @@ Media Subsystem Profile
>  Overview
>  --------
>  
> -The media subsystem cover support for a variety of devices: stream
> +The media subsystem covers support for a variety of devices: stream
>  capture, analog and digital TV, cameras, remote controllers, HDMI CEC
>  and media pipeline control.
>  
> @@ -20,20 +20,20 @@ sync with the API changes. It means that all patches that add new
>  features to the subsystem should also bring changes to the corresponding
>  API files.
>  
> -Also, patches for device drivers that changes the Open Firmware/Device
> -Tree bindings should be reviewed by the Device Tree maintainers.
> +Also, patches that changes the Open Firmware/Device Tree bindings should
> +also be reviewed by the Device Tree maintainers.
>  
>  Due to the size and wide scope of the media subsystem, media's
>  maintainership model is to have sub-maintainers that have a broad
>  knowledge of an specific aspect of the subsystem. It is a
> -sub-maintainers task to review the patches, providing feedback to users
> +sub-maintainer's task to review the patches, providing feedback to users
>  if the patches are following the subsystem rules and are properly using
>  the media internal and external APIs.
>  
>  Patches for the media subsystem should be sent to the media mailing list
>  at linux-media@vger.kernel.org as plain text only e-mail. Emails with
> -HTML will be automatically rejected by the mail server. There's no need
> -to copy the maintainer or sub-maintainer(s).
> +HTML will be automatically rejected by the mail server. It could be wise
> +to also copy the sub-maintainer(s).
>  
>  Media's workflow is heavily based on Patchwork, meaning that, once a patch
>  is submitted, it should appear at:
> @@ -48,8 +48,8 @@ whitespaces before complaining or submit it again.
>  Sub-maintainers
>  +++++++++++++++
>  
> -At the media subsystem, we have a group of senior developers that are
> -responsible for doing the code reviews at the drivers (called
> +At the media subsystem, we have a group of experienced developers that
> +are responsible for doing the code reviews at the drivers (called
>  sub-maintainers), and another senior developer responsible for the
>  subsystem as a hole. For core changes, whenever possible, multiple
>  media (sub-)maintainers do the review.
> @@ -82,7 +82,7 @@ There is a set of compliance tools at https://git.linuxtv.org/v4l-utils.git/
>  that should be used in order to check if the drivers are properly
>  implementing the media APIs.
>  
> -Those tests need to be passed before the patches go upstream.
> +Those tests need to pass before the patches go upstream.
>  
>  Also, please notice that we build the Kernel with::
>  
> @@ -94,7 +94,8 @@ Where the check script is::
>  	/devel/smatch/smatch -p=kernel $@ >&2
>  	/devel/sparse/sparse $@ >&2
>  
> -Be sure to not introduce new warnings on your patches.
> +Be sure to not introduce new warnings on your patches without a
> +very good reason.
>  
>  Key Cycle Dates
>  ---------------
> @@ -110,6 +111,20 @@ Media development uses checkpatch on strict mode to verify the code style, e. g.
>  
>  	$ ./script/checkpatch.pl --strict
>  
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
> +simplifying the code - if too idented - or to use shorter names for
> +variables.
> +
>  Review Cadence
>  --------------
>  
> @@ -121,11 +136,11 @@ tree between -rc6 and the next -rc1.
>  
>  Please notice that the media subsystem is a high traffic one, so it
>  could take a while for us to be able to review your patches. Feel free
> -to ping if you don't get a feedback on a couple of weeks or to ask
> +to ping if you don't get a feedback in a couple of weeks or to ask
>  other developers to publicly add Reviewed-by and, more importantly,
>  Tested-by tags.
>  
> -Please notice that we expect a detailed description for Tested-by,
> +Please note that we expect a detailed description for Tested-by,
>  identifying what boards were used at the test and what it was tested.
>  
>  Style Cleanup Patches
> @@ -134,7 +149,9 @@ Style Cleanup Patches
>  Style-cleanups are welcome when they come together with other changes
>  at the files where the style changes will affect.
>  
> -We may accept pure standalone style-cleanups, but they should be grouped
> -per directory. So, for example, if you're doing a cleanup at drivers
> -under drivers/media, please send a single patch for all drivers under
> -drivers/media/pci, another one for drivers/media/usb and so on.
> +We may accept pure standalone style-cleanups, but they should ideally
> +be one patch for the hole subsystem (if the cleanup is low volume),

s/hole/whole/

> +or at least be grouped per directory. So, for example, if you're doing
> +big cleanup changes at drivers under drivers/media, please send a single
> +patch for all drivers under drivers/media/pci, another one for
> +drivers/media/usb and so on.

-- 
Regards,

Laurent Pinchart
