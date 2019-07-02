Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA8CC5CCA9
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2019 11:29:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727094AbfGBJ3i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jul 2019 05:29:38 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:52363 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725851AbfGBJ3i (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Jul 2019 05:29:38 -0400
X-Originating-IP: 83.155.44.161
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 054BE240004;
        Tue,  2 Jul 2019 09:29:34 +0000 (UTC)
Message-ID: <33e32e1375f863daf6ea6d31c982e193de231b09.camel@hadess.net>
Subject: Re: [PATCH 2/2] keytable: Remove comments before processing keymaps
From:   Bastien Nocera <hadess@hadess.net>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org
Date:   Tue, 02 Jul 2019 11:29:33 +0200
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
> 
> case. Or // comments.

Those weren't problems I was aware of, or that I was trying to solve...

The presence of a "0x800ff40b = KEY_ENTER" won't stop the remote
definition from loading, or the remote to work correctly, and //
comments usually don't get merged into the kernel sources.

> >  			if (m/(0x[\dA-Fa-
> > f]+)[\s\,]+(KEY|BTN)(\_[^\s\,\}]+)/) {
> >  				$out .= "$1 = \"$2$3\"\n";
> >  				next;
> > -- 
> > 2.21.0

