Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DB3C2EAE86
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 16:33:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728069AbhAEPdZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 10:33:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726096AbhAEPdY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 10:33:24 -0500
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 175E1C061795
        for <linux-media@vger.kernel.org>; Tue,  5 Jan 2021 07:33:09 -0800 (PST)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id A727BC637E; Tue,  5 Jan 2021 15:33:07 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1609860787; bh=hlTmZa4wvfTqw7ql+M30HYX2nSFHhgGZESUZvgqU2T8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mdD10s+c6N80ewQ44fRruYNs2Idt8GgfnP0zeVwF2gZgHEIp4OzDTGvdXXhnZqueP
         wab/1EysCvUa0QtPGbx/S1pElDexw5J7N+kJbkNGDvwIrRFQI19EVk6y2aCHX7k9eU
         dsSrERcC4HQ/1N/A0iFc3EhyVdUmjA4oJpOv8dBGPtuzTCz9pYzwe2Y2aAi/c/SwPn
         nJfodXHrY8yKm6B7+UUP+alcOI8N4eUvegmIIYQp64xPltj6w1DWkW+vjBHBAxtHlC
         6CaEYhZVp8ZYN+Zl34POY22aGIWZ3H/5vawoZQblHTsWj3ZTVgnqui08ITehEGoeVY
         wjZdWOXKm08nA==
Date:   Tue, 5 Jan 2021 15:33:07 +0000
From:   Sean Young <sean@mess.org>
To:     Juan <observer1@hotmail.es>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: Help with harmony remote
Message-ID: <20210105153307.GA14872@gofer.mess.org>
References: <VI1P193MB0160CDD11C1487D57A4B795081C30@VI1P193MB0160.EURP193.PROD.OUTLOOK.COM>
 <20201218100710.GA29317@gofer.mess.org>
 <VI1P193MB016010B2B176FE481020913881C30@VI1P193MB0160.EURP193.PROD.OUTLOOK.COM>
 <20201219092703.GA14414@gofer.mess.org>
 <VI1P193MB0160CD42CE45DFEC2361043081C10@VI1P193MB0160.EURP193.PROD.OUTLOOK.COM>
 <20201221124009.GA29869@gofer.mess.org>
 <VI1P193MB01608CBDAF9EE16F6CA42CC681C00@VI1P193MB0160.EURP193.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <VI1P193MB01608CBDAF9EE16F6CA42CC681C00@VI1P193MB0160.EURP193.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Juan,

Sorry I lost track over christmas/new years.

On Mon, Dec 21, 2020 at 01:33:21PM -0600, Juan wrote:
> Hi
> I was using the web client hope this is better

Thanks much better.

