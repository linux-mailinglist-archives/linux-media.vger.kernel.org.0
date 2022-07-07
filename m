Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4216456A0E9
	for <lists+linux-media@lfdr.de>; Thu,  7 Jul 2022 13:10:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235217AbiGGLJ5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jul 2022 07:09:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234746AbiGGLJ5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jul 2022 07:09:57 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71E1932EDF
        for <linux-media@vger.kernel.org>; Thu,  7 Jul 2022 04:09:54 -0700 (PDT)
Received: from jyty (dsl-hkibng31-58c389-173.dhcp.inet.fi [88.195.137.173])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: msmakela)
        by meesny.iki.fi (Postfix) with ESMTPSA id 9B0EE200A4;
        Thu,  7 Jul 2022 14:09:50 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1657192190;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xF6Dw4nPaf2kJ49VMp44mRVl/8p5lLCAenxMST215hE=;
        b=BJY7jIKQFjzwX3fxrL7Bu4A4xZa9Yp6AxpVwv7jDFRCuKaXh3bgR/KnMII9shN/CVW0V41
        VZOBxxdRrVqyRV/TXmLlyC5ap7b4nHHfxs7dntDhUpv8ysDeoP99hMmAXWb+Y+Tk53m3th
        RMyV64Go24/ZNnj2vcI0dwVQ16ntXS0=
Date:   Thu, 7 Jul 2022 14:09:49 +0300
From:   Marko =?iso-8859-1?B?TeRrZWzk?= <marko.makela@iki.fi>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH] media: rc: Always report LIRC repeat flag
Message-ID: <Ysa+/QLY8AYrDr6m@jyty>
References: <20220705085358.44418-1-marko.makela@iki.fi>
 <YsR4W3B6JErTCDrS@gofer.mess.org>
 <YsW6tegch5+yNOub@jyty>
 <Ysaf5haqAeLl+on+@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Ysaf5haqAeLl+on+@gofer.mess.org>
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1657192190;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xF6Dw4nPaf2kJ49VMp44mRVl/8p5lLCAenxMST215hE=;
        b=lfsDjccYH2D5Nuu8gvsGRZAjuZLei1mAlHTEBZt5EWzsGvEde4CUY2O2j7zDUthB+GS7Lt
        zVG3/KBiwtbTPNIl1VL3QMhBf9/q7PebNXk1PPII6FPi1h+Ze6rnrmCvygadZ33Y9xwWBu
        QCwpwvYt/vvOU67IfRukgYWYoWFnCyg=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=msmakela smtp.mailfrom=marko.makela@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1657192190; a=rsa-sha256; cv=none;
        b=iQvg9F7MUZ6KTaA8FCkPXmK2SeSXpsbVfXHi99g+LRj3UtG3GFiIdwFh1FIrRUs1KrGddw
        P8P+MEXlOPSGZQH+OWHBDZAV61PYHjn1YrcxK2eQK+m31ymg6ZTncbqif6GphVG1hg6Igw
        NF1KjdgICGyN+qxWKPL/TzTrf/2U3Rk=
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

Thu, Jul 07, 2022 at 09:57:10AM +0100, Sean Young wrote:
>Hi Marko,
>
>On Wed, Jul 06, 2022 at 07:39:17PM +0300, Marko Mäkelä wrote:
>> Tue, Jul 05, 2022 at 06:43:55PM +0100, Sean Young wrote:
>> > On Tue, Jul 05, 2022 at 11:53:58AM +0300, Marko Mäkelä wrote:
>> > > The flag LIRC_SCANCODE_FLAG_REPEAT was never set by rc_keydown().
>> > > Previously it was only set by rc_repeat(), but not all protocol
>> > > decoders invoke that function.
>> >
>> > This should say _why_ you are making this change, not _what_ the change
>> > is.
>>
>> How would you find the following?
>>
>> ---
>> media: lirc: ensure lirc device receives repeats
>>
>> Commit de142c32410649e64d44928505ffad2176a96a9e ("media: lirc: implement
>> reading scancode") would never set the LIRC_SCANCODE_FLAG_REPEAT flag in the
>> LIRC messages.
>>
>> Commit b66218fddfd29f315a103db811152ab0c95fb054
>> ("media: lirc: ensure lirc device receives nec repeats") fixed it up for
>> those protocol drivers that may call rc_repeat().
>> ---
>
>That's no good. See:
>
>https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes
>
>The heading is called "Describe your changes".

I see. A quick read of "git log --oneline drivers/media/rc" suggests 
that the first line of the commit message is expected to be a summary 
_what_ the change is, not _why_ it was made. Would the commit message be 
acceptable after adding a "why" part right after the heading line, like 
this? If not, I would appreciate specific suggestions.

---
media: lirc: ensure lirc device receives repeats

For remote controls using RC5 and similar protocols that include a
"toggle" flag, the LIRC device never set the "repeat" flag to distinguish
repeated messages that were sent several times per second due to a
long keypress, and messages sent due to repeated short keypresses.

While a user-space program may implement logic around the "toggle" flag
to distinguish long keypresses, it would be simpler to be able to rely 
on the "repeat" flag for any type of protocol.

Commit de142c32410649e64d44928505ffad2176a96a9e ("media: lirc: implement
reading scancode") would never set the LIRC_SCANCODE_FLAG_REPEAT flag in
the LIRC messages.

Commit b66218fddfd29f315a103db811152ab0c95fb054
("media: lirc: ensure lirc device receives nec repeats") fixed it up for
those protocol drivers that may call rc_repeat().
---

Best regards,

	Marko
