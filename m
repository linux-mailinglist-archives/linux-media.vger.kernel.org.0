Return-Path: <linux-media+bounces-40774-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B47FDB31B74
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 16:28:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 202A41B60025
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 14:22:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C03A3128AE;
	Fri, 22 Aug 2025 14:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uC7AEXE3"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60314308F17;
	Fri, 22 Aug 2025 14:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755872388; cv=none; b=Vvay/nQoI6xtySJtTSLKtD5s6mBELcvkDFs+bBGMFkC/oGD0CMOLcMiyhw7LNJx3/wIaclVbqP93lfE++GuVJjOVgbbnw6GubGGu1qpho25E4GqRtc9VdhAuQqZlwj4k2btnqummzqnrwYgQkfryLedOeWFu9B8LjAhdH1M3F3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755872388; c=relaxed/simple;
	bh=pSYdMcus0LPCr9HogH6HkcL5YxbX5KWhzFdqlhGcbmI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q6IWiJ4Sw+qScBI/nhnplEpxLh8zrEWUxEyYcKoUChoJd8RJJOdA+TLpAhaiqVSdMao9DzA4w+dkdeV83gp9Qt/nvYjyTKA7f8AfD5nXxu8VlBE17t5s/wJCvKl4OegThpFPrxUk26Na99Vidme0vg3EwiZ+RYjdnPQwLGui/zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uC7AEXE3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E8DEC116B1;
	Fri, 22 Aug 2025 14:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755872388;
	bh=pSYdMcus0LPCr9HogH6HkcL5YxbX5KWhzFdqlhGcbmI=;
	h=From:To:Cc:Subject:Date:From;
	b=uC7AEXE3+SwOLKHHd/wbeW8x2JVxV6NK2Ub6v++0euDxAh4oNSN31LmoC1NlKAlQW
	 ywYsuakEjDbrZEo6GG03meJsLEq3ENrZ8+bwgUqIR0F0VQfG1z4c3osvR1qQyCpXNM
	 1aJpSQGXDKJij64PdbwTsAmME36to5mqr7kFVKzwJCFZByY8QK6Bnn2CQ8oMtFxIcB
	 d9bEdmyPnwYZMTpVgknuhCLuBsFlq1rrNke+h0v0gJl9MHRLA/CR1F3Que/4GCVXBh
	 b14SVQT3G2zwOX7yLdMyuOXR5yMORnRVaeBM6hMK/M/RGgCEjBdtQGhc/x19A9v3aH
	 Ej5O0H6GgHDMQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1upScM-0000000CCqq-0RR1;
	Fri, 22 Aug 2025 16:19:46 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <mchehab+huawei@kernel.org>,
	Benno Lossin <mchehab+huawei@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Danilo Krummrich <mchehab+huawei@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <mchehab+huawei@kernel.org>,
	Sean Young <sean@mess.org>,
	Trevor Gross <tmgross@umich.edu>,
	linux-media@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v2 00/24] better handle media headers
Date: Fri, 22 Aug 2025 16:19:12 +0200
Message-ID: <cover.1755872208.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Hi Jon,

Sorry for resending this big series. The content is almost identical
to the first version, but this one can be applied directly on the top
of docs/next, without requiring the sphinx-build-wrapper series.

I'm opting for this approach, in order to avoid adding 42 lines to
sphinx-build-wrapper just to be removed at the v1 of this series.

-

The goal of this series is to drop one of the most ancient and ugliest
hack from the documentation build system. Before migrating to Sphinx,
the media subsystem already had a very comprehensive uAPI book, together
with a build time system to detect and point for any documentation gaps.

When migrating to Sphinx, we ported the logic to a Perl script
(parse-headers.pl) and Markus came up with a Sphinx extension
(kernel_include.py). We also added some files to control how parse-headers
produce results, and a Makefile.

At the initial Sphinx versions (1.4.1 if I recall correctly), when
a new symbol is added to videodev2.h, a new warning were
produced at documentatiion time, it the patchset didn't have
the corresponding documentation path.

While kernel-include is generic, the only user at the moment is the media
subsystem.

This series gets rid of the Python script, replacing it by a command
line script and a class. The parse header class can optionally be used by
kernel-include to produce an enriched code that will contain cross-references.

As the other conversions, it starts with a bug-compatible version of
parse-headers, but the subsequent patches add more functionalities and
fix bugs.

It should be noticed that modern of Sphinx disabled the cross-reference
warnings. So, at the next series, I'll be re-adding it in a controlled way
(e.g. just for the references from kernel-include that has an special
argument).