> El Mon, 21 Dec 2020 12:40:09 +0000
> Sean Young <sean@mess.org> escribió:
> > Hi,
> > 
> > First of all, your email is unreadable. It is very to see what I wrote
> > and what you wrote. Please fix this.
> > 
> > On Sun, Dec 20, 2020 at 07:24:28PM +0000, Jesus wrote:
> > > Hi
> > > 
> > > ________________________________
> > > De: Sean Young <sean@mess.org>
> > > Enviado: sábado, 19 de diciembre de 2020 9:27
> > > Para: Jesus <observer1@hotmail.es>
> > > Cc: linux-media@vger.kernel.org <linux-media@vger.kernel.org>
> > > Asunto: Re: Help with harmony remote
> > > 
> > > Hi,
> > > 
> > > On Sat, Dec 19, 2020 at 01:56:50AM +0000, Jesus wrote:
> > > > It's a Universal Harmony 350
> > > >
> > > > This one:
> > > > https://support.myharmony.com/en-us/350
> > > > https://assets.logitech.com/assets/54199/gallery-1.png
> > > >
> > > > It's programable, the remote selected for the mouse is named
> > > > Media Center PC SE i believe is the mce, and for the other
> > > > functions of the pc part I use a remote named Intel Media Player
> > > > I believe is mce too but diferent set of keys selectable I've
> > > > managed to make work every button I use in the intel media player
> > > > remote, for the Media Center PC SE, I only use the mouse part
> > > > thats what I have tested, the mouse movement works, the left and
> > > > right click are the ones not working
> > > 
> > > That's interesting, I did not know there was any other device that
> > > generates this IR.
> > > 
> > > > Some recording of the ir using "ir-ctl -r" would be useful too.
> > > >
> > > > this is the output for the left click:
> > > >
> > > > +2800 -200 +300 -300 +300 -250 +300 -300 +600 -600 +300 -400 +200
> > > > -350 +300 -200 +350 -300 +300 -300 +600 -300 +300 -600 +300 -250
> > > > +400 -200 +400 -200 +400 -250 +350 -300 +300 -400 +200 -300 +300
> > > > -300 +300 -300 +300 -300 +300 -300 +300 -300 +350 -250 +350 -300
> > > > +600 -250 +350 -350 +250 -300 +300 -600 +350 -250 +350 -75800
> > > > +2800 -200 +350 -200 +400 -250 +350 -300 +650 -600 +300 -300 +300
> > > > -300 +300 -250 +300 -300 +300 -300 +600 -250 +400 -600 +350 -200
> > > > +350 -250 +350 -250 +350 -250 +350 -250 +400 -200 +350 -250 +350
> > > > -250 +350 -250 +350 -300 +300 -300 +300 -250 +350 -300 +300 -300
> > > > +600 -250 +350 -200 +400 -250 +350 -600 +300 -250 +400 -75800
> > > > +2800 -200 +350 -200 +400 -250 +300 -250 +700 -550 +350 -200 +350
> > > > -250 +350 -250 +350 -250 +300 -350 +550 -250 +400 -600 +300 -300
> > > > +250 -300 +300 -300 +300 -350 +300 -250 +400 -250 +350 -250 +350
> > > > -400 +200 -350 +300 -300 +300 -300 +300 -250 +350 -200 +400 -250
> > > > +650 -200 +400 -250 +350 -250 +350 -600 +300 -300 +300 # timeout
> > > > 101600
> > > 
> > > Actually, that is the right IR for a left mouse button.
> > > 
> > > > > 688888.335099: lirc protocol(mcir2-mse): scancode = 0x3c
> > > > > 688888.335117: event type EV_MSC(0x04): scancode = 0x3c
> > > > > 688888.335117: event type EV_SYN(0x00).
> > > > > 688888.475123: lirc protocol(mcir2-mse): scancode = 0x3c
> > > > > 688888.475142: event type EV_MSC(0x04): scancode = 0x3c
> > > > > 688888.475142: event type EV_SYN(0x00).
> > > 
> > > This is also the right scancode.
> > > 
> > > I think something else is going on. Please can you do the following:
> > > 
> > > echo 'file ir-mce_kbd-decoder.c +p' >
> > > /sys/kernel/debug/dynamic_debug/control
> > > 
> > > Now press the left mouse button and see what there is in dmesg.
> > > 
> > > I hope it says something like:
> > > 
> > >         rc rc0: mouse: x = 0, y = 0, btns = L
> > > 
> > > This is what found in dmesg:
> > > 
> > > 
> > > [754581.285199] rc rc0: started at state 4 (600us space)
> > > [754581.285202] rc rc0: started at state 3 (267us space)
> > > [754581.285208] rc rc0: started at state 4 (300us pulse)
> > > [754581.285211] rc rc0: started at state 3 (0us pulse)
> > > [754581.285221] rc rc0: started at state 3 (300us space)
> > > [754581.285225] rc rc0: started at state 4 (350us pulse)
> > > [754581.285229] rc rc0: started at state 5 (17us pulse)
> > > [754581.390933] rc rc0: started at state 5 (101600us space)
> > > [754581.390938] rc rc0: mouse data 0x00003c
> > > [754581.390941] rc rc0: mouse: x = 0, y = 0, btns = L
> > 
> > I'm guessing you wrote this last thing, it all has the same quotation
> > level.
> > 
> > So the mouse press is decoded; the issue is in the delivery.
> > 
> > > Please can you test the following patch.
> > > 
> > > I applied the patch and this is the output, it didn't worked:
> > > 
> > > 292.578486: lirc protocol(mcir2-mse): scancode = 0x3c
> > > 274.264540: event type EV_KEY(0x01) key_down: BTN_MOUSE(0x0110)
> > > 274.264540: event type EV_MSC(0x04): scancode = 0x3c
> > > 274.264540: event type EV_SYN(0x00).
> > > 292.676628: lirc protocol(mcir2-mse): scancode = 0x3c
> > > 292.676647: event type EV_MSC(0x04): scancode = 0x3c
> > > 292.676647: event type EV_SYN(0x00).
> > > 292.816663: lirc protocol(mcir2-mse): scancode = 0x3c
> > > 292.816687: event type EV_MSC(0x04): scancode = 0x3c
> > > 292.816687: event type EV_SYN(0x00).
> > > 293.080537: event type EV_KEY(0x01) key_down: BTN_MOUSE(0x0110)
> > > 293.080537: event type EV_SYN(0x00).
> > > 293.208540: event type EV_KEY(0x01) key_down: BTN_MOUSE(0x0110)
> > > 293.208540: event type EV_SYN(0x00).
> > > 293.336535: event type EV_KEY(0x01) key_down: BTN_MOUSE(0x0110)
> > > 293.336535: event type EV_SYN(0x00).
> > > 293.464540: event type EV_KEY(0x01) key_down: BTN_MOUSE(0x0110)
> > > 293.464540: event type EV_SYN(0x00).
> > 
> > This shows that the button press has been decoded, and sent to the
> > input layer. Possibly it is being ignored by libinput.
> 
> I think is getting to the ui, when i presss the button the real mouse
> moves but I can't click on other thing, I suppose is waiting for the
> mouse up
>
> > > It didn't change, I'm quite sure I applied the patch correctly, is
> > > there a way to know at runtime?
> > 
> > You can check uname -r, it should the exact commit if you commited
> > the patch.
> 
> I rebuild a srpm, this what uname  says
> 5.8.12-200.st.fc32.x86_64
> st is what i use to make them diferent
> 
> > 
> > So how are you loading the mce_keyboard.toml? It should be loaded by
> > putting an entry in /etc/rc_maps.cfg
> 
> I'm using this command to load:
> 
>  ir-keytable -c -p rc6_mce,mce_kbd -w
>  /etc/rc_keymaps/mce_keyboard-mouse.toml ; ir-keytable -v -t -p
>  rc-5,rc-5-sz,jvc,sony,nec,sanyo,mce_kbd,rc-6,sharp,xmp,mcir2-mse
> 
> The real mouse don't click until I load the original file:
> 
> ir-keytable -c -p rc6_mce -w /lib/udev/rc_keymaps/mce_keyboard.toml

You should really load the keymap by putting an entry in /etc/maps.cfg,
something like:

* 	* 	/etc/rc_keymaps/mce_keyboard-mouse.toml


(and remove the other entries)

Thanks

Sean
