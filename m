Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44DC245B730
	for <lists+linux-media@lfdr.de>; Wed, 24 Nov 2021 10:15:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234134AbhKXJSH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Nov 2021 04:18:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233741AbhKXJSH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Nov 2021 04:18:07 -0500
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE25EC061574;
        Wed, 24 Nov 2021 01:14:57 -0800 (PST)
Received: from hillosipuli.retiisi.eu (89-27-103-169.bb.dnainternet.fi [89.27.103.169])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 65E291B0008C;
        Wed, 24 Nov 2021 11:14:54 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1637745294;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=mCJ2Iig9MPwustrG6BwgnLsl2WHMERD8JcGdDVVf9Q0=;
        b=LivBiq/WO5JWG12GaET5i5J/ig8Aqg2ubdqigxGn58t7O9Ua3EN1j2IHqcvgmD+Q5uiF69
        hhYPj5Oozle1KEuIL2JaRyJ+SF0DaU2ACt4gQm8ckO2a1YzQRoe5nw95MxOR6Yzh26q9GQ
        3/XUiGX6G84ZEGHmqj53RUOWB65BaQG7RerAj1QLj9RelX2xkLmBRhAeDx2ju+W+0NNh4v
        poZ+GdAHxJa501Qm3tqKBZ+TN3v6Cwcl8M/B1/OL/8lvrSBULRf1zbWlPzQKxBW8/+Myhj
        iyJ9X6zzxmTo0wmk1chZFjqKHGd/ig/AtH1mV3EnUkhDSCrBAVNKcy6f5Rx1lQ==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id EC48D634C90;
        Wed, 24 Nov 2021 11:14:53 +0200 (EET)
Date:   Wed, 24 Nov 2021 11:14:53 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: media: renesas,jpu: Convert to
 json-schema
Message-ID: <YZ4CjUcWdRt3Dmb0@valkosipuli.retiisi.eu>
References: <4f8526dafcd3a88631ef2bc8bd2bb4652368d3cb.1626261172.git.geert+renesas@glider.be>
 <CAMuHMdX3M1ZUBF+fs3LHrx8fdWqJ0Mv9XC3Yb9mTkXRmhctTvQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdX3M1ZUBF+fs3LHrx8fdWqJ0Mv9XC3Yb9mTkXRmhctTvQ@mail.gmail.com>
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1637745294; a=rsa-sha256;
        cv=none;
        b=I+1jQ0iJGwQWSoKapTpHMf815r38t7Te5sMS5ykMO2JWkGwXZ4m1Fga+4EMqBXxkthnjhW
        mMyE0TTQJng9XWecnh4zpF42w4ws6JHv4mQiiF7TDRsZh/Gwndi6lXKqbnBKH07yHz+Rfr
        PCEyqCRJNhzP8G7j7OmvahdYeTifpok34gpt+S8QO6kLzBfX9sF3Qe+WJlzPFbNJyLS1o1
        OoxCF0w4YehZaX0Y4HX+gvNUCuEwfb9V2jtjd424OoJBMgrDBLO+7gPM8FyWRuQygxjQRc
        YKgnbdQt3ardjZDcS65YCI2ThhUayIUAjBGUJh/nIuDa7wpfxuFf/PiGbT/M+g==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1637745294;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=mCJ2Iig9MPwustrG6BwgnLsl2WHMERD8JcGdDVVf9Q0=;
        b=FR8kn80cHBOrhyvs60LyO2gbBKoKQGTorlLdpKkvtjy5U2CWQtEfFHqtazIVh1aBGVR0mw
        /QCDHS2N+fInbQcWQoutf2Z9be588oGVqyaYW2MMQb0RsDDk90hfXgHLlt6H7MLNc9gaik
        iiQyffgcbtf1c54xHzRnwdhASKJAizCun6+3pwAf2yLZUQuZowECD1HjIs+sl4QV+yMig9
        ljoxDfur3d1OGqC15hk0L6RHIuA4ELhFdqUq7V93alVLilHESMc3mKd652fN2RqKDEUyJ6
        spx1BkxxdjiDvZodTgEQ+wwD9bu5n9yZlVIrmEfQYVpH7QxpURRRx0TbqR0XyA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Geert,

On Wed, Nov 24, 2021 at 10:06:38AM +0100, Geert Uytterhoeven wrote:
> Hi Mauro, Sakari,
> 
> On Wed, Jul 14, 2021 at 1:17 PM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > Convert the Renesas JPEG Processing Unit Device Tree binding
> > documentation to json-schema.
> >
> > Document missing properties.
> > Update the example to match reality.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Reviewed-by: Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > ---
> > v2:
> >   - Add Reviewed-by.
> 
> Why was the status of this patch changed from "Reviewed" to "Not
> Applicable" in the linux-media patchwork?
> https://patchwork.linuxtv.org/project/linux-media/patch/4f8526dafcd3a88631ef2bc8bd2bb4652368d3cb.1626261172.git.geert+renesas@glider.be/
> 
> Who's gonna take it?

It seems to be assigned to me in Patchwork but I don't remember it. Hmm.

I can take it.

-- 
Kind regards,

Sakari Ailus
