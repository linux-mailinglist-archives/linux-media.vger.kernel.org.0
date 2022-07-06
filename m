Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E865B568F52
	for <lists+linux-media@lfdr.de>; Wed,  6 Jul 2022 18:39:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233470AbiGFQjX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jul 2022 12:39:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229780AbiGFQjW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jul 2022 12:39:22 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93A5A193E2
        for <linux-media@vger.kernel.org>; Wed,  6 Jul 2022 09:39:21 -0700 (PDT)
Received: from jyty (dsl-hkibng31-58c389-173.dhcp.inet.fi [88.195.137.173])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: msmakela)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id EAE361B000E0;
        Wed,  6 Jul 2022 19:39:18 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1657125559;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OJKu3T93I7FN1qmY9C9o9ITEDknM/aIzkcz5D6Fo2yE=;
        b=vDJGlB1GnFEIXIdsx7XLATV9ADKWjCsOayVsPlSWC096g/RkNamw8dRxFcqIN8pggaYDx3
        +kShKhH1COXc6BJKuEf6PUYWFuxltwK4YgquzQG/AXJlGNwqLEHCX561y7N4wBeU8J1uGL
        olJZ4DQXLyzLYnEJb7uZyLAD657PhZj0zaXC4Y/KBiBHWZcPIqAxegxWSr3gSwc2v42aRw
        +KwgBMaeFqjXq63TaJreDaFfKiopPh+aheeelbTpDy3Er+IrxkmCmghDj1E5BZ7cOIGxAf
        xkC/FuVOOA0rlSJSbA+tq/24e1dDWYchD/K6y5unj1Uvh2BDiksXLJlJvi4afQ==
Date:   Wed, 6 Jul 2022 19:39:17 +0300
From:   Marko =?iso-8859-1?B?TeRrZWzk?= <marko.makela@iki.fi>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH] media: rc: Always report LIRC repeat flag
Message-ID: <YsW6tegch5+yNOub@jyty>
References: <20220705085358.44418-1-marko.makela@iki.fi>
 <YsR4W3B6JErTCDrS@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YsR4W3B6JErTCDrS@gofer.mess.org>
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1657125559; a=rsa-sha256;
        cv=none;
        b=vVGpf+b+79tKclWoH05mYHfwqlOGN94+fdFo4Md0fjCGRWLX5TaskKtf1rpNeKvebQdhL6
        X8Fs3Eb2zqx8aO3tqW4YMwkm3xVQEj0mhCI7BBl226kHNtmrMhBHtK6ij2NFtTg+5/Z4Pp
        gueTTr5CGd1urgdfnOP4f5Liqq6fBxgE4vTK2QCG4WNDJ/ccDEesg88cfHOa5DAm6KDq28
        trADkoQrNDgutDp8jQHIeG4zJ9F+CIf1llK5FSdi9dANgqTGKH//KDSS9uzfLitTniNBhC
        AgWzRagxW4O3gHvIGStZ7pfz4QDtOhwocmcZbkaLGae0vw/SqxbZfZceTvwR7A==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=msmakela smtp.mailfrom=marko.makela@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1657125559;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OJKu3T93I7FN1qmY9C9o9ITEDknM/aIzkcz5D6Fo2yE=;
        b=lMCWUstdTepl9HliO7bm0fs8E4yQCKvtMdsgvbSLfyDC4ji8t67R2Gkxw6nhVwxLyADWUc
        p6hqX67lrr5ilK7xdcn2QdZsY13meVDRtNxUb1Oipo2S/k/wdN3h2iHFeiYWTnpx4Oj0ib
        01BSYC7sg5sR7p4ChXNSJ7/G7xN+6zLv4cvaaotZ8hCfIPVE92dQY/FNgiZMpBbzWz2F6o
        nN8zsM/YgNYKqB1zsduMYsnFTuXqI9uZCWPKUt14G78Os0xCaQtvn2VpTz1WD0EYv12BGJ
        0mjW/+lEVp8Jv7NN8k8g+7HDXvELJtldHKThc34mSul9PDZuoUKE4vSHya5f2w==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sean,

Tue, Jul 05, 2022 at 06:43:55PM +0100, Sean Young wrote:
>On Tue, Jul 05, 2022 at 11:53:58AM +0300, Marko Mäkelä wrote:
>> The flag LIRC_SCANCODE_FLAG_REPEAT was never set by rc_keydown().
>> Previously it was only set by rc_repeat(), but not all protocol
>> decoders invoke that function.
>
>This should say _why_ you are making this change, not _what_ the change
>is.

How would you find the following?

---
media: lirc: ensure lirc device receives repeats

Commit de142c32410649e64d44928505ffad2176a96a9e ("media: lirc: implement
reading scancode") would never set the LIRC_SCANCODE_FLAG_REPEAT flag in 
the LIRC messages.

Commit b66218fddfd29f315a103db811152ab0c95fb054
("media: lirc: ensure lirc device receives nec repeats") fixed it up for
those protocol drivers that may call rc_repeat().
---

Would you prefer to be mentioned as a co-developer?

Best regards,

	Marko
