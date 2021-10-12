Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6A2E42A75C
	for <lists+linux-media@lfdr.de>; Tue, 12 Oct 2021 16:37:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236846AbhJLOjD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Oct 2021 10:39:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230195AbhJLOjC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Oct 2021 10:39:02 -0400
Received: from lb2-smtp-cloud8.xs4all.net (lb2-smtp-cloud8.xs4all.net [IPv6:2001:888:0:108::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A633EC061570
        for <linux-media@vger.kernel.org>; Tue, 12 Oct 2021 07:37:00 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id aItjmsVLtx7rIaItmmMMpp; Tue, 12 Oct 2021 16:36:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1634049419; bh=QIxnDHrupOuYn0w6B0jzW0dfbORlqgsZ4aZSKbgfK9Y=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=oWUAe7nWPx5DzSRBbGPOq9tnotxNMDdotuSHvXwZ7Tuo9dOf2rru/4I/9yptTeu4j
         x/5PUh9iYRAo0U8NteTbqhqaO4cY3pw3b3PSYqs3N3MYJefAionMRx2J8Iwj4dZO+D
         yyAcOtWmXotBhI2IivjgGhZ3PookvTQaOGW5U7vh3A7xm15yykpP7NX2t9N8AzxoHr
         SOLwhBQoivE40vE/0F3p4jRkftMPxcWwgn2U7sL2PMtVt9sK/rD6oU4/Xro/yOQRXn
         LmWodFP0RFNVqFhDzCdaF4ICfWDZ642NA+XkWWNIw6IzX/yOWUvOfO+oVOJliAOlVZ
         95jU0xetrnNVQ==
Subject: Re: [PATCH v9 06/36] media: Documentation: add documentation about
 subdev state
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
 <20211005085750.138151-7-tomi.valkeinen@ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <5af8b700-becc-789c-28d7-b611aa9d53b0@xs4all.nl>
Date:   Tue, 12 Oct 2021 16:36:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211005085750.138151-7-tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfJ1e+JOqZizQkkTMllBI3b00Zo9SUew5WK/KO36iB8TgZizgtGMmlxLuB1BF+bccYIxHRYIa3lmPf8lbFwvaSI21AZgi2EWlKXZiv6UmevAoKUiNkb/L
 BtkZrzHGH/Ua2P4/cRdCe5E/bWDN3Wud/sUdqXJyqU9YWFfY/xfwPjiT0MWCZr3jojfp6UitasQZBFp//xxSM/Acd6TAJ7cPIzBEB96RjMaMDmsLsl7kEyW+
 h9qf+9A+wbsXwtcCWgaRq+kLrnoMFehRuTVDYwHpyo46qRgRh1OeU2STLfwsbEYkoo/R/SKb1D+dkR5bUzzAIU/zg6MZCtn9cu1/c3P5yXDigwmKhZH+xXND
 m2h9/4XmWRH1jn2YpoPGOxAHWCqnjFe1nNrKYQ4bngh1wkl6vbAZWQlAB0IW0EzQDzyXKEw0bk/K8k1trdMJphuWvMZUhtrhJNRvMdWgXLX4JinSQ0IRlVMC
 Bs1ODHREAc6q59HS4GwKTdzKylJRzxz0oTmR6w==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05/10/2021 10:57, Tomi Valkeinen wrote:
> Add documentation about centrally managed subdev state.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  .../driver-api/media/v4l2-subdev.rst          | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
> index 7736da077fb8..c3fd57fff668 100644
> --- a/Documentation/driver-api/media/v4l2-subdev.rst
> +++ b/Documentation/driver-api/media/v4l2-subdev.rst
> @@ -518,6 +518,34 @@ The :c:func:`v4l2_i2c_new_subdev` function will call
>  :c:type:`i2c_board_info` structure using the ``client_type`` and the
>  ``addr`` to fill it.
>  
> +Centrally managed subdev active state
> +-------------------------------------
> +
> +Traditionally V4L2 subdev drivers maintained internal state for the active
> +configuration for the subdev. This is often implemented as an array of struct
> +v4l2_mbus_framefmt, one entry for each pad.
> +
> +In addition to the active configuration, each subdev filehandle has contained

s/contained//

> +an array of struct v4l2_subdev_pad_config, managed by V4L2 core, which
> +contains the TRY configuration.
> +
> +To simplify the subdev drivers the V4L2 subdev API now optionally supports a
> +centrally managed active configuration. A subdev driver must use
> +v4l2_subdev_init_finalize() to initialize the active state between calls to
> +media_entity_pads_init() and v4l2_*_register_subdev(), and must call
> +v4l2_subdev_cleanup() to free the state.
> +
> +The active state must be locked before access, and can be done with

and -> and that

> +v4l2_subdev_lock_state() or v4l2_subdev_lock_active_state().

Note my review of patch 4 regarding the naming of these functions.

> +
> +The V4L2 core will pass either the TRY or ACTIVE state to various subdev ops.
> +Unfortunately all the subdev drivers do not comply with this yet, and may pass

all the subdev drivers do not comply -> not all the subdev drivers comply

> +NULL for the ACTIVE case. This is only a problem for subdev drivers which use
> +the cetrally managed active state and are used in media pipelines with older

cetrally -> centrally

> +subdev drivers. In these cases the called subdev ops must also handle the NULL
> +case. This can be easily managed by the use of
> +v4l2_subdev_validate_and_lock_state() helper.
> +
>  V4L2 sub-device functions and data structures
>  ---------------------------------------------
>  
> 

Regards,

	Hans
