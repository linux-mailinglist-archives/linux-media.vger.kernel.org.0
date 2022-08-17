Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47E29596C45
	for <lists+linux-media@lfdr.de>; Wed, 17 Aug 2022 11:51:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235353AbiHQJuZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Aug 2022 05:50:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235625AbiHQJuA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Aug 2022 05:50:00 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DE3C79601
        for <linux-media@vger.kernel.org>; Wed, 17 Aug 2022 02:49:53 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id d10so11570567plr.6
        for <linux-media@vger.kernel.org>; Wed, 17 Aug 2022 02:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=pAnqZelpz4ZI/hLbNi1JwNGffKjhIoUGSSpzt4Fkm7s=;
        b=ZhcSZfjWuD8mMQTDZEfDK0HQrrsDztaheI6EtKHQPSRy+r8ZdQ1Ds+JBp1LKs8RKSZ
         OHlzTe9HkkRR0BHAEX3B9TvLJT7ow02GKLHjwWByS1jaWTJgQL8UZkOX0DCR4xYn8BNg
         GG+fAm1hY2Wow4s4t6ZWMh/Pk8Kw61+BexhB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=pAnqZelpz4ZI/hLbNi1JwNGffKjhIoUGSSpzt4Fkm7s=;
        b=rZorHZbx/J2PQwZgjqoHOx/H5xqSErqMrxHVZrhY++KK6ssXRt5wy790q9w+dd+4fZ
         lxzjFxi7uB1J1XUAnyWKG+VkWm/GECVoDOtnxL5/btnVd6FohUcKBOe9Hj6QcPRmBVi1
         3MDnscvC0LI3LGm1rIcBuWnJpR2vG5n11JF5t5tL5qjdiEi0+7WB5+WmAZi78xnNHcqY
         Yip3uaXxrFEHuoOMp6N8EaBPBcl6sL7Lj6rdYYhKNiGZsyJ4oNYfD6BYX+4hG+le0+YZ
         gKhTMTfppRFoB6Eg+jdyMQ5At1yhtZhsJebZJVyxC8x2A3GfpBkpTY0fby91RoaoLt5J
         jwNg==
X-Gm-Message-State: ACgBeo3rGqmQMICRln3FTW5uAw+y7RcQB7KeEyVpST+j3Y3au1tJ+Ax+
        JA10ZrfPy78TIQHKNoS/Vr69Cg==
X-Google-Smtp-Source: AA6agR5fMrOkiYFHSXKq12XPFniW8P05u24DzwtBPvETOXXyoBQ/E7uHE0BVN63BoNPrkjQ1ipOlaA==
X-Received: by 2002:a17:903:285:b0:172:897d:506 with SMTP id j5-20020a170903028500b00172897d0506mr5505889plr.5.1660729792949;
        Wed, 17 Aug 2022 02:49:52 -0700 (PDT)
Received: from google.com ([240f:75:7537:3187:46f4:9a65:a66e:2d2d])
        by smtp.gmail.com with ESMTPSA id n3-20020a170902d2c300b0016892555955sm1039495plc.179.2022.08.17.02.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 02:49:51 -0700 (PDT)
Date:   Wed, 17 Aug 2022 18:49:44 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Paul Menzel <pmenzel@molgen.mpg.de>,
        Wang Yating <yating.wang@intel.com>,
        Christoph Jechlitschek <christoph.jechlitschek@intel.com>,
        Hao Yao <hao.yao@intel.com>, Andy Yeh <andy.yeh@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        linux-media@vger.kernel.org, Mark Pearson <markpearson@lenovo.com>,
        Dell.Client.Kernel@dell.com, linux-kernel@vger.kernel.org,
        Guenter Roeck <groeck@google.com>,
        Andy Whitcroft <apw@canonical.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Christian Schaller <cschalle@redhat.com>,
        Wouter Bolsterlee <wouter@bolsterl.ee>,
        Miguel Palhas <mpalhas@gmail.com>,
        it+linux-media@molgen.mpg.de, "Hu, Jerry W" <jerry.w.hu@intel.com>
Subject: Re: Missing MIPI IPU6 camera driver for Intel Alder Lake laptops
Message-ID: <Yvy5uCh7kW+oNEcn@google.com>
References: <YvUaEDMbZD70x+hD@kroah.com>
 <YvUbhx4HSxAAwIvv@pendragon.ideasonboard.com>
 <YvUghWZbXIUofg5A@kroah.com>
 <YvmqL6Wz7o77ukF5@google.com>
 <YvnpVmnROTsWWw0o@kroah.com>
 <YvnrJBI8599+E43T@google.com>
 <YvnvnL9pBAgWMgTk@kroah.com>
 <YvnwtN1SwQjilJ97@google.com>
 <YvnybHVFmpUJs4qi@kroah.com>
 <YvyiLHBgRQ9XsTrW@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YvyiLHBgRQ9XsTrW@paasikivi.fi.intel.com>
X-Spam-Status: No, score=1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FSL_HELO_FAKE,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (22/08/17 08:09), Sakari Ailus wrote:
> 
> Do note that USB webcams in Alder Lake laptops still work as usual, with
> the uvcvideo driver.

A massive +1 to this.

> This of course does not help the owners of such hardware but perhaps
> explains the current state of affairs a little. Eventually we will need a
> new kernel interface for this but at this point I can't tell whether it
> will be based on KCAM Sergey mentioned, or not.

We don't consider KCAM ready and this is why we have not published it
to the mailing list. We haven't really started with KCAM yet, but we
are about to do so. And I'm sure that we will find out a thing or two
missing or not working properly while we convert a real H/W driver to
KCAM. We will sit down and write some code to address those problems.
