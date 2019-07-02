Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6D165CCD4
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2019 11:43:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726283AbfGBJnn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jul 2019 05:43:43 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:52959 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726011AbfGBJnn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Jul 2019 05:43:43 -0400
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 4A49024000A;
        Tue,  2 Jul 2019 09:43:40 +0000 (UTC)
Message-ID: <581e3110f91d8ef95945e90ab2ee3574dab7ab1c.camel@hadess.net>
Subject: Re: [PATCH 2/2] keytable: Remove comments before processing keymaps
From:   Bastien Nocera <hadess@hadess.net>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org
Date:   Tue, 02 Jul 2019 11:43:39 +0200
In-Reply-To: <20190702090804.lhxll6g7l6bdlmll@gofer.mess.org>
References: <20190701163813.25032-1-hadess@hadess.net>
         <20190701163813.25032-2-hadess@hadess.net>
         <20190702090804.lhxll6g7l6bdlmll@gofer.mess.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.3 (3.32.3-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2019-07-02 at 10:08 +0100, Sean Young wrote:
> On Mon, Jul 01, 2019 at 06:38:13PM +0200, Bastien Nocera wrote:
> > Do our best to remove comments from each line we process from the
> > keymap
> > sources, so as to avoid commented duplicates and false positives
> > sneaking in to the keymap definitions.
> > 
> > Signed-off-by: Bastien Nocera <hadess@hadess.net>
> > ---
> >  utils/keytable/gen_keytables.pl | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/utils/keytable/gen_keytables.pl
> > b/utils/keytable/gen_keytables.pl
> > index 3dc74ba6..d73daf58 100755
> > --- a/utils/keytable/gen_keytables.pl
> > +++ b/utils/keytable/gen_keytables.pl
> > @@ -138,6 +138,9 @@ sub parse_file($$)
> >  		}
> >  
> >  		if ($read) {
> > +			# Remove comments
> > +			~ s#/\*.*?\*/##sg;
> > +			~ s#.*\*/##sg;
> 
> This doesn't solve the
> 
> 	/* { 0x800ff40b, KEY_ENTER },
> 	   not used */

This isn't in the current Linus kernel.

> case. Or // comments.

And this isn't used anywhere in the kernel either.

Those are the 2 lines that would remove those comments but I can't test
it. Note that if this was done properly, instead of fixing the bugs we
encounter, the whole parsing would need to be redone.

+                       ~ s#/\*.*?##sg;
+                       ~ s#//.*##sg;

> >  			if (m/(0x[\dA-Fa-
> > f]+)[\s\,]+(KEY|BTN)(\_[^\s\,\}]+)/) {
> >  				$out .= "$1 = \"$2$3\"\n";
> >  				next;
> > -- 
> > 2.21.0

