Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31C4B45DB6B
	for <lists+linux-media@lfdr.de>; Thu, 25 Nov 2021 14:42:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355373AbhKYNp4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Nov 2021 08:45:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355601AbhKYNnz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Nov 2021 08:43:55 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD5E0C06137A
        for <linux-media@vger.kernel.org>; Thu, 25 Nov 2021 05:34:24 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id f18so16411939lfv.6
        for <linux-media@vger.kernel.org>; Thu, 25 Nov 2021 05:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=db5HEtPRT5vnfvKDwx5CZIuanUw/kLArBlssnR6z0lo=;
        b=R2RhyjSODyQ7y6VsD7zdBO2dg8Jxpb0Bqct7+hPYJLD9E9dzi0mc6yEGIsCrECV86t
         TcGOrDNuSsgRg656oxaXzSK4QRasudzyZCvxJkWCAM/rMg3Va9a+HAE6a42DUPvwXM3j
         MgJl6wWQkyo0F9216TeZ/cWgsfk1hT2Q1eiqPTOWx1WXg+5fEV3LT7k/UuHavBFZzFW8
         Uk6sYtpEIlSjV1rTxU4mUiZLqduIXr2bkBTxyHpZ+oEO434RCgR89onepTkcAjxrUKcj
         O8qTh05s55wcS5NjomxH2zLLiYrCHGL56NVY4DZNmr0oBgbwhtjI386lT6UBmbqY8tck
         fYQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=db5HEtPRT5vnfvKDwx5CZIuanUw/kLArBlssnR6z0lo=;
        b=erumFwlwYBmfIeUmdQDzu0R7AZyI2agnZwkvu9YO5QnrT0vzhOcSLzzvPD/oRFIcKb
         6ynygf1qzGoTIehC2MiqpPs6OYBSRUQZUUSrAaakSZJ72RNaR+t1RsULaCI07zF+G5CM
         oA4hCS20SoxmdlsYt1Aw5RtZ+t6X/KH87vJBkvGHy6WQOzV7wYzWAIkjYU7FZEd45tkt
         kF0gye+zgraTzOqgaA1NcwCXTTZBrhTo608KjSx8ayPPQ1mQivDKavwGsJNCLQJqUPz8
         HBBukiZcf/811yfv+h/Tnj5WFypoNnOJo7q+dwB6XPuXgICnhhiy0hMrrKhBQ+w9gbjr
         Ok9A==
X-Gm-Message-State: AOAM533v5PrKcptWD9JAwOZiP6DVlPyjUWxX3usq5bK/s2E9K2MSH1LN
        bQNGyXmk+ekd6C5PhIWJ3awpbF8Y5D4mizr1XD1EaNzFVQMhpw==
X-Google-Smtp-Source: ABdhPJxhm1sCdOjpP+cdCkZX4jwjZwbT27ili5fQK6rOhtrObDitoN9dWYJJ9ZtFe3SVReOsAmTUYOdMUrlmySvPPCM=
X-Received: by 2002:a05:6512:110c:: with SMTP id l12mr23249870lfg.224.1637847262850;
 Thu, 25 Nov 2021 05:34:22 -0800 (PST)
MIME-Version: 1.0
References: <a348a21b-b069-19b5-2565-d70e3161f2b5@xs4all.nl>
In-Reply-To: <a348a21b-b069-19b5-2565-d70e3161f2b5@xs4all.nl>
From:   Dillon Min <dillon.minfei@gmail.com>
Date:   Thu, 25 Nov 2021 21:33:46 +0800
Message-ID: <CAL9mu0+nyYSKbq0TnaPk5j-mYYXF3efyp290N_WHdJOkNoFfsg@mail.gmail.com>
Subject: Re: [PATCH] v4l2-compliance: detect no-mmu systems
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Thu, 25 Nov 2021 at 21:14, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> Check if the OS has an MMU. If not, then skip tests that only work for
> systems that have an MMU.
>
> The safest and most generic method I found is the FIONBIO ioctl that is
> available for any file descriptor and is a write-only ioctl, so no memory
> will be accidentally written. On a MMU system this will return EFAULT, and
> on a ucLinux system this will return 0.
>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
> Dillon, the original RFC patch (1) I posted to fix this in the kernel is not
> the correct method. See:
>
> https://stackoverflow.com/questions/24755103/how-to-handle-null-pointer-argument-to-ioctl-system-call

Thanks for the detailed information.

>
> So instead I try to detect if there is an MMU in v4l2-compliance and, if not,
> just skip those tests that require an MMU.
>
> Can you test this patch?

Sure, I'll test it then update the result.

