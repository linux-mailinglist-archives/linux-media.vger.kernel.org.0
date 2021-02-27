Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0519326CDF
	for <lists+linux-media@lfdr.de>; Sat, 27 Feb 2021 12:14:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229953AbhB0LOU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 Feb 2021 06:14:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229863AbhB0LOU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 Feb 2021 06:14:20 -0500
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 039C3C06174A;
        Sat, 27 Feb 2021 03:13:39 -0800 (PST)
Received: by mail-io1-xd2d.google.com with SMTP id f20so12448057ioo.10;
        Sat, 27 Feb 2021 03:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wxWe96tg9L0gLfWuwtSgIPZWbI4zsrE6k/GHICo+2wo=;
        b=FehCN4w/80GZabbXZyksYgsHIh+Y3IwjDE+rbezyBLqsA/38m6vwryWTYTm2Moqmc9
         AzPY3kalMBzHpgEl93gAceAx86EcRsKxMygMxULjhAcObDtyVCXd8cFilUmF8AN4t80M
         i+HzbCQVilvPKDJ7jVE/WzXk0mQO5aHRSc6ikYvc/EnqIFsQzU7ezLGn7uJNOzS4Futv
         Q5g8DnJFHqqvvu66LqekrbTowuwV7e4MwIDMW4cIYewWtnXg13Xy+hvIKhANlSpt0rbR
         SC4+Tfa4DKPzgzKfWzV61XTismRFPbsoIrtfco4mxG5hV338O1FRpKJmwpCwZXcnstEX
         +cww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wxWe96tg9L0gLfWuwtSgIPZWbI4zsrE6k/GHICo+2wo=;
        b=h0ae6n6h3lN/0IL+8HNwATR8Y21lVvF279nHeCuIg4oK43ggtDkCUkDMhmBzbrQnjX
         5XByo/sr3qJjIk4zbz5eJvRCp4r0kLu02PMfS97Q/LJCtSzuiV1A8LoUXe/0gvE1g2f9
         oEfoVuKEFvXtWCn4DPGCfw1SOJHACEQFy5Nk+4ekB5Hn0nVUvyppYjoVeahK+O7Wav5B
         PBIPM8Fk6G0lMZlUSdsyADTY6DsHJ/SOMqQawOmrZB8kG8uP0bjrgEMAd+NCN2u4cYW3
         IC07Th0PCU2bPAZcnA1InBnKukElIauA8Iv1XMEbd0AKXs7ZZLzEQQmibQzVPfXRn0iB
         BSgA==
X-Gm-Message-State: AOAM532WGAtUoJOS+GTEWyMPcJil/UeYo2IRgfpzH+IYQpmlPe0bWYx4
        6lM1qVvc1q7CBJUiQVuatyv545UScIV6xQUaPnw=
X-Google-Smtp-Source: ABdhPJwdTIm6gLs7ToV79kETlNfvUCLt7ooDLR2EpOtDNpTLkADt2dt1gDdCG1Jcu50ygs7xmUzQick0eYDYDiepW3g=
X-Received: by 2002:a6b:fc16:: with SMTP id r22mr6208311ioh.102.1614424419121;
 Sat, 27 Feb 2021 03:13:39 -0800 (PST)
MIME-Version: 1.0
References: <67c1aa1e5f29ef0cb4127e6303a5ffa1a391afc2.1614260439.git.mchehab+huawei@kernel.org>
In-Reply-To: <67c1aa1e5f29ef0cb4127e6303a5ffa1a391afc2.1614260439.git.mchehab+huawei@kernel.org>
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date:   Sat, 27 Feb 2021 12:13:28 +0100
Message-ID: <CAKXUXMwviRBB_xnuBLRFRhg6eBXKjMakQLaAfqQiQEsACJjfRw@mail.gmail.com>
Subject: Re: [PATCH v2] media: add a subsystem profile documentation
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        linuxarm@huawei.com, mauro.chehab@huawei.com,
        Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Feb 25, 2021 at 2:41 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
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
> +
> +There is a set of compliance tools at https://git.linuxtv.org/v4l-utils.git/
> +that should be used in order to check if the drivers are properly
> +implementing the media APIs.
> +
> +Those tests need to pass before the patches go upstream.
> +
> +Also, please notice that we build the Kernel with::
> +
> +       make CF=-D__CHECK_ENDIAN__ CONFIG_DEBUG_SECTION_MISMATCH=y C=1 W=1 CHECK=check_script
> +
> +Where the check script is::
> +
> +       #!/bin/bash
> +       /devel/smatch/smatch -p=kernel $@ >&2
> +       /devel/sparse/sparse $@ >&2
> +
> +Be sure to not introduce new warnings on your patches without a
> +very good reason.
> +
> +Style Cleanup Patches
> ++++++++++++++++++++++
> +
> +Style-cleanups are welcome when they come together with other changes
> +at the files where the style changes will affect.
> +
> +We may accept pure standalone style-cleanups, but they should ideally
> +be one patch for the hole subsystem (if the cleanup is low volume),
> +or at least be grouped per directory. So, for example, if you're doing
> +big cleanup change set at drivers under drivers/media, please send a single
> +patch for all drivers under drivers/media/pci, another one for
> +drivers/media/usb and so on.
> +
> +Coding Style Addendum
> ++++++++++++++++++++++
> +
> +Media development uses checkpatch on strict mode to verify the code style,
> +e. g.::
> +
> +       $ ./script/checkpatch.pl --strict

Just a typo: script -> scripts

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
> diff --git a/Documentation/maintainer/maintainer-entry-profile.rst b/Documentation/maintainer/maintainer-entry-profile.rst
> index b7a627d6c97d..5d5cc3acdf85 100644
> --- a/Documentation/maintainer/maintainer-entry-profile.rst
> +++ b/Documentation/maintainer/maintainer-entry-profile.rst
> @@ -102,3 +102,4 @@ to do something different in the near future.
>     ../doc-guide/maintainer-profile
>     ../nvdimm/maintainer-entry-profile
>     ../riscv/patch-acceptance
> +   ../driver-api/media/maintainer-entry-profile
> --
> 2.29.2
>
>
