Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62E23281911
	for <lists+linux-media@lfdr.de>; Fri,  2 Oct 2020 19:21:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbgJBRVc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Oct 2020 13:21:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726096AbgJBRVc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Oct 2020 13:21:32 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FE55C0613D0
        for <linux-media@vger.kernel.org>; Fri,  2 Oct 2020 10:21:30 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id u4so1802014ljd.10
        for <linux-media@vger.kernel.org>; Fri, 02 Oct 2020 10:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=2iZGylx+IMxw24vz93JQndmzV1ZcGsBJvqq6zhiZKOE=;
        b=QaZKf1srUMPpf9V92TqfmLETDZzyCMQ9i3Oc5tV5BS4nsjrL6CvajI7QrDB2rZqgq/
         ZTiITlaLZJ7WuuyryQZG4Dmoh3aH+hdzK08sU/nXtJKfJBNBBjV3C5Xp31xjcopdYOpK
         bfXsUL5vh3zy3UJrIew5h6bm2DwW6N0Un5gCdK0qB4f/6WGtuMvdBWIP93pw0m4HwqWN
         qPbPWkK+obYuxmf6EWwSVkclU1HzBYEh8AWDQYqPD2qiIePvOy8wHGMMzm9kswZYCLmL
         9w5exiihdL6R5QuscmN2DJLEjIeITGnartgLwiIvsp4ud6LNPhFtUTGN7zqNlPQNBW/N
         im6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=2iZGylx+IMxw24vz93JQndmzV1ZcGsBJvqq6zhiZKOE=;
        b=NBDBo1tiF3ooTiSf+MKoa9Kn5w+qj2XaADPEtLkseFUoRi4lL2IF0GgECNrkRJY8Ma
         uSE2Jlm0UdATePTVxUThF5jbw/HQqgHS1zQSrRbe2hdJR8d3HRTyKo7PGgY44ApVpRu4
         HXmS+DvcyHxBSauLdf9LtZDDCRNNp8pX+lNrFZ983OcXqf7cDCd7GvdIGV9ermwa2wOS
         cEwMeW8BFWFYS5LB0fIQ39ab39sHfaYTKsMfuIyg9wbuqoft7Dq6azlRBMqvyBwr8Ef+
         rbEjxyvuWFlnHDDhp/8dQvFSsXdTbCeO3Lw/un7ZwlMTspoZsztCF2D4TPFPlMXnW46C
         vzTw==
X-Gm-Message-State: AOAM533bf5Tip4rnw0POjdm8zMZQc66ZM+WOCwearix6OS1ejTLFj1A0
        pQgisdrG55TArHuU0xrsZ7VWug==
X-Google-Smtp-Source: ABdhPJzEC58VCPM5rFLKvlNoMJkcm7S7xcheN3SvxZY2cqNHfc7oxCLi50MIV0cD5TDiOB7n1eAsVA==
X-Received: by 2002:a2e:b8d1:: with SMTP id s17mr967453ljp.222.1601659288631;
        Fri, 02 Oct 2020 10:21:28 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id 138sm410659lfl.241.2020.10.02.10.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 10:21:28 -0700 (PDT)
Date:   Fri, 2 Oct 2020 19:21:27 +0200
From:   Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        jmondi@jmondi.org
Subject: Re: [PATCH 4/5] v4l2-fwnode: Rework v4l2_fwnode_endpoint_parse
 documentation
Message-ID: <20201002172127.csprbr2tf3dki3lq@oden.dyn.berto.se>
References: <20200930144811.16612-1-sakari.ailus@linux.intel.com>
 <20200930144811.16612-5-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200930144811.16612-5-sakari.ailus@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thanks for your patch.

