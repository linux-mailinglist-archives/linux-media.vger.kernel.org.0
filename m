Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D299592A17
	for <lists+linux-media@lfdr.de>; Mon, 15 Aug 2022 09:07:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241376AbiHOHHp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Aug 2022 03:07:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241363AbiHOHHl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Aug 2022 03:07:41 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0278915FD2
        for <linux-media@vger.kernel.org>; Mon, 15 Aug 2022 00:07:41 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id pm17so6240234pjb.3
        for <linux-media@vger.kernel.org>; Mon, 15 Aug 2022 00:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=d8dVTQ61h74//IiNS8ult/UyvToEoiQ8Qp1Jo3t+hKE=;
        b=n+XrueGckfBi/YbrvI1We9ylD/+cQzf/PVWo/CXMQKXRcqiToukZcz7L38gfFoS5XF
         zUKIBQMpQBIDD/65kuC3VTQJPgJXFteFJ7Sqvi39Kp7wslNgBEWd0MIVYimCyTRftjh/
         6pw1dtpOht7kXadpIsSxH9IA0AsAmcGA1Zyhg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=d8dVTQ61h74//IiNS8ult/UyvToEoiQ8Qp1Jo3t+hKE=;
        b=M0k7yiBZgtFXQLrrNq2fQdyogRHKLoEkbh1Q+hBg8Y1Mnuo5O3yBnViHEsayf2pBQ5
         15m962tjBnPMwIkIHP/B312SChkZRVn5PShcZqz63yMxQ9Qq4SSwKpGGSyjwPxfV2onb
         OPg5rgUNSA43/3Q69lsQWeVtvK8PiODIkbmX9Ll6SZRZZc8KB8SxtSV4/qpJrOfBwx3q
         vI+xhzBbIUD/rZ4Q0taen/3pU3T7QEIXPOtmrzF/iImMBwVr0V5p8Fy8KNTdrFx14gyM
         ZbDExz7TBHVrwuzR2kRZWXTdky7fVVQP8/DFtWWo4P4jXHbpALePbXN2a7fDbN8cvX3X
         s9xg==
X-Gm-Message-State: ACgBeo0ZJ6+dGq3lkLjlZ5BwuEY7/eFQsgU3LNgv4JlFPcuFHc7Redvm
        QFaIir3/TQBAW4uevVIwHver2w==
X-Google-Smtp-Source: AA6agR5NcEcen1oGlvCJWVUf5Q4E5YysA7IctpK6zgem3+VFPdRBUqJebOyXYnLdlzFmWFGUpZb4uA==
X-Received: by 2002:a17:902:778b:b0:171:5bee:14a1 with SMTP id o11-20020a170902778b00b001715bee14a1mr13441250pll.153.1660547260563;
        Mon, 15 Aug 2022 00:07:40 -0700 (PDT)
Received: from google.com ([240f:75:7537:3187:110b:946c:84b2:7c95])
        by smtp.gmail.com with ESMTPSA id b3-20020a170903228300b0016edff78844sm6406957plh.277.2022.08.15.00.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Aug 2022 00:07:39 -0700 (PDT)
Date:   Mon, 15 Aug 2022 16:07:32 +0900
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
Message-ID: <YvnwtN1SwQjilJ97@google.com>
References: <52c87d91-422d-fca0-4dd5-bbaa559c81b6@molgen.mpg.de>
 <YvUKLbv/pOfbbeL+@pendragon.ideasonboard.com>
 <YvUaEDMbZD70x+hD@kroah.com>
 <YvUbhx4HSxAAwIvv@pendragon.ideasonboard.com>
 <YvUghWZbXIUofg5A@kroah.com>
 <YvmqL6Wz7o77ukF5@google.com>
 <YvnpVmnROTsWWw0o@kroah.com>
 <YvnrJBI8599+E43T@google.com>
 <YvnvnL9pBAgWMgTk@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YvnvnL9pBAgWMgTk@kroah.com>
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

On (22/08/15 09:02), Greg KH wrote:
[..]
> > We haven't sent out KCAM for upstream review yet. It's open sourced,
> > as of this moment [1], but we still need some time and wanted to convert
> > one of the previous generations of IPU drivers (IPU3) to KCAM first to
> > see if everything is working as we wanted it to.
> 
> That didn't answer my question on when you were planning to actually
> submit this :)

Definitely not today. Someday, for sure :)

I don't want to promise any timelines. But we are certainly not
talking "weeks", we are talking "months". Several months is a
realistic timeline.
