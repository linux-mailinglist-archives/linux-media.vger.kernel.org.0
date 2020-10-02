Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA40F28172B
	for <lists+linux-media@lfdr.de>; Fri,  2 Oct 2020 17:53:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387768AbgJBPxq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Oct 2020 11:53:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726386AbgJBPxp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Oct 2020 11:53:45 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E205C0613D0
        for <linux-media@vger.kernel.org>; Fri,  2 Oct 2020 08:53:44 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id u4so1578074ljd.10
        for <linux-media@vger.kernel.org>; Fri, 02 Oct 2020 08:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=qCZxuIdaEUxNvtRV5SUP8QUYeIBcTi0YDwavuOR/6iI=;
        b=DMMDHRyKpYKs1rl9VSUzF4W9r8w3o8FYx/4CMUhC0P7pmCMvi+8um0C+0XC6i9SAc3
         6Cd2wqg4JGb3KiVYR8LrdyyREszlak8xhjrBqKLlp0Ee3pGHCPzL0eR23jwJK5BwZ070
         K1VaOOE9nIVy3JcaJMOchBZ74fcojKhqhfma5zf1phIjzM8GyaGVQ5MeYIw8UIO6W840
         ugUM28/b3/5PG4eLE+oT7iy+8Zhzayt9V/PQBlBkaqIwTsqBUkl2wdbLDYaVBSOhSB4V
         HMwhBxuZ7QY4SbFL/mj+BS/35EvrMNccSKkT//YREqxvtdNOK7omRP8AJWI131kzolo9
         ItXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=qCZxuIdaEUxNvtRV5SUP8QUYeIBcTi0YDwavuOR/6iI=;
        b=T6S4KvwByww8LO2LzbOfkwJg02ur8Ll8s8oXK2PtDs8Su9uNbglb5FMX4RcYRa0nB2
         1P7IOTlZkGVYAAMgPLzWHBWPbRhW9fkOkW41yk3p3MyQhAR+e9HirxCKHu7Erq25jWJI
         Vm+LJY6DeQ49zUNLBTOueKlWPfhTG1xV/OEoliMJgvuM+ZEuKk0JXZ0vm3LeTg2e7gG9
         jgInJpnRmaqB9Cyhq96t9zZ6bQqPgFNJs56EEUE+U7c/D/3b0zAkHzV/Z72TczcWUQl6
         QLNV/0gH95WJcwSPfl61sMwbbS1ve8k0X+1o1haxjiloLOvwFb4Efx4UMcsCM+PMmLsf
         /n6Q==
X-Gm-Message-State: AOAM530rkjRJl8POg5TCixEbBVBYkq2IN4UfnzjJUTfmxtQEiSPsqEHt
        hDta4o3EZT3c6NIkmrB3i0kdkw==
X-Google-Smtp-Source: ABdhPJzK9Xvnff8n455hPTog1KHPOlzeSwTWh2IkvMfE4wxLw0dhquT8cyU1kFPhnagi/lwmH2cLww==
X-Received: by 2002:a2e:b6cd:: with SMTP id m13mr981163ljo.383.1601654022614;
        Fri, 02 Oct 2020 08:53:42 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id w7sm351203lfr.158.2020.10.02.08.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 08:53:42 -0700 (PDT)
Date:   Fri, 2 Oct 2020 17:53:41 +0200
From:   Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        jmondi@jmondi.org
Subject: Re: [PATCH 2/5] v4l2-fwnode: v4l2_fwnode_endpoint_parse caller must
 init vep argument
Message-ID: <20201002155341.isgolejr5xrnshcw@oden.dyn.berto.se>
References: <20200930144811.16612-1-sakari.ailus@linux.intel.com>
 <20200930144811.16612-3-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200930144811.16612-3-sakari.ailus@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thanks for your work.

On 2020-09-30 17:48:08 +0300, Sakari Ailus wrote:
> Document that the caller of v4l2_fwnode_endpoint_parse() must init the
> fields of struct v4l2_fwnode_endpoint (vep argument) fields.
> 
> It used to be that the fields were zeroed by v4l2_fwnode_endpoint_parse
> when bus type was set to V4L2_MBUS_UNKNOWN but with commit bb4bba9232fc
> that no longer makes sense.
> 
> Fixes: bb4bba9232fc ("media: v4l2-fwnode: Make bus configuration a struct")
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  include/media/v4l2-fwnode.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
> index c09074276543..0f9a768b1a8d 100644
> --- a/include/media/v4l2-fwnode.h
> +++ b/include/media/v4l2-fwnode.h
> @@ -231,6 +231,8 @@ struct v4l2_fwnode_connector {
>   * guessing @vep.bus_type between CSI-2 D-PHY, parallel and BT.656 busses is
>   * supported. NEVER RELY ON GUESSING @vep.bus_type IN NEW DRIVERS!
>   *
> + * The caller is required to initialise all fields of @vep.
> + *
>   * The function does not change the V4L2 fwnode endpoint state if it fails.
>   *
>   * NOTE: This function does not parse properties the size of which is variable
> @@ -273,6 +275,8 @@ void v4l2_fwnode_endpoint_free(struct v4l2_fwnode_endpoint *vep);
>   * guessing @vep.bus_type between CSI-2 D-PHY, parallel and BT.656 busses is
>   * supported. NEVER RELY ON GUESSING @vep.bus_type IN NEW DRIVERS!
>   *
> + * The caller is required to initialise all fields of @vep.
> + *
>   * The function does not change the V4L2 fwnode endpoint state if it fails.
>   *
>   * v4l2_fwnode_endpoint_alloc_parse() has two important differences to
> -- 
> 2.27.0
> 
> 

-- 
Regards,
Niklas Söderlund
