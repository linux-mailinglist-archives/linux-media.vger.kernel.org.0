Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00B1B5757FA
	for <lists+linux-media@lfdr.de>; Fri, 15 Jul 2022 01:21:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232818AbiGNXVh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jul 2022 19:21:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232546AbiGNXVg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jul 2022 19:21:36 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABAD565D0
        for <linux-media@vger.kernel.org>; Thu, 14 Jul 2022 16:21:35 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6608C9DA;
        Fri, 15 Jul 2022 01:21:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657840892;
        bh=cRhEJ8oECTGElwWDoH2j7dDaLa/Nrru4c7lu6kEYUwU=;
        h=In-Reply-To:References:Subject:From:To:Date:From;
        b=OC8v1qNXit9XDFjf8tH276UTXHVKLAvFHtrxZUCAPdIqKJiNG1KTxOoO7LjYbG8Yb
         mFB8VoAIJ5FJRKpa4/FERDk2096q8Z792+kFXFbccZk6RU88x5JlklxfIA7vtIM1Ta
         G9lLV5Wu/kW9CSCDLSRqARaURh6nVxv7Vg6zGfkg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YtA0oTgCRlRP8K53@p310.k.g>
References: <YtA0oTgCRlRP8K53@p310.k.g>
Subject: Re: properly set test pattern to a sub-device
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     Petko Manolov <petko.manolov@konsulko.com>,
        linux-media@vger.kernel.org
Date:   Fri, 15 Jul 2022 00:21:29 +0100
Message-ID: <165784088978.3944957.6816198396634347236@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Petko Manolov (2022-07-14 16:22:09)
>         Hi guys,
>=20
> I've got a long pipeline of four entities and need to make the imx492 sen=
sor=20
> stream out a test pattern.  When i do:
>=20
>         v4l2-ctl -d /dev/v4l-subdev2 --set-ctrl=3Dtest_pattern=3D2
>=20
> I can see the driver acknowledging the switch to test pattern 2.  However=
, when=20
> start streaming with:
>=20
>         v4l2-ctl -d /dev/video0 --stream-mmap --stream-to=3Dframe.raw --s=
tream-count=3D1
>=20
> the driver reports setting the test pattern to the default 0.  How should=
 this=20
> be done properly?

'Which' driver is reporting setting the test pattern? Can you check
where that's happening and identify 'why'?

As I understand it - it shouldn't be happening, so I suspect it's
something in your CSI2 receiver driver initialising some defaults
perhaps.
--
Kieran

>=20
>=20
> thanks,
> Petko
