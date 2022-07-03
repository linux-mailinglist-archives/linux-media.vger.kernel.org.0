Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 110705648CE
	for <lists+linux-media@lfdr.de>; Sun,  3 Jul 2022 19:04:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232975AbiGCRDY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 3 Jul 2022 13:03:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232977AbiGCRDJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 3 Jul 2022 13:03:09 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5638B654E
        for <linux-media@vger.kernel.org>; Sun,  3 Jul 2022 10:02:27 -0700 (PDT)
Received: from jyty (dsl-hkibng31-58c389-173.dhcp.inet.fi [88.195.137.173])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: msmakela)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id D2B741B001CF;
        Sun,  3 Jul 2022 20:02:15 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1656867736;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=e3t/joq8Vfi5FgDsBNrIHX8i2MbDfBIXfe/wlU6Fdfg=;
        b=Pt1ilT4nLF391OKseJD1ocLqgM3Bl7MNaCQRqmiYMCOK/nFjJDhBAJMKmnyRD47GiheFek
        eqoi1RtyB7U1+6bJmqzQ2qI8vfU9CtGkKaFNoTYjPUqjiip6Z1Z8gjuyZkGKpP7Xx5+ufZ
        0Kb+s6rv9L4FeXdM2/pESSFbgCpMjHFHa7a7qvCtF1TmgQDlhdBib44Fb/UnpFpxhrs3yT
        /P2g4DSNi/v9cSnxMBLi4I3TipjNsJ7SgJLMQbZEGrB5kVZpfIOkaRhmOOypJROi/Qf4ZI
        6KsKr2RUUOARNL1Rj5OXOecmYCRYVVs505z8otJUQIbnWE9CdLTXjV7dMZJReQ==
Date:   Sun, 3 Jul 2022 20:02:14 +0300
From:   Marko =?iso-8859-1?B?TeRrZWzk?= <marko.makela@iki.fi>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] media: rtl28xxu: improve IR receiver
Message-ID: <YsHLlg9CccrEzOjL@jyty>
References: <cover.1644683294.git.sean@mess.org>
 <704b3d7e5a7a95cbd5e4dfc25a41454e919aed95.1644683294.git.sean@mess.org>
 <YrhSK5l0uQZT76Fi@jyty>
 <YrmMQNPHkDGZ843v@gofer.mess.org>
 <YrqfTnY4Azqt44e4@jyty>
 <Yr/+g/j20kb5kzki@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yr/+g/j20kb5kzki@gofer.mess.org>
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1656867736; a=rsa-sha256;
        cv=none;
        b=BAy1z/AiUpn9Dnu6Brdb/RSIzGl2qSwBVo6816mN2QtkIAjcku+ohUr4I7OEKO1NOsrkgn
        FjyDEiaAbmwf8/q46BPZicLHZByZc72/5/ikopUtgYfl6X+ICvAkrZWx70mTTAV2pCwrZb
        UrRACnKFYx4cmOd3bWbEiFx1deTkbhRRHqds+UwLZFUSSglvdsmevhFuNz1+voIE+nsAm+
        X6uw5OraR6LK42wXora4kDoLQXsYji8Uf7gGOVZRc5x9FWpoXmfyr7JEo19VNl3fiIW3Uj
        hUGDM6TYZLXonFTFoNTDg3nt+260ausuhCDlIjy+VVOhGfwBOe1sI8rKgvHdwA==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=msmakela smtp.mailfrom=marko.makela@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1656867736;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=e3t/joq8Vfi5FgDsBNrIHX8i2MbDfBIXfe/wlU6Fdfg=;
        b=lxVyS9KRxQStifh39/4PTdxh2eEuhNj8TZ4k5wnjNOxUZ+AJegUyWiXICFvdCfZ4l6xYND
        T4/ipolQk7IOtnECoX9vCTpFSwseF4g9/p9KMubrHnIm2W9vo1Y+rOVg/SHEXqnVAWFCZ9
        93RzVGU9EAH8nAUZY9LbKrOlgs33K0FK7lhwzWxHhoP2aoNHM5rnC3Sr6Uf5rgXCKr5gDV
        hroxUjV+SN55InTTAh2VoO9NMSKwhfCJJ97gXLoc2cgP8pKZDojC6Qk7PLubhUmeglxrPi
        AgEt4JQ5qMkNpAOzxijW7FmUT/oeBCpMYFa8GZcWZTU3nzMn8pUBlmg4CAmORw==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sat, Jul 02, 2022 at 09:14:59AM +0100, Sean Young wrote:
