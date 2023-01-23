Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83C13678072
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 16:50:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232918AbjAWPuA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 10:50:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232916AbjAWPtp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 10:49:45 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14CD518156
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 07:49:41 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C200D2D9;
        Mon, 23 Jan 2023 16:49:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674488980;
        bh=zsDmmFaVw8eWcq27RJRLSVyDCigJwIYalpynKAmVx94=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oTpO2xtuCgkoq907YiKL2WbJJJ38PBJ6aZaBA5LPBMhi8rHPWWKgklKkBNeHQlWSj
         GI7weGO+qvKO4AI7KRNKsaJ46yC6a3/OgRCevQo2TYgTMMwNwaXx6KiXiLkEE8AEPc
         rUrygzpIjNfMj+ShD5zCskbxstDtBSGkFKblMWFE=
Date:   Mon, 23 Jan 2023 17:49:36 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Simon Ser <contact@emersion.fr>
Cc:     wayland-devel <wayland-devel@lists.freedesktop.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        linux-media@vger.kernel.org
Subject: Re: [ANNOUNCE] pixfmtdb
Message-ID: <Y86skCbxY5kZglo8@pendragon.ideasonboard.com>
References: <nn8qWh16AviRPuLVOg_I-Nn747ncRsuJsZU_VZHvKhxp2hoFBCFsAfezBDkiwM-yn-CXAW_Vos121VKtETNsSZU3EuCuVzcgHBnnWNnww-g=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <nn8qWh16AviRPuLVOg_I-Nn747ncRsuJsZU_VZHvKhxp2hoFBCFsAfezBDkiwM-yn-CXAW_Vos121VKtETNsSZU3EuCuVzcgHBnnWNnww-g=@emersion.fr>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

CC'ing the linux-media mailing list.

On Mon, Jan 23, 2023 at 02:10:58PM +0000, Simon Ser wrote:
> Hi all,
> 
> In the last few days I've been working on a small new project, pixfmtdb [1].
> It's a Web database of pixel format guides, it can be useful to understand
> how pixels are laid out in memory for a given format and which formats from
> various APIs are compatible with each other.
> 
> pixfmtdb relies on the Khronos Data Format Specification [2] to describe
> each format. This means that each format is described with a standardized
> data blob, which can be re-used with other tools for other purposes.
> 
> My future plans include adding more formats and format families to pixfmtdb,
> and make it easy to use the data for code generation, in particular for
> automatically generating tables containing metadata about formats, as used
> in Wayland compositors and other projects.
> 
> I hope some of you can find this work useful,
> 
> Simon
> 
> [1]: https://pixfmtdb.emersion.fr
> [2]: https://www.khronos.org/dataformat

-- 
Regards,

Laurent Pinchart
