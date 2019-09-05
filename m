Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7D26AA075
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 12:50:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733293AbfIEKue (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 06:50:34 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:35580 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731476AbfIEKud (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Sep 2019 06:50:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=Nf/a77KEmjaFsuAPj3FAUym6ojWYmBF/YMuIBQgblrE=; b=WcvE/VB7dxohDehAFdQG3Hqfj
        uiUdUZA9DRE3ujMDC3Z5krLdKvHxg/I3Ws3koV7ln2znwhJWL5++KuBywUUclVrDMZ1XXVVEtACWi
        G0n75tbkEfcUWKkpKm2dCkdau1YSITr/n153fsef0nOUgMyiF9X+Ck2RSYSiWtlgcGm/BscB4UGCB
        IMx8x5OS6JZBdnN3TQMBnHCvyZM5mJI9OgErJCNxz2TFqm+Q/orVALoNaRAD4oI2+brDSNJuKHw4E
        XRmznLwdo+zUW2QrSR9/K5pqKe60SA5jK3gUL1PZ+zgeC11EYHZMJBMK+H4F/9Tmp21BQBPpo9qBP
        beoLnuDqg==;
Received: from 177.17.137.173.dynamic.adsl.gvt.net.br ([177.17.137.173] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1i5pLU-0006Y8-VQ; Thu, 05 Sep 2019 10:50:33 +0000
Date:   Thu, 5 Sep 2019 07:50:28 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>, Jessica Yu <jeyu@kernel.org>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        Thomas Gleixner <tglx@linutronix.de>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: license-rules.txt: cover SPDX headers on Python
 scripts
Message-ID: <20190905075028.643f4b9d@coco.lan>
In-Reply-To: <20190905092703.GA30899@kroah.com>
References: <20190905055614.7958918b@coco.lan>
        <88e638eb959095ab6657d295f9f8c27169569bf2.1567675272.git.mchehab+samsung@kernel.org>
        <20190905092703.GA30899@kroah.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 5 Sep 2019 11:27:03 +0200
Greg Kroah-Hartman <gregkh@linuxfoundation.org> escreveu:

> On Thu, Sep 05, 2019 at 06:23:13AM -0300, Mauro Carvalho Chehab wrote:
> > The author of the license-rules.rst file wanted to be very restrict
> > with regards to the location of the SPDX header. It says that
> > the SPDX header "shall be added at the first  possible line in
> > a file which can contain a comment". Not happy with this already
> > restrictive requiement, it goes further:
> > 
> > "For the majority  of files this is the first line, except for
> > scripts", opening an exception to have the SPDX header at the
> > second line, if the first line starts with "#!".
> > 
> > Well, it turns that this is too restrictive for Python scripts,
> > and may cause regressions if this would be enforced.
> > 
> > As mentioned on:
> > 	https://stackoverflow.com/questions/728891/correct-way-to-define-python-source-code-encoding
> > 
> > Python's PEP-263 [1] dictates that an script that needs to default to
> > UTF-8 encoding has to follow this rule:
> > 
> > 	'Python will default to ASCII as standard encoding if no other
> > 	 encoding hints are given.
> > 
> > 	 To define a source code encoding, a magic comment must be placed
> > 	 into the source files either as first or second line in the file'
> > 
> > And:
> > 	'More precisely, the first or second line must match the following
> > 	 regular expression:
> > 
> > 	 ^[ \t\f]*#.*?coding[:=][ \t]*([-_.a-zA-Z0-9]+)'
> > 
> > [1] https://www.python.org/dev/peps/pep-0263/
> > 
> > If a script has both "#!" and the charset encoding line, we can't place
> > a SPDX tag without either violating license-rules.rst or breaking the
> > script by making it crash with non-ASCII characters.
> > 
> > So, add a sort notice saying that, for Python scripts, the SPDX
> > header may be up to the third line, in order to cover the case
> > where both "#!" and "# .*coding.*UTF-8" lines are found.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> > ---
> >  Documentation/process/license-rules.rst | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/process/license-rules.rst b/Documentation/process/license-rules.rst
> > index 2ef44ada3f11..5d23e3498b1c 100644
> > --- a/Documentation/process/license-rules.rst
> > +++ b/Documentation/process/license-rules.rst
> > @@ -64,9 +64,12 @@ License identifier syntax
> >     possible line in a file which can contain a comment.  For the majority
> >     of files this is the first line, except for scripts which require the
> >     '#!PATH_TO_INTERPRETER' in the first line.  For those scripts the SPDX
> > -   identifier goes into the second line.
> > +   identifier goes into the second line\ [1]_.
> >  
> > -|
> > +.. [1] Please notice that Python scripts may also need an encoding rule
> > +   as defined on PEP-263, which should be defined either at the first
> > +   or the second line. So, for such scripts, the SPDX identifier may
> > +   go up to the third line.
> >  
> >  2. Style:
> >    
> 
> If you are going to do this, can you also fix up scripts/spdxcheck.py to
> properly catch this,

Hmm... it defaults to analyze the first 15 lines:

    ap.add_argument('-m', '--maxlines', type=int, default=15,
                    help='Maximum number of lines to scan in a file. Default 15')

So, I guess it won't require any changes.

> as well as fixing up the location of the spdx tag
> line in the file itself?

Good point. I'll write a patch fixing the SPDX location at the three
files where the coding location is at the wrong place.

> 
> thanks,
> 
> greg k-h



Thanks,
Mauro
