Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8415E6B7396
	for <lists+linux-media@lfdr.de>; Mon, 13 Mar 2023 11:15:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229831AbjCMKPv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Mar 2023 06:15:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbjCMKPu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Mar 2023 06:15:50 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45ACA53737
        for <linux-media@vger.kernel.org>; Mon, 13 Mar 2023 03:15:49 -0700 (PDT)
Received: from pendragon.ideasonboard.com (85-76-109-120-nat.elisa-mobile.fi [85.76.109.120])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A188982;
        Mon, 13 Mar 2023 11:15:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1678702547;
        bh=NXJzgLVhSmaAttJuh1mnwYOkiDQDNgyU6U6IM5Q4pic=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qL7V68UIf37hxRKYfS2Tjno7v/F7Qp7+NXURFOl+09dvSPYglU6KuZtOcSSGXlkCl
         6Vgr22tyikhe0lGFmwXPX31hxavb/9jZjJiprnqq1B4raYFZSNnJ3QxkBhxaZApe4i
         lrnO+Fnra397HCI+VT5mWoMxr776in5Mwqbmk5VE=
Date:   Mon, 13 Mar 2023 12:15:48 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sean Young <sean@mess.org>
Cc:     Gregor Jasny <gjasny@googlemail.com>, linux-media@vger.kernel.org,
        hverkuil@xs4all.nl, mchehab@kernel.org
Subject: Re: [v4l-utils] [PATCH v10 1/5] Add support for meson building
Message-ID: <20230313101548.GF2545@pendragon.ideasonboard.com>
References: <20230223164441.22719-1-laurent.pinchart@ideasonboard.com>
 <20230223164441.22719-2-laurent.pinchart@ideasonboard.com>
 <250e45e0-de13-5ef8-ce68-eb2cc9e58f73@googlemail.com>
 <20230312144903.GO2545@pendragon.ideasonboard.com>
 <d5776457-6fae-2192-ffe4-2791a595b1e3@googlemail.com>
 <ZA7oQMz24B+vDN5V@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZA7oQMz24B+vDN5V@gofer.mess.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Mar 13, 2023 at 09:09:20AM +0000, Sean Young wrote:
> On Mon, Mar 13, 2023 at 08:57:21AM +0100, Gregor Jasny wrote:
> > Hello,
> > 
> > On 12.03.23 15:49, Laurent Pinchart wrote:
> > > Will you submit the patch to the linux-media mailing list ?
> > 
> > after fighting more than one hour with git send-email and Google Mail I
> > finally gave up and pushed the patches to the master branch.
> > 
> > /me wishes for:
> > * a low-entry barrier patch submitting mechanism
> > * a nice CI system with configuration-as-code
> > * a bug tracker
> 
> Me too. 
> 
>  - Would save a lot of time, submitting patches is too manual
>  - Make make things much easier to track
>  - CI would undoubtedly improve code quality
>  - Too hard for users to submit bugs
>  - much more..
> 
> gitlab would be great for v4l-utils, I think.

I'm fine with gitlab as a hosting, submission and CI system. Give me a
way to push a branch to gitlab and still have all reviews on the
linux-media mailing list, and I'll be fine :-)

-- 
Regards,

Laurent Pinchart
