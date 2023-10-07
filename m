Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 283047BC748
	for <lists+linux-media@lfdr.de>; Sat,  7 Oct 2023 13:53:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343880AbjJGLxs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Oct 2023 07:53:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343680AbjJGLxs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 7 Oct 2023 07:53:48 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5386AB6;
        Sat,  7 Oct 2023 04:53:47 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 472E6C433C8;
        Sat,  7 Oct 2023 11:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1696679626;
        bh=dqUCLf7VJJQ0WmX/MCm12hiJxadk/DBDL9bDj5rTUg0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=W2pkUPldZaTK/U7f0cFp/yf/G63SlUhl3nWK3cjfVeiNanEE7E9G2CMVFUHlLgvBB
         7Vr0vlqLLcAmWY7UkdAVjMhXigqf8FVEPeV1idcOBdEOYz7DSTQ2XOYnJk/+quBebH
         G9YW5ejUnFDKPcawvr4tWTQFF3r8BQEUIYsLULnE=
Date:   Sat, 7 Oct 2023 13:53:44 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Ben Hutchings <ben@decadent.org.uk>
Cc:     stable@vger.kernel.org, patches@lists.linux.dev,
        stable <stable@kernel.org>,
        Stefan Lippers-Hollmann <s.l-h@gmx.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Christoph Hellwig <hch@lst.de>, linux-media@vger.kernel.org,
        linux-modules@vger.kernel.org,
        Luis Chamberlain <mcgrof@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH 4.19 178/273] media: dvb: symbol fixup for dvb_attach()
Message-ID: <2023100730-imprint-follow-56ec@gregkh>
References: <20230920112846.440597133@linuxfoundation.org>
 <20230920112852.017230256@linuxfoundation.org>
 <b12435b2311ada131db05d3cf195b4b5d87708eb.camel@decadent.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b12435b2311ada131db05d3cf195b4b5d87708eb.camel@decadent.org.uk>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 28, 2023 at 01:36:06AM +0200, Ben Hutchings wrote:
> On Wed, 2023-09-20 at 13:30 +0200, Greg Kroah-Hartman wrote:
> > 4.19-stable review patch.  If anyone has any objections, please let me know.
> > 
> > ------------------
> > 
> > From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > 
> > commit 86495af1171e1feec79faa9b64c05c89f46e41d1 upstream.
> > 
> > In commit 9011e49d54dc ("modules: only allow symbol_get of
> > EXPORT_SYMBOL_GPL modules") the use of symbol_get is properly restricted
> > to GPL-only marked symbols.  This interacts oddly with the DVB logic
> > which only uses dvb_attach() to load the dvb driver which then uses
> > symbol_get().
> > 
> > Fix this up by properly marking all of the dvb_attach attach symbols as
> > EXPORT_SYMBOL_GPL().
> [...]
> 
> This (and other) backports missed a couple of affected exports:
> 
> - sp8870_attach in drivers/media/dvb-frontends/sp8870.c
>   (renamed to drivers/staging/media/av7110/sp8870.c upstream)
> - xc2028_attach in drivers/media/tuners/tuner-xc2028.c
>   (renamed to drivers/media/tuners/xc2028.c upstream)

Thanks for catching this, fixed up now for 4.14.y and 4.19.y.

greg k-h