>Hi,
>
>On Tue, Jun 28, 2022 at 09:27:26AM +0300, Marko Mäkelä wrote:
>> Mon, Jun 27, 2022 at 11:53:52AM +0100, Sean Young wrote:
>> > Hi Marko,
>> >
>> > On Sun, Jun 26, 2022 at 03:33:47PM +0300, Marko Mäkelä wrote:
>> > > I finally took the time to get a deeper understanding of the infrared remote
>> > > control subsystem. I think that I now understand the translation into
>> > > key-down, key-up, and key-repeat events. For the RC5 protocol, rc_repeat()
>> > > will not be called by ir-rc5-decoder.c but instead, ir_do_keydown() will
>> > > handle the repeat. For lirc_scancode_event() it will never set the
>> > > LIRC_SCANCODE_FLAG_REPEAT bit, even if !new_event and the protocol does
>> > > support the toggle bit. That might qualify as a bug.
>> >
>> > You are right, this was missed. Patches welcome.
>>
>> Attached (for 5.19.0-rc3, on top of the two commits of this patch series).
>>
>> I thought that it would be the least amount of trouble to slightly change
>> the interpretation of the "toggle" parameter of
>> rc_keydown(). My intention was to use the values 1 and 2 when the toggle
>> flag is present. Any nonzero values would work.
>
>I don't understand why this is needed.

For protocols that do not use a toggle bit, the last parameter of 
rc_keydown() will usually be toggle=0, and explicit calls to rc_repeat() 
will be issued when needed. For those protocols, I thought that we would 
not want rc_keydown() to set any LIRC_SCANCODE_FLAG_REPEAT flag under 
any circumstances.

>A patch needs to be tested. Just rebuild the entire kernel and boot 
>from that.

Yes, I will do that for revising my patch.

>> -	rc_keydown(cec->ir, RC_PROTO_RC5, RC_SCANCODE_RC5(addr, key), toggle);
>> +	rc_keydown(cec->ir, RC_PROTO_RC5, RC_SCANCODE_RC5(addr, key),
>> +		   1 + toggle);
>
>You can't change the toggle value because you want a repeat flag. This makes
>no sense.
[snip]
>> --- a/drivers/media/rc/rc-main.c
>> +++ b/drivers/media/rc/rc-main.c
>> @@ -782,18 +782,19 @@ static void ir_do_keydown(struct rc_dev *dev, enum rc_proto protocol,
>>  {
>>  	bool new_event = (!dev->keypressed		 ||
>>  			  dev->last_protocol != protocol ||
>> -			  dev->last_scancode != scancode ||
>> -			  dev->last_toggle   != toggle);
>> +			  dev->last_scancode != scancode);
>> +	bool repeat_event = !new_event && toggle && dev->last_toggle == toggle;
>
>Why this change?
>
>>  	struct lirc_scancode sc = {
>>  		.scancode = scancode, .rc_proto = protocol,
>> -		.flags = toggle ? LIRC_SCANCODE_FLAG_TOGGLE : 0,
>> +		.flags = (toggle > 1 ? LIRC_SCANCODE_FLAG_TOGGLE : 0) |
>> +			 (repeat_event ? LIRC_SCANCODE_FLAG_REPEAT : 0),
>
>Why not simply (!new_event ? LIRC_SCANCODE_FLAG_REPEAT : 0) and be done with it?

Drivers that invoke rc_repeat() do not want rc_keydown() to ever set 
LIRC_SCANCODE_FLAG_REPEAT. The patch slightly changed the meaning of 
toggle: it *must* be 0 if and only if the protocol does not implement a 
toggle bit. If it does, the values must alternate between 1 and some 
greater-than-1 value.

A cleaner alternative could be to retain the interface of rc_keydown() 
as is, and add a new function, say, rc_keydown_or_repeat(), which would 
generate key-repeat events from the toggle bit.

Best regards,

	Marko
