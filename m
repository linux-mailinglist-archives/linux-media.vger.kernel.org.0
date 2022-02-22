Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 819E74C02BB
	for <lists+linux-media@lfdr.de>; Tue, 22 Feb 2022 21:01:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235413AbiBVUBE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Feb 2022 15:01:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235512AbiBVUAb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Feb 2022 15:00:31 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A658FEAC60
        for <linux-media@vger.kernel.org>; Tue, 22 Feb 2022 12:00:03 -0800 (PST)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4C5AE482;
        Tue, 22 Feb 2022 21:00:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645560001;
        bh=+4i97jFZc0AzIe7SJ58T6StWTas6nPFnu84Ok99LkOw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=GRd1Gypa6yaiQlzjD0F5rIJow2ma0eINet3XLkZScrom5YqTDEZWx6RuZqKvqhe5g
         Zd63UZ7aR5kmi1gf84y4j9Klhol+e4pW1Ya5xWIRHJdRRj4txTEyJCW4h7Zwe+v+T3
         RYHa7+K/I/zT5MJMLqRobdrZLBBv5toCOpiOAHjA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ac23b61c-10c8-a36c-6da8-d232b8399503@linuxfoundation.org>
References: <20220222063202.petjwwcfctzsbhxx@basti-TUXEDO-Book-XA1510> <5d5dee88-9dbf-e4d0-4a91-11ff4ecd82ea@xs4all.nl> <ac23b61c-10c8-a36c-6da8-d232b8399503@linuxfoundation.org>
Subject: Re: Deprecated Maintainer entries?
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     dafna@fastmail.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        linux-media@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Helen Fornazier <helen.fornazier@gmail.com>,
        Sebastian Fricke <sebastian.fricke@posteo.net>,
        Shuah Khan <skhan@linuxfoundation.org>
Date:   Tue, 22 Feb 2022 19:59:59 +0000
Message-ID: <164555999952.3548538.14050135200074246530@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Shuah Khan (2022-02-22 15:17:01)
> Hi Hans,
>=20
> On 2/22/22 12:46 AM, Hans Verkuil wrote:
> > The same is true for VIMC where Helen was maintainer. Shuah, would you
> > be willing to take over VIMC as maintainer? If not, then I can put myse=
lf
> > up there as maintainer (but 'odd fixes' only, probably).
> >=20
>=20
> I will be happy to take over VIMC as maintainer.
>=20
> Keiran, you said you can help - would you like to be a reviewer? Let
> me know the role you would like to play. I will send patch to update
> the MAINTAINER entry for the driver.

Sure, please add kieran.bingham@ideasonboard.com.

Thanks

--
Kieran

>=20
> Helen, sorry to see you leave the community. Hope you will be able to
> come back in the future.
>=20
> thanks,
> -- Shuah
