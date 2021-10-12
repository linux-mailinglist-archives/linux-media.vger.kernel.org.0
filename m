Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3978E429EFB
	for <lists+linux-media@lfdr.de>; Tue, 12 Oct 2021 09:51:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234299AbhJLHx3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Oct 2021 03:53:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232541AbhJLHx3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Oct 2021 03:53:29 -0400
Received: from lb2-smtp-cloud7.xs4all.net (lb2-smtp-cloud7.xs4all.net [IPv6:2001:888:0:108::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0BDCC061570;
        Tue, 12 Oct 2021 00:51:27 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id aCZEm6H77k3b0aCZHmPQ6C; Tue, 12 Oct 2021 09:51:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1634025086; bh=hUa4Afqd5gg+cquL4Lyv8KpPDbtL0wmho/7jZ8PFIWU=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=tNeF8x+t2GYOTo2hqqG6/MyC3upJSR2SYjwkLIe9D3vRISYjGiWBGP9Ebx1C8/iBT
         YwLVkjmIo9sf2VJ7Pa5s+oyWebiBHJOjm6fpIsr3wlbwYYRNGqQqQWUsFbFAqxKPpW
         gCuvgzgcuz5RtL+sKc/Y0/n0pXXFsOJ9F1a50d3nTLj2FwdXXH2CI4anIq294Il17Q
         wWnSTxlmat2A+FoOnGwgXny5QWsEiaQkLQSDAnuTMcJ9MgfFsBmPsmZG7Cjn1aioc/
         FnDSzpABEXE6OqxNUjbrIsWom3V6BgeH3/qcze84UYtnxRv8o+koRlsNIbVqB1RklK
         2p5d7iUsmfcTQ==
Subject: Re: [PATCH v2] i.MX6: Support 16-bit BT.1120 video input
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        =?UTF-8?Q?Krzysztof_Ha=c5=82asa?= <khalasa@piap.pl>,
        Steve Longerbeam <slongerbeam@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <m34k9uml6s.fsf@t19.piap.pl>
 <07f22ee105dd8d3eaa47cbb27428032f5b9e3043.camel@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <3a638276-8a1b-835e-1728-669bbd49a1ac@xs4all.nl>
Date:   Tue, 12 Oct 2021 09:51:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <07f22ee105dd8d3eaa47cbb27428032f5b9e3043.camel@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfFBykBnb47KwmOMm4EBR7GXoDmMfMKdKmTpO2i0lJ9mTg8IddA/s/X8673oOlGMvnUSqBzBBMws7G/nTXkhxogsVGrxpp3IYrM3SIeJLQzMTrmClrnMR
 HdGkSOiXUu2kXFdhlPg6y+h9+PXCn003MZQO/+epVf6NSPJxTAtOeXduklh7OoZftoA6J9LJ20f7VjFtnZc6qxylIrrjfplHXNA7q+tJ8aMeIE8+WidTDPeY
 pdZ7bBl1/AYYjR8dUJ/AsGasTd1ONXMuZ9mC6YnHcr1ejnR5hpBQpCsFcD25rFTdeIGWz3egotziVrjwzl3uPlNMgjkuhcEMz0ZTdj5jPkWKIWPAhN96CEG0
 ECj6P/9IjTwulCrUDcx4Hbh2ygkYzWmT27dhiiD0Ucb5eL5mQPbxDxQKt+j9NxVfasBIJTfxya/rOtB+AAbAbd484BfC4Qbp2gi6BfjKo0LAAR218HFJeLQ1
 chTqMmt6jo9ugma1fSFRZojdZVVVru2tfjbYcHbl7uKsVzSMD6j95mZdVHzA6Xg57WZpeBZrcdVTtb120rqb06OfZ8oCd24DnBZEs8Wv/6M+RjpxB2afDdWu
 w4bhWoizFxDygqgi48MaLlIV2PWFvRh/HDlS53h5/23XW9oxnYm7zbwlxWX1PavG1aY=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Philipp,

I can take this patch and merge it, right? Even though it mostly changes
drivers/gpu/ipu-v3/ipu-csi.c, it is still something for the media tree to pick
up, I think. Just checking to avoid this patch going in via two subsystems...

Regards,

	Hans

On 08/10/2021 13:31, Philipp Zabel wrote:
> On Wed, 2021-10-06 at 08:13 +0200, Krzysztof Hałasa wrote:
>> Confirmed to work with ADV7610 HDMI receiver.
>>
>> Signed-off-by: Krzysztof Hałasa <khalasa@piap.pl>
> 
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> 
> regards
> Philipp
> 

