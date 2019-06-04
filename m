Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48FD334340
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 11:33:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727075AbfFDJda (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 05:33:30 -0400
Received: from casper.infradead.org ([85.118.1.10]:34986 "EHLO
        casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726918AbfFDJda (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 05:33:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=6RMZolwoIkoJa4RmdsjIzV/h2+fkQW6j6eWWJglfjew=; b=DoYh/S0Z8FiZJ1vWxeMoXLn/pr
        vcUa6G2N9MpYdNKS67ijZ5U2B6K0efEzWYuRJsm7BvnKxcXIE6+FhSkNNtABx1Y062FFPz2vj7EhT
        xvOd1C7eal0TJoJ3X6m25zVN8QAyyC0LIwauuNrq5tUWy6dVCqaf1iK+gcQXieK/PZFVhhQbd0ro4
        bP2rajEqiTexfx3gnZIjd0qegDpPKK6XyCJoMtmHhDaIzQPktLKIR+EDQxKldXz/J20RsY2C+Tww1
        M1Yc7JcQD/iJXoittFgrfAKb/n05LvOgeIKoMdFO7rPLhUnFlkeGDRudLFOM884hv/u1etRjppn4e
        qDBE9cPA==;
Received: from [187.113.6.249] (helo=coco.lan)
        by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hY5op-0004Hq-VN; Tue, 04 Jun 2019 09:33:24 +0000
Date:   Tue, 4 Jun 2019 06:33:18 -0300
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     kbuild test robot <lkp@intel.com>, kbuild-all@01.org,
        linux-doc@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [lwn:docs-next 25/31] htmldocs: /bin/bash:
 ./scripts/sphinx-pre-install: No such file or directory
Message-ID: <20190604063318.34c7bde5@coco.lan>
In-Reply-To: <20190530153239.57f321c9@lwn.net>
References: <201905310424.Zhlxo3ky%lkp@intel.com>
        <20190530153239.57f321c9@lwn.net>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 30 May 2019 15:32:39 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> On Fri, 31 May 2019 04:19:29 +0800
> kbuild test robot <lkp@intel.com> wrote:
> 
> > tree:   git://git.lwn.net/linux-2.6 docs-next
> > head:   a700767a7682d9bd237e927253274859aee075e7
> > commit: 9b88ad5464af1bf7228991f1c46a9a13484790a4 [25/31] scripts/sphinx-pre-install: always check if version is compatible with build
> > reproduce: make htmldocs
> > 
> > If you fix the issue, kindly add following tag
> > Reported-by: kbuild test robot <lkp@intel.com>
> > 
> > All errors (new ones prefixed by >>):
> >   
> > >> /bin/bash: ./scripts/sphinx-pre-install: No such file or directory    
> 
> For this one, I'm guessing we need something like the following...disagree?
> 
> jon
> 
> --------
> diff --git a/Documentation/Makefile b/Documentation/Makefile
> index e889e7cb8511..c98188994322 100644
> --- a/Documentation/Makefile
> +++ b/Documentation/Makefile
> @@ -23,7 +23,7 @@ ifeq ($(HAVE_SPHINX),0)
>  .DEFAULT:
>  	$(warning The '$(SPHINXBUILD)' command was not found. Make sure you have Sphinx installed and in PATH, or set the SPHINXBUILD make variable to point to the full path of the '$(SPHINXBUILD)' executable.)
>  	@echo
> -	@./scripts/sphinx-pre-install
> +	@$(srctree)/scripts/sphinx-pre-install
>  	@echo "  SKIP    Sphinx $@ target."
>  
>  else # HAVE_SPHINX

Hi Jon,

The fix is incomplete... there are other occurrences of this
within the Makefile:


diff --git a/Documentation/Makefile b/Documentation/Makefile
index 2edd03b1dad6..2df0789f90b7 100644
--- a/Documentation/Makefile
+++ b/Documentation/Makefile
@@ -72,14 +72,14 @@ quiet_cmd_sphinx = SPHINX  $@ --> file://$(abspath $(BUILDDIR)/$3/$4)
 	$(abspath $(BUILDDIR)/$3/$4)
 
 htmldocs:
-	@./scripts/sphinx-pre-install --version-check
+	@$(srctree)/scripts/sphinx-pre-install --version-check
 	@+$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,html,$(var),,$(var)))
 
 linkcheckdocs:
 	@$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,linkcheck,$(var),,$(var)))
 
 latexdocs:
-	@./scripts/sphinx-pre-install --version-check
+	@$(srctree)/scripts/sphinx-pre-install --version-check
 	@+$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,latex,$(var),latex,$(var)))
 
 ifeq ($(HAVE_PDFLATEX),0)
@@ -91,17 +91,17 @@ pdfdocs:
 else # HAVE_PDFLATEX
 
 pdfdocs: latexdocs
-	@./scripts/sphinx-pre-install --version-check
+	@$(srctree)/scripts/sphinx-pre-install --version-check
 	$(foreach var,$(SPHINXDIRS), $(MAKE) PDFLATEX="$(PDFLATEX)" LATEXOPTS="$(LATEXOPTS)" -C $(BUILDDIR)/$(var)/latex || exit;)
 
 endif # HAVE_PDFLATEX
 
 epubdocs:
-	@./scripts/sphinx-pre-install --version-check
+	@$(srctree)/scripts/sphinx-pre-install --version-check
 	@+$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,epub,$(var),epub,$(var)))
 
 xmldocs:
-	@./scripts/sphinx-pre-install --version-check
+	@$(srctree)/scripts/sphinx-pre-install --version-check
 	@+$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,xml,$(var),xml,$(var)))
 
 endif # HAVE_SPHINX



Thanks,
Mauro
