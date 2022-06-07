Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49CF454226A
	for <lists+linux-media@lfdr.de>; Wed,  8 Jun 2022 08:47:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380345AbiFHBEC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jun 2022 21:04:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1579017AbiFGXjL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Jun 2022 19:39:11 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB4061842E1
        for <linux-media@vger.kernel.org>; Tue,  7 Jun 2022 14:36:47 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2016087B;
        Tue,  7 Jun 2022 23:36:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1654637805;
        bh=5Jy6BguBDATv2Poy9zDg7UAXFJ0KLqZulWuxawdvaAg=;
        h=In-Reply-To:References:Subject:From:To:Date:From;
        b=oK0kfA2wpslM7Mki/bIz5BtCyXoWstWaUIQbjOWZrsUxCp3RTuvhQVI2gCqq616LL
         sTqge8UbAOnlWFjM7U2WCDRKU3WVOY5MOFPPmEe8qsY9Khewz6u9E8JPb6VBRlh6Jq
         cRJoeVX34FGwXjbsZ3fIClSvv/9/41NAL4bSsQ+M=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAFP0Ok_DvJo7KM4YSsT2s3SAzDQdSy-8HrQoky6zH5YE4sGypw@mail.gmail.com>
References: <CAFP0Ok_DvJo7KM4YSsT2s3SAzDQdSy-8HrQoky6zH5YE4sGypw@mail.gmail.com>
Subject: Re: Attaching an I2C VCM subdev (media entity) to media pipeline
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     Karthik Poduval <karthik.poduval@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Date:   Tue, 07 Jun 2022 22:36:42 +0100
Message-ID: <165463780248.186364.12552426317591956823@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Karthik,

Quoting Karthik Poduval (2022-06-07 18:29:23)
> Hi All,
>=20
> I had a question about VCM subdev (media entity). The  example VCM
> drivers have no pads. How do we attach them to the image sensor subdev
> in the pipeline ?

This requires a bit of support that was added fairly recently for
managing non-data links between subdevices. This was added through the
use of 'ancillary links' which can connect a sensor and a VCM.

It should be handled automatically if you're on the latest kernel
version, but if not you would perhaps need to back-port the
implementation. I believe it's handled automatically through the async
subdevice notifier systems.

> --=20
> Regards,
> Karthik Poduval

--
Kieran
