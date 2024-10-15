Return-Path: <linux-media+bounces-19688-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A5B99F2CB
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 18:34:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E13A228145F
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 16:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 783131F6683;
	Tue, 15 Oct 2024 16:34:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992B1158DB9
	for <linux-media@vger.kernel.org>; Tue, 15 Oct 2024 16:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729010084; cv=none; b=bH3msn47oTMvhtBfz497hrxsi2vvhpJSTsF8v0JP+DJ6aQ1MMO+251AzPxxBaVpvALOrROVxFt3jIBxhkB29WXaA+RMCY0EE+AqmovYOK0qVCPdToCdxiZhjaSe4ZLBnXUzEGNVc2WOoTeCY8yFsKSbjRNvKoRGobNcaxU5FL8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729010084; c=relaxed/simple;
	bh=IfLrCvWpbQE/k+AHgxXf1KwIOhWtrBSu783k4Lh1IQw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KpDrWSKxKvUSCcy4x2ZrVNJl0xzbIkGsT82lB3qpbblNMJdwZ3xsDjRcgKuCNzkIdmP+/vZJUoUvTlYEa5TnhQDF3UUL4zHNBRNIihuLCTZ9pa8I1zX5h/9Jpch9tk1zTwymASydH3ya8FBlwHXns0dxphueFYhLew+pkZf61u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1t0kVN-0002iu-1G;
	Tue, 15 Oct 2024 16:34:41 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
	by slave0 with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1t0kVM-000JZ8-0Y;
	Tue, 15 Oct 2024 16:34:40 +0000
From: Jenkins <jenkins@linuxtv.org>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@iki.fi>
Cc: builder@linuxtv.org
Subject: Re: [GIT PULL v2 FOR 6.13] Mostly camera sensor patches (#104778)
Date: Tue, 15 Oct 2024 16:34:37 +0000
Message-Id: <20241015163437.75201-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <Zw6NXzWiKsQccI32@valkosipuli.retiisi.eu>
References: 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/Zw6NXzWiKsQccI32@valkosipuli.retiisi.eu/
Build log: https://builder.linuxtv.org/job/patchwork/390756/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/Zw6NXzWiKsQccI32@valkosipuli.retiisi.eu

gpg: Signature made Tue 15 Oct 2024 03:15:35 PM UTC
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


