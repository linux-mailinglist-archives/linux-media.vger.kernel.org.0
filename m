Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8BB337BD08
	for <lists+linux-media@lfdr.de>; Wed, 12 May 2021 14:52:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230472AbhELMxE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 May 2021 08:53:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:52776 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231398AbhELMwz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 May 2021 08:52:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 71185613F9;
        Wed, 12 May 2021 12:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620823902;
        bh=YRGjK9/79T0DhxYuKKtnj3+UfM0r1+Z/4V75kUmLAvE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rCJeqNF/+rL5BhP3rG6A++dGVIwnSBA0tgRAbZcA7jZfev5uSwqo5pxtVCnleirv7
         6zB3t6pGDJ2hlZRZcTJ7gucKwANVBqaO9hTBhhuGPNLW7lZcAZbCLVHLj40/HoX+l4
         VnCA82GMjC+rRwbUG5dvb27xct5gHv3/cA9KJjF+AuQeuSL/FPgZ49H262C5zYJVQn
         /wUzAUg0TIqyvhsCICzWKQF6uQqalLjwCe3bPt++s13m1KJJEAWJxYqdmTSNCHboVL
         nCrLGZ0nQyzKg17aT0k3Hz5k+QNBzomZ0HXGSo6kvPfVQSjnu/GIeMLI/SJ+akelHE
         Fse2Kn1+oWByQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lgoKy-0018hh-JX; Wed, 12 May 2021 14:51:40 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v2 14/40] docs: userspace-api: media: fdl-appendix.rst: Use ASCII subset instead of UTF-8 alternate symbols
Date:   Wed, 12 May 2021 14:50:18 +0200
Message-Id: <a8460b5189c36406af2655263bc96432ce05c6b6.1620823573.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620823573.git.mchehab+huawei@kernel.org>
References: <cover.1620823573.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The conversion tools used during DocBook/LaTeX/Markdown->ReST conversion
and some automatic rules which exists on certain text editors like
LibreOffice turned ASCII characters into some UTF-8 alternatives that
are better displayed on html and PDF.

While it is OK to use UTF-8 characters in Linux, it is better to
use the ASCII subset instead of using an UTF-8 equivalent character
as it makes life easier for tools like grep, and are easier to edit
with the some commonly used text/source code editors.

Also, Sphinx already do such conversion automatically outside literal blocks:
   https://docutils.sourceforge.io/docs/user/smartquotes.html

So, replace the occurences of the following UTF-8 characters:

	- U+201c ('“'): LEFT DOUBLE QUOTATION MARK
	- U+201d ('”'): RIGHT DOUBLE QUOTATION MARK

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../userspace-api/media/fdl-appendix.rst      | 64 +++++++++----------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/Documentation/userspace-api/media/fdl-appendix.rst b/Documentation/userspace-api/media/fdl-appendix.rst
index 683ebed87017..b1bc725b4ec7 100644
--- a/Documentation/userspace-api/media/fdl-appendix.rst
+++ b/Documentation/userspace-api/media/fdl-appendix.rst
@@ -13,14 +13,14 @@ GNU Free Documentation License
 ===========
 
 The purpose of this License is to make a manual, textbook, or other
-written document “free” in the sense of freedom: to assure everyone the
+written document "free" in the sense of freedom: to assure everyone the
 effective freedom to copy and redistribute it, with or without modifying
 it, either commercially or noncommercially. Secondarily, this License
 preserves for the author and publisher a way to get credit for their
 work, while not being considered responsible for modifications made by
 others.
 
-This License is a kind of “copyleft”, which means that derivative works
+This License is a kind of "copyleft", which means that derivative works
 of the document must themselves be free in the same sense. It
 complements the GNU General Public License, which is a copyleft license
 designed for free software.
@@ -44,21 +44,21 @@ works whose purpose is instruction or reference.
 
 This License applies to any manual or other work that contains a notice
 placed by the copyright holder saying it can be distributed under the
-terms of this License. The “Document”, below, refers to any such manual
+terms of this License. The "Document", below, refers to any such manual
 or work. Any member of the public is a licensee, and is addressed as
