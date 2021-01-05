Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 854192EAFD4
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 17:16:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728245AbhAEQOy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 11:14:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728097AbhAEQOy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 11:14:54 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F85AC061574
        for <linux-media@vger.kernel.org>; Tue,  5 Jan 2021 08:14:13 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id j16so851104edr.0
        for <linux-media@vger.kernel.org>; Tue, 05 Jan 2021 08:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=B2XI9Y2wlyHiEShnQJz2HRGu3YR6k36r4B9FvaQe2v8=;
        b=YaJOy/HjCwM7OcV7prVs8bCAb5x7TlFfJpi1tuXRpUGOxWKA5zOXRpJY6jvPonBBsY
         5LE+qXM7gfTmUWKte2mTjSTv19saQ5X/JPU3J9jRe970hhpw5e+oIB1iIkubwoSdrRNj
         Hil3h4xXaKqON1Vq+BphcOTepo4zTA+HJT20AXIuzlj0g3B6Mik8DWlx8no0d0UqSoOM
         pNXjc7t53JpCwU5bJ3o/Yo85MGFn4QxP4JRTJ/EEMwcHO8w27ohLvVqwY1IBm7XJfVsT
         DxNw99rQIrBlWbZny8NBPr5e2toi0zjQTCxwQsCZEXtR56kkfGV/OkjpfTDthxYGK5Lz
         jRbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=B2XI9Y2wlyHiEShnQJz2HRGu3YR6k36r4B9FvaQe2v8=;
        b=E7OVDbMJzQoCFuQ0AJ/tWM4w0OyXoObOrg3/2nbo/HMiz3ALK04N8Jhce5yn4CMHVc
         dnwqR/rzANUsw5G8Ik84907j8h147Z+7AAqQeM4r2zSgy4Tsg+eM89jUBkBI3NgnBu/M
         d+ntEmR+MwuBXfDyGDuh7t2C4+wxR+ExiLhK3LPP73/wjd6pmggHKyjRNL0bI+VBhMZj
         iTTIK+vxGndktX0Isd+RIdlpnPu8V4RjTHKmmMcYWJ7slDI3Q96G1j1lIIi6vXoEA3go
         RIdXL0+2WOLUU7etRIfeY+qn31J3gv7Y0SeOMV6ugOEY74mr/oncLaCui5LXc8c6G9gV
         M1/A==
X-Gm-Message-State: AOAM5304WyLSqME8V4rwT7YvJ4L49EO7RnElgDSAD8jP9xg2K/UGell1
        IzVOtsedjEvjTTR/s15h3RM=
X-Google-Smtp-Source: ABdhPJzD8DsR/a8w1W08UJoEMY1hsQICAvOTT60gQ5DXupklDi5lRTeaHlxTd6Tmo31Q+ZEBAC/gtA==
X-Received: by 2002:a05:6402:c4:: with SMTP id i4mr502209edu.152.1609863252367;
        Tue, 05 Jan 2021 08:14:12 -0800 (PST)
Received: from kontron.lan (2001-1ae9-1e8-b200-9c26-b1f7-3f54-fb94.ip6.tmcz.cz. [2001:1ae9:1e8:b200:9c26:b1f7:3f54:fb94])
        by smtp.gmail.com with ESMTPSA id c23sm45724192eds.88.2021.01.05.08.14.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jan 2021 08:14:11 -0800 (PST)
Subject: Re: [PATCH 3/6] media: ov9640: Use the generic clock framework
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     kernel@collabora.com, Arnd Bergmann <arnd@arndb.de>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20210104165739.116404-1-ezequiel@collabora.com>
 <20210104165739.116404-4-ezequiel@collabora.com>
From:   Petr Cvek <petrcvekcz@gmail.com>
Message-ID: <ade9d36d-fb0f-7979-96a3-da550680c7ea@gmail.com>
Date:   Tue, 5 Jan 2021 17:18:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210104165739.116404-4-ezequiel@collabora.com>
Content-Type: text/plain; charset=iso-8859-2
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> diff --git a/drivers/media/i2c/ov9640.h b/drivers/media/i2c/ov9640.h
> index a8ed6992c1a8..a1f9150b2050 100644
> --- a/drivers/media/i2c/ov9640.h
> +++ b/drivers/media/i2c/ov9640.h
> @@ -180,6 +180,8 @@ enum {
>  };
>  #define	H_SXGA	960
>  
> +struct clk;
> +

Seems to be unnecessary as struct clk will be included from ov9640.c (the same way struct v4l2_clk was).

The rest seems fine by me.

Petr
