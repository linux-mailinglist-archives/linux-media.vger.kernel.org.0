Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E83D34B6C6
	for <lists+linux-media@lfdr.de>; Sat, 27 Mar 2021 12:19:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230388AbhC0LTF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 Mar 2021 07:19:05 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:56111 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230288AbhC0LTF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 Mar 2021 07:19:05 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id Q6y4lxFusMxedQ6y7lW0y7; Sat, 27 Mar 2021 12:19:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616843943; bh=aj5LwXOasYXeMz0lB/0FUlLDGJMG5MT2EJF0mTpKlNA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=DIcNgSZrG6vbYVOD0/1JUveo65qZSFLVKaRZv7MUDN8GqfnrQcWoZo7ZEvrH8u4w8
         JyzVEP600zA9bPmDJ6t8+clPlDmhb1JQvyX/aUuZuhD+Ozk9DrfX8KUvmZ6gHwalC3
         rkWItieEkNZSPn3t0fsWt2heiwyjqvE1oSKGUJc1bLjYtqScAn53Y+DqX4RKDYBpP6
         Is4IjPe54n9NF6YIiQjI4wGvWJgOPQKYm2Ggf0mysjNz+0jZITGCIdyrdZ2mko+ohi
         BSqAB/CAzB5zvlBIAcgqC8QuXV2gI29PL5M3Nua43qN+ankFYtH3Sbj7QR0Mwj93RC
         jlqvv2iftpeWQ==
Subject: Re: [PATCH v9 17/22] media: docs: Document the behaviour of uvcdriver
To:     Ricardo Ribalda <ribalda@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
References: <20210326095840.364424-1-ribalda@chromium.org>
 <20210326095840.364424-18-ribalda@chromium.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <417be36b-850a-84b2-dc68-c1bec85e2edb@xs4all.nl>
Date:   Sat, 27 Mar 2021 12:19:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210326095840.364424-18-ribalda@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfKEaX5oJEl58FzuFBMh+n45oVn63JNt4XyERqTdxeJvnB6bTPXNkfD5lUGNZdLMOrocl23+YUPptTV6MCwU42tms1gQ+gwllD5Cbf/QGIntXX3j0pLlM
 euxZ7bDGbyb4DX6Nl8/3gjIzOfR81v4nNuzEAbaUzFND+xAsd7gJiC59F9EqYsfslzEODmk6CzAvginU5yh3bDi3m9WhrOkBuQZ2Uh2Pd3UxE/V7Kbz/mS3a
 WKjUJZ5VDA4mNs80uDd6J9tNqA5pOV/hzEHuyqiRHK9qygossmuNFjrmoRmMpExXN7f+d7JGBtBWdOKDkOz2vPb6/HmWGODziRRtUuvQSwWcGWrxKCNGnMhG
 seTXWQTYJMmpWnMw/MCWKPvFd7RgPFCh1bCORdaeAqV2LuFBS11cKyo07YSm36ZGe9GZEjh+
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 26/03/2021 10:58, Ricardo Ribalda wrote:
> The uvc driver relies on the camera firmware to keep the control states
> and therefore is not capable of changing an inactive control.
> 
> Allow returning -EACESS in those cases.

-EACCES

> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  Documentation/userspace-api/media/v4l/vidioc-g-ctrl.rst      | 5 +++++
>  Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst | 5 +++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ctrl.rst
> index 4f1bed53fad5..8c0a203385c2 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-g-ctrl.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-g-ctrl.rst
> @@ -95,3 +95,8 @@ EBUSY
>  
>  EACCES
>      Attempt to set a read-only control or to get a write-only control.
> +
> +    Or if there is an attempt to set an inactive control and the driver is
> +    not capable of keeping the new value until the control is active again.

keeping: 'caching' or 'storing' are better words, I think.

> +    This is the case for drivers that do not use the standard control
> +    framework and rely purely on the hardware to keep the controls' state.

I would drop that last sentence. It is not relevant information to the users of
the API.

> diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> index b9c62affbb5a..bb7de7a25241 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> @@ -438,3 +438,8 @@ EACCES
>  
>      Or the ``which`` field was set to ``V4L2_CTRL_WHICH_REQUEST_VAL`` but the
>      device does not support requests.
> +
> +    Or if there is an attempt to set an inactive control and the driver is
> +    not capable of keeping the new value until the control is active again.
> +    This is the case for drivers that do not use the standard control
> +    framework and rely purely on the hardware to keep the controls' state.

Same comments as above.

> 

Regards,

	Hans
