Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23177785385
	for <lists+linux-media@lfdr.de>; Wed, 23 Aug 2023 11:10:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231524AbjHWJKB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Aug 2023 05:10:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235320AbjHWJHy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Aug 2023 05:07:54 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF3E31BFD
        for <linux-media@vger.kernel.org>; Wed, 23 Aug 2023 02:02:05 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4RW0Zs6FYTz49Q1F;
        Wed, 23 Aug 2023 12:01:57 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1692781318;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=F7jlw4riZPUlAa59us81/mK6yShvHnfp7ZKT81EIM7A=;
        b=c0ndixK9hvgp42r4B2+gYV8hQtE6VXOtjTlUzJLieSu8gGBV7pYNVTm7Uj/vKJFvamws2T
        ueBAhnizbD4o0TipGIKdcd6ukkJCYjn1/256Jcm/ZIEqWIyIZDvG1P4KVilm5vVYmr6pGY
        kyj23XFjbBawncpl4Z93ugNGoOxeVzcS2caKlWNFh34GJ6r6bWrInIRppgnJyaxgH51Cnw
        iegsLMrq36BAmgk1Xwo397zkxrhwcUvhG5/qcmzZoCyh3qlNRmkxxStgIV4b7OLcX2Zk7S
        fQKzuglIo/28md3BfEJzRIrU87qZ0Pic+c50P3Na+woYCJjmchSn0hATDHFnBg==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1692781318; a=rsa-sha256;
        cv=none;
        b=LvHCdS99mVL/I5IXuoP2jYd3AGNBqcJ+WAUTdZfSPdv3jyKu1xEgNlavoQXdXqSmicsZch
        Y1DVCDZqWQl6aZseLHc14bBQDMVJ/9iD9pmf+PCersZlwG45uNBEkcNzei6Fu5ybKTxeUX
        qbCOlzAEGHkwcUxNNVwYvWv18VsuxZO+Ihzctr3vlDFSO01kRMEopjsH1jQzGrjwPrfuTm
        9ZYqyQFh2bw9eVxlsVm2pVNhDaSVAdMgW715ga+yYJJxqjFwD16fMrjlrg+vOG5mA71b0Q
        lZZ5dRZH4cVSRCpPXXPLN5REvx7sdQ6iY91WTQxZfEBLISjgvnKMsHT481ZXlA==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1692781318;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=F7jlw4riZPUlAa59us81/mK6yShvHnfp7ZKT81EIM7A=;
        b=Kvr6MCL/pNjWIhWqm64FniwmTo6wSK3TzuHE9aKBQkUm7VL40QttsD+k6NtWxOUwjCWjQP
        Uj2AXZea0fczP+5p+vgoaDWFV0B6W2pQjLTv9EuE5u7TFn7VGXVj7Ou70aUc8fToQ4HYYe
        ksSL9RNy6rVHMLu8RYn6jVZA+288ZOxvsKKBp4jVtAweOL4+7EmxqGlej1mLl2r8ApZPzY
        PQ2166IFgukGPvTXlGbiqoaoWAjvEhSuxqjUznBNbRxbowv78hdm9i/pHXwhFlxvuUbuu8
        yz1tGKNVjWU+A/XCEZsgX1SmrZRDIiVYkkk/OcMWMEd9XXbYtkpbRjhV94m2NA==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id F09E2634C93;
        Wed, 23 Aug 2023 12:01:56 +0300 (EEST)
Date:   Wed, 23 Aug 2023 09:01:56 +0000
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 14/18] media: i2c: imx219: Drop system suspend/resume
 operations
Message-ID: <ZOXLBAXVSZsyyNuN@valkosipuli.retiisi.eu>
References: <20230821223001.28480-1-laurent.pinchart@ideasonboard.com>
 <20230821223001.28480-15-laurent.pinchart@ideasonboard.com>
 <CAPY8ntBX5P5SOitehxN-AGb9OaGQkSaW-z4a2R+HZ7LiKDP_Tg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPY8ntBX5P5SOitehxN-AGb9OaGQkSaW-z4a2R+HZ7LiKDP_Tg@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave, Laurent,

On Tue, Aug 22, 2023 at 06:58:47PM +0100, Dave Stevenson wrote:
> Hi Laurent
> 
> On Mon, 21 Aug 2023 at 23:30, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > There is no need to stop streaming at system suspend time, or restart it
> > when the system is resumed, as the host-side driver is responsible for
> > stopping and restarting the pipeline in a controlled way by calling the
> > .s_stream() operation. Drop the system suspend and resume handlers, and
> > simplify the .s_stream() handler as a result.
> 
> I'll believe you, but the docs for power management in camera sensor
> drivers [1] state
> "Please see examples in e.g. drivers/media/i2c/ov8856.c and
> drivers/media/i2c/ccs/ccs-core.c. The two drivers work in both ACPI
> and DT based systems."
> 
> Looking at CCS we find the suspend hook stopping streaming [2], and
> resume hook starting it [3]. Same in ov8856 [4].
> 
> Could you reference the documentation that states that the host-side
> driver is responsible for starting and stopping? Is this an ACPI vs DT
> difference?

There's no difference between DT and ACPI, no.

Starting streaming on resume from system suspend is haphazard as there's no
guarantee on the timing of resuming devices (if the suspend and resume
independently), or similarly if the receiver driver explicitly starts
streaming, there's no guarantee the sub-device driver has resumed.

So I think we'd need more than what currently exists on the framework side
to do this reliably --- at least when it comes to CSI-2.

-- 
Regards,

Sakari Ailus
