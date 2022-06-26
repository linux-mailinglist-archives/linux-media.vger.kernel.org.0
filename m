Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9900055B1E7
	for <lists+linux-media@lfdr.de>; Sun, 26 Jun 2022 14:34:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234132AbiFZMdy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Jun 2022 08:33:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230287AbiFZMdw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Jun 2022 08:33:52 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C6AFBE18
        for <linux-media@vger.kernel.org>; Sun, 26 Jun 2022 05:33:51 -0700 (PDT)
Received: from jyty (dsl-hkibng31-58c389-173.dhcp.inet.fi [88.195.137.173])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: msmakela)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 530C21B002E4;
        Sun, 26 Jun 2022 15:33:48 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1656246828;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=PDBtYfPDqfrfpEI3JnnzL7gTKig68fdctBVnyno5+s4=;
        b=kenf1rQjinsSsqj/LFkHWwpHfli/31pppXIg5/j4R80hbmwZtCUZmAPzuslbdv80emNkO7
        wKpIlYIPQ+rUejMzlWef25Av0hryHdVZHWEYfffoI1U1TG25xmwTJ0RiwYq9XH0m20RYf9
        On7JyzkLCzWC5x8Q0TGBPlqytpkcD+z3PyaQObHzKJUnjO5dZKhxGWSV2P4OD1PzjtgyLW
        IyvSFG/4tLGDx2qQorsAU/aJF1DuXaTcXWzgHsl2lRibqWS7E+5Mem8L3r7exGNEbrWlzJ
        vWlNGf9Fxfq1AUZs9Z1hnGN6NVTvoOuYbSlB8hiu2PRkzIbN66SbeebKCalUMg==
Date:   Sun, 26 Jun 2022 15:33:47 +0300
From:   Marko =?iso-8859-1?B?TeRrZWzk?= <marko.makela@iki.fi>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] media: rtl28xxu: improve IR receiver
Message-ID: <YrhSK5l0uQZT76Fi@jyty>
References: <cover.1644683294.git.sean@mess.org>
 <704b3d7e5a7a95cbd5e4dfc25a41454e919aed95.1644683294.git.sean@mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <704b3d7e5a7a95cbd5e4dfc25a41454e919aed95.1644683294.git.sean@mess.org>
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1656246828; a=rsa-sha256;
        cv=none;
        b=em3ja7B5NVq/4JUn3FaLEU+5abuUafk/AcXxIZSJXsX3hlvSs1OMJC65cC/omAH5Rs8QRX
        KlkFugQUNZHPY0iaHrewLz5Cp+O03b1xlbJPAguc9meikUl0ud6qw4iZkuZLtAYjnLXBVt
        Ch6lIsoTm53yhS+/VV+npLhJXnVvkC2ldEKJttyFP4B0vB0vZ4NRsXPBeWE2fOxoTkPweQ
        jrdzd/DE2yoSFw/qHd7BY5R7+chYQ7G4VJCv5pK0fGBcaNqd5GXUeT2gtGlRZXFR++t4Rv
        MGlFsotDOiiIyXayacwVIWukIOWByRZdugMNCRFglD0x0T8lSH3JbTOND0lczg==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=msmakela smtp.mailfrom=marko.makela@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1656246828;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=PDBtYfPDqfrfpEI3JnnzL7gTKig68fdctBVnyno5+s4=;
        b=OME6LU5V2kiorFZ1oVGpwOvYJHHCOv+6Jjkm2GVv7tOUQw2eC3/ZV01ZZN/0ZE/KaiJVAf
        Ll0fZlonV9OdzWWnPIUgRLCwFnlQerx4lKGpMzSAO1lskm/w91r1Td0LjoN5JMW8OU60Xy
        Ypp3MjJ1f8nnmKqrjHg9mm+gszET2KJFM5RVRMnJrAnbMyJOZYdh3BtF8cr6kOU0UOo8eG
        Tb3Y1GYT8umnt82pqS0vplx0Ha/v0EXq2UtANiyG/F7gAQvNsM3VAUiWYmN9PQtsu5DX0x
        TLhR7OAg3ZZyYZt12Kf1G/i8AsKRLpg5cuFrCI0Q/w4tzBkXLPeMqd2DhmwQPg==
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

I finally took the time to get a deeper understanding of the infrared 
remote control subsystem. I think that I now understand the translation 
into key-down, key-up, and key-repeat events. For the RC5 protocol, 
rc_repeat() will not be called by ir-rc5-decoder.c but instead, 
ir_do_keydown() will handle the repeat. For lirc_scancode_event() it 
will never set the LIRC_SCANCODE_FLAG_REPEAT bit, even if !new_event and 
the protocol does support the toggle bit. That might qualify as a bug.

Sat, Feb 12, 2022 at 04:32:19PM +0000, Sean Young wrote:
>This device presents an IR buffer, which can be read and cleared.
>Clearing the buffer is racey with receiving IR, so wait until the IR
>message is finished before clearing it.
>
>This should minimize the chance of the buffer clear happening while
>IR is being received, although we cannot avoid this completely.

I just realized that this limitation of the interface may be causing 
exactly what I was observing when I was testing this. If a constant 
stream of data is being received because a button is being held down, a 
buffer overflow or wrap-around glitch is inevitable, maybe expect if the 
wrap-around occurs exactly at the 128-byte boundary.

How about the following improvement? If IR_RX_BC is a simple cursor to 
the 128-byte IR_RX_BUF, then rtl2832u_rc_query() could avoid sending 
refresh_tab[] but simply remember where the previous call left off. We 
could always read the 128 bytes at IR_RX_BUF, and process everything 
between the previous position reported by IR_RX_BC and the current 
position reported by IR_RX_BC, and treat buf[] as a ring buffer.

Last time I tested it, the patch was a significant improvement. I think 
that "perfect" is the enemy of "good enough", and the patch should be 
included in the kernel.

Best regards,

	Marko
