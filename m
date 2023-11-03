Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E38A87E04F1
	for <lists+linux-media@lfdr.de>; Fri,  3 Nov 2023 15:48:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230137AbjKCOsl convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 3 Nov 2023 10:48:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230057AbjKCOsk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Nov 2023 10:48:40 -0400
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A45A6134;
        Fri,  3 Nov 2023 07:48:37 -0700 (PDT)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-587310758ccso240323eaf.0;
        Fri, 03 Nov 2023 07:48:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699022917; x=1699627717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rnLwrLAyR7JqlbWF71omz9lusykP8cULNd4VOIkaf+c=;
        b=OAFbY8ZTGhxZLhWcmYBG4f/PBXwY2IH+eINdx+NJf8FlnjCIlUsh6UcXv+DYhLcUnI
         pcMLJfYoLpmRolkCgxCuM8Q8IGIpICQi7gnbXjxFVjC8Y/7XOAWnWQENHkeQbE8m34Fw
         ekP+zitpGwMbiWYFX7mzoFxgesyavWw3f8bSo0v0wJaErdwyvEhUHnPd9EOxiWlVFjQF
         s8yMa4cm5R6SDhoMC4KBrBzOqlNXdE+rrP80IRLPL/0j/VIdUciDaNMemu0jsn6IjGQZ
         ROysv2tP4KDBCeDYJzWDtkDHejRbUwkV/Xq/vrBde1B9RM8gbiQc6pYYc3VggfC0w03e
         ZG/w==
X-Gm-Message-State: AOJu0YwUIU9QsGD+i5HiVFYoF9rRZGdTOZU9EAuz/cU+4O7uLKgkSNsr
        +/GURtVNWc4eZdBi+e8cTecBlvWkfuEBcPzdFP4=
X-Google-Smtp-Source: AGHT+IGjKURclSqydK6kWxSfSIlPGOuR/YzJpciRF8vTZTp9AyFyQ8kyZAOBh+/mGVNZoVSC6t7kXDM8p9kJK8d0aM0=
X-Received: by 2002:a05:6820:1899:b0:581:e7b8:dd77 with SMTP id
 bm25-20020a056820189900b00581e7b8dd77mr24924270oob.1.1699022916970; Fri, 03
 Nov 2023 07:48:36 -0700 (PDT)
MIME-Version: 1.0
References: <20231102081611.1179964-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20231102081611.1179964-1-sakari.ailus@linux.intel.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Fri, 3 Nov 2023 15:48:23 +0100
Message-ID: <CAJZ5v0h5q__nbfxLUN-cZDSvjTCJHSZwoDEz_cq+bUJGSn1u-A@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] device property: Add fwnode_name_eq()
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-acpi@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media@vger.kernel.org,
        Paul Elder <paul.elder@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Julien Stephan <jstephan@baylibre.com>,
        devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 2, 2023 at 9:22 AM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Add fwnode_name_eq() to implement the functionality of of_node_name_eq()
> on fwnode property API. The same convention of ending the comparison at
> '@' (besides NUL) is applied on also both ACPI and swnode. The function
> is intended for comparing unit address-less node names on DT and firmware
> or swnodes compliant with DT bindings.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Hi Rafael,
>
> Could we merge this via the media tree (pending further review comments,
> if any)?

This would be fine with me, so please feel free to add

Acked-by: Rafael J. Wysocki <rafael@kernel.org>

to this patch (when ready), but you need to ask Greg about it, because
he's been handling device properties changes lately.

> There'a a patch to be merged via that tree which will depend on
> fwnode_name_eq(), namely:
> <URL:https://lore.kernel.org/linux-media/20231030133247.11243-1-laurent.pinchart@ideasonboard.com/T/#m489b7e83cbc755815c5002f85454a76bfb41adb2>.
>
> since v2:
>
> - Use NUL instead of '\0' and "at" instead of "to" (before "stopping
>   comparison").
>
>  drivers/base/property.c  | 28 ++++++++++++++++++++++++++++
>  include/linux/property.h |  1 +
>  2 files changed, 29 insertions(+)
>
> diff --git a/drivers/base/property.c b/drivers/base/property.c
> index 8667b13639d2..572e065e8797 100644
> --- a/drivers/base/property.c
> +++ b/drivers/base/property.c
> @@ -595,6 +595,34 @@ const char *fwnode_get_name_prefix(const struct fwnode_handle *fwnode)
>         return fwnode_call_ptr_op(fwnode, get_name_prefix);
>  }
>
> +/**
> + * fwnode_name_eq - Return true if node name is equal
> + * @fwnode: The firmware node
> + * @name: The name to which to compare the node name
> + *
> + * Compare the name provided as an argument to the name of the node, stopping
> + * the comparison at either NUL or '@' character, whichever comes first. This
> + * function is generally used for comparing node names while ignoring the
> + * possible unit address of the node.
> + *
> + * Return: true if the node name matches with the name provided in the @name
> + * argument, false otherwise.
> + */
> +bool fwnode_name_eq(const struct fwnode_handle *fwnode, const char *name)
> +{
> +       const char *node_name;
> +       size_t len;
> +
> +       node_name = fwnode_get_name(fwnode);
> +       if (!node_name)
> +               return false;
> +
> +       len = strchrnul(node_name, '@') - node_name;
> +
> +       return str_has_prefix(node_name, name) == len;
> +}
> +EXPORT_SYMBOL_GPL(fwnode_name_eq);
> +
>  /**
>   * fwnode_get_parent - Return parent firwmare node
>   * @fwnode: Firmware whose parent is retrieved
> diff --git a/include/linux/property.h b/include/linux/property.h
> index 083a1f41364b..096ade186601 100644
> --- a/include/linux/property.h
> +++ b/include/linux/property.h
> @@ -108,6 +108,7 @@ struct fwnode_handle *fwnode_find_reference(const struct fwnode_handle *fwnode,
>
>  const char *fwnode_get_name(const struct fwnode_handle *fwnode);
>  const char *fwnode_get_name_prefix(const struct fwnode_handle *fwnode);
> +bool fwnode_name_eq(const struct fwnode_handle *fwnode, const char *name);
>
>  struct fwnode_handle *fwnode_get_parent(const struct fwnode_handle *fwnode);
>  struct fwnode_handle *fwnode_get_next_parent(struct fwnode_handle *fwnode);
> --
> 2.39.2
>
