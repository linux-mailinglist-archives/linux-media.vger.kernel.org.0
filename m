Return-Path: <linux-media+bounces-43488-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFC3BB0E0E
	for <lists+linux-media@lfdr.de>; Wed, 01 Oct 2025 16:56:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4BAB51C6515
	for <lists+linux-media@lfdr.de>; Wed,  1 Oct 2025 14:55:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A8FD30F7E3;
	Wed,  1 Oct 2025 14:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M2E02E62"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43D53019BD;
	Wed,  1 Oct 2025 14:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759330199; cv=none; b=TJ94bLyv031LSoPLdtXok/c2TRLkOiKPelq1nqN7umM0ha9yRDo0DOVwtk2QknrCPB3ip+q744RDANXKqK1RRi0DBNXYGm7mluJ8SplhySbewwg+8819iO99c4iZFy9N+NWC+hbsjvshbUylZd+XvcNVACaUIzYtVhtcjH6FJv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759330199; c=relaxed/simple;
	bh=2zQBGsH/cQXuSIu370Y/F/Txa7NKJUp+V61gWvu03sI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qgiojU17AGk5JuRO81P9dQ+APwAHgS95wHGo65Zxmtoo4UnbNkZzv0Rh+SYh7qTrhlsmyDsBxSiyu154vhjmfFvtYK+ijg73fKKpMpLHXxgGaH03luUgqNI+R79iQlC3hGRBbCBJLT70tPtVuyO+N0lo0CVyfwtFZSPYmQsegWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M2E02E62; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6572BC19421;
	Wed,  1 Oct 2025 14:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759330199;
	bh=2zQBGsH/cQXuSIu370Y/F/Txa7NKJUp+V61gWvu03sI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M2E02E62Tnh7kRqXwqu2KPXjxVdmXilDVM8BD5pXSSKje4NsN9YpbGGOh5pyP+LM0
	 UVateF+pvDQQoTaiaK1tvsxYxNQjyXWT2Yk1jJqfUoOBUIYwyF0N+LnBKPDogHfFpA
	 F9rVctumhkP0kCjs+9yK1M8hFP4bxadwwu0s9xngMJR9elS09s2j185o7ueu1CI9Uw
	 tiEOj5okUwlUoUG3itwJryIl1qEsE7IkecUAMpoZKMYlea3gyuKJCsWzTP3VwrkLpp
	 wQRYuRkpIfx+FAS2W6VblALHgNsuEDxXLkn7reUKKtMQ7QacugHEuTzu3JqM3LsFgn
	 eYOwFF7bSxT2w==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1v3y9V-0000000BLJL-2rwu;
	Wed, 01 Oct 2025 16:49:57 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Jonathan Corbet" <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH 21/23] docs: media: dmx_types: place kerneldoc at the right namespace
Date: Wed,  1 Oct 2025 16:49:44 +0200
Message-ID: <27fcc036fb5c80bda8116029e1964ad229208095.1759329363.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1759329363.git.mchehab+huawei@kernel.org>
References: <cover.1759329363.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

The DVB documentation is using DTV.dmx for all demux symbols.

Use such domain for kernel-doc documentation.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/userspace-api/media/dvb/dmx_types.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/userspace-api/media/dvb/dmx_types.rst b/Documentation/userspace-api/media/dvb/dmx_types.rst
index 33458fbb84ab..dd76010696c8 100644
--- a/Documentation/userspace-api/media/dvb/dmx_types.rst
+++ b/Documentation/userspace-api/media/dvb/dmx_types.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.dmx
 
 .. _dmx_types:
 
-- 
2.51.0