The script also supports now generating a "toc" output, which will be used
at the next series.

-

v2:
   - makes it indepentent of sphinx-build-wrapper patch series.

Mauro Carvalho Chehab (24):
  docs: parse-headers.pl: improve its debug output format
  docs: parse-headers.py: convert parse-headers.pl
  docs: parse-headers.py: improve --help logic
  docs: parse-headers.py: better handle @var arguments
  docs: parse-headers.py: simplify the rules for hashes
  tools: docs: parse-headers.py: move it from sphinx dir
  tools: docs: parse_data_structs.py: add methods to return output
  MAINTAINERS: add files from tools/docs to documentation entry
  docs: uapi: media: Makefile: use parse-headers.py
  docs: kernel_include.py: Update its coding style
  docs: kernel_include.py: allow cross-reference generation
  docs: kernel_include.py: generate warnings for broken refs
  docs: kernel_include.py: move rawtext logic to separate functions
  docs: kernel_include.py: move range logic to a separate function
  docs: kernel_include.py: remove range restriction for gen docs
  docs: kernel_include.py: move code and literal functions
  docs: kernel_include.py: add support to generate a TOC table
  docs: kernel_include.py: append line numbers to better report errors
  docs: kernel_include.py: move apply_range() and add a docstring
  docs: kernel_include.py: remove line numbers from parsed-literal
  docs: kernel_include.py: remove Include class inheritance
  docs: kernel_include.py: document all supported parameters
  scripts: sphinx-build-wrapper: get rid of uapi/media Makefile
  docs: sphinx: drop parse-headers.pl

 .pylintrc                                     |   2 +-
 Documentation/Makefile                        |   3 +-
 Documentation/sphinx/kernel_include.py        | 519 +++++++++----
 Documentation/sphinx/parse-headers.pl         | 404 ----------
 Documentation/userspace-api/media/Makefile    |  64 --
 .../userspace-api/media/cec/cec-header.rst    |   5 +-
 .../media/{ => cec}/cec.h.rst.exceptions      |   0
 .../media/{ => dvb}/ca.h.rst.exceptions       |   0
 .../media/{ => dvb}/dmx.h.rst.exceptions      |   0
 .../media/{ => dvb}/frontend.h.rst.exceptions |   0
 .../userspace-api/media/dvb/headers.rst       |  17 +-
 .../media/{ => dvb}/net.h.rst.exceptions      |   0
 .../media/mediactl/media-header.rst           |   5 +-
 .../{ => mediactl}/media.h.rst.exceptions     |   0
 .../userspace-api/media/rc/lirc-header.rst    |   4 +-
 .../media/{ => rc}/lirc.h.rst.exceptions      |   0
 .../userspace-api/media/v4l/videodev.rst      |   4 +-
 .../{ => v4l}/videodev2.h.rst.exceptions      |   0
 MAINTAINERS                                   |   1 +
 scripts/sphinx-build-wrapper                  | 719 ++++++++++++++++++
 tools/docs/lib/__init__.py                    |   0
 tools/docs/lib/enrich_formatter.py            |  70 ++
 tools/docs/lib/parse_data_structs.py          | 452 +++++++++++
 tools/docs/parse-headers.py                   |  60 ++
 24 files changed, 1704 insertions(+), 625 deletions(-)
 delete mode 100755 Documentation/sphinx/parse-headers.pl
 delete mode 100644 Documentation/userspace-api/media/Makefile
 rename Documentation/userspace-api/media/{ => cec}/cec.h.rst.exceptions (100%)
 rename Documentation/userspace-api/media/{ => dvb}/ca.h.rst.exceptions (100%)
 rename Documentation/userspace-api/media/{ => dvb}/dmx.h.rst.exceptions (100%)
 rename Documentation/userspace-api/media/{ => dvb}/frontend.h.rst.exceptions (100%)
 rename Documentation/userspace-api/media/{ => dvb}/net.h.rst.exceptions (100%)
 rename Documentation/userspace-api/media/{ => mediactl}/media.h.rst.exceptions (100%)
 rename Documentation/userspace-api/media/{ => rc}/lirc.h.rst.exceptions (100%)
 rename Documentation/userspace-api/media/{ => v4l}/videodev2.h.rst.exceptions (100%)
 create mode 100755 scripts/sphinx-build-wrapper
 create mode 100644 tools/docs/lib/__init__.py
 create mode 100644 tools/docs/lib/enrich_formatter.py
 create mode 100755 tools/docs/lib/parse_data_structs.py
 create mode 100755 tools/docs/parse-headers.py

-- 
2.50.1