-“you”.
+"you".
 
 
 .. _fdl-modified:
 
-A “Modified Version” of the Document means any work containing the
+A "Modified Version" of the Document means any work containing the
 Document or a portion of it, either copied verbatim, or with
 modifications and/or translated into another language.
 
 
 .. _fdl-secondary:
 
-A “Secondary Section” is a named appendix or a front-matter section of
+A "Secondary Section" is a named appendix or a front-matter section of
 the :ref:`Document <fdl-document>` that deals exclusively with the
 relationship of the publishers or authors of the Document to the
 Document's overall subject (or to related matters) and contains nothing
@@ -72,7 +72,7 @@ regarding them.
 
 .. _fdl-invariant:
 
-The “Invariant Sections” are certain
+The "Invariant Sections" are certain
 :ref:`Secondary Sections <fdl-secondary>` whose titles are designated,
 as being those of Invariant Sections, in the notice that says that the
 :ref:`Document <fdl-document>` is released under this License.
@@ -80,14 +80,14 @@ as being those of Invariant Sections, in the notice that says that the
 
 .. _fdl-cover-texts:
 
-The “Cover Texts” are certain short passages of text that are listed, as
+The "Cover Texts" are certain short passages of text that are listed, as
 Front-Cover Texts or Back-Cover Texts, in the notice that says that the
 :ref:`Document <fdl-document>` is released under this License.
 
 
 .. _fdl-transparent:
 
