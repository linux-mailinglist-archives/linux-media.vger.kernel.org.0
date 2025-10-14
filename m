Return-Path: <linux-media+bounces-44375-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2C5BD8356
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 10:36:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 49EF44FA567
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 08:36:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E83730FC1F;
	Tue, 14 Oct 2025 08:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=unisoc.com header.i=@unisoc.com header.b="a4Y5H+f5"
X-Original-To: linux-media@vger.kernel.org
Received: from SHSQR01.spreadtrum.com (unknown [222.66.158.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0A230DEAC
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 08:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=222.66.158.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760430992; cv=none; b=AwkwYKIsWACKalNLh2478G0qZcHUo5EwP34TBRno+GcTtqrp/RvCog27T/62BIwqyRkDH8pHYYQss72RlVbPywG+j2EVF3IoHNaTarDNi87iJqqKtIUMqxdGDYAgzPGitr8ygvzePgRLuA55VLS9lMitmlZWP2Pc6kz3/O56Y6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760430992; c=relaxed/simple;
	bh=r8EO7w4EMwuG8IuGOQrNcrG0OyJU1PN0MzRw+k561y0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qEocppzkEY8q/EdgryRbi8G0dEMLWa8yeaiiuJ7GiwN5CgnaKhLSsJmzcTdbFbT78qBO7dnWcyJchdvswN+CnibzZctUeIoJMqPeIUek3IzhZweH7gqSti6EvG58zxrBea2x00S5JynsmAYtd3Fw9NO2OYckMRuV5e4Bl3y5x+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=unisoc.com; spf=pass smtp.mailfrom=unisoc.com; dkim=pass (2048-bit key) header.d=unisoc.com header.i=@unisoc.com header.b=a4Y5H+f5; arc=none smtp.client-ip=222.66.158.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=unisoc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=unisoc.com
Received: from SHSQR01.spreadtrum.com (localhost [127.0.0.2] (may be forged))
	by SHSQR01.spreadtrum.com with ESMTP id 59E8aQk5010166
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 16:36:26 +0800 (+08)
	(envelope-from zhaoyang.huang@unisoc.com)
Received: from dlp.unisoc.com ([10.29.3.86])
	by SHSQR01.spreadtrum.com with ESMTP id 59E8WfXa085643;
	Tue, 14 Oct 2025 16:32:41 +0800 (+08)
	(envelope-from zhaoyang.huang@unisoc.com)
Received: from SHDLP.spreadtrum.com (BJMBX01.spreadtrum.com [10.0.64.7])
	by dlp.unisoc.com (SkyGuard) with ESMTPS id 4cm6pz4wdzz2Nc5jJ;
	Tue, 14 Oct 2025 16:30:19 +0800 (CST)
Received: from bj03382pcu03.spreadtrum.com (10.0.73.40) by
 BJMBX01.spreadtrum.com (10.0.64.7) with Microsoft SMTP Server (TLS) id
 15.0.1497.48; Tue, 14 Oct 2025 16:32:38 +0800
From: "zhaoyang.huang" <zhaoyang.huang@unisoc.com>
To: Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand
	<david@redhat.com>,
        Matthew Wilcox <willy@infradead.org>,
        Mel Gorman
	<mgorman@techsingularity.net>,
        Vlastimil Babka <vbabka@suse.cz>,
        Sumit Semwal
	<sumit.semwal@linaro.org>,
        Benjamin Gaignard
	<benjamin.gaignard@collabora.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        John Stultz <jstultz@google.com>,
        "T . J . Mercier" <tjmercier@google.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>, <linux-mm@kvack.org>,
        <linux-kernel@vger.kernel.org>,
        Zhaoyang Huang <huangzhaoyang@gmail.com>, <steve.kang@unisoc.com>
Subject: [PATCH 0/2] optimization of dma-buf system_heap allocation
Date: Tue, 14 Oct 2025 16:32:28 +0800
Message-ID: <20251014083230.1181072-1-zhaoyang.huang@unisoc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX01.spreadtrum.com (10.0.64.7)
X-MAIL:SHSQR01.spreadtrum.com 59E8WfXa085643
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unisoc.com;
	s=default; t=1760430772;
	bh=jHNbOSkAKxEmrSis/ca++e1CL7eRGk9nY48IkitfWL0=;
	h=From:To:Subject:Date;
	b=a4Y5H+f5gs9OCSDBq5C514+UWWtOCiAX3I0FjR3BiI8uaOItTC9h6bTMGdI6XPKWK
	 2E8qo7NI4ZSakzlCNUAGhcF707/K58wB9x5Fiej2In1Ifa922vtKbABLHqsDPdBTlg
	 +0DIqOHIdVDGSfhGpP3dUfOeaZHVKbS9BtL35hz6J3bl9/x5v78poNS84MfTlQNFpN
	 Eg3/cRlrBHyUeqTgzkbNsfcRAsDhhVVnscxN0X1NjeaQeQsIbeYV9BS+bbIUf39WBa
	 MkPVD6C+zFUFIqHCavBPmuwvwEmKmMzuihbIrySnlHvoYNTSt2yuvRuPM0ysqYM2SP
	 rDY6UoMvEygsw==

From: Zhaoyang Huang <zhaoyang.huang@unisoc.com>

This series of patches would like to introduce alloc_pages_bulk_list in
dma-buf which need to call back the API for page allocation.

Zhaoyang Huang (2):
  mm: call back alloc_pages_bulk_list since it is useful
  driver: dma-buf: use alloc_pages_bulk_list for order-0 allocation

 drivers/dma-buf/heaps/system_heap.c | 33 +++++++++++++++---------
 include/linux/gfp.h                 |  9 +++++--
 mm/mempolicy.c                      | 14 +++++------
 mm/page_alloc.c                     | 39 ++++++++++++++++++++---------
 4 files changed, 62 insertions(+), 33 deletions(-)

-- 
2.25.1


