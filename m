Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE24D678AEA
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 23:43:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231663AbjAWWnp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 17:43:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231493AbjAWWnp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 17:43:45 -0500
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 964B42A16A
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 14:43:43 -0800 (PST)
Date:   Mon, 23 Jan 2023 22:43:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
        s=protonmail; t=1674513820; x=1674773020;
        bh=T32LL4EZWJQiTlXZRxo3uLZWpZ3nMl2Yd6h6TykQanE=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=oGsustv/aFX0neTu+taywujaK+r0UzyNyTXL1EH0SenQ9kbK8TQbkWncZWWNbWd0w
         0q2DVVDBF1KDD5SXA3GDEPict5czz5ZSzTKXQ1LXI+t0+pK8VNYty5qzhg79V0FI+4
         zFyZ2M8YIsGNCxhUfemogRHhg8EtYhLrVL1sr+m8AhfYtio31JBZamad1RG0vsrRoo
         hVHoa7oegg7VGikVDQ+Xc9/uOhMywPVOPKsSroRSKR/Fj9NxkEpnC12Zn8JiPt3rkL
         Y/y/UmBORXdLag6rH5z4E3p6b+GIiW1KIk7Yv4FNdsIpaQRrpfNOrhpjZqTqJKiQuP
         HDk1Yk8Pk6Cpg==
To:     Sebastian Wick <sebastian.wick@redhat.com>
From:   Simon Ser <contact@emersion.fr>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        DRI Development <dri-devel@lists.freedesktop.org>,
        wayland-devel <wayland-devel@lists.freedesktop.org>
Subject: Re: [ANNOUNCE] pixfmtdb
Message-ID: <B55u__QnPBXyk6SrEEYETx1ugeGjZHT9Fva6b9fpZazX-v7nTFJqnKH9Y7OebmOTQ51zffSYMnrfnfYutoWSLzpt-bWk2K8V69Ru7327VlM=@emersion.fr>
In-Reply-To: <CA+hFU4z-3iotNkUVr=aHrQ9GFNnGLrvL2B1isnx2x2UnnO+qXA@mail.gmail.com>
References: <nn8qWh16AviRPuLVOg_I-Nn747ncRsuJsZU_VZHvKhxp2hoFBCFsAfezBDkiwM-yn-CXAW_Vos121VKtETNsSZU3EuCuVzcgHBnnWNnww-g=@emersion.fr> <Y86skCbxY5kZglo8@pendragon.ideasonboard.com> <CA+hFU4z-3iotNkUVr=aHrQ9GFNnGLrvL2B1isnx2x2UnnO+qXA@mail.gmail.com>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Monday, January 23rd, 2023 at 21:25, Sebastian Wick <sebastian.wick@redh=
at.com> wrote:

> Why is the TF defined for GL formats and both the primaries and TF for
> Vulkan formats? The only exception here should be sRGB formats. Where
> did you get the information from?

This is what upstream dfdutils does [1]. Can you explain why you think
it should be undefined instead of linear?

I was wondering what to do for DRM formats regarding these. I think it
would be worthwhile to do like Vulkan: set TF =3D linear, primaries =3D
BT.709, pre-multiplied alpha =3D yes. These are the things KMS assume
when there is no override (ie, when there is no KMS property saying
otherwise).

[1]: https://github.com/KhronosGroup/dfdutils/blob/5cd41cbdf63e80b00c085c69=
06a1152709e4c0f2/createdfd.c#L47
