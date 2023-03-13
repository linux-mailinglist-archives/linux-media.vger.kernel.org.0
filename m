Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9ED46B7224
	for <lists+linux-media@lfdr.de>; Mon, 13 Mar 2023 10:10:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230371AbjCMJKo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Mar 2023 05:10:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230333AbjCMJKX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Mar 2023 05:10:23 -0400
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CF50527E
        for <linux-media@vger.kernel.org>; Mon, 13 Mar 2023 02:09:23 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id D5291100072; Mon, 13 Mar 2023 09:09:20 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
        t=1678698560; bh=TN9J8TDHhxf7oyZKW86YScAICKaHnKyuQZKYbo5aK2s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LdDaX3OwlIGiqwpzXh4u1dWyG608cfvvijBY/N9CgTUT+vxXYX4TQ3TH+QVihdu2t
         Ofpj7dOGacBsEwtQVvREWPl8iSFjGgqbtP45woaBEMTDFCstr1D8n37mxSA+or8LIE
         jregYYlAM1FcBY8hhyZ7vvz7ishtulnkfluXUi1nVtdPn0qunDpnw44KGbYq3pz/5C
         XDMrr6IAmD0ZXpP6/eOcbYBde+RfAKhIPbUzMdiOtR17YgxG+N5+INQM/FW6ioboc+
         f22lxAa1ED1f1H+or1mbVepy8ssx1UykwAvic/0hit/ccS570xnbhCKBW39O9sHqUx
         m9j5Ixwz4o2NA==
Date:   Mon, 13 Mar 2023 09:09:20 +0000
From:   Sean Young <sean@mess.org>
To:     Gregor Jasny <gjasny@googlemail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, hverkuil@xs4all.nl, mchehab@kernel.org
Subject: Re: [v4l-utils] [PATCH v10 1/5] Add support for meson building
Message-ID: <ZA7oQMz24B+vDN5V@gofer.mess.org>
References: <20230223164441.22719-1-laurent.pinchart@ideasonboard.com>
 <20230223164441.22719-2-laurent.pinchart@ideasonboard.com>
 <250e45e0-de13-5ef8-ce68-eb2cc9e58f73@googlemail.com>
 <20230312144903.GO2545@pendragon.ideasonboard.com>
 <d5776457-6fae-2192-ffe4-2791a595b1e3@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5776457-6fae-2192-ffe4-2791a595b1e3@googlemail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Mar 13, 2023 at 08:57:21AM +0100, Gregor Jasny wrote:
> Hello,
> 
> On 12.03.23 15:49, Laurent Pinchart wrote:
> > Will you submit the patch to the linux-media mailing list ?
> 
> after fighting more than one hour with git send-email and Google Mail I
> finally gave up and pushed the patches to the master branch.
> 
> /me wishes for:
> * a low-entry barrier patch submitting mechanism
> * a nice CI system with configuration-as-code
> * a bug tracker

Me too. 

 - Would save a lot of time, submitting patches is too manual
 - Make make things much easier to track
 - CI would undoubtedly improve code quality
 - Too hard for users to submit bugs
 - much more..

gitlab would be great for v4l-utils, I think.


Sean
