Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC86A4E48EF
	for <lists+linux-media@lfdr.de>; Tue, 22 Mar 2022 23:08:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234203AbiCVWJl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Mar 2022 18:09:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233929AbiCVWJj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Mar 2022 18:09:39 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C0A0CE
        for <linux-media@vger.kernel.org>; Tue, 22 Mar 2022 15:08:10 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id r64so12133687wmr.4
        for <linux-media@vger.kernel.org>; Tue, 22 Mar 2022 15:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=r8wgMri7RP3ArV3Z0gWEm5QsTNDfeDOWoWiHtXSgLjc=;
        b=BS2dxeh8V2odUbMC6689w0s6aae61Ou3UjzG56pRPgZCK5OBQI3XeDUZLZgudNCftR
         vZ4IHLQ9oma69nOwHyG4x5Zwi1KufkgCTyRFmoEVHXrg/84QVWdopn3ypdtuwFNdN3Xa
         jmBOumduI3iaCmzSBVr8Z/B3f6ZcrAJ5Iwa+l1kwKfC/T9X8zMlza7XFlH6rLkwy9/4N
         5fewOaR/Hq56jdAk9Sp/R2e8Y/rKB4e2w49QRsr03lQUN5QbCo6YLlv/p/ox5u8FScK9
         zxaJLBFqUPLwRQWbnSve3TeE4xK1DGhkP7cFKrrbsIwJtv1WZOjtNcaPWnhYDjQP3qU5
         f8Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=r8wgMri7RP3ArV3Z0gWEm5QsTNDfeDOWoWiHtXSgLjc=;
        b=ib31ZDe/QjocbyISEf6u1kKMSmRUufx7cnWGpnXruW+RZFdTEhZLObDkDYhUfVPZ3e
         h3q1VVrtb0lcvCogqOguztFrr/un9wDkjnJx4ieIo6bEF3Fi8HaYolAJJIDvDKyIRiZb
         2+RVj24ddegACBkW76zKWPu/8IVRUICCDbhMSREW5SNBMcrxFSniTOMPv6fWRQqC9WIn
         DSI+u88RJmLDBm/ZL7zJR5gnPfp1kS3MNZe6DGREbdUNT0q1Uf1iRM3L40KDTyQpiPZx
         YBjAiFc+DFs21SOjouY6vhL2jFYMbYTXSs8cRBBiVoHIIkiyLwsAjOfuts2+Ax3ZoAcj
         tmUw==
X-Gm-Message-State: AOAM533W5Nv/rnh8VahfvEyU4PEIwHrIyjJ1AKA20JPgEubNKuA1ufXV
        J8vr71LRCNyNgiI7hyNKeJUdZbk303c=
X-Google-Smtp-Source: ABdhPJy3RZ+xtIBbd6pIkCemWVubgt2dCUXzUUrpdMuiyj1vbtN7XsshxI2SrB0Ol8RRwJSR+tDD8Q==
X-Received: by 2002:a7b:c347:0:b0:37e:68e6:d85c with SMTP id l7-20020a7bc347000000b0037e68e6d85cmr6129801wmj.176.1647986889135;
        Tue, 22 Mar 2022 15:08:09 -0700 (PDT)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id l13-20020a05600002ad00b00203d64c5289sm19069162wry.112.2022.03.22.15.08.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Mar 2022 15:08:08 -0700 (PDT)
Message-ID: <664edc45-d624-4cdd-57b4-e38f48493e29@gmail.com>
Date:   Tue, 22 Mar 2022 22:08:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 0/5] Introduce ancillary links
Content-Language: en-US
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org
Cc:     sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        hanlinchen@chromium.org, tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com, hpa@redhat.com
References: <20220302220304.1327896-1-djrscally@gmail.com>
In-Reply-To: <20220302220304.1327896-1-djrscally@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello everyone


Any more comments on this series?


Thanks

Dan

On 02/03/2022 22:02, Daniel Scally wrote:
> Hello all
>
> At present there's no means in the kernel of describing the supporting
> relationship between subdevices that work together to form an effective single
> unit - the type example in this case being a camera sensor and its
> corresponding vcm. To attempt to solve that, this series adds a new type of
> media link called MEDIA_LNK_FL_ANCILLARY_LINK, which connects two instances of
> struct media_entity.
>
> The mechanism of connection I have modelled as a notifier and async subdev,
> which seemed the best route since sensor drivers already typically will call
> v4l2_async_register_subdev_sensor() on probe, and that function already looks
> for a reference to a firmware node with the reference named "lens-focus". To
> avoid boilerplate in the sensor drivers, I added some new functions in
> v4l2-async that are called in v4l2_async_match_notify() to create the ancillary
> links. I haven't gone further than that yet, but I suspect we could cut down on
> code elsewhere by, for example, also creating pad-to-pad links in the same place
>
> Series level changes since v2:
>
>   - Squashed #2 and #3
>
> Series-level changes since v1:
>
> 	- New patch adding some documentation to the uAPI pages.
>
> Dan
>
>
> Daniel Scally (5):
>   media: entity: Skip non-data links in graph iteration
>   media: media.h: Add new media link type
>   media: entity: Add link_type_name() helper
>   media: entity: Add support for ancillary links
>   media: v4l2-async: Create links during v4l2_async_match_notify()
>
>  .../media/mediactl/media-controller-model.rst |  6 +++
>  .../media/mediactl/media-types.rst            | 17 +++++--
>  drivers/media/mc/mc-entity.c                  | 46 +++++++++++++++++--
>  drivers/media/v4l2-core/v4l2-async.c          | 31 +++++++++++++
>  include/media/media-entity.h                  | 19 ++++++++
>  include/uapi/linux/media.h                    |  1 +
>  6 files changed, 112 insertions(+), 8 deletions(-)
>
