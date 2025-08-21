Return-Path: <linux-media+bounces-40613-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF4AB2FC87
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 16:29:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B620FAA3EF0
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 14:22:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F9BC28BABE;
	Thu, 21 Aug 2025 14:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RMoln9ch"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B232280A4B;
	Thu, 21 Aug 2025 14:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755786099; cv=none; b=PGqdnmRTdQFfokEHP0mp9Y+PjWWYj1FMVkKO0zy/FGarAfeJVi6894vn/ZcjRbdn0zq+EJ3koSdosoMKG78ilL6Yvcggo6QCeAX+8U+j7igMyCikzjCBodnzt8GUt4QsJYgVAiG4N8c89SKfms/syPzg8pH07ORkukNXTe6nI/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755786099; c=relaxed/simple;
	bh=7D8ImbQ64qRP/VowwgAm1Rn3cTSGFFW/kfcVSm7ahHI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SHcVqzdszplt8kLaKHGV4/f4qqlzdMtw18yfgejYpAF2lnJ10eRUkmmvFim1PzuZveo5Ni9HuThpXv49f4Uj0kRdJl6RoqHaywEpoehlHqOXuz08NAhykAbRv1YUU3GAQ9BmyjEu7LnV2H/pLsf/Waejj4SRtjh7QLCyhYxPBe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RMoln9ch; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 224A0C19423;
	Thu, 21 Aug 2025 14:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755786099;
	bh=7D8ImbQ64qRP/VowwgAm1Rn3cTSGFFW/kfcVSm7ahHI=;
	h=From:To:Cc:Subject:Date:From;
	b=RMoln9chByuA9HzKbsT2GkLLsIMipkSxktB1G0OdhOnmY4Mn3j5wg7HAEp2+4Bqbo
	 lLHL2LoD7jMxt397NSYatwYeQhhT0D7FrojNI4fT9ktLy3FuEpaovMcmhFw8EUQCkk
	 Mv7l2pu3+Hp24ZMf8Y6dIsGESyaw5ASQi/QcHMCP8u5Qxs9odRmzrDOm/4rFeMLpB4
	 cn6PWX79+gYjkDA4IqqIFbNafXT3odqPQK//oNiEszc7uTPO0HGgPEkEgF3tkNw+iI
	 T5w8d0kvp4+hfjuOQyxvEfg0EqLk5R9nj6+ahMPPZRAOISF1X0G1iujMwt+ia7PMiZ
	 E/98q137XhI6A==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1up6Aa-0000000BT81-44nX;
	Thu, 21 Aug 2025 16:21:36 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sean Young <sean@mess.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 00/24] better handle media headers
Date: Thu, 21 Aug 2025 16:21:06 +0200
Message-ID: <cover.1755784929.git.mchehab+huawei@kernel.org>
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

Sorry for the big series. I wanted it to be smaller, by still this
is still only the first half of the history. I have a pile of other
patches on the top of this one to be sent - part of them to media.

This series comes after:
	https://lore.kernel.org/linux-doc/cover.1755258303.git.mchehab+huawei@kernel.org/

Its goal is to drop one of the most ancient and ugliest hack from
the documentation build system.

Before migrating to Sphinx, the media subsystem already had
a very comprehensive uAPI book, together with a build time
system to detect and point for any documentation gaps.

When migrating to Sphinx, we ported the logic to a Perl script
(parse-headers.pl) and Markus came up with a Sphinx extension
(kernel_include.py). We also added some files to control how
parse-headers produce results, and a Makefile.

At the initial Sphinx versions (1.4.1 if I recall correctly), when
a new symbol is added to videodev2.h, a new warning were
produced at documentatiion time, it the patchset didn't have
the corresponding documentation path.

While kernel-include is generic, the only user at the moment
is the media subsystem.

This series gets rid of the Python script, replacing it by a
command line script and a class. The parse header class
can optionally be used by kernel-include to produce an
enriched code that will contain cross-references.

As the other conversions, it starts with a bug-compatible
version of parse-headers, but the subsequent patches
add more functionalities and fix bugs.

It should be noticed that modern of Sphinx disabled the
cross-reference warnings. So, at the next series, I'll be
re-adding it in a controlled way (e.g. just for the
references from kernel-include that has an special
argument).

The script also supports now generating a "toc" output,
which will be used at the next series.

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
  docs: : Update its coding style
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
 Documentation/sphinx/kernel_include.py        | 519 +++++++++++++-----
 Documentation/sphinx/parse-headers.pl         | 404 --------------
 Documentation/userspace-api/media/Makefile    |  64 ---
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
 scripts/sphinx-build-wrapper                  |  48 --
 tools/docs/lib/__init__.py                    |   0
 tools/docs/lib/enrich_formatter.py            |  70 +++
 tools/docs/lib/parse_data_structs.py          | 452 +++++++++++++++
 tools/docs/parse-headers.py                   |  60 ++
 23 files changed, 984 insertions(+), 671 deletions(-)
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
 create mode 100644 tools/docs/lib/__init__.py
 create mode 100644 tools/docs/lib/enrich_formatter.py
 create mode 100755 tools/docs/lib/parse_data_structs.py
 create mode 100755 tools/docs/parse-headers.py

-- 
2.50.1



