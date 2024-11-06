Return-Path: <linux-media+bounces-20988-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2CB9BE157
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 09:54:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7E8F1F22F71
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 08:54:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE2701D7E30;
	Wed,  6 Nov 2024 08:53:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBB41D61B9
	for <linux-media@vger.kernel.org>; Wed,  6 Nov 2024 08:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730883227; cv=none; b=jXuJsebRhPmhXhmr+nGw3l0bNyCPcKBSwigQqBHuquYs+sdidWYWk8DoaKlPYXQ/2gROeoalGYFtNXl6zxA+a1N9LVl3TYthScs9vXbDflJFcCEksKSn/qIdB2+n6hgZDzbFcFa9lFfSGvn8kRcsqWNrGgPbsLMG7oQofedV29s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730883227; c=relaxed/simple;
	bh=rV+tykEztNK5/ZBflTXax282oEWbIrv2vh7kTIqrADQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ryHwXjMPHOFLk1EFC75sPWfdWUV79Gh3wJUy5tXCUGqKPX5gQ8kpdDUhf0MxMrynvT1WrRtZp85g6kpJrARkfb3MLI3GSWzx2h9tThLj8b8I+9YHwuILjgiCfyAc8k2+mNmMyrXt1iNxH+FjJYRHSveZnYin8fgxXBKX+Bzj6pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1t8bnM-0002a3-36;
	Wed, 06 Nov 2024 08:53:45 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
	by slave0 with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1t8bnM-008cYz-0b;
	Wed, 06 Nov 2024 08:53:44 +0000
From: Jenkins <jenkins@linuxtv.org>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@iki.fi>
Cc: builder@linuxtv.org
Subject: Re: [GIT PULL FOR 6.13] Lots of fixes but also PiSP support (#105187)
Date: Wed,  6 Nov 2024 08:53:42 +0000
Message-Id: <20241106085342.2054852-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <ZysfQDjGpNrbjU6F@valkosipuli.retiisi.eu>
References: 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/ZysfQDjGpNrbjU6F@valkosipuli.retiisi.eu/
Build log: https://builder.linuxtv.org/job/patchwork/396925/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/ZysfQDjGpNrbjU6F@valkosipuli.retiisi.eu

gpg: Signature made Fri 11 Oct 2024 08:25:40 PM UTC
gpg:                using EDDSA key 5873A1DBBB1EBB81535A470C7A13323D00AE6FDB
gpg: Good signature from "Sakari Ailus <sakari.ailus@linux.intel.com>" [full]
gpg:                 aka "Sakari Ailus <sakari.ailus@iki.fi>" [full]
gpg: cannot open '/dev/tty': No such device or address


Build aborted due to a fatal error:
FAILED: patch patch patches/0042-media-atomisp-Replace-ternary-operator-with-if.patch doesn't apply:
Applying patch patches/0042-media-atomisp-Replace-ternary-operator-with-if.patch
patching file drivers/staging/media/atomisp/pci/sh_css_frac.h
Hunk #1 FAILED at 37.
Hunk #2 FAILED at 47.
2 out of 2 hunks FAILED -- rejects in file drivers/staging/media/atomisp/pci/sh_css_frac.h
Patch patches/0042-media-atomisp-Replace-ternary-operator-with-if.patch does not apply (enforce with -f)


