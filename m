Return-Path: <linux-media+bounces-21156-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9719C1DD1
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 14:25:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6932E1F2334C
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 13:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7E661EABCE;
	Fri,  8 Nov 2024 13:25:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08061EABA3
	for <linux-media@vger.kernel.org>; Fri,  8 Nov 2024 13:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731072308; cv=none; b=LvoAhdabNZbjAil7H6jV05IPfdeBGllA8emmKCGtG8oMjSo7iQXrP0n06akBOzpWMe3Tna5ZrdwgP9aAGzaaysJ1JzBF4D+E27YgyO1/AFXlEmg03N7piG/ld4JK2W06NYtblCrVdYK/pY0EGkvHdpaz/3fU8S5V6SvWe8nbedQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731072308; c=relaxed/simple;
	bh=IRmAmEpfaHgFDOaUpav5NCukvTE16o3LLkEC1gxU5uw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XqcHmBjYJqTkcrShFvEzlYkE1B92WnqmkyeN3IMEMC4DWBXwvfx5AIWGg3prd2I4ADss40mJ2aV4U+CQHuT0X8mGT9LJmfi5MIeyhQdSvNxdl4qPzPXjlADZzc4cpVj/wlWixuCnWqWHdZFW9CD9vclbdKKKT6Bfrr/sbz2KkSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1t9Oz3-0007Tb-2G;
	Fri, 08 Nov 2024 13:25:05 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
	by slave0 with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1t9Oz3-00FWuK-1V;
	Fri, 08 Nov 2024 13:25:05 +0000
From: Jenkins <jenkins@linuxtv.org>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: builder@linuxtv.org
Subject: Re: [GIT PULL for v6.12-rc7] media fixes (#105248)
Date: Fri,  8 Nov 2024 13:25:03 +0000
Message-Id: <20241108132503.3701407-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241108135433.40c7a4fa@foz.lan>
References: 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20241108135433.40c7a4fa@foz.lan/
Build log: https://builder.linuxtv.org/job/patchwork/397533/
Build time: 00:27:32
Link: https://lore.kernel.org/linux-media/20241108135433.40c7a4fa@foz.lan

gpg: Signature made Fri 08 Nov 2024 12:48:36 PM UTC
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

Summary: no issues. All 17 looked fine.

