Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 958FF32F457
	for <lists+linux-media@lfdr.de>; Fri,  5 Mar 2021 21:03:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229672AbhCEUCn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Mar 2021 15:02:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbhCEUCb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Mar 2021 15:02:31 -0500
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E77F2C06175F
        for <linux-media@vger.kernel.org>; Fri,  5 Mar 2021 12:02:30 -0800 (PST)
Received: by mail-qt1-x829.google.com with SMTP id d11so2711802qtx.9
        for <linux-media@vger.kernel.org>; Fri, 05 Mar 2021 12:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=bm9PlQtkZzox2LiJWcUeNUMdk7mzudNnzwhsphhsY5M=;
        b=Lcl11MQ320+b9kjBQ4ui6IeEqNjWeFH2wrWT04YGdPA0Lkr2VvzZmoL78q9UZBk8uM
         bYi7N0eQlCaXG/GlhogM8v7TiESJXisWKlCP+i0YRvfWXWpbXSeMrvzol/Wi8Na7T+6/
         30mAwMQ8D2IKCvevkKp/ifNT+zKsQ4NHj1/rzKGQ+s6q9GltJ/e7bLRsZz7ZQjMQh8K0
         wfJovQvVrtR3ymm0OpbTc4PglUdTm0X3/VkxmQDsKaucMvVcOocAEdY2fSOCPLgevAAb
         KCcKP0p0moLgQf4oHa7al9DZ8Zh6ro6YJAUdVSJC3C08tHe7Ock5ohV2yYg/ShIJuWYG
         L1cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=bm9PlQtkZzox2LiJWcUeNUMdk7mzudNnzwhsphhsY5M=;
        b=mUlxKgqyBgdltkGUjfS9WFgXAG/XsghvjDccJAhl9bflzljbL6OqQFm5sLtHRpGZui
         bnG6qee0zByBpOBfKVe+Q0u2GKm74nDtp8CYvTSBj24xEYnHdH2Cv43wPrQRsDhjqAS6
         ZUeoW8Dk7J8y/WYSeGXibbRdiU6Fk8fsHytoh3jqIqQesZAHzS9FVBtatpJe2YPvVLJt
         8eNiN0FJWXeV1HII81sZ5E/269YTVF+9xB9e48ud7n/8yRp+DpGJFSIprkI8q41mD1e7
         pZ6fXBPrLE7skp1oT88HUlDTXsbmgFDetGVV/V1YC6e4Goi4w/kuLnbMJOrX9eIU3cjK
         uV1Q==
X-Gm-Message-State: AOAM530OzdU2D4S1tkpuHReBOxtCoWYiK0dn0XO01AF+BwBAkE+tagl9
        3KYHQ6mdpxNmViiRsRn5Zgj1cd3SIIdoWK3u
X-Google-Smtp-Source: ABdhPJzCKdB/kt3EMEhyFUfBx5V9bfrM96Zj2jb3Zl4JknFuS3Rmn6brIGU1KHEELBHQV5OBtK0BzA==
X-Received: by 2002:ac8:73c4:: with SMTP id v4mr10362912qtp.275.1614974550138;
        Fri, 05 Mar 2021 12:02:30 -0800 (PST)
Received: from nicolas-tpx395.lan (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id y20sm2508743qtw.32.2021.03.05.12.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 12:02:29 -0800 (PST)
Message-ID: <f2173a80daeb915a6402681d833cd1a052be2f56.camel@ndufresne.ca>
Subject: Re: Support for the Logitech Brio webcam?
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Greg Warnusz <gwarnusz@lectorprep.org>,
        kieran.bingham@ideasonboard.com
Cc:     linux-media@vger.kernel.org
Date:   Fri, 05 Mar 2021 15:02:28 -0500
In-Reply-To: <6cd936c3207d4b8b065df7cef3b12a92@lectorprep.org>
References: <2d32b42777e171ebcc77a74c9a09caba@lectorprep.org>
         <0db861b4ea8c69239ac0fd7955891ebe@lectorprep.org>
         <5b9de81ffc46b0faf4d9f9350efa4ecc1113cb82.camel@ndufresne.ca>
         <a94af6bd-c3f1-010a-6efe-6ebec53d9396@ideasonboard.com>
         <6cd936c3207d4b8b065df7cef3b12a92@lectorprep.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3 (3.38.3-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le vendredi 05 mars 2021 à 08:58 -0600, Greg Warnusz a écrit :
> Thank you, Kieran.
> 
> I was trying to decide whether to buy the Brio. Nicolas Dufresne enabled 
> me to understand that the Brio is a UVC camera, so I'm more likely to 
> buy it. But I won't be surprised if the select-field-of-view option does 
> not work out-of-the-box. Maybe I will be pleasantly surprised.

I don't remember exactly (don't have access to the cam atm), but the field of
view depended on the aspect ration (16:9 vs 4:3). On top of which, it has a zoom
control.

> 
> Greg Warnusz
> Saint Louis, Missouri, USA
> 
> ---
> ______________________________________
> 
> “When I see an adult on a bicycle, I do not despair for the future of 
> the human race.”
> ― H.G. Wells
> 
> On 2021-03-05 06:11, Kieran Bingham wrote:
> > On 05/03/2021 02:57, Nicolas Dufresne wrote:
> > > Le mercredi 03 mars 2021 à 15:26 -0600, Greg Warnusz a écrit :
> > > > Dear open-sorcerers,
> > > > 
> > > > I run Ubuntu and would like to use the Logitech Brio. Most attractive 
> > > > is
> > > > its selectable 3 fields-of-view.
> > > > 
> > > > Here's the manufacturer's own blurb about its other abilities:
> > > > 
> > > > Brio is a remarkable piece of technology that streams crystal-clear
> > > > video with superb resolution, frame rate, color and detail, including
> > > > autofocus and 5x HD zoom. Brio delivers 4K Ultra HD video at 30 fps, 
> > > > HD
> > > > 1080p at either 30 or 60 fps, and HD 720p at 30, 60 or an 
> > > > ultra-smooth
> > > > 90 fps for outstanding clarity, smoothness, and detail.
> > > > 
> > > > More info:
> > > > https://www.logitech.com/en-us/products/webcams/brio-4k-hdr-webcam.960-001105.html?crid=34
> > > > 
> > > > At US$200, it's still popular, as evidenced by its sold-out status at
> > > > many vendors.
> > > > 
> > > > Is there a chance that developers smarter than I can make this work,
> > > > even with limited features, for Linux?
> > > 
> > > Not ure I understand, the Brio is a UVC camera. In fact, the one I've 
> > > used works
> > > out of the box. Of course, it works better over USB3.
> > 
> > I know there are a couple of models of the Brio 4k.
> > 
> > The one I have works fine too.
> > 
> > What issues are you actually reporting here? That it doesn't work at
> > all? or that you can't select the field of view/zoom?


