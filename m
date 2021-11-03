Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61F5C44450E
	for <lists+linux-media@lfdr.de>; Wed,  3 Nov 2021 16:57:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232489AbhKCP7q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Nov 2021 11:59:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231876AbhKCP7n (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Nov 2021 11:59:43 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5477BC061203
        for <linux-media@vger.kernel.org>; Wed,  3 Nov 2021 08:57:06 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id d5so4329710wrc.1
        for <linux-media@vger.kernel.org>; Wed, 03 Nov 2021 08:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=eRvj9qYI+2l7/7aUCZ50U+44Z6UG0IqeflVK/0bEcvo=;
        b=BZz+zyywefqfNDI4gN4GDIM0uwo+FGSPcLNoq8DH2EXoe56E32R0v4glZZpSqHvkR/
         sbLHeTm4jmFtLgyiP5il6cidyVwnm/QcUw+cpD1tSl0vT7dMlJnK2qrC2bJvlJVSeLBz
         mItrt4gUdMoh7jQfhyR0fMzPZnw+Slkatr5pyLYowy4Vqf9MZWbXhjXvWJHn1o7tFSBl
         3kw7mG28mKixAVjUtYZzWipsWohjqyBC8vluMVwO+QhPb3QAcNJlAqREIe+O56MgF+Rj
         6lSVMNXjMG0DB5I3FHvra0nW8vhSCHdLX85k5eUkA6+Fq4mpthVNJGWj1iaLSihcnUmM
         QD/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=eRvj9qYI+2l7/7aUCZ50U+44Z6UG0IqeflVK/0bEcvo=;
        b=k9MSPvrfz/kjlxl8FQB2I8Kwn/4fs7BeLREF1WyofQBC7ibvTgfdGNWqOv54CDi14B
         PkG776DECb5tFHBSRIMmPMwiT9XTABQOxWaRB6NHLHnNLc83X8OlFGZr96NHQ0GsDKhE
         d0bVmce4/rSXuXE0gyDEp3q4v4EYMdZ4P4pfBaySqes/6jFgMLDwrM4/FgXmfcprGTxX
         u6jr50mxZcfeKBYNWIo/6OWWmY7pjOhh56lVV9clq03sU8WvKslIQ64w8EIGm1fbOF12
         Iuyj4jMSzP7vL0vn8yNOGx1Rnil/t01M3/RtzG3kOX5S01NQFJX1RzDa5Ktk9nPx1Hf0
         mbPQ==
X-Gm-Message-State: AOAM531eAWZubhmyKsNSj6Bnr5u/2WHrYwVrkUbpe+1Xad7slxgd8+ZN
        6mIy11vMlRau1w0y8+nKmToIHQ==
X-Google-Smtp-Source: ABdhPJxvQ4B9y40EuhwiBKOvJ12HuXF5RU2mRbTh9lwg4xo6yOedTE2cuS4DHK3f5Fl5qo4ZYIHTSg==
X-Received: by 2002:a5d:4890:: with SMTP id g16mr58678884wrq.10.1635955024911;
        Wed, 03 Nov 2021 08:57:04 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id p13sm6470355wmi.0.2021.11.03.08.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 08:57:04 -0700 (PDT)
Date:   Wed, 3 Nov 2021 16:57:02 +0100
From:   LABBE Corentin <clabbe@baylibre.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, mjpeg-users@lists.sourceforge.net
Subject: Re: [PATCH v3 00/14] staging: media: zoran: fusion in one module
Message-ID: <YYKxTrWI299pvqo7@Red>
References: <20211026193416.1176797-1-clabbe@baylibre.com>
 <a85c93db-e118-274f-d86a-d127c7399926@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a85c93db-e118-274f-d86a-d127c7399926@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le Wed, Nov 03, 2021 at 04:21:02PM +0100, Hans Verkuil a écrit :
> Hi Corentin,
> 
> On 26/10/2021 21:34, Corentin Labbe wrote:
> > Hello
> > 
> > The main change of this serie is to fusion all zoran related modules in
> > one.
> > This fixes the load order problem when everything is built-in.
> 
> I've been testing this series, and while the module load/unload is now working,
> I'm running into a lot of other v4l2 compliance issues.
> 
> I've fixed various issues in some follow-up patches available in my tree:
> 
> https://git.linuxtv.org/hverkuil/media_tree.git/log/?h=zoran
> 
> At least some of the worst offenders are now resolved. Note that the patch
> dropping read/write support relies on this patch:
> 
> https://patchwork.linuxtv.org/project/linux-media/patch/4f89b139-13b7-eee6-9662-996626b778b0@xs4all.nl/

Hello

My test branch already included your "zoran: fix various V4L2 compliance errors"
I have quickly checked other patch and I am ok with them.
I will add and test with them.

> 
> But there is one really major bug that makes me hesitant to merge this:
> 
> This works:
> 
> v4l2-ctl -v pixelformat=MJPG,width=768,height=576
> v4l2-ctl --stream-mmap
> 
> This fails:
> 
> v4l2-ctl -v pixelformat=MJPG,width=768,height=288
> v4l2-ctl --stream-mmap
> 
> It's an immediate lock up with nothing to indicate what is wrong.
> As soon as the height is 288 or less, this happens.
> 
> Both with my DC30 and DC30D.

Just for curiosity, what is the difference between thoses two ?

> 
> Do you see the same? Any idea what is going on? I would feel much happier
> if this is fixed.
> 
> Note that the same problem is present without this patch series, so it's
> been there for some time.
> 

I will start on digging this problem and add thoses commands to my CI.
And I know there are a huge quantity of problem since origins.
A simple example is that just setting MJPEG as default input format does not work.

But since it is not related to my serie, can you please merge it.

Thanks
Regards
