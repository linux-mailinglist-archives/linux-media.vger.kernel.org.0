Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1036A288EA1
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 18:19:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389410AbgJIQSv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Oct 2020 12:18:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388719AbgJIQSu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Oct 2020 12:18:50 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E73B0C0613D2
        for <linux-media@vger.kernel.org>; Fri,  9 Oct 2020 09:18:50 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id o8so4684972pll.4
        for <linux-media@vger.kernel.org>; Fri, 09 Oct 2020 09:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=97UkOARAdyG+LuQkG7K93ljW7t/yTyNus/0P/j4y9g8=;
        b=JtleW7r3H/vj5BxRqR9LtddhNODRgTFQelhD05c3nRzvy0F4B6mltaxhCCs+l2jtwt
         +NU6wpUaLCd2Z+iMqCJP7Mzl6+slsSW96KL7cgwk8HqliHByfGCQAI9i6Gn7rHZgEMUa
         jFKEvCaniurwKBYk12haG7f5H6g8ZkP/kE2Rfokt3NcVu5b6kRNLzpI8XEZ5fG4pdV9D
         KFwUeIlGLEXiD6F8C3qEJ6glfOZMBQ3BR7JZ7hJ3JBDrUihPW+AfIq2aixBp+LgAp2z1
         gOiw9OKz41EV4znSe4V6MqF3o84AOgSGpxms+QY2s78ZByLKK/33ypQXBLZrDhatKH8O
         7cVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=97UkOARAdyG+LuQkG7K93ljW7t/yTyNus/0P/j4y9g8=;
        b=qvcXfWEzuhpZEXFyktmk4vY17UD20Q5mbloRq2LumO3LONKBsURJFZIj+1/conygBv
         Xmi61zdqUa+XMkE+M1nPIjJTwHgWG//QjKHYw8LZrt1Rj0c5PFsbLzIR4dxn8hURY2dR
         KbsU3ciOrF9ajxqxTvTXYEmcuEVk4EMPQ4OreqHWqRTQHesIk2m5/IGI2NXUo0muZ3OJ
         T6xwd0ee1Rz4U/+TR+9Ln/J70xod1HB/gluutGSpXZQsdqfRCitDSxOsJgtJ7wJyEyQr
         fnnwUf5absJHlXDWnHHDuniOlFTePOr1TYivpSnRd3HpcYcOOcgPV6ZbxsYYKrcPj9CA
         ltqw==
X-Gm-Message-State: AOAM530eQnwMw+/4UQ/L1Me01in1r9IQ/EdOl49L/LrKZ42OsMvdXy88
        myiuOxK6G7E8vuOy7vBsQEDqIqZTqVDZocnIEMQ=
X-Google-Smtp-Source: ABdhPJyv9RMUXyAYOpM1YTzH05tgBfGzWWBGV01ij4eR3r4SqM/ARCPd0lwVEmuO55TKtWTvUc9PXUrtgB3bSCdpvhs=
X-Received: by 2002:a17:902:ea8c:b029:d2:8abd:c8de with SMTP id
 x12-20020a170902ea8cb02900d28abdc8demr13228529plb.21.1602260330457; Fri, 09
 Oct 2020 09:18:50 -0700 (PDT)
MIME-Version: 1.0
References: <20201009150756.3397-1-sakari.ailus@linux.intel.com> <20201009150756.3397-3-sakari.ailus@linux.intel.com>
In-Reply-To: <20201009150756.3397-3-sakari.ailus@linux.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 9 Oct 2020 19:19:40 +0300
Message-ID: <CAHp75VeU4pFCDP2AZVTCuAY+dv0L-=cR2Qo0ggaEU1vr68sgXA@mail.gmail.com>
Subject: Re: [PATCH 2/5] ipu3-cio2: Serialise access to pad format
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 9, 2020 at 6:10 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Pad format can be accessed from user space. Serialise access to it.

Same nit-picks as per v1, feel free to ignore it.


-- 
With Best Regards,
Andy Shevchenko
