Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 203437AB081
	for <lists+linux-media@lfdr.de>; Fri, 22 Sep 2023 13:22:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233628AbjIVLWW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Sep 2023 07:22:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233634AbjIVLWV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Sep 2023 07:22:21 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A027CAF
        for <linux-media@vger.kernel.org>; Fri, 22 Sep 2023 04:22:14 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8FB8C433D9;
        Fri, 22 Sep 2023 11:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695381734;
        bh=Ched8wXyhDR12B3TkyRlsIOzWX2ibo3ogQqUKg7GRLM=;
        h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
        b=WWozBd1QsZJnPkWwvDhB3Uc41BxMrCwex7F1V4NJnHVE5ryjJh4MGfrripDl9cjxq
         8f1AuOtNSAGc7B6TFvWaTSuWpWznjmTJ7xa5/AEit12IWrr3fRc8BUP3JfjA89Y/SI
         K/UnwWC58awvI1QN8nYEs+TIC4SqO4WvBjEvitWVY3AAQTmgz8y9x5YUfl4F/Ie5zB
         S5X9NdXlOBnkhldjDP3hmgTcCXmj8LEhh9HBpx8tE6Ey/BCYIust6H8xt7mfn0zV8x
         M8mwId+PfV+U3js17rvHIzFNF1+lnUvz42HssiaBzFSejaZcGNh9tx8K4g2HEE1x5C
         LexE4w5tcRRaA==
Message-ID: <d6ce775682ac38c6f5790343d7c5b5ad.mripard@kernel.org>
Date:   Fri, 22 Sep 2023 11:22:11 +0000
From:   "Maxime Ripard" <mripard@kernel.org>
To:     "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH 2/7] media: cadence: increase buffer size in
 csi2tx_get_resources()
In-Reply-To: <20230922105036.3148784-3-hverkuil-cisco@xs4all.nl>
References: <20230922105036.3148784-3-hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, "Arnd Bergmann" <arnd@kernel.org>,
        "Maxime Ripard" <mripard@kernel.org>
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 22 Sep 2023 12:50:31 +0200, Hans Verkuil wrote:
> Fixes this compiler warning:
>=20
> drivers/media/platform/cadence/cdns-csi2tx.c: In function 'csi2tx_get_res=
ources':
> drivers/media/platform/cadence/cdns-csi2tx.c:485:63: warning: '%u' direct=
ive output may be truncated writing between 1 and 10 bytes into a region of=
 size 8 [-Wformat-truncation=3D]
>   485 |                 snprintf(clk_name, sizeof(clk_name), "pixel_if%u_=
clk", i);
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
