Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E8F26242FD
	for <lists+linux-media@lfdr.de>; Thu, 10 Nov 2022 14:12:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbiKJNMH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Nov 2022 08:12:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230489AbiKJNMF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Nov 2022 08:12:05 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF3617376B
        for <linux-media@vger.kernel.org>; Thu, 10 Nov 2022 05:12:04 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id l14so2210287wrw.2
        for <linux-media@vger.kernel.org>; Thu, 10 Nov 2022 05:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9gzQD/nB7pytCjPRd5v0oHLZIjUx2Pl77ICo7gyFLio=;
        b=FnQuZLP6/Y0/kZnGX+x9d7xOoL+xZVjqi3rG5QdmFVQY1qSFUlVbBHJtyVATjrs64D
         NUKw+a3wIX6gBaxd6T7O0qY701ooP3JLE06tUuGlr1XF7/p/YvADLZF21atWC1GMBscq
         P2UrX5VR9he54f34ypkC4JswBI+Gnvwqnjxoov7iK3YWstR3pK18R/crS+YkOeyLAO/3
         9YVg8yhYkAHQ/XlXP3MPxvYumEGprz6EI564YTHKhEownZzYKbkXw0xq/uakb+tcnHn7
         cRQFF/HEjts9dhNvC6e0TJFeBCMc7/LRny+nbcol1eymO4v577Nox6rDp8oMnAAx20+3
         hlkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9gzQD/nB7pytCjPRd5v0oHLZIjUx2Pl77ICo7gyFLio=;
        b=VOi3JwWC10elBXPKh/m8yr2XCZKH00z1HS2P0DTrbvY9ywIiUy4u6abf6bwj4tGRDr
         D5jgDdR8hT416RBX9EHEM31JiZ5/cs+h5z+mAtoE9FXKAboqB24Eo3L9a9Z4NVAMLV8a
         aNVOgZ3AXkfU/l0NyfrR43cWe+0RZci/h5zB3jCZEfdB42u41/XXRMQ1e7boBrFu6UiR
         n/hyowGbSf9b+QwJwWSvHbs7S48H6ECwiU+K7bSM4ubM9uHQlf3lWkB34RmPSY6YqW2a
         gblSQO2nd6JUefT/t4oRElil9+AQ9bE/JyyGU/mppi2EBuX2H2Iqoz2jqg0Njq44veBm
         XxYg==
X-Gm-Message-State: ACrzQf0EAeybLZ7WrtGV+Ho8lXgOi4Tq5YG9ZOJ19s11kcEGboltioVR
        cq62xvded1MP7BVuyoPrk1ymHigze48=
X-Google-Smtp-Source: AMsMyM7If/NzZx2mLB7PSCZAXXfKZCWkXopFMkdY6l5bKktHJH55S8hPf9Ayj7wqmMZltAHjmG4vKw==
X-Received: by 2002:adf:efd0:0:b0:22e:382d:b06 with SMTP id i16-20020adfefd0000000b0022e382d0b06mr968459wrp.265.1668085922983;
        Thu, 10 Nov 2022 05:12:02 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m20-20020a05600c4f5400b003cf894dbc4fsm5813512wmq.25.2022.11.10.05.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 05:12:02 -0800 (PST)
Date:   Thu, 10 Nov 2022 16:11:59 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Benjamin MUGNIER <benjamin.mugnier@foss.st.com>
Cc:     oe-kbuild@lists.linux.dev, lkp@intel.com,
        oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [sailus-media-tree:master 17/47]
 drivers/media/i2c/st-vgxy61.c:891 vgxy61_apply_gpiox_strobe_mode() warn:
 impossible condition '(reg < 0) => (0-u16max < 0)'
Message-ID: <Y2z4n8b+tEtzNR/4@kadam>
References: <202211091255.jCcREh11-lkp@intel.com>
 <fcb1fc9c-df59-aefd-93f7-9acd2df44f91@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fcb1fc9c-df59-aefd-93f7-9acd2df44f91@foss.st.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 10, 2022 at 12:43:30PM +0100, Benjamin MUGNIER wrote:
> After running smatch on my tree I couldn't reproduce this warning:
>   warn: pm_runtime_get_sync() also returns 1 on success
> I'm using the latest smatch cloned from github. Do you append some
> options to kchecker to get this output ?

TL;DR: Thanks for the report!  I will fix it later this week.

It's not really supposed to warn at all...  The pm_runtime_get_sync()
returns negatives on error so testing for "if (ret < 0) {" is correct
as a general case.  In this case it is wrong but normally it would be
the correct check.

This is an interaction with the check for uninitialized variables,
check_uninitialized.c.  A common false positive was caused by mismatches
where a function checks for if (ret) but the caller checks for
if (ret < 0) {.

int function(...)
{
	ret = frob();
	if (ret)
        ^^^^^^^^
		return ret;
	return 0;
}

int caller(...)
{
	ret = function();
	if (ret < 0) {
        ^^^^^^^^^^^^

How should positives be treated?  So what the check_uninitialized.c
check does is that it says, "let's assume that "ret >= 0" and "!ret"
are equivalent".  It creates a fake environment to test what !ret means
for uninitialized variables.  The check_pm_runtime_get_sync.c check sees
the "!ret" condition and says, "Nope.  That's supposed to be "ret < 0"".

Smatch shouldn't be printing warnings from inside the fake environment.

regards,
dan carpenter

