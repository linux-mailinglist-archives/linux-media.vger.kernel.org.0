Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7A3CA9E38
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 11:23:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732978AbfIEJXV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 05:23:21 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:39726 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725290AbfIEJXU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Sep 2019 05:23:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Nq0/AIfadmx52mPl01oTaYnDgOBbCeLTbcoEAfHL7Zg=; b=hY0wRutmWAyrVgIclY0UBKDXKG
        kDGfkFIQYuNG822t5f4eBDptsd3awjVjgfBUMMtc02l+fOdNCuTVIWWVV2uklrEtK/e2TlLg01r/O
        QwrRFsHTdIJhsLEQeSuqvuSBdDy+Zx8+HsyQ2SIuAJmMfN03jYXny65bTTmpaexB2qVMIgq5wiAoi
        OdhRu90dli4j8eJ4wOkp/tdNO3ePvNebZxzbx6hp5wFvuqvWLXy8uYegazKRo2K7Y2cejO1E31QF2
        tGQ1U7XVnHgT5p0ldleCzasXAcfSTWzBRuTuNILnVgy7vfDdnrBQX88X2Bf+FXzNpaD2mpVVFd2rJ
        V2cs1JPg==;
Received: from 177.17.137.173.dynamic.adsl.gvt.net.br ([177.17.137.173] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1i5nz5-0005Be-W1; Thu, 05 Sep 2019 09:23:20 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.1)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1i5nz3-0006tA-Kn; Thu, 05 Sep 2019 06:23:17 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>, Jessica Yu <jeyu@kernel.org>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        Thomas Gleixner <tglx@linutronix.de>, linux-doc@vger.kernel.org
Subject: [PATCH] docs: license-rules.txt: cover SPDX headers on Python scripts
Date:   Thu,  5 Sep 2019 06:23:13 -0300
Message-Id: <88e638eb959095ab6657d295f9f8c27169569bf2.1567675272.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190905055614.7958918b@coco.lan>
References: <20190905055614.7958918b@coco.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The author of the license-rules.rst file wanted to be very restrict
with regards to the location of the SPDX header. It says that
the SPDX header "shall be added at the first  possible line in
a file which can contain a comment". Not happy with this already
restrictive requiement, it goes further:

"For the majority  of files this is the first line, except for
scripts", opening an exception to have the SPDX header at the
second line, if the first line starts with "#!".

Well, it turns that this is too restrictive for Python scripts,
and may cause regressions if this would be enforced.

As mentioned on:
	https://stackoverflow.com/questions/728891/correct-way-to-define-python-source-code-encoding

Python's PEP-263 [1] dictates that an script that needs to default to
UTF-8 encoding has to follow this rule:

	'Python will default to ASCII as standard encoding if no other
	 encoding hints are given.

	 To define a source code encoding, a magic comment must be placed
	 into the source files either as first or second line in the file'

And:
	'More precisely, the first or second line must match the following
	 regular expression:

	 ^[ \t\f]*#.*?coding[:=][ \t]*([-_.a-zA-Z0-9]+)'

[1] https://www.python.org/dev/peps/pep-0263/

If a script has both "#!" and the charset encoding line, we can't place
a SPDX tag without either violating license-rules.rst or breaking the
script by making it crash with non-ASCII characters.

So, add a sort notice saying that, for Python scripts, the SPDX
header may be up to the third line, in order to cover the case
where both "#!" and "# .*coding.*UTF-8" lines are found.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/process/license-rules.rst | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/process/license-rules.rst b/Documentation/process/license-rules.rst
index 2ef44ada3f11..5d23e3498b1c 100644
--- a/Documentation/process/license-rules.rst
+++ b/Documentation/process/license-rules.rst
@@ -64,9 +64,12 @@ License identifier syntax
    possible line in a file which can contain a comment.  For the majority
    of files this is the first line, except for scripts which require the
    '#!PATH_TO_INTERPRETER' in the first line.  For those scripts the SPDX
-   identifier goes into the second line.
+   identifier goes into the second line\ [1]_.
 
-|
+.. [1] Please notice that Python scripts may also need an encoding rule
+   as defined on PEP-263, which should be defined either at the first
+   or the second line. So, for such scripts, the SPDX identifier may
+   go up to the third line.
 
 2. Style:
 
-- 
2.21.0


