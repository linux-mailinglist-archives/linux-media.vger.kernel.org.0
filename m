Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B603327C37
	for <lists+linux-media@lfdr.de>; Mon,  1 Mar 2021 11:33:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234510AbhCAKcp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Mar 2021 05:32:45 -0500
Received: from lahtoruutu.iki.fi ([185.185.170.37]:50712 "EHLO
        lahtoruutu.iki.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234507AbhCAKce (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Mar 2021 05:32:34 -0500
Received: from hillosipuli.retiisi.eu (213-243-181-26.bb.dnainternet.fi [213.243.181.26])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id B8E2B1B0008C;
        Mon,  1 Mar 2021 12:31:34 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1614594694;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=gZ4ICciPddR1nv+jyqklGIE6bO2QJktQ2TrexBn51y0=;
        b=Oln75znMAuqxAZxkHKnAuviRvV+69QXchLRCs5O3wRWcBOVTRWPlFg2FrA34BGs0aRXeKo
        jkTJ8w3MXY371+d3Wh9fwo1F1VSHZDAN350L3irVgW0RypGabBb3LaLGyTsapzUe2O9VBy
        ehufvmp0+mNtbRzkZ5qtT9+9d89Iuw1kU6uKSF5XVkEdWN8TvBARPfRajtmWPDBQ/2y9LX
        P5YaQYTtNUno2kKoNbUyptziOn+nU3Fe+PyvcFfoFiipDdkrrDtbhKyPsIgdNFG/pPtqGg
        fTWHSi7EKYrxFVFveHda5nMCRXHYRvJLpnb6ARrdfA9MJoQoy/80GrqV6+oDAA==
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id D65FE634C87;
        Mon,  1 Mar 2021 12:29:36 +0200 (EET)
Received: from localhost ([127.0.0.1] helo=valkosipuli.retiisi.eu)
        by valkosipuli.localdomain with esmtp (Exim 4.92)
        (envelope-from <sakari.ailus@iki.fi>)
        id 1lGfpu-00017Y-KO; Mon, 01 Mar 2021 12:31:34 +0200
Date:   Mon, 1 Mar 2021 12:31:34 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        linuxarm@huawei.com, mauro.chehab@huawei.com,
        Jonathan Corbet <corbet@lwn.net>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] media: add a subsystem profile documentation
Message-ID: <20210301103133.GK3@valkosipuli.retiisi.eu>
References: <bbe8dc3119b21317616535b7062811968a89b85e.1614591312.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bbe8dc3119b21317616535b7062811968a89b85e.1614591312.git.mchehab+huawei@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1614594694; a=rsa-sha256;
        cv=none;
        b=RSVOi5P1T/v0Qcvn31BlQWeQRJiyR/xAO75QLYUBpS+1bcib6VQbKzNOrSDHW9VQRTHOZL
        h5sSSxWthhODTU9IIzKQlvIGpTq8NA78RXPxbTGChodkNhXgjJcA5XUtq+gLsYkn26wYhq
        aTaP9ZKEUzLdXhgDVh5m58CjzJx3fsabhXDhk3Pn7jeGIUoIOA74EtM3iADCQtGihC1WhG
        +V6mjJzErQXLXBFF6fx4nI/nuk/lJKY7HwcUh1DMa6wvYbSDfkeyNo6Hmru84Aj5AFRL5q
        X9X1vffKc3xI97Q7+eDIDYDPvzd1P3z5g394rZeFLyDYMRzq+NHkUk91BSUMug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1614594694;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=gZ4ICciPddR1nv+jyqklGIE6bO2QJktQ2TrexBn51y0=;
        b=lo7lPyzqLPqcqpLx6b1cZt/VKoW0yMK84omgfH3mTn+Whflhezn1J+DCWWLDEWL60S2mTz
        EIhsnwhGuVdc9NML86bVii6qsCyhF/M4KheXt8cvBptztlVD0JV2KiPMrJ0S7GFEKLq/kH
        dYJW7Bkg5lcCGSZcNdpr4atMCg1kTRp0ZjhawKbIYuBxiOLcZer4+DLSeDwWB4sdy3ymO3
        SliG2hULAtrClSTFk13HHIRZPUM83GV8BH3a0062fQucy7QSF1nxXLwlR4gr3CZm5Fn+fj
        S86l57Nr6/Ly/v1rMGVgkDdgDcRaoSXbgvbTtPzjnzyie8pSD46hZcWI6UPngw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Thanks for the patch. Could you cc me the future versions, please?

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

Could you add me:

v4l2-async, v4l2-fwnode, v4l2-flash-led-class.

ISP drivers are generally complicated; I wonder if it should be me, Laurent
and Hans. It'd be nice to add ISPs, too.

If the order is reversed, that could be expressed fairly neatly.

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

How about replacing the two paragraphs with:

Note that addressing one checkpatch.pl issue (of any kind) alone may lead
to having longer lines than 80 characters per line. While this is not
strictly prohibited, effort should be always made towards staying within 80
characters per line. This could include using refactoring code that leads
to less indentation, shorter variable or function names and last but not
least, simply wrapping the lines.

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
Kind regards,

Sakari Ailus