>
> Thanks!
>
>         Hans
>
> 1: https://patchwork.linuxtv.org/project/linux-media/patch/3acd9ee4-5a58-6ed4-17fe-61596a5252b8@xs4all.nl/
> ---
> diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
> index 0eeabb2d..c53a55ba 100644
> --- a/utils/v4l2-compliance/v4l2-compliance.cpp
> +++ b/utils/v4l2-compliance/v4l2-compliance.cpp
> @@ -88,6 +88,7 @@ bool is_vivid;
>  bool is_uvcvideo;
>  int media_fd = -1;
>  unsigned warnings;
> +bool has_mmu = true;
>
>  static unsigned color_component;
>  static unsigned color_skip;
> @@ -152,8 +153,21 @@ static struct option long_options[] = {
>
>  static void print_sha()
>  {
> +       int fd = open("/dev/null", O_RDONLY);
> +
> +       if (fd >= 0) {
> +               // FIONBIO is a write-only ioctl that takes an int argument that
> +               // enables (!= 0) or disables (== 0) nonblocking mode of a fd.
> +               //
> +               // Passing a nullptr should return EFAULT on MMU capable machines,
> +               // and it works if there is no MMU.
> +               has_mmu = ioctl(fd, FIONBIO, nullptr);
> +               close(fd);
> +       }
>         printf("v4l2-compliance %s%s, ", PACKAGE_VERSION, STRING(GIT_COMMIT_CNT));
> -       printf("%zd bits, %zd-bit time_t\n", sizeof(void *) * 8, sizeof(time_t) * 8);
> +       printf("%zd bits, %zd-bit time_t%s\n",
> +              sizeof(void *) * 8, sizeof(time_t) * 8,
> +              has_mmu ? "" : ", has no MMU");
>         if (strlen(STRING(GIT_SHA)))
>                 printf("v4l2-compliance SHA: %s %s\n",
>                        STRING(GIT_SHA), STRING(GIT_COMMIT_DATE));
> @@ -623,9 +637,9 @@ static int testCap(struct node *node)
>                 V4L2_CAP_VIDEO_M2M;
>
>         memset(&vcap, 0xff, sizeof(vcap));
> -       // Must always be there
> -       fail_on_test(doioctl(node, VIDIOC_QUERYCAP, nullptr) != EFAULT);
>         fail_on_test(doioctl(node, VIDIOC_QUERYCAP, &vcap));
> +       if (has_mmu)
> +               fail_on_test(doioctl(node, VIDIOC_QUERYCAP, nullptr) != EFAULT);
>         fail_on_test(check_ustring(vcap.driver, sizeof(vcap.driver)));
>         fail_on_test(check_ustring(vcap.card, sizeof(vcap.card)));
>         fail_on_test(check_ustring(vcap.bus_info, sizeof(vcap.bus_info)));
> @@ -988,11 +1002,10 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
>         }
>
>         if (driver.empty())
> -               printf("Compliance test for device %s%s:\n\n",
> -                      node.device, node.g_direct() ? "" : " (using libv4l2)");
> +               printf("Compliance test for device ");
>         else
> -               printf("Compliance test for %s device %s%s:\n\n",
> -                      driver.c_str(), node.device, node.g_direct() ? "" : " (using libv4l2)");
> +               printf("Compliance test for %s device ", driver.c_str());
> +       printf("%s%s:\n\n", node.device, node.g_direct() ? "" : " (using libv4l2)");
>
>         if (node.g_caps() & (V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_VBI_CAPTURE |
>                          V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_SLICED_VBI_CAPTURE |
> diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-compliance/v4l2-compliance.h
> index e73ebdd3..7255161f 100644
> --- a/utils/v4l2-compliance/v4l2-compliance.h
> +++ b/utils/v4l2-compliance/v4l2-compliance.h
> @@ -58,6 +58,7 @@ extern bool is_uvcvideo; // We're testing the uvc driver
>  extern int kernel_version;
>  extern int media_fd;
>  extern unsigned warnings;
> +extern bool has_mmu;
>
>  enum poll_mode {
>         POLL_MODE_NONE,
> diff --git a/utils/v4l2-compliance/v4l2-test-io-config.cpp b/utils/v4l2-compliance/v4l2-test-io-config.cpp
> index 6f2a9ba9..dcab40b8 100644
> --- a/utils/v4l2-compliance/v4l2-test-io-config.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-io-config.cpp
> @@ -577,6 +577,8 @@ static int checkEdid(struct node *node, unsigned pad, bool is_input)
>                 fail_on_test(edid.blocks == 0 || edid.blocks >= 256);
>                 fail_on_test(edid.pad != pad);
>         }
> +       if (!has_mmu)
> +               return 0;
>         edid.blocks = 1;
>         edid.pad = pad;
>         edid.edid = nullptr;
> diff --git a/utils/v4l2-compliance/v4l2-test-media.cpp b/utils/v4l2-compliance/v4l2-test-media.cpp
> index ef2982c0..28af0d83 100644
> --- a/utils/v4l2-compliance/v4l2-test-media.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-media.cpp
> @@ -32,8 +32,9 @@ int testMediaDeviceInfo(struct node *node)
>         struct media_device_info mdinfo;
>
>         memset(&mdinfo, 0xff, sizeof(mdinfo));
> -       fail_on_test(doioctl(node, MEDIA_IOC_DEVICE_INFO, nullptr) != EFAULT);
>         fail_on_test(doioctl(node, MEDIA_IOC_DEVICE_INFO, &mdinfo));
> +       if (has_mmu)
> +               fail_on_test(doioctl(node, MEDIA_IOC_DEVICE_INFO, nullptr) != EFAULT);
>         fail_on_test(check_0(mdinfo.reserved, sizeof(mdinfo.reserved)));
>         fail_on_test(check_string(mdinfo.driver, sizeof(mdinfo.driver)));
>         fail_on_test(mdinfo.model[0] && check_string(mdinfo.model, sizeof(mdinfo.model)));
> @@ -127,21 +128,23 @@ int testMediaTopology(struct node *node)
>         fail_on_test(topology.reserved2);
>         fail_on_test(topology.reserved3);
>         fail_on_test(topology.reserved4);
> -       topology.ptr_entities = 4;
> -       fail_on_test(doioctl(node, MEDIA_IOC_G_TOPOLOGY, &topology) != EFAULT);
> -       topology.ptr_entities = 0;
> -       topology.ptr_interfaces = 4;
> -       fail_on_test(topology.num_interfaces &&
> -                    doioctl(node, MEDIA_IOC_G_TOPOLOGY, &topology) != EFAULT);
> -       topology.ptr_interfaces = 0;
> -       topology.ptr_pads = 4;
> -       fail_on_test(topology.num_pads &&
> -                    doioctl(node, MEDIA_IOC_G_TOPOLOGY, &topology) != EFAULT);
> -       topology.ptr_pads = 0;
> -       topology.ptr_links = 4;
> -       fail_on_test(topology.num_links &&
> -                    doioctl(node, MEDIA_IOC_G_TOPOLOGY, &topology) != EFAULT);
> -       topology.ptr_links = 0;
> +       if (has_mmu) {
> +               topology.ptr_entities = 4;
> +               fail_on_test(doioctl(node, MEDIA_IOC_G_TOPOLOGY, &topology) != EFAULT);
> +               topology.ptr_entities = 0;
> +               topology.ptr_interfaces = 4;
> +               fail_on_test(topology.num_interfaces &&
> +                            doioctl(node, MEDIA_IOC_G_TOPOLOGY, &topology) != EFAULT);
> +               topology.ptr_interfaces = 0;
> +               topology.ptr_pads = 4;
> +               fail_on_test(topology.num_pads &&
> +                            doioctl(node, MEDIA_IOC_G_TOPOLOGY, &topology) != EFAULT);
> +               topology.ptr_pads = 0;
> +               topology.ptr_links = 4;
> +               fail_on_test(topology.num_links &&
> +                            doioctl(node, MEDIA_IOC_G_TOPOLOGY, &topology) != EFAULT);
> +               topology.ptr_links = 0;
> +       }
>         v2_ents = new media_v2_entity[topology.num_entities];
>         memset(v2_ents, 0xff, topology.num_entities * sizeof(*v2_ents));
>         topology.ptr_entities = (uintptr_t)v2_ents;
> @@ -394,12 +397,14 @@ int testMediaEnum(struct node *node)
>                 fail_on_test(links.entity != ent.id);
>                 fail_on_test(links.pads);
>                 fail_on_test(links.links);
> -               links.pads = (struct media_pad_desc *)4;
> -               fail_on_test(ent.pads && doioctl(node, MEDIA_IOC_ENUM_LINKS, &links) != EFAULT);
> -               links.pads = nullptr;
> -               links.links = (struct media_link_desc *)4;
> -               fail_on_test(ent.links && doioctl(node, MEDIA_IOC_ENUM_LINKS, &links) != EFAULT);
> -               links.links = nullptr;
> +               if (has_mmu) {
> +                       links.pads = (struct media_pad_desc *)4;
> +                       fail_on_test(ent.pads && doioctl(node, MEDIA_IOC_ENUM_LINKS, &links) != EFAULT);
> +                       links.pads = nullptr;
> +                       links.links = (struct media_link_desc *)4;
> +                       fail_on_test(ent.links && doioctl(node, MEDIA_IOC_ENUM_LINKS, &links) != EFAULT);
> +                       links.links = nullptr;
> +               }
>                 links.pads = new media_pad_desc[ent.pads];
>                 memset(links.pads, 0xff, ent.pads * sizeof(*links.pads));
>                 links.links = new media_link_desc[ent.links];
> diff --git a/utils/v4l2-compliance/v4l2-test-subdevs.cpp b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
> index 68f97205..f3d85771 100644
> --- a/utils/v4l2-compliance/v4l2-test-subdevs.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
> @@ -33,8 +33,9 @@ int testSubDevCap(struct node *node)
>
>         memset(&caps, 0xff, sizeof(caps));
>         // Must always be there
> -       fail_on_test(doioctl(node, VIDIOC_SUBDEV_QUERYCAP, nullptr) != EFAULT);
>         fail_on_test(doioctl(node, VIDIOC_SUBDEV_QUERYCAP, &caps));
> +       if (has_mmu)
> +               fail_on_test(doioctl(node, VIDIOC_SUBDEV_QUERYCAP, nullptr) != EFAULT);
>         fail_on_test(check_0(caps.reserved, sizeof(caps.reserved)));
>         fail_on_test((caps.version >> 16) < 5);
>         fail_on_test(caps.capabilities & ~VALID_SUBDEV_CAPS);

Best Regards
Dillon
