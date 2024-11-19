Return-Path: <linux-media+bounces-21583-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D729D25AF
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2024 13:24:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 648ED1F24CE1
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2024 12:24:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46F131CDFA4;
	Tue, 19 Nov 2024 12:21:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855491CDA3B
	for <linux-media@vger.kernel.org>; Tue, 19 Nov 2024 12:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732018874; cv=none; b=fPcBpCWPeYepX8F3DZFiO947LhXabQJRPHequN19/k5Qtkg7f9I+61qr8lBOg/rxWxQuIp9oIJyY6PwqqiaeKx968MxxnT4G7UXBavMLqP0pivLqNx72ViAn3eWSJvoTmgScJn08brOthKlEuXiSYB027rNQ9sQdgwkSSGPrXnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732018874; c=relaxed/simple;
	bh=TM8tcVsXK0xngGNVtugtEBpiVK5KsytHnKDI7oa8N/A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=B/yCmqjrAt4s6mzppwslRLf3oQ3SpDS0JKcRbOXvxk/jI+rP3X+xnQK4ME0g/Y4XH5D0zDnilXrkUB0HcFv4KSIwa1YagU8VjNuEipUvOWVTCa9WiWMlvN73tBR02w1e5Jq7x8mDlktd8pb62LZ7AY5WxbPs+nu/6aiQITjRx7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1tDNEG-00067c-2A;
	Tue, 19 Nov 2024 12:21:12 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
	by slave0 with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1tDNEC-00CNrN-2u;
	Tue, 19 Nov 2024 12:21:09 +0000
From: Jenkins <jenkins@linuxtv.org>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: builder@linuxtv.org
Subject: Re: [GIT PULL for v6.13-rc1] media updates (#105403)
Date: Tue, 19 Nov 2024 12:21:04 +0000
Message-Id: <20241119122105.2951592-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241119090407.645ee267@foz.lan>
References: 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20241119090407.645ee267@foz.lan/
Build log: https://builder.linuxtv.org/job/patchwork/400638/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/20241119090407.645ee267@foz.lan

gpg: Signature made Tue 19 Nov 2024 07:52:45 AM UTC
gpg:                using RSA key F909AE68FC11DF09C1755C00085F3EBD8EE4E115
gpg: Good signature from "Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <m.chehab@samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@osg.samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@s-opensource.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab+samsung@kernel.org>" [ultimate]
gpg:                 aka "[jpeg image of size 3594]" [never]
gpg:                 aka "Mauro Carvalho Chehab <mchehab+huawei@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mauro.chehab@intel.com>" [ultimate]


Build aborted due to a fatal error:
FAILED: patch patch patches/0115-media-atomisp-Replace-ternary-operator-with-if.patch doesn't apply:
Applying patch patches/0115-media-atomisp-Replace-ternary-operator-with-if.patch
patching file drivers/staging/media/atomisp/pci/sh_css_frac.h
Hunk #1 FAILED at 37.
Hunk #2 FAILED at 47.
2 out of 2 hunks FAILED -- rejects in file drivers/staging/media/atomisp/pci/sh_css_frac.h
Patch patches/0115-media-atomisp-Replace-ternary-operator-with-if.patch does not apply (enforce with -f)


