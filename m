Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14C62302AFA
	for <lists+linux-media@lfdr.de>; Mon, 25 Jan 2021 20:00:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731399AbhAYS6l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Jan 2021 13:58:41 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:58855 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731421AbhAYS6U (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jan 2021 13:58:20 -0500
X-Originating-IP: 82.255.60.242
Received: from [192.168.1.150] (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id DB2E740007;
        Mon, 25 Jan 2021 18:57:32 +0000 (UTC)
Message-ID: <c1be9e71341b574642c43d32583ad664e61a8ab6.camel@hadess.net>
Subject: Re: [PATCH 1/2] keytable: Add Dell RC 260 keymap
From:   Bastien Nocera <hadess@hadess.net>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org
Date:   Mon, 25 Jan 2021 19:57:31 +0100
In-Reply-To: <20210125180222.GA16232@gofer.mess.org>
References: <20210125173531.644122-1-hadess@hadess.net>
         <20210125180222.GA16232@gofer.mess.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2 (3.38.2-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Sean,

On Mon, 2021-01-25 at 18:02 +0000, Sean Young wrote:
> Hi Bastien,
> 
> On Mon, Jan 25, 2021 at 06:35:30PM +0100, Bastien Nocera wrote:
> > Apparently used in the Dell Inspiron Zino HD 410 desktop:
> > http://web.archive.org/web/20180805000711/http://www.dell.com/ba/p/desktops/inspiron-zino-hd-410/pd
> > 
> > Manual linked in the remote definition itself.
> > 
> > Signed-off-by: Bastien Nocera <hadess@hadess.net>
> > ---
> >  utils/keytable/rc_keymaps/dell_rc260.toml | 49
> > +++++++++++++++++++++++
> 
> These files are generated from the keymaps in the kernel tree. Those
> can
> be found in drivers/media/rc/keymaps/rc-*.c.
> 
> A patch to create the keymap in the kernel tree would be better. This
> is
> also true for your other patch for the Xbox 360 rc keymap.
> 
> The script which generates the toml file is in
> utils/keytable/gen_keytables.pl
> in the v4l-utils repo.
> 
> Some keymaps are v4l-utils only; this is true for keymaps which can't
> be
> loaded from the kernel (ones that use BPF decoders).

Looks like that's the second time I make the mistake in 2 years. I
can't tell you how annoying that is. I sent patches to mark those files
as auto-generated, and I would really appreciate if you could
reconsider having those files' header marked as autogenerated.

Maybe explain that files in /usr/... are generated, and that if the
user wants to modify them that they should copy them to /etc/...

> >  1 file changed, 49 insertions(+)
> >  create mode 100644 utils/keytable/rc_keymaps/dell_rc260.toml
> > 
> > diff --git a/utils/keytable/rc_keymaps/dell_rc260.toml
> > b/utils/keytable/rc_keymaps/dell_rc260.toml
> > new file mode 100644
> > index 00000000..603d3a18
> > --- /dev/null
> > +++ b/utils/keytable/rc_keymaps/dell_rc260.toml
> > @@ -0,0 +1,49 @@
> > +[[protocols]]
> > +name = "dell_rc260"
> > +protocol = "rc6"
> > +variant = "rc6_mce"
> 
> The variant is rc-6-6a-32a for these scancodes.

OK, noted.

Cheers

