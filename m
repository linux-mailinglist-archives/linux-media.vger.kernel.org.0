Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B80E7CFBE0
	for <lists+linux-media@lfdr.de>; Thu, 19 Oct 2023 16:02:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345902AbjJSOC1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Oct 2023 10:02:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345830AbjJSOC0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Oct 2023 10:02:26 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9A61B0
        for <linux-media@vger.kernel.org>; Thu, 19 Oct 2023 07:02:24 -0700 (PDT)
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 80B7E276;
        Thu, 19 Oct 2023 16:02:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1697724135;
        bh=/LQn4FWo1AwRDApyIFU8vNNjFPJ6eTsRGSfbtUFvKcc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=GsS22U8YeuBvb4iJQyAfi4RNlH8P3X4zbDspNGBSWAhxWCwdpBhr04eRP6HicHcPs
         SLLgst6V7j/ectxkXqmv0do42Cxq+svcslXXVlZmipXnlfgECbBfr+oTIAAlDzRFu5
         DrRw35iTr0CrCTzm2tQzYS5REfAFbXJdZS9x6x+o=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231019090128.430297-1-umang.jain@ideasonboard.com>
References: <20231019090128.430297-1-umang.jain@ideasonboard.com>
Subject: Re: [PATCH v3 0/3] staging: vc04_services: Tweak module autoloading support
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Stefan Wahren <stefan.wahren@i2se.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Carpenter <error27@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Umang Jain <umang.jain@ideasonboard.com>
To:     Umang Jain <umang.jain@ideasonboard.com>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org, linux-staging@lists.linux.dev
Date:   Thu, 19 Oct 2023 15:02:20 +0100
Message-ID: <169772414040.630990.4275963316980490979@ping.linuxembedded.co.uk>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Umang Jain (2023-10-19 10:01:25)
> As explained by Greg KH in [1], we should not be using MODULE_ALIAS
> to auto load modules within VC04. Drop that, in favour of
> MODULE_DEVICE_TABLE. This series addresses the suggestion.
>=20
> Patch 1/3 adds vchiq_bus_device_id and supporting entries in=20
> script/mod/file2alias.c
>=20
> Patch 2/3 drops MODULE_ALIAS from bcm2835-audio in favour
> of MODULE_DEVICE_TABLE.
>=20
> Patch 3/3 drops MODULE_ALIAS from bcm2835-camera in favour
> of MODULE_DEVICE_TABLE.
>=20
> [1]:  https://lore.kernel.org/linux-media/2023100955-stunt-equate-c6fa@gr=
egkh/

Does this series now complete the task in
drivers/staging/vc04_services/interface/TODO? :

> * Get rid of all non essential global structures and create a proper
> per device structure

The series looks good to me though:


Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

>=20
> --
> Changes in v3:
> - Drop "_bus" suffix from all patches (and commit message)
>   as pointed out in v2 review
>=20
> Changes in v2:=20
> - NULL terminate device_id_table arrays (in 2/3 and 3/3)
>=20
> Umang Jain (3):
>   staging: vc04_services: Support module autoloading using
>     MODULE_DEVICE_TABLE
>   staging: vc04_services: bcm2835-audio: Drop MODULE_ALIAS
>   staging: vc04_services: bcm2835-camera: Drop MODULE_ALIAS
>=20
>  drivers/staging/vc04_services/bcm2835-audio/bcm2835.c    | 8 +++++++-
>  .../vc04_services/bcm2835-camera/bcm2835-camera.c        | 8 +++++++-
>  .../vc04_services/interface/vchiq_arm/vchiq_bus.c        | 2 +-
>  .../vc04_services/interface/vchiq_arm/vchiq_bus.h        | 3 +++
>  include/linux/mod_devicetable.h                          | 4 ++++
>  scripts/mod/devicetable-offsets.c                        | 3 +++
>  scripts/mod/file2alias.c                                 | 9 +++++++++
>  7 files changed, 34 insertions(+), 3 deletions(-)
>=20
> --=20
> 2.40.1
>
