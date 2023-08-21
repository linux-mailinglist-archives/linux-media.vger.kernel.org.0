Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7B877832F1
	for <lists+linux-media@lfdr.de>; Mon, 21 Aug 2023 22:22:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230434AbjHUUUd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Aug 2023 16:20:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230426AbjHUUUd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Aug 2023 16:20:33 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68BF7101
        for <linux-media@vger.kernel.org>; Mon, 21 Aug 2023 13:20:31 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 5A39F1000CD; Mon, 21 Aug 2023 21:20:28 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
        t=1692649228; bh=7Rw8KA2HJ/Fjx9zkHDCk8VKpFdw3cl9y8Ms628sRJ1o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SeLaQLnwydeBYgNf8TnEMok+/ehy/AkdIwJmBfRuLNu/PEfXbEsHXRthqnQ3BzTR1
         0l3RSq+rzuekcxn2+pT6XsJt/CJWFtG9fft+1q1T+VI79N+J6s0QseORaNjYtjck69
         SdIQTqb68qI40/qOLty7G1UOMLgTOsGNN3yCFYcjoaetLgBxdczLJepu7TGzzS6stQ
         Z5Zkdzg/kJ9qSsKm5BFE0bhV2VGi/F4YtpKx541SzWHHclp3R67wTZuP4kALG8ZrWG
         FtS6AmpY1na1VuZBzPKBLj0nUuruisPd68tKb0IGrfDMeJpC3in1zTfEbB6Rx+P1G6
         Ih3rE7t2oB0Lw==
Date:   Mon, 21 Aug 2023 21:20:28 +0100
From:   Sean Young <sean@mess.org>
To:     Rob Herring <robh@kernel.org>
Cc:     linux-media@vger.kernel.org, Sicelo <absicsz@gmail.com>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        Timo Kokkonen <timo.t.kokkonen@iki.fi>,
        Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 1/2] media: dt-bindings: nokia,n900-ir use generic
 pwm-ir-tx driver
Message-ID: <ZOPHDCXG02y09QFg@gofer.mess.org>
References: <20230821152623.196541-1-sean@mess.org>
 <20230821152623.196541-2-sean@mess.org>
 <CAL_Jsq+BLdhKZnTZwRN5b3XdkgSHDj53Z1YJfcYxWxTDqzkRRQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_Jsq+BLdhKZnTZwRN5b3XdkgSHDj53Z1YJfcYxWxTDqzkRRQ@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 21, 2023 at 01:56:56PM -0500, Rob Herring wrote:
> Please use get_maintainers.pl and send patches to the right place.
> Like the other DT maintainers and DT list...

Noted, my bad.

> On Mon, Aug 21, 2023 at 10:26 AM Sean Young <sean@mess.org> wrote:
> >
> > The generic pwm-ir-tx driver works for the Nokia n900, so nokia,n900-ir
> > can be removed.
> 
> How long has this been true? You are breaking users if they are on a
> version of OS where the pwm-ir-tx driver doesn't work (or didn't exist
> or wasn't enabled). I suspect this is a platform that will care about
> the ABI.
> 
> What you should do is make the "nokia,n900-ir" compatible work with
> the generic driver. Then old driver works still, the generic driver
> works on new OS versions, and the DTB doesn't change.

That makes a lot of sense. I'll re-roll.

Thanks for the feedback.

Sean
