Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DAB048C21B
	for <lists+linux-media@lfdr.de>; Wed, 12 Jan 2022 11:17:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352452AbiALKRn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jan 2022 05:17:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352445AbiALKRm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jan 2022 05:17:42 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1CBBC06173F
        for <linux-media@vger.kernel.org>; Wed, 12 Jan 2022 02:17:41 -0800 (PST)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 27470340;
        Wed, 12 Jan 2022 11:17:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1641982659;
        bh=xg8hUjW0G86ICuP5ZJLuJAtkXeYYmT8qPztByCPcPVs=;
        h=In-Reply-To:References:Subject:From:To:Date:From;
        b=ZT+9XMuPcAFCoM5hljr/HJmCen8m5b3zrtNO3U+s5w4NV0cpyRJLmWw890Hlob2uP
         WrUr1HVndYCrssxbY/xJt6m0z+k3pl1Kc1nIRlhsW933gF51QmTFy2vdfiz91GebeM
         YeAeK4ce7kAwuzYE/2KeGloT/A9uB1QwLLZTz7lM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <385a88ad-54b6-97eb-9e08-c9cbb2c564e8@qtec.com>
References: <20220111164855.147487-1-dlp@qtec.com> <164192283176.10801.16438722671029975593@Monstersaurus> <385a88ad-54b6-97eb-9e08-c9cbb2c564e8@qtec.com>
Subject: Re: [PATCH] media: docs: Change unintended assignment in v4l
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     Daniel Lundberg Pedersen <dlp@qtec.com>,
        linux-media@vger.kernel.org, mchehab@kernel.org
Date:   Wed, 12 Jan 2022 10:17:36 +0000
Message-ID: <164198265662.10801.11036576762133741693@Monstersaurus>
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Daniel Lundberg Pedersen (2022-01-12 09:43:49)
> > Ouch - that's not helpful in documentation indeed.
> > Good spot, and fix.
>=20
> Thanks :)
>=20
> > It might help to say 'in v4l2grab' in the $SUBJECT rather than 'v4l' as
> > that would be a bit more specific.
>=20
> Should I make a V2 with an updated subject?
> Eg.: 'media: docs: Fix unintended assignment in v4l2grap'

Up to you and Mauro, I would expect it could be handled when applying
for such a small change.=20

"media: docs: Fix unintended assignment in v4l2grab"

would indeed be a better title.

--
Kieran


>=20
>=20
> Regards Daniel
