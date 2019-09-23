Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64E54BAFBD
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2019 10:36:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728307AbfIWIgw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Sep 2019 04:36:52 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:36515 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725816AbfIWIgw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Sep 2019 04:36:52 -0400
Received: by mail-wr1-f68.google.com with SMTP id y19so12910112wrd.3;
        Mon, 23 Sep 2019 01:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5MyWWJmU5w9hACf2FXcPJcFzzYcPTHiwXkpFyd1Cp2A=;
        b=WQkGSa2SVRBJSY6D9P/vUVX+FDK8mu2KnCBOchlsDJo3IAO8f5tsDmbDhfhJ1HziEZ
         0aqw4nmplkfwb5uY35pplp5a/dyg5NhnDp2HOvikZnu+U69v/br85XotcLLljY2PmI4C
         cbKQiH0iVuV6T7apX+L/OL83ZK3fPP9e1PNrVwZrrP9h7RJgJNRyYB6nguRvhUQlU5Eq
         TdLXfWkKHab7oPUC+AOCnIo/x8lwpO7brgBS/uyXdnYR3mxKUe3tTt+ZRYZyfSXdDr5Y
         7eubB9/Xl3HmqsafkhIgScgLrAB66HNTXdF9w8mfkiMFXuXcTzZ+Cz08ut8xxFBT0UcC
         qF8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5MyWWJmU5w9hACf2FXcPJcFzzYcPTHiwXkpFyd1Cp2A=;
        b=BjYA4SiPrAwCnLzVENXjjDbZ8usNgwdJeWtYxfI3/6znCzbo6qCEYdcPFsVaDrYtdf
         c+uSsaYtmp9v5MpM9Gy+IER3/9tyzG136kc6Bm9bF5bl4vjsVvDb1Wi7LfLWzWY47+5R
         vsuK8Rooa6HBwybrwebdZLIrwt2hCBI0wbXVT9X+8yAanQL7CKPc/AVzNT1LVEGQiV3I
         hQimx4FjbJXm9zp2ZcWXFq7Qscg+BeZUp4KtPRKH1RGsGVLotJSa5gUb2ZMS8HQDBcxI
         44Rcsaxcw3iGEYwU9HRLkRSM8CcuMHE39VoBCBcrD2/iWP9SJQXwj8aCsltTPePXZ/wW
         TliA==
X-Gm-Message-State: APjAAAW1xBwKarzufXUBt8W01CcfbMGw7+NabVvzXwM418ch6LDSaF9a
        C9Mgxb8sc2Fh2PXPKC6g5xQ=
X-Google-Smtp-Source: APXvYqypb/U+eDmb+J3ur64CjTEho7wTo8LwJJWNtXeqd/EE1eaSJNedWltB7YHylnpR4hOdAhvq1w==
X-Received: by 2002:adf:eb42:: with SMTP id u2mr19395063wrn.307.1569227809649;
        Mon, 23 Sep 2019 01:36:49 -0700 (PDT)
Received: from Red ([2a01:cb1d:147:7200:2e56:dcff:fed2:c6d6])
        by smtp.googlemail.com with ESMTPSA id b186sm5909174wmd.16.2019.09.23.01.36.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Sep 2019 01:36:49 -0700 (PDT)
Date:   Mon, 23 Sep 2019 10:36:47 +0200
From:   Corentin Labbe <clabbe.montjoie@gmail.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     mjpeg-users@lists.sourceforge.net, linux-media@vger.kernel.org,
        mchehab@kernel.org, laurent.pinchart@ideasonboard.com,
        linux-kernel@vger.kernel.org
Subject: Re: bringing back media/zoran driver
Message-ID: <20190923083647.GB1599@Red>
References: <20190921170357.GA26626@Red>
 <8db38daf-74eb-8218-1cc6-ea9036afac3d@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8db38daf-74eb-8218-1cc6-ea9036afac3d@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Sep 23, 2019 at 10:05:09AM +0200, Hans Verkuil wrote:
> On 9/21/19 7:03 PM, Corentin Labbe wrote:
> > hello
> > 
> > I am the owner of a zoran based DC10+ card.
> > I am in the need of using it since yesterday and I found that its driver was removed.
> > 
> > Reverting the removing patch made to a temporary working situation.
> > 
> > If I understand correctly, it was removed due to lack of vb2 convertion.
> > If I am able to do this vb2 conversion, does bring it back in mainline will be posssible ?
> > In that case I am ready to assume to be the maintainer if needed.
> 
> It would be nice to get it back. The conversion to vb2 is the main requirement, but in
> general this driver needed some TLC in general: it's a very old driver and the coding
> standards were quite a bit lower than they are today.
> 
> But the vb2 conversion is the most important part.
> 
> It's unfortunately not the easiest thing to do (if it was, we'd have done it already!),
> and it is also a 'big bang' patch, i.e. one very large patch that converts the driver
> to vb2. It's all or nothing, you can't have half a vb2 conversion, so that makes it hard
> to review.

Hello

Yes I started a bit to do it by using other conversion patch as helper and I saw this "one big step" problem.

> 
> The easiest way is to use the v4l2-compliance utility to verify the conversion. Running
> 'v4l2-compliance -s' is a good way of verifying this.
> 
> My recommended approach is to:
> 
> 1) first revert the removal patch (commit 8dce4b265a53)
> 2) clean up the coding style. Probably easiest to create one patch per source.
>    Use 'checkpatch.pl --strict -f <source>' for this. Doing this should make the
>    source code easier to understand/review.
> 3) Run v4l2-compliance (without the -s option) and fix any failures it finds.
> 4) Convert to vb2, using 'v4l2-compliance -s' to test.
> 
> Be aware that the code is messy compared to modern standards. Do not be afraid
> to create cleanup patches, it's probably needed.
> 
> The v4l2-compliance utility is part of https://git.linuxtv.org/v4l-utils.git/.
> See the README on how to build. Always use the v4l2-compliance version from this
> git repo since that's always the latest and greatest.
> 
> I recommend that you join the #v4l irc channel on freenode.org. Most core devs that
> can help with advice are there during office hours (and often outside of office hours
> as well). That's for the European timezones since most devs are based in Europe.
> 

Thanks, I has planned to ask this question about the priority between v4l2-compliance and vb2.

Regards