On 2020-09-30 17:48:10 +0300, Sakari Ailus wrote:
> Rework the documentation of v4l2_fwnode_endpoint_parse for better
> readability, usefulness and correctness.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  include/media/v4l2-fwnode.h | 62 ++++++++++++++++++++++++-------------
>  1 file changed, 40 insertions(+), 22 deletions(-)
> 
> diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
> index 0f9a768b1a8d..0c28dc11e829 100644
> --- a/include/media/v4l2-fwnode.h
> +++ b/include/media/v4l2-fwnode.h
> @@ -219,17 +219,26 @@ struct v4l2_fwnode_connector {
>   * @vep: pointer to the V4L2 fwnode data structure
>   *
>   * This function parses the V4L2 fwnode endpoint specific parameters from the
> - * firmware. The caller is responsible for assigning @vep.bus_type to a valid
> - * media bus type. The caller may also set the default configuration for the
> - * endpoint --- a configuration that shall be in line with the DT binding
> - * documentation. Should a device support multiple bus types, the caller may
> - * call this function once the correct type is found --- with a default
> - * configuration valid for that type.
> - *
> - * It is also allowed to set @vep.bus_type to V4L2_MBUS_UNKNOWN. USING THIS
> - * FEATURE REQUIRES "bus-type" PROPERTY IN DT BINDINGS. For old drivers,
> - * guessing @vep.bus_type between CSI-2 D-PHY, parallel and BT.656 busses is
> - * supported. NEVER RELY ON GUESSING @vep.bus_type IN NEW DRIVERS!
> + * firmware. There are two ways to use this function, either by letting it
> + * obtain the type of the bus (by setting the @vep.bus_type field to
> + * V4L2_MBUS_UNKNOWN) or specifying the bus type explicitly to one of the &enum
> + * v4l2_mbus_type types.
> + *
> + * When @vep.bus_type is V4L2_MBUS_UNKNOWN, the function will use the "bus-type"
> + * property to determine the type when it is available. The caller is
> + * responsible for validating the contents of @vep.bus_type field after the call
> + * returns.
> + *
> + * As a deprecated functionality to support older DT bindings without "bus-type"
> + * property for devices that support multiple types, if the "bus-type" property
> + * does not exist, the function will attempt to guess the type based on the
> + * endpoint properties available. NEVER RELY ON GUESSING THE BUS TYPE IN NEW
> + * DRIVERS OR BINDINGS.
> + *
> + * It is also possible to set @vep.bus_type corresponding to an actual bus. In
> + * this case the function will only attempt to parse properties related to this
> + * bus, and it will return an error if the value of the "bus-type" property
> + * corresponds to a different bus.
>   *
>   * The caller is required to initialise all fields of @vep.
>   *
> @@ -263,17 +272,26 @@ void v4l2_fwnode_endpoint_free(struct v4l2_fwnode_endpoint *vep);
>   * @vep: pointer to the V4L2 fwnode data structure
>   *
>   * This function parses the V4L2 fwnode endpoint specific parameters from the
> - * firmware. The caller is responsible for assigning @vep.bus_type to a valid
> - * media bus type. The caller may also set the default configuration for the
> - * endpoint --- a configuration that shall be in line with the DT binding
> - * documentation. Should a device support multiple bus types, the caller may
> - * call this function once the correct type is found --- with a default
> - * configuration valid for that type.
> - *
> - * It is also allowed to set @vep.bus_type to V4L2_MBUS_UNKNOWN. USING THIS
> - * FEATURE REQUIRES "bus-type" PROPERTY IN DT BINDINGS. For old drivers,
> - * guessing @vep.bus_type between CSI-2 D-PHY, parallel and BT.656 busses is
> - * supported. NEVER RELY ON GUESSING @vep.bus_type IN NEW DRIVERS!
> + * firmware. There are two ways to use this function, either by letting it
> + * obtain the type of the bus (by setting the @vep.bus_type field to
> + * V4L2_MBUS_UNKNOWN) or specifying the bus type explicitly to one of the &enum
> + * v4l2_mbus_type types.
> + *
> + * When @vep.bus_type is V4L2_MBUS_UNKNOWN, the function will use the "bus-type"
> + * property to determine the type when it is available. The caller is
> + * responsible for validating the contents of @vep.bus_type field after the call
> + * returns.
> + *
> + * As a deprecated functionality to support older DT bindings without "bus-type"
> + * property for devices that support multiple types, if the "bus-type" property
> + * does not exist, the function will attempt to guess the type based on the
> + * endpoint properties available. NEVER RELY ON GUESSING THE BUS TYPE IN NEW
> + * DRIVERS OR BINDINGS.
> + *
> + * It is also possible to set @vep.bus_type corresponding to an actual bus. In
> + * this case the function will only attempt to parse properties related to this
> + * bus, and it will return an error if the value of the "bus-type" property
> + * corresponds to a different bus.
>   *
>   * The caller is required to initialise all fields of @vep.
>   *
> -- 
> 2.27.0
> 
> 

-- 
Regards,
Niklas Söderlund
