Return-Path: <linux-media+bounces-19476-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 201C399AEA8
	for <lists+linux-media@lfdr.de>; Sat, 12 Oct 2024 00:28:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D46C4286262
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 22:28:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3104A1A070E;
	Fri, 11 Oct 2024 22:28:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE651D1E8F
	for <linux-media@vger.kernel.org>; Fri, 11 Oct 2024 22:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728685688; cv=none; b=YYW7VEQobgGxdYNpCUbddVzZ1a2NMc+697R8Z1tS0GjhOUmyodBJx9o51WrkZy0pJt0rD2HrDDXqmCgh09r2rOycOjcE+FWnBghUNeC8N9YZpGWhdEueLCnsQv1E2yiaP7v1N0f+Rsvk/23p7HDPeD6MuHGtZqi3qEbT+JnGg4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728685688; c=relaxed/simple;
	bh=yGJYcxBIVV+fU7lP+wqlKzF0/F6QqYnXRQAknuSokZs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ACqeM3h54FWOHuqN/Btw41wA3ReVjzmV2ObPI+bQ8bvO0V3b5akIa65WfGWtANMnxmPzgRLeyBr4ab4mgOCR6QpNVrBJaC4UjADpd2XbpQTc/p42r+/NcPxpqQjE3a3Tzxger4ZB7RGdiB6/SwbDVXcPB4NZBYGezYztj1dbDms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1szO7A-0002zi-25;
	Fri, 11 Oct 2024 22:28:05 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
	by slave0 with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1szO79-006dBn-3B;
	Fri, 11 Oct 2024 22:28:04 +0000
From: Jenkins <jenkins@linuxtv.org>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@iki.fi>
Cc: builder@linuxtv.org
Subject: Re: [GIT PULL FOR 6.13] Mostly camera sensor patches (#104682)
Date: Fri, 11 Oct 2024 22:27:52 +0000
Message-Id: <20241011222752.1580602-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <ZwmL46t9qYvpXxe5@valkosipuli.retiisi.eu>
References: 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/ZwmL46t9qYvpXxe5@valkosipuli.retiisi.eu/
Build log: https://builder.linuxtv.org/job/patchwork/389685/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/ZwmL46t9qYvpXxe5@valkosipuli.retiisi.eu

gpg: Signature made Fri 11 Oct 2024 08:25:40 PM UTC
gpg:                using EDDSA key 5873A1DBBB1EBB81535A470C7A13323D00AE6FDB
gpg: Good signature from "Sakari Ailus <sakari.ailus@linux.intel.com>" [undefined]
gpg:                 aka "Sakari Ailus <sakari.ailus@iki.fi>" [marginal]
gpg: cannot open '/dev/tty': No such device or address


Build aborted due to a fatal error:
FAILED: patch patch patches/0042-media-atomisp-Replace-ternary-operator-with-if.patch doesn't apply:
Applying patch patches/0042-media-atomisp-Replace-ternary-operator-with-if.patch
patching file drivers/staging/media/atomisp/pci/sh_css_frac.h
Hunk #1 FAILED at 37.
Hunk #2 FAILED at 47.
2 out of 2 hunks FAILED -- rejects in file drivers/staging/media/atomisp/pci/sh_css_frac.h
Patch patches/0042-media-atomisp-Replace-ternary-operator-with-if.patch does not apply (enforce with -f)


