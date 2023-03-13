Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E44A06B70DF
	for <lists+linux-media@lfdr.de>; Mon, 13 Mar 2023 09:11:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229514AbjCMILA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Mar 2023 04:11:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbjCMIK7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Mar 2023 04:10:59 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D3E79D
        for <linux-media@vger.kernel.org>; Mon, 13 Mar 2023 01:10:58 -0700 (PDT)
Received: from pendragon.ideasonboard.com (unknown [89.244.118.114])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EA3BF563;
        Mon, 13 Mar 2023 09:10:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1678695056;
        bh=16JlsqUQs02kEIdK64+kS+GmblawjD8UAEg3aR5ETUU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rtKRZ0fUrttq33tzeCqCfext5KYaBRvQxyDztCQO9Nj1hBpAWqr2LtAJNTNBv1H5F
         /v6lXfxYx3gOrT+6JHV1rZsYdRsskjccNKDhHnpyqr80NbNHEU6CxRcugETKl2XvEi
         7O6wcp1JwvADGEJlgJ3RmKX81o3BTTudzW1iviXc=
Date:   Mon, 13 Mar 2023 10:11:00 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Gregor Jasny <gjasny@googlemail.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        mchehab@kernel.org, sean@mess.org
Subject: Re: [v4l-utils] [PATCH v10 1/5] Add support for meson building
Message-ID: <20230313081100.GD2545@pendragon.ideasonboard.com>
References: <20230223164441.22719-1-laurent.pinchart@ideasonboard.com>
 <20230223164441.22719-2-laurent.pinchart@ideasonboard.com>
 <250e45e0-de13-5ef8-ce68-eb2cc9e58f73@googlemail.com>
 <20230312144903.GO2545@pendragon.ideasonboard.com>
 <d5776457-6fae-2192-ffe4-2791a595b1e3@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d5776457-6fae-2192-ffe4-2791a595b1e3@googlemail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Gregor,

On Mon, Mar 13, 2023 at 08:57:21AM +0100, Gregor Jasny wrote:
> On 12.03.23 15:49, Laurent Pinchart wrote:
> > Will you submit the patch to the linux-media mailing list ?
> 
> after fighting more than one hour with git send-email and Google Mail I 
> finally gave up and pushed the patches to the master branch.
> 
> /me wishes for:
> * a low-entry barrier patch submitting mechanism

If you want to give git-send-email another try (which is still the
recommended option), https://git-send-email.io/ provides instructions
tailored for different distributions and e-mail providers.

Otherwise, b4 can be used to submit patches without SMTP:
https://people.kernel.org/monsieuricon/sending-a-kernel-patch-with-b4-part-1.

> * a nice CI system with configuration-as-code
> * a bug tracker

-- 
Regards,

Laurent Pinchart