-A “Transparent” copy of the :ref:`Document <fdl-document>` means a
+A "Transparent" copy of the :ref:`Document <fdl-document>` means a
 machine-readable copy, represented in a format whose specification is
 available to the general public, whose contents can be viewed and edited
 directly and straightforwardly with generic text editors or (for images
@@ -97,7 +97,7 @@ formatters or for automatic translation to a variety of formats suitable
 for input to text formatters. A copy made in an otherwise Transparent
 file format whose markup has been designed to thwart or discourage
 subsequent modification by readers is not Transparent. A copy that is
-not “Transparent” is called “Opaque”.
+not "Transparent" is called "Opaque".
 
 Examples of suitable formats for Transparent copies include plain ASCII
 without markup, Texinfo input format, LaTeX input format, SGML or XML
@@ -111,10 +111,10 @@ word processors for output purposes only.
 
 .. _fdl-title-page:
 
-The “Title Page” means, for a printed book, the title page itself, plus
+The "Title Page" means, for a printed book, the title page itself, plus
 such following pages as are needed to hold, legibly, the material this
 License requires to appear in the title page. For works in formats which
-do not have any title page as such, “Title Page” means the text near the
+do not have any title page as such, "Title Page" means the text near the
 most prominent appearance of the work's title, preceding the beginning
 of the body of the text.
 
@@ -242,11 +242,11 @@ Modified Version:
    Include an unaltered copy of this License.
 
 -  **I.**
-   Preserve the section entitled “History”, and its title, and add to it
+   Preserve the section entitled "History", and its title, and add to it
    an item stating at least the title, year, new authors, and publisher
    of the :ref:`Modified Version <fdl-modified>` as given on the
    :ref:`Title Page <fdl-title-page>`. If there is no section entitled
-   “History” in the :ref:`Document <fdl-document>`, create one stating
+   "History" in the :ref:`Document <fdl-document>`, create one stating
    the title, year, authors, and publisher of the Document as given on
    its Title Page, then add an item describing the Modified Version as
    stated in the previous sentence.
@@ -256,13 +256,13 @@ Modified Version:
    :ref:`Document <fdl-document>` for public access to a
    :ref:`Transparent <fdl-transparent>` copy of the Document, and
    likewise the network locations given in the Document for previous
-   versions it was based on. These may be placed in the “History”
+   versions it was based on. These may be placed in the "History"
    section. You may omit a network location for a work that was
    published at least four years before the Document itself, or if the
    original publisher of the version it refers to gives permission.
 
 -  **K.**
-   In any section entitled “Acknowledgements” or “Dedications”, preserve
+   In any section entitled "Acknowledgements" or "Dedications", preserve
    the section's title, and preserve in the section all the substance
    and tone of each of the contributor acknowledgements and/or
    dedications given therein.
@@ -274,11 +274,11 @@ Modified Version:
    part of the section titles.
 
 -  **M.**
-   Delete any section entitled “Endorsements”. Such a section may not be
+   Delete any section entitled "Endorsements". Such a section may not be
    included in the :ref:`Modified Version <fdl-modified>`.
 
 -  **N.**
-   Do not retitle any existing section as “Endorsements” or to conflict
+   Do not retitle any existing section as "Endorsements" or to conflict
    in title with any :ref:`Invariant Section <fdl-invariant>`.
 
 If the :ref:`Modified Version <fdl-modified>` includes new
@@ -290,7 +290,7 @@ of :ref:`Invariant Sections <fdl-invariant>` in the Modified Version's
 license notice. These titles must be distinct from any other section
 titles.
 
-You may add a section entitled “Endorsements”, provided it contains
+You may add a section entitled "Endorsements", provided it contains
 nothing but endorsements of your
 :ref:`Modified Version <fdl-modified>` by various parties--for
 example, statements of peer review or that the text has been approved by
@@ -337,11 +337,11 @@ the original author or publisher of that section if known, or else a
 unique number. Make the same adjustment to the section titles in the
 list of Invariant Sections in the license notice of the combined work.
 
-In the combination, you must combine any sections entitled “History” in
-the various original documents, forming one section entitled “History”;
-likewise combine any sections entitled “Acknowledgements”, and any
-sections entitled “Dedications”. You must delete all sections entitled
-“Endorsements.”
+In the combination, you must combine any sections entitled "History" in
+the various original documents, forming one section entitled "History";
+likewise combine any sections entitled "Acknowledgements", and any
+sections entitled "Dedications". You must delete all sections entitled
+"Endorsements."
 
 
 .. _fdl-section6:
@@ -372,7 +372,7 @@ with other separate and independent documents or works, in or on a
 volume of a storage or distribution medium, does not as a whole count as
 a :ref:`Modified Version <fdl-modified>` of the Document, provided no
 compilation copyright is claimed for the compilation. Such a compilation
-is called an “aggregate”, and this License does not apply to the other
+is called an "aggregate", and this License does not apply to the other
 self-contained works thus compiled with the Document , on account of
 their being thus compiled, if they are not themselves derivative works
 of the Document. If the :ref:`Cover Text <fdl-cover-texts>`
@@ -429,7 +429,7 @@ concerns. See
 
 Each version of the License is given a distinguishing version number. If
 the :ref:`Document <fdl-document>` specifies that a particular
-numbered version of this License “or any later version” applies to it,
+numbered version of this License "or any later version" applies to it,
 you have the option of following the terms and conditions either of that
 specified version or of any later version that has been published (not
 as a draft) by the Free Software Foundation. If the Document does not
@@ -455,13 +455,13 @@ notices just after the title page:
     being LIST THEIR TITLES, with the
     :ref:`Front-Cover Texts <fdl-cover-texts>` being LIST, and with
     the :ref:`Back-Cover Texts <fdl-cover-texts>` being LIST. A copy
-    of the license is included in the section entitled “GNU Free
-    Documentation License”.
+    of the license is included in the section entitled "GNU Free
+    Documentation License".
 
-If you have no :ref:`Invariant Sections <fdl-invariant>`, write “with
-no Invariant Sections” instead of saying which ones are invariant. If
-you have no :ref:`Front-Cover Texts <fdl-cover-texts>`, write “no
-Front-Cover Texts” instead of “Front-Cover Texts being LIST”; likewise
+If you have no :ref:`Invariant Sections <fdl-invariant>`, write "with
+no Invariant Sections" instead of saying which ones are invariant. If
+you have no :ref:`Front-Cover Texts <fdl-cover-texts>`, write "no
+Front-Cover Texts" instead of "Front-Cover Texts being LIST"; likewise
 for :ref:`Back-Cover Texts <fdl-cover-texts>`.
 
 If your document contains nontrivial examples of program code, we
-- 
2.30.2

