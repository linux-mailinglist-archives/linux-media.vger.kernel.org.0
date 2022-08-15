Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 636475927AD
	for <lists+linux-media@lfdr.de>; Mon, 15 Aug 2022 04:06:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230188AbiHOCGu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Aug 2022 22:06:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229614AbiHOCGt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Aug 2022 22:06:49 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2D2A12AB3
        for <linux-media@vger.kernel.org>; Sun, 14 Aug 2022 19:06:47 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id h28so5614695pfq.11
        for <linux-media@vger.kernel.org>; Sun, 14 Aug 2022 19:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=RGx/Qp3Gi5F06shkDIHb1fnw3ffr/xXLSbmYylTjeeA=;
        b=bDsmXmdfczHc+NbW7ruAgdcczOb/4l8mmhDGampzTGcpRHHjJ1twbK+RQQXZEpO5BH
         kSCpjVDPFFzEO5kwa01XpURyT8Lt2UZnmvUhizde96Qxuji8dtgp2AcZGrXU4sxqlk4w
         a63qDx4rW37z+3Jhe6ZiSpBXT/fve8KKjdbXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=RGx/Qp3Gi5F06shkDIHb1fnw3ffr/xXLSbmYylTjeeA=;
        b=DwBIq6YOqHol/U3WCHRHLuXmDz8j+oGvEaSSK1LApuXODOnoqTX9dwbcmQT2e64jdf
         UkGVCn7+tpSyCximiyujNvuEI8Mec6/MGZGLXzK9d2uv80iaOg93TaHAwxEfgPFJlKTy
         dO9V5vzWbNwYr/o44v2iUrVWoYs8OPJncK7U5LxMfxBbAjpe09b0KWt98jEn8BZVqp44
         LUH3gVBW/oylPv0h9UFfLDdfa3N+K8xhK0PvV361CIO5uSClsmJlvCpFVQ/RAFPTDBpz
         Hkpb2dSs5D/Nbahq7VarrchdHAOOzzj6AcXNzkuzHBrn06pxMD5h+wEHblxLjeX1WQE/
         jiwQ==
X-Gm-Message-State: ACgBeo2zZhwo3DhxsomJS7y8oDigBgZ89o3KI/WcIsN+UoHiLnk72BMI
        rZiMBxxoNtQRiyJPM07lrZyqaw==
X-Google-Smtp-Source: AA6agR5YN9YetwZ39QriWr6eUGMiuxJCX6xwv/jOIwrsCt7wxyH3k1QxxlsBGDmrV0fkUVzWNKDs1w==
X-Received: by 2002:aa7:95a8:0:b0:52d:4185:198d with SMTP id a8-20020aa795a8000000b0052d4185198dmr14565441pfk.65.1660529207408;
        Sun, 14 Aug 2022 19:06:47 -0700 (PDT)
Received: from google.com ([240f:75:7537:3187:110b:946c:84b2:7c95])
        by smtp.gmail.com with ESMTPSA id d7-20020a170903230700b0016efc27ca98sm6025252plh.169.2022.08.14.19.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 19:06:46 -0700 (PDT)
Date:   Mon, 15 Aug 2022 11:06:39 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Paul Menzel <pmenzel@molgen.mpg.de>,
        Wang Yating <yating.wang@intel.com>,
        Christoph Jechlitschek <christoph.jechlitschek@intel.com>,
        Hao Yao <hao.yao@intel.com>, Andy Yeh <andy.yeh@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        linux-media@vger.kernel.org, Mark Pearson <markpearson@lenovo.com>,
        Dell.Client.Kernel@dell.com, linux-kernel@vger.kernel.org,
        Guenter Roeck <groeck@google.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Andy Whitcroft <apw@canonical.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Christian Schaller <cschalle@redhat.com>,
        Wouter Bolsterlee <wouter@bolsterl.ee>,
        Miguel Palhas <mpalhas@gmail.com>, it+linux-media@molgen.mpg.de
Subject: Re: Missing MIPI IPU6 camera driver for Intel Alder Lake laptops
Message-ID: <YvmqL6Wz7o77ukF5@google.com>
References: <52c87d91-422d-fca0-4dd5-bbaa559c81b6@molgen.mpg.de>
 <YvUKLbv/pOfbbeL+@pendragon.ideasonboard.com>
 <YvUaEDMbZD70x+hD@kroah.com>
 <YvUbhx4HSxAAwIvv@pendragon.ideasonboard.com>
 <YvUghWZbXIUofg5A@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YvUghWZbXIUofg5A@kroah.com>
X-Spam-Status: No, score=1.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FSL_HELO_FAKE,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (22/08/11 17:30), Greg KH wrote:
> On Thu, Aug 11, 2022 at 06:08:55PM +0300, Laurent Pinchart wrote:
> > On Thu, Aug 11, 2022 at 05:02:40PM +0200, Greg KH wrote:
> > > On Thu, Aug 11, 2022 at 04:54:53PM +0300, Laurent Pinchart wrote:
> > > > For the time being, I agree with your recommendation to not buy these
> > > > devices if you care about camera support.
> > > 
> > > I second this, don't buy these devices if the vendor is not willing to
> > > get their drivers upstreamed properly.
> > 
> > "Not willing" may be a bit too harsh here. I wouldn't just blame Intel
> > for not upstreaming a driver if it turns out that the V4L2 API isn't a
> > good match and we have no proposal to provide an alternative.
> 
> Did they propose an alternative?  From what I saw here they didn't even
> attempt it, or did I miss that?

The plan here is to land CAM kernel API first and then switch IPU
(driver and user-space) to it so that upstreaming for Intel will
be easier.
