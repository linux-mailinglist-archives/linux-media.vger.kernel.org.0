Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C82060137A
	for <lists+linux-media@lfdr.de>; Mon, 17 Oct 2022 18:32:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229716AbiJQQcH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Oct 2022 12:32:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230046AbiJQQcF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Oct 2022 12:32:05 -0400
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0983E2BCA
        for <linux-media@vger.kernel.org>; Mon, 17 Oct 2022 09:32:03 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 6D33110000C;
        Mon, 17 Oct 2022 16:32:01 +0000 (UTC)
Date:   Mon, 17 Oct 2022 18:31:59 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 02/10] media: ar0521: Add V4L2_CID_ANALOG_GAIN
Message-ID: <20221017163159.ttozu526qsqiiaaf@uno.localdomain>
References: <20221005190613.394277-1-jacopo@jmondi.org>
 <20221005190613.394277-3-jacopo@jmondi.org>
 <m31qrk6wgc.fsf@t19.piap.pl>
 <20221007071725.zxcbx4kwwh2pt7ax@uno.localdomain>
 <Yz/jqA6ZACHOXxl/@pendragon.ideasonboard.com>
 <20221017151003.5vqxgfewyjrmrdei@uno.localdomain>
 <Y017fLwL8zqzukl9@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y017fLwL8zqzukl9@valkosipuli.retiisi.eu>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Mon, Oct 17, 2022 at 06:57:48PM +0300, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Mon, Oct 17, 2022 at 05:10:03PM +0200, Jacopo Mondi wrote:
> > > which is also named analog_gain_code_global, but is documented
> > > differently.
> > >
> > > Could you btw read registers 0x0000 to 0x00ff and provide the data ?
> >
> > There is nothing interesting there if not default values. I was hoping
> > that analogue_gain_m0 analogue_gain_c0 and analogue_gain_m1
> > analogue_gain_c1 would provide a way to inject gains using the
> > standard CCS gain model, but those registers are said to be read-only
>
> The m[01] and c[01] factors in the CCS analogue gain formula are constants
> that determine how the sensor's analogue gain setting translates to actual
> analogue gain. They are not intended to be modifiable at runtime.
>

You're right sorry, indeed they're constant.

For this sensor:
analogue_gain_type: 0
analogue_gain_m0: 1
analogue_gain_c0: 0
analogue_gain_m1: 0
analogue_gain_c1: 4

I should be capable of programming the global analog gain using the linear
CCS gain model if the sensor is actually CCS compliant.

        gain = m0 * x + c0 / m1 * x + c1
             = R0x0204 / 4

However, the application developer guide shows the gain to be set
through manufacturer specific registers (0x3028 or 0x305e) and I cannot
find much correlations between the manufacturer specific gain model
(a piecewise exponential function) and the model described by CCS, which
seems way simpler.

> --
> Kind regards,
>
> Sakari Ailus
