Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F8CB592A5B
	for <lists+linux-media@lfdr.de>; Mon, 15 Aug 2022 09:27:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232507AbiHOHYb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Aug 2022 03:24:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230269AbiHOHYa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Aug 2022 03:24:30 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8116313D76
        for <linux-media@vger.kernel.org>; Mon, 15 Aug 2022 00:24:28 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id t22so6287763pjy.1
        for <linux-media@vger.kernel.org>; Mon, 15 Aug 2022 00:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=Q5N86kLYxq9QmTfTNbzESbnomJfIEPTu6reZq/3gpMU=;
        b=kjXCx/Qjj4J94lupFA6rAC7RCPECcsqNohB+htscOzUO2dcU5T1jQcHfjDQOXmcudY
         V5Mrg81kDQgwmIs9WTYezPuPpfOx78Zw4IyYLh8JQL139VnFwnSJmgThhNbbidvQWNKw
         BrYANp2A3GcIQsqNdBDweEF0WRAI+O7wMSlWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=Q5N86kLYxq9QmTfTNbzESbnomJfIEPTu6reZq/3gpMU=;
        b=3C+xt5QSal+Z+2pEq/ors4gSMmwaNFoE1KPQwdti7J0EScKptwlof2gQWdm1o8xBNT
         VI18M/ZW/YZ0lwm2WgyJqVqeudjoDoupdbBMkPd2rqFKH7Ftgokq+vLQnHtJylgxyNZA
         MJAOUf2XbGlUuNLF7c4cNcyS1MJHmwr3G3dxfqjSN0kFrbwe6IiJMfWmouYC/ubRNodW
         DkuziRPq91WEcE2T79249T9bbBYOLPAfMJ6nfH931uoIJfI3TN7zmTLxVZsJniGz2akq
         iEFbXWcDqiWXM6PZissv14eAsP+4qcUEKPrmZPT8BcCxWgoKkbp2Xgj6LDxkoVIRcTg4
         fWqg==
X-Gm-Message-State: ACgBeo0QM/P+b9ZOqAM1YJFdHO93Qwbgc7/cMJLv4tJ1fIBdh6Ai3XVn
        2KiadUdZSrP1vYk3+FdlO7JLFA==
X-Google-Smtp-Source: AA6agR6TM+X5b2JG0yiMWjxNJG8ZVb1/6UTM+DZhRU91dN93au19pTx3Y/3QNjWVqlwzt7Sn2uc9IQ==
X-Received: by 2002:a17:902:f30b:b0:170:c8ec:63b1 with SMTP id c11-20020a170902f30b00b00170c8ec63b1mr15978377ple.125.1660548268105;
        Mon, 15 Aug 2022 00:24:28 -0700 (PDT)
Received: from google.com ([240f:75:7537:3187:110b:946c:84b2:7c95])
        by smtp.gmail.com with ESMTPSA id p16-20020a170902e75000b0016dc2153f54sm6432130plf.299.2022.08.15.00.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Aug 2022 00:24:27 -0700 (PDT)
Date:   Mon, 15 Aug 2022 16:24:19 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
        Andy Whitcroft <apw@canonical.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Christian Schaller <cschalle@redhat.com>,
        Wouter Bolsterlee <wouter@bolsterl.ee>,
        Miguel Palhas <mpalhas@gmail.com>, it+linux-media@molgen.mpg.de
Subject: Re: Missing MIPI IPU6 camera driver for Intel Alder Lake laptops
Message-ID: <Yvn0o96K8j5gRaWM@google.com>
References: <YvUKLbv/pOfbbeL+@pendragon.ideasonboard.com>
 <YvUaEDMbZD70x+hD@kroah.com>
 <YvUbhx4HSxAAwIvv@pendragon.ideasonboard.com>
 <YvUghWZbXIUofg5A@kroah.com>
 <YvmqL6Wz7o77ukF5@google.com>
 <YvnpVmnROTsWWw0o@kroah.com>
 <YvnrJBI8599+E43T@google.com>
 <YvnvnL9pBAgWMgTk@kroah.com>
 <YvnwtN1SwQjilJ97@google.com>
 <YvnybHVFmpUJs4qi@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YvnybHVFmpUJs4qi@kroah.com>
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

On (22/08/15 09:14), Greg KH wrote:
> > Definitely not today. Someday, for sure :)
> > 
> > I don't want to promise any timelines. But we are certainly not
> > talking "weeks", we are talking "months". Several months is a
> > realistic timeline.
> 
> Ok, so getting this merged is a good year out at the best, realisticly 2
> years given that once you submit the first version for review, the real
> work will start happening.

Well, nothing is really set in stone here. We may revisit our strategy,
say turn it upside down, and hit upstream mailing list as soon as possible
instead.


> So I'll stick with my original statement, don't buy this hardware
  ... if you plan on running vanilla kernel. Otherwise do buy :)
