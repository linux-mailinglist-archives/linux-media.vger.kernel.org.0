Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 685CF304A4
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2019 00:11:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbfE3WLB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 May 2019 18:11:01 -0400
Received: from ms.lwn.net ([45.79.88.28]:58664 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726100AbfE3WLB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 May 2019 18:11:01 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 27469728;
        Thu, 30 May 2019 21:32:40 +0000 (UTC)
Date:   Thu, 30 May 2019 15:32:39 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     kbuild test robot <lkp@intel.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>, kbuild-all@01.org,
        linux-doc@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [lwn:docs-next 25/31] htmldocs: /bin/bash:
 ./scripts/sphinx-pre-install: No such file or directory
Message-ID: <20190530153239.57f321c9@lwn.net>
In-Reply-To: <201905310424.Zhlxo3ky%lkp@intel.com>
References: <201905310424.Zhlxo3ky%lkp@intel.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 31 May 2019 04:19:29 +0800
kbuild test robot <lkp@intel.com> wrote:

> tree:   git://git.lwn.net/linux-2.6 docs-next
> head:   a700767a7682d9bd237e927253274859aee075e7
> commit: 9b88ad5464af1bf7228991f1c46a9a13484790a4 [25/31] scripts/sphinx-pre-install: always check if version is compatible with build
> reproduce: make htmldocs
> 
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
> >> /bin/bash: ./scripts/sphinx-pre-install: No such file or directory  

For this one, I'm guessing we need something like the following...disagree?

jon

--------
diff --git a/Documentation/Makefile b/Documentation/Makefile
index e889e7cb8511..c98188994322 100644
--- a/Documentation/Makefile
+++ b/Documentation/Makefile
@@ -23,7 +23,7 @@ ifeq ($(HAVE_SPHINX),0)
 .DEFAULT:
 	$(warning The '$(SPHINXBUILD)' command was not found. Make sure you have Sphinx installed and in PATH, or set the SPHINXBUILD make variable to point to the full path of the '$(SPHINXBUILD)' executable.)
 	@echo
-	@./scripts/sphinx-pre-install
+	@$(srctree)/scripts/sphinx-pre-install
 	@echo "  SKIP    Sphinx $@ target."
 
 else # HAVE_SPHINX
